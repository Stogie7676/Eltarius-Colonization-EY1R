function init()
	count = 19
	current = 1
	t = 0
	
	xpOff = LoadSound("MOD/resources/snd/xpoff.ogg")
	xpOn = LoadSound("MOD/resources/snd/xpon.ogg")
	
	SetFloat("loadTime", 0)
	
	menu = false
	played = false
	playStart = false
	playShutdown = false
end

function draw()
	if GetInt("pcState") == 1 then
		SetFloat("loadTime", GetFloat("loadTime") + GetTimeStep())
		if GetFloat("loadTime") < 24 then
			UiTranslate(UiCenter(), UiMiddle())
			UiAlign("center middle")
			local a = current
			local b = math.mod(current+1, count)
			t = t + GetTimeStep()
			if t > 0 then
				UiImage("MOD/resources/img/loading/xplb"..(b+1)..".jpg")
			end
			if t > 0.075 then
				t = 0
				current = b
			end
		end
	end
	if GetFloat("loadTime") >= 24 then
		SetInt("pcState", 2)
	end
	
	if GetInt("pcState") == 2 then
		if not playStart then
			PlaySound(xpOn, GetPlayerTransform().pos, 0.15)
			playStart = true
		end
		if not menu then
			UiImage("MOD/resources/img/pc/login.jpg")
			UiTranslate(0, 480)
			if UiIsMouseInRect(200, 40) then
				menu = true
			else
				menu = false
			end
		else
			UiImage("MOD/resources/img/pc/blissStart.jpg")
		end
	end
	if GetInt("pcState") ~= 2 then
		playStart = false
	end
	--DebugPrint(GetFloat("loadTime"))
end
