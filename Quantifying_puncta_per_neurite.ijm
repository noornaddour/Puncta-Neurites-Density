// This script helps you run through all neurites of one image, and it saves for each neurite the count and areas of puncta associated with that particular neurite. 
setBatchMode(false);
// Copy-paste your directory of the image used here:
open("C:/Users/s4488590/Desktop/Bsn exported for analysis Noor/image 66-2.tif");

run("Set Measurements...", "area redirect=None decimal=3");
run("ROI Manager...");


// you can create a nested loop here to go through all images at once, however we decided to edit once per image for all its neurites.
for (i = 0; i < 100; i++) {

// Copy-paste the directory in which the new folder that is dedicated for one neurite should be placed, keep name as 'Puncta of Path ("+(i)+")-0001-Z0'.
	File.makeDirectory("C:/Users/s4488590/Desktop/PART 2/Puncta Results/Image66/Puncta of Path ("+(i)+")-0001-Z0")

run("Close");

// Copy-paste your directory of the image used here:
open("C:/Users/s4488590/Desktop/Bsn exported for analysis Noor/image 66-2.tif");
run("ROI Manager...");

//Copy-Paste directory of neurites' ROIs, within the loop this will open iteratively all ROI neurites. keep name: Path ("+(i)+")-0001-Z0.roi
roiManager("Open", "C:/Users/s4488590/Desktop/PART 2/Neurite Results/Neurites_as_ROI Sets/RoiSet66/Path ("+(i)+")-0001-Z0.roi");

roiManager("Select", 0);
name = getInfo("selection.name");

// create a "seed", save it anywhere, copy-paste its directory here. This never changes. 
roiManager("Open", "C:/Users/s4488590/Desktop/PART 1/Neurite Results/seed.roi");

//Copy-Paste the directory of Combined Puncta ROI for the image.
roiManager("Open", "C:/Users/s4488590/Desktop/PART 2/Puncta Results/CombinedPuncta/Roi66.roi");


//RoiManagerFunctioning:
roiManager("Select", newArray(0,1));
roiManager("Combine");
roiManager("Add");
roiManager("Select", 3);
roiManager("split");

//Getting puncta of the one neurite:
roiManager("Select", newArray(2,5));
roiManager("AND");
roiManager("Add");

//Measuring Path:
run("Clear Results");
roiManager("Select", 0);
roiManager("Measure");

//Choose the directory of your Puncta results, copy-paste it here. keep names: Puncta of Path ("+(i)+")-0001-Z0 and Path ("+(i)+")-0001-Z0_Area_&_Count.csv
saveAs("Results", "C:/Users/s4488590/Desktop/PART 2/Puncta Results/Image66/Puncta of Path ("+(i)+")-0001-Z0/Path ("+(i)+")-0001-Z0_Area_&_Count.csv");


run("Clear Results");
//Deleting every roi: they should be 5 rois:
roiManager("Select", newArray(0,1,2,3,4,5));
roiManager("Delete");
//Splitting of puncta:
roiManager("Select", 0);
roiManager("Split");
roiManager("Select", 0);
roiManager("Delete");
roiManager("Measure");


//Choose the directory of your Neurite results, copy-paste it here. keep name: Puncta of Path ("+(i)+")-0001-Z0 and RoiSet.csv
saveAs("Results", "C:/Users/s4488590/Desktop/PART 2/Puncta Results/Image66/Puncta of Path ("+(i)+")-0001-Z0/RoiSet.csv");
run("Clear Results");

//Choose the directory of your Puncta visualisation, copy-paste it here. keep name: Puncta of Path ("+(i)+")-0001-Z0 and RoiSet.zip
roiManager("Save", "C:/Users/s4488590/Desktop/PART 2/Puncta Results/Image66/Puncta of Path ("+(i)+")-0001-Z0/RoiSet.zip");

roiManager("Deselect");
roiManager("Delete");
run("Close");

}
