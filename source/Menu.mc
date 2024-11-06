// import Toybox.WatchUi;
// import Toybox.Application;
// import Toybox.Graphics;
// import Toybox.System;
// import Toybox.WatchUi;
// import Toybox.Application;
// import Toybox.Application.Properties;
// import Toybox.Graphics;
// import Toybox.System;
// import Toybox.Lang;


// var layoutId = "EMPEROR";

// class SimpleSettingsMenu extends WatchUi.Menu2 {
//     function initialize() {
//         Menu2.initialize({ :title => "Choose your race:" });

//         // Main menu items
//         Menu2.addItem(menuItem("EMPEROR", " EMPEROR", "160 km, 6400 m"));
//         Menu2.addItem(menuItem("CENTURION",  "CENTURION", "110 km, 4500 m"));
//         Menu2.addItem(menuItem("GLADIATOR",  "GLADIATOR", "60 km, 2400 m"));
//         Menu2.addItem(menuItem("CENTURION",  "LEGIONAR", "30 km, 1600 m"));
//         Menu2.addItem(menuItem("ASTERIX",  "ASTERIX", "15 km, 250 m"));
//         Menu2.addItem(menuItem("CASTRA",  "CASTRA CITY RUN", "10 km, 150 m"));
//         Menu2.addItem(menuItem("KIDS",  "KIDS RUN", "2 km, 50 m"));
//         Menu2.addItem(menuItem("HIKE",  "HIKE & WINE – OBELIX", "11km, 100 m"));
        
//     //     Menu2.addItem(toggleItem("showSeconds", "Show Seconds", "Enabled", "Disabled", true)); // Default to "Enabled"
//      }

//     function menuItem(id, label, subLabel) {
//         return new WatchUi.MenuItem(label, subLabel, id, null);
//     }

//     function toggleItem(id, label, enabledSubLabel, disabledSubLabel, defaultState) {
//         return new WatchUi.ToggleMenuItem(label, { :enabled => enabledSubLabel, :disabled => disabledSubLabel }, id, defaultState, null);
//     }

//     function getThemeString(themeId) {
//         var themes = ["Expanse", "Earth", "Mars", "Belt"];
//         return themes[themeId];
//     }
// }


// class SimpleSettingsDelegate extends WatchUi.Menu2InputDelegate {
//     function initialize() {
//         Menu2InputDelegate.initialize();
//     }

//     function onSelect(item) {
//         //layoutId = item.getId();
//         if (item.getId().equals("layoutSettings")){
//              layoutId = "CENTURION";
//         }
//     }
// }

// // import Toybox.WatchUi;
// // import Toybox.System;

// // class MenuView extends WatchUi.Menu2 {
// //     //! This constructor initializes the menu with items and their respective callbacks.
// //     public function initialize() {
// //         var menuItems = [
// //             { :label => "5K", :callback => method(:onSelect5K) },
// //             { :label => "10K", :callback => method(:onSelect10K) },
// //             { :label => "Half Marathon", :callback => method(:onSelectHalfMarathon) },
// //             { :label => "Marathon", :callback => method(:onSelectMarathon) }
// //         ];

// //         // Call the superclass constructor to set up the menu.
// //         WatchUi.Menu2.initialize(menuItems);
// //     }

// //     //! Callback for selecting the 5K option.
// //     private function onSelect5K() as Void {
// //         System.println("5K selected");
// //         // Add any relevant actions or logic here
// //     }

// //     //! Callback for selecting the 10K option.
// //     private function onSelect10K() as Void {
// //         System.println("10K selected");
// //         // Add any relevant actions or logic here
// //     }

// //     //! Callback for selecting the Half Marathon option.
// //     private function onSelectHalfMarathon() as Void {
// //         System.println("Half Marathon selected");
// //         // Add any relevant actions or logic here
// //     }

// //     //! Callback for selecting the Marathon option.
// //     private function onSelectMarathon() as Void {
// //         System.println("Marathon selected");
// //         // Add any relevant actions or logic here
// //     }
// // }
