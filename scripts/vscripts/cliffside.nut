





local ent = Entities.FindByClassname(null, "tf_objective_resource")
if (ent)
{
    NetProps.SetPropString(ent, "m_iszMvMPopfileName", "Nemesis (Advanced)")
}


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

__CollectGameEventCallbacks(this)