// written by PDA Expert

function area52_newspawnbot()
{
    SpawnEntityFromTable("info_teleport_destination" {
	    origin = "-1595 2855 -300"
		angles = "0 -30 0"
	    targetname = "spawnbot_main_short"
		}
	)
	
	local teleport_trigger = SpawnEntityFromTable("trigger_teleport" {
	    origin = "-1460 3988 -117"
		target = "spawnbot_main_short"
		targetname = "spawnbot_main_short_teleport"
		SpawnFlags = "1"
		filtername = "filter_blueteam"
		}
	)
	
	teleport_trigger.KeyValueFromInt("solid", 2)
	teleport_trigger.KeyValueFromString("mins", "-600 -600 -600")
	teleport_trigger.KeyValueFromString("maxs", "600 600 600")
}

if(Entities.FindByName(null, "spawnbot_main_short") == null) 
{
    printl("Spawnbot Teleporter has been created!")
    area52_newspawnbot()
}