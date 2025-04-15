#!/bin/awk

NR>=1 {
	switch ($2) {
		case "+":
			answer = $1 + $3 
			print $1, $2, $3, "=", answer
			break
		case "*":
			answer = $1 * $3 
			print $1, $2, $3, "=", answer
			break
		case "/":
			answer = $1 / $3 
			print $1, $2, $3, "=", answer
			break
		case "-":
			answer = $1 - $3 
			print $1, $2, $3, "=", answer
			break
		default:
			break
	}
}
