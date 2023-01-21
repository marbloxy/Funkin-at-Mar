function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'duetnote' and not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
		end
	end
end