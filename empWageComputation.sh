#!/bin/bash -x
attendance=$((RANDOM%2))
if [ $attendance -eq 0 ]
then
	echo "Employee is absent."
else 
	echo "Employee is present."
fi
