#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

count=0
lock_file="/tmp/count.lock"

function increment_count() {
  # Acquire lock
  flock -n "$lock_file" || exit 1

  local new_count=$((count + 1))
  count=$new_count
  echo "$new_count" > "$lock_file"

  # Release lock
  flock -u "$lock_file"
}

# Create two processes that increment the counter concurrently
for i in {1..2}; do
  increment_count &
  #wait # Removed wait to allow parallel execution
done

wait  # Wait for all background processes to finish

# Check if the counter is properly incremented
echo "Final count: $count"