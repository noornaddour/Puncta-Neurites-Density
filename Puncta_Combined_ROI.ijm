//This is script that combines all the puncta ROIs of one image into one ROI.


//you need to open any of your images just because it is neccessary for ImageJ/FIJI to run the script on.
selectWindow("Image 1-2.tif");

for (i = 1; i < 50; i++) {

//change the directory	
roiManager("Open", "C:/Users/s4488590/Desktop/PART 2/Puncta Results/Excels_and_ROI_Sets/18-37/RoiSetofimage"+(i)+"puncta.zip");
roiManager("Combine");
roiManager("Add");
	LastIndex= roiManager("count");
	roiManager("select",LastIndex -1);
//change the directory	
roiManager("Save", "C:/Users/s4488590/Desktop/PART 2/Puncta Results/CombinedPuncta (NEW)/Roi"+(i)+".roi");
run("Close");
}

