# Benchmark Setup & Execution Guide

This document describes the benchmark test scenarios and how to execute them to collect performance data.

## Test Scenarios

The following four benchmark scenarios cover the coverage + concurrency matrix from the April 12, 2026 benchmarking session:

### 1. **Baseline Sequential** (`bench-baseline-seq`)
- **Configuration**: Per-file isolates, sequential execution, with coverage
- **Expected**: ~15m 21s (921s) on GitHub Actions Ubuntu
- **Purpose**: Measure baseline performance without optimizations
- **Run**: [Trigger Workflow](#triggering-workflows)

### 2. **Baseline + Concurrent** (`bench-baseline-concurrent`)
- **Configuration**: Per-file isolates, parallel (j=4), with coverage
- **Expected**: ~8m 39s (519s) on GitHub Actions Ubuntu
- **Delta**: -402s (43.6% faster than baseline)
- **Purpose**: Measure concurrency improvement alone

### 3. **Test Bundler Sequential** (`bench-bundler-seq`)
- **Configuration**: Single wrapper per package, sequential execution, with coverage
- **Expected**: ~8m 08s (488s) on GitHub Actions Ubuntu
- **Delta**: -433s (47.0% faster than baseline)
- **Purpose**: Measure test bundler improvement alone

### 4. **Test Bundler + Concurrent** (`bench-bundler-concurrent`)
- **Configuration**: Single wrapper per package, parallel (j=4), with coverage
- **Expected**: ~2m 48s (168s) on GitHub Actions Ubuntu
- **Delta**: -753s (81.7% faster than baseline)
- **Purpose**: Measure combined optimizations (super-additive effect)

## Branches

Test branches have been created for each scenario:

```
origin/bench-baseline-seq
origin/bench-baseline-concurrent
origin/bench-bundler-seq
origin/bench-bundler-concurrent
```

Each branch contains a marker file in `.benchmark/` to help identify the scenario.

## Triggering Workflows

### Method 1: Via GitHub UI (Recommended for Manual Testing)

1. Navigate to: https://github.com/Rahiche/flutter_ci_talk/actions/workflows/benchmark_dispatch.yml

2. Click **"Run workflow"** button

3. Select the desired branch from the dropdown (e.g., `bench-baseline-seq`)

4. Enter the workflow inputs:
   - **benchmark_stage**: The stage label (e.g., "Baseline Sequential")
   - **benchmark_command**: The command to run (e.g., `flutter test --coverage`)

5. Click **"Run workflow"**

### Method 2: Via GitHub CLI

```bash
gh workflow run benchmark_dispatch.yml \
  --repo Rahiche/flutter_ci_talk \
  --ref bench-baseline-seq \
  -f benchmark_stage="Baseline Sequential" \
  -f benchmark_command="flutter test --coverage"
```

**Note**: This requires elevated permissions on your GitHub token (workflow dispatch scope).

### Method 3: Via benchmark-runner.sh Script

```bash
# Show what would be dispatched (dry run)
./benchmark-runner.sh --dry-run

# Actually dispatch all scenarios
./benchmark-runner.sh
```

The script will:
- Create all test branches
- Dispatch the benchmark workflow for each scenario
- Provide links to monitor progress

## Monitoring Runs

### List Recent Runs

```bash
gh run list --repo Rahiche/flutter_ci_talk --workflow benchmark_dispatch.yml --limit 20
```

### Watch a Specific Run

```bash
gh run watch <RUN_ID> --repo Rahiche/flutter_ci_talk
```

### View Run Logs

```bash
gh run view <RUN_ID> --log --repo Rahiche/flutter_ci_talk
```

### Dashboard

Open the GitHub Actions dashboard:
https://github.com/Rahiche/flutter_ci_talk/actions/workflows/benchmark_dispatch.yml

## Collecting Results

After each run completes:

1. **Get Run Details**:
   ```bash
   gh run view <RUN_ID> \
     --repo Rahiche/flutter_ci_talk \
     --json name,conclusion,durationMinutes,headBranch
   ```

2. **Extract Timing Data**: Check the workflow logs for:
   - Job start time
   - Job end time
   - Wall-clock duration (shown in GitHub UI)
   - Any errors or warnings

3. **Document Results**: Update BENCHMARKS.md with:
   - Scenario name
   - Branch used
   - GitHub Actions run ID
   - Duration in minutes:seconds
   - Date/time of run
   - Any relevant notes

## Expected Workflow Outputs

Each benchmark run will produce:

- **Console output**: Shows stage label and command executed
- **Job duration**: Wall-clock time from job start to finish
- **Logs**: Available in the "Run benchmark command" step

## Troubleshooting

### Workflow Not Triggering

1. Verify the branch exists on remote:
   ```bash
   git branch -r | grep bench-
   ```

2. Verify workflow file is on main:
   ```bash
   git show main:.github/workflows/benchmark_dispatch.yml
   ```

3. Ensure the GitHub token has `workflow` dispatch scope:
   ```bash
   gh auth status -h
   ```

### Intermittent Failures

- Network connectivity can affect workflow dispatch
- GitHub API rate limits may apply
- Try again after a brief delay

### High Variance in Results

- GitHub Actions resource contention varies
- Multiple runs per scenario improve reliability
- Run at consistent times if possible (avoid peak periods)

## Data Analysis

After collecting results from all four scenarios:

1. **Compare wall-clock times**: Which combinations perform best?
2. **Calculate deltas**: How much improvement vs. baseline?
3. **Measure interaction effects**: Are combined optimizations super-additive?
4. **Identify bottlenecks**: Where does time go in each scenario?

## Next Steps

- [ ] Trigger all four benchmark scenarios
- [ ] Monitor runs until completion
- [ ] Collect timing data from each run
- [ ] Update BENCHMARKS.md with new data
- [ ] Analyze interaction effects
- [ ] Document findings in talk slides
