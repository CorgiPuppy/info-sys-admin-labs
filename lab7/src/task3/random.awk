#!/bin/awk

BEGIN {
	srand(seed)
	number = min + rand() * (max - min + 1.0)
	print number
}
