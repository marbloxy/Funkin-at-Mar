--most of the code here are taken from the dual icon script by Felixan#01 (https://gamebanana.com/tools/8967)

local marappearfr = false

function onCreate()
    precacheImage('icons/marnormal')
    precacheImage('icons/mardefeat')
	precacheImage('icons/icon-sans')
end

function onUpdate(elapsed)
	health = getProperty('health')
	
	if marappearfr == true then
		if health < 0.4 then
			setProperty('marP1.visible', false)
			setProperty('marloseP1.visible', true)
		else
			setProperty('marP1.visible', true)
			setProperty('marloseP1.visible', false)
		end
	else
		setProperty('marP1.visible', false)
		setProperty('marloseP1.visible', false)
	end
end

function onCreatePost()
        makeLuaSprite('marP1', 'icons/marnormal', getProperty('iconP1.x'), getProperty('iconP1.y'))
        setObjectCamera('marP1', 'hud')
        addLuaSprite('marP1', true)
        setObjectOrder('marP1', getObjectOrder('iconP1')) 
        setProperty('marP1.flipX', true)

        makeLuaSprite('marloseP1', 'icons/mardefeat', getProperty('iconP1.x'), getProperty('iconP1.y'))
        setObjectCamera('marloseP1', 'hud')
        addLuaSprite('marloseP1', true)
        setObjectOrder('marloseP1', getObjectOrder('iconP1'))
        setProperty('marloseP1.flipX', true)
		
		makeLuaSprite('sansicon', 'icons/icon-sans', 0, getProperty('iconP2.y')) --sans icon
		setObjectCamera('sansicon', 'hud')
		addLuaSprite('sansicon')
		setProperty('sansicon.alpha', 0)
		setObjectOrder('sansicon', getObjectOrder('iconP1') + 1)
end

function onUpdatePost(elapsed)
        setProperty('marP1.x', getProperty('iconP1.x') + -50)
        setProperty('marP1.y', getProperty('iconP1.y') - 50)
        setProperty('marloseP1.x', getProperty('iconP1.x') + -50)
        setProperty('marloseP1.y', getProperty('iconP1.y') - 50)
       
	   	setProperty('sansicon.x', getProperty('iconP2.x'))
		scaleObject('sansicon', getProperty('iconP2.scale.x'), getProperty('iconP2.scale.y'))
end

function onStepHit()
	if curStep == 1088 then
		marappearfr = true
	end
end