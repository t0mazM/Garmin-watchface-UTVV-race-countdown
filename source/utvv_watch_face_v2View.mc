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
        if (Storage.getValue(40) == null) {Storage.setValue(40, 1); } // Race option
        if (Storage.getValue(30) == null) {Storage.setValue(30, 2); } // Top left data field
        if (Storage.getValue(31) == null) {Storage.setValue(31, 3); } // Top right data field
        if (Storage.getValue(32) == null) {Storage.setValue(32, 4); } // Middle left data field
        if (Storage.getValue(33) == null) {Storage.setValue(33, 5); } // Middle right data field
        if (Storage.getValue(34) == null) {Storage.setValue(34, 6); } // Bottom left data field
        if (Storage.getValue(35) == null) {Storage.setValue(35, 7); } // Bottom right data field
    }

    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
        var screenHeight = dc.getHeight(); //TODO: give this to init 
        var screenWidth = dc.getWidth();
        var raceOption = Storage.getValue(40);



        var dataTopLeft = Storage.getValue(30);
        var dataTopRight = Storage.getValue(31);
        var dataMiddleLeft = Storage.getValue(32);
        var dataMiddleRight = Storage.getValue(33);
        var dataBottomLeft = Storage.getValue(34);
        var dataBottomRight = Storage.getValue(35);


        var DIS = new display_functions();

        DIS.draw_coloured_edge(dc, raceOption);
        DIS.draw_race_option(dc, raceOption, 0.30, -0.04, screenHeight, screenWidth);
        DIS.draw_race_name(dc, raceOption, 0.50, 0.34, screenHeight, screenWidth);
        DIS.draw_hour(dc, raceOption, 0.24, 0.47, screenHeight, screenWidth);
        DIS.draw_remaining_time(dc, raceOption, 0.50, 0.86, screenHeight, screenWidth);
        DIS.draw_date(dc, 0.52, 0.70, screenHeight, screenWidth);

        DIS.drawWeatherIcon(dc, raceOption, 0.72, 0.68, screenHeight, screenWidth);


        DIS.draw_datapoint(dc, dataTopLeft, 0.46, 0.48, screenHeight, screenWidth);
        DIS.draw_datapoint(dc, dataTopRight, 0.71, 0.48, screenHeight, screenWidth);
        DIS.draw_datapoint(dc, dataMiddleLeft, 0.46, 0.58, screenHeight, screenWidth);
        DIS.draw_datapoint(dc, dataMiddleRight, 0.71, 0.58, screenHeight, screenWidth);
        //DIS.draw_datapoint(dc, dataBottomLeft, 0.46, 0.65, screenHeight, screenWidth);
        //DIS.draw_datapoint(dc, dataBottomRight, 0.71, 0.65, screenHeight, screenWidth);

 
        // // Draw a green around hour
        // dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
        // var thickness = 3;
        // var x1 = screenX*0.50;
        // var y = screenY*0.30;
        // var x2 = screenX*0.95;

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
