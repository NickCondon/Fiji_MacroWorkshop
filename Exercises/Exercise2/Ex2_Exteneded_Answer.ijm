//resets log window
print("\\Clear");

//get the current time (ms)
iStartTime = getTime();

//get the current date and time
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);

//print the date and time
print("The date is: "+pad(dayOfMonth)+"/"+pad((month+1))+"/"+year);
print("The time is: "+pad(hour)+":"+pad(minute)+":"+pad(second));

//get the current time (ms)
iEndTime = getTime();
print((iEndTime-iStartTime)/1000+" seconds runtime");

//function to add 0 prefix to single integer values
	function pad(n) {
	n = toString(n);
	if (lengthOf(n)==1) n = "0"+n;
	return n;
	}
