local objective_resource = Entities.FindByClassname(null, "tf_objective_resource")
local popname = NetProps.GetPropString(objective_resource, "m_iszMvMPopfileName")

::__ML_coastal_heavynerf <- {

    function OnGameEvent_post_inventory_application(params) {

        local player = GetPlayerFromUserID(params.userid)

        if (player.GetTeam() == 2 && player.GetPlayerClass() == 6) {

            for (local i = 0; i < NetProps.GetPropArraySize(player, "m_hMyWeapons"); i++) {

                if (NetProps.GetPropEntityArray(player, "m_hMyWeapons", i).GetClassname() == "tf_weapon_minigun") {

                    local minigun = NetProps.GetPropEntityArray(player, "m_hMyWeapons", i)
                    minigun.AddAttribute("damage bonus HIDDEN", 0.65, 0)
                    break
                }
            }
        }
    }
    function OnGameEvent_recalculate_holidays(_) {

        if (GetRoundState() != 3) return

        if (popname != NetProps.GetPropString(objective_resource, "m_iszMvMPopfileName"))
            delete ::__ML_coastal_heavynerf
    }
}
__CollectGameEventCallbacks(__ML_coastal_heavynerf)

//fire post_inventory_application event on script load
EntFire("player", "RunScriptCode", "if (!IsPlayerABot(self)) self.Regenerate(true)")