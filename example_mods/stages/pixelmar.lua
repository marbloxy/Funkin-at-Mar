function onCreate()
	-- background shit
	makeLuaSprite('Back', 'BG/PixelRoomBack', -280, -115)
	--setScrollFactor('Back', 0.5, 0.5)
	scaleObject('Back', 10.5, 10.5);
	setProperty('Back.antialiasing', false)
	
	addLuaSprite('Back', false)
	
	makeLuaSprite('Furniture', 'BG/PixelRoomFurniture', -335,  -105)
	setScrollFactor('Furniture', 0.97, 0.97)
	scaleObject('Furniture', 10.5, 10.5);
	setProperty('Furniture.antialiasing', false)
	
	addLuaSprite('Furniture', false)
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end