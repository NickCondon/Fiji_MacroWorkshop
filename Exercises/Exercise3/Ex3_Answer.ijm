//resets log window
print("\\Clear");

//FOR LOOP, starting at base 0, note less than nSlices
for (i = 0; i < nSlices; i++) {
	//printed defined string + calculated loop integer (for base 0)
	print("The Current Slice Number is: "+(i+1));	
	}

//FOR LOOP, starting at base 1, note less than equal to nSlices	
for (i = 1; i <= nSlices; i++) {
	//printed defined string + loop integer
	print("The Current Slice Number is: "+i);	
	}
	
	
//BONUS ANSWER
//reverse Loop starts high, ends at 0; subtracts each iteration
for (i=nImages; i>0; i--){
	close();
	print("Number of windows left open = "+ i);
	}
print("All windows closed");
