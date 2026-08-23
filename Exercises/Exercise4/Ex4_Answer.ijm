//resets log window
print("\\Clear");

//Gets window filename
imageTitle = getTitle();
print("Title: "+imageTitle);

//Gets dimensions of the image file
getDimensions(width, height, channels, slices, frames);
print("Channels = "+channels);
print("Slices = "+slices);
print("Width = "+width);
print("Height = "+height);

//Gets scale information from the image file (2D)
getPixelSize(unit, pixelWidth, pixelHeight);
print("Pixel Width = "+pixelWidth+" "+unit);
print("Pixel Height = "+pixelHeight+" "+unit);

//Gets scale information from the image file (3D)
getVoxelSize(voxWidth, voxHeight, voxDepth, unit);
print("Voxel Depth = "+voxDepth+" "+unit);

//Calculates the image size (scale not pixel)
totalImageWidth = pixelWidth * width;
print("Total Image Width = "+totalImageWidth+" "+unit);
