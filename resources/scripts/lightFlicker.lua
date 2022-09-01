blinkRate = GetIntParam("blinkRate", 3)

function init()
	light = FindLight("light")
	lightShape = FindShape("shape")
	toggle = nil
end

function tick(dt)
	rand = math.random(1, blinkRate)
	
	if rand == 3 then toggle = true else toggle = false end
	
	if IsShapeBroken(lightShape) == false then
		SetLightEnabled(light, toggle)
	end
	
	
end

--Another truly awful script by Murdoc.