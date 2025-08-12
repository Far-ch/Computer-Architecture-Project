; 16-bit LED chaser: bounce left <-> right on I/O port 0

LDI R1, 0x0001          ; pattern = .... .... .... ...1  (start at LSB)

; move left until we hit MSB (0x8000)
up_loop:
OUT 0, R1               ; write current pattern to LED port (change 0 if your LED port differs)
NOP                     ; tiny delay (replace with a proper delay loop if needed)
NOP
NOP
LSL R1                  ; shift left: move the '1' toward MSB
CPI R1, 0x8000          ; reached the left end?
BRNE up_loop            ; no -> keep moving left
                        ; yes -> fall through to rightward sweep

;move right until we return to LSB (0x0001)
down_loop:
OUT 0, R1               ; show current pattern
NOP
NOP
NOP
LSR R1                  ; shift right: move the '1' toward LSB
CPI R1, 0x0001          ; reached the right end?
BRNE down_loop          ; no -> keep moving right

JMP up_loop             ; yes -> bounce: go left again
