RuinsOfAlphResearchCenter_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsofAlphResearchCenterTrigger0
	scene_script RuinsofAlphResearchCenterTrigger1

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterAcademicBooks
	bg_event  3,  4, BGEVENT_READ, MapRuinsofAlphResearchCenterSignpost1Script
	bg_event  7,  1, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterPrinterText_DoesntWork
	bg_event  6,  0, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterProfSilktreePhotoText

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	object_event  2,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RuinsFossilScientistScript, -1

	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST4

RuinsofAlphResearchCenterTrigger1:
	sdefer RuinsOfAlphResearchCenterGetUnownDexScript
RuinsofAlphResearchCenterTrigger0:
	end

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequalfwd $1, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterAcademicBooks:
    opentext
    writetext RuinsOfAlphResearchCenterAcademicBooksText
    waitbutton
    closetext
	checkevent EVENT_RUINS_OF_ALPH_CLIMAX_DONE
	iftruefwd .UnownKingBook
	end
.UnownKingBook
    opentext
    writetext UnownKingBookText
    yesorno
    iffalsefwd .NoBook
    special Special_FadeOutMusic
    pause 15
    playmusic MUSIC_THE_LEGEND
    opentext
    writetext UnownKingBookReadText
    waitbutton
    closetext
    special Special_FadeOutMusic
    pause 15
    pokepic UNOWN_KING
    waitbutton
    closepokepic
    opentext
    writetext UnownKingDrawingText
    waitbutton
    closetext
    pause 20
    special RestartMapMusic
    end
.NoBook
    end

RuinsOfAlphResearchCenterGetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	showtext RuinsOfAlphResearchCenterModifiedDexText
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_down
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_up
	setscene $0
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .PrinterAvailable
	jumpopenedtext RuinsOfAlphResearchCenterScientist3Text

.PrinterAvailable:
	checkevent EVENT_RUINS_OF_ALPH_CLIMAX_DONE
	iftruefwd .Conclusion
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	promptbutton
	setevent EVENT_DECO_UNOWN_DOLL
	writetext GotUnownDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext UnownDollSentText
	promptbutton
	writetext RuinsofAlphResearchCenterScientistRewardText
	promptbutton
	writetext RuinsofAlphResearchCenterScientistInterruptedText
	pause 30
	closetext
	pause 15
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	setevent EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	showemote EMOTE_SHOCK, PLAYER, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST1, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST2, 15
	showtext RuinsofAlphResearchCenterScientistShockedText
	readvar VAR_FACING
	ifequalfwd UP, .GoAround
	follow RUINSOFALPHRESEARCHCENTER_SCIENTIST3, PLAYER
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsofAlphResearchCenterLeave2MovementData
	stopfollow
	sjumpfwd .Continue
.GoAround:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsofAlphResearchCenterScientistStepAsideMovementData
	follow RUINSOFALPHRESEARCHCENTER_SCIENTIST3, PLAYER
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_down
	stopfollow
.Continue:
	playsound SFX_EXIT_BUILDING
	disappear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	applyonemovement PLAYER, step_down
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	clearevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST_CLIMAX
	setevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	pause 15
	warpfacing DOWN, RUINS_OF_ALPH_OUTSIDE, 19, 18
	end
.Conclusion:
    checkevent EVENT_RUINS_OF_ALPH_EXTRA_EVENT
    iftruefwd .ExtraEventEnd
	opentext
	writetext RuinsofAlphResearchCenterScientistConclusionText
	waitbutton
	closetext
	checkpoke UNOWN_KING
	iftruefwd .UnownKingExtraEvent
	end
.UnownKingExtraEvent:
	pause 5
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 15
	opentext
	writetext RuinsOfAlphResearchCenterScientist3ExtraText
	yesorno
	iffalsefwd .Refused
	special FadeOutPalettes
	special Special_FadeOutMusic
	pause 30
	playmusic MUSIC_CARPET
	opentext
	writetext UnkiComesOutOfBall
	cry UNOWN_KING
	closetext
	pause 15
	opentext
	writetext UnkiInspectionText
	waitbutton
	closetext
	pause 15
	cry UNOWN_KING
	pause 5
	opentext
	writetext UnkiInspectionText2
	waitbutton
	closetext
	pause 15
	waitsfx
	opentext
	writetext UnkiInspectionText3
	waitbutton
	closetext
	pause 30
	cry UNOWN_KING
	opentext
	writetext UnkiConfusion
	waitbutton
	closetext
	pause 50
	special FadeInPalettes
	reloadmap
	special Special_FadeOutMusic
	special RestartMapMusic
	opentext
	writetext UnkiInspectionEnd
	waitbutton
	closetext
	verbosegiveitem BERSERK_GENE
	opentext
	writetext BerserkGeneText
	waitbutton
	closetext
	pause 10
	opentext
	writetext ExtraEventEndText
	waitbutton
	closetext
	setevent EVENT_RUINS_OF_ALPH_EXTRA_EVENT
	end

.ExtraEventEnd:
    opentext
    writetext ExtraEventEndText
    waitbutton
    closetext
    end

.Refused:
	opentext
	writetext ExtraTextRefusal
	waitbutton
	closetext
	end

RuinsofAlphResearchCenterScientistStepAsideMovementData:
	step_right
	step_down
	step_end

RuinsofAlphResearchCenterLeave2MovementData:
	step_down
	step_down
	step_end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftruefwd .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .UnownAppeared
	jumpopenedtext RuinsOfAlphResearchCenterScientist1Text

.UnownAppeared:
	jumpopenedtext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared

.GotUnownDex:
	jumpopenedtext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifgreater 3, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .UnownAppeared
	jumpopenedtext RuinsOfAlphResearchCenterScientist2Text

.UnownAppeared:
	jumpopenedtext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared

.GotAllUnown:
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .ResearchComplete
	readvar VAR_UNOWNCOUNT
	ifgreater 10, .ResearchOngoing
	jumpopenedtext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown

.ResearchComplete:
	writetext RuinsOfAlphResearchCenterScientist2Text_RadioWaves
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

.ResearchOngoing:
	jumpopenedtext RuinsOfAlphResearchCenterScientist2Text_FocusedOurStudies

MapRuinsofAlphResearchCenterSignpost1Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iffalsefwd .SkipChecking
	checkevent EVENT_DECO_UNOWN_DOLL
	iftruefwd .SkipChecking
	jumpopenedtext RuinsOfAlphResearchCenterComputerText

.SkipChecking:
	readvar VAR_UNOWNCOUNT
	jumpopenedtext RuinsOfAlphResearchCenterComputerText_GotAllUnown

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step_up
	step_up
	step_left
	turn_head_up
	step_end

RuinsFossilScientistScript:
	faceplayer
	opentext
	writetext RuinsFossilScientistText
	waitbutton
	checkitem HELIX_FOSSIL
	iftruefwd .own_helix2
	checkitem DOME_FOSSIL
	iftruefwd .own_dome2
	checkitem OLD_AMBER
	iftruefwd .ask_old_amber2
	jumpopenedtext NoFossils2Text

.own_helix2
	checkitem DOME_FOSSIL
	iftruefwd .own_helix_and_dome2
	checkitem OLD_AMBER
	iftruefwd .ask_helix_amber2
	writetext AskHelixFossil2Text
	yesorno
	iftruefwd ResurrectHelixFossil2
	sjumpfwd .maybe_later2

.own_dome2
	checkitem OLD_AMBER
	iftruefwd .ask_dome_amber2
	writetext AskDomeFossil2Text
	yesorno
	iftruefwd ResurrectDomeFossil2
	sjumpfwd .maybe_later2

.own_helix_and_dome2
	checkitem OLD_AMBER
	iftruefwd .ask_helix_dome_amber2
	loadmenu HelixDomeMenuDataHeader2
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil2
	ifequalfwd $2, ResurrectDomeFossil2
	sjumpfwd .maybe_later2

.ask_old_amber2
	writetext AskOldAmber2Text
	yesorno
	iftruefwd ResurrectOldAmber2
	sjumpfwd .maybe_later2

.ask_helix_amber2
	loadmenu HelixAmberMenuDataHeader2
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil2
	ifequalfwd $2, ResurrectOldAmber2
	sjumpfwd .maybe_later2

.ask_dome_amber2
	loadmenu DomeAmberMenuDataHeader2
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectDomeFossil2
	ifequalfwd $2, ResurrectOldAmber2
	sjumpfwd .maybe_later2

.ask_helix_dome_amber2
	loadmenu HelixDomeAmberMenuDataHeader2
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil2
	ifequalfwd $2, ResurrectDomeFossil2
	ifequalfwd $3, ResurrectOldAmber2
.maybe_later2:
	jumpopenedtext MaybeLater2Text

HelixDomeMenuDataHeader2:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .2MenuData2
	db 1 ; default option

.2MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Cancel@"

HelixAmberMenuDataHeader2:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .2MenuData2
	db 1 ; default option

.2MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helix Fossil@"
	db "Old Amber@"
	db "Cancel@"

DomeAmberMenuDataHeader2:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .2MenuData2
	db 1 ; default option

.2MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Dome Fossil@"
	db "Old Amber@"
	db "Cancel@"

HelixDomeAmberMenuDataHeader2:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 15, 11
	dw .2MenuData2
	db 1 ; default option

.2MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Old Amber@"
	db "Cancel@"

ResurrectHelixFossil2:
	takeitem HELIX_FOSSIL
	scall ResurrectAFossilScript2
	givepoke OMANYTE, 20
	sjumpfwd FinishResurrect2

ResurrectDomeFossil2:
	takeitem DOME_FOSSIL
	scall ResurrectAFossilScript2
	givepoke KABUTO, 20
	sjumpfwd FinishResurrect2

ResurrectOldAmber2:
	takeitem OLD_AMBER
	scall ResurrectAFossilScript2
	givepoke AERODACTYL, 20
FinishResurrect2:
	iffalse_jumpopenedtext NoRoomForFossilPokemon2Text
	jumpopenedtext TakeGoodCareOfIt2Text

ResurrectAFossilScript2:
	writetext ResurrectingPokemon2Text
	waitbutton
	closetext
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST4, UP
	pause 15
	playsound SFX_BOOT_PC
	waitsfx
	pause 30
	playsound SFX_4_NOTE_DITTY
	waitsfx
	pause 5
	waitsfx
	pause 30
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	faceplayer
	opentext
	end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Done!"

	para "I modified your"
	line "#dex."

	para "I added an"
	line "optional #dex"

	para "to store Unown"
	line "data."

	para "It records them"
	line "in alphabetical"
	cont "order."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>'s #dex"
	line "was upgraded."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "The Unown you"
	line "catch will all be"
	cont "recorded."

	para "Check to see how"
	line "many kinds exist."

	para "You're doing a"
	line "favor for us, so"

	para "I'll give you some-"
	line "thing nice if you"
	cont "find all of them."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "You caught all the"
	line "Unown variations?"

	para "That's a great"
	line "achievement!"

	para "You've been very"
	line "helpful to our"
	cont "research."

	para "Let me give you"
	line "this."
	done

GotUnownDollText:
	text "<PLAYER> received"
	line "Unown Doll."
	done

UnownDollSentText:
	text "Unown Doll"
	line "was sent home."
	done

RuinsofAlphResearchCenterScientistRewardText:
	text "I designed that"
	line "doll myself!"
	done

RuinsofAlphResearchCenterScientistInterruptedText:
	text "You can--"
	done

RuinsofAlphResearchCenterScientistShockedText:
	text "What was THAT?!"
	done

RuinsofAlphResearchCenterScientistConclusionText:
	text "We're going to"
	line "gradually study"

	para "the chamber that"
	line "opened up."

	para "We have to take"
	line "care not to"
	cont "disturb the site."

    para "With that said,"
    line "there is now one"
    cont "more mystery..."

    para "Who is the leader"
    line "of the Unown?"

    para "Most of us say"
    line "that the god of"
    cont "#mon is the"

    para "leader."

    para "But to some of"
    line "us, we consider"
    cont "one #mon as the"

    para "true leader of"
    line "the Unown."

    para "The Unown King."

    para "You can read"
    line "about it on the"
    cont "bookcase to the"

    para "right if you"
    line "want."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "The ruins are"
	line "about 1,500 years"
	cont "old."

	para "But it's not known"
	line "why they were"
	cont "built--or by whom."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "I wonder how many"
	line "kinds of #mon"
	cont "are in the ruins?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "#mon appeared"
	line "in the ruins?"

	para "That's incredible"
	line "news!"

	para "We'll need to"
	line "investigate this."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Our investigation,"
	line "with your help, is"

	para "giving us insight"
	line "into the ruins."

	para "The ruins appear"
	line "to have been built"

	para "as a habitat for"
	line "#mon."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "There are odd pat-"
	line "terns drawn on the"

	para "walls of the"
	line "ruins."

	para "They must be the"
	line "keys for unravel-"
	cont "ing the mystery"
	cont "of the ruins."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "The strange #-"
	line "mon you saw in the"
	cont "ruins?"

	para "They appear to be"
	line "very much like the"

	para "drawings on the"
	line "walls there."

	para "Hmm…"

	para "That must mean"
	line "there are many"
	cont "kinds of them…"
	done

RuinsOfAlphResearchCenterScientist2Text_FocusedOurStudies:
	text "We think something"
	line "caused the cryptic"

	para "patterns to appear"
	line "in the ruins."

	para "We've focused our"
	line "studies on that."
	done

RuinsOfAlphResearchCenterScientist2Text_RadioWaves:
	text "According to my"
	line "research…"

	para "Those mysterious"
	line "patterns appeared"

	para "when the #Com"
	line "Center was built."

	para "It must mean that"
	line "radio waves have"

	para "some sort of a"
	line "link…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "Ruins of Alph"

	para "Exploration"
	line "Year 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Mystery #mon"
	line "Name: Unown"

	para "A total of "
	text_decimal hScriptVar, 1, 2
	line "kinds found."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "It's a printer."
	line "The display says"
	cont "“PC LOAD LETTER”."

	para "…What does that"
	line "mean?"
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "It's a photo of"
	line "the Research"

	para "Center's founder,"
	line "Prof.Silktree."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "There are many"
	line "academic books."

	para "Ancient Ruins…"
	line "Mysteries of the"
	cont "Ancients…"
    done

UnownKingBookText:
	text "…"

	para "A book catches"
	line "your eye."

	para "The Unown King:"
	line "The Gluttonous"
	cont "Beast that"

	para "Plagued the"
	line "Johto Region."

	para "Read the book?"
	done

UnownKingBookReadText:
    text "Long ago, there"
    line "was a #mon that"
    cont "ruled over a"

    para "mysterious"
    line "species of"
    cont "#mon."

    para "His name"
    line "is the Unown"
    cont "King."

    para "He was said to"
    line "be a god amongst"
    cont "other gods."

    para "A god of power and"
    line "brutality."

    para "He used to offer"
    line "unfathomable"
    cont "power to those who"

    para "worship him."

    para "But one day,"
    line "a disastrous"
    cont "event would occur."

    para "This event was"
    line "called: The"
    cont "Bloodthirsty"

    para "Doomsday."

    para "The Unown King"
    line "rampaged around"
    cont "the Johto Region,"

    para "devouring every"
    line "living being that"
    cont "stood in his way."

    para "Eventually, three"
    line "sages, with the"
    cont "help of the god"

    para "of all #mon,"
    line "sealed the Unown"
    cont "King in the Ruins"

    para "of Alph."

    para "He was put in a"
    line "thousand-year"
    cont "long slumber,"

    para "and the god of"
    line "#mon was now"
    cont "considered the"

    para "ruler of the"
    line "Unown."

    para "But one day,"
    line "the Unown King"
    cont "will awaken."

    para "And when he"
    line "does, he will"
    cont "cause destruction"

    para "all over the Johto"
    line "region once again."

    para "The Unown King"
    line "will achieve"
    cont "liberation."
    done

UnownKingDrawingText:
    text "It's a drawing"
    line "depicting the"
    cont "Unown King."

    para "………"

    para "You get a strange"
    line "feeling that you"
    cont "will encounter"

    para "this #mon in"
    line "the future…"
    done

RuinsOfAlphResearchCenterScientist3ExtraText:
	text "W-Wait just a"
	line "second!"

	para "That #mon… It"
	line "can't be…"

	para "Is that the"
	line "Unown King?"

	para "The legendary"
	line "ruler of Unown who"
	cont "was sealed away"

	para "for thousands of"
	line "years?"

	para "I can't believe "
	line "it! The rumors"
	cont "were really true!"

	para "If it is okay, can"
	line "I inspect this"
	cont "#mon for a bit?"
	done

ExtraTextRefusal:
	text "Hm. That is okay."

	para "But please come"
	line "back if you do"
	cont "change your mind."
	done

UnkiComesOutOfBall:
	text "You took the"
	line "Unown King out"
	cont "his Ball."
	done

UnkiInspectionText:
	text "Wow… This is"
	line "amazing…"

	para "The Unown King in"
	line "the flesh… This"
	cont "is revolutionary."

	para "All of those years"
	line "researching these"
	cont "ruins has led up"

	para "to this."

	para "That big red eye…"
	line "Those crown-like"
	cont "spikes…"

	para "I need to inspect"
	line "this beast some"
	cont "more…"
	done

UnkiInspectionText2:
	text "Mmm…"
	line "These claws are"
	cont "surprisingly soft."

	para "But those sharp"
	line "fangs can dig into"
	cont "anything…"

	para "It feels surreal"
	line "holding onto the"
	cont "Unown King's"

	para "most well-known"
	line "features."

	para "Though, I do"
	line "wonder…"

	para "Does this beast"
	line "eat with his"
	cont "claws, or does"

	para "he have a hidden"
	line "mouth underneath"
	cont "his big eye?"

	para "Aaaaaanyways…"
	done

UnkiInspectionText3:
	text "Huh… This guy"
	line "is a lot fatter"
	cont "than how he is"

	para "depicted in the"
	line "drawing."

	para "Makes sense,"
	line "though."

	para "Devouring many"
	line "living beings"
	cont "would definitely"

	para "make him gain a"
	line "few pounds."

	para "But despite that,"
	line "he does look quite"
	cont "the same."

	para "Let me note this"
	line "down real quick..."
	done

UnkiConfusion:
	para "....."

    para "The Unown King"
    line "doesn't seem to be"
    cont "used to this."
    done

UnkiInspectionEnd:
	text "Phew... Sorry it"
	line "took a while."

	para "But with these new"
	line "details about the"
	cont "Unown King, we"

	para "might be a step"
	line "closer to"
	cont "uncovering all"

	para "of the Ruins of"
	line "Alph's secrets."

	para "Thank you so"
	line "much for"
	cont "contributing to"

	para "our research."

	para "Here, have this"
	line "as thanks."
	done

BerserkGeneText:
    text "This Berserk Gene"
    line "was found during"
    cont "one of our"

    para "expeditions at"
    line "Cerulean Cave" 
    cont "in the Kanto"

    para "region."

    para "We are not sure"
    line "what this does"
    cont "nor why it was"

    para "there. But I"
    line "feel like you"
    cont "could find a"

    para "use for this."
    done

ExtraEventEndText:
    para "But anyways, our"
    line "work here isn't"
    cont "over."

    para "There are still"
    line "many things to"
    cont "uncover here."

    para "But regardless,"
    line "thank you for your"
    cont "contribution."

    para "Please take care of"
    line "the Unown King."

    para "He really needs it."
    done

RuinsFossilScientistText:
	text "Did you know that"
	line "you can extract"

	para "#mon from"
	line "fossils?"

	para "I may not be able"
	line "to take care of it"
	cont "myself."

	para "But I know someone"
	line "from the Pewter"
	cont "Museum who can."

	para "If you ever need"
	line "to, I can transfer"
	cont "your fossils to"

	para "my friend so he"
	line "can resurrect"
	cont "them."
	done

AskHelixFossil2Text:
	text "Do you want to"
	line "resurrect the"
	cont "Helix Fossil?"
	done

AskDomeFossil2Text:
	text "Do you want to"
	line "resurrect the"
	cont "Dome Fossil?"
	done

AskOldAmber2Text:
	text "Do you want to"
	line "resurrect the"
	cont "Old Amber?"
	done

NoFossils2Text:
	text "Hey! You don't"
	line "have any fossils."
	done

MaybeLater2Text:
	text "Just talk to me"
	line "if you change"
	cont "your mind."
	done

ResurrectingPokemon2Text:
	text "OK! I'll send the"
	line "fossil to the"
	cont "Pewter Museum."

	para "One second."
	done

NoRoomForFossilPokemon2Text:
	text "Hey! You can't"
	line "carry another"
	cont "#mon, and your"
	cont "Box is full, too!"
	done

TakeGoodCareOfIt2Text:
	text "Take good care"
	line "of it!"
	done
