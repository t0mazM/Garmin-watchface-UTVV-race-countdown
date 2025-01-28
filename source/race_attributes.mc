//Race attributes. All saved in dictionary
// You can add a custum photo to all races, but I have added only one

var raceAttributes = {
    0 => { 
        :name => "EMPEROR", 
        :bitmap => Rez.Drawables.emperor_logo, 
        :colour => 0x005500, 
        :race_day => 25, 
        :race_hour => 19,
    },
    1 => { 
        :name => "CENTURION", 
        :bitmap => Rez.Drawables.emperor_logo, 
        //:bitmap => Rez.Drawables.centurion_logo, 
        :colour => 0x1c455e, 
        :race_day => 25, 
        :race_hour => 23, 
    },
    2 => { 
        :name => "GLADIATOR", 
        :bitmap => Rez.Drawables.emperor_logo, 
        //:bitmap => Rez.Drawables.gladiator_logo, 
        :colour => 0x55AA55, //0x3a7b58, 
        :race_day => 26, 
        :race_hour => 15,
    },
    3 => { 
        :name => "LEGIONAR", 
        :bitmap => Rez.Drawables.emperor_logo, 
        //:bitmap => Rez.Drawables.legion_logo, 
        :colour => 0xaaff00, //0xaacc57, 
        :race_day => 26, 
        :race_hour => 15, 
    },
    4 => { 
        :name => "ASTERIX", 
        :bitmap => Rez.Drawables.emperor_logo, 
        //:bitmap => Rez.Drawables.asterix_logo, 
        :colour => 0xaaff00, //0xd0e498, 
        :race_day => 26, 
        :race_hour => 15, 
    },
};