#!/bin/bash

set -v
cal | head -n 4

scrot 'task1.png' -e 'mv $f ./assets/';
