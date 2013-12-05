Track And Map
===========
### Uses
OpenCV 2.4.6
Matlab 8.2.0.701

Tracks video input using an HSV filter and outputs a MATLAB figure analyzing movement
## 

## Aquiring Data
### In the terminal navigate through folders using commands:
- **ls** will list files and folders of the current directory
- **cd 'folder name'** will change into directory 'folder name'
- **cd ..** will navigate to the parent directory
- **Right clicking on a file and selecting properties will give you a file's location**

### To convert files from .wmv to .avi
1. In the terminal navigate to the folder containing the files
2. Enter **~/Convert.sh** and the program will convert all the files
3. After conversion it maybe necessary to crop out similar colors using [Video Pad](http://www.nchsoftware.com/videopad/)

### To create the tracking data
Note: In Ubuntu right clicking on a file and selecting properties will give you a file's location
1. In the terminal enter **ObjRec /path/to/video.avi /desired/path/to/data.csv**
2. Once application opens, reposition the four windows so that each window is visable and use the HSV sliders to isolate the color of interest in the threshold window (for neon pink bringing the S_MIN up to ~100, the V_MIN up to ~110 and the S_MAX down to ~150 worked well for me)
3. Once cross hair is consistently tracking, switch from pause to play and switch recording on
4. Wait for video playback to finish
5. Once recording is complete, open .csv folder to validate results

## Graphing results in MATLAB
### Importing
1. Select 'Import Data' in the toolbar
2. Navigate to and select the .csv file
3. Select Matrix instead of the default import type Column Vectors
4. 'Import Selection'
5. Rename the matrix to **framexy** by right clicking on the matrix in the workspace

### Heatmap Graphing
1.  Select 'New Script' from the toolbar and copy and paste the contents of heatmap.m into the script and save it as heatmap.m or clone heatmap.m from this repository into your working MATLAB directory
2. In the Command Window enter **xy = horzcat(framexy(:,2), framexy(:,3))**
3. **heatmap(xy)** will display a figure with the heatmap overlaid by the vector of motion

## Overlaying Audio Cues (must have signal processing toolkit)
### Video Frame to Time Conversion
1. **frames = length(framexy)**
2. **time = frames/62.5**
3. **tv = linspace(0, time, frames)**
4. **tv = transpose(tv)**
4. **timexy = horzcat(tv(:,1), framexy(:,2), framexy(:,3))**

### Audio Extraction from .avi
1. Go to [Audio Extractor](http://audio-extractor.net/)
2. Upload .avi and choose .wav as the extraction output
3. Add the extracted audio to your Matlab project folder

### Audio Processing
1. A Matlab project uses a current working directory which can be seen in the Current Folder pane
2. Put filename.wav in current working directory
3. In the Command Window enter **[f, Fs] = wavread('filename.wav')**
4. **N = length(f)**
5. **slength = N/Fs**
6. **ta = linspace(0, slength, N)**
7. **ta= transpose(ta)**
8. **left = f(:,1)**
9. **wav = [ta, left]**
10. **indices = find(wav(:,2) >= .3)**
11. **wav(indices,:) = []**

### Heatmap with Audio Cues plotted
1.  Select 'New Script' from the toolbar and copy and paste the contents of AVcompare.m into the script and save it as AVcompare.m or clone AVcompare.m from this repository into your working MATLAB directory
2. Enter **heatmap(xy)**
3. Enter **AVcompare(timexy, wav)**







  