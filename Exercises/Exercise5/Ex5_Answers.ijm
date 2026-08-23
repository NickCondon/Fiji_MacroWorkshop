path = getDirectory("Choose Your Directory");
filelist = getFileList(path);
print(path);
print("Total Number of files = "+filelist.length);

getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);	
resultsDir = path+"_Results_"+"_"+year+"-"+(month+1)+"-"+dayOfMonth+"_at_"+hour+"-"+minute+"/"; 
File.makeDirectory(resultsDir);

isImage = 0;


for (i = 0; i < filelist.length; i++) {
	currentImage = File.getName(path+filelist[i]);
	if(endsWith(currentImage, "tif")) {isImage = isImage+1;}
	}

print("There is/are "+isImage+" file(s) ending with tif");
selectWindow("Log");
saveAs("Text", resultsDir+"Log.txt");


