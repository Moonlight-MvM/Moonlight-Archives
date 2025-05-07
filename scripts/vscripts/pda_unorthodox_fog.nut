// Unorthodox Tech FOG

SpawnEntityFromTable("env_fog_controller" , {
        targetname = "unorthodox_fog_fogwowreallynoshit"
		fogenable = 1
		fogstart = 400
		fogend = 900
		fogmaxdensity = 0.99
		fogcolor = "50 57 75"
		foglerptime = "4"
    }
)

SpawnEntityFromTable("env_shake" , {
        targetname = "unorthodox_fog_fog_shake"
		frequency = "160"
		amplitude = "200"
		duration = 5
		radius = 99999
		spawnflags = 5
		fogRadial = true
    }
)

local fog_trigger = SpawnEntityFromTable("trigger_multiple" , {
        targetname = "unorthodox_fog_fogtrigger"
		origin = Vector(0,0,0)
		startdisabled = 1
		spawnflags = 1
		"OnStartTouch": "!activator,SetFogController,unorthodox_fog_fogwowreallynoshit,0,-1"
    }
)

// thanks lite!

fog_trigger.KeyValueFromInt("solid", 2)
fog_trigger.KeyValueFromString("mins", "-9999 -9999 -9999")
fog_trigger.KeyValueFromString("maxs", "9999 9999 9999")