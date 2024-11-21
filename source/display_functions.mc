import Toybox.Graphics;
import Toybox.Application.Storage;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.WatchUi as Ui;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Time as Time;

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

    function draw_remaining_time(dc, screenX, screenY, screenHeight, screenWidth) {
        
        var daysInMonths = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        var race_month = 4;
        var race_day = 26;
        var race_day_num = 0;
        var now = Time.now();
        
        
        var info = Calendar.info(now, Time.FORMAT_SHORT);
        //count the days left
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
        var x=screenHeight * screenX;
        var y=screenWidth * screenY;
        if(days_left == 0 || days_left == -1){
            dc.drawText(x,y, 
            Graphics.FONT_MEDIUM,
            "Race day",
            Graphics.TEXT_JUSTIFY_CENTER
            );
        }
        else if(days_left < -1){
        dc.drawText(x,y, 
        Graphics.FONT_MEDIUM,
        "Recover well",
        Graphics.TEXT_JUSTIFY_CENTER
         );
        }
        else{       
            var daysLeftStr = Lang.format("$1$ days left", [days_left]);
            dc.drawText(x,y, 
            Graphics.FONT_MEDIUM,
            daysLeftStr,
            Graphics.TEXT_JUSTIFY_CENTER
            );
        }
    }

}