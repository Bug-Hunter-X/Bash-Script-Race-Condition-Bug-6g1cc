#!/bin/bash

# This script demonstrates a race condition bug.

count=0

function increment_count() {
  local new_count=$((count + 1))
  count=$new_count
}

# Create two processes that increment the counter concurrently
for i in {1..2}; do
  increment_count &
  wait
  # This ensures that both increment_count functions will finish before accessing the counter again
  # But the counter value will not be correctly incremented to 2
  sleep 0.1
done

echo "Final count: $count"