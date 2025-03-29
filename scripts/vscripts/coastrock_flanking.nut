//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////FLANK SPAWNS FOR FINALE//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////ALSO TY PDA AND TIMEY FOR THE HELP/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////MUCH LOVE HABIBIS//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function coastrock_back_spawnbot()
{
    SpawnEntityFromTable("info_teleport_destination" {
        origin = " 1747 -961 325"
        angles = "0 30 0"
        targetname = "spawnbot_back"
        }
    )

    local teleport_trigger = SpawnEntityFromTable("trigger_teleport" {
        origin = "-815 2147 833"
        target = "spawnbot_back"
        targetname = "spawnbot_back_teleport"
        SpawnFlags = "1"
        }
    )

    teleport_trigger.KeyValueFromInt("solid", 2)
    teleport_trigger.KeyValueFromString("mins", "-200 -200 -200")
    teleport_trigger.KeyValueFromString("maxs", "200 200 200")
}

if(Entities.FindByName(null, "spawnbot_back") == null)
{
	printl("Spawnbot Teleporter has been created!")
	coastrock_back_spawnbot()
}
function coastrock_backfront_spawnbot()
{
    SpawnEntityFromTable("info_teleport_destination" {
        origin = "1718 1748 385"
        angles = "0 30 0"
        targetname = "spawnbot_backfront"
        }
    )

    local teleport_trigger = SpawnEntityFromTable("trigger_teleport" {
        origin = "-930 2467 129"
        target = "spawnbot_backfront"
        targetname = "spawnbot_backfront_teleport"
        SpawnFlags = "1"
        }
    )

    teleport_trigger.KeyValueFromInt("solid", 2)
    teleport_trigger.KeyValueFromString("mins", "-200 -200 -200")
    teleport_trigger.KeyValueFromString("maxs", "200 200 200")
}

if(Entities.FindByName(null, "spawnbot_backfront") == null)
{
	printl("Spawnbot Teleporter has been created!")
	coastrock_backfront_spawnbot()
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SKYBOX//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SetSkyboxTexture("sky_day01_01")
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////DECORATIONS//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
::tele_flanker_spot <- SpawnEntityFromTable("prop_dynamic",
{
	targetname    = "tele_flanker_spot"
	origin        = Vector(1540, -962, 320)
	angles        = QAngle(0, -90, 0)
	model         = "models/pickups/emitter.mdl"
	skin          =	1
})


::tele_flanker_spot_particle <- SpawnEntityFromTable("info_particle_system",
{
	targetname			= "skyparticle_tele_flanker_spot"
	origin				= Vector(1540, -962, 280)
	angles				= QAngle(0, 90, 0)
	start_active		= 1,
	effect_name			= "teleporter_mvm_bot_persist"
})

::tele_flanker_spot_particle1 <- SpawnEntityFromTable("info_particle_system",
{
	targetname			= "skyparticle_tele_flanker_spot1"
	origin				= Vector(1540, -962, 280)
	angles				= QAngle(0, 90, 0)
	start_active		= 1,
	effect_name			= "teleporter_mvm_bot_persist"
})

::tele_flanker_spot_particle2 <- SpawnEntityFromTable("info_particle_system",
{
	targetname			= "tele_flanker_spot_particle2"
	origin				= Vector(1540, -962, 280)
	angles				= QAngle(0, 90, 0)
	start_active		= 1,
	effect_name			= "teleporter_mvm_bot_persist"
})
::tele_flanker_spot <- SpawnEntityFromTable("prop_dynamic",
{
	targetname    = "tele_flanker_spot"
	origin        = Vector(1555, 1794, 320)
	angles        = QAngle(0, -90, 0)
	model         = "models/pickups/emitter.mdl"
	skin          =	1
})


::tele_flanker_spot_particle <- SpawnEntityFromTable("info_particle_system",
{
	targetname			= "skyparticle_tele_flanker_spot"
	origin				= Vector(1555, 1794, 280)
	angles				= QAngle(0, 90, 0)
	start_active		= 1,
	effect_name			= "teleporter_mvm_bot_persist"
})

::tele_flanker_spot_particle1 <- SpawnEntityFromTable("info_particle_system",
{
	targetname			= "skyparticle_tele_flanker_spot1"
	origin				= Vector(1555, 1794, 280)
	angles				= QAngle(0, 90, 0)
	start_active		= 1,
	effect_name			= "teleporter_mvm_bot_persist"
})

::tele_flanker_spot_particle2 <- SpawnEntityFromTable("info_particle_system",
{
	targetname			= "tele_flanker_spot_particle2"
	origin				= Vector(1555, 1794, 280)
	angles				= QAngle(0, 90, 0)
	start_active		= 1,
	effect_name			= "teleporter_mvm_bot_persist"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2361, 605, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2361, 349, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2361, 48, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2361, -457, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2361, -735, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1714, -734, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1474, -969, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(865, -1017, 1425)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(273, -973, 1425)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-102, -962, 1026)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-680, -962, 1026)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-680, -404, 1026)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-680, 44, 851)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-675, 362, 481)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-675, 601, 481)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-683, 963, 970)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-683, 1481, 970)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-683, 1641, 970)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-12, 1856, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(425, 1639, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(480, 933, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-991, 1235, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1420, 1339, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1035, 450, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1012, 5, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1006, -391, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(406, -368, 1349)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(30, 308, 970)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-71, 1213, 1349)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(902, 1432, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1722, 1623, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1761, 1142, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1482, 715, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1643, 274, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1945, -383, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1736, 1986, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1487, 2317, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1094, 2250, 1582)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1094, 2250, 1582)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(898, 1813, 1582)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(866, 2513, 1582)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(409, 2179, 1582)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(24, 2137, 1582)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-315, 2144, 1582)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-466, 1888, 1264)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2225, 1322, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2225, 1322, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2651, 1217, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3036, 1186, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3030, 743, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3024, 238, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3578, 1158, 1438)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3952, 1240, 1438)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3947, 855, 1438)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3947, 565, 1438)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3609, 530, 1438)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3589, 805, 1438)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1075, 1042, 880)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(720, 1178, 880)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(986, 612, 880)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1778, 205, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1481, 139, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1468, 484, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1934, 831, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2835, 1748, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2525, 1774, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2170, 1801, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2202, 2230, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2650, 2257, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3066, 2192, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3075, 1863, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3104, 2521, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2713, 2791, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2291, 2801, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1755, 2859, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1337, 2868, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2051, 3271, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2532, 3259, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2893, 3301, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2816, 3568, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2489, 3586, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2208, 3602, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2327, -279, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1450, -428, 1413)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-110, 782, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-20, 266, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(181, -413, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1364, -896, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-619, -1463, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-392, -1457, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-23, -1460, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(309, -1474, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(655, -1482, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(882, -1484, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1221, -1495, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1433, -1502, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1748, -1497, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(1975, -1497, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2192, -1469, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2229, -1302, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2248, -1105, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2263, -946, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3000, -946, 1458)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3000, -42, 1458)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(3004, -382, 1458)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2668, -263, 1458)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2614, -24, 1458)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2610, -294, 1458)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(2136, -425, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(436, 614, 1449)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(428, 368, 1449)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(419, 96, 1449)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(414, -63, 1449)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-355, -326, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(274, 64, 800)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-1130, -99, 1451)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-1163, -393, 1451)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-1184, -789, 1451)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-1191, -1152, 1451)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-1428, -1199, 1451)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-1418, -710, 1451)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
SpawnEntityFromTable("info_particle_system",
{
	targetname			= "rainparticles"
	origin				= Vector(-1422, -435, 1451)
	start_active		= 1,
    flag_as_weather     = 1
	effect_name			= "env_rain_002_256"
})
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////THE FOG//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////IS COMING////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////AT YOUR DOORSTEP//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SpawnEntityFromTable("env_fog_controller" , {
		targetname = "the_fog_is_coming"
		fogenable		=	true
		fogstart		=	200.0
		fogend			=	600.0
		fogmaxdensity	=	1.2
		fogcolor		=	"83 86 94"
		foglerptime		=	5.0
		fogRadial 		=	true
	}
)

SpawnEntityFromTable("env_fade" , {
        targetname = "the_thunderstrikes"
		duration		=	2
		holdtime		=	"0.5"
		renderamt		=	255
		fogmaxdensity	=	1.2
		rendercolor		=	"255 255 255"
		spawnflags		=	1
    }
)

EntFire("the_thunderstrikes","fade")
EntFire("gamerules","PlayVO","ambient/halloween/thunder_06.wav")
local fog_trigger = SpawnEntityFromTable("trigger_multiple" , {
        targetname = "the_fog_trigger"
		origin = Vector(0,0,0)
		startdisabled = 1
		spawnflags = 1
		"OnStartTouch": "!activator,SetFogController,the_fog_is_coming,0,-1"
    }
)


SpawnEntityFromTable("logic_timer", {
    targetname = "the_fog_chimes_the_bell"
	refiretime = "0.25"
	startdisabled = 1
	"ontimer#1": "the_fog_trigger,enable,,0,-1"
	"ontimer#2": "the_fog_trigger,disable,,0.2,-1"
	"ontimer#3": "the_fog_trigger,enable,,0.23,-1"
})


fog_trigger.KeyValueFromInt("solid", 2)
fog_trigger.KeyValueFromString("mins", "-9999 -9999 -9999")
fog_trigger.KeyValueFromString("maxs", "9999 9999 9999")