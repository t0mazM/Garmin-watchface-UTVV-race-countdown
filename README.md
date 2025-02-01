# Garmin-watchface-UTVV-race-countdown
# UTVV Watch Face V2

This repository contains the source code for a custom watch face designed for Garmin smartwatches. The watch face is built using the Garmin SDK and Monkey C programming language. It features customizable data fields, race countdowns, and various display options.

## Features

- **Customizable Data Fields**: Users can choose from a variety of data fields to display on the watch face, such as steps, heart rate, battery level, and more.
- **Race Countdown**: Displays the remaining time for selected races, including custom race names, dates, and colors.
- **Dynamic Display**: The watch face dynamically updates to show the current time, date, and selected data fields.
- **Custom Fonts and Icons**: Utilizes custom fonts and icons for a unique look and feel.
- **Settings Menu**: Allows users to customize race options and data fields directly from the watch.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/utvv-watch-face-v2.git
Open the Project:

Open the project in the Garmin Connect IQ SDK.

Ensure you have the necessary dependencies and resources (fonts, icons, etc.) in the resources folder.

Build and Run:

Build the project using the Garmin Connect IQ SDK.

Deploy the watch face to your Garmin device for testing.

Usage
Select a Race:

Navigate to the settings menu on your Garmin device.

Choose your race from the available options. The watch face will display the race name, countdown, and custom color.

Customize Data Fields:

In the settings menu, select "Data Fields" to choose which data points (e.g., steps, heart rate) to display on the watch face.

View Watch Face:

The watch face will display the current time, date, selected race countdown, and chosen data fields.

Code Structure
display_functions.mc: Contains functions for drawing various elements on the watch face, such as the race name, countdown, and data fields.

icons_dict.mc: Defines the icons and their corresponding data fields.

race_attributes.mc: Contains the attributes for each race, including name, bitmap, color, and race date.

menu.mc: Handles the settings menu for selecting races and data fields.

utvv_watch_face_v2App.mc: The main application file that initializes the watch face and handles app lifecycle events.

utvv_watch_face_v2view.mc: The view file that manages the display and updates of the watch face.
