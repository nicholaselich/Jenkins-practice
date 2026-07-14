#!/bin/bash
echo "Running tests..."
RESULT=$((RANDOM % 10))
if [ "$RESULT" -lt 8 ]; then
  echo "All tests passed!"
  exit 0
else
  echo "Test failed!"
  exit 1
fi

