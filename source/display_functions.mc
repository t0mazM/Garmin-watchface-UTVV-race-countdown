import Toybox.Graphics;
import Toybox.Application.Storage;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.WatchUi as Ui;
using Toybox.Time as Time;
using Toybox.Time.Gregorian;
import Toybox.Weather;
using Toybox.UserProfile;
using Toybox.Time.Gregorian as Calendar;

class display_functions {

    function draw_race_option(dc, raceOption, screenX, screenY, screenHeight, screenWidth) {
        dc.drawBitmap(screenHeight * screenX, screenWidth * screenY, Ui.loadResource(raceAttributes[raceOption][:bitmap]));
    }   

    function draw_race_name(dc, raceOption, screenX, screenY, screenHeight, screenWidth) {
        var raceStr = raceAttributes[raceOption][:name]; 
        var utvvFont = Ui.loadResource(Rez.Fonts.utvvfont);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenHeight * screenX, screenWidth * screenY, 
        utvvFont,
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
    digitalFont = Ui.loadResource(Rez.Fonts.clockfont);

    // Draw the hours
    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    dc.drawText(screenHeight * screenX, screenWidth * screenY, 
                digitalFont,
                hours,
                Graphics.TEXT_JUSTIFY_VCENTER|Graphics.TEXT_JUSTIFY_CENTER
    );
    // draw minutes below hours
    dc.setColor(minColour, Graphics.COLOR_TRANSPARENT);
    dc.drawText(screenHeight * screenX, screenWidth * screenY +48, 
                digitalFont,
                minutes,
                Graphics.TEXT_JUSTIFY_VCENTER|Graphics.TEXT_JUSTIFY_CENTER
    );
}

    function draw_remaining_time(dc, raceOption, screenX, screenY, screenHeight, screenWidth) {

        var utvvFont = Ui.loadResource(Rez.Fonts.utvvfont);

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

        if(duration_days == 1){
            time_left_string = Lang.format("$1$ DAY LEFT", [duration_days]);
        }
        if (duration_days <= 0) {
            time_left_string = Lang.format("$1$ HOURS LEFT", [duration_hour]);
        }
        if (duration_days <= 0 and duration_hour <= 1) {
            time_left_string = Lang.format("$1$ HOUR LEFT", [duration_hour]);
        }
        if (currentDateTime.greaterThan(futureMoment) ) { 
            time_left_string = "RECOVER WELL";
        }

        //Draw the remaining time
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenHeight * screenX, screenWidth * screenY, 
                    utvvFont,
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

    function draw_datapoint(dc, dataOption, screenX, screenY, screenHeight, screenWidth) {
        var position, today;
        var dataString = "---";
        var dataNumber = 9999;

        switch(iconsDict[dataOption][:name]) {
        case "Steps":
            dataNumber = ActivityMonitor.getInfo().steps;
            break;
        case "Floors climbed":
            dataString = ActivityMonitor.getInfo().floorsClimbed;
            break;
        case "Activity time":
            dataString = ActivityMonitor.getInfo().activeMinutesDay.total;
            break;
        case "Heart rate":
            dataString = Activity.getActivityInfo().currentHeartRate;
            break;
        case "Notifications":
            dataNumber = Toybox.System.getDeviceSettings().notificationCount;
            break;
        case "Calories burned":
            dataNumber = ActivityMonitor.getInfo().calories;
            break;
        case "Battery level":
            dataString = System.getSystemStats().battery.format( "%2d" );
            break;
        case "Temperature":
                var temp = Weather.getCurrentConditions().feelsLikeTemperature;
                var unit = "";
                var TempMetric = System.getDeviceSettings().temperatureUnits;

                if (TempMetric == System.UNIT_METRIC){
                    unit = "°C";
                    
                } else {
                    unit = "°F";
                    temp = temp * 9/5 + 32;
                }
                dataString = Lang.format("$1$ $2$", [temp, unit]);

                break;
            case "Sunrise time": 
				position = Toybox.Weather.getCurrentConditions().observationLocationPosition; // or Activity.Info.currentLocation if observation is null?
				today = Toybox.Weather.getCurrentConditions().observationTime; // or new Time.Moment(Time.now().value()); ?
				if (position!=null and today!=null){
					if (Weather.getSunrise(position, today)!=null) {
						var sunRise = Time.Gregorian.info(Weather.getSunrise(position, today), Time.FORMAT_SHORT);
						dataString = Lang.format("$1$:$2$",[sunRise.hour.format("%02u"), sunRise.min.format("%02u")]);
					} else {
						dataString = 7; 
					}
                }
                break;
            case "Sunset time":
				position = Toybox.Weather.getCurrentConditions().observationLocationPosition; // or Activity.Info.currentLocation if observation is null?
				today = Toybox.Weather.getCurrentConditions().observationTime; // or new Time.Moment(Time.now().value()); ?
				if (position!=null and today!=null){
					if (Weather.getSunset(position, today)!=null) {
						var sunSet = Time.Gregorian.info(Weather.getSunset(position, today), Time.FORMAT_SHORT);
						dataString = Lang.format("$1$:$2$",[sunSet.hour.format("%02u"), sunSet.min.format("%02u")]);
					} else {
						dataString = 18; 
					}
                }
                break;
            case "Stress level":
                dataString = ActivityMonitor.getInfo().timeToRecovery;
                break;
            case "VO2 max":
                dataString = UserProfile.getProfile().vo2maxRunning;
                break;
            default:
                dataString = "0";
                break;
        }
    
    var iconFont = Ui.loadResource(Rez.Fonts.iconfont);
    var utvvFont = Ui.loadResource(Rez.Fonts.utvvfont);

        if (dataNumber >= 1000 and dataNumber != 9999) {
            dataNumber = dataNumber / 1000;
            dataString = dataNumber.format("%.1f");
            dataString = Lang.format("$1$k", [dataString]);
        }

    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    //Draw icon
    dc.drawText(screenHeight * screenX, screenWidth * screenY, 
                iconFont,
                iconsDict[dataOption][:iconNumber],
                Graphics.TEXT_JUSTIFY_VCENTER|Graphics.TEXT_JUSTIFY_CENTER
    );
    //Draw data
    if(dataString == null){
        dataString = "---";
    }
    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    dc.drawText(screenHeight * (screenX + 0.08), screenWidth * screenY, 
                utvvFont,
                Lang.format("$1$", [dataString]),
                Graphics.TEXT_JUSTIFY_VCENTER|Graphics.TEXT_JUSTIFY_LEFT
    );
}

    function draw_date(dc, screenX, screenY, screenHeight, screenWidth) {

        var now = Time.now();
        var info = Calendar.info(now, Time.FORMAT_MEDIUM);
        var dateStr = Lang.format("$1$ $2$.$3$", [info.day_of_week, info.day, info.month]);
        var utvvFont = Ui.loadResource(Rez.Fonts.utvvfont);
        
        // Convert the date string to uppercase
        dateStr = dateStr.toUpper();
        
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                    dc.drawText(screenHeight * screenX, screenWidth * screenY,
                    utvvFont,
                    dateStr,
                    Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER
         );
    }

}




