/// The slow-test scanner, as a library.
///
/// `run(args)` is the same entry point the `find-slow-tests` executable uses,
/// so a repo can wire it into its own `tool/` script instead of installing it.
library;

export 'src/slow_tests.dart' show Finding, Origin, Severity, scan;
export 'src/slow_tests_cli.dart' show run;
