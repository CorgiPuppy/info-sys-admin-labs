#!/bin/bash

declare FILE=
declare SEARCH_REGEX_BEGIN_DIV="<div>"
declare REPLACEMENT="<p>"
declare SEARCH_REGEX_END_DIV="</div>"

echo "sed -i "s/$SEARCH_REGEX_BEGIN_DIV/$REPLACEMENT/g" $FILE" 
sed -i "s/$SEARCH_REGEX_BEGIN_DIV/$REPLACEMENT/g" $FILE

echo "sed -i "s/$SEARCH_REGEX_END_DIV//g" $FILE" 
sed -i "s/$SEARCH_REGEX_END_DIV//g" $FILE
