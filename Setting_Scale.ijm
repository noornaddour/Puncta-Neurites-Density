// It is good practice to have one plugin that determines the Scale precisely everytime.
// This Script creates a scale of 6.0 pixel/um


// command makeLine needs to be updated according to your built-in scale in the image.
makeLine(3999, 3582, 4179, 3582);
run("Set Scale...", "distance=180.3333 known=30 pixel=1 unit=um global");
