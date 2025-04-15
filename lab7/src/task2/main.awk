#!/bin/awk

{ 
	if ($3<zero) {
		$3=number
	}
	print
}
