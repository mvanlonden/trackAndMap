Track And Map
===========

Tracks video input using an HSV filter and outputs a MATLAB figure analyzing movement
## 

## Aquiring Data
### In the terminal navigate through folders using commands:
- **ls** will list files and folders of the current directory
- **cd 'folder name'** will change into directory 'folder name'
- **cd ..** will navigate to the parent directory
- Right clicking on a file and selecting properties will give you a file's location

### To convert files from .wmv to .avi
1. In the terminal navigate to the folder containing the files
2. Enter **~/Convert.sh** and the program will convert all the files

### To create the tracking data
1. In the terminal enter **Objrec /path/to/video.avi /desired/path/to/data.csv**
2. Once application opens, use the HSV sliders to isolate the color of interest in the threshold window
3. Once cross hair is consistently tracking, switch from pause to play and switch recording on
4. Once recording is complete, open .csv folder to validate results

## Graphing results in MATLAB
### Importing
1. Select 'Import Data' in the toolbar
2. Navigate to and select the .csv file
3. Select Matrix instead of the default import type Column Vectors
4. 'Import Selection'
5. Rename the matrix to **framexy**

### Heatmap Graphing
1. Either clone heatmap.m from this repository into your working MATLAB directory or select 'New Script' from the toolbar and copy and paste the contents of heatmap.m into the script and save it as heatmap.m
2. In the Command Window enter **xy = horzcat(framexy(:,2), framexy(:,3))**
3. **heatmap(xy)** will display a figure with the heatmap overlaid by the vector of motion

## Overlaying Audio Cues (must have signal processing toolkit)
### Audio Extraction from .avi
1. Download and install videopad
2. VideoPad has an audio extraction tool

### Video Frame to Time Conversion
1. **frames = length(framexy)**
2. **time = frames/62.5**
3. **tv = linspace(0, time, frames)**
4. **timexy = horzcat(tv(:,1), framexy(:,2), frame(:,3))**

### Audio Processing
1. In the Command Window enter **[f, Fs] = wavread('filename.wav')**
2. **N = length(f)**
3. **slength = N/Fs**
4. **ta = linspace(0, slength, N)**
5. **left = f(:,1)**
6. **wav = [ta, left]**
7. **indices = find(wav(:,2) >= .3)**
8. **wav(indices,:) = []**

### Heatmap with Audio Cues plotted
1. Either clone AVcompare.m from this repository into your working MATLAB directory or select 'New Script' from the toolbar and copy and paste the contents of AVcompare.m into the script and save it as AVcompare.m
2. Enter **heatmap(xy)**
3. Enter **AVcompare(timexy, wav)**







  