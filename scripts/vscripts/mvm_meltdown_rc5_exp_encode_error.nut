///////////////////////////////////////////////////////////////////////////////////////////////////////Vscript setup written by Mo/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////For Oddschool's Meltdown Expert///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
local ent = Entities.FindByClassname(null, "tf_objective_resource")
if (ent)
{
    NetProps.SetPropString(ent, "m_iszMvMPopfileName", "Encode Error (Expert)")
}
function anti_oob() //Out of Bounds trigger teleport, to avoid exploiters
{
    SpawnEntityFromTable("info_teleport_destination" {
        origin = "-1719 5388 -99"
        angles = "0 -30 0"
        targetname = "go_kys" //Charming, right?
        }
    )
    
    local teleport_trigger = SpawnEntityFromTable("trigger_teleport" {
        origin = "-3170 5424 481"
        target = "go_kys"
        targetname = "go_kys_teleport"
        SpawnFlags = "1"
        filtername = "filter_bluteam"
        }
    )
    
    teleport_trigger.KeyValueFromInt("solid", 2)
    teleport_trigger.KeyValueFromString("mins", "-300 -200 -100")
    teleport_trigger.KeyValueFromString("maxs", "300 200 100")
}

if(Entities.FindByName(null, "go_kys") == null) 
{
    printl("Spawnbot Teleporter has been created!")
	anti_oob()
}
local forcefield_trigger1 = SpawnEntityFromTable("func_forcefield", //Anti-cheese stuck Force field. And also a Force field for Red & Blu for the pit area
{
	targetname = "forcefieldmid"
	origin = "-1719 5388 -150"
	rendermode = "10"
	TeamNum = "3"
	spawnflags = "1"
})
forcefield_trigger1.KeyValueFromInt("solid", 2)
forcefield_trigger1.KeyValueFromString("mins", "-100 -100 -100")
forcefield_trigger1.KeyValueFromString("maxs", "100 100 100")

local forcefield_trigger1 = SpawnEntityFromTable("func_forcefield",
{
	targetname = "forcefieldmid"
	origin = "-1840 5360 124"
	rendermode = "10"
	TeamNum = "3"
	spawnflags = "1"
})
forcefield_trigger1.KeyValueFromInt("solid", 2)
forcefield_trigger1.KeyValueFromString("mins", "-1 -100 -200")
forcefield_trigger1.KeyValueFromString("maxs", "1 100 200")

local forcefield_trigger2 = SpawnEntityFromTable("func_forcefield",
{
	targetname = "forcefieldmid"
	origin = "-1840 5360 124"
	rendermode = "10"
	TeamNum = "2"
	spawnflags = "1"
})
forcefield_trigger2.KeyValueFromInt("solid", 2)
forcefield_trigger2.KeyValueFromString("mins", "-1 -100 -200")
forcefield_trigger2.KeyValueFromString("maxs", "1 100 200") //Force Field setups end here

local nobuild_trigger3 = SpawnEntityFromTable("func_nobuild", //Nobuild for Red players to stuck people on the Force Field
{
	StartDisabled	= "0"
	AllowTeleporters	= "0"
	AllowSentry	="0"
	AllowDispenser	= "0"
	targetname = "nobuildmid"
	origin = "-1705 5359 0"
	rendermode = "10"
	TeamNum = "2"
	spawnflags = "1"
})
nobuild_trigger3.KeyValueFromInt("solid", 2)
nobuild_trigger3.KeyValueFromString("mins", "-200 -200 -200")
nobuild_trigger3.KeyValueFromString("maxs", "200 200 200")

local point_text = SpawnEntityFromTable("point_worldtext",
{
	targetname = "text_example"
	origin = "-1686 5420 -31"
	angles = "0 0 0"
	message = ""
	textsize = "10"
})

local point_text = SpawnEntityFromTable("point_worldtext",
{
	targetname = "text_example"
	origin = "-1774 5526 -31"
	angles = "0 90 0"
	message = ""
	textsize = "10"
})

local point_text = SpawnEntityFromTable("point_worldtext",
{
	targetname = "text_example"
	origin = "-1714 5240 -31"
	angles = "0 -90 0"
	message = ""
	textsize = "10"
})

local point_text = SpawnEntityFromTable("point_worldtext",
{
	targetname = "text_example"
	origin = "-1755 5386 -151"
	angles = "90 0 0"
	message = "Dumbass"
	textsize = "10"
})