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
        if (Storage.getValue(40) == null) {Storage.setValue(40, 1); }
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
        var screenHeight = dc.getHeight(); //TODO: give this to init 
        var screenWidth = dc.getWidth();
        var raceOption = Storage.getValue(40);

        var DIS = new display_functions();

        DIS.draw_coloured_edge(dc, raceOption);
        DIS.draw_race_option(dc, raceOption, 0.45, 0.01, screenHeight, screenWidth);
        //DIS.draw_race_name(dc, raceOption, 0.70, 0.45, screenHeight, screenWidth);
        DIS.draw_hour(dc, raceOption, 0.25, 0.40, screenHeight, screenWidth);
        DIS.draw_remaining_time(dc, raceOption, 0.65, 0.73, screenHeight, screenWidth);
        DIS.draw_utvv_text(dc, raceOption, 0.13, 0.11, screenHeight, screenWidth);
        

        // dc.drawBitmap(screenX * 0.13, screenY*0.65, Ui.loadResource(Rez.Drawables.batteryIcon));
        // dc.drawBitmap(screenX * 0.46, screenY*0.66, Ui.loadResource(Rez.Drawables.heartIcon));
        // dc.drawBitmap(screenX * 0.77, screenY*0.68, Ui.loadResource(Rez.Drawables.stepsIcon));
        // if (Toybox.System.getDeviceSettings().phoneConnected){
        //     dc.drawBitmap(screenX * 0.45, screenY*0.05, Ui.loadResource(Rez.Drawables.blthIcon));
        // }
            
        // // Draw a green around hour
        // dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
        // var thickness = 3;
        // var x1 = screenX*0.50;
        // var y = screenY*0.30;
        // var x2 = screenX*0.95;

        // for (var i = 0; i < thickness; i++) {
        //     dc.drawLine(x1, y+i, x2, y+i);
        // }

        // // Draw a green under UTVV
        // dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
        // thickness = 3;
        // x1 = screenX*0.08;
        // y = screenY*0.50;
        // x2 = screenX*0.95;

        // for (var i = 0; i < thickness; i++) {
        //     dc.drawLine(x1, y+i, x2, y+i);
        // }

        // //hour
        // var clockTime = System.getClockTime();
        // var hours = clockTime.hour;
        // var minutes = clockTime.min.format("%02d");

        // dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        // dc.drawText(screenX*0.72,screenY*0.40, 
        // Graphics.FONT_SYSTEM_NUMBER_MEDIUM,
        // Lang.format("$1$:$2$", [hours, minutes]),
        // JUST
        //  );

        // //date
        // var now = Time.now();
        // var info = Calendar.info(now, Time.FORMAT_MEDIUM);

        // var dateStr = Lang.format("$1$ $2$", [info.day_of_week, info.day]);
        // dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        // dc.drawText(screenX*0.68,screenY*0.20, 
        // Graphics.FONT_MEDIUM,
        // dateStr,
        // JUST
        //  );




    // //hear rate
    // x = screenX*0.50;
    // y = screenY*0.51;
    // var heartRate = Activity.getActivityInfo().currentHeartRate;
    // if (heartRate != null) {
    //     var heartRateString = Lang.format("$1$", [heartRate]);
    //     dc.drawText(x, y, Graphics.FONT_MEDIUM, heartRateString, Graphics.TEXT_JUSTIFY_CENTER);
    // }
    // else{
    //     var heartRateString = "---";
    //     dc.drawText(x, y, Graphics.FONT_MEDIUM, heartRateString, Graphics.TEXT_JUSTIFY_CENTER);
    // }


    // //battery
    // var stats = System.getSystemStats().battery;
    // var batStr = Lang.format( "$1$%", [ stats.format( "%2d" ) ] );
    // dc.drawText(screenX*0.19, screenY*0.52, Graphics.FONT_MEDIUM, batStr, Graphics.TEXT_JUSTIFY_CENTER);


    // //steps
    // var stepsString = Lang.format("$1$", [ActivityMonitor.getInfo().steps]);
    // dc.drawText(screenX*0.83, screenY*0.52, Graphics.FONT_MEDIUM, stepsString, Graphics.TEXT_JUSTIFY_CENTER);
    

    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }


}
