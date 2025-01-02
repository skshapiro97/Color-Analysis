# Color-Analysis
Protocol for collecting average color (RGB) for a region of interest and R code for how to analyze color data

Uses: ImageJ software and R programming language

Purpose: This protocol and code were developed to track color changes over time for regions of interest (ROIs) by collecting the average RGB values within the ROIs and subsequently visualizing how the RGB values change with time.

Need/Requirements: 
- ImageJ (or Fiji) and R coding language
- Images that all contain the same "true white" reference to use for white-balancing (need to be able to white-balance all images to the same thing to not bias color data)
- Images should be taken all using the same device under as similar conditions as possible to avoid any bias

Note: The project this code was created for and is being used for is analyzing color change over time in post-larval lobsters when subjected to different temperatures and UV exposure. Because of this, there is reference to lobsters and lobster anatomy in the protocol.
