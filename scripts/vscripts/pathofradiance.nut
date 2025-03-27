//PROP DYNAMICS
SpawnEntityFromTable("prop_dynamic", {
    targetname = "engineer_idle"
    model = "models/bots/engineer/bot_engineer.mdl"
    origin = Vector(-179,4729,-100)
    DefaultAnim = "competitive_loserstate_idle"
    DisableBoneFollowers = 1
})

SpawnEntityFromTable("prop_dynamic", {
    targetname = "heavy_idle"
    model = "models/player/heavy.mdl"
    origin = Vector(1148,4550,-175)
    angles = "0 195 0"
    DefaultAnim = "competitive_loserstate_idle"
    DisableBoneFollowers = 1
})

SpawnEntityFromTable("ambient_generic", {
    targetname = "tonealley"
    message = "ambient/atmosphere/tone_alley.wav"
    origin = Vector(0,0,0)
    health = 10
    spawnflags = 33
})

//EARIO!
SpawnEntityFromTable("prop_dynamic_ornament", {
    InitialOwner = "heavy_idle"
    model = "models/workshop/player/items/engineer/spr17_plumbers_cap/spr17_plumbers_cap.mdl"
    spawnflags = 256
    DisableBoneFollowers = 1
    disableshadows = 1
    solid = 0
    modelscale = 1.1
})

function spawnradiostation()
{
    local radiostation1 = SpawnEntityFromTable("ambient_generic", {
        targetname = "radiostation1"
        message = "#upgradestation.mp3"
        origin = Vector(1018 4636 -115)
        health = 10
        spawnflags = 32
        radius = 750
    })

    radiostation1.ValidateScriptScope()

    radiostation1.GetScriptScope().playtrack <- function() 
    {
        EntFire("radiostation1", "playsound")
        return 61
    }

    AddThinkToEnt (radiostation1, "playtrack")
}

function spawnradiostation2()
{
    local radiostation2 = SpawnEntityFromTable("ambient_generic", {
        targetname = "radiostation2"
        message = "#upgradestation.mp3"
        origin = Vector(-78 4642 -35)
        health = 10
        spawnflags = 32
        radius = 750
    })

    radiostation2.ValidateScriptScope()

    radiostation2.GetScriptScope().playtrack <- function() 
    {
        EntFire("radiostation2", "playsound")
        return 61
    }

    AddThinkToEnt (radiostation2, "playtrack")
}

function spawnradiostation3()
{
    local radiostation3 = SpawnEntityFromTable("ambient_generic", {
        targetname = "radiostation3"
        message = "#upgradestation.mp3"
        origin = Vector(113 -239 308)
        health = 10
        spawnflags = 32
        radius = 750
    })

    radiostation3.ValidateScriptScope()

    radiostation3.GetScriptScope().playtrack <- function() 
    {
        EntFire("radiostation3", "playsound")
        return 61 //time before music plays again
    }

    AddThinkToEnt (radiostation3, "playtrack")
}

spawnradiostation()
spawnradiostation2()
spawnradiostation3()