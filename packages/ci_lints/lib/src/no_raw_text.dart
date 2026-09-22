import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Named parameters whose name alone is proof the string is shown to a user.
///
/// These are specific enough that no other check is needed - nothing calls
/// something `hintText` unless a human is going to read it. That matters
/// because the classes holding them are often not Widgets themselves
/// (`InputDecoration`, `SnackBarAction`, `PopupMenuItem`'s content, ...).
const _alwaysUserFacing = <String>{
  'counterText',
  'errorText',
  'helperText',
  'hintText',
  'labelText',
  'placeholder',
  'prefixText',
  'semanticLabel',
  'semanticsLabel',
  'suffixText',
  'tooltip',
};

/// Parameters that are user-facing only in a Widget.
///
/// `title` is user-facing on an `AppBar` and meaningless on a log event, so
/// these are checked against the element model before reporting.
const _userFacingInWidgets = <String>{'label', 'message', 'subtitle', 'title'};

/// Widgets whose first positional argument is displayed text.
const _textWidgets = <String>{'Text', 'SelectableText'};

/// Flags string literals that reach the screen without going through l10n.
///
/// The rule is deliberately narrow: it only fires on a literal that the
/// analyzer can prove is being handed to a Widget as user-visible text. A
/// literal that is a key, an asset path, a log line or a test fixture is not
/// a translation bug, and a rule that shouts about those gets turned off.
class NoRawText extends DartLintRule {
  const NoRawText() : super(code: _code);

  static const _code = LintCode(
    name: 'no_raw_text',
    problemMessage: "User-facing string '{0}' is hardcoded.",
    correctionMessage: 'Move it to an .arb file and read it from context.l10n.',
    errorSeverity: DiagnosticSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    if (_isExemptFile(resolver.path)) return;

    context.registry.addSimpleStringLiteral((node) {
      if (!_isTranslatable(node.value)) return;
      if (!_isUserFacing(node)) return;
      reporter.atNode(node, _code, arguments: [_preview(node.value)]);
    });

    // 'Hello $name' is raw text too, and the worse kind: it also bakes in
    // word order, which is the first thing that breaks in another language.
    context.registry.addStringInterpolation((node) {
      final shape = node.elements
          .map((e) => e is InterpolationString ? e.value : '{}')
          .join();
      if (!_isTranslatable(shape.replaceAll('{}', ''))) return;
      if (!_isUserFacing(node)) return;
      reporter.atNode(node, _code, arguments: [_preview(shape)]);
    });
  }

  @override
  List<Fix> getFixes() => [_MoveToL10n()];
}

/// Generated and test code is allowed to hold raw strings.
bool _isExemptFile(String path) =>
    path.contains('/test/') ||
    path.contains('/integration_test/') ||
    path.contains('/l10n/') ||
    path.endsWith('.g.dart') ||
    path.endsWith('.freezed.dart');

/// Whether this text is something a translator could act on.
///
/// Anything without two consecutive letters is punctuation, a number, a
/// separator or an icon - there is nothing to translate.
bool _isTranslatable(String value) {
  final text = value.trim();
  if (text.length < 2) return false;
  if (!RegExp(r'[A-Za-z]{2}').hasMatch(text)) return false;
  // Asset paths, routes, URLs, MIME types, and snake_case / dotted keys.
  if (text.startsWith('assets/') || text.startsWith('/')) return false;
  if (text.contains('://')) return false;
  if (!text.contains(' ') && RegExp(r'^[a-z0-9_.\-]+$').hasMatch(text)) {
    return false;
  }
  return true;
}

/// Walks one step out of the literal and asks the element model whether the
/// value lands on a Widget parameter that is shown to a user.
bool _isUserFacing(Expression node) {
  final parent = node.parent;

  final named = parent is NamedExpression ? parent : null;
  final args = named?.parent ?? parent;
  if (args is! ArgumentList) return false;

  if (named != null && _alwaysUserFacing.contains(named.name.label.name)) {
    return true;
  }

  final target = args.parent;
  final type = switch (target) {
    InstanceCreationExpression() => target.staticType,
    MethodInvocation() => target.staticType,
    _ => null,
  };
  if (!_isWidget(type)) return false;

  if (named != null)
    return _userFacingInWidgets.contains(named.name.label.name);

  // Positional: only the first argument of a text widget counts, so
  // Text('Hi', key: ..., semanticsLabel: ...) reports once, on the text.
  final typeName = type?.element?.name;
  if (!_textWidgets.contains(typeName)) return false;
  return args.arguments.isNotEmpty && identical(args.arguments.first, node);
}

bool _isWidget(DartType? type) {
  if (type is! InterfaceType) return false;
  if (type.element.name == 'Widget') return true;
  return type.allSupertypes.any((t) => t.element.name == 'Widget');
}

String _preview(String value) {
  final text = value.trim().replaceAll(RegExp(r'\s+'), ' ');
  return text.length <= 32 ? text : '${text.substring(0, 31)}…';
}

/// Rewrites the literal into a `context.l10n.<key>` lookup and leaves the
/// developer to add the entry - the fix removes the typing, not the thinking.
class _MoveToL10n extends DartFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    // AnalysisError is renamed to Diagnostic in analyzer 9; custom_lint
    // still declares the old name, so this signature has to match it.
    // ignore: deprecated_member_use
    AnalysisError analysisError,
    // ignore: deprecated_member_use
    List<AnalysisError> others,
  ) {
    context.registry.addSimpleStringLiteral((node) {
      if (!analysisError.sourceRange.covers(node.sourceRange)) return;
      final key = _keyFor(node.value);
      final constKeyword = _enclosingConstKeyword(node);
      reporter
          .createChangeBuilder(
            message: 'Replace with context.l10n.$key',
            priority: 80,
          )
          .addDartFileEdit((builder) {
            builder.addSimpleReplacement(node.sourceRange, 'context.l10n.$key');
            // A lookup is not a constant, so the `const` that used to cover
            // this literal has to go or the fix leaves the file broken.
            if (constKeyword != null) {
              builder.addDeletion(
                SourceRange(constKeyword.offset, constKeyword.length + 1),
              );
            }
          });
    });
  }
}

/// The outermost `const` that would still cover [node] after the rewrite.
///
/// `const Column(children: [Text('Hi')])` needs the `const` on Column
/// removed, not one on the Text, so this keeps walking to the top.
Token? _enclosingConstKeyword(AstNode node) {
  Token? found;
  for (AstNode? n = node; n != null; n = n.parent) {
    final keyword = switch (n) {
      InstanceCreationExpression() => n.keyword,
      ListLiteral() => n.constKeyword,
      SetOrMapLiteral() => n.constKeyword,
      RecordLiteral() => n.constKeyword,
      VariableDeclarationList() => n.keyword,
      _ => null,
    };
    if (keyword != null && keyword.keyword == Keyword.CONST) found = keyword;
  }
  return found;
}

/// 'Add to cart' -> addToCart
String _keyFor(String value) {
  final words = value
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9 ]'), ' ')
      .split(' ')
      .where((w) => w.isNotEmpty)
      .take(4)
      .toList();
  if (words.isEmpty) return 'todo';
  return words.first +
      words.skip(1).map((w) => w[0].toUpperCase() + w.substring(1)).join();
}
