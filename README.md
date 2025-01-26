# Bash Script Race Condition Bug

This repository demonstrates a common race condition bug in bash scripts. The script uses a simple counter that is incremented by two concurrent processes. Due to the lack of synchronization, the final count may be less than expected. The solution demonstrates the use of a mutex (using a lock file) to prevent this race condition.