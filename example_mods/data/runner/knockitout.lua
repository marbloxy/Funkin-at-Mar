
function onCreate()
	makeLuaText('knockitoff', 'KNOCK', 1000, 420, 480)
	setTextAlignment('knockitoff', 'left')
	setObjectCamera('knockitoff', 'other')
	setTextSize('knockitoff', 60)
	addLuaText('knockitoff')
	setTextColor('knockitoff', 'ca0bca')
	setProperty('knockitoff.alpha', 0)
end

function onStepHit()
	if curStep == 1136 then --1136
		setProperty('knockitoff.alpha', 1)
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	end
	if curStep == 1141 then --1141
		setTextString('knockitoff', 'KNOCK IT')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.2)
	end
	if curStep == 1145 then --1145
		setTextString('knockitoff', 'KNOCK IT OFF!')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.2)
		triggerEvent('Screen Shake','0.7,0.03','0,5')
	end
	if curStep == 1152 then --1152
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.5)
		doTweenAlpha('dissapeartext', 'knockitoff', 0, 0.25, 'linear')
	end
end