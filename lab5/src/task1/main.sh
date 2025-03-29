#!/bin/bash

declare TARGET_DIR=/etc
declare USER=root

set -v
find $TARGET_DIR -type f -user $USER 2> >(grep -v 'Permission denied$' 1>&2) -exec ls -l {} + | head -n 1 <(sort -nr -k5) | awk '{print $9, $5}'

declare longest_file=$(find $TARGET_DIR -type f -user $USER 2> >(grep -v 'Permission denied$' 1>&2) -exec bash -c 'echo "$(basename "{}" | wc -c) {}"' \; | sort -nr | head -n 1 | cut -d' ' -f2-)
stat -c "%s %n" "$longest_file"
