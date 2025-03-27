
// archives already do this
// local ent = Entities.FindByClassname(null, "tf_objective_resource")
// if (ent)
// {
//     NetProps.SetPropString(ent, "m_iszMvMPopfileName", "Nemesis (Advanced)")
// }
local objective_resource = Entities.FindByClassname(null, "tf_objective_resource")
local popname = NetProps.GetPropString(objective_resource, "m_iszMvMPopfileName")
::__ML_cliffside <- {

    function OnGameEvent_player_death(params)
    {
        local player = GetPlayerFromUserID(params.userid)
        local ent = null;
        while( ent = Entities.FindByClassname(ent, "tf_ammo_pack") )
        {
            if (ent.GetEFlags() == 44302336) continue
            ent.SetEFlags(44302336)
            ent.SetMoveType(6, 0)
            ent.SetModel("models/items/ammopack_medium.mdl")
        }
    }

    function OnGameEvent_item_pickup(params)
    {
        local player = GetPlayerFromUserID(params.userid)
        player.RemoveCond(33)
    }

    function OnGameEvent_teamplay_round_start(_)
    {
        if (popname !=  GetPropString(objective_resource, "m_iszMvMPopfileName"))
            delete __ML_cliffside
    }
}

__CollectGameEventCallbacks(__ML_cliffside)