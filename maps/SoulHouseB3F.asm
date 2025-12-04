SoulHouseB3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  4, SOUL_HOUSE_B2F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 13, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseB3FMrFujiScript, EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	itemball_event  6,  9, ESCAPE_ROPE, 1, EVENT_SOUL_HOUSE_B3F_ESCAPE_ROPE

	object_const_def
	const SOULHOUSEB3F_MRFUJI

SoulHouseB3FMrFujiScript:
	faceplayer
	opentext
	writetext MrFujiText
	waitbutton
	writetext MrFujiGiveSilphScopeText
	waitbutton
	verbosegivekeyitem SILPHSCOPE2

	writetext MrFujiUseThisText
	waitbutton
	closetext
	setevent EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	readvar VAR_FACING
	ifequalfwd RIGHT, .GoAround
	applymovement SOULHOUSEB3F_MRFUJI, .LeaveMovement
	sjumpfwd .Finish
.GoAround
	applymovement SOULHOUSEB3F_MRFUJI, .GoAroundMovement1
	turnobject PLAYER, UP
	applymovement SOULHOUSEB3F_MRFUJI, .GoAroundMovement2
.Finish
	disappear SOULHOUSEB3F_MRFUJI
	setevent EVENT_SOUL_HOUSE_MR_FUJI
	end

.LeaveMovement:
	slow_step_left
	slow_step_left
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

.GoAroundMovement1:
	slow_step_right
	slow_step_right
	slow_step_up
	slow_step_up
	slow_step_left
	slow_step_left
	step_end

.GoAroundMovement2:
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

MrFujiText:
	text "Mr.Fuji: Welcome."

	para "I was just here"
	line "mourning for a"
	cont "bit."

	para "Hmm… You appear to"
	line "be raising your"

	para "#mon in a kind"
	line "and loving manner."

	para "#mon lovers"
	line "come here to pay"

	para "their respects to"
	line "departed #mon."

	para "Please offer con-"
	line "dolences for the"

	para "souls of the de-"
	line "parted #mon."

	para "I'm sure that will"
	line "make them happy."
	done

MrFujiGiveSilphScopeText:
	text "Here, I have"
	line "a gift for you."

	para "Please, take it."
	done

MrFujiUseThisText:
	text "You may use that"
	line "to help ease the"

	para "souls of any"
	line "restless #mon."

	para "With that said,"
	line "I should head back"
	cont "upstairs."

	para "Please take good"
	line "care of your"
	cont "#mon, alright?"
	done
