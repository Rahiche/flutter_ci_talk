#!/usr/bin/env python3
"""
Benchmark Results Collector - Monitor and collect GitHub Actions benchmark runs.

Usage:
    python3 collect_benchmarks.py                 # Show recent runs
    python3 collect_benchmarks.py --watch RUN_ID  # Watch a specific run
    python3 collect_benchmarks.py --collect       # Collect all new results
"""

import json
import subprocess
import sys
import time
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional

REPO = "Rahiche/flutter_ci_talk"
WORKFLOW = "benchmark_dispatch.yml"

# Scenario metadata
SCENARIOS = {
    "Baseline Sequential": {
        "branch": "bench-baseline-seq",
        "expected_duration_s": 921,
        "description": "Per-file isolates, sequential",
    },
    "Baseline + Concurrent": {
        "branch": "bench-baseline-concurrent",
        "expected_duration_s": 519,
        "description": "Per-file isolates, parallel (j=4)",
    },
    "Test Bundler Sequential": {
        "branch": "bench-bundler-seq",
        "expected_duration_s": 488,
        "description": "Single wrapper per package, sequential",
    },
    "Test Bundler + Concurrent": {
        "branch": "bench-bundler-concurrent",
        "expected_duration_s": 168,
        "description": "Single wrapper per package, parallel (j=4)",
    },
}


def run_gh_command(args: List[str]) -> str:
    """Execute a gh CLI command and return the output."""
    try:
        result = subprocess.run(
            ["gh"] + args,
            capture_output=True,
            text=True,
            check=True,
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Error running command: {e.stderr}")
        sys.exit(1)


def get_recent_runs(limit: int = 20) -> List[Dict]:
    """Get recent benchmark runs."""
    cmd = [
        "run",
        "list",
        "--repo",
        REPO,
        "--workflow",
        WORKFLOW,
        "--limit",
        str(limit),
        "--json",
        "number,name,status,headBranch,createdAt,updatedAt,conclusion",
    ]

    output = run_gh_command(cmd)
    if not output:
        return []

    return json.loads(output)


def get_run_logs(run_id: str) -> str:
    """Get logs from a specific run."""
    cmd = [
        "run",
        "view",
        run_id,
        "--repo",
        REPO,
        "--log",
    ]
    return run_gh_command(cmd)


def format_duration(minutes: Optional[float]) -> str:
    """Format duration in minutes to a readable string."""
    if minutes is None:
        return "—"
    total_seconds = int(minutes * 60)
    mins = total_seconds // 60
    secs = total_seconds % 60
    return f"{mins}m {secs:02d}s"


def print_runs_table(runs: List[Dict]) -> None:
    """Print runs in a formatted table."""
    if not runs:
        print("No runs found.")
        return

    print("\n" + "=" * 100)
    print("RECENT BENCHMARK RUNS")
    print("=" * 100)

    # Header
    print(f"{'ID':<8} {'Status':<12} {'Stage':<30} {'Branch':<30} {'Created':<20}")
    print("-" * 100)

    # Rows
    for run in runs:
        run_id = str(run["number"])
        status = run["status"]
        if run["conclusion"]:
            status = f"{status}:{run['conclusion']}"
        name = run["name"][:28]
        branch = run.get("headBranch", "?")[:28]
        created = run["createdAt"][:19] if "T" in run["createdAt"] else run["createdAt"]

        # Color code status
        if "completed" in status.lower() and "success" in status.lower():
            status = f"✓ {status}"
        elif "in_progress" in status.lower():
            status = f"⟳ {status}"
        elif "failed" in status.lower():
            status = f"✗ {status}"

        print(f"{run_id:<8} {status:<12} {name:<30} {branch:<30} {created:<20}")

    print("=" * 100 + "\n")


def extract_benchmark_data(logs: str) -> Optional[Dict]:
    """Extract benchmark data from run logs."""
    data = {
        "stage": None,
        "command": None,
        "success": False,
    }

    for line in logs.split("\n"):
        if "Stage:" in line:
            data["stage"] = line.split("Stage:")[-1].strip()
        elif "Command:" in line:
            data["command"] = line.split("Command:")[-1].strip()
        elif "exit code 0" in line or "completed successfully" in line.lower():
            data["success"] = True

    return data


def watch_run(run_id: str) -> None:
    """Watch a specific run until completion."""
    print(f"\n📊 Watching run {run_id}...")
    print("Press Ctrl+C to stop watching\n")

    last_status = None
    checks = 0

    try:
        while True:
            cmd = [
                "run",
                "view",
                run_id,
                "--repo",
                REPO,
                "--json",
                "status,conclusion,name,headBranch",
            ]

            output = run_gh_command(cmd)
            run_data = json.loads(output)

            status = run_data.get("status", "unknown")
            conclusion = run_data.get("conclusion")

            if status != last_status:
                timestamp = datetime.now().strftime("%H:%M:%S")
                print(f"[{timestamp}] Status: {status}")
                if conclusion:
                    print(f"            Conclusion: {conclusion}")
                last_status = status

            if status != "in_progress" or conclusion:
                print(f"\n✓ Run {run_id} completed!")
                print(f"  Result: {conclusion}")
                print(f"  Stage: {run_data.get('name')}")
                print(f"  Branch: {run_data.get('headBranch')}")
                break

            # Check again after 10 seconds
            time.sleep(10)
            checks += 1

    except KeyboardInterrupt:
        print(f"\n⏸  Stopped watching run {run_id}")


def collect_new_results() -> None:
    """Collect and compile results from recent runs."""
    print("\n📈 Collecting benchmark results...\n")

    runs = get_recent_runs(limit=50)

    # Group by scenario
    results_by_scenario = {}
    for scenario_name in SCENARIOS.keys():
        results_by_scenario[scenario_name] = []

    for run in runs:
        if run["status"] != "completed" or run.get("conclusion") != "success":
            continue

        stage = run["name"]
        for scenario_name, metadata in SCENARIOS.items():
            if scenario_name.lower() in stage.lower():
                results_by_scenario[scenario_name].append(
                    {
                        "run_id": run["number"],
                        "branch": run.get("headBranch"),
                        "created": run.get("createdAt"),
                    }
                )

    # Print summary
    print("=" * 80)
    print("BENCHMARK RESULTS SUMMARY")
    print("=" * 80)

    for scenario_name, metadata in SCENARIOS.items():
        results = results_by_scenario[scenario_name]
        print(f"\n{scenario_name}")
        print(f"  Expected: {format_duration(metadata['expected_duration_s'] / 60)}")
        print(f"  Description: {metadata['description']}")

        if results:
            print(f"  ✓ Found {len(results)} run(s):")
            for result in results[-3:]:  # Show last 3 runs
                run_id = result["run_id"]
                created = result["created"][:10] if result["created"] else "?"
                print(f"    - Run #{run_id} ({created})")
        else:
            print("  No completed runs found")

    print("\n" + "=" * 80)


def main():
    """Main entry point."""
    if len(sys.argv) < 2:
        # Show recent runs
        runs = get_recent_runs(limit=20)
        print_runs_table(runs)
        return

    command = sys.argv[1]

    if command == "--watch" and len(sys.argv) > 2:
        run_id = sys.argv[2]
        watch_run(run_id)
    elif command == "--collect":
        collect_new_results()
    else:
        print(f"Unknown command: {command}")
        print(__doc__)


if __name__ == "__main__":
    main()
