//resets log window
print("\\Clear");

//get the current time (ms)
iStartTime = getTime();

//get the current date and time
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);

//print the date and time
print("The date is: "+dayOfMonth+"/"+(month+1)+"/"+year);
print("The time is: "+hour+":"+minute+":"+second);

//get the current time (ms)
iEndTime = getTime();
print((iEndTime-iStartTime)/1000+" seconds runtime");

	
