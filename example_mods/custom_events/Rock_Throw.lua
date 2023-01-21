warning = 0
dodgestate = 0
dodgecooldown = 0

function onCreate()
	makeLuaSprite('rock', 'mechanics/rock', getProperty('dad.x') + 100, getProperty('dad.y') + 30);
	makeLuaSprite('coolwarning', 'mechanics/rockwarning', 988, 477);
	setObjectCamera('coolwarning', 'other')
	addLuaSprite('coolwarning', true)
	setProperty('coolwarning.alpha', 0)
end

function onUpdate()
	setProperty('rock.angle', getProperty('rock.angle') + 1)
	if warning == 1 then
	--	warning = 0
	--	playSound('alarm', '1')
	--	doTweenAlpha('flash1end', 'coolwarning', 1, 0.1, 'sineIn')
	end
	if keyJustPressed('space') and dodgecooldown == 0 then
		dodgestate = 1
		dodgecooldown = 1
		runTimer('cooldownend', 0.4);
		characterPlayAnim('boyfriend', 'dodge', true)
		setProperty('boyfriend.specialAnim', true)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'cooldownend' then
		dodgecooldown = 0
		dodgestate = 0
		characterPlayAnim('boyfriend', 'idle', true)
		setProperty('boyfriend.specialAnim', false)
	end
	if tag == 'rockmove' then
		warning = 0
		addLuaSprite('rock', true)
		playSound('toss', '1')
		doTweenX('', 'rock', 835, 0.23, 'linear')
		doTweenY('rockmoveend', 'rock', 548, 0.23, 'linear')
	end
	if tag == 'specialfalse' then
		setProperty('boyfriend.specialAnim', false)
	end
end

function onTweenCompleted(tag)
	if tag == 'rockmoveend' then
		if dodgestate == 0 then
			playSound('hit', '1')
			characterPlayAnim('boyfriend', 'hurt', true)
			setProperty('health', getProperty('health') - 0.9)
			removeLuaSprite('rock', false)
			setProperty('rock.x', getProperty('dad.x') + 100)
			setProperty('rock.y', getProperty('dad.y') + 30)
			setProperty('boyfriend.specialAnim', true)
			runTimer('specialfalse', 0.2)
		end
		if dodgestate == 1 then
			doTweenX('', 'rock', 1330, 0.3, 'linear')
			doTweenY('removerock', 'rock', 985, 0.3, 'linear')
		end
	end
	if tag == 'removerock' then
		removeLuaSprite('rock', false)
		setProperty('rock.x', getProperty('dad.x') + 100)
		setProperty('rock.y', getProperty('dad.y') + 30)
	end
	if tag == 'flash1end' then
		warning = 2
		doTweenAlpha('flash2', 'coolwarning', 0, 0.1, 'sineIn')
	end
	if tag == 'flash2' then
	--	playSound('alarm', '1')
	--	doTweenAlpha('flash2end', 'coolwarning', 1, 0.1, 'sineIn')
	end
	if tag == 'flash2end' then
		warning = 3
		doTweenAlpha('rockmovesoon', 'coolwarning', 0, 0.1, 'sineIn')
	end
	if tag == 'rockmovesoon' then
	--	runTimer('rockmove', 0.1);
	end
end

function onEvent(name,value1,value2)
    if name == "Rock_Throw" then
		warning =  1
	end 
end

function onBeatHit()
	if warning ==  1 then
		playSound('alarm', '1')
		doTweenAlpha('flash1end', 'coolwarning', 1, 0.15, 'sineIn')
	end
	if warning == 2 then
		playSound('alarm', '1')
		doTweenAlpha('flash2end', 'coolwarning', 1, 0.15, 'sineIn')
	end
	if warning == 3 then
		runTimer('rockmove', 0);
	end
end