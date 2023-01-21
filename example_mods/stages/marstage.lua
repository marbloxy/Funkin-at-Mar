function onCreate()
	-- background shit
	makeLuaSprite('Back', 'BG/RoomBack', -600, -300)
	--setScrollFactor('Back', 0.5, 0.5)
	
	addLuaSprite('Back', false)
	
	makeLuaSprite('Furniture', 'BG/RoomFurniture', -600, -300)
	setScrollFactor('Furniture', 0.97, 0.97)
	
	addLuaSprite('Furniture', false)
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end