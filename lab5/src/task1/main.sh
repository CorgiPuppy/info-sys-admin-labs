#!/bin/bash

declare TARGET_DIR=/etc
declare USER=root

set -v
find $TARGET_DIR -type f -user $USER 2> >(grep -v 'Permission denied$' 1>&2) -exec ls -l {} + | sort -nr -k5 | head -n 1 | awk '{print $9, $5}'
