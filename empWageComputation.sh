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
getDailyHours(){
	workDonePerDay=$( getWorkDonePerDay $((RANDOM%2)) );
        attendance=$(getAttendance $((RANDOM%2)) );
        tempHours=$((attendance*workDonePerDay));
        ((count++))
        echo $tempHours
}

getDailyWagesOrTotalHour(){
	while [[ $count -le $MAX_DAYS && $totalHours -le $MAX_HOURS  ]]
	do
		tempHours=$(getDailyHours);
		tempWage=$((tempHours*wage_per_hour))
		dailyWageArray[((index++))]=$tempWage
		totalHours=$((tempHours+totalHours))
		((count++))
	done
		echo ${dailyWageArray[@]}"/"$totalHours
}

totalHours_DailyWages=$( getDailyWagesOrTotalHour )
totalWorkingHours=`echo $totalHours_DailyWages|awk -F / '{print $2}'`
dailyWages[((index++))]=`echo $totalHours_DailyWages|awk -F / '{print $1}'`
totalWage=$(( $totalWorkingHours*wage_per_hour ));

echo "Daily Wages : "${dailyWages[@]}
echo "total Hours = "$totalWorkingHours
echo "Total monthly wage = "$totalWage
