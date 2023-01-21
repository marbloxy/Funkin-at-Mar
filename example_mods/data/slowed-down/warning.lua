local allowCountdown = false
local warning = false
--local warningallow = false
idk = 0

function onCreate()
	makeAnimatedLuaSprite('warningwindow', 'WindowWarning', 200, 87)
	addAnimationByPrefix('warningwindow', 'appear', 'Window', 24, false)
	addLuaSprite('warningwindow', true)
	scaleObject('warningwindow', 0.5, 0.5);
	setObjectCamera('warningwindow', 'other')
	makeLuaText('text1', 'Beware of the flash notes! Pressing them will spawn images that block your screen!', 700, 217, 212)
	setTextSize('text1', 40)
	addLuaText('text1')
	makeLuaText('text2', 'Press SPACE to continue.', 700, 298, 441)
	setTextSize('text2', 40)
	addLuaText('text2')
	makeLuaSprite('flashicon', 'mechanics/flashwarn', 920, 193);
	addLuaSprite('flashicon', true)
	setObjectCamera('text1', 'other')
	setObjectCamera('text2', 'other')
	setObjectCamera('flashicon', 'other')
	setObjectOrder('warningwindow', 2)
	setObjectOrder('text1', 3)
	setObjectOrder('text2', 3)
	setObjectOrder('flashicon', 3)
	setProperty('warningwindow.alpha', 0)
	setProperty('text1.alpha', 0)
	setProperty('text2.alpha', 0)
	setProperty('flashicon.alpha', 0)
end
--objectPlayAnimation('warningwindow', 'appear', true)
function onCreatePost()
	precacheImage('WindowWarning')
	precacheImage('flashwarn')
end

function onStartCountdown()
	idk = idk + 1
	if idk == 1 and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		--return Function_Stop;
	elseif idk == 2 then
		setProperty('warningwindow.alpha', 1)
		runTimer('windowanim', 0.3);
		setProperty('inCutscene', true);
	elseif not isStoryMode or seenCutscene then
		warning = false
		return Function_Continue
	end
	return Function_Stop;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'windowanim' then
		objectPlayAnimation('warningwindow', 'appear', true)
		runTimer('textappear', 0.3)
	end
	if tag == 'textappear' then
		doTweenAlpha('idk1', 'text1', 1, 0.3, 'linear')
		doTweenAlpha('idk2', 'text2', 1, 0.3, 'linear')
		doTweenAlpha('idk3', 'flashicon', 1, 0.3, 'linear')
		warning = true
	end
end

function onUpdate()
	if keyJustPressed('space') and warning == true then
		playSound('cancelMenu','1')
		doTweenAlpha('dissapear0', 'text1', 0, 0.2, 'linear')
		doTweenAlpha('dissapear', 'text2', 0, 0.2, 'linear')
		doTweenAlpha('dissapear1', 'flashicon', 0, 0.2, 'linear')
	end
end

function onTweenCompleted(tag)
	if tag == 'dissapear' then
		doTweenAlpha('dissapear2', 'warningwindow', 0, 0.2, 'linear')
	end
	if tag == 'dissapear2' then
		warning = false
		close()
	end
		startCountdown()
end