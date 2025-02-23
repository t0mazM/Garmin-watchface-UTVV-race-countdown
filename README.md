# Garmin-watchface-UTVV-race-countdown
# UTVV Watch Face V2

This repository contains the source code for a custom watch face designed for Garmin smartwatches. The watch face is built using the Garmin SDK and Monkey C programming language. It features customizable data fields, race countdowns, and various display options.

1. **GARMIN IQ STORE LINK**:
   ```bash
   https://apps.garmin.com/apps/c0685750-4a08-412f-8c1b-a5fc2db68cd6

## Features

- **Customizable Data Fields**: Users can choose from a variety of data fields to display on the watch face, such as steps, heart rate, battery level, and more.
- **Race Countdown**: Displays the remaining time for selected races, including custom race names, dates, and colors.
- **Dynamic Display**: The watch face dynamically updates to show the current time, date, and selected data fields.
- **Custom Fonts and Icons**: Utilizes custom fonts and icons for a unique look and feel.
- **Settings Menu**: Allows users to customize race options and data fields directly from the watch.

## Usage: Select a race:

1. Navigate to the settings menu on your Garmin device.

2. Choose your race from the available options. The watch face will display the race name, countdown, and custom color.
## Usage: Customize Data Fields:

1. In the settings menu, select "Data Fields" to choose which data points (e.g., steps, heart rate) to display on the watch face.


## Code Structure
display_functions.mc: Contains functions for drawing various elements on the watch face, such as the race name, countdown, and data fields.

- icons_dict.mc: Defines the icons and their corresponding data fields.

- race_attributes.mc: Contains the attributes for each race, including name, bitmap, color, and race date.

- menu.mc: Handles the settings menu for selecting races and data fields.

- utvv_watch_face_v2App.mc: The main application file that initializes the watch face and handles app lifecycle events.

- utvv_watch_face_v2view.mc: The view file that manages the display and updates of the watch face.
