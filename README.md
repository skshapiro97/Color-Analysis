# Color Change Analysis
Protocol for collecting average color (RGB) for a region of interest and R code for how to analyze color data

**Uses:** ImageJ software and R programming language

**Purpose:** This protocol and code were developed to track color changes over time for regions of interest (ROIs) by collecting the average RGB values within the ROIs and subsequently visualizing how the RGB values change with time.

**Need/Requirements:** 
- ImageJ (or Fiji) and R coding language
- Images that all contain the same "true white" reference to use for white-balancing (need to be able to white-balance all images to the same thing to not bias color data)
- Images should be taken all using the same device under as similar conditions as possible to avoid any bias

Note: The project this code was created for and is being used for is analyzing color change over time in post-larval lobsters when subjected to different temperatures and UV exposure. Because of this, there is reference to lobsters and lobster anatomy in the protocol.

**PROTOCOL:**
- Step 1: Follow the Lobster Photo ImageJ Protocol for all images to collect color data
	-  When pasting the color data into a spreadsheet, I like to pre-label my columns and rows and separate each ImageJ table by a blank spreadsheet row to keep my data separated and properly labeled, as it can get confusing when collecting data for multiple ROIs on multiple subjects.

- Step 2: Format ImageJ results table data into the correct format
	- When the data is collected for each ROI, it is formatted with the columns being each ROI and rows being the Red average, Green average, and Blue average. In order to make the data more user-friendly for R, it needs to be flipped.
 	- The best way I found to do this is to create a new spreadsheet tab, copy one set of ImageJ result table data (aka only one set of Red average, Green average, and Blue average rows), go into the new spreadsheet tab, right-click, go to Paste Special -> Transposed (this will paste the data in the correct orientation). Repeat for all data.
  - Once the data is in the correct orientation and has the appropriate columns for your data (in this case it's: Date, Lobster, Region, Red, Green, Blue), save it as a .csv file
  - Example .csv file in .csv files folder (raw_imagej_example.csv)

- Step 3: Follow format_imagej_data_code R code (developed by Arianna Krinos, 31 July 2024) for formatting the ImageJ data
	- This code will help to pivot and reformat the raw ImageJ data to make new columns for each ROI avg. Red, Green, and Blue values respectively and also make a column with the RGB value for each ROI. If the RGB value for each ROI is not needed, that line of code can be removed
 	- Example pivoted/reformatted .csv have been added to .csv files folder (pivod_imagej_example.csv)
  	- After the pivoted/reformatted .csv file has been created, I delete column A (row numbers) and add in any other columns of relevant data (in my case, I added data columns for Temperature and UV Treatment)
  
- Step 4: Visualizing color data in R
	-  The code included in this R script (color_analysis_code.md) graphs color across time in the form of color grids, ternary plots (using both ggtern and ternary package), boxplots, and line plots. I have included a dummy data subset .csv that can be used with the color visualizing code as reference.
 -  NOTE: The Ternary package ternary plot doesn't load in the .md file because the figure can't be "named" (or at least I haven't found a way to name it), but you can view it in the PDF version of the code file (Color Analysis Code.pdf).
