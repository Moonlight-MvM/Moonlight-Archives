// written by PDA Expert

if ("Area52NewSpawnbot" in getroottable()) return
if (!startswith(GetMapName(), "mvm_area_52"))
	throw "Tried to load area52_newspawnbot.nut on " + GetMapName() + ", aborting."

// Include this script on Area 52 in Wave 1 to cause Where spawnbot spawns (in the carrier) to spawn closer to the drop down.
// InitWaveOutput
// {
//     Target gamerules
//     Action RunScriptFile
//     Param "area52_newspawnbot"
// }
const SF_TRIGGER_ALLOW_CLIENTS = 0x1

::Area52NewSpawnbot <- {
	mvm_stats = Entities.FindByClassname(null, "tf_mann_vs_machine_stats")

	function OnGameEvent_teamplay_round_start(_) {
		// Remake the teleporter after every wave fail.
		MakeSpawn()
	}

	function OnGameEvent_recalculate_holidays(_) {
		if (GetRoundState() != Constants.ERoundState.GR_STATE_PREROUND) return
		if (NetProps.GetPropInt(mvm_stats, "m_iCurrentWaveIdx") != 0) return
		// Unload the script every time the popfile is parsed if we are on wave 1.

		printl("area52_newspawnbot unloaded.")
		delete ::Area52NewSpawnbot
	}

	function MakeSpawn() {
		SpawnEntityFromTable("info_teleport_destination", {
			targetname = "spawnbot_main_short"
			origin = Vector(-1595.0, 2855.0, -300.0)
			angles = QAngle(0.0, -30.0, 0.0)
		})

		local teleport_trigger = SpawnEntityFromTable("trigger_teleport", {
			targetname = "spawnbot_main_short_teleport"
			origin = Vector(-1460.0, 3988.0, -117.0)
			target = "spawnbot_main_short"
			filtername = "filter_blueteam"
			spawnflags = SF_TRIGGER_ALLOW_CLIENTS
		})

		teleport_trigger.SetSolid(Constants.ESolidType.SOLID_BBOX)
		teleport_trigger.SetSize(
			Vector(-600.0, -600.0, -600.0),
			Vector(600.0, 600.0, 600.0)
		)
	}
}
__CollectGameEventCallbacks(::Area52NewSpawnbot)

::Area52NewSpawnbot.MakeSpawn()
printl("area52_newspawnbot loaded!")
