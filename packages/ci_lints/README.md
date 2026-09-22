# ci_lints

A `custom_lint` plugin with one rule: **`no_raw_text`** flags user-facing
strings that never went through localization.

```
packages/app/lib/src/widgets/checkout_panel.dart:18:20
  • User-facing string 'Order summary' is hardcoded. • no_raw_text • WARNING
```

It ships a quick fix, so `dart run custom_lint --fix` rewrites the literal into
a `context.l10n.<key>` lookup and drops the `const` that no longer holds.

## Install

Not on pub.dev yet - depend on it by git or by path:

```yaml
dev_dependencies:
  custom_lint: ^0.8.0
  ci_lints:
    git:
      url: https://github.com/Rahiche/flutter_ci_talk.git
      path: packages/ci_lints
```

```yaml
# analysis_options.yaml
analyzer:
  plugins:
    - custom_lint
```

Then `dart run custom_lint` locally, in your IDE, and in CI.

### If you use a pub workspace

`custom_lint` only treats a directory as an analysis root when that directory
owns a `.dart_tool/package_config.json`. Under `resolution: workspace` only the
workspace root has one, so a per-package `analysis_options.yaml` is never read
and the run finishes in half a second reporting nothing.

Put the plugin block and the dev dependencies in the **root** `pubspec.yaml`
and the **root** `analysis_options.yaml`, and run `dart run custom_lint` from
the root. One run then covers every member.

## What it flags

| | |
|---|---|
| `Text('Order summary')` | first positional argument of `Text` / `SelectableText` |
| `Text('Total: $total')` | interpolation - it hardcodes word order too, which is the first thing that breaks in another language |
| `hintText: 'Discount code'` | a parameter whose name alone proves a human reads it: `hintText`, `labelText`, `helperText`, `errorText`, `counterText`, `prefixText`, `suffixText`, `placeholder`, `tooltip`, `semanticLabel`, `semanticsLabel` |
| `AppBar(title: 'Cart')` | `title`, `subtitle`, `label`, `message` - but only when the enclosing type resolves to a `Widget`, so a log event's `message:` stays quiet |

## What it deliberately ignores

A rule that shouts about non-problems gets switched off, so `no_raw_text` stays
quiet on:

- anything without two consecutive letters - `' - '`, `'12'`, `r'$'`, `'%'`
- asset paths, routes and URLs - `'assets/empty.png'`, `'/checkout'`
- single-token keys - `'checkout_total'`, `'icon.png'`
- `debugPrint`, `throw`, and any call whose target is not a Widget
- files under `test/`, `integration_test/` and `lib/**/l10n/`, and
  `*.g.dart` / `*.freezed.dart`

Interpolations are reported but get **no** quick fix on purpose: they need a
placeholder in the `.arb` entry, and guessing that would produce a plausible
wrong translation rather than an obvious error.

## Suppressing

```dart
// ignore: no_raw_text
const Text('DEBUG BUILD');
```

## Running it in CI

```yaml
- run: dart pub get
- run: dart run custom_lint
```

`custom_lint` exits non-zero on warnings, so the job fails the PR.

## The rule is ~180 lines

[`lib/src/no_raw_text.dart`](lib/src/no_raw_text.dart) is the whole thing -
worth reading before you write your own. The shape is always the same: pick
the AST nodes you care about in `run`, ask the element model whether the node
is really the thing you think it is, and be far more careful about what you
*don't* report than about what you do.
