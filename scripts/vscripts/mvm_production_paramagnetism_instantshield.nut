//written by watermelon, framework from ficool2
::magnetism <- 
{
    Cleanup = function()
    {
		local objRes = Entities.FindByClassname(null, "tf_objective_resource")
		local missionString = NetProps.GetPropString(objRes, "m_iszMvMPopfileName")
		const NAME = "paramagnetism"
		
        if(missionString.find(NAME) == null) {
			delete ::magnetism
		}
    }
    
    // mandatory events
    OnGameEvent_recalculate_holidays = function(_) { if (GetRoundState() == 3) Cleanup() }
    OnGameEvent_mvm_wave_complete = function(_) { Cleanup() }
	
	OnGameEvent_player_spawn = function(params) {
		local player = GetPlayerFromUserID(params.userid)
		
		if(!IsPlayerABot(player)) {
			return
		}
		
		EntFireByHandle(player, "RunScriptCode", "magnetism.instantShield(activator)", -1, player, null)
	}

	instantShield = function(player) {
		if(player.HasBotAttribute(134217728)) { //projectile shield
			player.PressSpecialFireButton(1.0)
		}
	}
};
__CollectGameEventCallbacks(magnetism)