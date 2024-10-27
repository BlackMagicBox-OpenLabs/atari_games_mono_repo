	processor 6502

	seg code
	org $F000     	; Define the code origin at $F000

Start:
	sei				; Disable interrupts
	cld           	; Disable the BCD decimal math mode.
	ldx #$FF      	; Loads the X register #$FF
	txs           	; Transfer the X register to the (S)tack Pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Clear the Page Zero region of my memory. ($00 - $FF)
;	Clearing the entire RAM and also the entire TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	lda #0 			; A = 0
	ldx #$FF		; X = #$FF
	sta $FF			; Store A (o) to $FF before start looping to prevent the error by one
MemLoop:
	dex				; X--
	sta $0,X		; Store the value of A (0) to at the memory address in  $0 + X
	bne	MemLoop		; Go back to MemLoop until Z-flag is set (0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Fill the ROM Size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	org $FFFC		; Set the origin to the last memory address at the rom
	.word Start		; Reset vector at $FFFC to where the program starts
	.word Start		; Interrupt vector at $FFFE (Unused in the VCS)
