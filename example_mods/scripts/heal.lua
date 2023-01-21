healsleft = 3
idle = 1

function onCreate()
	makeLuaSprite('healtext', 'mechanics/heal', 940, 300)
	makeLuaSprite('healnumber', 'mechanics/healed', 990, 370);
	--setObjectCamera('coolwarning', 'other')
	--addLuaSprite('healtext', true)
	--addLuaSprite('healnumber', true)
	scaleObject('healtext', 0.4, 0.4);
	scaleObject('healnumber', 0.6, 0.6);
	setProperty('healtext.antialiasing', false)
	setProperty('healnumber.antialiasing', false)
end

function onCreatePost()
end

function onUpdate()
	if idle == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
		if songName == 'Rounded' or songName == 'Slowed Down' or songName == 'Runner' then
			heal()
		end
	end
end

function heal()
	if healsleft > 0 then
		idle = 0
		healsleft = healsleft - 1
		characterPlayAnim('boyfriend', 'hey', true)
		setProperty('boyfriend.specialAnim', true)
		playSound('heal', '1')
		runTimer('backtonormal', 0.5)
		cameraSetTarget('boyfriend')
		setProperty('health', getProperty('health') + 0.3)
		addLuaSprite('healtext', true)
		addLuaSprite('healnumber', true)
		
		setProperty('healtext.y', 300) -- RESTARTING POSTIONS AND STUFF
		setProperty('healnumber.y', 370)
		setProperty('healtext.alpha', 1)
		setProperty('healnumber.alpha', 1)
		
		doTweenY('textgoup', 'healtext', 500, 0.75, 'sineIn')
		doTweenY('numberup', 'healnumber', 570, 0.75, 'sineIn')
		doTweenAlpha('textgone', 'healtext', 0, 0.49, 'sineIn')
		doTweenAlpha('numbergone', 'healnumber', 0, 0.49, 'sineIn')
		end
	end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'backtonormal' then
		characterPlayAnim('boyfriend', 'idle', true)
		setProperty('boyfriend.specialAnim', false)
		idle = 1
	end
end

function onTweenCompleted(tag)
	if tag == 'numbergone' then
		removeLuaSprite('healtext', false)
		removeLuaSprite('healnumber', false)
	end
end