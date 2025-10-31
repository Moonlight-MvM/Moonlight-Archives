///////////////////////////////////////////////////////////////////////////////////////////////////////EXPECT THIS TO CHANGE AT ONE POINT///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////CAUSE I'M NOT DONE WITH IT AAAAAAA///////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nightsky_spawnbot_front()
{
    SpawnEntityFromTable("info_teleport_destination" {
        origin = "-5598 -831 151"
        angles = "0 -30 0"
        targetname = "spawnbot_main_short"
        }
    )

    local teleport_trigger = SpawnEntityFromTable("trigger_teleport" {
        origin = "-5679 -307 100"
        target = "spawnbot_main_short"
        targetname = "spawnbot_main_short_teleport"
        SpawnFlags = "1"
        filtername = "filter_blueteam"
        }
    )

    teleport_trigger.KeyValueFromInt("solid", 2)
    teleport_trigger.KeyValueFromString("mins", "-300 -200 -200")
    teleport_trigger.KeyValueFromString("maxs", "300 200 200")
}

if(Entities.FindByName(null, "spawnbot_main_short") == null)
{
    printl("Spawnbot Teleporter has been created!")
   nightsky_spawnbot_front()
}
::lol <- SpawnEntityFromTable("logic_timer",
{
	targetname = "blu_passage"
	refiretime = "0.2"
	"ontimer#1": "nuh_uh2,addoutput,renderfx 15,0,-1"
	"ontimer#2": "nuh_uh2,color,154 205 255,0,-1"
})
