import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.WatchUi as Ui;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Time as Time;

class utvv_watch_face_v2View extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
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
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);


        var JUST = Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER;

        var screenY = dc.getHeight();
        var screenX = dc.getWidth();

        dc.drawBitmap(screenX * 0.08, screenY * 0.08, Ui.loadResource(Rez.Drawables.utvvlogo));
        dc.drawBitmap(screenX * 0.13, screenY*0.65, Ui.loadResource(Rez.Drawables.batteryIcon));
        dc.drawBitmap(screenX * 0.46, screenY*0.66, Ui.loadResource(Rez.Drawables.heartIcon));
        dc.drawBitmap(screenX * 0.77, screenY*0.68, Ui.loadResource(Rez.Drawables.stepsIcon));
        if (Toybox.System.getDeviceSettings().phoneConnected){
            dc.drawBitmap(screenX * 0.45, screenY*0.05, Ui.loadResource(Rez.Drawables.blthIcon));
        }
            
        // Draw a green around hour
        dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
        var thickness = 3;
        var x1 = screenX*0.50;
        var y = screenY*0.30;
        var x2 = screenX*0.95;

        for (var i = 0; i < thickness; i++) {
            dc.drawLine(x1, y+i, x2, y+i);
        }

        // Draw a green under UTVV
        dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
        thickness = 3;
        x1 = screenX*0.08;
        y = screenY*0.50;
        x2 = screenX*0.95;

        for (var i = 0; i < thickness; i++) {
            dc.drawLine(x1, y+i, x2, y+i);
        }

        //hour
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        var minutes = clockTime.min.format("%02d");

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenX*0.72,screenY*0.40, 
        Graphics.FONT_SYSTEM_NUMBER_MEDIUM,
        Lang.format("$1$:$2$", [hours, minutes]),
        JUST
         );

        //date
        var now = Time.now();
        var info = Calendar.info(now, Time.FORMAT_MEDIUM);

        var dateStr = Lang.format("$1$ $2$", [info.day_of_week, info.day]);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenX*0.68,screenY*0.20, 
        Graphics.FONT_MEDIUM,
        dateStr,
        JUST
         );


        // x days 
        info = Calendar.info(now, Time.FORMAT_SHORT);
        var daysInMonths = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        var race_month = 4;
        var race_day = 26;
        var race_day_num = 0;
        for(var i=1; i<race_month; i++){
            race_day_num += daysInMonths[i];
        }
        race_day_num += race_day;

        var current_day_num = 0;
        for(var i=1; i<info.month; i++){
            current_day_num += daysInMonths[i];
        }
        current_day_num += info.day;
        var days_left = race_day_num - current_day_num;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        var x=screenX*0.50;
        y=screenY*0.83;
        if(days_left == 0 || days_left == -1){
            dc.drawText(x,y, 
            Graphics.FONT_MEDIUM,
            "Race day",
            JUST
            );
        }
        else if(days_left < -1){
        dc.drawText(x,y, 
        Graphics.FONT_MEDIUM,
        "Recover well",
        JUST
         );
        }
        else{       
            var daysLeftStr = Lang.format("$1$ days left", [days_left]);
            dc.drawText(x,y, 
            Graphics.FONT_MEDIUM,
            daysLeftStr,
            JUST
            );
        }

    //hear rate
    x = screenX*0.50;
    y = screenY*0.51;
    var heartRate = Activity.getActivityInfo().currentHeartRate;
    if (heartRate != null) {
        var heartRateString = Lang.format("$1$", [heartRate]);
        dc.drawText(x, y, Graphics.FONT_MEDIUM, heartRateString, Graphics.TEXT_JUSTIFY_CENTER);
    }
    else{
        var heartRateString = "---";
        dc.drawText(x, y, Graphics.FONT_MEDIUM, heartRateString, Graphics.TEXT_JUSTIFY_CENTER);
    }


    //battery
    var stats = System.getSystemStats().battery;
    var batStr = Lang.format( "$1$%", [ stats.format( "%2d" ) ] );
    dc.drawText(screenX*0.19, screenY*0.52, Graphics.FONT_MEDIUM, batStr, Graphics.TEXT_JUSTIFY_CENTER);


    //steps
    var stepsString = Lang.format("$1$", [ActivityMonitor.getInfo().steps]);
    dc.drawText(screenX*0.83, screenY*0.52, Graphics.FONT_MEDIUM, stepsString, Graphics.TEXT_JUSTIFY_CENTER);
    

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

//
// Copyright 2016-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

//! This implements a goal view for the analog face
class AnalogGoalView extends WatchUi.View {
    private var _goalString as String;

    //! Initialize the string to display on the goal view.
    //! @param goal The goal triggered
    public function initialize(goal as GoalType) {
        View.initialize();

        _goalString = "GOAL!";

        if (goal == Application.GOAL_TYPE_STEPS) {
            _goalString = "STEPS " + _goalString;
        } else if (goal == Application.GOAL_TYPE_FLOORS_CLIMBED) {
            _goalString = "STAIRS " + _goalString;
        } else if (goal == Application.GOAL_TYPE_ACTIVE_MINUTES) {
            _goalString = "ACTIVE " + _goalString;
        }
    }

    //! Load your resources here
    //! @param dc Device context
    public function onLayout(dc as Dc) as Void {
        // Clear any clip that may currently be set by the partial update
        dc.clearClip();
    }

    //! Update the clock face graphics
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {
        var clockTime = System.getClockTime();

        var width = dc.getWidth();
        var height = dc.getHeight();

        var now = Time.now();
        var info = Gregorian.info(now, Time.FORMAT_LONG);

        var dateStr = Lang.format("$1$ $2$ $3$", [info.day_of_week, info.month, info.day]);

        // Fill the screen with a black rectangle
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.fillRectangle(0, 0, width, height);

        // Fill the top right half of the screen with a grey triangle
        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_DK_GRAY);
        dc.fillPolygon([[0, 0] as Array<Number>, [width, 0] as Array<Number>, [width, height] as Array<Number>, [0, 0] as Array<Number>]  as Array< Array<Number> >);

        // Draw the date
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width / 2, height / 4, Graphics.FONT_MEDIUM, dateStr, Graphics.TEXT_JUSTIFY_CENTER);

        // Draw the Goal String
        dc.drawText(width / 2, height / 2, Graphics.FONT_MEDIUM, _goalString, Graphics.TEXT_JUSTIFY_CENTER);
    }
}

//! Receives watch face events
class AnalogDelegate extends WatchUi.WatchFaceDelegate {
    private var _view as utvv_watch_face_v2View;

    //! Constructor
    //! @param view The analog view
    public function initialize(view as utvv_watch_face_v2View) {
        WatchFaceDelegate.initialize();
        _view = view;
    }

}