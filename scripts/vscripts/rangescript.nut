foreach (k, v in NetProps.getclass())
    if (k != "IsValid")
        getroottable()[k] <- NetProps[k].bindenv(NetProps);

////////////////////////////////////////////////////////////////
//
::multitrace <- [
	[-1,1],		[-0.5,1],		[0,1],		[0.5,1],	[1,1],
	[-1,0.5],	[-0.5,0.5],		[0,0.5],	[0.5,0.5],	[1,0.5],
	[-1,0],		[-0.5,0],		[0,0],		[0.5,0],	[1,0],
	[-1,-0.5],	[-0.5,-0.5],	[0,-0.5],	[0.5,-0.5],	[1,-0.5],
	[-1,-1],	[-0.5,-1],		[0,-1],		[0.5,-1],	[1,-1]
]
::ChangeAttributes <- function(string) {
	local interface = SpawnEntityFromTable("point_populator_interface",{})
	EntFireByHandle(interface,"changebotattributes",string,-1,null,null)
	EntFireByHandle(interface,"kill",null,0.1,null,null)
}
::GiveWeapon <- function(player, className, itemID)
{
	local weapon = Entities.CreateByClassname(className);
	SetPropInt(weapon, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", itemID);
	SetPropBool(weapon, "m_AttributeManager.m_Item.m_bInitialized", true);
	SetPropBool(weapon, "m_bValidatedAttachedEntity", true);
	weapon.SetTeam(player.GetTeam());
	Entities.DispatchSpawn(weapon);    
	
	player.Weapon_Equip(weapon);    
	
	for (local i = 0; i < 7; i++)
	{
		local heldWeapon = GetPropEntityArray(player, "m_hMyWeapons", i);
		if (heldWeapon == null || !heldWeapon.IsValid())
			continue;
		if (heldWeapon.GetSlot() != weapon.GetSlot())
			continue;
		heldWeapon.Destroy();
		SetPropEntityArray(player, "m_hMyWeapons", weapon, i);
		break;
	}
	
	player.Weapon_Switch(weapon);

	return weapon;
}
//
////////////////////////////////////////////////////////////////
// addthink/scriptscope related
local maxplayers = MaxClients().tointeger()
for(local i = 1; i<=maxplayers; i++) {
	local player = PlayerInstanceFromIndex(i)
	if(!player)continue
	player.TerminateScriptScope()
	AddThinkToEnt(player,null)
}
ClearGameEventCallbacks()
function OnGameEvent_player_spawn(args) {
	local player = GetPlayerFromUserID(args.userid)
	if(GetPropBool(player,"m_bIsABot"))
		EntFireByHandle(player,"runscriptcode","if(self.HasBotTag(`bot_rangescript`))AddThinkToEnt(self,`Range_Think`)",-1,null,null)
		// bot tags get applied a frame too late for player_spawn to identify them
}
function OnGameEvent_player_death(args) {
	local player = GetPlayerFromUserID(args.userid)
	//player.SetCustomModelWithClassAnimations(null)
	AddThinkToEnt(player,null)
	player.TerminateScriptScope()
}
__CollectGameEventCallbacks(this)
//
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

// CHANGE THESE //
::phase2health <- 42500
::phase3health <- 20000
::bossrange <- 430

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// BEEFY think function
::Range_Think <- function() {
	local gss = self.GetScriptScope()
	if(!("form" in gss)) {
		gss.form <- [1,1]
		gss.saveddist <- null
		gss.phase2hp <- phase2health
		gss.phase3hp <- phase3health
	}
	local eyepos = self.EyePosition()
	local eyeang = self.EyeAngles()
	local fwd = eyeang.Forward()
	local lft = eyeang.Left()*0.06
	local up = eyeang.Up()*0.06
	local player
	local playerdist
	foreach(k in multitrace) {
		local trace = {
			start = eyepos
			end = (fwd+(lft*k[0])+(up*k[1]))*(1<<30)
			ignore = self
		}
		TraceLineEx(trace)
		// DebugDrawLine(trace.start,trace.pos,0,255,255,false,0.03) // debug
		if("enthit" in trace&&trace.enthit.GetClassname()=="player"&&trace.enthit.GetTeam()!=self.GetTeam()) {
			local dist = (trace.enthit.GetOrigin()-eyepos).Length()
			if(playerdist==null||dist<playerdist) {
				player = trace.enthit
				playerdist = dist
				saveddist = dist
			}
		}
	}
	local health = self.GetHealth()
	local previousform = form
	if(saveddist<bossrange) { // short range
		// ClientPrint(null,4,format("ShortRange S:%s D:%s F:%s %s",saveddist+"",playerdist+"",form[0]+"",form[1]+"")) // debug

		// phase 3
		if(health<phase3hp) {
			if(form[0]!=3) {
				phase3hp = 1<<30
				form = [3,0]
				ChangeAttributes("ConchSoldier")
				local wpn = GiveWeapon(self,"tf_weapon_rocketlauncher",18)
				wpn.AddAttribute("reload time decreased",0.35,-1)
				wpn.AddAttribute("damage bonus",1.2,-1)
				wpn.AddAttribute("projectile spread angle penalty",3,-1)
				wpn.AddAttribute("fire rate bonus",0.0001,-1)
				wpn.AddAttribute("projectile speed increased",1.1,-1)
				wpn.AddAttribute("clip size penalty",0.5,-1)
				wpn.AddAttribute("killstreak tier",2,-1)
				wpn.AddAttribute("killstreak idleeffect",6,-1)
				self.SetCustomModelWithClassAnimations("models/bots/soldier_boss/bot_soldier_boss.mdl")
			}
		}
		// phase 2
		else if(health<phase2hp) {
			if(form[0]!=2||form[1]!=0) {
				phase2hp = 1<<30
				form = [2,0]
				ChangeAttributes("ShortRange_Soldier")
				local wpn = GiveWeapon(self,"tf_weapon_rocketlauncher",18)
				wpn.AddAttribute("faster reload rate",-0.8,-1)
				wpn.AddAttribute("damage bonus",1.1,-1)
				wpn.AddAttribute("fire rate bonus",0.45,-1)
				wpn.AddAttribute("fire rate bonus with reduced health",0.5,-1)
				wpn.AddAttribute("killstreak tier",2,-1)
				wpn.AddAttribute("killstreak idleeffect",6,-1)
				self.SetCustomModelWithClassAnimations("models/bots/soldier_boss/bot_soldier_boss.mdl")
			}
		}
		// phase 1
		else {
			if(form[0]!=1||form[1]!=0) {
				form = [1,0]
				ChangeAttributes("ShortRange_Pyro")
				local wpn = GiveWeapon(self,"tf_weapon_flamethrower",21)
				wpn.AddAttribute("airblast pushback scale",2,-1)
				wpn.AddAttribute("damage bonus",5,-1)
				wpn.AddAttribute("killstreak tier",2,-1)
				wpn.AddAttribute("killstreak idleeffect",6,-1)
				self.SetCustomModelWithClassAnimations("models/bots/pyro_boss/bot_pyro_boss.mdl")
			}
		}
	}
	else { // long range
		// ClientPrint(null,4,format("ShortRange S:%s D:%s F:%s %s",saveddist+"",playerdist+"",form[0]+"",form[1]+"")) // debug

		// phase 3
		if(health<phase3hp) {
			if(form[0]!=3) {
				phase3hp = 1<<30
				form = [3,0]
				ChangeAttributes("ConchSoldier")
				local wpn = GiveWeapon(self,"tf_weapon_rocketlauncher",18)
				wpn.AddAttribute("reload time decreased",0.35,-1)
				wpn.AddAttribute("damage bonus",1.2,-1)
				wpn.AddAttribute("projectile spread angle penalty",3,-1)
				wpn.AddAttribute("fire rate bonus",0.0001,-1)
				wpn.AddAttribute("projectile speed increased",1.1,-1)
				wpn.AddAttribute("clip size penalty",0.5,-1)
				wpn.AddAttribute("killstreak tier",2,-1)
				wpn.AddAttribute("killstreak idleeffect",6,-1)
				self.SetCustomModelWithClassAnimations("models/bots/soldier_boss/bot_soldier_boss.mdl")
			}
		}
		// phase 2
		else if(health<phase2hp) {
			if(form[0]!=2||form[1]!=1) {
				phase2hp = 1<<30
				form = [2,1]
				ChangeAttributes("LongRange_DeflectorHeavy")
				local wpn = GiveWeapon(self,"tf_weapon_minigun",850)
				wpn.AddAttribute("damage bonus",1.5,-1)
				wpn.AddAttribute("ring of fire while aiming",600,-1)
				wpn.AddAttribute("attack projectiles",2,-1)
				wpn.AddAttribute("heal on kill",5000,-1)
				wpn.AddAttribute("killstreak tier",2,-1)
				wpn.AddAttribute("killstreak idleeffect",6,-1)
				self.SetCustomModelWithClassAnimations("models/bots/heavy_boss/bot_heavy_boss.mdl")
			}
		}
		// phase 1
		else {
			if(form[0]!=1||form[1]!=1) {
				form = [1,1]
				ChangeAttributes("LongRange_FOS")
				local wpn = GiveWeapon(self,"tf_weapon_fists",331)
				wpn.AddAttribute("fire rate bonus",0.6,-1)
				wpn.AddAttribute("damage bonus",5,-1)
				wpn.AddAttribute("killstreak tier",2,-1)
				wpn.AddAttribute("killstreak idleeffect",6,-1)
				self.SetCustomModelWithClassAnimations("models/bots/heavy_boss/bot_heavy_boss.mdl")
			}
		}
	}
	// on phase swap
	if(form[0]!=previousform[0]) {
		for (local child = self.FirstMoveChild(); child != null; child = child.NextMovePeer()) {
			if(child.GetClassname()=="item_teamflag")EntFireByHandle(child,"setparentattachment","flag",-1,null,null)
		}
		SetPropFloat(self,"m_Shared.m_flRageMeter",100)
		local soundtablephase = {
			sound_name = "npc/combine_gunship/ping_search.wav"
			entity = self
			filter = 5
		}
		PrecacheSound(soundtablephase.sound_name)
		EmitSoundEx(soundtablephase)
		EmitSoundEx(soundtablephase)
		ScreenFade(null,255,63,63,30,0.5,0.5,1)
	}
	// on form swap
	if(form[1]!=previousform[1]) {
		for (local child = self.FirstMoveChild(); child != null; child = child.NextMovePeer()) {
			if(child.GetClassname()=="item_teamflag")EntFireByHandle(child,"setparentattachment","flag",-1,null,null)
		}
		local soundtableform = {
			sound_name = "weapons/vaccinator_toggle.wav"
			entity = self
			filter = 5
			sound_level	= 81
		}
		PrecacheSound(soundtableform.sound_name)
		EmitSoundEx(soundtableform)
	}

	// a fix for banners so that they dont bug themselves out
	local activewpn = self.GetActiveWeapon()
	if(activewpn&&activewpn.GetClassname()=="tf_weapon_buff_item"&&GetPropInt(activewpn,"m_nSequence")==27)
		SetPropInt(self,"m_afButtonDisabled",1)
	else if(GetPropInt(self,"m_afButtonDisabled")&1)
		SetPropInt(self,"m_afButtonDisabled",0)
	return -1
}
