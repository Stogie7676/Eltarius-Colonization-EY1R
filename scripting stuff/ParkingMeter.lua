function init()
	
	PM = FindShape(pm)

end

function tick(dt)

	SndTable = {
		"MOD/sound/1.ogg",
        "MOD/sound/2.ogg",
        "MOD/sound/3.ogg"
    }

    randomSndIndex = math.random(1, 3)

	local PMt = GetShapeWorldTransform(PM)

	local snd = LoadSound(SndTable[randomSndIndex])

	--DebugWatch("PMt", PMt)

	if GetPlayerInteractShape() == PM and InputPressed("interact") then
		PlaySound(snd, PMt.pos, 5)
	end
end