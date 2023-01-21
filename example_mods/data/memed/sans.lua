-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
function onCreate()
	precacheImage('characters/SANS')
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('sans', 'characters/SANS', 530, -1000); --   520,-289  -1000
	addAnimationByPrefix('sans', 'idle', 'Idle', 24, false);
	addAnimationByPrefix('sans', 'singLEFT', 'Left', 24, false);
	addAnimationByPrefix('sans', 'singDOWN', 'Down', 24, false);
	addAnimationByPrefix('sans', 'singUP', 'Up', 24, false);
	addAnimationByPrefix('sans', 'singRIGHT', 'Right', 24, false);
	
	addLuaSprite('sans', true);

	playAnimation('sans', 0, true);
end

animationsList = {}
holdTimers = {sans = -1.0};
noteDatas = {sans = 0};
function makeAnimationList()
	animationsList[0] = 'idle';
	animationsList[1] = 'singLEFT';
	animationsList[2] = 'singDOWN';
	animationsList[3] = 'singUP';
	animationsList[4] = 'singRIGHT';
end

offsetssans = {};
function makeOffsets()
	offsetssans[0] = {x = -35, y = -188}; --idle
	offsetssans[1] = {x = -22, y = -188}; --left
	offsetssans[2] = {x = -35, y = -237}; --down
	offsetssans[3] = {x = -37, y = -153}; --up
	offsetssans[4] = {x = -15, y = 77}; --right
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'sansnote' then
		if not isSustainNote then
			noteDatas.sans = direction;
		end	
	characterToPlay = 'sans'
	animToPlay = noteDatas.sans;
	holdTimers.sans = 0;
			
	playAnimation(characterToPlay, animToPlay + 1, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.sans >= 0 then
		holdTimers.sans = holdTimers.sans + elapsed;
		if holdTimers.sans >= holdCap then
			playAnimation('sans', 0, false);
			holdTimers.sans = -1;
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
		if holdTimers.sans < 0 then
			playAnimation('sans', 0, false);
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
	if character == 'sans' then
		objectPlayAnimation('sans', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('sans.offset.x', offsetssans[animId].x);
		setProperty('sans.offset.y', offsetssans[animId].y);
	end
end