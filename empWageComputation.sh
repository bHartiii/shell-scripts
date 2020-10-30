#!/bin/bash 
FULL_TIME=8
PART_TIME=4
wage_per_hour=20
MAX_DAYS=20
MAX_HOURS=100
count=1
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
getTotalHour(){
	while [[ $count -le $MAX_DAYS && $totalHours -le $MAX_HOURS  ]]
	do
		workDonePerDay=$( getWorkDonePerDay $((RANDOM%2)) );
		attendance=$(getAttendance $((RANDOM%2)) );
		tempHours=$((attendance*workDonePerDay));
		totalHours=$((tempHours+totalHours))
		((count++))
	done
	echo $totalHours
}
totalWorkingHours=$( getTotalHour )
totalWage=$(( totalWorkingHours*wage_per_hour ));
echo "total Hours = "$totalWorkingHours
echo "Total monthly wage = "$totalWage
