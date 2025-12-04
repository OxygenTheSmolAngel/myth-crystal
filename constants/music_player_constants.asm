DEF PIANO_ROLL_HEIGHT EQU 14
DEF PIANO_ROLL_HEIGHT_PX EQU PIANO_ROLL_HEIGHT * 8

DEF MP_HUD_TOP EQU PIANO_ROLL_HEIGHT + 1
DEF MP_HUD_HEIGHT EQU SCREEN_HEIGHT - PIANO_ROLL_HEIGHT

DEF MP_LIST_CURSOR_Y EQU 8 ; (SCREEN_HEIGHT - 1) / 2
DEF MP_LIST_PAGE_SKIP EQU 10

DEF NUM_WAVEFORMS EQU 13
DEF NUM_NOISE_SETS EQU 6
DEF MAX_PITCH_TRANSPOSITION EQU 12
DEF MAX_TEMPO_ADJUSTMENT EQU 120

	const_def
	const MP_EDIT_CH1   ; 0
	const MP_EDIT_CH2   ; 1
	const MP_EDIT_WAVE  ; 2
	const MP_EDIT_NOISE ; 3
	const MP_EDIT_PITCH ; 4
	const MP_EDIT_TEMPO ; 5
DEF NUM_MP_EDIT_FIELDS EQU const_value

; SongOrigins indexes (see data/music_player/song_origins.asm)
	const_def
	const ORIGIN_RB        ; 00
	const ORIGIN_Y         ; 01
	const ORIGIN_GS        ; 02
	const ORIGIN_C         ; 03
	const ORIGIN_RSE       ; 04
	const ORIGIN_FRLG      ; 05
	const ORIGIN_DPPT      ; 06
	const ORIGIN_HGSS      ; 07
	const ORIGIN_BW        ; 08
	const ORIGIN_B2W2      ; 09
	const ORIGIN_XY        ; 0a
	const ORIGIN_ORAS      ; 0b
	const ORIGIN_SM        ; 0c
	const ORIGIN_SWSH      ; 0d
	const ORIGIN_STADIUM   ; 0e
	const ORIGIN_GO        ; 0f
	const ORIGIN_M02       ; 10
	const ORIGIN_PRISM     ; 11
	const ORIGIN_UNDERTALE ; 12
	const ORIGIN_DELTARUNE ; 13
	const ORIGIN_BLUESKY   ; 14
	const ORIGIN_KIRBY64   ; 15
	const ORIGIN_SKNIGHT   ; 16
	const ORIGIN_LULLABY   ; 17
	const ORIGIN_YOUTUBE   ; 18
DEF NUM_SONG_ORIGINS EQU const_value

; SongArtists indexes (see data/music_player/song_artists.asm)
	const_def
	const COMPOSER_NONE                          ; 00
	const COMPOSER_JUNICHI_MASUDA                ; 01
	const COMPOSER_GO_ICHINOSE                   ; 02
	const COMPOSER_JUNICHI_MASUDA_GO_ICHINOSE    ; 03
	const COMPOSER_GO_ICHINOSE_JUN_ISHIKAWA      ; 04
	const COMPOSER_MORIKAZU_AOKI                 ; 05
	const COMPOSER_SHOTA_KAGEYAMA                ; 06
	const COMPOSER_JUNICHI_MASUDA_SHOTA_KAGEYAMA ; 07
	const COMPOSER_HITOMI_SATO                   ; 08
	const COMPOSER_MINAKO_ADACHI                 ; 09
	const COMPOSER_ICHIRO_SHIMAKURA              ; 0a
	const COMPOSER_JOHN_LISSAUER_RALPH_SCHUCKETT ; 0b
	const COMPOSER_FROGGESTSPIRIT                ; 0c
	const COMPOSER_MMMMMM                        ; 0d
	const COMPOSER_PUM                           ; 0e
	const COMPOSER_SHANTYTOWN                    ; 0f
	const COMPOSER_PIGU                          ; 10
	const COMPOSER_SHOCKSLAYER                   ; 11
	const COMPOSER_MONSTARULES                   ; 12
	const COMPOSER_TRITEHEXAGON                  ; 13
	const COMPOSER_PIGU_PIKALAXALT               ; 14
	const COMPOSER_GACT_PIGU                     ; 15
	const COMPOSER_LEVUSBEVUS                    ; 16
	const COMPOSER_GACT                          ; 17
	const COMPOSER_GRONNOC                       ; 18
	const COMPOSER_CAT333POKEMON                 ; 19
	const COMPOSER_NOTFROGGESTSPIRIT             ; 1a
	const COMPOSER_TOBY_FOX                      ; 1b
	const COMPOSER_SHINKONETCAVY_SHOCKSLAYER     ; 1c
	const COMPOSER_OXYGENTHESMOLANGEL            ; 1d
	const COMPOSER_JUN_ISHIKAWA                  ; 1e
	const COMPOSER_MANAMI_MATSUMAE               ; 1f
	const COMPOSER_ADAM_MCHUMMUS                 ; 20
	const COMPOSER_LADY_GAGA_LHUGUENY            ; 21
DEF NUM_SONG_ARTISTS EQU const_value
