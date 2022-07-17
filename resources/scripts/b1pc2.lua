--PC States:

--0: off
--1: on

function init()
	pc = FindShape("pc")
	pcBody = FindBody("pc")
	
	pcPos = GetBodyTransform(pcBody).pos
	
	SetTag(pc, "interact", "Turn on/off")
	
	monitor  = FindShape("lobMonitor")
	
	monitorScreen = FindScreen("monitor")
	
	pcOff = LoadSound("MOD/main/snd/pcOff.ogg")
	pcLoop = LoadLoop("MOD/main/snd/pcRun.ogg")
	pcStart = LoadSound("MOD/main/snd/pcOn.ogg")
	
	SetInt("pcState", 0)
	

	played = false
end

function tick(dt)
	if GetBool("savegame.mod.Fernwaybreaker") == true then
		if GetPlayerInteractShape() == pc and InputPressed("interact") then
			if GetInt("pcState") == 0 then
				PlaySound(pcStart, pcPos, 0.15)
				SetInt("pcState", 1)
			elseif GetInt("pcState") > 0 then
				PlaySound(pcOff, pcPos, 0.15)
				SetInt("pcState", 0)
			end
			if IsScreenEnabled(monitorScreen) == false then
				SetScreenEnabled(monitorScreen, true)
			elseif IsScreenEnabled(monitorScreen) == true then
				SetScreenEnabled(monitorScreen, false)
			end
		end
		if GetPlayerInteractShape() == monitor and InputPressed("interact") then
			if GetPlayerScreen() ~= monitorScreen then 
				SetPlayerScreen(monitorScreen)
			end
		end
		if GetPlayerScreen() == monitorScreen then
			RemoveTag(monitor, "interact")
		else
			SetTag(monitor, "interact", "Browse")
		end
	end
	
	if GetInt("pcState") == 0 then
		SetFloat("loadTime", 0)
	elseif GetInt("pcState") > 0 then
		PlayLoop(pcLoop, pcPos, 0.15)
	end
end

--Another truly awful script by Murdoc.
