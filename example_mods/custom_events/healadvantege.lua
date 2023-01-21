function onCreate()
	makeLuaSprite('healimg', 'heal', 300, 250)
    scaleObject('healimg', 0.3, 0.3)
	makeLuaSprite('healing', 'healed', 360, 300)
    scaleObject('healing', 0.3, 0.3)
end

function onEvent()
        setProperty('health', getProperty('health') + 0.2)
		runTimer('textfade', 1.5)
        addLuaSprite('healimg')
        addLuaSprite('healing')
		setProperty('healimg.alpha', 1)
		setProperty('healing.alpha', 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'textfade' then
		doTweenAlpha('textgone', 'healimg', 0, 0.3, 'linear')
		doTweenAlpha('eeee', 'healing', 0, 0.3, 'linear')
	end
end

function onTweenCompleted(tag)
	if tag == 'textgone' then
		removeLuaSprite('healimg', false)
		removeLuaSprite('healing', false)
	end
end