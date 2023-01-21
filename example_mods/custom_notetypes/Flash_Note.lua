local imgcount = 0
local randomimage = 0
local imageselect = idklol

function onCreate()
	precacheImage('mechanics/flash')
	precacheImage('mechanics/funkin')
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Flash_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Flash_Notee'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-0.0475');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
--getRandomInt(min, max)
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Flash_Note' then
		characterPlayAnim('boyfriend', 'hurt', true)
		playSound('sussy baki', '1')
		randomimage = getRandomInt(1, 2)
		--runTimer('imagechoosing', 0)
		if randomimage == 1 then
			imageselect = 'mechanics/flash'
		end
		if randomimage == 2 then
			imageselect = 'mechanics/funkin'
		end
		if imgcount == 0 then
			imgcount = 1
			makeLuaSprite('img1', imageselect, math.random(0, 800), math.random(0, 500))
			setObjectCamera('img1', 'other')
			addLuaSprite('img1', true)
			runTimer('img1dissapear', 0.5)
		elseif imgcount == 1 then
			imgcount = 2
			makeLuaSprite('img2', imageselect, math.random(0, 800), math.random(0, 500))
			setObjectCamera('img2', 'other')
			addLuaSprite('img2', true)
			runTimer('img2dissapear', 0.5)
		elseif imgcount == 2 then
			imgcount = 3
			makeLuaSprite('img3', imageselect, math.random(0, 800), math.random(0, 500))
			setObjectCamera('img3', 'other')
			addLuaSprite('img3', true)
			runTimer('img3dissapear', 0.5)
		elseif imgcount == 3 then
			imgcount = 4
			makeLuaSprite('img4', imageselect, math.random(0, 800), math.random(0, 500))
			setObjectCamera('img4', 'other')
			addLuaSprite('img4', true)
			runTimer('img4dissapear', 0.5)
		elseif imgcount == 4 then
			imgcount = 0
			makeLuaSprite('img5', imageselect, math.random(0, 800), math.random(0, 500))
			setObjectCamera('img5', 'other')
			addLuaSprite('img5', true)
			runTimer('img5dissapear', 0.5)
		end
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Flash_Note' then
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'img1dissapear' then
		doTweenAlpha('img1gone', 'img1', 0, 0.3,'sineIn');
	end
	if tag == 'img2dissapear' then
		doTweenAlpha('img2gone', 'img2', 0, 0.3,'sineIn');
	end
	if tag == 'img3dissapear' then
		doTweenAlpha('img3gone', 'img3', 0, 0.3,'sineIn');
	end
	if tag == 'img4dissapear' then
		doTweenAlpha('img4gone', 'img4', 0, 0.3,'sineIn');
	end
	if tag == 'img5dissapear' then
		doTweenAlpha('img5gone', 'img5', 0, 0.3,'sineIn');
	end
end

function onTweenCompleted(tag)
	if tag == 'img1gone' then
		removeLuaSprite('img1', true)
	end
	if tag == 'img2gone' then
		removeLuaSprite('img2', true)
	end
	if tag == 'img3gone' then
		removeLuaSprite('img3', true)
	end
	if tag == 'img4gone' then
		removeLuaSprite('img4', true)
	end
	if tag == 'img5gone' then
		removeLuaSprite('img5', true)
	end
end

--math.random(0, 800), X
---0.040