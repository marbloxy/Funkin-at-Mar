sansdying = false

function onCreate()
	makeLuaSprite('rock', 'mechanics/rock', getProperty('dad.x') + 100, getProperty('dad.y') + 30);
	addLuaSprite('rock', true)
	makeLuaText('marspeak', 'OMG is that sans from friday night funkin?', 1000, 135, 640)
	setTextSize('marspeak', 40)
	setTextColor('marspeak', 'ca0bca')
	setObjectCamera('marspeak', 'other')
	addLuaText('marspeak')
	
	makeLuaText('bfspeak', 'Yeah!', 1000, 135, 640) --622
	setTextSize('bfspeak', 40)
	setTextColor('bfspeak', '1df7e5')
	setObjectCamera('bfspeak', 'other')
	
	makeLuaSprite('topbar', 'E', 0, -1000)
	makeGraphic('topbar', 4608, 857, '000000')
	setObjectCamera('topbar', 'other')
	addLuaSprite('topbar', true)
	
	makeLuaSprite('bottombar', 'E', 0, 1000)
	makeGraphic('bottombar', 4608, 857, '000000')
	setObjectCamera('bottombar', 'other')
	addLuaSprite('bottombar', true)
	
	setObjectOrder('bfspeak', 2)
	setObjectOrder('marspeak', 2)
	setObjectOrder('topbar', 1)
	setObjectOrder('bottombar', 1)
	--setObjectOrder('sans', 1)
	setObjectOrder('rock', getObjectOrder('mar2') + 1)
	
	setProperty('marspeak.alpha', 0)
	setProperty('bfspeak.alpha', 0)
	setProperty('sans.alpha', 0)
	setProperty('mar2.alpha', 0)
	setProperty('sansicon.alpha', 0)
	setProperty('rock.alpha', 0)
end

function onCreatePost()
	precacheImage('characters/SANS')
	precacheImage('characters/memeMar')
end

function onStepHit()
	if curStep == 10 then
		doTweenY('sansprecache', 'sans', -289, 0.3, 'sineIn')
	end
	if curStep == 20 then
		--sansdying = true
	end
	if curStep == 528 then
		setProperty('defaultCamZoom', 1.1)
	end
	if curStep == 560 then
		setProperty('defaultCamZoom', 1.2)
	end
	if curStep == 568 then
		setProperty('defaultCamZoom', 1.3)
	end
	if curStep == 576 then
		setProperty('defaultCamZoom', 1.4)
	end
	if curStep == 584 then
		setProperty('defaultCamZoom', 1.5)
	end
	if curStep == 592 then
		setProperty('defaultCamZoom', 0.9)
	end
	if curStep == 600 then
		setProperty('defaultCamZoom', 0.9) --just incase
	end
	if curStep == 998 then
		doTweenAlpha('hudbegone', 'camHUD', 0, 0.7, 'smootherStepInOut');
		runTimer('borderappear', 0)
	end
	if curStep == 1002 then
		triggerEvent('Camera Follow Pos','775','230')
		doTweenY('sansfall', 'sans', -289, 0.285, 'sineIn')
	end
	if curStep == 1020 then
		triggerEvent('Camera Follow Pos','','')
		runTimer('martext1', 0.3)
	end
	if curStep == 1055 then
		runTimer('marfade', 0.3)
	end
	if curStep == 1060 then
		runTimer('bftext', 0.3)
	end
	if curStep == 1062 then
		cameraSetTarget('boyfriend')
	end
	if curStep == 1066 then
		runTimer('bffade', 0.3)
		setProperty('boyfriend.specialAnim', true)
		characterPlayAnim('boyfriend', 'hey', true)
	end
	if curStep == 1088 then
		doTweenAlpha('hudbeback', 'camHUD', 1, 0.8, 'smootherStepInOut');
		runTimer('borderdisappear', 0.2)
		setProperty('dad.alpha', 0)
		setProperty('boyfriend.specialAnim', false)
		setProperty('mar2.alpha', 1) --fake mar!?!?!?!? :OOOOO
	
		setProperty('sansicon.alpha', 1) --OMG SANS FROM DELTARUNE
		setProperty('iconP2.visible', false)
		setHealthBarColors('FFFFFF', 'A078FF')
		health = getProperty('health')
		if health > 1 then
			setProperty('health', 1)
		end
	end
	if curStep == 1833 then
		setProperty('rock.alpha', 1)
		setObjectOrder('sans', 1)
		doTweenX('rockhitsans', 'rock', 501, 0.7, 'sineIn')
		doTweenY('starvedbelike', 'rock', 21, 0.7, 'sineIn')
	end
	if curStep == 1849 then
		sansdying = true
		runTimer('sansfade', 1.7)
		triggerEvent('Screen Shake','1.8,0.03','1,0')
	end
	if curStep == 1873 then
		setProperty('mar2.alpha', 0)
		setProperty('dad.alpha', 1)
		runTimer('martext2', 0)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'borderappear' then
		doTweenY('top', 'topbar', -785, 0.5, 'smootherStepInOut')
		doTweenY('bottom', 'bottombar', 615, 0.5, 'smootherStepInOut')
	end
	if tag == 'borderdisappear' then
		doTweenY('top2', 'topbar', -2000, 0.5, 'smootherStepInOut')
		doTweenY('bottom2', 'bottombar', 1000, 0.5, 'smootherStepInOut')
	end
	if tag == 'martext1' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-holding-gf-dead') --BF AND GF DEATH ANIM
		doTweenAlpha('martext', 'marspeak', 1, 0.5, 'smootherStepInOut')
	end
	if tag == 'bftext' then
		doTweenAlpha('bftext', 'bfspeak', 1, 0.5, 'smootherStepInOut')
	end
	if tag == 'marfade' then
		doTweenAlpha('martext', 'marspeak', 0, 0.5, 'smootherStepInOut')
	end
	if tag == 'bffade' then
		doTweenAlpha('bftext', 'bfspeak', 0, 0.5, 'smootherStepInOut')
	end
	if tag == 'sansfade' then
		doTweenAlpha('sansnooo', 'sans', 0, 0.3, 'smootherStepInOut')
		doTweenAlpha('sansiconbegone', 'sansicon', 0, 0.3, 'smootherStepInOut')
	end
	if tag == 'martext2' then
		doTweenAlpha('martext', 'marspeak', 1, 0.1, 'smootherStepInOut')
		setTextString('marspeak', 'lol')
		setTextSize('marspeak', 70)
		setProperty('marspeak.x', 105)
		setProperty('marspeak.y', 350)
	end
end

function onTweenCompleted(tag)
	if tag == 'sansprecache' then
		doTweenY('sansprecachedone', 'sans', -1000, 0.3, 'sineIn')
	end
	if tag == 'sansprecachedone' then
		setProperty('sans.alpha', 1)
		triggerEvent('Screen Shake','0.5,0','0,0')
	end
	if tag == 'sansfall' then
		triggerEvent('Screen Shake','0.5,0.052','0,0')
	end
	if tag == 'rockhitsans' then
		removeLuaSprite('rock', false)
	end
end

function onUpdate()
	setProperty('rock.angle', getProperty('rock.angle') + 5)
	if sansdying == true then
		--setProperty('sans.width', getProperty('sans.width') + 5)
		--scaleObject('sans', 0, siilynumber)
		doTweenX('sansdobedeadthough', 'sans.scale', 15, 1, 'elasticInOut')
	end
end