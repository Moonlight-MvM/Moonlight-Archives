
//This is the Vscript file for the MvM mission: Sporulation
//Author: Quantum Apple
//This is basically just adds some decorations and music
//Big thanks to Timey for helping write a lot of the logic
//V3.2


////////////////////////////
//  Mission Name Display  //
////////////////////////////

local ent = Entities.FindByClassname(null, "tf_objective_resource")
if (ent)
{
    NetProps.SetPropString(ent, "m_iszMvMPopfileName", "Exp Sporulation")
}

//////////////////
//  Decoration  //
//////////////////

//Right upgrade station decoration
function spawnengineer()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "engineer"
        model = "models/player/engineer.mdl"
        origin = Vector(805,-553,70)
        angles = "0 270 0"
        DefaultAnim = "competitive_loserstate_idle"
        DisableBoneFollowers = 1
        Skin = 4 //red zombie model
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "engineer"
        model = "models/workshop/player/items/all_class/hwn2016_toadstool_topper/hwn2016_toadstool_topper_engineer.mdl"
        targetname = "mushroom_cap"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "engineer"
        model = "models/player/items/engineer/engineer_zombie.mdl"
        targetname = "zombie"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}

//Left upgrade station decoration
function spawnheavy()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "heavy"
        model = "models/player/heavy.mdl"
        origin = Vector(-640,-564,237)
        angles = "180 90 0"
        DisableBoneFollowers = 1
        Skin = 4
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "heavy"
        model = "models/workshop/player/items/all_class/hwn2016_toadstool_topper/hwn2016_toadstool_topper_heavy.mdl"
        targetname = "mushroom_cap"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "heavy"
        model = "models/player/items/heavy/heavy_zombie.mdl"
        targetname = "zombie"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}

//Forward upgrade station decoration
function spawnsoldier()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "soldier"
        model = "models/player/soldier.mdl"
        origin = Vector(819,3091,113)
        angles = "0 270 0"
        DefaultAnim = "competitive_loserstate_idle"
        DisableBoneFollowers = 1
        SetBodyGroup = 2 //doesn't show helmet to prevent clipping with cosmetic
        Skin = 4 //red zombie model
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "soldier"
        model = "models/workshop/player/items/all_class/hwn2016_toadstool_topper/hwn2016_toadstool_topper_soldier.mdl"
        targetname = "mushroom_cap"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "soldier"
        model = "models/player/items/soldier/soldier_zombie.mdl"
        targetname = "zombie"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}

function spawndemo()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "demo"
        model = "models/player/demo.mdl"
        origin = Vector(983,3091,113)
        angles = "0 270 0"
        DefaultAnim = "competitive_loserstate_idle"
        DisableBoneFollowers = 1
        Skin = 4 //red zombie model
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "demo"
        model = "models/workshop/player/items/all_class/hwn2016_toadstool_topper/hwn2016_toadstool_topper_demo.mdl"
        targetname = "mushroom_cap"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "demo"
        model = "models/player/items/demo/demo_zombie.mdl"
        targetname = "zombie"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}

//A-posing heavies, always funny
function spawncouncil()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "idler1"
        model = "models/player/heavy.mdl"
        origin = Vector(720,1184,105)
        angles = "0 180 0"
        DisableBoneFollowers = 1
    })
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "idler2"
        model = "models/player/heavy.mdl"
        origin = Vector(720,1244,105)
        angles = "0 180 0"
        DisableBoneFollowers = 1
        //Skin = 1
    })
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "idler3"
        model = "models/player/heavy.mdl"
        origin = Vector(720,1124,105)
        angles = "0 180 0"
        DisableBoneFollowers = 1
        //Skin = 1
    })
}

//just some extra decoration

function spawnspy()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "spy"
        model = "models/player/spy.mdl"
        origin = Vector(927,1380,86)
        angles = "0 220 0"
        DefaultAnim = "competitive_loserstate_idle"
        DisableBoneFollowers = 1
        SetBodyGroup = 1 //give the spy a mask
        Skin = 22 //red zombie spy mask
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "spy"
        model = "models/workshop/player/items/all_class/hwn2016_toadstool_topper/hwn2016_toadstool_topper_spy.mdl"
        targetname = "mushroom_cap"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "spy"
        model = "models/player/items/spy/spy_zombie.mdl"
        targetname = "zombie"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}

function spawnscout()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "scout"
        model = "models/player/scout.mdl"
        origin = Vector(651,2105,151)
        angles = "90 180 260"
        DisableBoneFollowers = 1
        Skin = 4 //red zombie model
    })  
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "scout"
        model = "models/workshop/player/items/all_class/hwn2016_toadstool_topper/hwn2016_toadstool_topper_scout.mdl"
        targetname = "mushroom_cap"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "scout"
        model = "models/player/items/scout/scout_zombie.mdl"
        targetname = "zombie"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}

function spawnsniper()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "sniper"
        model = "models/player/sniper.mdl"
        origin = Vector(1249,3330,-58)
        angles = "0 180 0"
        DisableBoneFollowers = 1
        DefaultAnim = "competitive_winnerstate_idle"
        Skin = 4 //red zombie model
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "sniper"
        model = "models/weapons/w_models/w_sniperrifle.mdl"
        targetname = "sniper_rifle"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })  
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "sniper"
        model = "models/player/items/sniper/xms_sniper_commandobackpack.mdl"
        targetname = "cozy_camper"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })  
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "sniper"
        model = "models/workshop/player/items/all_class/hwn2016_toadstool_topper/hwn2016_toadstool_topper_sniper.mdl"
        targetname = "mushroom_cap"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "sniper"
        model = "models/player/items/sniper/sniper_zombie.mdl"
        targetname = "zombie"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}

function spawnpyro()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "pyro"
        model = "models/player/pyro.mdl"
        origin = Vector(1723,638,400)
        angles = "0 160 0"
        DisableBoneFollowers = 1
        DefaultAnim = "competitive_winnerstate_idle"
        Skin = 4 //red zombie model
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "pyro"
        model = "models/weapons/c_models/c_flamethrower/c_flamethrower.mdl"
        targetname = "flamethrower"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })   
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "pyro"
        model = "models/workshop/player/items/all_class/hwn2016_toadstool_topper/hwn2016_toadstool_topper_pyro.mdl"
        targetname = "mushroom_cap"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "pyro"
        model = "models/player/items/pyro/pyro_zombie.mdl"
        targetname = "zombie"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}

function spawnape()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "monke1"
        model = "models/player/pyro.mdl"
        origin = Vector(2054,709,400)
        angles = "0 200 0"
        DefaultAnim = "competitive_loserstate_idle"
        DisableBoneFollowers = 1
        SetBodyGroup = 1 //doesn't show head to prevent clipping with cosmetic
        //Skin = 4 //red zombie model
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "monke1"
        model = "models/weapons/c_models/c_gascan/c_gascan.mdl"
        targetname = "gas"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "monke1"
        model = "models/workshop/player/items/soldier/hwn2021_poopy_doe/hwn2021_poopy_doe.mdl"
        targetname = "apehead"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })

    SpawnEntityFromTable("prop_dynamic", {
        targetname = "monke2"
        model = "models/player/pyro.mdl"
        origin = Vector(2054,949,400)
        angles = "0 230 0"
        DefaultAnim = "competitive_loserstate_idle"
        DisableBoneFollowers = 1
        SetBodyGroup = 1 //doesn't show head to prevent clipping with cosmetic
        //Skin = 4 //red zombie model
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "monke2"
        model = "models/weapons/c_models/c_gascan/c_gascan.mdl"
        targetname = "gas"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "monke2"
        model = "models/workshop/player/items/soldier/hwn2021_poopy_doe/hwn2021_poopy_doe.mdl"
        targetname = "apehead"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}

function spawnmedic()
{
    SpawnEntityFromTable("prop_dynamic", {
        targetname = "medic"
        model = "models/player/medic.mdl"
        origin = Vector(-1997,-399,-126)
        angles = "0 40 0"
        DefaultAnim = "competitive_loserstate_idle"
        DisableBoneFollowers = 1
        Skin = 4 //red zombie model
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "medic"
        model = "models/workshop/player/items/all_class/hwn2016_toadstool_topper/hwn2016_toadstool_topper_medic.mdl"
        targetname = "mushroom_cap"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
    SpawnEntityFromTable("prop_dynamic_ornament", {
        InitialOwner = "medic"
        model = "models/player/items/medic/medic_zombie.mdl"
        targetname = "zombie"
        spawnflags = 256
        DisableBoneFollowers = 1
        disableshadows = 1
    })
}


//Thank you Timey for helping with the logic

/////////////////////////////
//  Upgrade station music  //
/////////////////////////////

//right spawn upgrade music
function spawnradiostation1()
{
    local radiostation1 = SpawnEntityFromTable("ambient_generic", {
        targetname = "radiostation1"
        message = "#ui/gamestartup2.mp3"
        origin = Vector(720,-590,130)
        health = 10
        spawnflags = 32
        radius = 750
    })

    //everything below is for looping the music

    radiostation1.ValidateScriptScope()

    radiostation1.GetScriptScope().playtrack <- function() 
    {
        EntFire("radiostation1", "playsound")
        return 245 //time before music plays again
    }

    AddThinkToEnt (radiostation1, "playtrack")
}

//left spawn upgrade music
function spawnradiostation2()
{
    local radiostation2 = SpawnEntityFromTable("ambient_generic", {
        targetname = "radiostation2"
        message = "#ui/gamestartup2.mp3"
        origin = Vector(-718,-595,130)
        health = 10
        spawnflags = 32
        radius = 750
    })

    radiostation2.ValidateScriptScope()

    radiostation2.GetScriptScope().playtrack <- function() 
    {
        EntFire("radiostation2", "playsound")
        return 245
    }

    AddThinkToEnt (radiostation2, "playtrack")
}

//forward spawn upgrade music
function spawnradiostation3()
{
    local radiostation3 = SpawnEntityFromTable("ambient_generic", {
        targetname = "radiostation3"
        message = "#ui/gamestartup2.mp3"
        origin = Vector(901,3000,179)
        health = 10
        spawnflags = 32
        radius = 1500
    })

    radiostation3.ValidateScriptScope()

    radiostation3.GetScriptScope().playtrack <- function() 
    {
        EntFire("radiostation3", "playsound")
        return 245
    }

    AddThinkToEnt (radiostation3, "playtrack")
}


////////////////////////////////////
//  Logic that spawns everything  //
////////////////////////////////////

//Checks to see if "engineer" exists. If yes, do nothing. If no, spawn in everything.
//(This assumes that if "engineer" doesn't exist, nothing else does either)
if(Entities.FindByName(null, "engineer") == null) 
{
    spawnengineer()
    spawnheavy()
    spawndemo()
    spawnsoldier()
    spawncouncil()
    spawnspy()
    spawnscout()
    spawnsniper()
    spawnpyro()
    spawnape()
    spawnmedic()
    spawnradiostation1()
    spawnradiostation2()
    spawnradiostation3()
}
