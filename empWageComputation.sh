#!/bin/bash -x
FULL_TIME=8
PART_TIME=4
wage_per_hour=20
dailyWage=0
getDailyWage(){
	dailyWage=$((FULL_TIME*wage_per_hour))
	echo "Employee's daily wage is - "$dailyWage
}

attendance=$((RANDOM%2))
if [ $attendance -eq 0 ]
then
	echo "Employee is absent."
else 
	getDailyWage
fi
