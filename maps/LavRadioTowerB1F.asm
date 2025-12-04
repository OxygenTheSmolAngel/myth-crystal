LavRadioTowerB1F_MapScriptHeader:
	def_warp_events
	warp_event 17,  0, LAV_RADIO_TOWER_1F, 4

	def_bg_events
	bg_event 9,  9, BGEVENT_READ, LavRadioTowerB1FGrave

LavRadioTowerB1FGrave:
    faceplayer
	opentext
	writetext GraveText
	waitbutton
	closetext
	checkevent EVENT_GIFTED_GOLD_CELEBI
	iftruefwd .EventEnd
	checkevent EVENT_BEAT_GOLD
	iftruefwd .GiftCelebi
	faceplayer
	pause 15
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Grave2Text
	waitbutton
	closetext
	pause 15
	opentext
	writetext GoldText
	waitbutton
	closetext
	winlosstext GoldWinLossText, GoldWinLossText
	loadtrainer CAL, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	setevent EVENT_BEAT_GOLD
	opentext
	writetext GoldAfterText
	waitbutton
	closetext
	checkevent EVENT_BEAT_GOLD
	iftruefwd .GiftCelebi
	end
.GiftCelebi
	showtextfaceplayer GoldCelebiGift
	special SpecialGiveShinyCelebi
	opentext
	writetext GoldText_GotShinyCelebi
	playsound SFX_KEY_ITEM
	waitbutton
	closetext
	iffalse_jumpopenedtext GoldText_PartyAndBoxFull
	waitsfx
	ifequalfwd 1, .in_party
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
	end
	
.BoxNotFull
	special GetCurBoxName
	writetext GoldText_SentToPC
	promptbutton
	closetext
	pause 5
	opentext
	writetext GoldCelebiGiftEnd
	waitbutton
	closetext
.in_party
	setevent EVENT_GIFTED_GOLD_CELEBI
	end
	
	.EventEnd
	end

	GraveText: ; text > text
	text "Here lies Gold"
	line "1989 - 1999"

	para "A trainer with a"
	line "heart of gold."

	para "May he rest in"
	line "peace."
	done

	Grave2Text: ; text > text
	text "!!!"

	para "The gravestone is"
	line "moving."
	done

	GoldText: ; text > text
	text "I'M DEAD..."
	done

GoldWinLossText: ; text > text
	text "OH..."

	para "I LOST..."

	para "I THOUGHT I"
	line "COULD WIN WITH" 
	cont "THIS TEAM..."
	done

GoldAfterText: ; text > text
	text "..."
	line "..."

	para "...YOU..."

	para "YOU REMIND ME OF"
	line "HOW I USED TO BE"
	para "BACK THEN..."

	para "BEFORE I DIED,"
	line "I USED TO BE A"
	cont "STRONG TRAINER"

	para "LIKE YOU."

	para "I WAS STUCK IN"
	line "PURGATORY FOR SO"
	cont "LONG, THAT I'VE"

	para "FORGOTTEN HOW FUN"
	line "#MON BATTLES"
	cont "WERE."

	para "THANK YOU, FELLOW"
	line "TRAINER, FOR"
	cont "MAKING ME"

	para "REMEMBER..."
	done

GoldCelebiGift:
    text "IT'S NOT MUCH,"
    line "BUT...."

	para "...HERE, TAKE THIS"
	line "CELEBI WITH YOU."

	para "I THINK YOU'LL"
	line "DO A MUCH BETTER"
	cont "JOB AT TAKING CARE"

	para "OF IF THAN ME..."
	done

GoldText_GotShinyCelebi:
	text "<PLAYER> received"
	line "Gold's Celebi."
	done

GoldText_SentToPC:
	text "Celebi was sent"
	line "to "
	text_ram wStringBuffer1
	text "."
	done

GoldText_PartyAndBoxFull:
	text "OH... YOU DON'T"
	line "HAVE SPACE IN YOUR"
	cont "PARTY NOR YOUR"

	para "BOXES..."

	para "DON'T WORRY, I"
	line "WILL WAIT HERE FOR"
	cont "WHEN YOU HAVE"

	para "ENOUGH SPACE..."
	done

GoldCelebiGiftEnd:
    text "THE POOR THING..."
    
    para "IT LOOKS SO"
    line "MORIBUND WITH"
    cont "ONLY HALF ITS"

    para "BODY."

    para "PLEASE TAKE GOOD"
    line "CARE OF IT..."

    para "WITH THAT SAID..."
    line "I MUST GO...."

    para "GOODBYE...."
    line "MAY WE MEET"
    cont "AGAIN..."
    done
