#!/bin/bash

declare TARGET_DIR=/etc
declare USER=root

set -x
find $TARGET_DIR -type f -user $USER -exec ls -l {} + | sort -nr -k5 | head -n 1 | awk '{print $9, $5}'
