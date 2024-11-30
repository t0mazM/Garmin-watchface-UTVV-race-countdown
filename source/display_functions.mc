import Toybox.Graphics;
import Toybox.Application.Storage;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.WatchUi as Ui;
using Toybox.Time as Time;
using Toybox.Time.Gregorian;



class display_functions {

    function draw_race_option(dc, raceOption, screenX, screenY, screenHeight, screenWidth) {
        dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(raceAttributes[raceOption][:bitmap]));
    }   

    function draw_race_name(dc, raceOption, screenX, screenY, screenHeight, screenWidth) {
        var raceStr = raceAttributes[raceOption][:name]; 

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenHeight * screenX, screenWidth * screenY, 
        Graphics.FONT_SYSTEM_TINY,
        raceStr,
        Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER
         );
    }

function draw_hour(dc, raceOption, screenX, screenY, screenHeight, screenWidth) {
    var clockTime = System.getClockTime();
    var hours = clockTime.hour.format("%02d"); // Ensure hours are formatted as two digits
    var minutes = clockTime.min.format("%02d");
    var minColour = raceAttributes[raceOption][:colour];

    // Load the custom font
    var digitalFont = Ui.loadResource(Rez.Fonts.midbold);

    // Draw the hours
    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    dc.drawText(screenHeight * screenX, screenWidth * screenY, 
                digitalFont,
                hours,
                Graphics.TEXT_JUSTIFY_VCENTER|Graphics.TEXT_JUSTIFY_CENTER
    );
    // draw minutes below hours
    dc.setColor(minColour, Graphics.COLOR_TRANSPARENT);
    dc.drawText(screenHeight * screenX, screenWidth * screenY +53, 
                digitalFont,
                minutes,
                Graphics.TEXT_JUSTIFY_VCENTER|Graphics.TEXT_JUSTIFY_CENTER
    );
}

    function draw_remaining_time(dc, raceOption, screenX, screenY, screenHeight, screenWidth) {

        //Set the race day and hour
        var futureOptions = {
            :year   => 2025,
            :month  => 4,
            :day => raceAttributes[raceOption][:race_day],
            :hour => raceAttributes[raceOption][:race_hour]
        };

        //Calculate the remaining time
        var futureMoment = Gregorian.moment(futureOptions);
        var currentDateTime = Time.now();
        var duration_sec = futureMoment.subtract(currentDateTime).value();
        var duration_hour = duration_sec / 3600;
        var duration_days = duration_hour / 24;

        //Format the remaining time
        var time_left_string = Lang.format("$1$ DAYS LEFT", [duration_days]);

        if (duration_days <= 0) {
            time_left_string = Lang.format("$1$ HOURS LEFT", [duration_hour]);
        }
        //Draw the remaining time
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenHeight * screenX, screenWidth * screenY, 
                    Graphics.FONT_SYSTEM_TINY,
                    time_left_string,
                    Graphics.TEXT_JUSTIFY_VCENTER|Graphics.TEXT_JUSTIFY_CENTER
         );
    }

    function draw_coloured_edge(dc, raceOption) {
        var centerX = dc.getWidth()/2;
        var centerY  = dc.getHeight()/2;
        var colour = raceAttributes[raceOption][:colour];

        dc.setColor(colour, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(5);
        dc.drawCircle(centerX, centerY, centerX);
    }

    function draw_utvv_text(dc, raceOption, screenX, screenY, screenHeight, screenWidth) {
    var utvv_text_bitmap = raceAttributes[raceOption][:utvv_bitmap];
    dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(utvv_text_bitmap) );
    
    }

    function draw_datapoint(dc, dataOption, screenX, screenY, screenHeight, screenWidth) {
    
    var iconFont = Ui.loadResource(Rez.Fonts.iconfont);
    
    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    dc.drawText(screenHeight * screenX, screenWidth * screenY, 
                iconFont,
                dataOption,
                Graphics.TEXT_JUSTIFY_VCENTER|Graphics.TEXT_JUSTIFY_CENTER
    );
}
    
}



