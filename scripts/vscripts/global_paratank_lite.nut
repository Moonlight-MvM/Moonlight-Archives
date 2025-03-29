//EXAMPLE OF CREATED PATH IN MISSION:
//Made by Lite. (lite_flame on discord)
//InitWaveOutput
//        {
//            Target wave_start_relay
//            Action runscriptcode
//            Param "if(!(`SetDropTank` in self.GetScriptScope()))IncludeScript(`global_paratank_lite`)
//            if(!(Entities.FindByName(null,`droptank_1`))) {
//            CreateDropTankPath([
//                `964 0 576|droptank_1`,
//                `137 0 -128|droptank_2_ground`,
//                `-1372 0 -128|droptank_3`
//            ])}"
//        }

function CreateDropTankPath(array) {
	local arraylen = array.len()-1
	for(local i=arraylen;i>=0;i--) {
		local info = split(array[i],"|")
		local pos = info[0]
		local name = info[1]
		local nextname = ""
		if(i<arraylen) {
			local nextinfo = split(array[i+1],"|")
			nextname = nextinfo[1]
		}
		local path = SpawnEntityFromTable("path_track",{
			origin = pos
			targetname = name
			target = nextname
			orientationtype = 1
		})
		if(i==0)
			path.KeyValueFromString("OnPass","wave_start_relay,CallScriptFunction,SetDropTank,-1,-1")
		else if(name.tolower().find("_ground"))
			path.KeyValueFromString("OnPass","wave_start_relay,CallScriptFunction,DestroyDropTank,-1,-1")
	}
}
::worldspawn <- Entities.FindByClassname(null,"worldspawn")
function SetDropTank() {
	// activator is tank_boss
	// caller is path_track
	if(activator.GetClassname()!="tank_boss") return
	
	local snd = {
		sound_name = "items/para_open.wav"
		entity = worldspawn
		filter = 5
		pitch = 85
	}
	PrecacheSound(snd.sound_name)
	EmitSoundEx(snd)

	for(local child=activator.FirstMoveChild();child!=null;child=child.NextMovePeer())
		if(child.GetModelName().find("tank_track"))
			EntFireByHandle(child,"SetAnimation","ref",-1,null,null)

	activator.ValidateScriptScope()
	local gss = activator.GetScriptScope()

	activator.SetAbsAngles(QAngle(0,activator.GetAbsAngles().y,0))
	local tankspeed = NetProps.GetPropFloat(activator,"m_speed")
	gss.droptanktrain <- SpawnEntityFromTable("func_tracktrain",{
		origin = caller.GetOrigin()
		speed = tankspeed
		startspeed = tankspeed
		target = caller.GetName()
	})
	local chute = SpawnEntityFromTable("prop_dynamic",{
		origin = activator.GetOrigin()
		model = "models/props_aircrap/tank_chute.mdl"
		defaultanim = "deploy"
	})
	gss.chute <- chute
	EntFireByHandle(chute,"SetParent","!activator",-1,activator,null)
	EntFireByHandle(chute,"SetDefaultAnimation","idle",-1,null,null)
	AddThinkToEnt(activator,"DropTankThink")
}
function DestroyDropTank() {
	local gss = activator.GetScriptScope()
	if(!gss)return

	local snd = {
		sound_name = "items/para_close.wav"
		entity = worldspawn
		filter = 5
		pitch = 85
	}
	PrecacheSound(snd.sound_name)
	EmitSoundEx(snd)

	for(local child=activator.FirstMoveChild();child!=null;child=child.NextMovePeer())
		if(child.GetModelName().find("tank_track"))
			EntFireByHandle(child,"SetAnimation","forward",-1,null,null)

	AddThinkToEnt(activator,null)
	gss.droptanktrain.Kill()
	EntFireByHandle(gss.chute,"SetAnimation","retract",-1,null,null)
	EntFireByHandle(gss.chute,"AddOutput","OnAnimationDone !self:Kill:-1:-1",0,null,null)
}

::DropTankThink <- function() {
	self.SetAbsOrigin(droptanktrain.GetOrigin())
	self.GetLocomotionInterface().Reset()
	return -1
}