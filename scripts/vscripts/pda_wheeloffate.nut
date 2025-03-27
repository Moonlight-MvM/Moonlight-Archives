// Wheel of Fate script by PDA Expert, for use in MVM missions.
// Inspired by the Wheel of Fate seen in Wizardy.

printl("Wheel script loaded succsesfully.")
PrecacheModel("models/props_lakeside_event/buff_plane.mdl")
//PrecacheModel("")

function filter_redspawn()
{
    SpawnEntityFromTable("filter_activator_tfteam" , {
            targetname = "filter_redteam"
        	negated = "0"
		    teamnum = "2"
        }
    )
}

if(Entities.FindByName(null, "filter_redteam") == null) 
{
  printl("No redteam filter under the name of filter_redteam was found, spawning in one for the sake of easier use!")
  filter_redspawn()
}

::wheeloffate_logic <- function(x, y, z, angx, angy, angz)  // magic numbers you set in the popfile.
{
	
	local wheel_card = SpawnEntityFromTable("prop_dynamic" {
	        targetname = "wheel_card"
			model = "models/props_lakeside_event/buff_plane.mdl"
			skin = "1"
			solid = 0
			startdisabled = 1
		}
	)
	
	wheel_card.SetLocalOrigin(Vector(x, y, z))
	wheel_card.SetLocalAngles(QAngle(angx, angy, angz))
	
	local wheel_sparks1 = SpawnEntityFromTable("info_particle_system" {
    	    targetname = "green_wof_sparks"
			effect_name = "green_wof_sparks"
		}
	)
	
	wheel_sparks1.SetLocalOrigin(Vector(x + 3, y - 18, z - 6))
	wheel_sparks1.SetLocalAngles(QAngle(angx, angy + 286, angz))
	

	local wheel_sparks2 = SpawnEntityFromTable("info_particle_system" {
    	    targetname = "green_wof_sparks"
			effect_name = "green_wof_sparks"
		}
	)
	
	wheel_sparks2.SetLocalOrigin(Vector(x - 8, y - 18, z - 6))
	wheel_sparks2.SetLocalAngles(QAngle(angx, angy + 247, angz))
	
	local wheel_steam1 = SpawnEntityFromTable("info_particle_system" {
    	    targetname = "green_steam_cap"
			effect_name = "green_steam_plume"
		}
	)
	
	wheel_steam1.SetLocalOrigin(Vector(x - 14, y + 18, z - 337))
	wheel_steam1.SetLocalAngles(QAngle(angx - 60, angy + 180, angz + 180))
	
	local wheel_steam2 = SpawnEntityFromTable("info_particle_system" {
    	    targetname = "green_steam_cap"
			effect_name = "green_steam_plume"
		}
	)
	
	wheel_steam2.SetLocalOrigin(Vector(x + 10, y + 18, z - 337))
	wheel_steam2.SetLocalAngles(QAngle(angx - 60, angy, angz))
	
	local wheel_plumes = SpawnEntityFromTable("ambient_generic" {
        targetname = "plumes_long"
		message = "Halloween.plumes_long"
		radius = 2500
		spawnflags = 48
		health = 10
    	}
	)
	
	local wheel_spin_sound = SpawnEntityFromTable("ambient_generic" {
        targetname = "wheel_of_doom_sound"
		message = "Halloween.WheelofFate"
		radius = 1250
		spawnflags = 49
		health = 10
    	}
	)
	
	local wheel_merasmus_babble = SpawnEntityFromTable("ambient_generic" {
        targetname = "merasmus_wheel_babble_sound"
		message = "Halloween.MerasmusWheelSpin"
		radius = 1250
		spawnflags = 49
		health = 10
    	}
	)
	
	SpawnEntityFromTable("logic_relay" {
	    targetname = "merasmus_wheel_babble"
		startdisabled = 1
		"OnTrigger": "merasmus_wheel_babble_sound,PlaySound,,0,-1"
		}
	)
	
	wheel_plumes.SetLocalOrigin(Vector(x - 2, y + 2, z - 345))
	wheel_spin_sound.SetLocalOrigin(Vector(x - 2, y + 2, z - 345))
	wheel_merasmus_babble.SetLocalOrigin(Vector(x - 2, y + 2, z - 345))

	SpawnEntityFromTable("logic_relay" {
	    targetname = "green_steam_cap_relay"
		"OnTrigger#1": "green_steam_cap,Start,,0,-1"
		"OnTrigger#2": "green_steam_cap,Stop,,3,-1"
		"OnTrigger#3": "green_steam_cap,Start,,3.25,-1"
		"OnTrigger#4": "green_steam_cap,Stop,,3.65,-1"
		"OnTrigger#5": "green_steam_cap,Stop,,4.5,-1"
		"OnTrigger#6": "green_steam_cap,Start,,4,-1"
		"OnTrigger#7": "green_wof_sparks,Start,,0,-1"
		"OnTrigger#8": "green_wof_sparks,Stop,,6.7,-1"
		"OnTrigger#9": "green_wof_sparks,Stop,,14,-1"
		"OnTrigger#10": "green_wof_sparks,Start,,6.75,-1"
		}
	)
	
	SpawnEntityFromTable("logic_case" {
        targetname = "case_wheel_random_card_nofinal"
		"OnCase01": "wheel_card,Skin,10,0,-1"
		"OnCase02": "wheel_card,Skin,11,0,-1"
		"OnCase03": "wheel_card,Skin,12,0,-1"
		"OnCase04": "wheel_card,Skin,13,0,-1"
		"OnCase05": "wheel_card,Skin,14,0,-1"
		"OnCase06": "wheel_card,Skin,15,0,-1"
    	}
	)	

	SpawnEntityFromTable("logic_case" {
        targetname = "case_wheel_random_card"
		"OnCase01": "wheel_card,Skin,2,0,-1"
		"OnCase02": "wheel_card,Skin,3,0,-1"
		"OnCase03": "wheel_card,Skin,4,0,-1"
		"OnCase04": "wheel_card,Skin,5,0,-1"
		"OnCase05": "wheel_card,Skin,6,0,-1"
		"OnCase06": "wheel_card,Skin,7,0,-1"
		"OnCase07": "wheel_card,Skin,8,0,-1"
		"OnCase08": "wheel_card,Skin,9,0,-1"
		"OnCase09": "case_wheel_random_card_nofinal,pickrandomshuffle,,0,-1"
		"OnCase10": "case_wheel_random_card_nofinal,pickrandomshuffle,,0,-1"
		"OnCase11": "case_wheel_random_card_nofinal,pickrandomshuffle,,0,-1"
		"OnCase12": "case_wheel_random_card_nofinal,pickrandomshuffle,,0,-1"
		"OnCase13": "case_wheel_random_card_nofinal,pickrandomshuffle,,0,-1"
		"OnCase14": "case_wheel_random_card_nofinal,pickrandomshuffle,,0,-1"
    	}
	)
	
	SpawnEntityFromTable("logic_relay" {
	    targetname = "relay_wheel_random_card"
		"OnTrigger#1": "case_wheel_random_card,pickrandomshuffle,,0,-1"
	}
	)
	
	SpawnEntityFromTable("logic_relay" {
     	    targetname = "relay_wheel_card_size"
			"OnTrigger#1": "wheel_card,SetModelScale,0.96,5.75,-1"
			"OnTrigger#2": "wheel_card,SetModelScale,0.94,5.36,-1"
			"OnTrigger#3": "wheel_card,SetModelScale,0.92,5.01,-1"
			"OnTrigger#4": "wheel_card,SetModelScale,0.90,4.67,-1"
			"OnTrigger#5": "wheel_card,SetModelScale,0.88,4.37,-1"
			"OnTrigger#6": "wheel_card,SetModelScale,0.86,4.07,-1"
			"OnTrigger#7": "wheel_card,SetModelScale,0.84,3.82,-1"
			"OnTrigger#8": "wheel_card,SetModelScale,0.82,3.58,-1"
			"OnTrigger#9": "wheel_card,SetModelScale,0.80,3.38,-1"
			"OnTrigger#10": "wheel_card,SetModelScale,0.78,3.2,-1"
			"OnTrigger#11": "wheel_card,SetModelScale,0.77,3.03,-1"
			"OnTrigger#12": "wheel_card,SetModelScale,0.76,2.97,-1"
			"OnTrigger#13": "wheel_card,SetModelScale,0.75,2.73,-1"
			"OnTrigger#14": "wheel_card,SetModelScale,0.74,2.58,-1"
			"OnTrigger#15": "wheel_card,SetModelScale,0.73,2.44,-1"
			"OnTrigger#16": "wheel_card,SetModelScale,0.72,2.3,-1"
			"OnTrigger#17": "wheel_card,SetModelScale,0.71,2.17,-1"
			"OnTrigger#18": "wheel_card,SetModelScale,0.70,2.05,-1"
			"OnTrigger#19": "wheel_card,SetModelScale,0.69,1.93,-1"
			"OnTrigger#20": "wheel_card,SetModelScale,0.68,1.71,-1"
			"OnTrigger#21": "wheel_card,SetModelScale,0.67,1.69,-1"
			"OnTrigger#22": "wheel_card,SetModelScale,0.66,1.58,-1"
			"OnTrigger#23": "wheel_card,SetModelScale,0.65,1.47,-1"
			"OnTrigger#24": "wheel_card,SetModelScale,0.64,1.36,-1"
			"OnTrigger#25": "wheel_card,SetModelScale,0.63,1.26,-1"
			"OnTrigger#26": "wheel_card,SetModelScale,0.62,1.15,-1"
			"OnTrigger#27": "wheel_card,SetModelScale,0.61,1.05,-1"
			"OnTrigger#28": "wheel_card,SetModelScale,0.60,0.95,-1"
			"OnTrigger#29": "wheel_card,SetModelScale,0.59,0.86,-1"
			"OnTrigger#30": "wheel_card,SetModelScale,0.58,0.76,-1"
			"OnTrigger#31": "wheel_card,SetModelScale,0.57,0.67,-1"
			"OnTrigger#32": "wheel_card,SetModelScale,0.56,0.58,-1"
			"OnTrigger#33": "wheel_card,SetModelScale,0.55,0.5,-1"
			"OnTrigger#34": "wheel_card,SetModelScale,0.54,0.41,-1"
			"OnTrigger#35": "wheel_card,SetModelScale,0.53,0.33,-1"
			"OnTrigger#36": "wheel_card,SetModelScale,0.52,0.24,-1"
			"OnTrigger#37": "wheel_card,SetModelScale,0.51,0.16,-1"
			"OnTrigger#38": "wheel_card,SetModelScale,0.5,0.07,-1"
     	}
	)
	
	SpawnEntityFromTable("logic_relay" {
	    targetname = "wheeloffate_spin"
		"OnTrigger#1": "wheel_card,setmodelscale,0.5,0.07,-1"
		"OnTrigger#2": "relay_wheel_card_size,trigger,,0.07,-1"
		"OnTrigger#3": "relay_wheel_random_card,Trigger,,0.07,-1"
		"OnTrigger#4": "relay_wheel_random_card,Trigger,,0.16,-1"
		"OnTrigger#5": "relay_wheel_random_card,Trigger,,0.24,-1"
		"OnTrigger#6": "relay_wheel_random_card,Trigger,,0.33,-1"
		"OnTrigger#7": "relay_wheel_random_card,Trigger,,0.41,-1"
		"OnTrigger#8": "relay_wheel_random_card,Trigger,,0.50,-1"
		"OnTrigger#9": "relay_wheel_random_card,Trigger,,0.58,-1"
		"OnTrigger#10": "relay_wheel_random_card,Trigger,,0.67,-1"
		"OnTrigger#11": "relay_wheel_random_card,Trigger,,0.76,-1"
		"OnTrigger#12": "relay_wheel_random_card,Trigger,,0.86,-1"
		"OnTrigger#13": "relay_wheel_random_card,Trigger,,0.95,-1"
		"OnTrigger#14": "relay_wheel_random_card,Trigger,,1.05,-1"
		"OnTrigger#15": "relay_wheel_random_card,Trigger,,1.15,-1"
		"OnTrigger#16": "relay_wheel_random_card,Trigger,,1.26,-1"
		"OnTrigger#17": "relay_wheel_random_card,Trigger,,1.36,-1"
		"OnTrigger#18": "relay_wheel_random_card,Trigger,,1.47,-1"
		"OnTrigger#19": "relay_wheel_random_card,Trigger,,1.58,-1"
		"OnTrigger#20": "relay_wheel_random_card,Trigger,,1.69,-1"
		"OnTrigger#21": "relay_wheel_random_card,Trigger,,1.71,-1"
		"OnTrigger#22": "relay_wheel_random_card,Trigger,,1.93,-1"
		"OnTrigger#23": "relay_wheel_random_card,Trigger,,2.05,-1"
		"OnTrigger#24": "relay_wheel_random_card,Trigger,,2.17,-1"
		"OnTrigger#25": "relay_wheel_random_card,Trigger,,2.30,-1"
		"OnTrigger#26": "relay_wheel_random_card,Trigger,,2.44,-1"
		"OnTrigger#27": "relay_wheel_random_card,Trigger,,2.58,-1"
		"OnTrigger#28": "relay_wheel_random_card,Trigger,,2.73,-1"
		"OnTrigger#29": "relay_wheel_random_card,Trigger,,2.97,-1"
		"OnTrigger#30": "relay_wheel_random_card,Trigger,,3.03,-1"
		"OnTrigger#31": "relay_wheel_random_card,Trigger,,3.2,-1"
		"OnTrigger#32": "relay_wheel_random_card,Trigger,,3.38,-1"
		"OnTrigger#33": "relay_wheel_random_card,Trigger,,3.58,-1"
		"OnTrigger#34": "relay_wheel_random_card,Trigger,,3.82,-1"
		"OnTrigger#35": "relay_wheel_random_card,Trigger,,4.07,-1"
		"OnTrigger#36": "relay_wheel_random_card,Trigger,,4.37,-1"
		"OnTrigger#37": "relay_wheel_random_card,Trigger,,4.67,-1"
		"OnTrigger#38": "case_wheel_random_card_nofinal,pickrandomshuffle,,5.75,-1"
		"OnTrigger#39": "green_steam_cap_relay,Trigger,,0,-1"
		"OnTrigger#40": "plumes_long,PlaySound,,0,-1"
		"OnTrigger#41": "wheel_of_doom_sound,PlaySound,,0,-1"
		"OnTrigger#42": "merasmus_wheel_babble,Trigger,,0,-1" // this is disabled by default.
		"OnTrigger#43": "wheel_card,Enable,,0.08,-1"
		"OnTrigger#44": "case_wheel_random_card_nofinal,pickrandomshuffle,,5.01,-1"
		"OnTrigger#45": "case_wheel_random_card_nofinal,pickrandomshuffle,,5.36,-1"
     	}
	)
	
	SpawnEntityFromTable("logic_relay" {
	        targetname = "relay_wheel_final"
			"OnTrigger#1": "wheel_card,setmodelscale,1,0,-1"
			"OnTrigger#2": "wheel_effect_trigger,enable,,1,-1"
			"OnTrigger#3": "relay_wheel_timer,enable,,1,-1"
			"OnTrigger#4": "wheel_effect_trigger,disable,,1.5,-1"
    	}
	)
	
	SpawnEntityFromTable("logic_relay" {
	        targetname = "relay_wheel_refresh"
			"OnTrigger#1": "wheel_effect_trigger,kill,,0.5,-1"
			"OnTrigger#2": "wheel_card,disable,,0,-1"
			"OnTrigger#3": "relay_wheel_timer,disable,,0,-1"
			"OnTrigger#4": "wheel_lowgravity_effect,disable,,0,-1"
			"OnTrigger#5": "wheel_lowgravity_effect,kill,,1,-1"
			"OnTrigger#6": "wheel_resetgravity,Enable,,0.5,-1"
			"OnTrigger#7": "wheel_attribute_clear,Enable,,0.5,-1"
			"OnTrigger#8": "wheel_attribute_clear,Kill,,2,-1"
			"OnTrigger#9": "wheel_attribute_effect,Disable,,0,-1"
			"OnTrigger#10": "wheel_attribute_effect,Kill,,0.5,-1"
    	}
	)
	
	SpawnEntityFromTable("logic_timer" {
	        targetname = "relay_wheel_timer"
			refiretime = 1
			startdisabled = 1
			"OnTimer#1": "wheel_effect_trigger,enable,,0,-1"
			"OnTimer#2": "wheel_effect_trigger,disable,,0.5,-1"
			"OnTimer#3": "wheel_attribute_effect,enable,,0,-1"
			"OnTimer#4": "wheel_attribute_effect,disable,,0.5,-1"
    	}
	)
	
    local wheel_ngtrigger = SpawnEntityFromTable("trigger_gravity" {
	        targetname = "wheel_resetgravity"
	    	spawnflags = "1"
	    	startdisabled = "0"
			gravity = "1"
        }
    )
	
    wheel_ngtrigger.KeyValueFromInt("solid", 2)
    wheel_ngtrigger.KeyValueFromString("mins", "-9999 -9999 -9999")
    wheel_ngtrigger.KeyValueFromString("maxs", "9999 9999 9999")
	
	printl("Wheel spawned!")
}

::wheel_generic <- function()
{	
	EntFire("wheeloffate_spin", "trigger" , "null", 0,-1)
	EntFire("relay_wheel_card_size", "trigger", "null", 0,-1)
	EntFire("relay_wheel_final", "trigger", "null", 6.75,-1)   
}

::wheel_customeffect <- function(condition, filter, cardskin) // set team filter via popfile
{
    wheel_generic()
	EntFire("wheel_card","Skin", cardskin,6.75,-1)
	
    local wheel_effects = SpawnEntityFromTable("trigger_add_tf_player_condition" {
	        targetname = "wheel_effect_trigger"
	    	duration = "2"
	    	spawnflags = "1"
	    	startdisabled = "1"
			filtername = filter
			//"OnTrigger": format("!activator,RunScriptCode,condthink(%d),,0,-1", condition)
        }
    )
	
    wheel_effects.KeyValueFromInt("solid", 2)
    wheel_effects.KeyValueFromString("mins", "-9999 -9999 -9999")
    wheel_effects.KeyValueFromString("maxs", "9999 9999 9999")
    wheel_effects.KeyValueFromInt("condition", condition)
}

::wheel_critboost <- function()
{
	wheel_customeffect(56,"filter_redteam",8)
}

::wheel_uber <- function()
{
	wheel_customeffect(57,"filter_redteam",7)
}

::wheel_superspeed <- function(filter)
{
	wheel_customeffect(32,filter,4)
	EntFire("wheel_attribute_effect","enable",null,7.75,-1)
	EntFire("wheel_attribute_effect","disable",null,8.25,-1)
	
    local wheel_attribute = SpawnEntityFromTable("trigger_add_or_remove_tf_player_attributes" {
	        targetname = "wheel_attribute_effect"
	    	duration = "2"
			value = "3"
	    	spawnflags = "1"
	    	startdisabled = "1"
			filtername = filter
			attribute_name = "major move speed bonus"
			add_or_remove = "0"
        }
    )
	
    wheel_attribute.KeyValueFromInt("solid", 2)
    wheel_attribute.KeyValueFromString("mins", "-9999 -9999 -9999")
    wheel_attribute.KeyValueFromString("maxs", "9999 9999 9999")    
	
	local wheel_remove_attr = SpawnEntityFromTable("trigger_add_or_remove_tf_player_attributes" {
	        targetname = "wheel_attribute_clear"
			value = "3"
	    	spawnflags = "1"
	    	startdisabled = "1"
			filtername = filter
			attribute_name = "major move speed bonus"
			add_or_remove = "1"
        }
    )
	
    wheel_remove_attr.KeyValueFromInt("solid", 2)
    wheel_remove_attr.KeyValueFromString("mins", "-9999 -9999 -9999")
    wheel_remove_attr.KeyValueFromString("maxs", "9999 9999 9999")    
}

::wheel_superspeed_red <- function()
{
    wheel_superspeed("filter_redteam")
}

::wheel_superspeed_blu <- function()
{
    wheel_superspeed("filter_bluteam")
}

::wheel_superspeed_all <- function()
{
    wheel_superspeed(null)
}

::wheel_bighead <- function()
{
	wheel_customeffect(84,"filter_redteam",6)
}

// low gravity is unqiue in the sense that it requires a seperate trigger for it to work, we'll have to make do here. 
// note : not so unqiue now, eh?

::wheel_lowgravity <- function()
{

	EntFire("wheeloffate_spin", "trigger" , "null", 0,-1)
	EntFire("wheel_resetgravity", "Disable" , "null", 2,-1)
	EntFire("relay_wheel_card_size", "trigger", "null", 0,-1)
	EntFire("wheel_card","Skin", 5,6.75,-1)
	EntFire("wheel_card","setmodelscale", 1,6.75,-1)
	EntFire("wheel_lowgravity_effect","Enable", "null",7.75,-1)
	
    local wheel_lgtrigger = SpawnEntityFromTable("trigger_gravity" {
	        targetname = "wheel_lowgravity_effect"
	    	spawnflags = "1"
	    	startdisabled = "1"
			gravity = "0.2"
        }
    )
	
    wheel_lgtrigger.KeyValueFromInt("solid", 2)
    wheel_lgtrigger.KeyValueFromString("mins", "-9999 -9999 -9999")
    wheel_lgtrigger.KeyValueFromString("maxs", "9999 9999 9999")
}

// custom, ones that don't appear normally.

// this one's getting replaced by a more, accurate super speed.

::wheel_superspeed_wizardy <- function()
{
	wheel_customeffect(32,"filter_redteam",4)
}

::wheel_superduperspeed <- function()
{
	wheel_customeffect(72,"filter_redteam",4)
}

::wheel_dodge <- function()
{
	wheel_customeffect(79,"filter_redteam",14)
}

// replacement for jarate, basically.

::wheel_markfordeath <- function()
{
	wheel_customeffect(30,"filter_redteam",1)
}

::wheel_madmilk <- function()
{
	wheel_customeffect(27,"filter_redteam",1)
}

::wheel_jarate <- function()
{
	wheel_customeffect(24,"filter_redteam",1)
}

::wheel_fish <- function()
{
	wheel_customeffect(86,"filter_redteam",10)
}

::wheel_flight <- function()
{
	wheel_customeffect(107,"filter_redteam",2)
}