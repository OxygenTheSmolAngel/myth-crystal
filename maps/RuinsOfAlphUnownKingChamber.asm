RuinsOfAlphUnownKingChamber_MapScriptHeader:
	def_scene_scripts

	def_callbacks
callback MAPCALLBACK_OBJECTS, RuinsOfAlphUnownKingCallback

	def_warp_events
	warp_event 12, 32, RUINS_OF_ALPH_INNER_CHAMBER, 3
	warp_event 13, 32, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event 12, 37, RUINS_OF_ALPH_INNER_CHAMBER, 12
	
	def_coord_events

	def_bg_events
	bg_event 10, 31, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 15, 31, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8, 25, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 25, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8,  5, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17,  5, BGEVENT_READ, RuinsOfAlphInnerChamberStatue

	def_object_events
	object_event 12,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, UNOWN_KING, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, NO_FORM, UnownKingEncounter, EVENT_UNOWN_KING

	object_const_def
	const RUINSOFALPH_UNOWNKING

RuinsOfAlphUnownKingCallback:
	checkevent EVENT_BEAT_UNKI
	iffalsefwd .DoesAppear
	disappear RUINSOFALPH_UNOWNKING
	endcallback

.DoesAppear:
	appear RUINSOFALPH_UNOWNKING
	endcallback

UnownKingEncounter:
	faceplayer
	opentext
	writetext UnownKingText2
	cry UNOWN_KING
	pause 15
	closetext
	setevent EVENT_BEAT_UNKI
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	loadwildmon UNOWN_KING, 85
	startbattle
	disappear RUINSOFALPH_UNOWNKING
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .nocatch
	setevent EVENT_CAUGHT_UNKI
	cry UNOWN_KING
	opentext
	writetext UnkiCaughtText2
	waitbutton
	closetext
	end
.nocatch
	opentext
	writetext UnkiEndText2
	waitbutton
	closetext
	pause 20
	end

RuinsOfAlphInnerChamberStatue:
    opentext
    writetext RuinsOfAlphInnerChamberStatueText2
    waitbutton
    closetext
    end

UnownKingText2:
	text "Kiiiiiinggg!!!"
	done

UnkiEndText2:
	text "And with that..."
	line "The Unown King"
	cont "rests again..."
	done

UnkiCaughtText2:
	text "The Unown King"
	line "seems to admire"
	cont "your skills."

	para "Therefore, he will"
	line "join you and your"
	cont "party."

	para "The Unown King has"
	line "finally achieved"
	cont "liberation."
	done

RuinsOfAlphInnerChamberStatueText2:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done