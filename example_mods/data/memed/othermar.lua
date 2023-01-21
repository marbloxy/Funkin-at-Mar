-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
function onCreate()
	precacheImage('characters/MarFunkIN')
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('mar2', 'characters/MarFunkIN', 100, 100);
	addAnimationByPrefix('mar2', 'idle', 'Idle', 24, false);
	addAnimationByPrefix('mar2', 'singLEFT', 'Left', 24, false);
	addAnimationByPrefix('mar2', 'singDOWN', 'Down', 24, false);
	addAnimationByPrefix('mar2', 'singUP', 'Up', 24, false);
	addAnimationByPrefix('mar2', 'singRIGHT', 'fuckyou', 24, false);
	
	addLuaSprite('mar2', true);

	playAnimation('mar2', 0, true);
end

animationsList = {}
holdTimers = {mar2 = -1.0};
noteDatas = {mar2 = 0};
function makeAnimationList()
	animationsList[0] = 'idle';
	animationsList[1] = 'singLEFT';
	animationsList[2] = 'singDOWN';
	animationsList[3] = 'singUP';
	animationsList[4] = 'singRIGHT';
end

offsetsmar2 = {};
function makeOffsets()
	offsetsmar2[0] = {x = -29, y = 61}; --idle
	offsetsmar2[1] = {x = -25, y = 65}; --left
	offsetsmar2[2] = {x = -31, y = 65}; --down
	offsetsmar2[3] = {x = -27, y = 71}; --up
	offsetsmar2[4] = {x = -24, y = 71}; --right
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'marnote' or noteType == 'duetnote' then
		if not isSustainNote then
			noteDatas.mar2 = direction;
		end	
	characterToPlay = 'mar2'
	animToPlay = noteDatas.mar2;
	holdTimers.mar2 = 0;
			
	playAnimation(characterToPlay, animToPlay + 1, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.mar2 >= 0 then
		holdTimers.mar2 = holdTimers.mar2 + elapsed;
		if holdTimers.mar2 >= holdCap then
			playAnimation('mar2', 0, false);
			holdTimers.mar2 = -1;
		end
	end
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.mar2 < 0 then
			playAnimation('mar2', 0, false);
		end
	end
end

function playAnimation(character, animId, forced)
	-- 0 = idle
	-- 1 = singLEFT
	-- 2 = singDOWN
	-- 3 = singUP
	-- 4 = singRIGHT
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'mar2' then
		objectPlayAnimation('mar2', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('mar2.offset.x', offsetsmar2[animId].x);
		setProperty('mar2.offset.y', offsetsmar2[animId].y);
	end
end