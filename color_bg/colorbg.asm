	PROCESSOR	6502
	
	INCLUDE	"vcs.h"
	INCLUDE	"macro.h"

	SEG CODE
	ORG $F000		; defines the origin of the ROM at $F000
START:
	CLEAN_START 	; Macro to safety clear the memory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Set the background color to Yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	LDA #$1E		; Load Color Yellow NTSC ($1E) https://en.wikipedia.org/wiki/List_of_video_game_console_palettes#Atari_2600
	STA COLUBK		; Store A to COLUBK ($09)

	JMP START
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Fill the ROM Size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ORG $FFFC		; Set the origin to the last memory address at the rom
	.word START		; Reset Vector at $FFFC 
	.word START		; Interrupt Vector at $FFFE (unused in VCS)

