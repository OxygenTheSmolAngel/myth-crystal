SilverCaveRoom3_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SilverCaveRoom3DailyRedRematchCallback

	def_warp_events
	warp_event  9, 29, SILVER_CAVE_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  6, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER

	object_const_def
	const SILVERCAVEROOM3_RED

SilverCaveRoom3DailyRedRematchCallback:
	disappear SILVERCAVEROOM3_RED
	checkevent EVENT_BEAT_RED
	iftruefwd .Disappear ; we last beat Red, so Leaf needs to be beaten before Red reappears
	checkflag ENGINE_RED_IN_MOUNT_SILVER
	iftruefwd .Disappear
	appear SILVERCAVEROOM3_RED
.Disappear
	endcallback

Red:
	special Special_FadeOutMusic
	showtextfaceplayer .Text1
	winlosstext .Text2, .Text2
	loadtrainer RED, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special Special_FadeOutMusic
	faceplayer
	opentext
	writetext .Text1
	waitbutton
	checkevent EVENT_GOT_MYSTICTICKET_FROM_RED
	iftruefwd .AlreadyHaveMysticTicket
	verbosegivekeyitem MYSTICTICKET
	setevent EVENT_GOT_MYSTICTICKET_FROM_RED
.AlreadyHaveMysticTicket
	closetext
	special Special_ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
	setflag ENGINE_RED_IN_MOUNT_SILVER
	pause 10
	special Special_FadeInQuickly
	checkevent EVENT_UNKI_UNSEALED
	iftruefwd .UnkiAlreadyUnsealed
	special Special_FadeBlackQuickly
	pause 50
	playsound SFX_INTRO_UNOWN_3
	waitsfx
	playsound SFX_INTRO_UNOWN_2
	waitsfx
	playsound SFX_INTRO_UNOWN_1
	waitsfx
	playsound SFX_INTRO_UNOWN_2
	waitsfx
	; Call assembly so the fourth sound will play
	callasm .PlayUnownSound3 ; playsound SFX_INTRO_UNOWN_3
	pause 10
	callasm .PlayUnownSound2 ; playsound SFX_INTRO_UNOWN_2
	pause 10
	callasm .PlayUnownSound1 ; playsound SFX_INTRO_UNOWN_1
	pause 10
	callasm .PlayUnownSound2 ; playsound SFX_INTRO_UNOWN_2
	waitsfx
	pause 30
	special Special_FadeInQuickly
	opentext
	writetext UnkiAwakenedText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	setevent EVENT_UNKI_UNSEALED
	pause 25
	cry UNOWN_KING
	pause 50
	special Special_FadeInQuickly
	pause 30
	special HealParty
	setevent EVENT_BEAT_RED
	end
.UnkiAlreadyUnsealed:
	special HealParty
	setevent EVENT_BEAT_RED
	end

.PlayUnownSound1:
	call SFXChannelsOff
	ld de, SFX_INTRO_UNOWN_1
	jmp PlaySFX

.PlayUnownSound2:
	call SFXChannelsOff
	ld de, SFX_INTRO_UNOWN_2
	jmp PlaySFX

.PlayUnownSound3:
	call SFXChannelsOff
	ld de, SFX_INTRO_UNOWN_3
	jmp PlaySFX

.Text1: ; text > text
	text "……"
	line "……"
	cont "……"
	done

.Text2: ; text > text
	text "…"
	done

UnkiAwakenedText:
	text "You felt a strange"
	line "presence."

	para "It was as if"
	line "someone was waking"
	cont "up."
	done
