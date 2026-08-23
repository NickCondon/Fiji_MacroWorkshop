if (nImages()==0){				
	exit("There is no image open");}	
else{			 		
	getDimensions(width, height, channels, slices, frames);	
	Options= newArray("Max Intensity", "Average Intensity", "Sum Slices", "Min Intensity", "Standard Deviation", "Median"); 

Dialog.create("Z-Projection");			 	
   Dialog.addNumber("Start Slice", 1);				
   Dialog.addNumber("End Slice", slices); 	
   Dialog.addChoice("Projection Type:", Options);
   if (frames>1){Dialog.addCheckbox("Project all frames", true)};	
Dialog.show();
		
startslice = Dialog.getNumber();					
endslice = Dialog.getNumber();					
projectiontype=Dialog.getChoice();					
Projectallframes = Dialog.getCheckbox();				

if (Projectallframes == 1){run("Z Project...", "projection=["+projectiontype+"] start="+startslice+" stop="+endslice+" all");}    
else run("Z Project...", "projection=["+projectiontype+"] start="+startslice+" stop="+endslice);}
