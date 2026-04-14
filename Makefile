.PHONY: generate bootstrap test-all test-parallel test-bundled arch-guard clean demo-slow demo-fast apply-fix benchmark

generate:
	dart run tool/generate_project.dart

bootstrap:
	melos bootstrap

test-all:
	sh/run_sequential.sh

test-parallel:
	sh/check-ci.sh

test-bundled:
	dart run tool/generate_test_wrapper.dart
	sh/check-ci.sh

arch-guard:
	sh/arch_guard.sh

clean:
	melos exec -- flutter clean
	find packages -name 'all_tests.dart' -delete
	find packages -name 'all_tests_shard_*.dart' -delete
	find packages -name 'coverage' -type d -exec rm -rf {} + 2>/dev/null || true

demo-slow:
	@echo "=== SLOW DEMO (main branch baseline) ==="
	sh/run_sequential.sh

demo-fast:
	@echo "=== FAST DEMO (all optimizations) ==="
	dart run tool/generate_test_wrapper.dart
	sh/check-ci.sh

apply-fix:
	@test -n "$(FIX)" || (echo "Usage: make apply-fix FIX=act2_fix_async" && exit 1)
	sh/apply_fix.sh $(FIX)

benchmark:
	@echo "Benchmarking current branch..."
	@BRANCH=$$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown"); \
	START=$$(date +%s); \
	sh/run_sequential.sh; \
	END=$$(date +%s); \
	ELAPSED=$$((END - START)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo "Branch: $$BRANCH — $${MINS}m $${SECS}s"
