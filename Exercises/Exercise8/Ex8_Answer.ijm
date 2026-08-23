// * * * * * * * Section 01 - Getting Started * * * * * * * * * * * * * *				
print("\\Clear");																		//Ensures the Log window is clear
run("Clear Results");																	//Ensures the Results table is clear
roiManager("reset");																	//Ensures the ROI Manager is clear
while(nImages>0){close();}																//Closes all open windows

path = getDirectory("Choose Source Directory ");										//Defines input folder location with the variable path
list = getFileList(path);																//Creates a list of all files within input folder

ext = ".tif"; 																			//Defines a variable for the file exension
run("Set Measurements...", "area mean standard min median display redirect=None decimal=3");	//Defines what measurements to use
getDateAndTime(year, month, week, day, hour, min, sec, msec);							//Defines Date & Time variables
print("Script Run Date: "+day+"/"+(month+1)+"/"+year+"  Time: " +hour+":"+min+":"+sec);	//Prints the script run date
print("");																				//Prints a blank line


// * * * * * * * Section 02 - Creating Outputs * * * * * * * * * * * * * *				
resultsDir = path+"Results"+year+"-"+(month+1)+"-"+day+"__"+hour+"."+min+"."+sec+"/";	//Defines an output directory path
File.makeDirectory(resultsDir);															//Creates the output directory
summaryFile = File.open(resultsDir+"Results.csv");										//Creates a results .csv file
print(summaryFile,"Filename,Image Num, Num Nuclei, Nuclei #, Nuclei Area, Nuclei Mean Int, Ch1 Mean Int, Ch1 Max Int");	//Prints the header for the results csv


// * * * * * * * Section 03 - Collecting Data from Images * * * * * * * * * * * * * *				
for (z=0; z<list.length; z++) {															//Loop to run for the number of files within the input directory
	if (endsWith(list[z],ext)){															//Only commences action if file ends with correct extension; see line 10
 		print("Opening File "+(z+1)+" of "+list.length+" total files");					//Prints which file is being opened
 		open(path+list[z]);																//Opens the file
		windowtitle = getTitle();														//Defines a variable with the filename
		windowtitlenoext = replace(windowtitle, ext, "");								//Defines a variable with the filename, less the extension

// * * * * * * * Section 04 - Preparing Images for Analysis * * * * * * * * * * * * * *				
		selectWindow(windowtitle);														//Ensuring the correct window (master) is selected
		run("Duplicate...", "title=green duplicate channels=1");						//Making a copy of the Green (Ch1) channel for measurements later													
		selectWindow(windowtitle);														//Ensuring the correct window (master) is selected
		run("Duplicate...", "title=nuc duplicate channels=2");							//Making a copy of the Red (Ch2) channel for measuring RAW intensity
		selectWindow(windowtitle);														//Ensuring the correct window (master) is selected
		run("Duplicate...", "title=nucformask duplicate channels=2");					//Making a copy of the Red (Ch2) channel for generating a mask
		run("Subtract Background...", "rolling=20");									//Massaging nuclei channel before thresholding - Background subtraction 20 radius
		run("Median...", "radius=4");													//Massaging nuclei channel before thresholding - MEAN Filter 4pixel radius
		setAutoThreshold("MaxEntropy dark");											//Setting the AutoThreshold
		setOption("BlackBackground", false);											//Confirming Threshold Options
		run("Convert to Mask");															//Generating the Threshold
		run("Analyze Particles...", "size=20-Infinity show=Masks exclude clear add");	//Finds only nuclei sized objects from the mask
		rename("mask1"); 																//Renames the mask window for saving purposes later
		print("Number of Nuclei Found = "+roiManager("count"));							//Reports number of found Nuclei into the Log window.

// * * * * * * * Section 05 - Getting measurements from the Green Channel (CH1) * * * * * * * * * * * * * *				
		for (i = 0; i < roiManager("count"); i++) {										//Loop to run for the number of nuclei identified and added to the ROI manager
			selectWindow("nuc");														//Selects the window with just nuclei channel (red/ch2); see line 36
				run("Clear Results");													//Ensures the Results table is clear 
				roiManager("select", i);												//Selects the ROI corresponding with the loop number
				roiManager("measure");													//Measures the ROI
				nucArea = getResult("Area",0);											//Defines a variable for Nuclei Area and collects the info from the results table
				nucMean = getResult("Mean", 0);											//Defines a variable for Nuclei Mean Intensity and collects the info from the results table
				
// * * * * * * * Section 06 - Getting measurements from the Green Channel (CH1) * * * * * * * * * * * * * *				
			selectWindow("green");														//Selects the window with just Bio-sensor channel (green/ch1); see line 34
				run("Clear Results");													//Ensures the Results table is clear
				roiManager("select", i);												//Selects the ROI corresponding with the loop number
				roiManager("measure");													//Measures the ROI
				ch1Mean = getResult("Mean", 0);											//Defines a variable for Bio-sensor Mean Intensity and collects the info from the results table
				ch1Max  = getResult("Max",0);											//Defines a variable for Bio-sensor Maximum Intensity and collects the info from the results table
				imageNum = (z+1);														//Defines a variable for the current image number
		    	nucNum = (i+1);															//Defines a variable for the current nuclei number
		    print(summaryFile,windowtitle+","+imageNum+","+roiManager("count")+","+nucNum+","+nucArea+","+nucMean+","+ch1Mean+","+ch1Max);															//Prints to summaryFile: filename, image#, #nuc, nuc#, nucArea, nucMeanInt, Ch1MeanInt, Ch1MaxInt
		  	}																			//Closing Analysis Loop for each nuclei

// * * * * * * * Section 07 - Saving & Closing Outputs * * * * * * * * * * * * * *				
		selectWindow("mask1");																//Selecting the Mask window for Saving
 			saveAs("tiff", resultsDir+windowtitlenoext+"_nuclei-mask.tif");				//Saving the mask window
 			print("Saving nuclei mask");												//Printing to log that Mask has been saved
 			close();																	//Closing the Mask window
 		roiManager("Save", resultsDir+ windowtitlenoext + "_ROISs.zip");				//Saving Nuclei ROI outputs 
 			print("Saving ROI list");													//Printing to log that ROIs have been saved
 		while(nImages>0){close();}														//Closes all open windows
		print("");																		//Prints a blank line
	}																					//Closing If ends with file extension loop
}																						//Closing for number of files in input directory loop

// * * * * * * * Section 08 - Script Finalisation * * * * * * * * * * * * * *				
selectWindow("Log");																	//Selects the log window
saveAs("Text", resultsDir+"Log.txt");													//Saves the log window

title = "Batch Completed";																//Script completion window title
msg = "Put down that coffee! Your job is finished";										//Script completion window message
waitForUser(title, msg);  																//Script completion window
//end of script
