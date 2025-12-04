RuinsOfAlphInnerChamber_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsofAlphInnerChamberTrigger0
	scene_script RuinsofAlphInnerChamberTrigger1

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphInnerChamberPitCallback

	def_warp_events
	warp_event 10, 19, RUINS_OF_ALPH_ENTRANCE_CHAMBER, 3
	warp_event  3, 21, RUINS_OF_ALPH_HO_OH_CHAMBER, 3
	warp_event  4, 21, RUINS_OF_ALPH_HO_OH_CHAMBER, 4
	warp_event 15,  9, RUINS_OF_ALPH_KABUTO_CHAMBER, 3
	warp_event 16,  9, RUINS_OF_ALPH_KABUTO_CHAMBER, 4
	warp_event  3, 27, RUINS_OF_ALPH_OMANYTE_CHAMBER, 3
	warp_event  4, 27, RUINS_OF_ALPH_OMANYTE_CHAMBER, 4
	warp_event 15, 30, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 3
	warp_event 16, 30, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 4
	warp_event  9,  1, RUINS_OF_ALPH_UNOWNKING_CHAMBER, 1
	warp_event 10,  1, RUINS_OF_ALPH_UNOWNKING_CHAMBER, 2
	warp_event  9,  7, RUINS_OF_ALPH_UNOWNKING_CHAMBER, 3

	def_coord_events

	def_bg_events
	bg_event  2,  9, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  9, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  8,  9, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  9,  5, BGEVENT_READ,     RuinsOfAlphUnownKingCheck
	bg_event 11,  9, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14,  9, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17,  9, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  2, 14, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5, 14, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  8, 14, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 11, 14, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14, 14, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17, 14, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  2, 19, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5, 19, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14, 19, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17, 19, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  2, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  8, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 11, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  2, 30, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5, 30, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  8, 30, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 11, 30, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14, 30, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17, 30, BGEVENT_JUMPTEXT, RuinsofAlphStatueText

	def_object_events
	object_event  3, 13, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphInnerChamberFisherText, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 14, 20, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphInnerChamberTeacherText, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 11, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphInnerChamberGrampsText, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event  7, 17, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphInnerChamberScientistText, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS

RuinsofAlphInnerChamberTrigger1:
	sdefer RuinsOfAlphInnerChamberStrangePresenceScript
RuinsofAlphInnerChamberTrigger0:
	end

RuinsofAlphInnerChamberPitCallback:
	checkevent EVENT_UNKI_CHAMBER_UNLOCKED
	iftruefwd .FloorOpen
	endcallback

.FloorOpen:
    checkevent EVENT_CAUGHT_UNKI
    iftruefwd .UnkiCaught
	changeblock  9, 1, $29
	changeblock 10, 1, $2A
	endcallback

.UnkiCaught:
endcallback

RuinsOfAlphInnerChamberStrangePresenceScript:
	showtext RuinsOfAlphStrangePresenceText
	setscene $0
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	end

RuinsOfAlphUnownKingCheck:
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .RuinsOfAlphUnownKing
	end
.RuinsOfAlphUnownKing:
	faceplayer
	checkevent EVENT_CAUGHT_UNKI
	iftruefwd .UnkiLiberated
	checkevent EVENT_UNKI_UNSEALED
	iffalsefwd .ChamberStatue
	opentext
	writetext RuinsOfAlphInnerChamberStatueAltText
	waitbutton
	closetext
	checkevent EVENT_BEAT_UNKI
	iftruefwd .EndUnownKing
	checkevent EVENT_UNKI_CHAMBER_UNLOCKED
	iftruefwd .ChamberUnlocked
	opentext
	writetext RuinsOfAlphInnerChamberStatueInteractText
	yesorno
	iffalsefwd .InteractionRefused
	special Special_FadeOutMusic
	pause 35
	playsound SFX_STRENGTH
	earthquake 30
	waitsfx
	pause 15
	writetext UnkiStatueText
	waitbutton
	playsound SFX_STRENGTH
	earthquake 50
	waitsfx
	pause 30
	playsound SFX_STRENGTH
	earthquake 15
	setevent EVENT_UNKI_CHAMBER_UNLOCKED
	changeblock  9, 1, $29
	changeblock 10, 1, $2A
	refreshmap
	opentext
	writetext SecretPassageOpenedText
	waitbutton
	closetext
	special RestartMapMusic
	end

.ChamberStatue:
	jumptext RuinsOfAlphInnerChamberStatueText
.InteractionRefused:
	faceplayer
	opentext
	writetext InteractionRefusedText
	waitbutton
	closetext
	end
.ChamberUnlocked
	faceplayer
	opentext
	writetext SecretPassageOpenedText
	waitbutton
	closetext
	end
.EndUnownKing:
	faceplayer
	opentext
	writetext UnkiStatueEndText
	waitbutton
	closetext
	end
.UnkiLiberated
	opentext
	writetext UnkiLiberatedText
	waitbutton
	closetext
	end

RuinsOfAlphInnerChamberStatueAltText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."

	para "Something about it"
	line "seems... Strange."
	done

RuinsOfAlphInnerChamberStatueInteractText:
	text "Interact with the"
	line "statue?"
	done

InteractionRefusedText:
	text "You refused to"
	line "interact with the"
	cont "statue."
	done


RuinsOfAlphStrangePresenceText:
	text "There is a strange"
	line "presence here…"
	done

RuinsOfAlphInnerChamberFisherText:
	text "This is a big"
	line "room, but there's"
	cont "nothing here."
	done

RuinsOfAlphInnerChamberTeacherText:
	text "This place has a"
	line "mystical quality"
	cont "to it."

	para "It feels sort of"
	line "ethereal even."
	done

RuinsOfAlphInnerChamberGrampsText:
	text "The ruins have not"
	line "been robbed or"
	cont "tampered with."

	para "Something here"
	line "must make people"
	cont "want to preserve"
	cont "it."
	done

RuinsOfAlphInnerChamberScientistText:
	text "The patterns on"
	line "the wall appear to"
	cont "be words!"

	para "And those sliding"
	line "stone panels seem"

	para "to be signals of"
	line "some kind."

	para "I think they make"
	line "#mon appear,"

	para "but it's not clear"
	line "yet…"
	done

UnkiStatueText:
	text "......!!"

	para "The statue seems"
	line "to be shaking"
	cont "violently!"
	done

UnkiStatueEndText:
	text "And with that..."
	line "The Unown King"
	cont "rests again..."
	done

RuinsOfAlphInnerChamberStatueText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

UnkiCaughtText:
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

UnkiLiberatedText:
	text "The Unown King"
	line "has been"
	cont "liberated."
	done

SecretPassageOpenedText:
    text "A new path has"
    line "opened."
    done
