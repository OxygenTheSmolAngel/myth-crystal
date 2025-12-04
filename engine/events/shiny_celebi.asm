SpecialGiveShinyCelebi:
; Adding to the party.
; Level 100 Celebi.
	ld hl, wTempMonNickname
	ld de, .Nickname
	call CopyName2
	ld de, wTempMonOT
	ld hl, .OTAndExtra
	ld bc, PLAYER_NAME_LENGTH + 3
	rst CopyBytes

	ld hl, wTempMonSpecies
	ld a, CELEBI
	ld [hli], a
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	ld a, SITRUS_BERRY
	ld [hli], a
	ld a, FUTURE_SIGHT
	ld [hli], a
	ld a, PERISH_SONG
	ld [hli], a
	ld a, PAIN_SPLIT
	ld [hli], a
	xor a
rept NUM_MOVES - 3
	ld [hli], a
endr
	ld a, [wPlayerID]
	add %01100101
	ld [hli], a
	ld a, [wPlayerID + 1]
	adc %10100110
	ld [hli], a
	ld d, 5
	push hl
	farcall CalcExpAtLevel
	pop hl
	ldh a, [hProduct + 1]
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hli], a
	xor a
rept MON_DVS - MON_EVS
	ld [hli], a
endr
	ld a, $ff ; Max DVs
rept MON_PERSONALITY - MON_DVS
	ld [hli], a
endr
	ld a, SHINY_MASK | HIDDEN_ABILITY | TIMID
	ld [hli], a
	ld [hl], MALE | CELEBI_LOST_FORM
	ld hl, wTempMonHappiness
	ld a, BASE_HAPPINESS
	ld [hli], a
	xor a
	ld [hli], a
	ld c, MASTER_BALL
	farcall SetGiftMonCaughtData
	inc hl
	ld [hl], 100
	farcall SetTempPartyMonData
	farcall AddTempMonToParty
	jr c, .box
	ld a, 1
	jr .done

.box
	farcall NewStorageBoxPointer
	jr c, .NotGiven
	ld a, c
	ld [wTempMonSlot], a
	ld a, b
	ld [wTempMonBox], a
	lp bc, CELEBI
	call SetSeenAndCaughtMon
	farcall UpdateStorageBoxMonFromTemp
	ld a, 2
	jr .done

.NotGiven:
	xor a ; ld a, FALSE
.done
	ldh [hScriptVar], a
	ret

.OTAndExtra:
	rawchar "Gold@@@"
	db 0, 0, 0

.Nickname:
	rawchar "Celebi@"
