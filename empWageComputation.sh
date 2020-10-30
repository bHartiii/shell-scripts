#!/bin/bash 
FULL_TIME=8
PART_TIME=4
wage_per_hour=20
MAX_DAYS=20
MAX_HOURS=100
getWorkDonePerDay(){

        case $((RANDOM%2)) in
                0) workDonePerDay=$PART_TIME;;
                1) workDonePerDay=$FULL_TIME;;
                *) worDonePerDay=0;;
        esac
        echo $workDonePerDay;
}
getAttendance(){
	case $((RANDOM%2)) in
		0) day=1;;
		1) day=0;;
	esac
	echo $day 
}
while [[ $count -lt $MAX_DAYS && $totalHours -lt $MAX_HOURS  ]]
do
	workDonePerDay=$( getWorkDonePerDay $((RANDOM%2)) );
	attendance=$(getAttendance $((RANDOM%2)) );
	tempHours=$((attendance*workDonePerDay));
	totalHours=$((tempHours+totalHours))
	tempWage=$((tempHours*wage_per_hour));
	totalWage=$((totalWage+tempWage));
	totalWorkingDays=$((totalWorkingDays+attendance));
	((count++))
done
echo "Total Working Days = "$totalWorkingDays
echo "total Hours = "$totalHours
echo "Total monthly wage = "$totalWage
