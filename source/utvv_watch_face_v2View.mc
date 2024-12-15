import Toybox.Graphics;
import Toybox.Application.Storage;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.WatchUi as Ui;

class utvv_watch_face_v2View extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
        //Initialize the storage to default values
        // Also check if the values are within the allowed range
        var raceNum = raceAttributes.keys().size();
        var iconNum = iconsDict.keys().size();

        if (Storage.getValue(40) == null or Storage.getValue(40) < 0 or Storage.getValue(40) > raceNum ) {Storage.setValue(40, 1); } // Race option
        if (Storage.getValue(30) == null or Storage.getValue(30) < 0 or Storage.getValue(30) > iconNum ) {Storage.setValue(30, 3); } // Top left data field
        if (Storage.getValue(31) == null or Storage.getValue(31) < 0 or Storage.getValue(31) > iconNum ) {Storage.setValue(31, 1); } // Top right data field
        if (Storage.getValue(32) == null or Storage.getValue(32) < 0 or Storage.getValue(32) > iconNum ) {Storage.setValue(32, 10); } // Middle left data field
        if (Storage.getValue(33) == null or Storage.getValue(33) < 0 or Storage.getValue(33) > iconNum ) {Storage.setValue(33, 6); } // Middle right data field
    }

    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);

        //Get needed variables
        var screenHeight = dc.getHeight(); 
        var screenWidth = dc.getWidth();
        var raceOption = Storage.getValue(40);

        // Get datafield choices from user (saved when user choose them in menu)
        var dataTopLeft = Storage.getValue(30);
        var dataTopRight = Storage.getValue(31);
        var dataMiddleLeft = Storage.getValue(32);
        var dataMiddleRight = Storage.getValue(33);

        //Check if the datafield choices valid
        try {
            var raceName = raceAttributes[Storage.getValue(40)][:name]
            var iconName = iconsDict[Storage.getValue(30)][:name];
            iconName = iconsDict[Storage.getValue(31)][:name];
            iconName = iconsDict[Storage.getValue(32)][:name];
            iconName = iconsDict[Storage.getValue(33)][:name];
        } catch (ex) {
            Storage.setValue(40, 0);
            Storage.setValue(30, 0);
            Storage.setValue(31, 0);
            Storage.setValue(32, 0);
            Storage.setValue(33, 0);
        }

        // Class for DISplaying data on the watchface
        var DIS = new display_functions();

        //Display hard-coded data on watchface
        DIS.draw_coloured_edge(dc, raceOption);
        DIS.draw_race_option(dc, raceOption, 0.30, -0.04, screenHeight, screenWidth);
        DIS.draw_race_name(dc, raceOption, 0.50, 0.34, screenHeight, screenWidth);
        DIS.draw_hour(dc, raceOption, 0.24, 0.47, screenHeight, screenWidth);
        DIS.draw_remaining_time(dc, raceOption, 0.50, 0.86, screenHeight, screenWidth);
        DIS.draw_date(dc, 0.63, 0.71, screenHeight, screenWidth);

        //Display custum choosen datafields on watchface
        DIS.draw_datapoint(dc, dataTopLeft, 0.45, 0.48, screenHeight, screenWidth);
        DIS.draw_datapoint(dc, dataTopRight, 0.71, 0.48, screenHeight, screenWidth);
        DIS.draw_datapoint(dc, dataMiddleLeft, 0.45, 0.60, screenHeight, screenWidth);
        DIS.draw_datapoint(dc, dataMiddleRight, 0.71, 0.60, screenHeight, screenWidth);
    }
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }
}
