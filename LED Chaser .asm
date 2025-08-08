LDI R1, 0x0001

up_loop:
OUT 0, R1
NOP
NOP
NOP
LSL R1
CPI R1, 0x8000
BRNE up_loop

down_loop:
OUT 0, R1
NOP
NOP
NOP
LSR R1
CPI R1, 0x0001
BRNE down_loop

JMP up_loop
