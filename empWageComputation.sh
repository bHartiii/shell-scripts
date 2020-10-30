#!/bin/bash -x
FULL_TIME=8
PART_TIME=4
wage_per_hour=20
dailyWage=0
getWorkDonePerDay(){

        case $((RANDOM%2)) in
                0) workDonePerDay=$PART_TIME;;
                1) workDonePerDay=$FULL_TIME;;
                *) worDonePerDay=0;;
        esac
        echo $workDonePerDay;
}
workDonePerDay=$( getWorkDonePerDay $((RANDOM%2)) );
getDailyWage(){
	dailyWage=$((workDonePerDay*wage_per_hour))
	echo "Employee's daily wage is - "$dailyWage
}

attendance=$((RANDOM%2))
if [ $attendance -eq 0 ]
then
	echo "Employee is absent."
else 
	getDailyWage
fi
