--THIS IS JUST A COPY OF THE SLOWED DOWN SCRIPT IM SO LAZY LMAOO
--Okay not fully same bc of the vid cutscene but still
--omg gnk02 ur lazy

local allowCountdown = false
local warning = false
idk = 0

function onCreate()
	makeAnimatedLuaSprite('warningwindow', 'WindowWarning', 200, 87)
	addAnimationByPrefix('warningwindow', 'appear', 'Window', 24, false)
	addLuaSprite('warningwindow', true)
	scaleObject('warningwindow', 0.5, 0.5);
	setObjectCamera('warningwindow', 'other')
	makeLuaText('text1', 'You can heal 3 times by pressing Z on the main week songs. Use your heals wisely cause you can only heal 3 times per song.', 700, 295, 212)
	setTextSize('text1', 40)
	addLuaText('text1')
	makeLuaText('text2', 'Press SPACE to continue.', 700, 298, 441)
	setTextSize('text2', 40)
	addLuaText('text2')
	setObjectCamera('text1', 'other')
	setObjectCamera('text2', 'other')
	setObjectOrder('warningwindow', 2)
	setObjectOrder('text1', 3)
	setObjectOrder('text2', 3)
	setProperty('warningwindow.alpha', 0)
	setProperty('text1.alpha', 0)
	setProperty('text2.alpha', 0)
end

function onCreatePost()
	precacheImage('WindowWarning')
end

function onStartCountdown()
	idk = idk + 1
	if idk == 1 and isStoryMode and not seenCutscene then
		runTimer('videothing', 0.9) --making sure low end pc users like me dont lag when the cutscene starts
		setProperty('inCutscene', true)
		setProperty('camGame.visible', false)
		setProperty('camHUD.visible', false)
	elseif not isStoryMode or seenCutscene then
		warning = false
		setProperty('camGame.visible', true)
		setProperty('camHUD.visible', true)
		close()
		return Function_Continue
	elseif idk == 2 then
		setProperty('camGame.visible', true)
		setProperty('camHUD.visible', true)
		runTimer('startDialogue', 0.8);
		setProperty('inCutscene', true)
		--return Function_Stop;
	elseif idk == 3 then
		setProperty('warningwindow.alpha', 1)
		runTimer('windowanim', 0.3);
		setProperty('inCutscene', true);
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
		warning = true
	end
	if tag == 'startDialogue' then
		startDialogue('dialogue', 'the_dialogue_music');
	end
	if tag == 'videothing' then
		startVideo('StartUp');
	end
end

function onUpdate()
	if keyJustPressed('space') and warning == true then
		playSound('cancelMenu','1')
		doTweenAlpha('dissapear0', 'text1', 0, 0.2, 'linear')
		doTweenAlpha('dissapear', 'text2', 0, 0.2, 'linear')
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