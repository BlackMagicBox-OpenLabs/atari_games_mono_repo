	processor 6502

	SEG code
	ORG $F000     	; Define the code origin at $F000

Start:
	SEI				; Disable interrupts
	CLD           	; Disable the BCD decimal math mode.
	LDA #$FF      	; Loads the X register #$FF
	TSX           	; Transfer the X register to the (S)tack Pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Clear the Page Zero region of my memory. ($00 - $FF)
;	Clearing the entire RAM and also the entire TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	LDA #100		; Load Literal Decimal value 100
	
	CLC				; Clear Carry (6507 does not support ADD)
	ADC #5			; Add 5 to Acc
	SEC				; Set Carry for Subtraction with Carry
	SBC #10			; Subtract 10 from Acc

	JMP Start		; To force the infinite loop for debug


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Fill the ROM Size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ORG $FFFC		; Set the origin to the last memory address at the rom
	.word Start		; Reset vector at $FFFC to where the program starts
	.word Start		; Interrupt vector at $FFFE (Unused in the VCS)
