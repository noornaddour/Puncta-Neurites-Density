//This loop helps you run Puncta Analyzer on all your images, you still need to specify for each image the threshold, but it makes the loop flexible for other experiments.
//To install Puncta Analyser go to https://github.com/physion/puncta-analyzer and follow the build instructions. or check .jar attached to the project.

//Setting up File directory locations
run("Clear Results");
path = getDirectory("Choose Source Directory ");
list = getFileList(path);
setBatchMode(false);	

for (z=0; z<list.length; z++) {

open(path+list[z]);
run("Select All");
run("Puncta Analyzer", "condition=[] red subtract subtract_0 subtract_1 rolling=50");

//Change the directories, copy-paste the folder files to save your puncta analysis, your puncta ROIs for each image. keep names: Resultsofimage"+(z+1)+"puncta.csv
saveAs("Results", "C:/Users/s4488590/Desktop/PART 2/Puncta Results/Excels_and_ROI_Sets/Resultsofimage"+(z+1)+"puncta.csv");
roiManager("Save", "C:/Users/s4488590/Desktop/PART 2/Puncta Results/Excels_and_ROI_Sets/RoiSetofimage"+(z+1)+"puncta.zip");
}
saveAs("Results", "C:/Users/s4488590/Desktop/PART 2/Puncta Results/Excels_and_ROI_Sets/Summary.csv");