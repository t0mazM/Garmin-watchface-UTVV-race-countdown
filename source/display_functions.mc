import Toybox.Graphics;
import Toybox.Application.Storage;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.WatchUi as Ui;
using Toybox.Time as Time;
using Toybox.Time.Gregorian;

class display_functions {

    function draw_race_option(dc, race_option, screenX, screenY, screenHeight, screenWidth) {
        if(race_option == 1){
            dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(Rez.Drawables.emperor_logo));
        }
        else if(race_option == 2){
            dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(Rez.Drawables.centurion_logo));
        }
        else if(race_option == 3){
            dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(Rez.Drawables.gladiator_logo));
        }
        else if(race_option == 4){
            dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(Rez.Drawables.legion_logo));
        }
        else if(race_option == 5){
            dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(Rez.Drawables.asterix_logo));
            }
        else if(race_option == 6){
            dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(Rez.Drawables.castra_logo));
        }
        else {
            dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(Rez.Drawables.utvvlogo));
        }
    }   

    function draw_days_left(dc, days_left, screenX, screenY, screenHeight, screenWidth) {
        var days_left_str = days_left.toString();
        dc.drawText(screenHeight * screenX, screenWidth * screenY, Graphics.FONT_SYSTEM_NUMBER_MEDIUM, days_left_str, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function draw_race_name(dc, race_option, screenX, screenY, screenHeight, screenWidth) {
        var raceStr;
        if(race_option == 1){ raceStr = "EMPEROR";}
        else if(race_option == 2){ raceStr = "Centurion";}
        else if(race_option == 3){ raceStr = "Gladiator";}
        else if(race_option == 4){ raceStr = "Legionar";}
        else if(race_option == 5){ raceStr = "Asterix";}
        else if(race_option == 6){ raceStr = "Castra";}
        else {raceStr = "UTVV";}
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenHeight * screenX, screenWidth * screenY, 
        Graphics.FONT_MEDIUM,
        raceStr,
        Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER
         );
    }

    function draw_hour(dc, screenX, screenY, screenHeight, screenWidth) {
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        var minutes = clockTime.min.format("%02d");

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenHeight * screenX, screenWidth * screenY, 
        Graphics.FONT_SYSTEM_NUMBER_MEDIUM,
        Lang.format("$1$:$2$", [hours, minutes]),
        Graphics.TEXT_JUSTIFY_CENTER
         );
    }

    function draw_remaining_time(dc, race_option, screenX, screenY, screenHeight, screenWidth) {

        var race_day;
        var race_hour;

        //Each race has a different start time/day
        switch (race_option) { //TODO get race time from organizer
            case 1:
                race_day = 25;
                race_hour = 19;
                break;
            case 2:
                race_day = 26;
                race_hour = 12;
                break;
            case 3:
                race_day = 25;
                race_hour = 14;
                break;
            case 4:
                race_day = 25;
                race_hour = 16;
                break;
            case 5:
                race_day = 25;
                race_hour = 11;
                break;
            case 6:
                race_day = 26;
                race_hour = 11;
                break;
            default:
                race_day = 0;
                race_hour = 0;
                break;
        }
        //Set the race day and hour
        var futureOptions = {
            :year   => 2025,
            :month  => 4,
            :day    => race_day,
            :hour   => race_hour    // UTC offset, in this case for CST
        };
        //Calculate the remaining time
        var futureMoment = Gregorian.moment(futureOptions);
        var currentDateTime = Time.now();
        var duration_sec = futureMoment.subtract(currentDateTime).value();
        var duration_hour = duration_sec / 3600;
        var duration_days = duration_hour / 24;

        var time_left_string = Lang.format("$1$ DAYS LEFT", [duration_days]);

        if (duration_days <= 0) {
            time_left_string = Lang.format("$1$ HOURS LEFT", [duration_hour]);
        }
        //Draw the remaining time
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenHeight * screenX, screenWidth * screenY, 
                    Graphics.FONT_MEDIUM,
                    time_left_string,
                    Graphics.TEXT_JUSTIFY_CENTER
         );
    }




    
}

