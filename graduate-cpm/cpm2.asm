;-----------------------------------
; Produced using: z80-disassembler.py v0.87 - A Smart Z80 reverse assembler
; Visit https://github.com/cormacj/z80-smart-disassembler for updates and to report issues
;
; Command line used: z80-disassembler.py -o cpm2.asm --labels /home/cormac/devel/z80-smart-disassembler/amstrad-labels.txt -t /home/cormac/devel/z80-smart-disassembler/amstrad_rom_template.txt -l 0xc000 CPM2.rom 
;-----------------------------------

; Define labels for external calls



    org 0xc000

;--------------------------------------
ROM_TYPE:                             ; XREF: 0xFE40 0xFE59 0xFE26 
    DEFB 0x1                          ;0xc000:   0x1
;--------------------------------------
ROM_MAJOR:                            ; XREF: 
    DEFB 0x2                          ;0xc001:   0x2
;--------------------------------------
ROM_MARK:                             ; XREF: 
    DEFB 0x3                          ;0xc002:   0x3
;--------------------------------------
ROM_MOD:                              ; XREF: 
    DEFB 0x0                          ;0xc003:   0x0
;--------------------------------------
CMD_TABLE_PTR:                        ; XREF: 
    DEFB RSX_COMMANDS                 ;0xc004:   Pointer to RSX_COMMANDS (0xc009)
;--------------------------------------
JUMP_TABLE:                           ; XREF: 
    JP ROM_INIT                       ;0xc006:   c3 14 c0  "..." 
;--------------------------------------
RSX_COMMANDS:                         ; XREF: 
    DEFB "CP/M PLUS", '2' + 0x80      ;0xc009:   0xc009 to 0xc015
    DEFB 0x0                          ;0xc013:   
;--------------------------------------
ROM_INIT:                             ; XREF: 0xC006 
    RET                               ;0xc014:   c9  "." 
    LD HL,D_FFFF                      ;0xc015:   21 ff ff  "!.."  
    LD DE,0x72ff                      ;0xc018:   11 ff 72  "..r"  
;--------------------------------------
C_C01B:                               ; XREF: 0xC02B 
    LD A,(HL)                         ;0xc01b:   7e  "~" 
    OR A                              ;0xc01c:   b7  "." 
    JR z, C_C02D                      ;0xc01d:   28 0e  "(." 
    LD (DE),A                         ;0xc01f:   12  "." 
    LD A,H                            ;0xc020:   7c  "|" 
    CP 0xc0                           ;0xc021:   fe c0  ".." 
    JR nz, C_C029                     ;0xc023:   20 04  " ." 
    LD A,L                            ;0xc025:   7d  "}" 
    CP 0x41                           ;0xc026:   fe 41  ".A" 
    RET z                             ;0xc028:   c8  "." 
;--------------------------------------
C_C029:                               ; XREF: 0xC023 
    DEC HL                            ;0xc029:   2b  "+" 
    DEC DE                            ;0xc02a:   1b  "." 
    JR C_C01B                         ;0xc02b:   18 ee  ".." 
;--------------------------------------
C_C02D:                               ; XREF: 0xC01D 
    DEC HL                            ;0xc02d:   2b  "+" 
    LD A,(HL)                         ;0xc02e:   7e  "~" 
    LD B,A                            ;0xc02f:   47  "G" 
    XOR A                             ;0xc030:   af  "." 
;--------------------------------------
C_C031:                               ; XREF: 0xC033 
    LD (DE),A                         ;0xc031:   12  "." 
    DEC DE                            ;0xc032:   1b  "." 
    DJNZ C_C031                       ;0xc033:   10 fc  ".." 
    INC DE                            ;0xc035:   13  "." 
    JR C_C029                         ;0xc036:   18 f1  ".." 
    DEFB "Graduate ", '/' + 0x80      ;0xc038:   0xc038 to 0xc044
    DEFB 0xcd                         ;0xc042:   
    DEFB 0x51                         ;0xc043:   
    DEFB 0xfc                         ;0xc044:   
    DEFB 0xcd                         ;0xc045:   
    DEFB 0x6                          ;0xc046:   0x6
    DEFB 0xf                          ;0xc047:   0xf
    DEFB 0x22                         ;0xc048:   
    DEFB 0x28                         ;0xc049:   
    DEFB 0xfa                         ;0xc04a:   
    DEFB 0x3e                         ;0xc04b:   
    DEFB 0x1                          ;0xc04c:   0x1
    DEFB 0xc3                         ;0xc04d:   
    DEFB 0x51                         ;0xc04e:   
    DEFB 0xfc                         ;0xc04f:   
    DEFB 0xb7                         ;0xc050:   
    DEFB 0xca                         ;0xc051:   
    DEFB 0x4b                         ;0xc052:   
    DEFB 0xfc                         ;0xc053:   
    DEFB 0xcd                         ;0xc054:   
    DEFB 0x51                         ;0xc055:   
    DEFB 0xfc                         ;0xc056:   
    DEFB 0xcd                         ;0xc057:   
    DEFB 0x4b                         ;0xc058:   
    DEFB 0xfc                         ;0xc059:   
    DEFB 0xaf                         ;0xc05a:   
    DEFB 0xc3                         ;0xc05b:   
    DEFB 0x51                         ;0xc05c:   
    DEFB 0xfc                         ;0xc05d:   
    DEFB 0x3e                         ;0xc05e:   
;--------------------------------------
C_C05F:                               ; XREF: 0xC00D 
    LD BC,0x51cd                      ;0xc05f:   01 cd 51  "..Q"  
    CALL m, 0xebc3                    ;0xc062:   fc c3 eb  "..." 
    RET m                             ;0xc065:   f8  "." 
    LD (D_FA25),HL                    ;0xc066:   22 25 fa  ""%."  
    CALL C_FC51                       ;0xc069:   cd 51 fc  ".Q." 
    LD HL,D_FA2A                      ;0xc06c:   21 2a fa  "!*."  
    LD BC,0x124                       ;0xc06f:   01 24 01  ".$."  
    NOP                               ;0xc072:   00  "." 
    CALL 0xfc4b                       ;0xc073:   cd 4b fc  ".K." 
    LD DE,D_FA2A                      ;0xc076:   11 2a fa  ".*."  
    POP HL                            ;0xc079:   e1  "." 
    POP BC                            ;0xc07a:   c1  "." 
    PUSH BC                           ;0xc07b:   c5  "." 
    PUSH HL                           ;0xc07c:   e5  "." 
    LD (D_F61E),HL                    ;0xc07d:   22 1e f6  "".."  
    CALL C_F8D5                       ;0xc080:   cd d5 f8  "..." 
    POP DE                            ;0xc083:   d1  "." 
    POP BC                            ;0xc084:   c1  "." 
    LD A,B                            ;0xc085:   78  "x" 
    AND 0xfc                          ;0xc086:   e6 fc  ".." 
    RET z                             ;0xc088:   c8  "." 
    LD HL,D_FA2A                      ;0xc089:   21 2a fa  "!*."  
    EX DE,HL                          ;0xc08c:   eb  "." 
    LD BC,0x121                       ;0xc08d:   01 21 01  ".!."  
    NOP                               ;0xc090:   00  "." 
    RLA                               ;0xc091:   17  "." 
    JP c, C_F840                      ;0xc092:   da 40 f8  ".@." 
    LD C,0x24                         ;0xc095:   0e 24  ".$"  
    RLA                               ;0xc097:   17  "." 
    JP c, C_F840                      ;0xc098:   da 40 f8  ".@." 
    RLA                               ;0xc09b:   17  "." 
    JP c, 0xf868                      ;0xc09c:   da 68 f8  ".h." 
    LD C,4                            ;0xc09f:   0e 04  ".."  
    RLA                               ;0xc0a1:   17  "." 
    JP c, 0xfc4b                      ;0xc0a2:   da 4b fc  ".K." 
    RLA                               ;0xc0a5:   17  "." 
    JP c, C_F85C                      ;0xc0a6:   da 5c f8  ".\." 
    LD C,6                            ;0xc0a9:   0e 06  ".."  
    JP 0xfc4b                         ;0xc0ab:   c3 4b fc  ".K." 
    LD A,(D_F61D)                     ;0xc0ae:   3a 1d f6  ":.."  
    OR A                              ;0xc0b1:   b7  "." 
    JP z, 0xfc4b                      ;0xc0b2:   ca 4b fc  ".K." 
    LD BC,0x10e                       ;0xc0b5:   01 0e 01  "..."  
    NOP                               ;0xc0b8:   00  "." 
    ADD HL,BC                         ;0xc0b9:   09  "." 
    EX DE,HL                          ;0xc0ba:   eb  "." 
    ADD HL,BC                         ;0xc0bb:   09  "." 
    LD A,(HL)                         ;0xc0bc:   7e  "~" 
    LD (DE),A                         ;0xc0bd:   12  "." 
    INC HL                            ;0xc0be:   23  "#" 
    INC DE                            ;0xc0bf:   13  "." 
    LD A,(HL)                         ;0xc0c0:   7e  "~" 
    LD (DE),A                         ;0xc0c1:   12  "." 
    INC BC                            ;0xc0c2:   03  "." 
    INC BC                            ;0xc0c3:   03  "." 
    INC BC                            ;0xc0c4:   03  "." 
    ADD HL,BC                         ;0xc0c5:   09  "." 
    EX DE,HL                          ;0xc0c6:   eb  "." 
    ADD HL,BC                         ;0xc0c7:   09  "." 
    LD A,(DE)                         ;0xc0c8:   1a  "." 
    LD (HL),A                         ;0xc0c9:   77  "w" 
    RET                               ;0xc0ca:   c9  "." 
    LD HL,(D_FBD8)                    ;0xc0cb:   2a d8 fb  "*.."  
    LD BC,0x103                       ;0xc0ce:   01 03 01  "..."  
    NOP                               ;0xc0d1:   00  "." 
    LD DE,D_FA4E                      ;0xc0d2:   11 4e fa  ".N."  
    JP 0xfc4b                         ;0xc0d5:   c3 4b fc  ".K." 
    LD HL,(D_FBD8)                    ;0xc0d8:   2a d8 fb  "*.."  
    LD BC,0x180                       ;0xc0db:   01 80 01  "..."  
    NOP                               ;0xc0de:   00  "." 
    LD DE,D_FA4E                      ;0xc0df:   11 4e fa  ".N."  
    JP 0xfc4b                         ;0xc0e2:   c3 4b fc  ".K." 
    EX DE,HL                          ;0xc0e5:   eb  "." 
    LD E,(HL)                         ;0xc0e6:   5e  "^" 
    INC HL                            ;0xc0e7:   23  "#" 
    LD D,(HL)                         ;0xc0e8:   56  "V" 
    INC HL                            ;0xc0e9:   23  "#" 
    LD C,(HL)                         ;0xc0ea:   4e  "N" 
    INC HL                            ;0xc0eb:   23  "#" 
    LD B,(HL)                         ;0xc0ec:   46  "F" 
    LD HL,D_FAAF                      ;0xc0ed:   21 af fa  "!.."  
    PUSH HL                           ;0xc0f0:   e5  "." 
    CALL m, C_C978                    ;0xc0f1:   fc 78 c9  ".x." 
    LD DE,D_F78D                      ;0xc0f4:   11 8d f7  "..."  
    PUSH DE                           ;0xc0f7:   d5  "." 
    LD A,1                            ;0xc0f8:   3e 01  ">."  
    CALL C_FC51                       ;0xc0fa:   cd 51 fc  ".Q." 
    JP (HL)                           ;0xc0fd:   e9  "." 
    LD B,A                            ;0xc0fe:   47  "G" 
    XOR A                             ;0xc0ff:   af  "." 
    CALL C_FC51                       ;0xc100:   cd 51 fc  ".Q." 
    LD A,B                            ;0xc103:   78  "x" 
    RET                               ;0xc104:   c9  "." 
    CP 0x33                           ;0xc105:   fe 33  ".3" 
    JP c, C_F7B0                      ;0xc107:   da b0 f7  "..." 
    CP 0x62                           ;0xc10a:   fe 62  ".b" 
    JP c, 0xf8bc                      ;0xc10c:   da bc f8  "..." 
    CP 0x71                           ;0xc10f:   fe 71  ".q" 
    JP nc, 0xf8bc                     ;0xc111:   d2 bc f8  "..." 
    CP 0x6f                           ;0xc114:   fe 6f  ".o" 
    JP z, 0xf735                      ;0xc116:   ca 35 f7  ".5." 
    CP 0x70                           ;0xc119:   fe 70  ".p" 
    JP z, 0xf735                      ;0xc11b:   ca 35 f7  ".5." 
    JP C_F7CF                         ;0xc11e:   c3 cf f7  "..." 
    CP 0x11                           ;0xc121:   fe 11  ".." 
    JP z, C_F7C7                      ;0xc123:   ca c7 f7  "..." 
    CP 0x12                           ;0xc126:   fe 12  ".." 
    JP z, C_F7CB                      ;0xc128:   ca cb f7  "..." 
    CP 0x1a                           ;0xc12b:   fe 1a  ".." 
    JP nz, C_F7CF                     ;0xc12d:   c2 cf f7  "..." 
    EX DE,HL                          ;0xc130:   eb  "." 
    LD (D_FBD8),HL                    ;0xc131:   22 d8 fb  "".."  
    LD (D_F61B),HL                    ;0xc134:   22 1b f6  "".."  
    RET                               ;0xc137:   c9  "." 
    EX DE,HL                          ;0xc138:   eb  "." 
    LD (D_FBE3),HL                    ;0xc139:   22 e3 fb  "".."  
    LD HL,(D_FBE3)                    ;0xc13c:   2a e3 fb  "*.."  
    EX DE,HL                          ;0xc13f:   eb  "." 
    LD HL,D_F9E2                      ;0xc140:   21 e2 f9  "!.."  
    LD A,C                            ;0xc143:   79  "y" 
    CP 0x62                           ;0xc144:   fe 62  ".b" 
    JP c, 0xf7db                      ;0xc146:   da db f7  "..." 
    LD HL,0xf9b3                      ;0xc149:   21 b3 f9  "!.."  
    LD B,1                            ;0xc14c:   06 01  ".."  
    NOP                               ;0xc14e:   00  "." 
    ADD HL,BC                         ;0xc14f:   09  "." 
    LD A,(HL)                         ;0xc150:   7e  "~" 
    LD B,A                            ;0xc151:   47  "G" 
    PUSH BC                           ;0xc152:   c5  "." 
    PUSH DE                           ;0xc153:   d5  "." 
    RRA                               ;0xc154:   1f  "." 
    JP c, 0xf7ed                      ;0xc155:   da ed f7  "..." 
    RRA                               ;0xc158:   1f  "." 
    JP c, C_F7FC                      ;0xc159:   da fc f7  "..." 
    JP C_F813                         ;0xc15c:   c3 13 f8  "..." 
    LD HL,(D_FBD8)                    ;0xc15f:   2a d8 fb  "*.."  
    EX DE,HL                          ;0xc162:   eb  "." 
    LD HL,D_FA4E                      ;0xc163:   21 4e fa  "!N."  
    LD BC,0x110                       ;0xc166:   01 10 01  "..."  
    NOP                               ;0xc169:   00  "." 
    CALL 0xfc4b                       ;0xc16a:   cd 4b fc  ".K." 
    POP DE                            ;0xc16d:   d1  "." 
    PUSH DE                           ;0xc16e:   d5  "." 
    XOR A                             ;0xc16f:   af  "." 
    LD (D_F61D),A                     ;0xc170:   32 1d f6  "2.."  
    OR 0xeb                           ;0xc173:   f6 eb  ".." 
    LD A,L                            ;0xc175:   7d  "}" 
    OR H                              ;0xc176:   b4  "." 
    JP nz, C_F710                     ;0xc177:   c2 10 f7  "..." 
    LD HL,D_FA2C                      ;0xc17a:   21 2c fa  "!,."  
    LD (D_FBBA),HL                    ;0xc17d:   22 ba fb  "".."  
    LD HL,(D_FBD8)                    ;0xc180:   2a d8 fb  "*.."  
    PUSH HL                           ;0xc183:   e5  "." 
    LD DE,D_FA2A                      ;0xc184:   11 2a fa  ".*."  
    PUSH DE                           ;0xc187:   d5  "." 
    LD B,1                            ;0xc188:   06 01  ".."  
    NOP                               ;0xc18a:   00  "." 
    LD C,(HL)                         ;0xc18b:   4e  "N" 
    INC BC                            ;0xc18c:   03  "." 
    INC BC                            ;0xc18d:   03  "." 
    INC BC                            ;0xc18e:   03  "." 
    EX DE,HL                          ;0xc18f:   eb  "." 
    CALL 0xfc4b                       ;0xc190:   cd 4b fc  ".K." 
    LD (HL),1                         ;0xc193:   36 01  "6."  
    NOP                               ;0xc195:   00  "." 
    POP DE                            ;0xc196:   d1  "." 
    PUSH DE                           ;0xc197:   d5  "." 
    LD C,10                           ;0xc198:   0e 0a  ".."  
    CALL C_F8D5                       ;0xc19a:   cd d5 f8  "..." 
    LD A,(D_FA2B)                     ;0xc19d:   3a 2b fa  ":+."  
    LD C,A                            ;0xc1a0:   4f  "O" 
    LD B,1                            ;0xc1a1:   06 01  ".."  
    NOP                               ;0xc1a3:   00  "." 
    INC BC                            ;0xc1a4:   03  "." 
    INC BC                            ;0xc1a5:   03  "." 
    POP DE                            ;0xc1a6:   d1  "." 
    POP HL                            ;0xc1a7:   e1  "." 
    JP 0xfc4b                         ;0xc1a8:   c3 4b fc  ".K." 
    LD (D_FA24),A                     ;0xc1ab:   32 24 fa  "2$."  
    EX DE,HL                          ;0xc1ae:   eb  "." 
    LD E,(HL)                         ;0xc1af:   5e  "^" 
    INC HL                            ;0xc1b0:   23  "#" 
    LD D,(HL)                         ;0xc1b1:   56  "V" 
    INC HL                            ;0xc1b2:   23  "#" 
    LD C,(HL)                         ;0xc1b3:   4e  "N" 
    INC HL                            ;0xc1b4:   23  "#" 
    LD B,(HL)                         ;0xc1b5:   46  "F" 
    EX DE,HL                          ;0xc1b6:   eb  "." 
    LD A,B                            ;0xc1b7:   78  "x" 
    OR C                              ;0xc1b8:   b1  "." 
    RET z                             ;0xc1b9:   c8  "." 
    PUSH BC                           ;0xc1ba:   c5  "." 
    PUSH HL                           ;0xc1bb:   e5  "." 
    LD C,(HL)                         ;0xc1bc:   4e  "N" 
    LD DE,D_F770                      ;0xc1bd:   11 70 f7  ".p."  
    PUSH DE                           ;0xc1c0:   d5  "." 
    LD A,(D_FA24)                     ;0xc1c1:   3a 24 fa  ":$."  
    CP 0x70                           ;0xc1c4:   fe 70  ".p" 
    JP z, C_FC0F                      ;0xc1c6:   ca 0f fc  "..." 
    LD A,(D_FBCF)                     ;0xc1c9:   3a cf fb  ":.."  
    LD B,A                            ;0xc1cc:   47  "G" 
    AND 2                             ;0xc1cd:   e6 02  ".." 
    JP z, C_F76A                      ;0xc1cf:   ca 6a f7  ".j." 
    LD A,B                            ;0xc1d2:   78  "x" 
    AND 0x14                          ;0xc1d3:   e6 14  ".." 
    JP z, C_F76A                      ;0xc1d5:   ca 6a f7  ".j." 
    AND 0x10                          ;0xc1d8:   e6 10  ".." 
    JP nz, C_FC0C                     ;0xc1da:   c2 0c fc  "..." 
    JP C_FC0C                         ;0xc1dd:   c3 0c fc  "..." 
    LD E,C                            ;0xc1e0:   59  "Y" 
    LD C,2                            ;0xc1e1:   0e 02  ".."  
    JP C_F8D5                         ;0xc1e3:   c3 d5 f8  "..." 
    POP HL                            ;0xc1e6:   e1  "." 
    INC HL                            ;0xc1e7:   23  "#" 
    POP BC                            ;0xc1e8:   c1  "." 
    DEC BC                            ;0xc1e9:   0b  "." 
    JP 0xf741                         ;0xc1ea:   c3 41 f7  ".A." 
    LD A,1                            ;0xc1ed:   3e 01  ">."  
    CALL C_FC51                       ;0xc1ef:   cd 51 fc  ".Q." 
    LD B,(HL)                         ;0xc1f2:   46  "F" 
    XOR A                             ;0xc1f3:   af  "." 
    CALL 0x651                        ;0xc1f4:   cd 51 06  ".Q." 
    NOP                               ;0xc1f7:   00  "." 
    INC BC                            ;0xc1f8:   03  "." 
    CALL m, C_F8D5                    ;0xc1f9:   fc d5 f8  "..." 
    PUSH DE                           ;0xc1fc:   d5  "." 
    RET m                             ;0xc1fd:   f8  "." 
    SBC A,(HL)                        ;0xc1fe:   9e  "." 
    OR 0xa4                           ;0xc1ff:   f6 a4  ".." 
    DEFB 0xf6                         ;0xc201:   ('v') + 0x80
    DEFB 0xa8                         ;0xc202:   ('(') + 0x80
    DEFB 0xf6                         ;0xc203:   ('v') + 0x80
    DEFB 0xac                         ;0xc204:   (',') + 0x80
    DEFB 0xf6                         ;0xc205:   ('v') + 0x80
    DEFB 0xe3                         ;0xc206:   ('c') + 0x80
    DEFB 0xf6                         ;0xc207:   ('v') + 0x80
    DEFB 0xe9                         ;0xc208:   ('i') + 0x80
    DEFB 0xf6                         ;0xc209:   ('v') + 0x80
    DEFB 0xef                         ;0xc20a:   ('o') + 0x80
    DEFB 0xf6                         ;0xc20b:   ('v') + 0x80
    DEFB 0x1                          ;0xc20c:   0x1
    DEFB 0xf7                         ;0xc20d:   ('w') + 0x80
    DEFB 0xd5                         ;0xc20e:   ('U') + 0x80
    DEFB 0xf8                         ;0xc20f:   ('x') + 0x80
    DEFB 0xcd                         ;0xc210:   ('M') + 0x80
    DEFB 0x15                         ;0xc211:   0x15
    DEFB 0xfc                         ;0xc212:   ('|') + 0x80
    DEFB 0xc3                         ;0xc213:   ('C') + 0x80
    DEFB 0xc8                         ;0xc214:   ('H') + 0x80
    DEFB 0xf8                         ;0xc215:   ('x') + 0x80
    DEFB 0x4b                         ;0xc216:   "K"
    DEFB 0xc3                         ;0xc217:   ('C') + 0x80
    DEFB 0x12                         ;0xc218:   0x12
    DEFB 0xfc                         ;0xc219:   ('|') + 0x80
    DEFB 0x4b                         ;0xc21a:   "K"
    DEFB 0xc3                         ;0xc21b:   ('C') + 0x80
    DEFB 0xf                          ;0xc21c:   0xf
    DEFB 0xfc                         ;0xc21d:   ('|') + 0x80
    DEFB 0x7b                         ;0xc21e:   "{"
    DEFB 0x3c                         ;0xc21f:   "<"
    DEFB 0xca                         ;0xc220:   ('J') + 0x80
    DEFB 0xc3                         ;0xc221:   ('C') + 0x80
    DEFB 0xf6                         ;0xc222:   ('v') + 0x80
    DEFB 0x3c                         ;0xc223:   "<"
    DEFB 0xca                         ;0xc224:   ('J') + 0x80
    DEFB 0xbd                         ;0xc225:   ('=') + 0x80
    DEFB 0xf6                         ;0xc226:   ('v') + 0x80
    DEFB 0x3c                         ;0xc227:   "<"
    DEFB 0xca                         ;0xc228:   ('J') + 0x80
    DEFB 0xc8                         ;0xc229:   ('H') + 0x80
    DEFB 0xf6                         ;0xc22a:   ('v') + 0x80
    DEFB 0x4b                         ;0xc22b:   "K"
    DEFB 0xc3                         ;0xc22c:   ('C') + 0x80
    DEFB 0xc                          ;0xc22d:   0xc
    DEFB 0xfc                         ;0xc22e:   ('|') + 0x80
    DEFB 0xcd                         ;0xc22f:   ('M') + 0x80
    DEFB 0xce                         ;0xc230:   ('N') + 0x80
    DEFB 0xf6                         ;0xc231:   ('v') + 0x80
    DEFB 0xc3                         ;0xc232:   ('C') + 0x80
    DEFB 0xc8                         ;0xc233:   ('H') + 0x80
    DEFB 0xf8                         ;0xc234:   ('x') + 0x80
    DEFB 0xcd                         ;0xc235:   ('M') + 0x80
    DEFB 0xce                         ;0xc236:   ('N') + 0x80
    DEFB 0xf6                         ;0xc237:   ('v') + 0x80
    DEFB 0xb7                         ;0xc238:   ('7') + 0x80
    DEFB 0xc8                         ;0xc239:   ('H') + 0x80
    DEFB 0xcd                         ;0xc23a:   ('M') + 0x80
    DEFB 0xd8                         ;0xc23b:   ('X') + 0x80
    DEFB 0xf6                         ;0xc23c:   ('v') + 0x80
    DEFB 0xc3                         ;0xc23d:   ('C') + 0x80
    DEFB 0xc8                         ;0xc23e:   ('H') + 0x80
    DEFB 0xf8                         ;0xc23f:   ('x') + 0x80
    DEFB 0x3a                         ;0xc240:   ":"
    DEFB 0x20                         ;0xc241:   " "
    DEFB 0xf6                         ;0xc242:   ('v') + 0x80
    DEFB 0xb7                         ;0xc243:   ('7') + 0x80
    DEFB 0x3e                         ;0xc244:   ">"
    DEFB 0xff                         ;0xc245:   0xff
    DEFB 0xc0                         ;0xc246:   ('@') + 0x80
    DEFB 0xc3                         ;0xc247:   ('C') + 0x80
    DEFB 0x6                          ;0xc248:   0x6
    DEFB 0xfc                         ;0xc249:   ('|') + 0x80
    DEFB 0x21                         ;0xc24a:   "!"
    DEFB 0x20                         ;0xc24b:   " "
    DEFB 0xf6                         ;0xc24c:   ('v') + 0x80
    DEFB 0x7e                         ;0xc24d:   "~"
    DEFB 0x36                         ;0xc24e:   "6"
    DEFB 0x1                          ;0xc24f:   0x1
    DEFB 0x0                          ;0xc250:   0x0
    DEFB 0xb7                         ;0xc251:   ('7') + 0x80
    DEFB 0xc0                         ;0xc252:   ('@') + 0x80
    DEFB 0xc3                         ;0xc253:   ('C') + 0x80
    DEFB 0x9                          ;0xc254:   0x9
    DEFB 0xfc                         ;0xc255:   ('|') + 0x80
    DEFB 0xcd                         ;0xc256:   ('M') + 0x80
    DEFB 0x36                         ;0xc257:   "6"
    DEFB 0xfc                         ;0xc258:   ('|') + 0x80
    DEFB 0xc3                         ;0xc259:   ('C') + 0x80
    DEFB 0xc8                         ;0xc25a:   ('H') + 0x80
    DEFB 0xf8                         ;0xc25b:   ('x') + 0x80
    DEFB 0xcd                         ;0xc25c:   ('M') + 0x80
    DEFB 0x39                         ;0xc25d:   "9"
    DEFB 0xfc                         ;0xc25e:   ('|') + 0x80
    DEFB 0xc3                         ;0xc25f:   ('C') + 0x80
    DEFB 0xc8                         ;0xc260:   ('H') + 0x80
    DEFB 0xf8                         ;0xc261:   ('x') + 0x80
    DEFB 0x42                         ;0xc262:   "B"
    DEFB 0x4b                         ;0xc263:   "K"
    DEFB 0x21                         ;0xc264:   "!"
    DEFB 0xd3                         ;0xc265:   ('S') + 0x80
    DEFB 0xfb                         ;0xc266:   ('{') + 0x80
    DEFB 0xa                          ;0xc267:   0xa
    DEFB 0xbe                         ;0xc268:   ('>') + 0x80
    DEFB 0xc8                         ;0xc269:   ('H') + 0x80
    DEFB 0x3                          ;0xc26a:   0x3
    DEFB 0xc5                         ;0xc26b:   ('E') + 0x80
    DEFB 0x4f                         ;0xc26c:   "O"
    DEFB 0xcd                         ;0xc26d:   ('M') + 0x80
    DEFB 0x53                         ;0xc26e:   "S"
    DEFB 0xf7                         ;0xc26f:   ('w') + 0x80
    DEFB 0xc1                         ;0xc270:   ('A') + 0x80
    DEFB 0xc3                         ;0xc271:   ('C') + 0x80
    DEFB 0xf1                         ;0xc272:   ('q') + 0x80
    DEFB 0x36                         ;0xc273:   "6"
    DEFB 0x35                         ;0xc274:   "5"
    DEFB 0x34                         ;0xc275:   "4"
    DEFB 0x33                         ;0xc276:   "3"
    DEFB 0x32                         ;0xc277:   "2"
    DEFB 0x31                         ;0xc278:   "1"
    DEFB 0xc3                         ;0xc279:   ('C') + 0x80
    DEFB 0x24                         ;0xc27a:   "$"
    DEFB 0xf6                         ;0xc27b:   ('v') + 0x80
    DEFB 0xc3                         ;0xc27c:   ('C') + 0x80
    DEFB 0xe4                         ;0xc27d:   ('d') + 0x80
    DEFB 0xf8                         ;0xc27e:   ('x') + 0x80
    DEFB 0xc3                         ;0xc27f:   ('C') + 0x80
    DEFB 0xf2                         ;0xc280:   ('r') + 0x80
    DEFB 0xf8                         ;0xc281:   ('x') + 0x80
    DEFB 0xc3                         ;0xc282:   ('C') + 0x80
    DEFB 0xfa                         ;0xc283:   ('z') + 0x80
    DEFB 0xf8                         ;0xc284:   ('x') + 0x80
    DEFB 0x7                          ;0xc285:   0x7
    DEFB 0x0                          ;0xc286:   0x0
    DEFB 0x4e                         ;0xc287:   "N"
    DEFB 0xfa                         ;0xc288:   ('z') + 0x80
    DEFB 0x6                          ;0xc289:   0x6
    DEFB 0x0                          ;0xc28a:   0x0
    DEFB 0xc3                         ;0xc28b:   ('C') + 0x80
    DEFB 0x77                         ;0xc28c:   "w"
    DEFB 0xf7                         ;0xc28d:   ('w') + 0x80
    DEFB 0x79                         ;0xc28e:   "y"
    DEFB 0x21                         ;0xc28f:   "!"
    DEFB 0x2                          ;0xc290:   0x2
    DEFB 0x0                          ;0xc291:   0x0
    DEFB 0x22                         ;0xc292:   """
    DEFB 0x28                         ;0xc293:   "("
    DEFB 0xfa                         ;0xc294:   ('z') + 0x80
    DEFB 0x39                         ;0xc295:   "9"
    DEFB 0x22                         ;0xc296:   """
    DEFB 0x66                         ;0xc297:   "f"
    DEFB 0xfb                         ;0xc298:   ('{') + 0x80
    DEFB 0x31                         ;0xc299:   "1"
    DEFB 0x66                         ;0xc29a:   "f"
    DEFB 0xfb                         ;0xc29b:   ('{') + 0x80
    DEFB 0x21                         ;0xc29c:   "!"
    DEFB 0xcb                         ;0xc29d:   ('K') + 0x80
    DEFB 0xf8                         ;0xc29e:   ('x') + 0x80
    DEFB 0xe5                         ;0xc29f:   ('e') + 0x80
    DEFB 0xfe                         ;0xc2a0:   ('~') + 0x80
    DEFB 0xc                          ;0xc2a1:   0xc
    DEFB 0xd2                         ;0xc2a2:   ('R') + 0x80
    DEFB 0x94                         ;0xc2a3:   0x94
    DEFB 0xf7                         ;0xc2a4:   ('w') + 0x80
    DEFB 0x32                         ;0xc2a5:   "2"
    DEFB 0xdf                         ;0xc2a6:   ('_') + 0x80
    DEFB 0xfb                         ;0xc2a7:   ('{') + 0x80
    DEFB 0x21                         ;0xc2a8:   "!"
    DEFB 0x86                         ;0xc2a9:   0x86
    DEFB 0xf6                         ;0xc2aa:   ('v') + 0x80
    DEFB 0x6                          ;0xc2ab:   0x6
    DEFB 0x1                          ;0xc2ac:   0x1
    DEFB 0x0                          ;0xc2ad:   0x0
    DEFB 0x9                          ;0xc2ae:   0x9
    DEFB 0x9                          ;0xc2af:   0x9
    DEFB 0x7e                         ;0xc2b0:   "~"
    DEFB 0x23                         ;0xc2b1:   "#"
    DEFB 0x66                         ;0xc2b2:   "f"
    DEFB 0x6f                         ;0xc2b3:   "o"
    DEFB 0xe9                         ;0xc2b4:   ('i') + 0x80
    DEFB "COPYRIGHT (C) 1982, DIGITAL RESEARCH 151282"  ;0xc2b5:   0xc2b5 to 0xc2e0
    DEFB 0xb                          ;0xc2e0:   0xb
    DEFB 0x0                          ;0xc2e1:   
    DEFB 0xc9                         ;0xc2e2:   
    DEFB 0x7d                         ;0xc2e3:   
    DEFB 0x32                         ;0xc2e4:   
    DEFB 0xb6                         ;0xc2e5:   
    DEFB 0xfb                         ;0xc2e6:   
    DEFB 0x7c                         ;0xc2e7:   
;--------------------------------------
C_C2E8:                               ; XREF: 0xC2BE 
    LD (D_FBB8),A                     ;0xc2e8:   32 b8 fb  "2.."  
    RET                               ;0xc2eb:   c9  "." 
    INC E                             ;0xc2ec:   1c  "." 
    CCF                               ;0xc2ed:   3f  "?" 
    RLA                               ;0xc2ee:   17  "." 
    CCF                               ;0xc2ef:   3f  "?" 
    SUB 0x3e                          ;0xc2f0:   d6 3e  ".>" 
    SRL (HL)                          ;0xc2f2:   cb 3e  ".>" 
    LD C,0                            ;0xc2f4:   0e 00  ".."  
    LD H,H                            ;0xc2f6:   64  "d" 
    RST 0x38                          ;0xc2f7:   ff  "." 
    RST 0x38                          ;0xc2f8:   ff  "." 
;--------------------------------------
C_C2F9:                               ; XREF: 0xC2C5 
    CP (HL)                           ;0xc2f9:   be  "." 
    RRA                               ;0xc2fa:   1f  "." 
    CP A                              ;0xc2fb:   bf  "." 
    EI                                ;0xc2fc:   fb  "." 
    CP (HL)                           ;0xc2fd:   be  "." 
    CP (IY-0x80)                      ;0xc2fe:   fd be 80  "..." 
    LD C,H                            ;0xc301:   4c  "L" 
    LD (BC),A                         ;0xc302:   02  "." 
    INC E                             ;0xc303:   1c  "." 
    CCF                               ;0xc304:   3f  "?" 
    RLA                               ;0xc305:   17  "." 
    CCF                               ;0xc306:   3f  "?" 
    SUB 0x3e                          ;0xc307:   d6 3e  ".>" 
    SRL (HL)                          ;0xc309:   cb 3e  ".>" 
    LD BC,13                          ;0xc30b:   01 0d 00  "..."  
;--------------------------------------
C_C30E:                               ; XREF: 0xC2C8 
    LD A,A                            ;0xc30e:   7f  "." 
    RST 0x38                          ;0xc30f:   ff  "." 
    LD A,D                            ;0xc310:   7a  "z" 
;--------------------------------------
C_C311:                               ; XREF: 0xC33F 
    CP A                              ;0xc311:   bf  "." 
    SBC A,D                           ;0xc312:   9a  "." 
    CP A                              ;0xc313:   bf  "." 
    EI                                ;0xc314:   fb  "." 
    CP (HL)                           ;0xc315:   be  "." 
    CP (IY-0x80)                      ;0xc316:   fd be 80  "..." 
    LD C,(HL)                         ;0xc319:   4e  "N" 
    LD (BC),A                         ;0xc31a:   02  "." 
    PUSH DE                           ;0xc31b:   d5  "." 
    LD E,(HL)                         ;0xc31c:   5e  "^" 
    INC HL                            ;0xc31d:   23  "#" 
    LD D,(HL)                         ;0xc31e:   56  "V" 
    EX DE,HL                          ;0xc31f:   eb  "." 
    POP DE                            ;0xc320:   d1  "." 
    RET                               ;0xc321:   c9  "." 
    SBC A,H                           ;0xc322:   9c  "." 
    ADC A,C                           ;0xc323:   89  "." 
;--------------------------------------
C_C324:                               ; XREF: 0xC2D0 
    LD H,B                            ;0xc324:   60  "`" 
    ADC A,C                           ;0xc325:   89  "." 
    CALL p, 0xd489                    ;0xc326:   f4 89 d4  "..." 
    ADC A,C                           ;0xc329:   89  "." 
    LD (BC),A                         ;0xc32a:   02  "." 
    DEC C                             ;0xc32b:   0d  "." 
    NOP                               ;0xc32c:   00  "." 
    LD D,E                            ;0xc32d:   53  "S" 
    RST 0x38                          ;0xc32e:   ff  "." 
    LD (BC),A                         ;0xc32f:   02  "." 
    NOP                               ;0xc330:   00  "." 
;--------------------------------------
D_C331:                               ; XREF: 0xC277 
    DEFB 0x89                         ;0xc331:   0x89
    DEFB 0x3c                         ;0xc332:   "<"
    DEFB 0xfb                         ;0xc333:   ('{') + 0x80
    DEFB 0xbe                         ;0xc334:   ('>') + 0x80
    DEFB 0xfd                         ;0xc335:   ('}') + 0x80
    DEFB 0xbe                         ;0xc336:   ('>') + 0x80
    DEFB 0xff                         ;0xc337:   0xff
    DEFB 0xff                         ;0xc338:   0xff
    DEFB 0x7                          ;0xc339:   0x7
    DEFB 0x0                          ;0xc33a:   0x0
    DEFB 0x3f                         ;0xc33b:   "?"
    DEFB 0xe1                         ;0xc33c:   ('a') + 0x80
    DEFB 0xd8                         ;0xc33d:   ('X') + 0x80
    DEFB 0xeb                         ;0xc33e:   ('k') + 0x80
    DEFB 0x20                         ;0xc33f:   " "
    DEFB 0xd0                         ;0xc340:   ('P') + 0x80
    DEFB 0x21                         ;0xc341:   "!"
    DEFB 0x2                          ;0xc342:   0x2
    DEFB 0x0                          ;0xc343:   0x0
    DEFB 0xc9                         ;0xc344:   ('I') + 0x80
    DEFB 0x3a                         ;0xc345:   ":"
    DEFB 0xe7                         ;0xc346:   ('g') + 0x80
    DEFB 0xfb                         ;0xc347:   ('{') + 0x80
    DEFB 0xfe                         ;0xc348:   ('~') + 0x80
    DEFB 0xff                         ;0xc349:   0xff
    DEFB 0xc8                         ;0xc34a:   ('H') + 0x80
    DEFB 0x3a                         ;0xc34b:   ":"
    DEFB 0xf0                         ;0xc34c:   ('p') + 0x80
    DEFB 0xbe                         ;0xc34d:   ('>') + 0x80
    DEFB 0x4f                         ;0xc34e:   "O"
    DEFB 0xc3                         ;0xc34f:   ('C') + 0x80
    DEFB 0xfb                         ;0xc350:   ('{') + 0x80
    DEFB 0x1                          ;0xc351:   0x1
    DEFB 0x0                          ;0xc352:   0x0
    DEFB 0x21                         ;0xc353:   "!"
    DEFB 0x86                         ;0xc354:   0x86
    DEFB 0x1                          ;0xc355:   0x1
    DEFB 0x0                          ;0xc356:   0x0
    DEFB 0x18                         ;0xc357:   0x18
    DEFB 0x3                          ;0xc358:   0x3
    DEFB 0x21                         ;0xc359:   "!"
    DEFB 0x89                         ;0xc35a:   0x89
    DEFB 0x1                          ;0xc35b:   0x1
;--------------------------------------
C_C35C:                               ; XREF: 0xC357 
    NOP                               ;0xc35c:   00  "." 
    PUSH IX                           ;0xc35d:   dd e5  ".." 
    PUSH HL                           ;0xc35f:   e5  "." 
    PUSH DE                           ;0xc360:   d5  "." 
    CALL 0x3f4d                       ;0xc361:   cd 4d 3f  ".M?" 
    JR c, C_C376                      ;0xc364:   38 10  "8." 
    CP 8                              ;0xc366:   fe 08  ".." 
    LD B,A                            ;0xc368:   47  "G" 
    PUSH BC                           ;0xc369:   c5  "." 
    LD A,(0xbef2)                     ;0xc36a:   3a f2 be  ":.."  
    LD D,A                            ;0xc36d:   57  "W" 
    LD A,(0xbef4)                     ;0xc36e:   3a f4 be  ":.."  
    LD E,A                            ;0xc371:   5f  "_" 
    CALL nz, 0x3f0a                   ;0xc372:   c4 0a 3f  "..?" 
    POP BC                            ;0xc375:   c1  "." 
;--------------------------------------
C_C376:                               ; XREF: 0xC364 
    POP DE                            ;0xc376:   d1  "." 
    POP HL                            ;0xc377:   e1  "." 
    POP IX                            ;0xc378:   dd e1  ".." 
    LD A,1                            ;0xc37a:   3e 01  ">."  
    NOP                               ;0xc37c:   00  "." 
    RET c                             ;0xc37d:   d8  "." 
    JR nz, $-32                       ;0xc37e:   20 de  " ." 
    LD A,B                            ;0xc380:   78  "x" 
    XOR 8                             ;0xc381:   ee 08  ".." 
    JR z, C_C38A                      ;0xc383:   28 05  "(." 
    CP 9                              ;0xc385:   fe 09  ".." 
    LD A,2                            ;0xc387:   3e 02  ">."  
    RET z                             ;0xc389:   c8  "." 
;--------------------------------------
C_C38A:                               ; XREF: 0xC383 
    DEC A                             ;0xc38a:   3d  "=" 
    RET                               ;0xc38b:   c9  "." 
    PUSH HL                           ;0xc38c:   e5  "." 
    CALL 0x3f76                       ;0xc38d:   cd 76 3f  ".v?" 
    LD HL,(0xbef0)                    ;0xc390:   2a f0 be  "*.."  
    LD A,H                            ;0xc393:   7c  "|" 
    OR A                              ;0xc394:   b7  "." 
    JR nz, C_C3A1                     ;0xc395:   20 0a  " ." 
    LD C,L                            ;0xc397:   4d  "M" 
    LD HL,0xbefa                      ;0xc398:   21 fa be  "!.."  
    LD A,(HL)                         ;0xc39b:   7e  "~" 
    CP C                              ;0xc39c:   b9  "." 
    LD (HL),C                         ;0xc39d:   71  "q" 
    CALL nz, 0x1fe                    ;0xc39e:   c4 fe 01  "..." 
;--------------------------------------
C_C3A1:                               ; XREF: 0xC395 
    NOP                               ;0xc3a1:   00  "." 
    LD A,(0xbef1)                     ;0xc3a2:   3a f1 be  ":.."  
    LD C,A                            ;0xc3a5:   4f  "O" 
    LD A,(0xbef4)                     ;0xc3a6:   3a f4 be  ":.."  
    LD E,A                            ;0xc3a9:   5f  "_" 
    LD A,(0xbef2)                     ;0xc3aa:   3a f2 be  ":.."  
    LD D,A                            ;0xc3ad:   57  "W" 
    LD A,(0xbef9)                     ;0xc3ae:   3a f9 be  ":.."  
    LD B,A                            ;0xc3b1:   47  "G" 
    LD HL,(0xbef6)                    ;0xc3b2:   2a f6 be  "*.."  
    RET                               ;0xc3b5:   c9  "." 
    LD HL,0x10c                       ;0xc3b6:   21 0c 01  "!.."  
    NOP                               ;0xc3b9:   00  "." 
    ADD HL,DE                         ;0xc3ba:   19  "." 
    CALL 0x3fd0                       ;0xc3bb:   cd d0 3f  "..?" 
    PUSH HL                           ;0xc3be:   e5  "." 
    POP IX                            ;0xc3bf:   dd e1  ".." 
    RET                               ;0xc3c1:   c9  "." 
    LD (0xbef6),BC                    ;0xc3c2:   ed 43 f6 be  ".C.."  
    LD A,(S_FE58)                     ;0xc3c6:   3a 58 fe  ":X."  
    LD (0xbef9),A                     ;0xc3c9:   32 f9 be  "2.."  
    RET                               ;0xc3cc:   c9  "." 
    LD L,C                            ;0xc3cd:   69  "i" 
    LD H,B                            ;0xc3ce:   60  "`" 
    LD A,D                            ;0xc3cf:   7a  "z" 
    OR E                              ;0xc3d0:   b3  "." 
    RET z                             ;0xc3d1:   c8  "." 
    EX DE,HL                          ;0xc3d2:   eb  "." 
    ADD HL,BC                         ;0xc3d3:   09  "." 
    LD L,(HL)                         ;0xc3d4:   6e  "n" 
    LD H,1                            ;0xc3d5:   26 01  "&."  
    NOP                               ;0xc3d7:   00  "." 
    RET                               ;0xc3d8:   c9  "." 
    LD DE,S_FFF8                      ;0xc3d9:   11 f8 ff  "..."  
    JR C_C3E1                         ;0xc3dc:   18 03  ".." 
    LD DE,S_FFF6                      ;0xc3de:   11 f6 ff  "..."  
;--------------------------------------
C_C3E1:                               ; XREF: 0xC3DC 
    LD A,(0xbef0)                     ;0xc3e1:   3a f0 be  ":.."  
    CALL 0x3ebb                       ;0xc3e4:   cd bb 3e  "..>" 
    PUSH HL                           ;0xc3e7:   e5  "." 
    ADD HL,DE                         ;0xc3e8:   19  "." 
    CALL 0x3fd0                       ;0xc3e9:   cd d0 3f  "..?" 
    POP DE                            ;0xc3ec:   d1  "." 
    DEC DE                            ;0xc3ed:   1b  "." 
    DEC DE                            ;0xc3ee:   1b  "." 
    LD A,(DE)                         ;0xc3ef:   1a  "." 
    LD (0xbef1),A                     ;0xc3f0:   32 f1 be  "2.."  
    INC DE                            ;0xc3f3:   13  "." 
    INC DE                            ;0xc3f4:   13  "." 
    JP (HL)                           ;0xc3f5:   e9  "." 
    LD A,C                            ;0xc3f6:   79  "y" 
    LD (0xbef8),A                     ;0xc3f7:   32 f8 be  "2.."  
    RET                               ;0xc3fa:   c9  "." 
    XOR A                             ;0xc3fb:   af  "." 
    RET                               ;0xc3fc:   c9  "." 
    LD HL,S_FE2F                      ;0xc3fd:   21 2f fe  "!/."  
    ADD A,A                           ;0xc400:   87  "." 
    ADC A,L                           ;0xc401:   8d  "." 
    LD L,A                            ;0xc402:   6f  "o" 
    ADC A,H                           ;0xc403:   8c  "." 
    SUB L                             ;0xc404:   95  "." 
    LD H,A                            ;0xc405:   67  "g" 
    JP 0x3fd0                         ;0xc406:   c3 d0 3f  "..?" 
    XOR A                             ;0xc409:   af  "." 
    LD (0xbefa),A                     ;0xc40a:   32 fa be  "2.."  
    RET                               ;0xc40d:   c9  "." 
    CALL 0x1e6                        ;0xc40e:   cd e6 01  "..." 
    NOP                               ;0xc411:   00  "." 
    OR A                              ;0xc412:   b7  "." 
    RET nz                            ;0xc413:   c0  "." 
    LD DE,0x3fb5                      ;0xc414:   11 b5 3f  "..?"  
    LD (DE),A                         ;0xc417:   12  "." 
    RET                               ;0xc418:   c9  "." 
    PUSH IX                           ;0xc419:   dd e5  ".." 
    PUSH DE                           ;0xc41b:   d5  "." 
    CALL 0x3f4e                       ;0xc41c:   cd 4e 3f  ".N?" 
    LD A,(IX+0x1a)                    ;0xc41f:   dd 7e 1a  ".~." 
    OR A                              ;0xc422:   b7  "." 
    SCF                               ;0xc423:   37  "7" 
    JR nz, C_C439                     ;0xc424:   20 13  " ." 
    CALL 0x192                        ;0xc426:   cd 92 01  "..." 
    NOP                               ;0xc429:   00  "." 
    JR nc, C_C43A                     ;0xc42a:   30 0e  "0." 
    LD BC,S_FDF7                      ;0xc42c:   01 f7 fd  "..."  
    ADD HL,BC                         ;0xc42f:   09  "." 
    JR c, C_C437                      ;0xc430:   38 05  "8." 
    EX DE,HL                          ;0xc432:   eb  "." 
    LD BC,S_FFA4                      ;0xc433:   01 a4 ff  "..."  
    ADD HL,BC                         ;0xc436:   09  "." 
;--------------------------------------
C_C437:                               ; XREF: 0xC430 
    LD A,6                            ;0xc437:   3e 06  ">."  
;--------------------------------------
C_C439:                               ; XREF: 0xC424 
    CCF                               ;0xc439:   3f  "?" 
;--------------------------------------
C_C43A:                               ; XREF: 0xC42A 
    POP HL                            ;0xc43a:   e1  "." 
    POP IX                            ;0xc43b:   dd e1  ".." 
    LD B,A                            ;0xc43d:   47  "G" 
    LD DE,2                           ;0xc43e:   11 02 00  "..."  
    PUSH HL                           ;0xc441:   e5  "." 
    CALL nc, 0x200a                   ;0xc442:   d4 0a 20  ".. " 
    LD BC,0x7e77                      ;0xc445:   01 77 7e  ".w~"  
    OR A                              ;0xc448:   b7  "." 
    PUSH BC                           ;0xc449:   c5  "." 
    CALL nz, 0x1f2                    ;0xc44a:   c4 f2 01  "..." 
    NOP                               ;0xc44d:   00  "." 
    POP BC                            ;0xc44e:   c1  "." 
    POP HL                            ;0xc44f:   e1  "." 
    OR A                              ;0xc450:   b7  "." 
    RET                               ;0xc451:   c9  "." 
    PUSH BC                           ;0xc452:   c5  "." 
    PUSH HL                           ;0xc453:   e5  "." 
    CALL 0x1ec                        ;0xc454:   cd ec 01  "..." 
    NOP                               ;0xc457:   00  "." 
    OR A                              ;0xc458:   b7  "." 
    POP HL                            ;0xc459:   e1  "." 
    POP BC                            ;0xc45a:   c1  "." 
    RET                               ;0xc45b:   c9  "." 
    LD HL,(D_FBBE)                    ;0xc45c:   2a be fb  "*.."  
    LD B,1                            ;0xc45f:   06 01  ".."  
    NOP                               ;0xc461:   00  "." 
;--------------------------------------
C_C462:                               ; XREF: 0xC46B 
    XOR A                             ;0xc462:   af  "." 
    ADD HL,HL                         ;0xc463:   29  ")" 
    CALL c, 0x3e0d                    ;0xc464:   dc 0d 3e  "..>" 
    RET nz                            ;0xc467:   c0  "." 
    INC B                             ;0xc468:   04  "." 
    LD A,H                            ;0xc469:   7c  "|" 
    OR L                              ;0xc46a:   b5  "." 
    JR nz, C_C462                     ;0xc46b:   20 f5  " ." 
    RET                               ;0xc46d:   c9  "." 
    LD HL,(D_FBBE)                    ;0xc46e:   2a be fb  "*.."  
    PUSH HL                           ;0xc471:   e5  "." 
;--------------------------------------
C_C472:                               ; XREF: 0xC482 
    LD B,1                            ;0xc472:   06 01  ".."  
    NOP                               ;0xc474:   00  "." 
;--------------------------------------
C_C475:                               ; XREF: 0xC47F 
    XOR A                             ;0xc475:   af  "." 
    ADD HL,HL                         ;0xc476:   29  ")" 
    CALL c, 0x3e0d                    ;0xc477:   dc 0d 3e  "..>" 
    JR nz, C_C481                     ;0xc47a:   20 05  " ." 
    INC B                             ;0xc47c:   04  "." 
    LD A,H                            ;0xc47d:   7c  "|" 
    OR L                              ;0xc47e:   b5  "." 
    JR nz, C_C475                     ;0xc47f:   20 f4  " ." 
;--------------------------------------
C_C481:                               ; XREF: 0xC47A 
    POP HL                            ;0xc481:   e1  "." 
    JR z, C_C472                      ;0xc482:   28 ee  "(." 
    JP 0x1ef                          ;0xc484:   c3 ef 01  "..." 
    NOP                               ;0xc487:   00  "." 
    LD B,C                            ;0xc488:   41  "A" 
    LD E,7                            ;0xc489:   1e 07  ".."  
    CALL 0x3e49                       ;0xc48b:   cd 49 3e  ".I>" 
    LD B,(HL)                         ;0xc48e:   46  "F" 
    JP 0x1f8                          ;0xc48f:   c3 f8 01  "..." 
    NOP                               ;0xc492:   00  "." 
    LD D,1                            ;0xc493:   16 01  ".."  
    NOP                               ;0xc495:   00  "." 
    LD H,D                            ;0xc496:   62  "b" 
    LD L,B                            ;0xc497:   68  "h" 
    ADD HL,HL                         ;0xc498:   29  ")" 
    ADD HL,HL                         ;0xc499:   29  ")" 
    ADD HL,HL                         ;0xc49a:   29  ")" 
    ADD HL,DE                         ;0xc49b:   19  "." 
    LD DE,S_FE16                      ;0xc49c:   11 16 fe  "..."  
    ADD HL,DE                         ;0xc49f:   19  "." 
    RET                               ;0xc4a0:   c9  "." 
    LD A,C                            ;0xc4a1:   79  "y" 
    LD (0xbef0),A                     ;0xc4a2:   32 f0 be  "2.."  
    CALL 0x3ebb                       ;0xc4a5:   cd bb 3e  "..>" 
    LD A,H                            ;0xc4a8:   7c  "|" 
    OR L                              ;0xc4a9:   b5  "." 
    RET z                             ;0xc4aa:   c8  "." 
    LD A,E                            ;0xc4ab:   7b  "{" 
    RRA                               ;0xc4ac:   1f  "." 
    RET c                             ;0xc4ad:   d8  "." 
    EX DE,HL                          ;0xc4ae:   eb  "." 
    LD HL,D_FFFE                      ;0xc4af:   21 fe ff  "!.."  
    ADD HL,DE                         ;0xc4b2:   19  "." 
    LD A,(HL)                         ;0xc4b3:   7e  "~" 
    LD (0xbef1),A                     ;0xc4b4:   32 f1 be  "2.."  
    LD HL,S_FFFA                      ;0xc4b7:   21 fa ff  "!.."  
;--------------------------------------
C_C4BA:                               ; XREF: 0xC4D9 
    ADD HL,DE                         ;0xc4ba:   19  "." 
    CALL 0x3fd0                       ;0xc4bb:   cd d0 3f  "..?" 
    JP (HL)                           ;0xc4be:   e9  "." 
    LD BC,2                           ;0xc4bf:   01 02 00  "..."  
    LD (0xbef2),BC                    ;0xc4c2:   ed 43 f2 be  ".C.."  
    RET                               ;0xc4c6:   c9  "." 
    LD (0xbef4),BC                    ;0xc4c7:   ed 43 f4 be  ".C.."  
    SUB B                             ;0xc4cb:   90  "." 
    DEC A                             ;0xc4cc:   3d  "=" 
    JR nz, $-16                       ;0xc4cd:   20 ee  " ." 
    PUSH BC                           ;0xc4cf:   c5  "." 
    CALL nz, 0x1f5                    ;0xc4d0:   c4 f5 01  "..." 
    NOP                               ;0xc4d3:   00  "." 
    POP BC                            ;0xc4d4:   c1  "." 
    POP HL                            ;0xc4d5:   e1  "." 
    INC B                             ;0xc4d6:   04  "." 
    LD A,H                            ;0xc4d7:   7c  "|" 
    OR L                              ;0xc4d8:   b5  "." 
    JR nz, C_C4BA                     ;0xc4d9:   20 df  " ." 
    RET                               ;0xc4db:   c9  "." 
    PUSH BC                           ;0xc4dc:   c5  "." 
    LD HL,(D_FBC0)                    ;0xc4dd:   2a c0 fb  "*.."  
    PUSH HL                           ;0xc4e0:   e5  "." 
    LD HL,D_FBC2                      ;0xc4e1:   21 c2 fb  "!.."  
    CALL 0x3db9                       ;0xc4e4:   cd b9 3d  "..=" 
    LD E,1                            ;0xc4e7:   1e 01  ".."  
    NOP                               ;0xc4e9:   00  "." 
    CALL 0x3e49                       ;0xc4ea:   cd 49 3e  ".I>" 
    EX DE,HL                          ;0xc4ed:   eb  "." 
    LD B,15                           ;0xc4ee:   06 0f  ".."  
    CALL 0x1fb                        ;0xc4f0:   cd fb 01  "..." 
    NOP                               ;0xc4f3:   00  "." 
    POP HL                            ;0xc4f4:   e1  "." 
    POP BC                            ;0xc4f5:   c1  "." 
    JR nz, C_C4FA                     ;0xc4f6:   20 02  " ." 
    JR nc, C_C4FE                     ;0xc4f8:   30 04  "0." 
;--------------------------------------
C_C4FA:                               ; XREF: 0xC4F6 
    LD (D_FBC0),HL                    ;0xc4fa:   22 c0 fb  "".."  
    RET                               ;0xc4fd:   c9  "." 
;--------------------------------------
C_C4FE:                               ; XREF: 0xC4F8 
    LD HL,D_FBC8                      ;0xc4fe:   21 c8 fb  "!.."  
    CALL 0x3db9                       ;0xc501:   cd b9 3d  "..=" 
    LD HL,D_FBC6                      ;0xc504:   21 c6 fb  "!.."  
    PUSH BC                           ;0xc507:   c5  "." 
    INC B                             ;0xc508:   04  "." 
    LD A,0xfe                         ;0xc509:   3e fe  ">."  
;--------------------------------------
C_C50B:                               ; XREF: 0xC50F 
    RRCA                              ;0xc50b:   0f  "." 
    JR c, C_C50F                      ;0xc50c:   38 01  "8." 
    DEC HL                            ;0xc50e:   2b  "+" 
;--------------------------------------
C_C50F:                               ; XREF: 0xC50C 
    DJNZ C_C50B                       ;0xc50f:   10 fa  ".." 
    AND (HL)                          ;0xc511:   a6  "." 
    LD (HL),A                         ;0xc512:   77  "w" 
    POP BC                            ;0xc513:   c1  "." 
    XOR A                             ;0xc514:   af  "." 
    RET                               ;0xc515:   c9  "." 
    LD B,1                            ;0xc516:   06 01  ".."  
    NOP                               ;0xc518:   00  "." 
;--------------------------------------
C_C519:                               ; XREF: 0xC523 
    SCF                               ;0xc519:   37  "7" 
    SBC A,A                           ;0xc51a:   9f  "." 
    ADD HL,HL                         ;0xc51b:   29  ")" 
    CALL c, 0x3dd8                    ;0xc51c:   dc d8 3d  "..=" 
    RET z                             ;0xc51f:   c8  "." 
    INC B                             ;0xc520:   04  "." 
    LD A,H                            ;0xc521:   7c  "|" 
    OR L                              ;0xc522:   b5  "." 
    JR nz, C_C519                     ;0xc523:   20 f4  " ." 
    CPL                               ;0xc525:   2f  "/" 
    RET                               ;0xc526:   c9  "." 
    PUSH HL                           ;0xc527:   e5  "." 
    LD E,6                            ;0xc528:   1e 06  ".."  
    CALL 0x3e49                       ;0xc52a:   cd 49 3e  ".I>" 
    LD A,(HL)                         ;0xc52d:   7e  "~" 
    CPL                               ;0xc52e:   2f  "/" 
    AND 0x10                          ;0xc52f:   e6 10  ".." 
    JR nz, $+35                       ;0xc531:   20 21  " !" 
    LD A,B                            ;0xc533:   78  "x" 
    ADD A,0xd0                        ;0xc534:   c6 d0  ".." 
    LD L,A                            ;0xc536:   6f  "o" 
    ADC A,0x3f                        ;0xc537:   ce 3f  ".?" 
    SUB L                             ;0xc539:   95  "." 
    LD H,A                            ;0xc53a:   67  "g" 
    CALL 0x3e0d                       ;0xc53b:   cd 0d 3e  "..>" 
    JR z, $+20                        ;0xc53e:   28 12  "(." 
    PUSH BC                           ;0xc540:   c5  "." 
    PUSH HL                           ;0xc541:   e5  "." 
    CALL 0x1ef                        ;0xc542:   cd ef 01  "..." 
    NOP                               ;0xc545:   00  "." 
    POP HL                            ;0xc546:   e1  "." 
    POP BC                            ;0xc547:   c1  "." 
    CP 0x11                           ;0xc548:   fe 11  ".." 
    JR nz, C_C54E                     ;0xc54a:   20 02  " ." 
    LD (HL),0xff                      ;0xc54c:   36 ff  "6."  
;--------------------------------------
C_C54E:                               ; XREF: 0xC54A 
    XOR 0x13                          ;0xc54e:   ee 13  ".." 
    JP 0x3e27                         ;0xc550:   c3 27 3e  ".'>" 
    JP 0x3d69                         ;0xc553:   c3 69 3d  ".i=" 
    JP 0x3e16                         ;0xc556:   c3 16 3e  "..>" 
    JP 0x3f81                         ;0xc559:   c3 81 3f  "..?" 
    LD SP,S_FF53                      ;0xc55c:   31 53 ff  "1S."  
    LD HL,1                           ;0xc55f:   21 01 00  "!.."  
    ADD A,B                           ;0xc562:   80  "." 
    LD (D_FBBE),HL                    ;0xc563:   22 be fb  "".."  
    LD (D_FBC0),HL                    ;0xc566:   22 c0 fb  "".."  
    LD H,0x40                         ;0xc569:   26 40  "&@"  
    LD (D_FBC6),HL                    ;0xc56b:   22 c6 fb  "".."  
    LD HL,S_FE26                      ;0xc56e:   21 26 fe  "!&."  
    LD DE,0x3d47                      ;0xc571:   11 47 3d  ".G="  
    CALL 0x1e9                        ;0xc574:   cd e9 01  "..." 
    NOP                               ;0xc577:   00  "." 
    LD (0xbefb),DE                    ;0xc578:   ed 53 fb be  ".S.."  
    LD (0xbefd),HL                    ;0xc57c:   22 fd be  "".."  
    AND 0x20                          ;0xc57f:   e6 20  ". " 
    LD H,A                            ;0xc581:   67  "g" 
    LD L,1                            ;0xc582:   2e 01  ".."  
    NOP                               ;0xc584:   00  "." 
    LD (D_FBC2),HL                    ;0xc585:   22 c2 fb  "".."  
    LD (D_FBC4),HL                    ;0xc588:   22 c4 fb  "".."  
    LD C,2                            ;0xc58b:   0e 02  ".."  
    CALL 0x3e3f                       ;0xc58d:   cd 3f 3e  ".?>" 
    CALL 0x3ec7                       ;0xc590:   cd c7 3e  "..>" 
    CALL 0x3ecc                       ;0xc593:   cd cc 3e  "..>" 
    DI                                ;0xc596:   f3  "." 
    JP C_FC63                         ;0xc597:   c3 63 fc  ".c." 
    LD HL,D_FBF9                      ;0xc59a:   21 f9 fb  "!.."  
    LD B,0x60                         ;0xc59d:   06 60  ".`"  
    CALL 0x3d60                       ;0xc59f:   cd 60 3d  ".`=" 
    CALL z, 0x3d60                    ;0xc5a2:   cc 60 3d  ".`=" 
;--------------------------------------
C_C5A5:                               ; XREF: 0xC5D6 
    LD B,0x24                         ;0xc5a5:   06 24  ".$"  
    CALL z, 0x3d60                    ;0xc5a7:   cc 60 3d  ".`=" 
    RET nz                            ;0xc5aa:   c0  "." 
    LD HL,(D_FBF4)                    ;0xc5ab:   2a f4 fb  "*.."  
    INC HL                            ;0xc5ae:   23  "#" 
    LD (D_FBF4),HL                    ;0xc5af:   22 f4 fb  "".."  
    RET                               ;0xc5b2:   c9  "." 
    DEC HL                            ;0xc5b3:   2b  "+" 
    LD A,(HL)                         ;0xc5b4:   7e  "~" 
    INC A                             ;0xc5b5:   3c  "<" 
    DAA                               ;0xc5b6:   27  "'" 
    LD (HL),A                         ;0xc5b7:   77  "w" 
    XOR B                             ;0xc5b8:   a8  "." 
    RET nz                            ;0xc5b9:   c0  "." 
    LD (HL),A                         ;0xc5ba:   77  "w" 
    RET                               ;0xc5bb:   c9  "." 
    LD HL,(D_FBC0)                    ;0xc5bc:   2a c0 fb  "*.."  
    LD B,1                            ;0xc5bf:   06 01  ".."  
    NOP                               ;0xc5c1:   00  "." 
    ADD HL,HL                         ;0xc5c2:   29  ")" 
    JR nc, C_C5DE                     ;0xc5c3:   30 19  "0." 
    PUSH HL                           ;0xc5c5:   e5  "." 
    LD HL,0xa410                      ;0xc5c6:   21 10 a4  "!.."  
;--------------------------------------
C_C5C9:                               ; XREF: 0xC5D1 
    CALL 0x3dd8                       ;0xc5c9:   cd d8 3d  "..=" 
    JR nz, C_C5D8                     ;0xc5cc:   20 0a  " ." 
    DEC HL                            ;0xc5ce:   2b  "+" 
    LD A,H                            ;0xc5cf:   7c  "|" 
    OR L                              ;0xc5d0:   b5  "." 
    JR nz, C_C5C9                     ;0xc5d1:   20 f6  " ." 
    CALL 0x39c3                       ;0xc5d3:   cd c3 39  "..9" 
    JR nz, C_C5A5                     ;0xc5d6:   20 cd  " ." 
;--------------------------------------
C_C5D8:                               ; XREF: 0xC5CC 
    LD H,D                            ;0xc5d8:   62  "b" 
    JR nz, $-59                       ;0xc5d9:   20 c3  " ." 
    RET p                             ;0xc5db:   f0  "." 
    INC HL                            ;0xc5dc:   23  "#" 
    LD (HL),A                         ;0xc5dd:   77  "w" 
;--------------------------------------
C_C5DE:                               ; XREF: 0xC5C3 
    NOP                               ;0xc5de:   00  "." 
    JP c, 0x2397                      ;0xc5df:   da 97 23  "..#" 
    LD A,0xff                         ;0xc5e2:   3e ff  ">."  
    LD (0x3c23),A                     ;0xc5e4:   32 23 3c  "2#<"  
    JP 0x2397                         ;0xc5e7:   c3 97 23  "..#" 
    CP 3                              ;0xc5ea:   fe 03  ".." 
    JP nz, 0x1d1f                     ;0xc5ec:   c2 1f 1d  "..." 
    LD A,(0x3c23)                     ;0xc5ef:   3a 23 3c  ":#<"  
    INC A                             ;0xc5f2:   3c  "<" 
    JP nz, 0x1d1f                     ;0xc5f3:   c2 1f 1d  "..." 
    POP HL                            ;0xc5f6:   e1  "." 
    JP 0x38d6                         ;0xc5f7:   c3 d6 38  "..8" 
    XOR A                             ;0xc5fa:   af  "." 
    LD (0x3c23),A                     ;0xc5fb:   32 23 3c  "2#<"  
    LD HL,(0x37f0)                    ;0xc5fe:   2a f0 37  "*.7"  
    RET                               ;0xc601:   c9  "." 
    LD BC,0x2100                      ;0xc602:   01 00 21  "..!"  
    LD (BC),A                         ;0xc605:   02  "." 
    NOP                               ;0xc606:   00  "." 
    LD (D_FBBA),HL                    ;0xc607:   22 ba fb  "".."  
    LD (D_FBB1),HL                    ;0xc60a:   22 b1 fb  "".."  
    DEC HL                            ;0xc60d:   2b  "+" 
    DEC HL                            ;0xc60e:   2b  "+" 
    RET                               ;0xc60f:   c9  "." 
    LD (0x37f4),HL                    ;0xc610:   22 f4 37  "".7"  
    SUB 3                             ;0xc613:   d6 03  ".." 
    LD (0x3c39),A                     ;0xc615:   32 39 3c  "29<"  
    RET                               ;0xc618:   c9  "." 
    LD BC,D_CD00                      ;0xc619:   01 00 cd  "..."  
    LD B,E                            ;0xc61c:   43  "C" 
    INC A                             ;0xc61d:   3c  "<" 
    JP 0x3413                         ;0xc61e:   c3 13 34  "..4" 
    CALL 0x2277                       ;0xc621:   cd 77 22  ".w"" 
    LD HL,(0x377b)                    ;0xc624:   2a 7b 37  "*{7"  
    LD A,L                            ;0xc627:   7d  "}" 
    AND H                             ;0xc628:   a4  "." 
    INC A                             ;0xc629:   3c  "<" 
    RET z                             ;0xc62a:   c8  "." 
    LD E,(HL)                         ;0xc62b:   5e  "^" 
    INC HL                            ;0xc62c:   23  "#" 
    LD D,(HL)                         ;0xc62d:   56  "V" 
    LD A,D                            ;0xc62e:   7a  "z" 
    OR E                              ;0xc62f:   b3  "." 
    RET z                             ;0xc630:   c8  "." 
    LD HL,0x37aa                      ;0xc631:   21 aa 37  "!.7"  
    LD A,(DE)                         ;0xc634:   1a  "." 
    CP (HL)                           ;0xc635:   be  "." 
    JP nz, 0x3c63                     ;0xc636:   c2 63 3c  ".c<" 
    LD HL,0x104                       ;0xc639:   21 04 01  "!.."  
    NOP                               ;0xc63c:   00  "." 
    ADD HL,DE                         ;0xc63d:   19  "." 
    LD A,0xff                         ;0xc63e:   3e ff  ">."  
    CP (HL)                           ;0xc640:   be  "." 
    JP nz, 0x3c63                     ;0xc641:   c2 63 3c  ".c<" 
    LD (DE),A                         ;0xc644:   12  "." 
    LD HL,0x10d                       ;0xc645:   21 0d 01  "!.."  
    NOP                               ;0xc648:   00  "." 
    ADD HL,DE                         ;0xc649:   19  "." 
    JP 0x3c4a                         ;0xc64a:   c3 4a 3c  ".J<" 
    CALL 0x2277                       ;0xc64d:   cd 77 22  ".w"" 
    LD HL,(0x3771)                    ;0xc650:   2a 71 37  "*q7"  
    LD A,(HL)                         ;0xc653:   7e  "~" 
    OR A                              ;0xc654:   b7  "." 
    RET nz                            ;0xc655:   c0  "." 
    LD (HL),2                         ;0xc656:   36 02  "6."  
    RET                               ;0xc658:   c9  "." 
    CALL 0x2039                       ;0xc659:   cd 39 20  ".9 " 
    LD HL,D_F617                      ;0xc65c:   21 17 f6  "!.."  
    RET                               ;0xc65f:   c9  "." 
    CALL 0x2d90                       ;0xc660:   cd 90 2d  "..-" 
    DEC A                             ;0xc663:   3d  "=" 
    JP nz, 0x3b87                     ;0xc664:   c2 87 3b  "..;" 
    LD HL,(0x3787)                    ;0xc667:   2a 87 37  "*.7"  
    LD (0xf612),HL                    ;0xc66a:   22 12 f6  "".."  
    LD A,(0x377f)                     ;0xc66d:   3a 7f 37  ":.7"  
    LD HL,(0x377d)                    ;0xc670:   2a 7d 37  "*}7"  
    CALL 0xf60f                       ;0xc673:   cd 0f f6  "..." 
    JP nz, 0x3bae                     ;0xc676:   c2 ae 3b  "..;" 
    LD A,(D_F614)                     ;0xc679:   3a 14 f6  ":.."  
    OR A                              ;0xc67c:   b7  "." 
    LD C,1                            ;0xc67d:   0e 01  ".."  
    NOP                               ;0xc67f:   00  "." 
    CALL nz, 0x223d                   ;0xc680:   c4 3d 22  ".="" 
    LD A,(D_FBDF)                     ;0xc683:   3a df fb  ":.."  
    SUB 0x12                          ;0xc686:   d6 12  ".." 
    RET z                             ;0xc688:   c8  "." 
    LD A,(D_FB9C)                     ;0xc689:   3a 9c fb  ":.."  
    INC A                             ;0xc68c:   3c  "<" 
    CALL z, 0x2201                    ;0xc68d:   cc 01 22  ".."" 
    XOR A                             ;0xc690:   af  "." 
    RET                               ;0xc691:   c9  "." 
    CALL 0x21f8                       ;0xc692:   cd f8 21  "..!" 
    RET nz                            ;0xc695:   c0  "." 
    CALL 0x20f5                       ;0xc696:   cd f5 20  ".. " 
    RET nz                            ;0xc699:   c0  "." 
    LD A,0xff                         ;0xc69a:   3e ff  ">."  
    LD (D_FB9C),A                     ;0xc69c:   32 9c fb  "2.."  
    LD HL,(0x3769)                    ;0xc69f:   2a 69 37  "*i7"  
    LD E,(HL)                         ;0xc6a2:   5e  "^" 
    INC HL                            ;0xc6a3:   23  "#" 
    LD D,(HL)                         ;0xc6a4:   56  "V" 
    EX DE,HL                          ;0xc6a5:   eb  "." 
    DEC HL                            ;0xc6a6:   2b  "+" 
    CALL 0x280d                       ;0xc6a7:   cd 0d 28  "..(" 
    XOR A                             ;0xc6aa:   af  "." 
    RET                               ;0xc6ab:   c9  "." 
    CALL 0x3b64                       ;0xc6ac:   cd 64 3b  ".d;" 
    RET z                             ;0xc6af:   c8  "." 
    LD HL,0x37b8                      ;0xc6b0:   21 b8 37  "!.7"  
    LD DE,D_FB9D                      ;0xc6b3:   11 9d fb  "..."  
    LD BC,0x104                       ;0xc6b6:   01 04 01  "..."  
    NOP                               ;0xc6b9:   00  "." 
    PUSH HL                           ;0xc6ba:   e5  "." 
    PUSH DE                           ;0xc6bb:   d5  "." 
    PUSH BC                           ;0xc6bc:   c5  "." 
    CALL 0xfc4b                       ;0xc6bd:   cd 4b fc  ".K." 
    LD HL,(0x377d)                    ;0xc6c0:   2a 7d 37  "*}7"  
    PUSH HL                           ;0xc6c3:   e5  "." 
    CALL 0x2040                       ;0xc6c4:   cd 40 20  ".@ " 
    CALL 0x3ae0                       ;0xc6c7:   cd e0 3a  "..:" 
    LD HL,(D_FBE1)                    ;0xc6ca:   2a e1 fb  "*.."  
    ADD HL,HL                         ;0xc6cd:   29  ")" 
    ADD HL,HL                         ;0xc6ce:   29  ")" 
    POP DE                            ;0xc6cf:   d1  "." 
    ADD HL,DE                         ;0xc6d0:   19  "." 
    POP BC                            ;0xc6d1:   c1  "." 
    POP DE                            ;0xc6d2:   d1  "." 
    PUSH DE                           ;0xc6d3:   d5  "." 
    PUSH BC                           ;0xc6d4:   c5  "." 
    LD A,(0x377f)                     ;0xc6d5:   3a 7f 37  ":.7"  
    CALL 0xf609                       ;0xc6d8:   cd 09 f6  "..." 
    POP BC                            ;0xc6db:   c1  "." 
    POP HL                            ;0xc6dc:   e1  "." 
    POP DE                            ;0xc6dd:   d1  "." 
    JP 0xfc4b                         ;0xc6de:   c3 4b fc  ".K." 
    LD A,(0x378c)                     ;0xc6e1:   3a 8c 37  ":.7"  
    RLA                               ;0xc6e4:   17  "." 
    JP c, 0x3b07                      ;0xc6e5:   da 07 3b  "..;" 
    POP AF                            ;0xc6e8:   f1  "." 
    ADD HL,HL                         ;0xc6e9:   29  ")" 
    ADC A,A                           ;0xc6ea:   8f  "." 
    PUSH AF                           ;0xc6eb:   f5  "." 
    LD A,(DE)                         ;0xc6ec:   1a  "." 
    AND 0x7f                          ;0xc6ed:   e6 7f  ".." 
    SUB 0x20                          ;0xc6ef:   d6 20  ". " 
    RRA                               ;0xc6f1:   1f  "." 
    JP nc, 0x3b11                     ;0xc6f2:   d2 11 3b  "..;" 
    RLA                               ;0xc6f5:   17  "." 
    LD C,A                            ;0xc6f6:   4f  "O" 
    LD B,1                            ;0xc6f7:   06 01  ".."  
    NOP                               ;0xc6f9:   00  "." 
    POP AF                            ;0xc6fa:   f1  "." 
    ADD HL,BC                         ;0xc6fb:   09  "." 
    ADC A,1                           ;0xc6fc:   ce 01  ".." 
    NOP                               ;0xc6fe:   00  "." 
    POP BC                            ;0xc6ff:   c1  "." 
    INC DE                            ;0xc700:   13  "." 
    DEC B                             ;0xc701:   05  "." 
    JP nz, 0x3af1                     ;0xc702:   c2 f1 3a  "..:" 
    LD (D_FB9E),HL                    ;0xc705:   22 9e fb  "".."  
    LD HL,D_FB9D                      ;0xc708:   21 9d fb  "!.."  
    AND 3                             ;0xc70b:   e6 03  ".." 
    RRCA                              ;0xc70d:   0f  "." 
    RRCA                              ;0xc70e:   0f  "." 
    OR (HL)                           ;0xc70f:   b6  "." 
    LD (HL),A                         ;0xc710:   77  "w" 
    AND 0x20                          ;0xc711:   e6 20  ". " 
    JP nz, 0x3b5b                     ;0xc713:   c2 5b 3b  ".[;" 
    LD A,(DE)                         ;0xc716:   1a  "." 
    AND 0x1f                          ;0xc717:   e6 1f  ".." 
    LD C,A                            ;0xc719:   4f  "O" 
    INC DE                            ;0xc71a:   13  "." 
    INC DE                            ;0xc71b:   13  "." 
    LD A,(DE)                         ;0xc71c:   1a  "." 
    AND 0x3f                          ;0xc71d:   e6 3f  ".?" 
    RRCA                              ;0xc71f:   0f  "." 
    RRCA                              ;0xc720:   0f  "." 
    RRCA                              ;0xc721:   0f  "." 
    LD D,A                            ;0xc722:   57  "W" 
    AND 7                             ;0xc723:   e6 07  ".." 
    LD B,A                            ;0xc725:   47  "G" 
    LD A,D                            ;0xc726:   7a  "z" 
    AND 0xe0                          ;0xc727:   e6 e0  ".." 
    OR C                              ;0xc729:   b1  "." 
    LD C,A                            ;0xc72a:   4f  "O" 
    LD A,(0x3784)                     ;0xc72b:   3a 84 37  ":.7"  
    RRA                               ;0xc72e:   1f  "." 
    JP nc, 0x3b56                     ;0xc72f:   d2 56 3b  ".V;" 
    PUSH AF                           ;0xc732:   f5  "." 
    LD A,B                            ;0xc733:   78  "x" 
    RRA                               ;0xc734:   1f  "." 
    LD B,A                            ;0xc735:   47  "G" 
    LD A,C                            ;0xc736:   79  "y" 
    RRA                               ;0xc737:   1f  "." 
    LD C,A                            ;0xc738:   4f  "O" 
    POP AF                            ;0xc739:   f1  "." 
    JP 0x3b47                         ;0xc73a:   c3 47 3b  ".G;" 
    LD A,B                            ;0xc73d:   78  "x" 
    AND 1                             ;0xc73e:   e6 01  ".." 
    RRCA                              ;0xc740:   0f  "." 
    RRCA                              ;0xc741:   0f  "." 
    RRCA                              ;0xc742:   0f  "." 
    OR (HL)                           ;0xc743:   b6  "." 
    LD (HL),A                         ;0xc744:   77  "w" 
    LD DE,0x103                       ;0xc745:   11 03 01  "..."  
    NOP                               ;0xc748:   00  "." 
    ADD HL,DE                         ;0xc749:   19  "." 
    LD (HL),C                         ;0xc74a:   71  "q" 
    RET                               ;0xc74b:   c9  "." 
    LD HL,(0x377d)                    ;0xc74c:   2a 7d 37  "*}7"  
    LD A,L                            ;0xc74f:   7d  "}" 
    OR H                              ;0xc750:   b4  "." 
    INC A                             ;0xc751:   3c  "<" 
    RET                               ;0xc752:   c9  "." 
    CALL 0x3b64                       ;0xc753:   cd 64 3b  ".d;" 
    RET z                             ;0xc756:   c8  "." 
    LD A,(D_FB9C)                     ;0xc757:   3a 9c fb  ":.."  
    INC A                             ;0xc75a:   3c  "<" 
    RET z                             ;0xc75b:   c8  "." 
    LD A,(D_FBE5)                     ;0xc75c:   3a e5 fb  ":.."  
    OR A                              ;0xc75f:   b7  "." 
    RET z                             ;0xc760:   c8  "." 
    LD HL,(0x3769)                    ;0xc761:   2a 69 37  "*i7"  
    LD E,(HL)                         ;0xc764:   5e  "^" 
    INC HL                            ;0xc765:   23  "#" 
    LD D,(HL)                         ;0xc766:   56  "V" 
    EX DE,HL                          ;0xc767:   eb  "." 
    LD A,H                            ;0xc768:   7c  "|" 
    OR L                              ;0xc769:   b5  "." 
    RET                               ;0xc76a:   c9  "." 
    LD A,(0x37ef)                     ;0xc76b:   3a ef 37  ":.7"  
    LD (HL),A                         ;0xc76e:   77  "w" 
    OR A                              ;0xc76f:   b7  "." 
    RET z                             ;0xc770:   c8  "." 
    LD A,(0x3790)                     ;0xc771:   3a 90 37  ":.7"  
    INC A                             ;0xc774:   3c  "<" 
    LD (HL),A                         ;0xc775:   77  "w" 
    RET                               ;0xc776:   c9  "." 
    PUSH HL                           ;0xc777:   e5  "." 
    PUSH DE                           ;0xc778:   d5  "." 
    CALL 0x3ae0                       ;0xc779:   cd e0 3a  "..:" 
    POP HL                            ;0xc77c:   e1  "." 
    LD DE,D_FB9D                      ;0xc77d:   11 9d fb  "..."  
    LD BC,0x104                       ;0xc780:   01 04 01  "..."  
    NOP                               ;0xc783:   00  "." 
    LD A,(0x377f)                     ;0xc784:   3a 7f 37  ":.7"  
    CALL 0xf609                       ;0xc787:   cd 09 f6  "..." 
    LD (0x37b1),HL                    ;0xc78a:   22 b1 37  "".7"  
    POP HL                            ;0xc78d:   e1  "." 
    RET                               ;0xc78e:   c9  "." 
    OR A                              ;0xc78f:   b7  "." 
    RET z                             ;0xc790:   c8  "." 
    CP 12                             ;0xc791:   fe 0c  ".." 
    JP c, 0x3adc                      ;0xc793:   da dc 3a  "..:" 
    LD A,2                            ;0xc796:   3e 02  ">."  
    JP z, 0x3ab4                      ;0xc798:   ca b4 3a  "..:" 
    LD A,3                            ;0xc79b:   3e 03  ">."  
    LD (D_FB9C),A                     ;0xc79d:   32 9c fb  "2.."  
    EX DE,HL                          ;0xc7a0:   eb  "." 
    CALL 0x3b64                       ;0xc7a1:   cd 64 3b  ".d;" 
    RET z                             ;0xc7a4:   c8  "." 
    EX DE,HL                          ;0xc7a5:   eb  "." 
    LD A,(D_FBDF)                     ;0xc7a6:   3a df fb  ":.."  
    CP 0x10                           ;0xc7a9:   fe 10  ".." 
    JP z, 0x3ae0                      ;0xc7ab:   ca e0 3a  "..:" 
    CP 0x23                           ;0xc7ae:   fe 23  ".#" 
    JP z, 0x3acf                      ;0xc7b0:   ca cf 3a  "..:" 
    CP 0x14                           ;0xc7b3:   fe 14  ".." 
    JP nc, 0x3ae0                     ;0xc7b5:   d2 e0 3a  "..:" 
    LD A,2                            ;0xc7b8:   3e 02  ">."  
    LD (D_FB9C),A                     ;0xc7ba:   32 9c fb  "2.."  
    PUSH HL                           ;0xc7bd:   e5  "." 
    CALL 0x2639                       ;0xc7be:   cd 39 26  ".9&" 
    POP HL                            ;0xc7c1:   e1  "." 
    JP nz, 0x3ae0                     ;0xc7c2:   c2 e0 3a  "..:" 
    XOR A                             ;0xc7c5:   af  "." 
    LD (D_FB9C),A                     ;0xc7c6:   32 9c fb  "2.."  
    LD A,(HL)                         ;0xc7c9:   7e  "~" 
    LD (D_FB9D),A                     ;0xc7ca:   32 9d fb  "2.."  
    INC HL                            ;0xc7cd:   23  "#" 
    EX DE,HL                          ;0xc7ce:   eb  "." 
    LD HL,2                           ;0xc7cf:   21 02 00  "!.."  
    AND 0x20                          ;0xc7d2:   e6 20  ". " 
    JP nz, 0x3b1e                     ;0xc7d4:   c2 1e 3b  "..;" 
    LD BC,0xb08                       ;0xc7d7:   01 08 0b  "..."  
    DEC C                             ;0xc7da:   0d  "." 
    PUSH BC                           ;0xc7db:   c5  "." 
    JP z, 0x3b06                      ;0xc7dc:   ca 06 3b  "..;" 
    DEC C                             ;0xc7df:   0d  "." 
    DEC C                             ;0xc7e0:   0d  "." 
    JP z, 0x3b06                      ;0xc7e1:   ca 06 3b  "..;" 
    ADD HL,HL                         ;0xc7e4:   29  ")" 
    ADC A,A                           ;0xc7e5:   8f  "." 
    PUSH AF                           ;0xc7e6:   f5  "." 
    LD A,B                            ;0xc7e7:   78  "x" 
    RRA                               ;0xc7e8:   1f  "." 
    EX DE,HL                          ;0xc7e9:   eb  "." 
    JP 0x39b0                         ;0xc7ea:   c3 b0 39  "..9" 
    LD HL,(0x37f6)                    ;0xc7ed:   2a f6 37  "*.7"  
    LD A,L                            ;0xc7f0:   7d  "}" 
    OR H                              ;0xc7f1:   b4  "." 
    JP nz, 0x3a14                     ;0xc7f2:   c2 14 3a  "..:" 
    LD HL,(0x37f8)                    ;0xc7f5:   2a f8 37  "*.7"  
    LD A,L                            ;0xc7f8:   7d  "}" 
    OR H                              ;0xc7f9:   b4  "." 
    JP z, 0x3a17                      ;0xc7fa:   ca 17 3a  "..:" 
    LD (0x37f2),HL                    ;0xc7fd:   22 f2 37  "".7"  
    LD HL,(0x37f2)                    ;0xc800:   2a f2 37  "*.7"  
    CALL 0x3a78                       ;0xc803:   cd 78 3a  ".x:" 
    LD (0x37f0),HL                    ;0xc806:   22 f0 37  "".7"  
    CALL 0x3a78                       ;0xc809:   cd 78 3a  ".x:" 
    EX DE,HL                          ;0xc80c:   eb  "." 
    CALL 0x3a6d                       ;0xc80d:   cd 6d 3a  ".m:" 
    LD HL,(0x37f4)                    ;0xc810:   2a f4 37  "*.7"  
    LD E,(HL)                         ;0xc813:   5e  "^" 
    INC HL                            ;0xc814:   23  "#" 
    LD D,(HL)                         ;0xc815:   56  "V" 
    LD HL,(0x37f0)                    ;0xc816:   2a f0 37  "*.7"  
    LD BC,0x10d                       ;0xc819:   01 0d 01  "..."  
    NOP                               ;0xc81c:   00  "." 
    ADD HL,BC                         ;0xc81d:   09  "." 
    LD (HL),E                         ;0xc81e:   73  "s" 
    INC HL                            ;0xc81f:   23  "#" 
    LD (HL),D                         ;0xc820:   72  "r" 
    LD HL,(0x37f0)                    ;0xc821:   2a f0 37  "*.7"  
    EX DE,HL                          ;0xc824:   eb  "." 
    LD HL,(0x37f4)                    ;0xc825:   2a f4 37  "*.7"  
    LD (HL),E                         ;0xc828:   73  "s" 
    INC HL                            ;0xc829:   23  "#" 
    LD (HL),D                         ;0xc82a:   72  "r" 
    EX DE,HL                          ;0xc82b:   eb  "." 
    RET                               ;0xc82c:   c9  "." 
    LD HL,(0x37f0)                    ;0xc82d:   2a f0 37  "*.7"  
    LD DE,0x105                       ;0xc830:   11 05 01  "..."  
    NOP                               ;0xc833:   00  "." 
    ADD HL,DE                         ;0xc834:   19  "." 
    LD A,(0x37ef)                     ;0xc835:   3a ef 37  ":.7"  
    CP (HL)                           ;0xc838:   be  "." 
    JP z, 0x3a59                      ;0xc839:   ca 59 3a  ".Y:" 
    INC (HL)                          ;0xc83c:   34  "4" 
    CP (HL)                           ;0xc83d:   be  "." 
    JP z, 0x3a59                      ;0xc83e:   ca 59 3a  ".Y:" 
    CALL 0x3a83                       ;0xc841:   cd 83 3a  "..:" 
    LD HL,(0x37f0)                    ;0xc844:   2a f0 37  "*.7"  
    EX DE,HL                          ;0xc847:   eb  "." 
    LD HL,(0x37f4)                    ;0xc848:   2a f4 37  "*.7"  
    LD A,(HL)                         ;0xc84b:   7e  "~" 
    INC HL                            ;0xc84c:   23  "#" 
    LD L,(HL)                         ;0xc84d:   6e  "n" 
    LD H,A                            ;0xc84e:   67  "g" 
    CALL 0x207f                       ;0xc84f:   cd 7f 20  ".. " 
    OR L                              ;0xc852:   b5  "." 
    EX DE,HL                          ;0xc853:   eb  "." 
    RET z                             ;0xc854:   c8  "." 
    JP 0x3a17                         ;0xc855:   c3 17 3a  "..:" 
    LD HL,(0x37f2)                    ;0xc858:   2a f2 37  "*.7"  
    LD BC,0x10d                       ;0xc85b:   01 0d 01  "..."  
    NOP                               ;0xc85e:   00  "." 
    ADD HL,BC                         ;0xc85f:   09  "." 
    LD (HL),E                         ;0xc860:   73  "s" 
    INC HL                            ;0xc861:   23  "#" 
    LD (HL),D                         ;0xc862:   72  "r" 
    RET                               ;0xc863:   c9  "." 
    LD BC,0x10d                       ;0xc864:   01 0d 01  "..."  
    NOP                               ;0xc867:   00  "." 
    ADD HL,BC                         ;0xc868:   09  "." 
    LD E,(HL)                         ;0xc869:   5e  "^" 
    INC HL                            ;0xc86a:   23  "#" 
    LD D,(HL)                         ;0xc86b:   56  "V" 
    EX DE,HL                          ;0xc86c:   eb  "." 
    SBC A,(HL)                        ;0xc86d:   9e  "." 
    DEC E                             ;0xc86e:   1d  "." 
    CALL p, 0x1d93                    ;0xc86f:   f4 93 1d  "..." 
    CALL 0x3961                       ;0xc872:   cd 61 39  ".a9" 
    INC HL                            ;0xc875:   23  "#" 
    INC HL                            ;0xc876:   23  "#" 
    LD DE,0x37fb                      ;0xc877:   11 fb 37  "..7"  
    LD C,4                            ;0xc87a:   0e 04  ".."  
    JP 0x1d29                         ;0xc87c:   c3 29 1d  ".)." 
    CALL 0x3c30                       ;0xc87f:   cd 30 3c  ".0<" 
    LD DE,S_FFF3                      ;0xc882:   11 f3 ff  "..."  
    ADD HL,DE                         ;0xc885:   19  "." 
    LD (0x37f2),HL                    ;0xc886:   22 f2 37  "".7"  
    CALL 0x3a78                       ;0xc889:   cd 78 3a  ".x:" 
    PUSH HL                           ;0xc88c:   e5  "." 
    CALL 0x3a78                       ;0xc88d:   cd 78 3a  ".x:" 
    POP HL                            ;0xc890:   e1  "." 
    RET z                             ;0xc891:   c8  "." 
    EX DE,HL                          ;0xc892:   eb  "." 
    LD HL,2                           ;0xc893:   21 02 00  "!.."  
    LD (0x37f6),HL                    ;0xc896:   22 f6 37  "".7"  
    LD (0x37f8),HL                    ;0xc899:   22 f8 37  "".7"  
    EX DE,HL                          ;0xc89c:   eb  "." 
    LD (0x37f0),HL                    ;0xc89d:   22 f0 37  "".7"  
    CALL 0x3958                       ;0xc8a0:   cd 58 39  ".X9" 
    CALL 0x1d1f                       ;0xc8a3:   cd 1f 1d  "..." 
    JP z, 0x3a43                      ;0xc8a6:   ca 43 3a  ".C:" 
    LD HL,(0x37f0)                    ;0xc8a9:   2a f0 37  "*.7"  
    LD A,(HL)                         ;0xc8ac:   7e  "~" 
    INC A                             ;0xc8ad:   3c  "<" 
    JP nz, 0x39ce                     ;0xc8ae:   c2 ce 39  "..9" 
    EX DE,HL                          ;0xc8b1:   eb  "." 
    LD HL,(0x37f2)                    ;0xc8b2:   2a f2 37  "*.7"  
    LD (0x37f6),HL                    ;0xc8b5:   22 f6 37  "".7"  
    JP 0x39f3                         ;0xc8b8:   c3 f3 39  "..9" 
    LD A,(0x37aa)                     ;0xc8bb:   3a aa 37  ":.7"  
    CP (HL)                           ;0xc8be:   be  "." 
    JP nz, 0x39f4                     ;0xc8bf:   c2 f4 39  "..9" 
    EX DE,HL                          ;0xc8c2:   eb  "." 
    LD HL,0x105                       ;0xc8c3:   21 05 01  "!.."  
    NOP                               ;0xc8c6:   00  "." 
    ADD HL,DE                         ;0xc8c7:   19  "." 
    LD A,(0x3790)                     ;0xc8c8:   3a 90 37  ":.7"  
    OR A                              ;0xc8cb:   b7  "." 
    JP z, 0x39f3                      ;0xc8cc:   ca f3 39  "..9" 
    CP (HL)                           ;0xc8cf:   be  "." 
    JP nz, 0x39f3                     ;0xc8d0:   c2 f3 39  "..9" 
    LD A,(0x3c39)                     ;0xc8d3:   3a 39 3c  ":9<"  
    OR A                              ;0xc8d6:   b7  "." 
    LD BC,0xc200                      ;0xc8d7:   01 00 c2  "..."  
    DI                                ;0xc8da:   f3  "." 
    ADD HL,SP                         ;0xc8db:   39  "9" 
;--------------------------------------
C_C8DC:                               ; XREF: 0xC8EF 
    LD HL,(0x37f2)                    ;0xc8dc:   2a f2 37  "*.7"  
;--------------------------------------
D_C8DF:                               ; XREF: 0xE1DA 
    DEFB 0x22                         ;0xc8df:   """
    DEFB 0xf8                         ;0xc8e0:   ('x') + 0x80
    DEFB 0x37                         ;0xc8e1:   "7"
    DEFB 0xeb                         ;0xc8e2:   ('k') + 0x80
    DEFB 0xe5                         ;0xc8e3:   ('e') + 0x80
    DEFB 0xcd                         ;0xc8e4:   ('M') + 0x80
    DEFB 0x78                         ;0xc8e5:   "x"
    DEFB 0x3a                         ;0xc8e6:   ":"
    DEFB 0xd1                         ;0xc8e7:   ('Q') + 0x80
    DEFB 0xca                         ;0xc8e8:   ('J') + 0x80
    DEFB 0x4                          ;0xc8e9:   0x4
    DEFB 0x3a                         ;0xc8ea:   ":"
    DEFB 0xeb                         ;0xc8eb:   ('k') + 0x80
    DEFB 0x22                         ;0xc8ec:   """
    DEFB 0xf2                         ;0xc8ed:   ('r') + 0x80
    DEFB 0x37                         ;0xc8ee:   "7"
    DEFB 0x38                         ;0xc8ef:   "8"
    DEFB 0xeb                         ;0xc8f0:   ('k') + 0x80
    DEFB 0x2a                         ;0xc8f1:   "*"
    DEFB 0x1b                         ;0xc8f2:   0x1b
    DEFB 0xf6                         ;0xc8f3:   ('v') + 0x80
    DEFB 0x19                         ;0xc8f4:   0x19
    DEFB 0xf1                         ;0xc8f5:   ('q') + 0x80
    DEFB 0xfe                         ;0xc8f6:   ('~') + 0x80
    DEFB 0x3                          ;0xc8f7:   0x3
    DEFB 0xc2                         ;0xc8f8:   ('B') + 0x80
    DEFB 0x10                         ;0xc8f9:   0x10
    DEFB 0x39                         ;0xc8fa:   "9"
    DEFB 0x22                         ;0xc8fb:   """
    DEFB 0x67                         ;0xc8fc:   "g"
    DEFB 0x37                         ;0xc8fd:   "7"
    DEFB 0xc9                         ;0xc8fe:   ('I') + 0x80
    DEFB 0xeb                         ;0xc8ff:   ('k') + 0x80
    DEFB 0x2a                         ;0xc900:   "*"
    DEFB 0xd8                         ;0xc901:   ('X') + 0x80
    DEFB 0xfb                         ;0xc902:   ('{') + 0x80
    DEFB 0x1                          ;0xc903:   0x1
    DEFB 0x80                         ;0xc904:   0x80
    DEFB 0x1                          ;0xc905:   0x1
    DEFB 0x0                          ;0xc906:   0x0
    DEFB 0xfe                         ;0xc907:   ('~') + 0x80
    DEFB 0x1                          ;0xc908:   0x1
    DEFB 0xc2                         ;0xc909:   ('B') + 0x80
    DEFB 0x33                         ;0xc90a:   "3"
    DEFB 0x39                         ;0xc90b:   "9"
    DEFB 0x3a                         ;0xc90c:   ":"
    DEFB 0xfa                         ;0xc90d:   ('z') + 0x80
    DEFB 0xfb                         ;0xc90e:   ('{') + 0x80
    DEFB 0x3d                         ;0xc90f:   "="
    DEFB 0xba                         ;0xc910:   (':') + 0x80
    DEFB 0xda                         ;0xc911:   ('Z') + 0x80
    DEFB 0xc                          ;0xc912:   0xc
    DEFB 0xf6                         ;0xc913:   ('v') + 0x80
    DEFB 0x3a                         ;0xc914:   ":"
    DEFB 0xfa                         ;0xc915:   ('z') + 0x80
    DEFB 0x37                         ;0xc916:   "7"
    DEFB 0x4f                         ;0xc917:   "O"
    DEFB 0x6                          ;0xc918:   0x6
    DEFB 0x1                          ;0xc919:   0x1
    DEFB 0xcd                         ;0xc91a:   ('M') + 0x80
    DEFB 0x69                         ;0xc91b:   "i"
    DEFB 0x39                         ;0xc91c:   "9"
    DEFB 0x1                          ;0xc91d:   0x1
    DEFB 0x80                         ;0xc91e:   0x80
    DEFB 0x1                          ;0xc91f:   0x1
    DEFB 0x0                          ;0xc920:   0x0
    DEFB 0xc3                         ;0xc921:   ('C') + 0x80
    DEFB 0xc                          ;0xc922:   0xc
    DEFB 0xf6                         ;0xc923:   ('v') + 0x80
    DEFB 0xeb                         ;0xc924:   ('k') + 0x80
    DEFB 0x3a                         ;0xc925:   ":"
    DEFB 0xfa                         ;0xc926:   ('z') + 0x80
    DEFB 0xfb                         ;0xc927:   ('{') + 0x80
    DEFB 0x3d                         ;0xc928:   "="
    DEFB 0xbc                         ;0xc929:   ('<') + 0x80
    DEFB 0xda                         ;0xc92a:   ('Z') + 0x80
    DEFB 0x48                         ;0xc92b:   "H"
    DEFB 0x39                         ;0xc92c:   "9"
    DEFB 0x3a                         ;0xc92d:   ":"
    DEFB 0xfa                         ;0xc92e:   ('z') + 0x80
    DEFB 0x37                         ;0xc92f:   "7"
    DEFB 0x47                         ;0xc930:   "G"
    DEFB 0xe                          ;0xc931:   0xe
    DEFB 0x1                          ;0xc932:   0x1
    DEFB 0xcd                         ;0xc933:   ('M') + 0x80
    DEFB 0x69                         ;0xc934:   "i"
    DEFB 0x39                         ;0xc935:   "9"
    DEFB 0x1                          ;0xc936:   0x1
    DEFB 0x80                         ;0xc937:   0x80
    DEFB 0x1                          ;0xc938:   0x1
    DEFB 0x0                          ;0xc939:   0x0
    DEFB 0xcd                         ;0xc93a:   ('M') + 0x80
    DEFB 0xc                          ;0xc93b:   0xc
    DEFB 0xf6                         ;0xc93c:   ('v') + 0x80
    DEFB 0xcd                         ;0xc93d:   ('M') + 0x80
    DEFB 0x61                         ;0xc93e:   "a"
    DEFB 0x39                         ;0xc93f:   "9"
    DEFB 0x36                         ;0xc940:   "6"
    DEFB 0xff                         ;0xc941:   0xff
    DEFB 0xc9                         ;0xc942:   ('I') + 0x80
    DEFB 0x3a                         ;0xc943:   ":"
    DEFB 0x90                         ;0xc944:   0x90
    DEFB 0x37                         ;0xc945:   "7"
    DEFB 0x47                         ;0xc946:   "G"
    DEFB 0x2f                         ;0xc947:   "/"
    DEFB 0x4f                         ;0xc948:   "O"
    DEFB 0xc9                         ;0xc949:   ('I') + 0x80
    DEFB 0x2a                         ;0xc94a:   "*"
    DEFB 0xf0                         ;0xc94b:   ('p') + 0x80
    DEFB 0x37                         ;0xc94c:   "7"
    DEFB 0x11                         ;0xc94d:   0x11
    DEFB 0xaa                         ;0xc94e:   ('*') + 0x80
    DEFB 0x37                         ;0xc94f:   "7"
    DEFB 0xe                          ;0xc950:   0xe
    DEFB 0x4                          ;0xc951:   0x4
    DEFB 0xc9                         ;0xc952:   ('I') + 0x80
    DEFB 0x11                         ;0xc953:   0x11
    DEFB 0x4                          ;0xc954:   0x4
    DEFB 0x1                          ;0xc955:   0x1
    DEFB 0x0                          ;0xc956:   0x0
    DEFB 0x2a                         ;0xc957:   "*"
    DEFB 0xf0                         ;0xc958:   ('p') + 0x80
    DEFB 0x37                         ;0xc959:   "7"
    DEFB 0x19                         ;0xc95a:   0x19
    DEFB 0xc9                         ;0xc95b:   ('I') + 0x80
    DEFB 0xe5                         ;0xc95c:   ('e') + 0x80
    DEFB 0xd5                         ;0xc95d:   ('U') + 0x80
    DEFB 0xcd                         ;0xc95e:   ('M') + 0x80
    DEFB 0x57                         ;0xc95f:   "W"
    DEFB 0xfc                         ;0xc960:   ('|') + 0x80
    DEFB 0xd1                         ;0xc961:   ('Q') + 0x80
    DEFB 0xe1                         ;0xc962:   ('a') + 0x80
    DEFB 0xc9                         ;0xc963:   ('I') + 0x80
    DEFB 0xf5                         ;0xc964:   ('u') + 0x80
    DEFB 0xcd                         ;0xc965:   ('M') + 0x80
    DEFB 0xc                          ;0xc966:   0xc
    DEFB 0x1e                         ;0xc967:   0x1e
    DEFB 0x3a                         ;0xc968:   ":"
    DEFB 0xfa                         ;0xc969:   ('z') + 0x80
    DEFB 0x37                         ;0xc96a:   "7"
    DEFB 0xcd                         ;0xc96b:   ('M') + 0x80
    DEFB 0x54                         ;0xc96c:   "T"
    DEFB 0xfc                         ;0xc96d:   ('|') + 0x80
    DEFB 0xe                          ;0xc96e:   0xe
    DEFB 0x1                          ;0xc96f:   0x1
    DEFB 0xf1                         ;0xc970:   ('q') + 0x80
    DEFB 0x3d                         ;0xc971:   "="
    DEFB 0xca                         ;0xc972:   ('J') + 0x80
    DEFB 0xf5                         ;0xc973:   ('u') + 0x80
    DEFB 0xfe                         ;0xc974:   ('~') + 0x80
    DEFB 0x4                          ;0xc975:   0x4
    DEFB 0xd2                         ;0xc976:   ('R') + 0x80
    DEFB 0x8d                         ;0xc977:   0x8d
;--------------------------------------
C_C978:                               ; XREF: 0xC0F1 
    JR c, $-49                        ;0xc978:   38 cd  "8." 
    DEC BC                            ;0xc97a:   0b  "." 
    INC A                             ;0xc97b:   3c  "<" 
    JP z, 0x38f2                      ;0xc97c:   ca f2 38  "..8" 
    XOR A                             ;0xc97f:   af  "." 
    CALL 0x3961                       ;0xc980:   cd 61 39  ".a9" 
    CP 5                              ;0xc983:   fe 05  ".." 
    JP z, 0x389a                      ;0xc985:   ca 9a 38  "..8" 
    LD A,(HL)                         ;0xc988:   7e  "~" 
    OR A                              ;0xc989:   b7  "." 
    JP z, 0x38c2                      ;0xc98a:   ca c2 38  "..8" 
    LD (HL),1                         ;0xc98d:   36 01  "6."  
    NOP                               ;0xc98f:   00  "." 
    LD HL,(0x37ab)                    ;0xc990:   2a ab 37  "*.7"  
    PUSH HL                           ;0xc993:   e5  "." 
    LD A,(0x37ad)                     ;0xc994:   3a ad 37  ":.7"  
    PUSH AF                           ;0xc997:   f5  "." 
    CALL 0x3958                       ;0xc998:   cd 58 39  ".X9" 
    EX DE,HL                          ;0xc99b:   eb  "." 
    CALL 0x1d29                       ;0xc99c:   cd 29 1d  ".)." 
    LD HL,0x37a9                      ;0xc99f:   21 a9 37  "!.7"  
    LD A,(0x37aa)                     ;0xc9a2:   3a aa 37  ":.7"  
    CP (HL)                           ;0xc9a5:   be  "." 
    CALL nz, 0x2d54                   ;0xc9a6:   c4 54 2d  ".T-" 
    LD A,1                            ;0xc9a9:   3e 01  ">."  
    CALL z, 0x3971                    ;0xc9ab:   cc 71 39  ".q9" 
    POP BC                            ;0xc9ae:   c1  "." 
    POP DE                            ;0xc9af:   d1  "." 
    CALL 0x1e03                       ;0xc9b0:   cd 03 1e  "..." 
    CALL 0x2d6b                       ;0xc9b3:   cd 6b 2d  ".k-" 
    POP AF                            ;0xc9b6:   f1  "." 
    CP 4                              ;0xc9b7:   fe 04  ".." 
    RET nc                            ;0xc9b9:   d0  "." 
    PUSH AF                           ;0xc9ba:   f5  "." 
    CP 2                              ;0xc9bb:   fe 02  ".." 
    JP nz, 0x38d6                     ;0xc9bd:   c2 d6 38  "..8" 
    LD HL,0x3794                      ;0xc9c0:   21 94 37  "!.7"  
    LD A,(0x3793)                     ;0xc9c3:   3a 93 37  ":.7"  
    CP (HL)                           ;0xc9c6:   be  "." 
    JP nc, 0x38e0                     ;0xc9c7:   d2 e0 38  "..8" 
    CALL 0x3c1b                       ;0xc9ca:   cd 1b 3c  "..<" 
    LD (HL),0xff                      ;0xc9cd:   36 ff  "6."  
    LD A,2                            ;0xc9cf:   3e 02  ">."  
    JP 0x38e3                         ;0xc9d1:   c3 e3 38  "..8" 
    INC A                             ;0xc9d4:   3c  "<" 
    LD (HL),A                         ;0xc9d5:   77  "w" 
    XOR A                             ;0xc9d6:   af  "." 
    CALL 0x3971                       ;0xc9d7:   cd 71 39  ".q9" 
    CALL 0x3958                       ;0xc9da:   cd 58 39  ".X9" 
    CALL 0x1d29                       ;0xc9dd:   cd 29 1d  ".)." 
    LD (HL),1                         ;0xc9e0:   36 01  "6."  
    NOP                               ;0xc9e2:   00  "." 
    INC HL                            ;0xc9e3:   23  "#" 
    CALL 0x3a83                       ;0xc9e4:   cd 83 3a  "..:" 
    LD A,(0x37ef)                     ;0xc9e7:   3a ef 37  ":.7"  
    INC A                             ;0xc9ea:   3c  "<" 
    LD DE,0x180                       ;0xc9eb:   11 80 01  "..."  
    NOP                               ;0xc9ee:   00  "." 
    LD HL,S_FF80                      ;0xc9ef:   21 80 ff  "!.."  
    ADD HL,DE                         ;0xc9f2:   19  "." 
    DEC A                             ;0xc9f3:   3d  "=" 
    JP nz, 0x7bfc                     ;0xc9f4:   c2 fc 7b  "..{" 
    SCF                               ;0xc9f7:   37  "7" 
    CP 4                              ;0xc9f8:   fe 04  ".." 
    JP nz, 0x3858                     ;0xc9fa:   c2 58 38  ".X8" 
    LD E,(HL)                         ;0xc9fd:   5e  "^" 
    INC HL                            ;0xc9fe:   23  "#" 
    LD D,(HL)                         ;0xc9ff:   56  "V" 
    LD HL,D_FFFF                      ;0xca00:   21 ff ff  "!.."  
    LD (0x37fb),HL                    ;0xca03:   22 fb 37  "".7"  
    EX DE,HL                          ;0xca06:   eb  "." 
    LD A,(0x37aa)                     ;0xca07:   3a aa 37  ":.7"  
    CP (HL)                           ;0xca0a:   be  "." 
    JP nz, 0x383c                     ;0xca0b:   c2 3c 38  ".<8" 
    EX DE,HL                          ;0xca0e:   eb  "." 
    LD HL,0x104                       ;0xca0f:   21 04 01  "!.."  
    NOP                               ;0xca12:   00  "." 
    ADD HL,DE                         ;0xca13:   19  "." 
    LD A,(HL)                         ;0xca14:   7e  "~" 
    EX DE,HL                          ;0xca15:   eb  "." 
    INC A                             ;0xca16:   3c  "<" 
    JP nz, 0x383c                     ;0xca17:   c2 3c 38  ".<8" 
    PUSH HL                           ;0xca1a:   e5  "." 
    INC DE                            ;0xca1b:   13  "." 
    INC DE                            ;0xca1c:   13  "." 
    EX DE,HL                          ;0xca1d:   eb  "." 
    LD E,(HL)                         ;0xca1e:   5e  "^" 
    INC HL                            ;0xca1f:   23  "#" 
    LD D,(HL)                         ;0xca20:   56  "V" 
    LD HL,(0x37fb)                    ;0xca21:   2a fb 37  "*.7"  
    CALL 0x207f                       ;0xca24:   cd 7f 20  ".. " 
    POP HL                            ;0xca27:   e1  "." 
    JP nc, 0x383c                     ;0xca28:   d2 3c 38  ".<8" 
    EX DE,HL                          ;0xca2b:   eb  "." 
    LD (0x37fb),HL                    ;0xca2c:   22 fb 37  "".7"  
    EX DE,HL                          ;0xca2f:   eb  "." 
    LD (0x37fd),HL                    ;0xca30:   22 fd 37  "".7"  
    CALL 0x3a78                       ;0xca33:   cd 78 3a  ".x:" 
    JP nz, 0x3811                     ;0xca36:   c2 11 38  "..8" 
    LD HL,0x37fb                      ;0xca39:   21 fb 37  "!.7"  
    CALL 0x21fb                       ;0xca3c:   cd fb 21  "..!" 
    RET z                             ;0xca3f:   c8  "." 
    LD HL,(0x37fd)                    ;0xca40:   2a fd 37  "*.7"  
    XOR A                             ;0xca43:   af  "." 
    LD A,4                            ;0xca44:   3e 04  ">."  
    CALL 0x3858                       ;0xca46:   cd 58 38  ".X8" 
    LD HL,(0x377b)                    ;0xca49:   2a 7b 37  "*{7"  
    JP 0x3807                         ;0xca4c:   c3 07 38  "..8" 
    PUSH AF                           ;0xca4f:   f5  "." 
    CALL 0x3951                       ;0xca50:   cd 51 39  ".Q9" 
    LD A,(0x37ab)                     ;0xca53:   3a ab 37  ":.7"  
    LD E,A                            ;0xca56:   5f  "_" 
    AND B                             ;0xca57:   a0  "." 
    LD (0x37ef),A                     ;0xca58:   32 ef 37  "2.7"  
    LD A,E                            ;0xca5b:   7b  "{" 
    AND C                             ;0xca5c:   a1  "." 
    LD (0x37ab),A                     ;0xca5d:   32 ab 37  "2.7"  
    POP AF                            ;0xca60:   f1  "." 
    PUSH AF                           ;0xca61:   f5  "." 
    CALL nz, 0x3992                   ;0xca62:   c4 92 39  "..9" 
    LD (0x37f0),HL                    ;0xca65:   22 f0 37  "".7"  
    CALL 0x2182                       ;0xca68:   cd 82 21  "..!" 
    LD (D_F61B),HL                    ;0xca6b:   22 1b f6  "".."  
    CALL 0x3958                       ;0xca6e:   cd 58 39  ".X9" 
    LD A,(HL)                         ;0xca71:   7e  "~" 
    INC A                             ;0xca72:   3c  "<" 
    JP z, 0x38c2                      ;0xca73:   ca c2 38  "..8" 
    POP AF                            ;0xca76:   f1  "." 
    ADD HL,HL                         ;0xca77:   29  ")" 
    NOP                               ;0xca78:   00  "." 
    RST 0x38                          ;0xca79:   ff  "." 
    RST 0x38                          ;0xca7a:   ff  "." 
    DEC D                             ;0xca7b:   15  "." 
    NOP                               ;0xca7c:   00  "." 
    RRCA                              ;0xca7d:   0f  "." 
    DJNZ C_CA91                       ;0xca7e:   10 11  ".." 
    INC DE                            ;0xca80:   13  "." 
    LD D,0x17                         ;0xca81:   16 17  ".."  
    LD E,0x23                         ;0xca83:   1e 23  ".#"  
    DEFB "cdfg", 0x64                 ;0xca85:   0xca85 to 0xca86
    DEFB 0x0                          ;0xca8a:   
    DEFB 0x14                         ;0xca8b:   0x14
    DEFB 0x15                         ;0xca8c:   0x15
    DEFB "!",34,"()", 0x22            ;0xca8d:   0xca8d to 0xca8e
    LD HL,(0x4ecd)                    ;0xca97:   2a cd 4e  "*.N"  
    CALL m, C_F421                    ;0xca9a:   fc 21 f4  ".!." 
    EI                                ;0xca9d:   fb  "." 
    EX DE,HL                          ;0xca9e:   eb  "." 
    CALL 0x370e                       ;0xca9f:   cd 0e 37  "..7" 
    LD A,(DE)                         ;0xcaa2:   1a  "." 
    JP 0x1972                         ;0xcaa3:   c3 72 19  ".r." 
    LD C,4                            ;0xcaa6:   0e 04  ".."  
    JP 0x1d29                         ;0xcaa8:   c3 29 1d  ".)." 
    LD HL,0x37ee                      ;0xcaab:   21 ee 37  "!.7"  
    EX DE,HL                          ;0xcaae:   eb  "." 
    LD BC,0x108                       ;0xcaaf:   01 08 01  "..."  
    NOP                               ;0xcab2:   00  "." 
    PUSH HL                           ;0xcab3:   e5  "." 
    JP 0x2f4e                         ;0xcab4:   c3 4e 2f  ".N/" 
    LD HL,1                           ;0xcab7:   21 01 00  "!.."  
    RRCA                              ;0xcaba:   0f  "." 
    EX DE,HL                          ;0xcabb:   eb  "." 
    LD C,6                            ;0xcabc:   0e 06  ".."  
    JP 0x1d29                         ;0xcabe:   c3 29 1d  ".)." 
    LD A,D                            ;0xcac1:   7a  "z" 
    AND E                             ;0xcac2:   a3  "." 
    INC A                             ;0xcac3:   3c  "<" 
    LD HL,(D_FBAC)                    ;0xcac4:   2a ac fb  "*.."  
    JP z, 0x3329                      ;0xcac7:   ca 29 33  ".)3" 
    EX DE,HL                          ;0xcaca:   eb  "." 
    LD (D_FBAC),HL                    ;0xcacb:   22 ac fb  "".."  
    RET                               ;0xcace:   c9  "." 
    LD HL,D_FFFF                      ;0xcacf:   21 ff ff  "!.."  
    LD (0x1c9f),HL                    ;0xcad2:   22 9f 1c  "".."  
    LD A,(D_FBDD)                     ;0xcad5:   3a dd fb  ":.."  
    OR A                              ;0xcad8:   b7  "." 
    JP z, 0x3758                      ;0xcad9:   ca 58 37  ".X7" 
    LD HL,(D_FBDB)                    ;0xcadc:   2a db fb  "*.."  
    LD A,(0x37bf)                     ;0xcadf:   3a bf 37  ":.7"  
    LD (HL),A                         ;0xcae2:   77  "w" 
    LD DE,0x107                       ;0xcae3:   11 07 01  "..."  
    NOP                               ;0xcae6:   00  "." 
    ADD HL,DE                         ;0xcae7:   19  "." 
    LD A,(0x37b6)                     ;0xcae8:   3a b6 37  ":.7"  
    OR (HL)                           ;0xcaeb:   b6  "." 
    LD (HL),A                         ;0xcaec:   77  "w" 
    INC HL                            ;0xcaed:   23  "#" 
    LD A,(0x37b5)                     ;0xcaee:   3a b5 37  ":.7"  
    OR (HL)                           ;0xcaf1:   b6  "." 
    LD (HL),A                         ;0xcaf2:   77  "w" 
    LD HL,(0x1232)                    ;0xcaf3:   2a 32 12  "*2."  
    LD SP,HL                          ;0xcaf6:   f9  "." 
    LD HL,(0x1c9f)                    ;0xcaf7:   2a 9f 1c  "*.."  
    LD A,L                            ;0xcafa:   7d  "}" 
    LD B,H                            ;0xcafb:   44  "D" 
    RET                               ;0xcafc:   c9  "." 
    PUSH HL                           ;0xcafd:   e5  "." 
    DEC E                             ;0xcafe:   1d  "." 
    NOP                               ;0xcaff:   00  "." 
    RET z                             ;0xcb00:   c8  "." 
    CALL 0x2803                       ;0xcb01:   cd 03 28  "..(" 
    CALL 0x3010                       ;0xcb04:   cd 10 30  "..0" 
    OR A                              ;0xcb07:   b7  "." 
    JP z, 0x36e4                      ;0xcb08:   ca e4 36  "..6" 
    CALL 0x2f83                       ;0xcb0b:   cd 83 2f  "../" 
    JP nz, 0x36a1                     ;0xcb0e:   c2 a1 36  "..6" 
    LD A,0xff                         ;0xcb11:   3e ff  ">."  
    LD (D_F615),A                     ;0xcb13:   32 15 f6  "2.."  
    CALL 0x23f5                       ;0xcb16:   cd f5 23  "..#" 
    RET z                             ;0xcb19:   c8  "." 
    CALL 0x2816                       ;0xcb1a:   cd 16 28  "..(" 
    RET z                             ;0xcb1d:   c8  "." 
    CALL 0x2fb1                       ;0xcb1e:   cd b1 2f  "../" 
    CALL 0x2fd4                       ;0xcb21:   cd d4 2f  "../" 
    JP nz, 0x2edf                     ;0xcb24:   c2 df 2e  "..." 
    PUSH HL                           ;0xcb27:   e5  "." 
    CALL 0x1f3f                       ;0xcb28:   cd 3f 1f  ".?." 
    POP DE                            ;0xcb2b:   d1  "." 
    EX DE,HL                          ;0xcb2c:   eb  "." 
    LD A,(HL)                         ;0xcb2d:   7e  "~" 
    OR A                              ;0xcb2e:   b7  "." 
    JP nz, 0x36be                     ;0xcb2f:   c2 be 36  "..6" 
    LD A,(DE)                         ;0xcb32:   1a  "." 
    AND 1                             ;0xcb33:   e6 01  ".." 
    JP nz, 0x36be                     ;0xcb35:   c2 be 36  "..6" 
    CALL 0x3619                       ;0xcb38:   cd 19 36  "..6" 
    JP 0x36ca                         ;0xcb3b:   c3 ca 36  "..6" 
    LD A,(DE)                         ;0xcb3e:   1a  "." 
    AND 0xe0                          ;0xcb3f:   e6 e0  ".." 
    JP nz, 0x36c6                     ;0xcb41:   c2 c6 36  "..6" 
    LD A,0x80                         ;0xcb44:   3e 80  ">."  
    LD (HL),A                         ;0xcb46:   77  "w" 
    CALL 0x3603                       ;0xcb47:   cd 03 36  "..6" 
    CALL 0x2f99                       ;0xcb4a:   cd 99 2f  "../" 
    DEC A                             ;0xcb4d:   3d  "=" 
    LD (0x37e4),A                     ;0xcb4e:   32 e4 37  "2.7"  
    CALL 0x1f9c                       ;0xcb51:   cd 9c 1f  "..." 
    CALL 0x23f0                       ;0xcb54:   cd f0 23  "..#" 
    RET z                             ;0xcb57:   c8  "." 
    CALL 0x3010                       ;0xcb58:   cd 10 30  "..0" 
    OR A                              ;0xcb5b:   b7  "." 
    RET nz                            ;0xcb5c:   c0  "." 
    LD A,(0x37e4)                     ;0xcb5d:   3a e4 37  ":.7"  
    LD (HL),A                         ;0xcb60:   77  "w" 
    JP 0x219a                         ;0xcb61:   c3 9a 21  "..!" 
    LD A,(HL)                         ;0xcb64:   7e  "~" 
    PUSH AF                           ;0xcb65:   f5  "." 
    CALL 0x2f83                       ;0xcb66:   cd 83 2f  "../" 
    POP BC                            ;0xcb69:   c1  "." 
    JP z, 0x3691                      ;0xcb6a:   ca 91 36  "..6" 
    LD (HL),B                         ;0xcb6d:   70  "p" 
    JP 0x36a1                         ;0xcb6e:   c3 a1 36  "..6" 
    LD HL,D_FBF4                      ;0xcb71:   21 f4 fb  "!.."  
    CALL 0x370e                       ;0xcb74:   cd 0e 37  "..7" 
    LD (HL),1                         ;0xcb77:   36 01  "6."  
    NOP                               ;0xcb79:   00  "." 
    LD C,0xff                         ;0xcb7a:   0e ff  ".."  
    JP 0xfc4e                         ;0xcb7c:   c3 4e fc  ".N." 
    LD C,1                            ;0xcb7f:   0e 01  ".."  
    NOP                               ;0xcb81:   00  "." 
    SCF                               ;0xcb82:   37  "7" 
    LD (HL),A                         ;0xcb83:   77  "w" 
    POP HL                            ;0xcb84:   e1  "." 
    LD A,(DE)                         ;0xcb85:   1a  "." 
    AND 1                             ;0xcb86:   e6 01  ".." 
    JP z, 0x3619                      ;0xcb88:   ca 19 36  "..6" 
    LD DE,0x108                       ;0xcb8b:   11 08 01  "..."  
    NOP                               ;0xcb8e:   00  "." 
    CALL 0x2fa7                       ;0xcb8f:   cd a7 2f  "../" 
    CALL 0x2f42                       ;0xcb92:   cd 42 2f  ".B/" 
    LD (HL),B                         ;0xcb95:   70  "p" 
    LD DE,S_FFF8                      ;0xcb96:   11 f8 ff  "..."  
    CALL 0x2fa7                       ;0xcb99:   cd a7 2f  "../" 
    CALL 0x3bc8                       ;0xcb9c:   cd c8 3b  "..;" 
    JP 0x219a                         ;0xcb9f:   c3 9a 21  "..!" 
    CALL 0x2d67                       ;0xcba2:   cd 67 2d  ".g-" 
    CALL 0x2e73                       ;0xcba5:   cd 73 2e  ".s." 
    JP 0x1972                         ;0xcba8:   c3 72 19  ".r." 
    CALL 0x2d90                       ;0xcbab:   cd 90 2d  "..-" 
    CALL 0x262d                       ;0xcbae:   cd 2d 26  ".-&" 
    CALL 0x1f9c                       ;0xcbb1:   cd 9c 1f  "..." 
    CALL 0x23f0                       ;0xcbb4:   cd f0 23  "..#" 
    RET z                             ;0xcbb7:   c8  "." 
    CALL 0x1ec4                       ;0xcbb8:   cd c4 1e  "..." 
    LD BC,0x108                       ;0xcbbb:   01 08 01  "..."  
    NOP                               ;0xcbbe:   00  "." 
    CALL 0x1fa4                       ;0xcbbf:   cd a4 1f  "..." 
    PUSH HL                           ;0xcbc2:   e5  "." 
    LD C,1                            ;0xcbc3:   0e 01  ".."  
    NOP                               ;0xcbc5:   00  "." 
    CALL 0x3012                       ;0xcbc6:   cd 12 30  "..0" 
    OR A                              ;0xcbc9:   b7  "." 
    JP nz, 0x3653                     ;0xcbca:   c2 53 36  ".S6" 
    POP DE                            ;0xcbcd:   d1  "." 
    EX DE,HL                          ;0xcbce:   eb  "." 
    LD C,8                            ;0xcbcf:   0e 08  ".."  
    CALL 0x1d29                       ;0xcbd1:   cd 29 1d  ".)." 
    LD A,(DE)                         ;0xcbd4:   1a  "." 
    JP 0x365f                         ;0xcbd5:   c3 5f 36  "._6" 
    POP HL                            ;0xcbd8:   e1  "." 
    LD BC,0x108                       ;0xcbd9:   01 08 01  "..."  
    NOP                               ;0xcbdc:   00  "." 
    CALL 0x1fa4                       ;0xcbdd:   cd a4 1f  "..." 
    CALL 0x2f83                       ;0xcbe0:   cd 83 2f  "../" 
    RET z                             ;0xcbe3:   c8  "." 
    LD A,(HL)                         ;0xcbe4:   7e  "~" 
    CALL 0x1f3f                       ;0xcbe5:   cd 3f 1f  ".?." 
    LD (HL),A                         ;0xcbe8:   77  "w" 
    RET                               ;0xcbe9:   c9  "." 
    CALL 0x2d90                       ;0xcbea:   cd 90 2d  "..-" 
    CALL 0x2e73                       ;0xcbed:   cd 73 2e  ".s." 
    RLA                               ;0xcbf0:   17  "." 
    JP nc, 0x24c0                     ;0xcbf1:   d2 c0 24  "..$" 
    CALL 0x262d                       ;0xcbf4:   cd 2d 26  ".-&" 
    CALL 0x1f3f                       ;0xcbf7:   cd 3f 1f  ".?." 
    LD B,(HL)                         ;0xcbfa:   46  "F" 
    PUSH HL                           ;0xcbfb:   e5  "." 
    PUSH BC                           ;0xcbfc:   c5  "." 
    CALL 0x1f9c                       ;0xcbfd:   cd 9c 1f  "..." 
;--------------------------------------
D_CC00:                               ; XREF: 0xFDF9 
    DEFB 0xcd                         ;0xcc00:   ('M') + 0x80
    DEFB 0xf0                         ;0xcc01:   ('p') + 0x80
    DEFB 0x23                         ;0xcc02:   "#"
    DEFB 0xc1                         ;0xcc03:   ('A') + 0x80
    DEFB 0xe1                         ;0xcc04:   ('a') + 0x80
    DEFB 0x70                         ;0xcc05:   "p"
    DEFB 0x1b                         ;0xcc06:   0x1b
    DEFB 0x1b                         ;0xcc07:   0x1b
    DEFB 0x1a                         ;0xcc08:   0x1a
    DEFB 0x4e                         ;0xcc09:   "N"
    DEFB 0xcd                         ;0xcc0a:   ('M') + 0x80
    DEFB 0x86                         ;0xcc0b:   0x86
    DEFB 0x23                         ;0xcc0c:   "#"
    DEFB 0xc8                         ;0xcc0d:   ('H') + 0x80
    DEFB 0x1a                         ;0xcc0e:   0x1a
    DEFB 0xbe                         ;0xcc0f:   ('>') + 0x80
    DEFB 0xc9                         ;0xcc10:   ('I') + 0x80
    DEFB 0x3c                         ;0xcc11:   "<"
    DEFB 0x21                         ;0xcc12:   "!"
    DEFB 0xa3                         ;0xcc13:   ('#') + 0x80
    DEFB 0x37                         ;0xcc14:   "7"
    DEFB 0x34                         ;0xcc15:   "4"
    DEFB 0xca                         ;0xcc16:   ('J') + 0x80
    DEFB 0x94                         ;0xcc17:   0x94
    DEFB 0x35                         ;0xcc18:   "5"
    DEFB 0x87                         ;0xcc19:   0x87
    DEFB 0x35                         ;0xcc1a:   "5"
    DEFB 0xcd                         ;0xcc1b:   ('M') + 0x80
    DEFB 0xc4                         ;0xcc1c:   ('D') + 0x80
    DEFB 0x1e                         ;0xcc1d:   0x1e
    DEFB 0x4f                         ;0xcc1e:   "O"
    DEFB 0x6                          ;0xcc1f:   0x6
    DEFB 0x1                          ;0xcc20:   0x1
    DEFB 0x0                          ;0xcc21:   0x0
    DEFB 0x9                          ;0xcc22:   0x9
    DEFB 0x3e                         ;0xcc23:   ">"
    DEFB 0x10                         ;0xcc24:   0x10
    DEFB 0xb9                         ;0xcc25:   ('9') + 0x80
    DEFB 0xc8                         ;0xcc26:   ('H') + 0x80
    DEFB 0x70                         ;0xcc27:   "p"
    DEFB 0x23                         ;0xcc28:   "#"
    DEFB 0xc                          ;0xcc29:   0xc
    DEFB 0xc3                         ;0xcc2a:   ('C') + 0x80
    DEFB 0x9e                         ;0xcc2b:   0x9e
    DEFB 0x35                         ;0xcc2c:   "5"
    DEFB 0xcd                         ;0xcc2d:   ('M') + 0x80
    DEFB 0x90                         ;0xcc2e:   0x90
    DEFB 0x2d                         ;0xcc2f:   "-"
    DEFB 0x2a                         ;0xcc30:   "*"
    DEFB 0xdb                         ;0xcc31:   ('[') + 0x80
    DEFB 0xfb                         ;0xcc32:   ('{') + 0x80
    DEFB 0x36                         ;0xcc33:   "6"
    DEFB 0x21                         ;0xcc34:   "!"
    DEFB 0xe                          ;0xcc35:   0xe
    DEFB 0x1                          ;0xcc36:   0x1
    DEFB 0xcd                         ;0xcc37:   ('M') + 0x80
    DEFB 0xf7                         ;0xcc38:   ('w') + 0x80
    DEFB 0x23                         ;0xcc39:   "#"
    DEFB 0xc2                         ;0xcc3a:   ('B') + 0x80
    DEFB 0xbf                         ;0xcc3b:   ('?') + 0x80
    DEFB 0x35                         ;0xcc3c:   "5"
    DEFB 0xcd                         ;0xcc3d:   ('M') + 0x80
    DEFB 0x3f                         ;0xcc3e:   "?"
    DEFB 0x1f                         ;0xcc3f:   0x1f
    DEFB 0x7e                         ;0xcc40:   "~"
    DEFB 0xe6                         ;0xcc41:   ('f') + 0x80
    DEFB 0x70                         ;0xcc42:   "p"
    DEFB 0xc2                         ;0xcc43:   ('B') + 0x80
    DEFB 0xc0                         ;0xcc44:   ('@') + 0x80
    DEFB 0x24                         ;0xcc45:   "$"
    DEFB 0x2a                         ;0xcc46:   "*"
    DEFB 0xdb                         ;0xcc47:   ('[') + 0x80
    DEFB 0xfb                         ;0xcc48:   ('{') + 0x80
    DEFB 0x36                         ;0xcc49:   "6"
    DEFB 0x20                         ;0xcc4a:   " "
    DEFB 0xe                          ;0xcc4b:   0xe
    DEFB 0x1                          ;0xcc4c:   0x1
    DEFB 0xcd                         ;0xcc4d:   ('M') + 0x80
    DEFB 0x3                          ;0xcc4e:   0x3
    DEFB 0x28                         ;0xcc4f:   "("
    DEFB 0xcd                         ;0xcc50:   ('M') + 0x80
    DEFB 0xf7                         ;0xcc51:   ('w') + 0x80
    DEFB 0x23                         ;0xcc52:   "#"
    DEFB 0xc2                         ;0xcc53:   ('B') + 0x80
    DEFB 0xe4                         ;0xcc54:   ('d') + 0x80
    DEFB 0x35                         ;0xcc55:   "5"
    DEFB 0x3e                         ;0xcc56:   ">"
    DEFB 0xff                         ;0xcc57:   0xff
    DEFB 0x32                         ;0xcc58:   "2"
    DEFB 0x15                         ;0xcc59:   0x15
    DEFB 0xf6                         ;0xcc5a:   ('v') + 0x80
    DEFB 0xcd                         ;0xcc5b:   ('M') + 0x80
    DEFB 0x16                         ;0xcc5c:   0x16
    DEFB 0x28                         ;0xcc5d:   "("
    DEFB 0xc8                         ;0xcc5e:   ('H') + 0x80
    DEFB 0xcd                         ;0xcc5f:   ('M') + 0x80
    DEFB 0xb1                         ;0xcc60:   ('1') + 0x80
    DEFB 0x2f                         ;0xcc61:   "/"
    DEFB 0x1                          ;0xcc62:   0x1
    DEFB 0x18                         ;0xcc63:   0x18
    DEFB 0x1                          ;0xcc64:   0x1
    DEFB 0x0                          ;0xcc65:   0x0
    DEFB 0xcd                         ;0xcc66:   ('M') + 0x80
    DEFB 0x5                          ;0xcc67:   0x5
    DEFB 0x30                         ;0xcc68:   "0"
    DEFB 0xcd                         ;0xcc69:   ('M') + 0x80
    DEFB 0xdd                         ;0xcc6a:   (']') + 0x80
    DEFB 0x2f                         ;0xcc6b:   "/"
    DEFB 0x1                          ;0xcc6c:   0x1
    DEFB 0x1c                         ;0xcc6d:   0x1c
    DEFB 0x1                          ;0xcc6e:   0x1
    DEFB 0x0                          ;0xcc6f:   0x0
    DEFB 0xcd                         ;0xcc70:   ('M') + 0x80
    DEFB 0x5                          ;0xcc71:   0x5
    DEFB 0x30                         ;0xcc72:   "0"
    DEFB 0xcd                         ;0xcc73:   ('M') + 0x80
    DEFB 0xe2                         ;0xcc74:   ('b') + 0x80
    DEFB 0x2f                         ;0xcc75:   "/"
    DEFB 0xcd                         ;0xcc76:   ('M') + 0x80
    DEFB 0xd4                         ;0xcc77:   ('T') + 0x80
    DEFB 0x2f                         ;0xcc78:   "/"
    DEFB 0xc2                         ;0xcc79:   ('B') + 0x80
    DEFB 0xdf                         ;0xcc7a:   ('_') + 0x80
    DEFB 0x2e                         ;0xcc7b:   "."
    DEFB 0x1                          ;0xcc7c:   0x1
    DEFB 0x2                          ;0xcc7d:   0x2
    DEFB 0x0                          ;0xcc7e:   0x0
    DEFB 0xcd                         ;0xcc7f:   ('M') + 0x80
    DEFB 0xb7                         ;0xcc80:   ('7') + 0x80
    DEFB 0x2f                         ;0xcc81:   "/"
    DEFB 0x1a                         ;0xcc82:   0x1a
    DEFB 0xf6                         ;0xcc83:   ('v') + 0x80
    DEFB 0x1                          ;0xcc84:   0x1
    DEFB 0x77                         ;0xcc85:   "w"
    DEFB 0xe5                         ;0xcc86:   ('e') + 0x80
    DEFB 0x2a                         ;0xcc87:   "*"
    DEFB 0x6f                         ;0xcc88:   "o"
    DEFB 0x23                         ;0xcc89:   "#"
    DEFB 0xcd                         ;0xcc8a:   ('M') + 0x80
    DEFB 0x71                         ;0xcc8b:   "q"
    DEFB 0x35                         ;0xcc8c:   "5"
    DEFB 0xda                         ;0xcc8d:   ('Z') + 0x80
    DEFB 0x1c                         ;0xcc8e:   0x1c
    DEFB 0x35                         ;0xcc8f:   "5"
    DEFB 0xf5                         ;0xcc90:   ('u') + 0x80
    DEFB 0xe                          ;0xcc91:   0xe
    DEFB 0x1                          ;0xcc92:   0x1
    DEFB 0x0                          ;0xcc93:   0x0
    DEFB 0xcd                         ;0xcc94:   ('M') + 0x80
    DEFB 0x8b                         ;0xcc95:   0x8b
    DEFB 0x22                         ;0xcc96:   """
    DEFB 0xf1                         ;0xcc97:   ('q') + 0x80
    DEFB 0xca                         ;0xcc98:   ('J') + 0x80
    DEFB 0x22                         ;0xcc99:   """
    DEFB 0x35                         ;0xcc9a:   "5"
    DEFB 0xcd                         ;0xcc9b:   ('M') + 0x80
    DEFB 0x40                         ;0xcc9c:   "@"
    DEFB 0x20                         ;0xcc9d:   " "
    DEFB 0x36                         ;0xcc9e:   "6"
    DEFB 0xe5                         ;0xcc9f:   ('e') + 0x80
    DEFB 0xcd                         ;0xcca0:   ('M') + 0x80
    DEFB 0xc8                         ;0xcca1:   ('H') + 0x80
    DEFB 0x3b                         ;0xcca2:   ";"
    DEFB 0xcd                         ;0xcca3:   ('M') + 0x80
    DEFB 0x9a                         ;0xcca4:   0x9a
    DEFB 0x21                         ;0xcca5:   "!"
    DEFB 0xcd                         ;0xcca6:   ('M') + 0x80
    DEFB 0x3                          ;0xcca7:   0x3
    DEFB 0x24                         ;0xcca8:   "$"
    DEFB 0xc3                         ;0xcca9:   ('C') + 0x80
    DEFB 0xfe                         ;0xccaa:   ('~') + 0x80
    DEFB 0x34                         ;0xccab:   "4"
    DEFB 0xcd                         ;0xccac:   ('M') + 0x80
    DEFB 0x58                         ;0xccad:   "X"
    DEFB 0x1f                         ;0xccae:   0x1f
    DEFB 0xcd                         ;0xccaf:   ('M') + 0x80
    DEFB 0xa4                         ;0xccb0:   ('$') + 0x80
    DEFB 0x1e                         ;0xccb1:   0x1e
    DEFB 0xcd                         ;0xccb2:   ('M') + 0x80
    DEFB 0x8b                         ;0xccb3:   0x8b
    DEFB 0x35                         ;0xccb4:   "5"
    DEFB 0xcd                         ;0xccb5:   ('M') + 0x80
    DEFB 0x97                         ;0xccb6:   0x97
    DEFB 0x23                         ;0xccb7:   "#"
    DEFB 0xbe                         ;0xccb8:   ('>') + 0x80
    DEFB 0x77                         ;0xccb9:   "w"
    DEFB 0xf5                         ;0xccba:   ('u') + 0x80
    DEFB 0xcd                         ;0xccbb:   ('M') + 0x80
    DEFB 0x4f                         ;0xccbc:   "O"
    DEFB 0x1f                         ;0xccbd:   0x1f
    DEFB 0x7e                         ;0xccbe:   "~"
    DEFB 0x3c                         ;0xccbf:   "<"
    DEFB 0x12                         ;0xccc0:   0x12
    DEFB 0xf1                         ;0xccc1:   ('q') + 0x80
    DEFB 0xeb                         ;0xccc2:   ('k') + 0x80
    DEFB 0xc4                         ;0xccc3:   ('D') + 0x80
    DEFB 0x15                         ;0xccc4:   0x15
    DEFB 0x27                         ;0xccc5:   "'"
    DEFB 0x3a                         ;0xccc6:   ":"
    DEFB 0x9f                         ;0xccc7:   0x9f
    DEFB 0x37                         ;0xccc8:   "7"
    DEFB 0xb7                         ;0xccc9:   ('7') + 0x80
    DEFB 0xcc                         ;0xccca:   ('L') + 0x80
    DEFB 0x15                         ;0xcccb:   0x15
    DEFB 0x27                         ;0xcccc:   "'"
    DEFB 0x1                          ;0xcccd:   0x1
    DEFB 0xb                          ;0xccce:   0xb
    DEFB 0x1                          ;0xcccf:   0x1
    DEFB 0x0                          ;0xccd0:   0x0
    DEFB 0xcd                         ;0xccd1:   ('M') + 0x80
    DEFB 0x67                         ;0xccd2:   "g"
    DEFB 0x35                         ;0xccd3:   "5"
    DEFB 0xeb                         ;0xccd4:   ('k') + 0x80
    DEFB 0x7e                         ;0xccd5:   "~"
    DEFB 0xe6                         ;0xccd6:   ('f') + 0x80
    DEFB 0x7f                         ;0xccd7:   0x7f
    DEFB 0x77                         ;0xccd8:   "w"
    DEFB 0x23                         ;0xccd9:   "#"
    DEFB 0x13                         ;0xccda:   0x13
    DEFB 0x1a                         ;0xccdb:   0x1a
    DEFB 0x77                         ;0xccdc:   "w"
    DEFB 0x23                         ;0xccdd:   "#"
    DEFB 0x36                         ;0xccde:   "6"
    DEFB 0x1                          ;0xccdf:   0x1
    DEFB 0x0                          ;0xcce0:   0x0
    DEFB 0x23                         ;0xcce1:   "#"
    DEFB 0x23                         ;0xcce2:   "#"
    DEFB 0x13                         ;0xcce3:   0x13
    DEFB 0x13                         ;0xcce4:   0x13
    DEFB 0x13                         ;0xcce5:   0x13
    DEFB 0xe                          ;0xcce6:   0xe
    DEFB 0x11                         ;0xcce7:   0x11
    DEFB 0xcd                         ;0xcce8:   ('M') + 0x80
    DEFB 0x29                         ;0xcce9:   ")"
    DEFB 0x1d                         ;0xccea:   0x1d
    DEFB 0xe                          ;0xcceb:   0xe
    DEFB 0x1                          ;0xccec:   0x1
    DEFB 0xcd                         ;0xcced:   ('M') + 0x80
    DEFB 0x8b                         ;0xccee:   0x8b
    DEFB 0x22                         ;0xccef:   """
    DEFB 0xc3                         ;0xccf0:   ('C') + 0x80
    DEFB 0x19                         ;0xccf1:   0x19
    DEFB 0x35                         ;0xccf2:   "5"
    DEFB 0xcd                         ;0xccf3:   ('M') + 0x80
    DEFB 0x40                         ;0xccf4:   "@"
    DEFB 0x20                         ;0xccf5:   " "
    DEFB 0x9                          ;0xccf6:   0x9
    DEFB 0xeb                         ;0xccf7:   ('k') + 0x80
    DEFB 0x2a                         ;0xccf8:   "*"
    DEFB 0xdb                         ;0xccf9:   ('[') + 0x80
    DEFB 0xfb                         ;0xccfa:   ('{') + 0x80
    DEFB 0x9                          ;0xccfb:   0x9
    DEFB 0xc9                         ;0xccfc:   ('I') + 0x80
    DEFB 0x1                          ;0xccfd:   0x1
    DEFB 0xe                          ;0xccfe:   0xe
    DEFB 0x1                          ;0xccff:   0x1
;--------------------------------------
D_CD00:                               ; XREF: 0xC619 0xE18C 0xF52F 
    DEFB 0x0                          ;0xcd00:   0x0
    DEFB 0xcd                         ;0xcd01:   ('M') + 0x80
    DEFB 0x67                         ;0xcd02:   "g"
    DEFB 0x35                         ;0xcd03:   "5"
    DEFB 0x7e                         ;0xcd04:   "~"
    DEFB 0xe6                         ;0xcd05:   ('f') + 0x80
    DEFB 0x3f                         ;0xcd06:   "?"
    DEFB 0x47                         ;0xcd07:   "G"
    DEFB 0x1a                         ;0xcd08:   0x1a
    DEFB 0xb8                         ;0xcd09:   ('8') + 0x80
    DEFB 0xc0                         ;0xcd0a:   ('@') + 0x80
;--------------------------------------
C_CD0B:                               ; XREF: 0xF532 
    DEC HL                            ;0xcd0b:   2b  "+" 
    DEC HL                            ;0xcd0c:   2b  "+" 
    LD HL,1                           ;0xcd0d:   21 01 00  "!.."  
    CALL m, 0x6f85                    ;0xcd10:   fc 85 6f  "..o" 
    EX (SP),HL                        ;0xcd13:   e3  "." 
    INC HL                            ;0xcd14:   23  "#" 
    LD A,(HL)                         ;0xcd15:   7e  "~" 
    POP HL                            ;0xcd16:   e1  "." 
    EX (SP),HL                        ;0xcd17:   e3  "." 
    RET                               ;0xcd18:   c9  "." 
    LD A,1                            ;0xcd19:   3e 01  ">."  
    JP C_FC54                         ;0xcd1b:   c3 54 fc  ".T." 
    LD A,L                            ;0xcd1e:   7d  "}" 
    OR H                              ;0xcd1f:   b4  "." 
    RET z                             ;0xcd20:   c8  "." 
    EX DE,HL                          ;0xcd21:   eb  "." 
    LD HL,0x10a                       ;0xcd22:   21 0a 01  "!.."  
    NOP                               ;0xcd25:   00  "." 
    ADD HL,DE                         ;0xcd26:   19  "." 
    LD (HL),1                         ;0xcd27:   36 01  "6."  
    NOP                               ;0xcd29:   00  "." 
    LD HL,(D_FBF9)                    ;0xcd2a:   2a f9 fb  "*.."  
    CALL 0x207f                       ;0xcd2d:   cd 7f 20  ".. " 
    EX DE,HL                          ;0xcd30:   eb  "." 
    RET nc                            ;0xcd31:   d0  "." 
    EX DE,HL                          ;0xcd32:   eb  "." 
    LD HL,(D_FBDB)                    ;0xcd33:   2a db fb  "*.."  
    INC HL                            ;0xcd36:   23  "#" 
    PUSH HL                           ;0xcd37:   e5  "." 
    LD BC,0x119                       ;0xcd38:   01 19 01  "..."  
    NOP                               ;0xcd3b:   00  "." 
    CALL 0xfc4b                       ;0xcd3c:   cd 4b fc  ".K." 
    POP HL                            ;0xcd3f:   e1  "." 
    RET                               ;0xcd40:   c9  "." 
    LD (0x1c9f),HL                    ;0xcd41:   22 9f 1c  "".."  
    LD B,A                            ;0xcd44:   47  "G" 
    LD HL,(D_FBDB)                    ;0xcd45:   2a db fb  "*.."  
    LD A,(HL)                         ;0xcd48:   7e  "~" 
    CP 9                              ;0xcd49:   fe 09  ".." 
    RET z                             ;0xcd4b:   c8  "." 
    CP 0x10                           ;0xcd4c:   fe 10  ".." 
    RET z                             ;0xcd4e:   c8  "." 
    CP 0x14                           ;0xcd4f:   fe 14  ".." 
    RET z                             ;0xcd51:   c8  "." 
    CP 0x16                           ;0xcd52:   fe 16  ".." 
    RET z                             ;0xcd54:   c8  "." 
    LD A,B                            ;0xcd55:   78  "x" 
    JP 0x1972                         ;0xcd56:   c3 72 19  ".r." 
    CALL 0x2d90                       ;0xcd59:   cd 90 2d  "..-" 
    CALL 0x262d                       ;0xcd5c:   cd 2d 26  ".-&" 
    CALL 0x2e78                       ;0xcd5f:   cd 78 2e  ".x." 
    CALL nz, 0x2e85                   ;0xcd62:   c4 85 2e  "..." 
    LD C,0xff                         ;0xcd65:   0e ff  ".."  
    CALL 0x2be4                       ;0xcd67:   cd e4 2b  "..+" 
    JP nz, 0x24c0                     ;0xcd6a:   c2 c0 24  "..$" 
    CALL 0x2040                       ;0xcd6d:   cd 40 20  ".@ " 
    LD DE,0x10f                       ;0xcd70:   11 0f 01  "..."  
    NOP                               ;0xcd73:   00  "." 
    CALL 0x2ccb                       ;0xcd74:   cd cb 2c  "..," 
    CALL 0x1f37                       ;0xcd77:   cd 37 1f  ".7." 
    CALL 0x2cfe                       ;0xcd7a:   cd fe 2c  "..," 
    JP c, 0x24c0                      ;0xcd7d:   da c0 24  "..$" 
;--------------------------------------
C_CD80:                               ; XREF: 0xCD90 
    OR D                              ;0xcd80:   b2  "." 
    JP z, 0x24c0                      ;0xcd81:   ca c0 24  "..$" 
    CALL 0x2028                       ;0xcd84:   cd 28 20  ".( " 
    CALL 0x219a                       ;0xcd87:   cd 9a 21  "..!" 
    CALL 0x3053                       ;0xcd8a:   cd 53 30  ".S0" 
    CALL 0x23f5                       ;0xcd8d:   cd f5 23  "..#" 
    JP z, C_CD80                      ;0xcd90:   ca 80 cd  "..." 
    LD (HL),A                         ;0xcd93:   77  "w" 
    LD (0x3ac3),HL                    ;0xcd94:   22 c3 3a  "".:"  
    INC A                             ;0xcd97:   3c  "<" 
    CALL 0x3420                       ;0xcd98:   cd 20 34  ". 4" 
    LD A,(0x379e)                     ;0xcd9b:   3a 9e 37  ":.7"  
    INC A                             ;0xcd9e:   3c  "<" 
    JP nz, 0x3413                     ;0xcd9f:   c2 13 34  "..4" 
    CALL 0x2152                       ;0xcda2:   cd 52 21  ".R!" 
    POP HL                            ;0xcda5:   e1  "." 
    POP AF                            ;0xcda6:   f1  "." 
    OR A                              ;0xcda7:   b7  "." 
    JP nz, 0x33ed                     ;0xcda8:   c2 ed 33  "..3" 
;--------------------------------------
D_CDAB:                               ; XREF: 0xD73A 
    DEFB 0xc9                         ;0xcdab:   ('I') + 0x80
    DEFB 0xcd                         ;0xcdac:   ('M') + 0x80
    DEFB 0x48                         ;0xcdad:   "H"
    DEFB 0xfc                         ;0xcdae:   ('|') + 0x80
    DEFB 0xcd                         ;0xcdaf:   ('M') + 0x80
    DEFB 0xa5                         ;0xcdb0:   ('%') + 0x80
    DEFB 0x1d                         ;0xcdb1:   0x1d
    DEFB 0x3a                         ;0xcdb2:   ":"
    DEFB 0x90                         ;0xcdb3:   0x90
    DEFB 0x37                         ;0xcdb4:   "7"
    DEFB 0xb7                         ;0xcdb5:   ('7') + 0x80
    DEFB 0xc8                         ;0xcdb6:   ('H') + 0x80
    DEFB 0x3e                         ;0xcdb7:   ">"
    DEFB 0x4                          ;0xcdb8:   0x4
    DEFB 0xc3                         ;0xcdb9:   ('C') + 0x80
    DEFB 0xff                         ;0xcdba:   0xff
    DEFB 0x37                         ;0xcdbb:   "7"
    DEFB 0xeb                         ;0xcdbc:   ('k') + 0x80
    DEFB 0x7e                         ;0xcdbd:   "~"
    DEFB 0xfe                         ;0xcdbe:   ('~') + 0x80
    DEFB 0x63                         ;0xcdbf:   "c"
    DEFB 0xd0                         ;0xcdc0:   ('P') + 0x80
    DEFB 0xeb                         ;0xcdc1:   ('k') + 0x80
    DEFB 0x21                         ;0xcdc2:   "!"
    DEFB 0x9c                         ;0xcdc3:   0x9c
    DEFB 0xfb                         ;0xcdc4:   ('{') + 0x80
    DEFB 0x85                         ;0xcdc5:   0x85
    DEFB 0x6f                         ;0xcdc6:   "o"
    DEFB 0xeb                         ;0xcdc7:   ('k') + 0x80
    DEFB 0x23                         ;0xcdc8:   "#"
    DEFB 0x7e                         ;0xcdc9:   "~"
    DEFB 0xfe                         ;0xcdca:   ('~') + 0x80
    DEFB 0xfe                         ;0xcdcb:   ('~') + 0x80
    DEFB 0xd2                         ;0xcdcc:   ('R') + 0x80
    DEFB 0x45                         ;0xcdcd:   "E"
    DEFB 0x34                         ;0xcdce:   "4"
    DEFB 0xeb                         ;0xcdcf:   ('k') + 0x80
    DEFB 0x5e                         ;0xcdd0:   "^"
    DEFB 0x23                         ;0xcdd1:   "#"
    DEFB 0x56                         ;0xcdd2:   "V"
    DEFB 0xeb                         ;0xcdd3:   ('k') + 0x80
    DEFB 0xc3                         ;0xcdd4:   ('C') + 0x80
    DEFB 0x29                         ;0xcdd5:   ")"
    DEFB 0x33                         ;0xcdd6:   "3"
    DEFB 0x47                         ;0xcdd7:   "G"
    DEFB 0x23                         ;0xcdd8:   "#"
    DEFB 0x7e                         ;0xcdd9:   "~"
    DEFB 0x12                         ;0xcdda:   0x12
    DEFB 0x4                          ;0xcddb:   0x4
    DEFB 0xc8                         ;0xcddc:   ('H') + 0x80
    DEFB 0x23                         ;0xcddd:   "#"
    DEFB 0x13                         ;0xcdde:   0x13
    DEFB 0x7e                         ;0xcddf:   "~"
    DEFB 0x12                         ;0xcde0:   0x12
    DEFB 0xc9                         ;0xcde1:   ('I') + 0x80
    DEFB 0x21                         ;0xcde2:   "!"
    DEFB 0xb0                         ;0xcde3:   ('0') + 0x80
    DEFB 0x34                         ;0xcde4:   "4"
;--------------------------------------
D_CDE5:                               ; XREF: 0xEE09 
    DEFB 0xe5                         ;0xcde5:   ('e') + 0x80
    DEFB 0xeb                         ;0xcde6:   ('k') + 0x80
    DEFB 0x7e                         ;0xcde7:   "~"
    DEFB 0xfe                         ;0xcde8:   ('~') + 0x80
    DEFB 0x1b                         ;0xcde9:   0x1b
    DEFB 0xc8                         ;0xcdea:   ('H') + 0x80
    DEFB 0xfe                         ;0xcdeb:   ('~') + 0x80
    DEFB 0xc                          ;0xcdec:   0xc
    DEFB 0xc2                         ;0xcded:   ('B') + 0x80
    DEFB 0x62                         ;0xcdee:   "b"
    DEFB 0x34                         ;0xcdef:   "4"
    DEFB 0x11                         ;0xcdf0:   0x11
    DEFB 0x8b                         ;0xcdf1:   0x8b
    DEFB 0x34                         ;0xcdf2:   "4"
    DEFB 0xd5                         ;0xcdf3:   ('U') + 0x80
    DEFB 0xfe                         ;0xcdf4:   ('~') + 0x80
    DEFB 0x9                          ;0xcdf5:   0x9
    DEFB 0xc2                         ;0xcdf6:   ('B') + 0x80
    DEFB 0x6b                         ;0xcdf7:   "k"
    DEFB 0x34                         ;0xcdf8:   "4"
    DEFB 0x11                         ;0xcdf9:   0x11
    DEFB 0x90                         ;0xcdfa:   0x90
    DEFB 0x34                         ;0xcdfb:   "4"
    DEFB 0xd5                         ;0xcdfc:   ('U') + 0x80
    DEFB 0xe5                         ;0xcdfd:   ('e') + 0x80
    DEFB 0x23                         ;0xcdfe:   "#"
    DEFB 0x23                         ;0xcdff:   "#"
    DEFB 0x4e                         ;0xce00:   "N"
    DEFB 0x23                         ;0xce01:   "#"
    DEFB 0x46                         ;0xce02:   "F"
    DEFB 0x23                         ;0xce03:   "#"
    DEFB 0x5e                         ;0xce04:   "^"
    DEFB 0x23                         ;0xce05:   "#"
    DEFB 0x56                         ;0xce06:   "V"
    DEFB 0x23                         ;0xce07:   "#"
    DEFB 0x7e                         ;0xce08:   "~"
    DEFB 0x23                         ;0xce09:   "#"
    DEFB 0x66                         ;0xce0a:   "f"
    DEFB 0x6f                         ;0xce0b:   "o"
    DEFB 0xe3                         ;0xce0c:   ('c') + 0x80
    DEFB 0x7e                         ;0xce0d:   "~"
    DEFB 0xe5                         ;0xce0e:   ('e') + 0x80
    DEFB 0x6f                         ;0xce0f:   "o"
    DEFB 0x87                         ;0xce10:   0x87
    DEFB 0x85                         ;0xce11:   0x85
    DEFB 0xc0                         ;0xce12:   ('@') + 0x80
    DEFB 0x24                         ;0xce13:   "$"
    DEFB 0xfe                         ;0xce14:   ('~') + 0x80
    DEFB 0x81                         ;0xce15:   0x81
    DEFB 0xd2                         ;0xce16:   ('R') + 0x80
    DEFB 0xc0                         ;0xce17:   ('@') + 0x80
    DEFB 0x24                         ;0xce18:   "$"
    DEFB 0x32                         ;0xce19:   "2"
    DEFB 0xe6                         ;0xce1a:   ('f') + 0x80
    DEFB 0xfb                         ;0xce1b:   ('{') + 0x80
    DEFB 0xc9                         ;0xce1c:   ('I') + 0x80
    DEFB 0x7b                         ;0xce1d:   "{"
    DEFB 0x32                         ;0xce1e:   "2"
    DEFB 0xe7                         ;0xce1f:   ('g') + 0x80
    DEFB 0xfb                         ;0xce20:   ('{') + 0x80
    DEFB 0xc9                         ;0xce21:   ('I') + 0x80
;--------------------------------------
D_CE22:                               ; XREF: 0xF8C3 
    DEFB 0xcd                         ;0xce22:   ('M') + 0x80
    DEFB 0x67                         ;0xce23:   "g"
    DEFB 0x2d                         ;0xce24:   "-"
    DEFB 0x2a                         ;0xce25:   "*"
    DEFB 0x77                         ;0xce26:   "w"
    DEFB 0x37                         ;0xce27:   "7"
    DEFB 0xeb                         ;0xce28:   ('k') + 0x80
    DEFB 0xcd                         ;0xce29:   ('M') + 0x80
    DEFB 0xde                         ;0xce2a:   ('^') + 0x80
    DEFB 0x22                         ;0xce2b:   """
    DEFB 0x1                          ;0xce2c:   0x1
    DEFB 0x2                          ;0xce2d:   0x2
    DEFB 0x0                          ;0xce2e:   0x0
    DEFB 0x1a                         ;0xce2f:   0x1a
    DEFB 0xb7                         ;0xce30:   ('7') + 0x80
    DEFB 0xca                         ;0xce31:   ('J') + 0x80
    DEFB 0xaa                         ;0xce32:   ('*') + 0x80
    DEFB 0x33                         ;0xce33:   "3"
    DEFB 0x1f                         ;0xce34:   0x1f
    DEFB 0xd2                         ;0xce35:   ('R') + 0x80
    DEFB 0xa2                         ;0xce36:   ('"') + 0x80
    DEFB 0x33                         ;0xce37:   "3"
    DEFB 0x3                          ;0xce38:   0x3
    DEFB 0xc3                         ;0xce39:   ('C') + 0x80
    DEFB 0x9e                         ;0xce3a:   0x9e
    DEFB 0x33                         ;0xce3b:   "3"
    DEFB 0x13                         ;0xce3c:   0x13
    DEFB 0x2b                         ;0xce3d:   "+"
    DEFB 0x7d                         ;0xce3e:   "}"
    DEFB 0xb4                         ;0xce3f:   ('4') + 0x80
    DEFB 0xc2                         ;0xce40:   ('B') + 0x80
    DEFB 0x9d                         ;0xce41:   0x9d
    DEFB 0x33                         ;0xce42:   "3"
    DEFB 0x2a                         ;0xce43:   "*"
    DEFB 0x85                         ;0xce44:   0x85
    DEFB 0x37                         ;0xce45:   "7"
    DEFB 0x23                         ;0xce46:   "#"
    DEFB 0x7d                         ;0xce47:   "}"
    DEFB 0x91                         ;0xce48:   0x91
    DEFB 0x6f                         ;0xce49:   "o"
    DEFB 0x7c                         ;0xce4a:   "|"
    DEFB 0x98                         ;0xce4b:   0x98
    DEFB 0x67                         ;0xce4c:   "g"
    DEFB 0x3a                         ;0xce4d:   ":"
    DEFB 0x82                         ;0xce4e:   0x82
    DEFB 0x37                         ;0xce4f:   "7"
    DEFB 0x4f                         ;0xce50:   "O"
    DEFB 0xaf                         ;0xce51:   ('/') + 0x80
    DEFB 0xcd                         ;0xce52:   ('M') + 0x80
    DEFB 0xf6                         ;0xce53:   ('v') + 0x80
    DEFB 0x1c                         ;0xce54:   0x1c
    DEFB 0xeb                         ;0xce55:   ('k') + 0x80
    DEFB 0x2a                         ;0xce56:   "*"
    DEFB 0x19                         ;0xce57:   0x19
    DEFB 0xf6                         ;0xce58:   ('v') + 0x80
    DEFB 0x73                         ;0xce59:   "s"
    DEFB 0x23                         ;0xce5a:   "#"
    DEFB 0x72                         ;0xce5b:   "r"
    DEFB 0x23                         ;0xce5c:   "#"
    DEFB 0x77                         ;0xce5d:   "w"
    DEFB 0xc9                         ;0xce5e:   ('I') + 0x80
    DEFB 0x21                         ;0xce5f:   "!"
    DEFB 0xb3                         ;0xce60:   ('3') + 0x80
    DEFB 0xfb                         ;0xce61:   ('{') + 0x80
    DEFB 0x7e                         ;0xce62:   "~"
    DEFB 0xf6                         ;0xce63:   ('v') + 0x80
    DEFB 0x80                         ;0xce64:   0x80
    DEFB 0x77                         ;0xce65:   "w"
    DEFB 0x1c                         ;0xce66:   0x1c
    DEFB 0xc2                         ;0xce67:   ('B') + 0x80
    DEFB 0x2f                         ;0xce68:   "/"
    DEFB 0x12                         ;0xce69:   0x12
    DEFB 0x7e                         ;0xce6a:   "~"
    DEFB 0xf6                         ;0xce6b:   ('v') + 0x80
    DEFB 0x40                         ;0xce6c:   "@"
    DEFB 0x77                         ;0xce6d:   "w"
    DEFB 0xc3                         ;0xce6e:   ('C') + 0x80
    DEFB 0x2f                         ;0xce6f:   "/"
    DEFB 0x12                         ;0xce70:   0x12
    DEFB 0xcd                         ;0xce71:   ('M') + 0x80
    DEFB 0x2f                         ;0xce72:   "/"
    DEFB 0x2e                         ;0xce73:   "."
    DEFB 0xcd                         ;0xce74:   ('M') + 0x80
    DEFB 0x48                         ;0xce75:   "H"
    DEFB 0xfc                         ;0xce76:   ('|') + 0x80
    DEFB 0xcd                         ;0xce77:   ('M') + 0x80
    DEFB 0xa5                         ;0xce78:   ('%') + 0x80
    DEFB 0x1d                         ;0xce79:   0x1d
    DEFB 0x2a                         ;0xce7a:   "*"
    DEFB 0x65                         ;0xce7b:   "e"
    DEFB 0x37                         ;0xce7c:   "7"
    DEFB 0x3e                         ;0xce7d:   ">"
    DEFB 0x10                         ;0xce7e:   0x10
    DEFB 0x3d                         ;0xce7f:   "="
    DEFB 0x29                         ;0xce80:   ")"
    DEFB 0xd2                         ;0xce81:   ('R') + 0x80
    DEFB 0x15                         ;0xce82:   0x15
    DEFB 0x34                         ;0xce83:   "4"
    DEFB 0xf5                         ;0xce84:   ('u') + 0x80
    DEFB 0xe5                         ;0xce85:   ('e') + 0x80
    DEFB 0x5f                         ;0xce86:   "_"
    DEFB 0xcd                         ;0xce87:   ('M') + 0x80
    DEFB 0x67                         ;0xce88:   "g"
    DEFB 0x2d                         ;0xce89:   "-"
    DEFB 0x3a                         ;0xce8a:   ":"
    DEFB 0xdf                         ;0xce8b:   ('_') + 0x80
    DEFB 0xfb                         ;0xce8c:   ('{') + 0x80
    DEFB 0xfe                         ;0xce8d:   ('~') + 0x80
    DEFB 0x30                         ;0xce8e:   "0"
    DEFB 0xca                         ;0xce8f:   ('J') + 0x80
    DEFB 0x6                          ;0xce90:   0x6
    DEFB 0x34                         ;0xce91:   "4"
    DEFB 0x19                         ;0xce92:   0x19
    DEFB 0xeb                         ;0xce93:   ('k') + 0x80
    DEFB 0x22                         ;0xce94:   """
    DEFB 0xd8                         ;0xce95:   ('X') + 0x80
    DEFB 0xfb                         ;0xce96:   ('{') + 0x80
    DEFB 0xc3                         ;0xce97:   ('C') + 0x80
    DEFB 0xb6                         ;0xce98:   ('6') + 0x80
    DEFB 0x21                         ;0xce99:   "!"
    DEFB 0xcd                         ;0xce9a:   ('M') + 0x80
    DEFB 0x6b                         ;0xce9b:   "k"
    DEFB 0x2d                         ;0xce9c:   "-"
    DEFB 0x2a                         ;0xce9d:   "*"
    DEFB 0x77                         ;0xce9e:   "w"
    DEFB 0x37                         ;0xce9f:   "7"
    DEFB 0xc3                         ;0xcea0:   ('C') + 0x80
    DEFB 0x29                         ;0xcea1:   ")"
    DEFB 0x33                         ;0xcea2:   "3"
    DEFB 0x2a                         ;0xcea3:   "*"
    DEFB 0x63                         ;0xcea4:   "c"
    DEFB 0x37                         ;0xcea5:   "7"
    DEFB 0xc3                         ;0xcea6:   ('C') + 0x80
    DEFB 0x29                         ;0xcea7:   ")"
    DEFB 0x33                         ;0xcea8:   "3"
    DEFB 0xcd                         ;0xcea9:   ('M') + 0x80
    DEFB 0x2d                         ;0xceaa:   "-"
    DEFB 0x26                         ;0xceab:   "&"
    DEFB 0xcd                         ;0xceac:   ('M') + 0x80
    DEFB 0x7d                         ;0xcead:   "}"
    DEFB 0x3c                         ;0xceae:   "<"
    DEFB 0xcd                         ;0xceaf:   ('M') + 0x80
    DEFB 0xa4                         ;0xceb0:   ('$') + 0x80
    DEFB 0x26                         ;0xceb1:   "&"
    DEFB 0xc3                         ;0xceb2:   ('C') + 0x80
    DEFB 0x80                         ;0xceb3:   0x80
    DEFB 0x23                         ;0xceb4:   "#"
    DEFB 0xcd                         ;0xceb5:   ('M') + 0x80
    DEFB 0x6b                         ;0xceb6:   "k"
    DEFB 0x2d                         ;0xceb7:   "-"
    DEFB 0x2a                         ;0xceb8:   "*"
    DEFB 0x73                         ;0xceb9:   "s"
    DEFB 0x37                         ;0xceba:   "7"
    DEFB 0x22                         ;0xcebb:   """
    DEFB 0x9f                         ;0xcebc:   0x9f
    DEFB 0x1c                         ;0xcebd:   0x1c
    DEFB 0xc9                         ;0xcebe:   ('I') + 0x80
    DEFB 0x3a                         ;0xcebf:   ":"
    DEFB 0x9e                         ;0xcec0:   0x9e
    DEFB 0x37                         ;0xcec1:   "7"
    DEFB 0xfe                         ;0xcec2:   ('~') + 0x80
    DEFB 0xff                         ;0xcec3:   0xff
    DEFB 0xc2                         ;0xcec4:   ('B') + 0x80
    DEFB 0x3b                         ;0xcec5:   ";"
    DEFB 0x33                         ;0xcec6:   "3"
    DEFB 0x3a                         ;0xcec7:   ":"
    DEFB 0xe0                         ;0xcec8:   ('`') + 0x80
    DEFB 0xfb                         ;0xcec9:   ('{') + 0x80
    DEFB 0xc3                         ;0xceca:   ('C') + 0x80
    DEFB 0x72                         ;0xcecb:   "r"
    DEFB 0x19                         ;0xcecc:   0x19
    DEFB 0xe6                         ;0xcecd:   ('f') + 0x80
    DEFB 0xf                          ;0xcece:   0xf
    DEFB 0x32                         ;0xcecf:   "2"
    DEFB 0xe0                         ;0xced0:   ('`') + 0x80
    DEFB 0xfb                         ;0xced1:   ('{') + 0x80
    DEFB 0xc9                         ;0xced2:   ('I') + 0x80
    DEFB 0xcd                         ;0xced3:   ('M') + 0x80
    DEFB 0x9a                         ;0xced4:   0x9a
    DEFB 0x2d                         ;0xced5:   "-"
    DEFB 0xcd                         ;0xced6:   ('M') + 0x80
    DEFB 0xce                         ;0xced7:   ('N') + 0x80
    DEFB 0x1f                         ;0xced8:   0x1f
    DEFB 0xc3                         ;0xced9:   ('C') + 0x80
    DEFB 0xb9                         ;0xceda:   ('9') + 0x80
    DEFB 0x2c                         ;0xcedb:   ","
    DEFB 0xcd                         ;0xcedc:   ('M') + 0x80
    DEFB 0x9a                         ;0xcedd:   0x9a
    DEFB 0x2d                         ;0xcede:   "-"
    DEFB 0xcd                         ;0xcedf:   ('M') + 0x80
    DEFB 0xce                         ;0xcee0:   ('N') + 0x80
    DEFB 0x1f                         ;0xcee1:   0x1f
    DEFB 0xc3                         ;0xcee2:   ('C') + 0x80
    DEFB 0xc2                         ;0xcee3:   ('B') + 0x80
    DEFB 0x2c                         ;0xcee4:   ","
    DEFB 0xcd                         ;0xcee5:   ('M') + 0x80
    DEFB 0x9a                         ;0xcee6:   0x9a
    DEFB 0x2d                         ;0xcee7:   "-"
    DEFB 0xc3                         ;0xcee8:   ('C') + 0x80
    DEFB 0x13                         ;0xcee9:   0x13
    DEFB 0x2d                         ;0xceea:   "-"
    DEFB 0xeb                         ;0xceeb:   ('k') + 0x80
    DEFB 0x7d                         ;0xceec:   "}"
    DEFB 0x2f                         ;0xceed:   "/"
    DEFB 0x5f                         ;0xceee:   "_"
    DEFB 0x7c                         ;0xceef:   "|"
    DEFB 0x2f                         ;0xcef0:   "/"
    DEFB 0x2a                         ;0xcef1:   "*"
    DEFB 0x65                         ;0xcef2:   "e"
    DEFB 0x37                         ;0xcef3:   "7"
    DEFB 0xa4                         ;0xcef4:   ('$') + 0x80
    DEFB 0x57                         ;0xcef5:   "W"
    DEFB 0x7d                         ;0xcef6:   "}"
    DEFB 0xa3                         ;0xcef7:   ('#') + 0x80
    DEFB 0x5f                         ;0xcef8:   "_"
    DEFB 0x2a                         ;0xcef9:   "*"
    DEFB 0x63                         ;0xcefa:   "c"
    DEFB 0x37                         ;0xcefb:   "7"
    DEFB 0xeb                         ;0xcefc:   ('k') + 0x80
    DEFB 0x22                         ;0xcefd:   """
    DEFB 0x65                         ;0xcefe:   "e"
    DEFB 0x37                         ;0xceff:   "7"
    DEFB 0x7d                         ;0xcf00:   "}"
    DEFB 0xa3                         ;0xcf01:   ('#') + 0x80
    DEFB 0x6f                         ;0xcf02:   "o"
    DEFB 0x7c                         ;0xcf03:   "|"
    DEFB 0xa2                         ;0xcf04:   ('"') + 0x80
    DEFB 0x67                         ;0xcf05:   "g"
    DEFB 0x22                         ;0xcf06:   """
    DEFB 0x63                         ;0xcf07:   "c"
    DEFB 0x37                         ;0xcf08:   "7"
    DEFB 0x3e                         ;0xcf09:   ">"
    DEFB 0xff                         ;0xcf0a:   0xff
    DEFB 0x32                         ;0xcf0b:   "2"
    DEFB 0xa9                         ;0xcf0c:   (')') + 0x80
    DEFB 0x37                         ;0xcf0d:   "7"
    DEFB 0xc9                         ;0xcf0e:   ('I') + 0x80
    DEFB 0x7b                         ;0xcf0f:   "{"
    DEFB 0xb7                         ;0xcf10:   ('7') + 0x80
    DEFB 0xca                         ;0xcf11:   ('J') + 0x80
    DEFB 0xc2                         ;0xcf12:   ('B') + 0x80
    DEFB 0x97                         ;0xcf13:   0x97
    DEFB 0x32                         ;0xcf14:   "2"
    DEFB 0x3e                         ;0xcf15:   ">"
    DEFB 0xff                         ;0xcf16:   0xff
    DEFB 0x32                         ;0xcf17:   "2"
    DEFB 0x15                         ;0xcf18:   0x15
    DEFB 0xf6                         ;0xcf19:   ('v') + 0x80
    DEFB 0xcd                         ;0xcf1a:   ('M') + 0x80
    DEFB 0x16                         ;0xcf1b:   0x16
    DEFB 0x28                         ;0xcf1c:   "("
    DEFB 0xc2                         ;0xcf1d:   ('B') + 0x80
    DEFB 0x97                         ;0xcf1e:   0x97
    DEFB 0x32                         ;0xcf1f:   "2"
    DEFB 0xcd                         ;0xcf20:   ('M') + 0x80
    DEFB 0xf0                         ;0xcf21:   ('p') + 0x80
    DEFB 0x23                         ;0xcf22:   "#"
    DEFB 0xcd                         ;0xcf23:   ('M') + 0x80
    DEFB 0x87                         ;0xcf24:   0x87
    DEFB 0x25                         ;0xcf25:   "%"
    DEFB 0xc3                         ;0xcf26:   ('C') + 0x80
    DEFB 0xc0                         ;0xcf27:   ('@') + 0x80
    DEFB 0x24                         ;0xcf28:   "$"
    DEFB 0xcd                         ;0xcf29:   ('M') + 0x80
    DEFB 0xb1                         ;0xcf2a:   ('1') + 0x80
    DEFB 0x2f                         ;0xcf2b:   "/"
    DEFB 0xeb                         ;0xcf2c:   ('k') + 0x80
    DEFB 0x2a                         ;0xcf2d:   "*"
    DEFB 0x19                         ;0xcf2e:   0x19
    DEFB 0xf6                         ;0xcf2f:   ('v') + 0x80
    DEFB 0x1                          ;0xcf30:   0x1
    DEFB 0x8                          ;0xcf31:   0x8
    DEFB 0x1                          ;0xcf32:   0x1
    DEFB 0x0                          ;0xcf33:   0x0
    DEFB 0x9                          ;0xcf34:   0x9
    DEFB 0xeb                         ;0xcf35:   ('k') + 0x80
    DEFB 0x1a                         ;0xcf36:   0x1a
    DEFB 0xe6                         ;0xcf37:   ('f') + 0x80
    DEFB 0xe0                         ;0xcf38:   ('`') + 0x80
    DEFB 0xc2                         ;0xcf39:   ('B') + 0x80
    DEFB 0xab                         ;0xcf3a:   ('+') + 0x80
    DEFB 0x32                         ;0xcf3b:   "2"
    DEFB 0x3e                         ;0xcf3c:   ">"
    DEFB 0x80                         ;0xcf3d:   0x80
    DEFB 0x32                         ;0xcf3e:   "2"
    DEFB 0xe4                         ;0xcf3f:   ('d') + 0x80
    DEFB 0x37                         ;0xcf40:   "7"
    DEFB 0xf5                         ;0xcf41:   ('u') + 0x80
    DEFB 0xcd                         ;0xcf42:   ('M') + 0x80
    DEFB 0x99                         ;0xcf43:   0x99
    DEFB 0x2f                         ;0xcf44:   "/"
    DEFB 0xf1                         ;0xcf45:   ('q') + 0x80
    DEFB 0x77                         ;0xcf46:   "w"
    DEFB 0xcd                         ;0xcf47:   ('M') + 0x80
    DEFB 0x42                         ;0xcf48:   "B"
    DEFB 0x2f                         ;0xcf49:   "/"
    DEFB 0x70                         ;0xcf4a:   "p"
    DEFB 0xcd                         ;0xcf4b:   ('M') + 0x80
    DEFB 0x19                         ;0xcf4c:   0x19
    DEFB 0x36                         ;0xcf4d:   "6"
    DEFB 0xcd                         ;0xcf4e:   ('M') + 0x80
    DEFB 0x2b                         ;0xcf4f:   "+"
    DEFB 0x25                         ;0xcf50:   "%"
    DEFB 0xc8                         ;0xcf51:   ('H') + 0x80
    DEFB 0xe                          ;0xcf52:   0xe
    DEFB 0x8                          ;0xcf53:   0x8
    DEFB 0xcd                         ;0xcf54:   ('M') + 0x80
    DEFB 0x12                         ;0xcf55:   0x12
    DEFB 0x30                         ;0xcf56:   "0"
    DEFB 0xb7                         ;0xcf57:   ('7') + 0x80
    DEFB 0xc2                         ;0xcf58:   ('B') + 0x80
    DEFB 0xd2                         ;0xcf59:   ('R') + 0x80
    DEFB 0x32                         ;0xcf5a:   "2"
    DEFB 0x3a                         ;0xcf5b:   ":"
    DEFB 0xe4                         ;0xcf5c:   ('d') + 0x80
    DEFB 0x37                         ;0xcf5d:   "7"
    DEFB 0x77                         ;0xcf5e:   "w"
    DEFB 0xcd                         ;0xcf5f:   ('M') + 0x80
    DEFB 0x9a                         ;0xcf60:   0x9a
    DEFB 0x21                         ;0xcf61:   "!"
    DEFB 0xcd                         ;0xcf62:   ('M') + 0x80
    DEFB 0x41                         ;0xcf63:   "A"
    DEFB 0x21                         ;0xcf64:   "!"
    DEFB 0xe                          ;0xcf65:   0xe
    DEFB 0x50                         ;0xcf66:   "P"
    DEFB 0xcd                         ;0xcf67:   ('M') + 0x80
    DEFB 0x7b                         ;0xcf68:   "{"
    DEFB 0x31                         ;0xcf69:   "1"
    DEFB 0xe                          ;0xcf6a:   0xe
    DEFB 0x20                         ;0xcf6b:   " "
    DEFB 0xcd                         ;0xcf6c:   ('M') + 0x80
    DEFB 0x32                         ;0xcf6d:   "2"
    DEFB 0x30                         ;0xcf6e:   "0"
    DEFB 0xc0                         ;0xcf6f:   ('@') + 0x80
    DEFB 0xcd                         ;0xcf70:   ('M') + 0x80
    DEFB 0xe2                         ;0xcf71:   ('b') + 0x80
    DEFB 0x2f                         ;0xcf72:   "/"
    DEFB 0xc3                         ;0xcf73:   ('C') + 0x80
    DEFB 0x57                         ;0xcf74:   "W"
    DEFB 0x2a                         ;0xcf75:   "*"
    DEFB 0x3e                         ;0xcf76:   ">"
    DEFB 0x8                          ;0xcf77:   0x8
    DEFB 0x4f                         ;0xcf78:   "O"
    DEFB 0x32                         ;0xcf79:   "2"
    DEFB 0xa0                         ;0xcf7a:   (' ') + 0x80
    DEFB 0x1c                         ;0xcf7b:   0x1c
    DEFB 0xcd                         ;0xcf7c:   ('M') + 0x80
    DEFB 0xc0                         ;0xcf7d:   ('@') + 0x80
    DEFB 0x24                         ;0xcf7e:   "$"
    DEFB 0xc3                         ;0xcf7f:   ('C') + 0x80
    DEFB 0xb8                         ;0xcf80:   ('8') + 0x80
    DEFB 0x1c                         ;0xcf81:   0x1c
    DEFB 0xcd                         ;0xcf82:   ('M') + 0x80
    DEFB 0x7d                         ;0xcf83:   "}"
    DEFB 0x3c                         ;0xcf84:   "<"
    DEFB 0xc3                         ;0xcf85:   ('C') + 0x80
    DEFB 0x52                         ;0xcf86:   "R"
    DEFB 0x26                         ;0xcf87:   "&"
    DEFB 0x2a                         ;0xcf88:   "*"
    DEFB 0x65                         ;0xcf89:   "e"
    DEFB 0x37                         ;0xcf8a:   "7"
    DEFB 0xc3                         ;0xcf8b:   ('C') + 0x80
    DEFB 0x29                         ;0xcf8c:   ")"
    DEFB 0x33                         ;0xcf8d:   "3"
    DEFB 0x3a                         ;0xcf8e:   ":"
    DEFB 0xa4                         ;0xcf8f:   ('$') + 0x80
    DEFB 0x37                         ;0xcf90:   "7"
    DEFB 0xc3                         ;0xcf91:   ('C') + 0x80
    DEFB 0x72                         ;0xcf92:   "r"
    DEFB 0x1f                         ;0xcf93:   0x1f
    DEFB 0xc3                         ;0xcf94:   ('C') + 0x80
    DEFB 0xf5                         ;0xcf95:   ('u') + 0x80
    DEFB 0x28                         ;0xcf96:   "("
    DEFB 0xcd                         ;0xcf97:   ('M') + 0x80
    DEFB 0x9a                         ;0xcf98:   0x9a
    DEFB 0x2d                         ;0xcf99:   "-"
    DEFB 0xcd                         ;0xcf9a:   ('M') + 0x80
    DEFB 0xce                         ;0xcf9b:   ('N') + 0x80
    DEFB 0x1f                         ;0xcf9c:   0x1f
    DEFB 0xc3                         ;0xcf9d:   ('C') + 0x80
    DEFB 0x63                         ;0xcf9e:   "c"
    DEFB 0x2a                         ;0xcf9f:   "*"
    DEFB 0xcd                         ;0xcfa0:   ('M') + 0x80
    DEFB 0x18                         ;0xcfa1:   0x18
    DEFB 0x1f                         ;0xcfa2:   0x1f
    DEFB 0x32                         ;0xcfa3:   "2"
    DEFB 0xb3                         ;0xcfa4:   ('3') + 0x80
    DEFB 0x37                         ;0xcfa5:   "7"
    DEFB 0xcd                         ;0xcfa6:   ('M') + 0x80
    DEFB 0x5a                         ;0xcfa7:   "Z"
    DEFB 0x20                         ;0xcfa8:   " "
    DEFB 0xcd                         ;0xcfa9:   ('M') + 0x80
    DEFB 0x54                         ;0xcfaa:   "T"
    DEFB 0x20                         ;0xcfab:   " "
    DEFB 0xcd                         ;0xcfac:   ('M') + 0x80
    DEFB 0x90                         ;0xcfad:   0x90
    DEFB 0x2d                         ;0xcfae:   "-"
    DEFB 0xcd                         ;0xcfaf:   ('M') + 0x80
    DEFB 0x2d                         ;0xcfb0:   "-"
    DEFB 0x26                         ;0xcfb1:   "&"
    DEFB 0xcd                         ;0xcfb2:   ('M') + 0x80
    DEFB 0x3                          ;0xcfb3:   0x3
    DEFB 0x28                         ;0xcfb4:   "("
    DEFB 0xcd                         ;0xcfb5:   ('M') + 0x80
    DEFB 0xda                         ;0xcfb6:   ('Z') + 0x80
    DEFB 0x26                         ;0xcfb7:   "&"
    DEFB 0xcd                         ;0xcfb8:   ('M') + 0x80
    DEFB 0xf8                         ;0xcfb9:   ('x') + 0x80
    DEFB 0x21                         ;0xcfba:   "!"
    DEFB 0xb7                         ;0xcfbb:   ('7') + 0x80
    DEFB 0xca                         ;0xcfbc:   ('J') + 0x80
    DEFB 0x33                         ;0xcfbd:   "3"
    DEFB 0x32                         ;0xcfbe:   "2"
    DEFB 0xcd                         ;0xcfbf:   ('M') + 0x80
    DEFB 0x97                         ;0xcfc0:   0x97
    DEFB 0x23                         ;0xcfc1:   "#"
    DEFB 0xbe                         ;0xcfc2:   ('>') + 0x80
    DEFB 0xd2                         ;0xcfc3:   ('R') + 0x80
    DEFB 0xe3                         ;0xcfc4:   ('c') + 0x80
    DEFB 0x32                         ;0xcfc5:   "2"
    DEFB 0xf5                         ;0xcfc6:   ('u') + 0x80
    DEFB 0xcd                         ;0xcfc7:   ('M') + 0x80
    DEFB 0x40                         ;0xcfc8:   "@"
    DEFB 0x30                         ;0xcfc9:   "0"
    DEFB 0xca                         ;0xcfca:   ('J') + 0x80
    DEFB 0x59                         ;0xcfcb:   "Y"
    DEFB 0x32                         ;0xcfcc:   "2"
    DEFB 0xcd                         ;0xcfcd:   ('M') + 0x80
;--------------------------------------
C_CFCE:                               ; XREF: 0xFDFC 
    LD (HL),E                         ;0xcfce:   73  "s" 
    LD L,0xe6                         ;0xcfcf:   2e e6  ".."  
    ADD A,B                           ;0xcfd1:   80  "." 
    JP z, 0x3259                      ;0xcfd2:   ca 59 32  ".Y2" 
    CALL 0x2f83                       ;0xcfd5:   cd 83 2f  "../" 
    JP z, 0x3259                      ;0xcfd8:   ca 59 32  ".Y2" 
    CALL 0x2fd7                       ;0xcfdb:   cd d7 2f  "../" 
    JP z, 0x3259                      ;0xcfde:   ca 59 32  ".Y2" 
    CALL 0x2e85                       ;0xcfe1:   cd 85 2e  "..." 
    LD A,(0x37e4)                     ;0xcfe4:   3a e4 37  ":.7"  
    AND 0xc0                          ;0xcfe7:   e6 c0  ".." 
    JP nz, 0x2edf                     ;0xcfe9:   c2 df 2e  "..." 
    POP AF                            ;0xcfec:   f1  "." 
    CALL nc, 0x2816                   ;0xcfed:   d4 16 28  "..(" 
    CALL 0x21f8                       ;0xcff0:   cd f8 21  "..!" 
    RET z                             ;0xcff3:   c8  "." 
    CALL 0x2141                       ;0xcff4:   cd 41 21  ".A!" 
    CALL 0x2e73                       ;0xcff7:   cd 73 2e  ".s." 
    AND 0x80                          ;0xcffa:   e6 80  ".." 
    JP z, 0x32d2                      ;0xcffc:   ca d2 32  "..2" 
    LD A,(0x37b3)                     ;0xcfff:   3a b3 37  ":.7"  
    AND 0x40                          ;0xd002:   e6 40  ".@" 
    JP z, 0x32d2                      ;0xd004:   ca d2 32  "..2" 
    CALL 0x3040                       ;0xd007:   cd 40 30  ".@0" 
    JP nz, 0x32d2                     ;0xd00a:   c2 d2 32  "..2" 
    CALL 0x2524                       ;0xd00d:   cd 24 25  ".$%" 
    CALL 0x2f83                       ;0xd010:   cd 83 2f  "../" 
    CPL                               ;0xd013:   2f  "/" 
    LD DE,0xfb90                      ;0xd014:   11 90 fb  "..."  
    JP 0x2008                         ;0xd017:   c3 08 20  ".. " 
    CALL 0x2d9a                       ;0xd01a:   cd 9a 2d  "..-" 
    CALL 0x2141                       ;0xd01d:   cd 41 21  ".A!" 
    CALL 0x1fd8                       ;0xd020:   cd d8 1f  "..." 
    CALL 0x273d                       ;0xd023:   cd 3d 27  ".='" 
    LD A,(0x1c9f)                     ;0xd026:   3a 9f 1c  ":.."  
    INC A                             ;0xd029:   3c  "<" 
    RET z                             ;0xd02a:   c8  "." 
    JP 0x341a                         ;0xd02b:   c3 1a 34  "..4" 
    EX DE,HL                          ;0xd02e:   eb  "." 
    XOR A                             ;0xd02f:   af  "." 
    PUSH AF                           ;0xd030:   f5  "." 
    LD A,(HL)                         ;0xd031:   7e  "~" 
    CP 0x3f                           ;0xd032:   fe 3f  ".?" 
    JP nz, 0x31af                     ;0xd034:   c2 af 31  "..1" 
    CALL 0x2d6b                       ;0xd037:   cd 6b 2d  ".k-" 
    CALL 0x2de9                       ;0xd03a:   cd e9 2d  "..-" 
    LD C,1                            ;0xd03d:   0e 01  ".."  
    NOP                               ;0xd03f:   00  "." 
    JP 0x31c3                         ;0xd040:   c3 c3 31  "..1" 
    CALL 0x1f3f                       ;0xd043:   cd 3f 1f  ".?." 
    LD A,(HL)                         ;0xd046:   7e  "~" 
    CP 0x3f                           ;0xd047:   fe 3f  ".?" 
    JP z, 0x31be                      ;0xd049:   ca be 31  "..1" 
    CALL 0x205a                       ;0xd04c:   cd 5a 20  ".Z " 
    CALL 0x2054                       ;0xd04f:   cd 54 20  ".T " 
    CALL 0x2d90                       ;0xd052:   cd 90 2d  "..-" 
    LD C,15                           ;0xd055:   0e 0f  ".."  
    POP AF                            ;0xd057:   f1  "." 
    PUSH AF                           ;0xd058:   f5  "." 
    JP z, 0x31da                      ;0xd059:   ca da 31  "..1" 
    LD HL,(D_FBE1)                    ;0xd05c:   2a e1 fb  "*.."  
    PUSH HL                           ;0xd05f:   e5  "." 
    LD A,0xfc                         ;0xd060:   3e fc  ">."  
    AND L                             ;0xd062:   a5  "." 
    LD L,A                            ;0xd063:   6f  "o" 
    LD (D_FBE1),HL                    ;0xd064:   22 e1 fb  "".."  
    CALL 0x2192                       ;0xd067:   cd 92 21  "..!" 
    POP HL                            ;0xd06a:   e1  "." 
    LD (D_FBE1),HL                    ;0xd06b:   22 e1 fb  "".."  
    POP AF                            ;0xd06e:   f1  "." 
    LD HL,0x21c3                      ;0xd06f:   21 c3 21  "!.!"  
    PUSH HL                           ;0xd072:   e5  "." 
    JP z, 0x23f7                      ;0xd073:   ca f7 23  "..#" 
    LD A,(D_FBE5)                     ;0xd076:   3a e5 fb  ":.."  
    LD C,A                            ;0xd079:   4f  "O" 
    CALL 0x23dd                       ;0xd07a:   cd dd 23  "..#" 
    JP 0x2403                         ;0xd07d:   c3 03 24  "..$" 
    EX DE,HL                          ;0xd080:   eb  "." 
    LD (0x37a0),HL                    ;0xd081:   22 a0 37  "".7"  
    OR 1                              ;0xd084:   f6 01  ".." 
    JP 0x319d                         ;0xd086:   c3 9d 31  "..1" 
    CALL 0x3c7d                       ;0xd089:   cd 7d 3c  ".}<" 
    JP 0x2536                         ;0xd08c:   c3 36 25  ".6%" 
    CALL 0x2d9a                       ;0xd08f:   cd 9a 2d  "..-" 
    CALL C_DBCE                       ;0xd092:   cd ce db  "..." 
    EI                                ;0xd095:   fb  "." 
    LD DE,0x10a                       ;0xd096:   11 0a 01  "..."  
    NOP                               ;0xd099:   00  "." 
    ADD HL,DE                         ;0xd09a:   19  "." 
    LD A,(HL)                         ;0xd09b:   7e  "~" 
    AND 0x80                          ;0xd09c:   e6 80  ".." 
    JP nz, 0x3112                     ;0xd09e:   c2 12 31  "..1" 
    LD (0x37b5),A                     ;0xd0a1:   32 b5 37  "2.7"  
    JP 0x24c0                         ;0xd0a4:   c3 c0 24  "..$" 
    CALL 0x2141                       ;0xd0a7:   cd 41 21  ".A!" 
    CALL 0x2e73                       ;0xd0aa:   cd 73 2e  ".s." 
    AND 0x80                          ;0xd0ad:   e6 80  ".." 
    JP z, 0x3176                      ;0xd0af:   ca 76 31  ".v1" 
    CALL 0x3040                       ;0xd0b2:   cd 40 30  ".@0" 
    JP nz, 0x314e                     ;0xd0b5:   c2 4e 31  ".N1" 
    CALL 0x3010                       ;0xd0b8:   cd 10 30  "..0" 
    OR A                              ;0xd0bb:   b7  "." 
    JP nz, 0x314e                     ;0xd0bc:   c2 4e 31  ".N1" 
    LD A,(HL)                         ;0xd0bf:   7e  "~" 
    AND 0xc0                          ;0xd0c0:   e6 c0  ".." 
    JP z, 0x3176                      ;0xd0c2:   ca 76 31  ".v1" 
    CALL 0x2524                       ;0xd0c5:   cd 24 25  ".$%" 
    CALL 0x2f83                       ;0xd0c8:   cd 83 2f  "../" 
    JP nz, 0x3157                     ;0xd0cb:   c2 57 31  ".W1" 
    CALL 0x252b                       ;0xd0ce:   cd 2b 25  ".+%" 
    RET z                             ;0xd0d1:   c8  "." 
    CALL 0x3010                       ;0xd0d2:   cd 10 30  "..0" 
    OR A                              ;0xd0d5:   b7  "." 
    JP nz, 0x3176                     ;0xd0d6:   c2 76 31  ".v1" 
    LD (HL),A                         ;0xd0d9:   77  "w" 
    CALL 0x201a                       ;0xd0da:   cd 1a 20  ".. " 
    CALL z, 0x219a                    ;0xd0dd:   cc 9a 21  "..!" 
    JP 0x3176                         ;0xd0e0:   c3 76 31  ".v1" 
    CALL 0x2524                       ;0xd0e3:   cd 24 25  ".$%" 
    CALL 0x2f83                       ;0xd0e6:   cd 83 2f  "../" 
    JP z, 0x3172                      ;0xd0e9:   ca 72 31  ".r1" 
    CALL 0x2f02                       ;0xd0ec:   cd 02 2f  "../" 
    JP z, 0x3172                      ;0xd0ef:   ca 72 31  ".r1" 
    CALL 0x2e85                       ;0xd0f2:   cd 85 2e  "..." 
    LD A,(0x37e4)                     ;0xd0f5:   3a e4 37  ":.7"  
    AND 0xc0                          ;0xd0f8:   e6 c0  ".." 
    JP z, 0x3172                      ;0xd0fa:   ca 72 31  ".r1" 
    AND 0x80                          ;0xd0fd:   e6 80  ".." 
    JP nz, 0x2edf                     ;0xd0ff:   c2 df 2e  "..." 
    LD A,0x80                         ;0xd102:   3e 80  ">."  
    LD (0x37b6),A                     ;0xd104:   32 b6 37  "2.7"  
    CALL 0x252b                       ;0xd107:   cd 2b 25  ".+%" 
    RET z                             ;0xd10a:   c8  "." 
    CALL 0x2141                       ;0xd10b:   cd 41 21  ".A!" 
    LD C,0x40                         ;0xd10e:   0e 40  ".@"  
    CALL 0x3032                       ;0xd110:   cd 32 30  ".20" 
    CALL z, 0xc3dd                    ;0xd113:   cc dd c3  "..." 
    LD (HL),D                         ;0xd116:   72  "r" 
    ADD HL,DE                         ;0xd117:   19  "." 
    LD HL,D_FFFF                      ;0xd118:   21 ff ff  "!.."  
    CALL 0x335a                       ;0xd11b:   cd 5a 33  ".Z3" 
    XOR A                             ;0xd11e:   af  "." 
    LD (D_FBDA),A                     ;0xd11f:   32 da fb  "2.."  
    LD HL,0x180                       ;0xd122:   21 80 01  "!.."  
    NOP                               ;0xd125:   00  "." 
    LD (D_FBD8),HL                    ;0xd126:   22 d8 fb  "".."  
    JP 0x21b6                         ;0xd129:   c3 b6 21  "..!" 
    CALL 0x2d67                       ;0xd12c:   cd 67 2d  ".g-" 
    LD A,(0x37a4)                     ;0xd12f:   3a a4 37  ":.7"  
    LD (D_FBDA),A                     ;0xd132:   32 da fb  "2.."  
    RET                               ;0xd135:   c9  "." 
    CALL 0x2054                       ;0xd136:   cd 54 20  ".T " 
    CALL 0x2d90                       ;0xd139:   cd 90 2d  "..-" 
    CALL 0x262d                       ;0xd13c:   cd 2d 26  ".-&" 
    LD A,(D_FBE0)                     ;0xd13f:   3a e0 fb  ":.."  
    OR A                              ;0xd142:   b7  "." 
    JP z, 0x30b9                      ;0xd143:   ca b9 30  "..0" 
    LD A,0xfe                         ;0xd146:   3e fe  ">."  
    LD (D_F618),A                     ;0xd148:   32 18 f6  "2.."  
    INC A                             ;0xd14b:   3c  "<" 
    LD (0x37bd),A                     ;0xd14c:   32 bd 37  "2.7"  
    CALL 0x26da                       ;0xd14f:   cd da 26  "..&" 
    CALL 0x30e7                       ;0xd152:   cd e7 30  "..0" 
    LD HL,0x37bd                      ;0xd155:   21 bd 37  "!.7"  
    CP (HL)                           ;0xd158:   be  "." 
    RET z                             ;0xd159:   c8  "." 
    LD (HL),A                         ;0xd15a:   77  "w" 
    LD A,(D_F618)                     ;0xd15b:   3a 18 f6  ":.."  
    CP 0xfe                           ;0xd15e:   fe fe  ".." 
    RET z                             ;0xd160:   c8  "." 
    CALL 0x280a                       ;0xd161:   cd 0a 28  "..(" 
    LD A,0x80                         ;0xd164:   3e 80  ">."  
    LD (0x37b5),A                     ;0xd166:   32 b5 37  "2.7"  
    LD HL,(D_FBDB)                    ;0xd169:   2a db fb  "*.."  
    LD (HL),1                         ;0xd16c:   36 01  "6."  
    NOP                               ;0xd16e:   00  "." 
    LD C,15                           ;0xd16f:   0e 0f  ".."  
    CALL 0x23dd                       ;0xd171:   cd dd 23  "..#" 
    CALL 0x2403                       ;0xd174:   cd 03 24  "..$" 
    CALL 0x26dd                       ;0xd177:   cd dd 26  "..&" 
    CALL 0x30e7                       ;0xd17a:   cd e7 30  "..0" 
    RET                               ;0xd17d:   c9  "." 
    CALL 0x21f8                       ;0xd17e:   cd f8 21  "..!" 
    RET z                             ;0xd181:   c8  "." 
    CALL 0x1f4f                       ;0xd182:   cd 4f 1f  ".O." 
    LD A,(HL)                         ;0xd185:   7e  "~" 
    INC A                             ;0xd186:   3c  "<" 
    JP nz, 0x30f7                     ;0xd187:   c2 f7 30  "..0" 
    DEC DE                            ;0xd18a:   1b  "." 
    DEC DE                            ;0xd18b:   1b  "." 
    LD A,(DE)                         ;0xd18c:   1a  "." 
    LD (HL),A                         ;0xd18d:   77  "w" 
    POP HL                            ;0xd18e:   e1  "." 
    LD A,(0x37b5)                     ;0xd18f:   3a b5 37  ":.7"  
    RLA                               ;0xd192:   17  "." 
    JP nc, 0x3112                     ;0xd193:   d2 12 31  "..1" 
    LD HL,(0x29c2)                    ;0xd196:   2a c2 29  "*.)"  
    DEC E                             ;0xd199:   1d  "." 
    POP HL                            ;0xd19a:   e1  "." 
    RET                               ;0xd19b:   c9  "." 
    CALL 0x2040                       ;0xd19c:   cd 40 20  ".@ " 
    ADD HL,BC                         ;0xd19f:   09  "." 
    LD DE,0x1975                      ;0xd1a0:   11 75 19  ".u."  
    PUSH DE                           ;0xd1a3:   d5  "." 
    JP 0x2fed                         ;0xd1a4:   c3 ed 2f  "../" 
    LD C,8                            ;0xd1a7:   0e 08  ".."  
    LD A,(D_FBE1)                     ;0xd1a9:   3a e1 fb  ":.."  
    AND 3                             ;0xd1ac:   e6 03  ".." 
    CP 3                              ;0xd1ae:   fe 03  ".." 
    RET z                             ;0xd1b0:   c8  "." 
    LD B,A                            ;0xd1b1:   47  "G" 
    LD HL,(0x3767)                    ;0xd1b2:   2a 67 37  "*g7"  
    LD DE,0x160                       ;0xd1b5:   11 60 01  ".`."  
    NOP                               ;0xd1b8:   00  "." 
    ADD HL,DE                         ;0xd1b9:   19  "." 
    LD A,(HL)                         ;0xd1ba:   7e  "~" 
    SUB 0x21                          ;0xd1bb:   d6 21  ".!" 
    RET nz                            ;0xd1bd:   c0  "." 
    LD A,B                            ;0xd1be:   78  "x" 
    ADD A,A                           ;0xd1bf:   87  "." 
    LD E,A                            ;0xd1c0:   5f  "_" 
    ADD A,A                           ;0xd1c1:   87  "." 
    ADD A,A                           ;0xd1c2:   87  "." 
    ADD A,E                           ;0xd1c3:   83  "." 
    INC A                             ;0xd1c4:   3c  "<" 
    ADD A,C                           ;0xd1c5:   81  "." 
    LD E,A                            ;0xd1c6:   5f  "_" 
    ADD HL,DE                         ;0xd1c7:   19  "." 
    XOR A                             ;0xd1c8:   af  "." 
    RET                               ;0xd1c9:   c9  "." 
    CALL 0x3040                       ;0xd1ca:   cd 40 30  ".@0" 
    RET nz                            ;0xd1cd:   c0  "." 
    LD HL,(0x376f)                    ;0xd1ce:   2a 6f 37  "*o7"  
    LD A,C                            ;0xd1d1:   79  "y" 
    AND (HL)                          ;0xd1d2:   a6  "." 
    JP nz, 0x201a                     ;0xd1d3:   c2 1a 20  ".. " 
    INC A                             ;0xd1d6:   3c  "<" 
    RET                               ;0xd1d7:   c9  "." 
    LD A,(0x3784)                     ;0xd1d8:   3a 84 37  ":.7"  
    OR 0xe0                           ;0xd1db:   f6 e0  ".." 
    CPL                               ;0xd1dd:   2f  "/" 
    LD B,A                            ;0xd1de:   47  "G" 
    CALL 0x1f3f                       ;0xd1df:   cd 3f 1f  ".?." 
    LD A,(HL)                         ;0xd1e2:   7e  "~" 
    AND B                             ;0xd1e3:   a0  "." 
    RET nz                            ;0xd1e4:   c0  "." 
    INC HL                            ;0xd1e5:   23  "#" 
    INC HL                            ;0xd1e6:   23  "#" 
    LD A,(HL)                         ;0xd1e7:   7e  "~" 
    AND 0x3f                          ;0xd1e8:   e6 3f  ".?" 
    RET                               ;0xd1ea:   c9  "." 
    LD C,0x20                         ;0xd1eb:   0e 20  ". "  
    CALL 0x3036                       ;0xd1ed:   cd 36 30  ".60" 
    RET nz                            ;0xd1f0:   c0  "." 
    CALL 0x204b                       ;0xd1f1:   cd 4b 20  ".K " 
    AND 0x40                          ;0xd1f4:   e6 40  ".@" 
    RET nz                            ;0xd1f6:   c0  "." 
    CALL 0x1f3f                       ;0xd1f7:   cd 3f 1f  ".?." 
    LD B,(HL)                         ;0xd1fa:   46  "F" 
    LD (HL),1                         ;0xd1fb:   36 01  "6."  
    NOP                               ;0xd1fd:   00  "." 
    PUSH HL                           ;0xd1fe:   e5  "." 
    INC HL                            ;0xd1ff:   23  "#" 
    INC HL                            ;0xd200:   23  "#" 
    LD C,(HL)                         ;0xd201:   4e  "N" 
    LD (HL),1                         ;0xd202:   36 01  "6."  
    NOP                               ;0xd204:   00  "." 
    PUSH BC                           ;0xd205:   c5  "." 
    CALL 0x23f0                       ;0xd206:   cd f0 23  "..#" 
    CALL nz, 0x2fe2                   ;0xd209:   c4 e2 2f  "../" 
    XOR A                             ;0xd20c:   af  "." 
    LD (0x1c9f),A                     ;0xd20d:   32 9f 1c  "2.."  
    POP BC                            ;0xd210:   c1  "." 
    POP HL                            ;0xd211:   e1  "." 
    LD (HL),B                         ;0xd212:   70  "p" 
    INC HL                            ;0xd213:   23  "#" 
    INC HL                            ;0xd214:   23  "#" 
    LD (HL),C                         ;0xd215:   71  "q" 
    RET                               ;0xd216:   c9  "." 
    LD A,(D_FBA1)                     ;0xd217:   3a a1 fb  ":.."  
    CPL                               ;0xd21a:   2f  "/" 
    INC HL                            ;0xd21b:   23  "#" 
    RET                               ;0xd21c:   c9  "." 
    LD HL,(D_FBDB)                    ;0xd21d:   2a db fb  "*.."  
    LD A,(HL)                         ;0xd220:   7e  "~" 
    PUSH AF                           ;0xd221:   f5  "." 
    OR 0x10                           ;0xd222:   f6 10  ".." 
    LD (HL),A                         ;0xd224:   77  "w" 
    CALL 0x23f5                       ;0xd225:   cd f5 23  "..#" 
    LD A,1                            ;0xd228:   3e 01  ">."  
    NOP                               ;0xd22a:   00  "." 
    LD (0x1c9f),A                     ;0xd22b:   32 9f 1c  "2.."  
    LD HL,(D_FBDB)                    ;0xd22e:   2a db fb  "*.."  
    POP BC                            ;0xd231:   c1  "." 
    LD (HL),B                         ;0xd232:   70  "p" 
    RET z                             ;0xd233:   c8  "." 
    CALL 0x2040                       ;0xd234:   cd 40 20  ".@ " 
    EX DE,HL                          ;0xd237:   eb  "." 
    LD HL,0x10c                       ;0xd238:   21 0c 01  "!.."  
    NOP                               ;0xd23b:   00  "." 
    ADD HL,DE                         ;0xd23c:   19  "." 
    LD A,(HL)                         ;0xd23d:   7e  "~" 
    AND 0xe0                          ;0xd23e:   e6 e0  ".." 
    OR 1                              ;0xd240:   f6 01  ".." 
    RET                               ;0xd242:   c9  "." 
    PUSH HL                           ;0xd243:   e5  "." 
    LD HL,(D_F619)                    ;0xd244:   2a 19 f6  "*.."  
    ADD HL,DE                         ;0xd247:   19  "." 
    LD (D_F619),HL                    ;0xd248:   22 19 f6  "".."  
    POP HL                            ;0xd24b:   e1  "." 
    RET                               ;0xd24c:   c9  "." 
    CALL 0x2076                       ;0xd24d:   cd 76 20  ".v " 
    LD BC,0x1014                      ;0xd250:   01 14 10  "..."  
    PUSH BC                           ;0xd253:   c5  "." 
    CALL 0x2040                       ;0xd254:   cd 40 20  ".@ " 
    EX DE,HL                          ;0xd257:   eb  "." 
    LD HL,(D_FBDB)                    ;0xd258:   2a db fb  "*.."  
    EX DE,HL                          ;0xd25b:   eb  "." 
    LD A,(DE)                         ;0xd25c:   1a  "." 
    OR B                              ;0xd25d:   b0  "." 
    LD (HL),A                         ;0xd25e:   77  "w" 
    INC DE                            ;0xd25f:   13  "." 
    INC HL                            ;0xd260:   23  "#" 
    LD C,11                           ;0xd261:   0e 0b  ".."  
    CALL 0x1d29                       ;0xd263:   cd 29 1d  ".)." 
    POP BC                            ;0xd266:   c1  "." 
    INC C                             ;0xd267:   0c  "." 
    DEC C                             ;0xd268:   0d  "." 
    RET z                             ;0xd269:   c8  "." 
    LD (HL),1                         ;0xd26a:   36 01  "6."  
    NOP                               ;0xd26c:   00  "." 
    INC HL                            ;0xd26d:   23  "#" 
    JP 0x2fcc                         ;0xd26e:   c3 cc 2f  "../" 
    CALL 0x2f99                       ;0xd271:   cd 99 2f  "../" 
    PUSH HL                           ;0xd274:   e5  "." 
    CALL 0x2f02                       ;0xd275:   cd 02 2f  "../" 
    POP HL                            ;0xd278:   e1  "." 
    RET                               ;0xd279:   c9  "." 
    LD C,1                            ;0xd27a:   0e 01  ".."  
    NOP                               ;0xd27c:   00  "." 
    JP 0x2fe4                         ;0xd27d:   c3 e4 2f  "../" 
    LD C,4                            ;0xd280:   0e 04  ".."  
    CALL 0x3012                       ;0xd282:   cd 12 30  "..0" 
    OR A                              ;0xd285:   b7  "." 
    RET nz                            ;0xd286:   c0  "." 
    LD DE,0x219a                      ;0xd287:   11 9a 21  "..!"  
    PUSH DE                           ;0xd28a:   d5  "." 
    LD DE,D_FBF4                      ;0xd28b:   11 f4 fb  "..."  
    PUSH HL                           ;0xd28e:   e5  "." 
    PUSH DE                           ;0xd28f:   d5  "." 
    LD C,1                            ;0xd290:   0e 01  ".."  
    NOP                               ;0xd292:   00  "." 
    CALL 0xfc4e                       ;0xd293:   cd 4e fc  ".N." 
    LD C,4                            ;0xd296:   0e 04  ".."  
    CALL 0x1d1f                       ;0xd298:   cd 1f 1d  "..." 
    LD C,4                            ;0xd29b:   0e 04  ".."  
    POP DE                            ;0xd29d:   d1  "." 
    POP HL                            ;0xd29e:   e1  "." 
    EI                                ;0xd29f:   fb  "." 
    RET                               ;0xd2a0:   c9  "." 
    INC HL                            ;0xd2a1:   23  "#" 
    LD B,(HL)                         ;0xd2a2:   46  "F" 
    LD A,B                            ;0xd2a3:   78  "x" 
    OR A                              ;0xd2a4:   b7  "." 
    JP nz, 0x2f1d                     ;0xd2a5:   c2 1d 2f  "../" 
    LD D,H                            ;0xd2a8:   54  "T" 
    LD E,L                            ;0xd2a9:   5d  "]" 
    INC HL                            ;0xd2aa:   23  "#" 
    INC HL                            ;0xd2ab:   23  "#" 
    LD C,9                            ;0xd2ac:   0e 09  ".."  
    INC HL                            ;0xd2ae:   23  "#" 
    LD A,(HL)                         ;0xd2af:   7e  "~" 
    DEC C                             ;0xd2b0:   0d  "." 
    RET z                             ;0xd2b1:   c8  "." 
    OR A                              ;0xd2b2:   b7  "." 
    JP z, 0x2f0f                      ;0xd2b3:   ca 0f 2f  "../" 
    CP 0x20                           ;0xd2b6:   fe 20  ". " 
    JP z, 0x2f0f                      ;0xd2b8:   ca 0f 2f  "../" 
    EX DE,HL                          ;0xd2bb:   eb  "." 
    LD DE,0x10a                       ;0xd2bc:   11 0a 01  "..."  
    NOP                               ;0xd2bf:   00  "." 
    ADD HL,DE                         ;0xd2c0:   19  "." 
    EX DE,HL                          ;0xd2c1:   eb  "." 
    LD HL,(D_F619)                    ;0xd2c2:   2a 19 f6  "*.."  
    LD C,8                            ;0xd2c5:   0e 08  ".."  
    LD A,(DE)                         ;0xd2c7:   1a  "." 
    XOR B                             ;0xd2c8:   a8  "." 
    CP (HL)                           ;0xd2c9:   be  "." 
    JP nz, 0x2f34                     ;0xd2ca:   c2 34 2f  ".4/" 
    DEC DE                            ;0xd2cd:   1b  "." 
    INC HL                            ;0xd2ce:   23  "#" 
    DEC C                             ;0xd2cf:   0d  "." 
    JP nz, 0x2f27                     ;0xd2d0:   c2 27 2f  ".'/" 
    RET                               ;0xd2d3:   c9  "." 
    DEC DE                            ;0xd2d4:   1b  "." 
    DEC C                             ;0xd2d5:   0d  "." 
    JP nz, 0x2f34                     ;0xd2d6:   c2 34 2f  ".4/" 
    INC DE                            ;0xd2d9:   13  "." 
    LD HL,0x37e7                      ;0xd2da:   21 e7 37  "!.7"  
    LD C,8                            ;0xd2dd:   0e 08  ".."  
    JP 0x1d1f                         ;0xd2df:   c3 1f 1d  "..." 
    PUSH HL                           ;0xd2e2:   e5  "." 
    LD BC,0x108                       ;0xd2e3:   01 08 01  "..."  
    NOP                               ;0xd2e6:   00  "." 
    LD DE,0x10b                       ;0xd2e7:   11 0b 01  "..."  
    NOP                               ;0xd2ea:   00  "." 
    ADD HL,DE                         ;0xd2eb:   19  "." 
    EX DE,HL                          ;0xd2ec:   eb  "." 
    LD HL,(D_F619)                    ;0xd2ed:   2a 19 f6  "*.."  
    XOR A                             ;0xd2f0:   af  "." 
    PUSH AF                           ;0xd2f1:   f5  "." 
    LD A,(HL)                         ;0xd2f2:   7e  "~" 
    LD (DE),A                         ;0xd2f3:   12  "." 
    OR A                              ;0xd2f4:   b7  "." 
    JP z, 0x2f5e                      ;0xd2f5:   ca 5e 2f  ".^/" 
    CP 0x20                           ;0xd2f8:   fe 20  ". " 
    JP z, 0x2f5e                      ;0xd2fa:   ca 5e 2f  ".^/" 
    INC SP                            ;0xd2fd:   33  "3" 
    INC SP                            ;0xd2fe:   33  "3" 
    PUSH AF                           ;0xd2ff:   f5  "." 
    ADD A,B                           ;0xd300:   80  "." 
    LD B,A                            ;0xd301:   47  "G" 
    DEC DE                            ;0xd302:   1b  "." 
    INC HL                            ;0xd303:   23  "#" 
    DEC C                             ;0xd304:   0d  "." 
    JP nz, 0x2f50                     ;0xd305:   c2 50 2f  ".P/" 
    POP AF                            ;0xd308:   f1  "." 
    OR B                              ;0xd309:   b0  "." 
    POP HL                            ;0xd30a:   e1  "." 
    JP nz, 0x2f76                     ;0xd30b:   c2 76 2f  ".v/" 
    LD A,(D_FBDF)                     ;0xd30e:   3a df fb  ":.."  
    CP 0x64                           ;0xd311:   fe 64  ".d" 
    JP z, 0x2f76                      ;0xd313:   ca 76 2f  ".v/" 
    LD (HL),1                         ;0xd316:   36 01  "6."  
    NOP                               ;0xd318:   00  "." 
    INC DE                            ;0xd319:   13  "." 
    LD C,8                            ;0xd31a:   0e 08  ".."  
    LD A,(DE)                         ;0xd31c:   1a  "." 
    XOR B                             ;0xd31d:   a8  "." 
    LD (DE),A                         ;0xd31e:   12  "." 
    INC DE                            ;0xd31f:   13  "." 
    DEC C                             ;0xd320:   0d  "." 
    JP nz, 0x2f79                     ;0xd321:   c2 79 2f  ".y/" 
    RET z                             ;0xd324:   c8  "." 
    JP 0x2f02                         ;0xd325:   c3 02 2f  "../" 
    XOR A                             ;0xd328:   af  "." 
    LD (D_F618),A                     ;0xd329:   32 18 f6  "2.."  
    CALL 0x2040                       ;0xd32c:   cd 40 20  ".@ " 
    EX DE,HL                          ;0xd32f:   eb  "." 
    LD C,12                           ;0xd330:   0e 0c  ".."  
    LD HL,0x37d7                      ;0xd332:   21 d7 37  "!.7"  
    PUSH HL                           ;0xd335:   e5  "." 
    CALL 0x1d29                       ;0xd336:   cd 29 1d  ".)." 
    LD A,(DE)                         ;0xd339:   1a  "." 
    INC HL                            ;0xd33a:   23  "#" 
    LD (HL),A                         ;0xd33b:   77  "w" 
    POP DE                            ;0xd33c:   d1  "." 
    LD HL,(D_FBDB)                    ;0xd33d:   2a db fb  "*.."  
    LD A,(HL)                         ;0xd340:   7e  "~" 
    LD (DE),A                         ;0xd341:   12  "." 
    PUSH HL                           ;0xd342:   e5  "." 
    EX DE,HL                          ;0xd343:   eb  "." 
    LD (D_FBDB),HL                    ;0xd344:   22 db fb  "".."  
    CALL 0x23f0                       ;0xd347:   cd f0 23  "..#" 
    JP z, 0x2ee4                      ;0xd34a:   ca e4 2e  "..." 
    CALL 0x3010                       ;0xd34d:   cd 10 30  "..0" 
    OR A                              ;0xd350:   b7  "." 
    JP nz, 0x2ed2                     ;0xd351:   c2 d2 2e  "..." 
    EX DE,HL                          ;0xd354:   eb  "." 
    LD HL,0x37e4                      ;0xd355:   21 e4 37  "!.7"  
    LD B,(HL)                         ;0xd358:   46  "F" 
    LD A,(DE)                         ;0xd359:   1a  "." 
    LD (HL),A                         ;0xd35a:   77  "w" 
    OR A                              ;0xd35b:   b7  "." 
    JP z, 0x2ee4                      ;0xd35c:   ca e4 2e  "..." 
    XOR B                             ;0xd35f:   a8  "." 
    AND 0xe0                          ;0xd360:   e6 e0  ".." 
    JP z, 0x2ed2                      ;0xd362:   ca d2 2e  "..." 
    CALL 0x2f83                       ;0xd365:   cd 83 2f  "../" 
    JP z, 0x2ed2                      ;0xd368:   ca d2 2e  "..." 
    LD A,(0x37e4)                     ;0xd36b:   3a e4 37  ":.7"  
    LD (HL),A                         ;0xd36e:   77  "w" 
    CALL 0x201a                       ;0xd36f:   cd 1a 20  ".. " 
    CALL z, 0x219a                    ;0xd372:   cc 9a 21  "..!" 
    POP HL                            ;0xd375:   e1  "." 
    LD (D_FBDB),HL                    ;0xd376:   22 db fb  "".."  
    LD A,(D_FBDF)                     ;0xd379:   3a df fb  ":.."  
    CP 15                             ;0xd37c:   fe 0f  ".." 
    RET z                             ;0xd37e:   c8  "." 
    CP 0x16                           ;0xd37f:   fe 16  ".." 
    RET z                             ;0xd381:   c8  "." 
    LD A,7                            ;0xd382:   3e 07  ">."  
    JP 0x32e5                         ;0xd384:   c3 e5 32  "..2" 
    XOR A                             ;0xd387:   af  "." 
    LD (0x37e4),A                     ;0xd388:   32 e4 37  "2.7"  
    CALL 0x201a                       ;0xd38b:   cd 1a 20  ".. " 
    JP nz, 0x2efd                     ;0xd38e:   c2 fd 2e  "..." 
    CALL 0x2f83                       ;0xd391:   cd 83 2f  "../" 
    PUSH AF                           ;0xd394:   f5  "." 
    LD HL,(D_FBDB)                    ;0xd395:   2a db fb  "*.."  
    LD A,(HL)                         ;0xd398:   7e  "~" 
    OR 0x10                           ;0xd399:   f6 10  ".." 
    LD (HL),A                         ;0xd39b:   77  "w" 
    POP AF                            ;0xd39c:   f1  "." 
    CALL nz, 0x2587                   ;0xd39d:   c4 87 25  "..%" 
    POP HL                            ;0xd3a0:   e1  "." 
    LD (D_FBDB),HL                    ;0xd3a1:   22 db fb  "".."  
    PUSH HL                           ;0xd3a4:   e5  "." 
    CALL 0x1d80                       ;0xd3a5:   cd 80 1d  "..." 
    CALL 0x2201                       ;0xd3a8:   cd 01 22  ".."" 
    LD C,1                            ;0xd3ab:   0e 01  ".."  
    NOP                               ;0xd3ad:   00  "." 
    CALL 0x220e                       ;0xd3ae:   cd 0e 22  ".."" 
    LD HL,D_FBDE                      ;0xd3b1:   21 de fb  "!.."  
    LD A,(HL)                         ;0xd3b4:   7e  "~" 
    OR A                              ;0xd3b5:   b7  "." 
    JP z, 0x2e24                      ;0xd3b6:   ca 24 2e  ".$." 
    LD (HL),1                         ;0xd3b9:   36 01  "6."  
    NOP                               ;0xd3bb:   00  "." 
    POP HL                            ;0xd3bc:   e1  "." 
    LD A,(D_FBDF)                     ;0xd3bd:   3a df fb  ":.."  
    CP 0x30                           ;0xd3c0:   fe 30  ".0" 
    RET z                             ;0xd3c2:   c8  "." 
    CALL 0x2133                       ;0xd3c3:   cd 33 21  ".3!" 
    JP 0x2113                         ;0xd3c6:   c3 13 21  "..!" 
    CALL 0x2069                       ;0xd3c9:   cd 69 20  ".i " 
    JP c, 0x2e08                      ;0xd3cc:   da 08 2e  "..." 
    POP HL                            ;0xd3cf:   e1  "." 
    LD (D_FBE1),HL                    ;0xd3d0:   22 e1 fb  "".."  
    RET                               ;0xd3d3:   c9  "." 
    LD HL,D_FBF0                      ;0xd3d4:   21 f0 fb  "!.."  
    LD A,(HL)                         ;0xd3d7:   7e  "~" 
    OR A                              ;0xd3d8:   b7  "." 
    RET z                             ;0xd3d9:   c8  "." 
    LD (HL),1                         ;0xd3da:   36 01  "6."  
    NOP                               ;0xd3dc:   00  "." 
    LD HL,(0x3765)                    ;0xd3dd:   2a 65 37  "*e7"  
    LD A,0x10                         ;0xd3e0:   3e 10  ">."  
    DEC A                             ;0xd3e2:   3d  "=" 
    ADD HL,HL                         ;0xd3e3:   29  ")" 
    JP nc, 0x2e51                     ;0xd3e4:   d2 51 2e  ".Q." 
    PUSH AF                           ;0xd3e7:   f5  "." 
    PUSH HL                           ;0xd3e8:   e5  "." 
    LD HL,0x37a9                      ;0xd3e9:   21 a9 37  "!.7"  
    CALL 0x2d51                       ;0xd3ec:   cd 51 2d  ".Q-" 
    CALL 0x2e58                       ;0xd3ef:   cd 58 2e  ".X." 
    CALL nz, 0x2df5                   ;0xd3f2:   c4 f5 2d  "..-" 
    POP HL                            ;0xd3f5:   e1  "." 
    POP AF                            ;0xd3f6:   f1  "." 
    OR A                              ;0xd3f7:   b7  "." 
    JP nz, 0x2e3c                     ;0xd3f8:   c2 3c 2e  ".<." 
    JP 0x2d6b                         ;0xd3fb:   c3 6b 2d  ".k-" 
    LD HL,(0x377b)                    ;0xd3fe:   2a 7b 37  "*{7"  
    LD A,L                            ;0xd401:   7d  "}" 
    AND H                             ;0xd402:   a4  "." 
    INC A                             ;0xd403:   3c  "<" 
    RET z                             ;0xd404:   c8  "." 
    LD E,(HL)                         ;0xd405:   5e  "^" 
    INC HL                            ;0xd406:   23  "#" 
    LD D,(HL)                         ;0xd407:   56  "V" 
    LD A,E                            ;0xd408:   7b  "{" 
    OR D                              ;0xd409:   b2  "." 
    RET z                             ;0xd40a:   c8  "." 
    LD HL,0x104                       ;0xd40b:   21 04 01  "!.."  
    NOP                               ;0xd40e:   00  "." 
    ADD HL,DE                         ;0xd40f:   19  "." 
    LD A,(HL)                         ;0xd410:   7e  "~" 
    OR A                              ;0xd411:   b7  "." 
    RET nz                            ;0xd412:   c0  "." 
    LD HL,0x10d                       ;0xd413:   21 0d 01  "!.."  
    NOP                               ;0xd416:   00  "." 
    ADD HL,DE                         ;0xd417:   19  "." 
    JP 0x2e5f                         ;0xd418:   c3 5f 2e  "._." 
    LD HL,(0x376f)                    ;0xd41b:   2a 6f 37  "*o7"  
    LD A,(HL)                         ;0xd41e:   7e  "~" 
    RET                               ;0xd41f:   c9  "." 
    CALL 0x2e73                       ;0xd420:   cd 73 2e  ".s." 
    AND 0x80                          ;0xd423:   e6 80  ".." 
    RET z                             ;0xd425:   c8  "." 
    CALL 0x7183                       ;0xd426:   cd 83 71  "..q" 
    SCF                               ;0xd429:   37  "7" 
    LD A,(HL)                         ;0xd42a:   7e  "~" 
    AND 1                             ;0xd42b:   e6 01  ".." 
    PUSH AF                           ;0xd42d:   f5  "." 
    ADD A,(HL)                        ;0xd42e:   86  "." 
    LD (HL),A                         ;0xd42f:   77  "w" 
    POP AF                            ;0xd430:   f1  "." 
    CALL nz, 0x20e8                   ;0xd431:   c4 e8 20  ".. " 
    CALL 0x2005                       ;0xd434:   cd 05 20  ".. " 
    RET                               ;0xd437:   c9  "." 
    XOR A                             ;0xd438:   af  "." 
    LD (0x37b5),A                     ;0xd439:   32 b5 37  "2.7"  
    LD (0x37b6),A                     ;0xd43c:   32 b6 37  "2.7"  
    JP 0x2db9                         ;0xd43f:   c3 b9 2d  "..-" 
    LD BC,0x807f                      ;0xd442:   01 7f 80  "..."  
    LD HL,(D_FBDB)                    ;0xd445:   2a db fb  "*.."  
    LD DE,0x107                       ;0xd448:   11 07 01  "..."  
    NOP                               ;0xd44b:   00  "." 
    EX DE,HL                          ;0xd44c:   eb  "." 
    ADD HL,DE                         ;0xd44d:   19  "." 
    LD A,(HL)                         ;0xd44e:   7e  "~" 
    AND B                             ;0xd44f:   a0  "." 
    LD (0x37b6),A                     ;0xd450:   32 b6 37  "2.7"  
    LD A,(HL)                         ;0xd453:   7e  "~" 
    AND C                             ;0xd454:   a1  "." 
    LD (HL),A                         ;0xd455:   77  "w" 
    INC HL                            ;0xd456:   23  "#" 
    LD A,(HL)                         ;0xd457:   7e  "~" 
    AND B                             ;0xd458:   a0  "." 
    LD (0x37b5),A                     ;0xd459:   32 b5 37  "2.7"  
    LD A,(HL)                         ;0xd45c:   7e  "~" 
    AND C                             ;0xd45d:   a1  "." 
    LD (HL),A                         ;0xd45e:   77  "w" 
    CALL 0x205a                       ;0xd45f:   cd 5a 20  ".Z " 
    LD HL,2                           ;0xd462:   21 02 00  "!.."  
    LD (D_F615),HL                    ;0xd465:   22 15 f6  "".."  
    LD (D_F617),HL                    ;0xd468:   22 17 f6  "".."  
    XOR A                             ;0xd46b:   af  "." 
    LD (0x37bd),A                     ;0xd46c:   32 bd 37  "2.7"  
    DEC A                             ;0xd46f:   3d  "=" 
    LD (D_FBDD),A                     ;0xd470:   32 dd fb  "2.."  
    LD HL,(D_FBDB)                    ;0xd473:   2a db fb  "*.."  
    LD A,(HL)                         ;0xd476:   7e  "~" 
    LD (0x37bf),A                     ;0xd477:   32 bf 37  "2.7"  
    AND 0x1f                          ;0xd47a:   e6 1f  ".." 
    DEC A                             ;0xd47c:   3d  "=" 
    LD (0x379e),A                     ;0xd47d:   32 9e 37  "2.7"  
    CP 0xff                           ;0xd480:   fe ff  ".." 
    JP z, 0x2ddf                      ;0xd482:   ca df 2d  "..-" 
    LD (0x37a4),A                     ;0xd485:   32 a4 37  "2.7"  
    CALL 0x2d6b                       ;0xd488:   cd 6b 2d  ".k-" 
    LD A,(D_FBE0)                     ;0xd48b:   3a e0 fb  ":.."  
    LD HL,(D_FBDB)                    ;0xd48e:   2a db fb  "*.."  
    LD (HL),A                         ;0xd491:   77  "w" 
    CALL 0x20f5                       ;0xd492:   cd f5 20  ".. " 
    CALL z, 0x2158                    ;0xd495:   cc 58 21  ".X!" 
    CALL 0x2df5                       ;0xd498:   cd f5 2d  "..-" 
    JP 0x2e2f                         ;0xd49b:   c3 2f 2e  "./." 
    CALL 0x210c                       ;0xd49e:   cd 0c 21  "..!" 
    RET z                             ;0xd4a1:   c8  "." 
    LD (HL),1                         ;0xd4a2:   36 01  "6."  
    NOP                               ;0xd4a4:   00  "." 
    CALL 0x2158                       ;0xd4a5:   cd 58 21  ".X!" 
    LD HL,(0x96e1)                    ;0xd4a8:   2a e1 96  "*.."  
    LD D,A                            ;0xd4ab:   57  "W" 
    INC HL                            ;0xd4ac:   23  "#" 
    LD A,B                            ;0xd4ad:   78  "x" 
    SBC A,(HL)                        ;0xd4ae:   9e  "." 
    INC HL                            ;0xd4af:   23  "#" 
    PUSH AF                           ;0xd4b0:   f5  "." 
    OR D                              ;0xd4b1:   b2  "." 
    LD D,A                            ;0xd4b2:   57  "W" 
    POP AF                            ;0xd4b3:   f1  "." 
    LD A,E                            ;0xd4b4:   7b  "{" 
    SBC A,(HL)                        ;0xd4b5:   9e  "." 
    RET                               ;0xd4b6:   c9  "." 
    LD (HL),E                         ;0xd4b7:   73  "s" 
    DEC HL                            ;0xd4b8:   2b  "+" 
    LD (HL),B                         ;0xd4b9:   70  "p" 
    DEC HL                            ;0xd4ba:   2b  "+" 
    LD (HL),C                         ;0xd4bb:   71  "q" 
    RET                               ;0xd4bc:   c9  "." 
    CALL 0x1f37                       ;0xd4bd:   cd 37 1f  ".7." 
    PUSH HL                           ;0xd4c0:   e5  "." 
    LD (HL),D                         ;0xd4c1:   72  "r" 
    INC HL                            ;0xd4c2:   23  "#" 
    LD (HL),D                         ;0xd4c3:   72  "r" 
    INC HL                            ;0xd4c4:   23  "#" 
    LD (HL),D                         ;0xd4c5:   72  "r" 
    CALL 0x23f5                       ;0xd4c6:   cd f5 23  "..#" 
    JP z, 0x2d3e                      ;0xd4c9:   ca 3e 2d  ".>-" 
    CALL 0x2040                       ;0xd4cc:   cd 40 20  ".@ " 
    LD DE,0x10f                       ;0xd4cf:   11 0f 01  "..."  
    NOP                               ;0xd4d2:   00  "." 
    CALL 0x2ccb                       ;0xd4d3:   cd cb 2c  "..," 
    POP HL                            ;0xd4d6:   e1  "." 
    PUSH HL                           ;0xd4d7:   e5  "." 
    CALL 0x2cfe                       ;0xd4d8:   cd fe 2c  "..," 
    CALL nc, 0x2d0d                   ;0xd4db:   d4 0d 2d  "..-" 
    CALL 0x2403                       ;0xd4de:   cd 03 24  "..$" 
    LD A,1                            ;0xd4e1:   3e 01  ">."  
    NOP                               ;0xd4e3:   00  "." 
    LD (0x1c9f),A                     ;0xd4e4:   32 9f 1c  "2.."  
    JP 0x2d1f                         ;0xd4e7:   c3 1f 2d  "..-" 
    POP HL                            ;0xd4ea:   e1  "." 
    RET                               ;0xd4eb:   c9  "." 
    EX DE,HL                          ;0xd4ec:   eb  "." 
    LD DE,0x120                       ;0xd4ed:   11 20 01  ". ."  
    NOP                               ;0xd4f0:   00  "." 
    CALL 0x2ccb                       ;0xd4f1:   cd cb 2c  "..," 
    LD HL,0x121                       ;0xd4f4:   21 21 01  "!!."  
    NOP                               ;0xd4f7:   00  "." 
    ADD HL,DE                         ;0xd4f8:   19  "." 
    LD (HL),C                         ;0xd4f9:   71  "q" 
    INC HL                            ;0xd4fa:   23  "#" 
    LD (HL),B                         ;0xd4fb:   70  "p" 
    INC HL                            ;0xd4fc:   23  "#" 
    LD (HL),A                         ;0xd4fd:   77  "w" 
    RET                               ;0xd4fe:   c9  "." 
    LD (0x37aa),A                     ;0xd4ff:   32 aa 37  "2.7"  
    LD (HL),A                         ;0xd502:   77  "w" 
    LD D,A                            ;0xd503:   57  "W" 
    LD HL,(0x3765)                    ;0xd504:   2a 65 37  "*e7"  
    CALL 0x201d                       ;0xd507:   cd 1d 20  ".. " 
    LD E,A                            ;0xd50a:   5f  "_" 
    PUSH DE                           ;0xd50b:   d5  "." 
    CALL 0x1d33                       ;0xd50c:   cd 33 1d  ".3." 
    POP HL                            ;0xd50f:   e1  "." 
    JP nc, 0x1cab                     ;0xd510:   d2 ab 1c  "..." 
    DEC L                             ;0xd513:   2d  "-" 
    RET                               ;0xd514:   c9  "." 
    LD HL,0x37a4                      ;0xd515:   21 a4 37  "!.7"  
    LD (HL),E                         ;0xd518:   73  "s" 
    LD A,(0x37a4)                     ;0xd519:   3a a4 37  ":.7"  
    LD HL,0x37a9                      ;0xd51c:   21 a9 37  "!.7"  
    CP (HL)                           ;0xd51f:   be  "." 
    JP nz, 0x2d78                     ;0xd520:   c2 78 2d  ".x-" 
    CP 0xff                           ;0xd523:   fe ff  ".." 
    RET nz                            ;0xd525:   c0  "." 
    CALL 0x2d51                       ;0xd526:   cd 51 2d  ".Q-" 
    RET z                             ;0xd529:   c8  "." 
    CALL 0x22e8                       ;0xd52a:   cd e8 22  ".."" 
    LD HL,(0x3a26)                    ;0xd52d:   2a 26 3a  "*&:"  
    SBC A,A                           ;0xd530:   9f  "." 
    INC E                             ;0xd531:   1c  "." 
    INC A                             ;0xd532:   3c  "<" 
    JP nz, 0x2c9c                     ;0xd533:   c2 9c 2c  "..," 
    POP DE                            ;0xd536:   d1  "." 
    POP HL                            ;0xd537:   e1  "." 
    POP BC                            ;0xd538:   c1  "." 
    PUSH BC                           ;0xd539:   c5  "." 
    PUSH HL                           ;0xd53a:   e5  "." 
    PUSH DE                           ;0xd53b:   d5  "." 
    LD L,4                            ;0xd53c:   2e 04  ".."  
    INC C                             ;0xd53e:   0c  "." 
    JP z, 0x2ca9                      ;0xd53f:   ca a9 2c  "..," 
    CALL 0x2816                       ;0xd542:   cd 16 28  "..(" 
    LD L,5                            ;0xd545:   2e 05  ".."  
    JP z, 0x2ca9                      ;0xd547:   ca a9 2c  "..," 
    POP BC                            ;0xd54a:   c1  "." 
    POP BC                            ;0xd54b:   c1  "." 
    CALL 0x2141                       ;0xd54c:   cd 41 21  ".A!" 
    CALL 0x1cdc                       ;0xd54f:   cd dc 1c  "..." 
    POP BC                            ;0xd552:   c1  "." 
    XOR A                             ;0xd553:   af  "." 
    JP 0x1972                         ;0xd554:   c3 72 19  ".r." 
    POP DE                            ;0xd557:   d1  "." 
    EX (SP),HL                        ;0xd558:   e3  "." 
    LD (HL),D                         ;0xd559:   72  "r" 
    INC HL                            ;0xd55a:   23  "#" 
    INC HL                            ;0xd55b:   23  "#" 
    LD (HL),E                         ;0xd55c:   73  "s" 
    POP HL                            ;0xd55d:   e1  "." 
    CALL 0x1cdc                       ;0xd55e:   cd dc 1c  "..." 
    INC A                             ;0xd561:   3c  "<" 
    POP BC                            ;0xd562:   c1  "." 
    LD A,L                            ;0xd563:   7d  "}" 
    JP 0x1972                         ;0xd564:   c3 72 19  ".r." 
    LD C,0xff                         ;0xd567:   0e ff  ".."  
    CALL 0x2be4                       ;0xd569:   cd e4 2b  "..+" 
    CALL z, 0x28f5                    ;0xd56c:   cc f5 28  "..(" 
    RET                               ;0xd56f:   c9  "." 
    LD C,1                            ;0xd570:   0e 01  ".."  
    NOP                               ;0xd572:   00  "." 
    CALL 0x2be4                       ;0xd573:   cd e4 2b  "..+" 
    CALL z, 0x2a63                    ;0xd576:   cc 63 2a  ".c*" 
    RET                               ;0xd579:   c9  "." 
    EX DE,HL                          ;0xd57a:   eb  "." 
    ADD HL,DE                         ;0xd57b:   19  "." 
    LD C,(HL)                         ;0xd57c:   4e  "N" 
    LD B,1                            ;0xd57d:   06 01  ".."  
    NOP                               ;0xd57f:   00  "." 
    LD HL,0x10c                       ;0xd580:   21 0c 01  "!.."  
    NOP                               ;0xd583:   00  "." 
    ADD HL,DE                         ;0xd584:   19  "." 
    LD A,(HL)                         ;0xd585:   7e  "~" 
    RRCA                              ;0xd586:   0f  "." 
    AND 0x80                          ;0xd587:   e6 80  ".." 
    ADD A,C                           ;0xd589:   81  "." 
    LD C,A                            ;0xd58a:   4f  "O" 
    LD A,1                            ;0xd58b:   3e 01  ">."  
    NOP                               ;0xd58d:   00  "." 
    ADC A,B                           ;0xd58e:   88  "." 
    LD B,A                            ;0xd58f:   47  "G" 
    LD A,(HL)                         ;0xd590:   7e  "~" 
    RRCA                              ;0xd591:   0f  "." 
    AND 15                            ;0xd592:   e6 0f  ".." 
    ADD A,B                           ;0xd594:   80  "." 
    LD B,A                            ;0xd595:   47  "G" 
    LD HL,0x10e                       ;0xd596:   21 0e 01  "!.."  
    NOP                               ;0xd599:   00  "." 
    ADD HL,DE                         ;0xd59a:   19  "." 
    LD A,(HL)                         ;0xd59b:   7e  "~" 
    ADD A,A                           ;0xd59c:   87  "." 
    ADD A,A                           ;0xd59d:   87  "." 
    ADD A,A                           ;0xd59e:   87  "." 
    ADD A,A                           ;0xd59f:   87  "." 
    OR A                              ;0xd5a0:   b7  "." 
    ADD A,B                           ;0xd5a1:   80  "." 
    LD B,A                            ;0xd5a2:   47  "G" 
    PUSH AF                           ;0xd5a3:   f5  "." 
    LD A,(HL)                         ;0xd5a4:   7e  "~" 
    RRA                               ;0xd5a5:   1f  "." 
    RRA                               ;0xd5a6:   1f  "." 
    RRA                               ;0xd5a7:   1f  "." 
    RRA                               ;0xd5a8:   1f  "." 
    AND 3                             ;0xd5a9:   e6 03  ".." 
    LD L,A                            ;0xd5ab:   6f  "o" 
    POP AF                            ;0xd5ac:   f1  "." 
    LD A,1                            ;0xd5ad:   3e 01  ">."  
    NOP                               ;0xd5af:   00  "." 
    ADC A,L                           ;0xd5b0:   8d  "." 
    RET                               ;0xd5b1:   c9  "." 
    LD E,A                            ;0xd5b2:   5f  "_" 
    LD A,C                            ;0xd5b3:   79  "y" 
    RRCA                              ;0xd5b4:   0f  "." 
    RRCA                              ;0xd5b5:   0f  "." 
    LD B,A                            ;0xd5b6:   47  "G" 
    LD A,(HL)                         ;0xd5b7:   7e  "~" 
    AND 0xfc                          ;0xd5b8:   e6 fc  ".." 
    POP HL                            ;0xd5ba:   e1  "." 
    LD L,6                            ;0xd5bb:   2e 06  ".."  
    LD A,H                            ;0xd5bd:   7c  "|" 
    JP nz, 0x2cb0                     ;0xd5be:   c2 b0 2c  "..," 
    LD HL,0x120                       ;0xd5c1:   21 20 01  "! ."  
    NOP                               ;0xd5c4:   00  "." 
    ADD HL,DE                         ;0xd5c5:   19  "." 
    LD (HL),A                         ;0xd5c6:   77  "w" 
    LD A,(D_FBDF)                     ;0xd5c7:   3a df fb  ":.."  
    CP 0x63                           ;0xd5ca:   fe 63  ".c" 
    JP z, 0x2c6b                      ;0xd5cc:   ca 6b 2c  ".k," 
    PUSH DE                           ;0xd5cf:   d5  "." 
    CALL 0x21e8                       ;0xd5d0:   cd e8 21  "..!" 
    POP DE                            ;0xd5d3:   d1  "." 
    JP z, 0x2c5b                      ;0xd5d4:   ca 5b 2c  ".[," 
    LD HL,0x10e                       ;0xd5d7:   21 0e 01  "!.."  
    NOP                               ;0xd5da:   00  "." 
    ADD HL,DE                         ;0xd5db:   19  "." 
    LD A,B                            ;0xd5dc:   78  "x" 
    SUB (HL)                          ;0xd5dd:   96  "." 
    AND 0x3f                          ;0xd5de:   e6 3f  ".?" 
    JP nz, 0x2c5b                     ;0xd5e0:   c2 5b 2c  ".[," 
    LD HL,0x10c                       ;0xd5e3:   21 0c 01  "!.."  
    NOP                               ;0xd5e6:   00  "." 
    ADD HL,DE                         ;0xd5e7:   19  "." 
    LD A,(HL)                         ;0xd5e8:   7e  "~" 
    CP C                              ;0xd5e9:   b9  "." 
    JP z, 0x2ca4                      ;0xd5ea:   ca a4 2c  "..," 
    CALL 0x2386                       ;0xd5ed:   cd 86 23  "..#" 
    JP nz, 0x2c5b                     ;0xd5f0:   c2 5b 2c  ".[," 
    PUSH BC                           ;0xd5f3:   c5  "." 
    CALL 0x2397                       ;0xd5f4:   cd 97 23  "..#" 
    POP BC                            ;0xd5f7:   c1  "." 
    CP C                              ;0xd5f8:   b9  "." 
    JP nc, 0x2c50                     ;0xd5f9:   d2 50 2c  ".P," 
    POP DE                            ;0xd5fc:   d1  "." 
    PUSH DE                           ;0xd5fd:   d5  "." 
    INC E                             ;0xd5fe:   1c  "." 
    JP nz, 0x2c50                     ;0xd5ff:   c2 50 2c  ".P," 
    INC E                             ;0xd602:   1c  "." 
    POP DE                            ;0xd603:   d1  "." 
    JP 0x1976                         ;0xd604:   c3 76 19  ".v." 
    LD (HL),C                         ;0xd607:   71  "q" 
    LD C,A                            ;0xd608:   4f  "O" 
    CALL 0x272d                       ;0xd609:   cd 2d 27  ".-'" 
    CALL 0x26fd                       ;0xd60c:   cd fd 26  "..&" 
    JP 0x2ca1                         ;0xd60f:   c3 a1 2c  "..," 
    PUSH BC                           ;0xd612:   c5  "." 
    PUSH DE                           ;0xd613:   d5  "." 
    CALL 0x273d                       ;0xd614:   cd 3d 27  ".='" 
    POP DE                            ;0xd617:   d1  "." 
    POP BC                            ;0xd618:   c1  "." 
    LD L,3                            ;0xd619:   2e 03  ".."  
    LD A,(0x1c9f)                     ;0xd61b:   3a 9f 1c  ":.."  
    INC A                             ;0xd61e:   3c  "<" 
    JP z, 0x2cb0                      ;0xd61f:   ca b0 2c  "..," 
    CALL 0x2803                       ;0xd622:   cd 03 28  "..(" 
    LD HL,0x10c                       ;0xd625:   21 0c 01  "!.."  
    NOP                               ;0xd628:   00  "." 
    ADD HL,DE                         ;0xd629:   19  "." 
    PUSH HL                           ;0xd62a:   e5  "." 
    LD D,(HL)                         ;0xd62b:   56  "V" 
    LD (HL),C                         ;0xd62c:   71  "q" 
    INC HL                            ;0xd62d:   23  "#" 
    INC HL                            ;0xd62e:   23  "#" 
    LD A,(HL)                         ;0xd62f:   7e  "~" 
    LD E,A                            ;0xd630:   5f  "_" 
    PUSH DE                           ;0xd631:   d5  "." 
    AND 0x40                          ;0xd632:   e6 40  ".@" 
    OR B                              ;0xd634:   b0  "." 
    LD (HL),A                         ;0xd635:   77  "w" 
    CALL 0x37da                       ;0xd636:   cd da 37  "..7" 
    CALL 0x21b6                       ;0xd639:   cd b6 21  "..!" 
    POP DE                            ;0xd63c:   d1  "." 
    LD A,(0x37a8)                     ;0xd63d:   3a a8 37  ":.7"  
    LD D,A                            ;0xd640:   57  "W" 
    PUSH DE                           ;0xd641:   d5  "." 
    CALL 0x294d                       ;0xd642:   cd 4d 29  ".M)" 
    JP c, 0x2bba                      ;0xd645:   da ba 2b  "..+" 
    JP z, 0x2b9b                      ;0xd648:   ca 9b 2b  "..+" 
    LD A,2                            ;0xd64b:   3e 02  ">."  
    CALL 0x37ff                       ;0xd64d:   cd ff 37  "..7" 
    JP 0x2bba                         ;0xd650:   c3 ba 2b  "..+" 
    CALL 0x21b6                       ;0xd653:   cd b6 21  "..!" 
    CALL 0x1e0c                       ;0xd656:   cd 0c 1e  "..." 
    LD A,1                            ;0xd659:   3e 01  ">."  
    CALL C_FC54                       ;0xd65b:   cd 54 fc  ".T." 
    CALL 0x214a                       ;0xd65e:   cd 4a 21  ".J!" 
    POP BC                            ;0xd661:   c1  "." 
    PUSH BC                           ;0xd662:   c5  "." 
    LD A,(0x37ab)                     ;0xd663:   3a ab 37  ":.7"  
    LD HL,0x3783                      ;0xd666:   21 83 37  "!.7"  
    AND (HL)                          ;0xd669:   a6  "." 
    JP z, 0x2bb7                      ;0xd66a:   ca b7 2b  "..+" 
    LD C,1                            ;0xd66d:   0e 01  ".."  
    NOP                               ;0xd66f:   00  "." 
    CALL 0x1d9e                       ;0xd670:   cd 9e 1d  "..." 
    POP BC                            ;0xd673:   c1  "." 
    LD A,B                            ;0xd674:   78  "x" 
    LD HL,0x37a5                      ;0xd675:   21 a5 37  "!.7"  
    CP (HL)                           ;0xd678:   be  "." 
    JP c, 0x2bc7                      ;0xd679:   da c7 2b  "..+" 
    LD (HL),A                         ;0xd67c:   77  "w" 
    INC (HL)                          ;0xd67d:   34  "4" 
    LD C,2                            ;0xd67e:   0e 02  ".."  
    DEC C                             ;0xd680:   0d  "." 
    DEC C                             ;0xd681:   0d  "." 
    JP nz, 0x2bcf                     ;0xd682:   c2 cf 2b  "..+" 
    CALL 0x2a50                       ;0xd685:   cd 50 2a  ".P*" 
    CALL 0x2a57                       ;0xd688:   cd 57 2a  ".W*" 
    JP nz, 0x2bde                     ;0xd68b:   c2 de 2b  "..+" 
    CALL 0x2a50                       ;0xd68e:   cd 50 2a  ".P*" 
    CALL 0x1cdc                       ;0xd691:   cd dc 1c  "..." 
    JP 0x1f82                         ;0xd694:   c3 82 1f  "..." 
    CALL 0x1cd5                       ;0xd697:   cd d5 1c  "..." 
    JP 0x1f82                         ;0xd69a:   c3 82 1f  "..." 
    PUSH BC                           ;0xd69d:   c5  "." 
    LD HL,(D_FBDB)                    ;0xd69e:   2a db fb  "*.."  
    EX DE,HL                          ;0xd6a1:   eb  "." 
    LD HL,0x121                       ;0xd6a2:   21 21 01  "!!."  
    NOP                               ;0xd6a5:   00  "." 
    ADD HL,DE                         ;0xd6a6:   19  "." 
    LD A,(HL)                         ;0xd6a7:   7e  "~" 
    AND 0x7f                          ;0xd6a8:   e6 7f  ".." 
    PUSH AF                           ;0xd6aa:   f5  "." 
    LD A,(HL)                         ;0xd6ab:   7e  "~" 
    RLA                               ;0xd6ac:   17  "." 
    INC HL                            ;0xd6ad:   23  "#" 
    LD A,(HL)                         ;0xd6ae:   7e  "~" 
    RLA                               ;0xd6af:   17  "." 
    AND 0x1f                          ;0xd6b0:   e6 1f  ".." 
    LD C,A                            ;0xd6b2:   4f  "O" 
    LD A,(HL)                         ;0xd6b3:   7e  "~" 
    AND 0xf0                          ;0xd6b4:   e6 f0  ".." 
    INC HL                            ;0xd6b6:   23  "#" 
    OR (HL)                           ;0xd6b7:   b6  "." 
    RRCA                              ;0xd6b8:   0f  "." 
    RRCA                              ;0xd6b9:   0f  "." 
    CALL 0x2046                       ;0xd6ba:   cd 46 20  ".F " 
    LD (HL),E                         ;0xd6bd:   73  "s" 
    JP 0x2b0f                         ;0xd6be:   c3 0f 2b  "..+" 
    LD C,A                            ;0xd6c1:   4f  "O" 
    LD B,1                            ;0xd6c2:   06 01  ".."  
    NOP                               ;0xd6c4:   00  "." 
    ADD HL,BC                         ;0xd6c5:   09  "." 
    ADD HL,BC                         ;0xd6c6:   09  "." 
    LD (HL),E                         ;0xd6c7:   73  "s" 
    INC HL                            ;0xd6c8:   23  "#" 
    LD (HL),D                         ;0xd6c9:   72  "r" 
    LD C,2                            ;0xd6ca:   0e 02  ".."  
    PUSH BC                           ;0xd6cc:   c5  "." 
    CALL 0x1ef2                       ;0xd6cd:   cd f2 1e  "..." 
    LD A,(D_FBDF)                     ;0xd6d0:   3a df fb  ":.."  
    CP 0x28                           ;0xd6d3:   fe 28  ".(" 
;--------------------------------------
C_D6D5:                               ; XREF: 0xFDFF 
    JP nz, 0x2b84                     ;0xd6d5:   c2 84 2b  "..+" 
    LD A,C                            ;0xd6d8:   79  "y" 
    DEC A                             ;0xd6d9:   3d  "=" 
    DEC A                             ;0xd6da:   3d  "=" 
    JP nz, 0x2b84                     ;0xd6db:   c2 84 2b  "..+" 
    POP BC                            ;0xd6de:   c1  "." 
    PUSH AF                           ;0xd6df:   f5  "." 
    LD HL,(0x37ab)                    ;0xd6e0:   2a ab 37  "*.7"  
    PUSH HL                           ;0xd6e3:   e5  "." 
    LD HL,0x3790                      ;0xd6e4:   21 90 37  "!.7"  
    LD E,(HL)                         ;0xd6e7:   5e  "^" 
    INC E                             ;0xd6e8:   1c  "." 
    LD D,A                            ;0xd6e9:   57  "W" 
    PUSH DE                           ;0xd6ea:   d5  "." 
    LD HL,(0x3779)                    ;0xd6eb:   2a 79 37  "*y7"  
    LD E,(HL)                         ;0xd6ee:   5e  "^" 
    INC HL                            ;0xd6ef:   23  "#" 
    LD D,(HL)                         ;0xd6f0:   56  "V" 
    EX DE,HL                          ;0xd6f1:   eb  "." 
    PUSH HL                           ;0xd6f2:   e5  "." 
    CALL 0x3a78                       ;0xd6f3:   cd 78 3a  ".x:" 
    POP DE                            ;0xd6f6:   d1  "." 
    JP nz, 0x2b37                     ;0xd6f7:   c2 37 2b  ".7+" 
    EX DE,HL                          ;0xd6fa:   eb  "." 
    DEC A                             ;0xd6fb:   3d  "=" 
    LD (0x3794),A                     ;0xd6fc:   32 94 37  "2.7"  
    LD (HL),A                         ;0xd6ff:   77  "w" 
    CALL 0x21bc                       ;0xd700:   cd bc 21  "..!" 
    POP DE                            ;0xd703:   d1  "." 
    PUSH DE                           ;0xd704:   d5  "." 
    XOR A                             ;0xd705:   af  "." 
    LD (HL),A                         ;0xd706:   77  "w" 
    INC HL                            ;0xd707:   23  "#" 
    INC D                             ;0xd708:   14  "." 
    JP p, 0x2b4b                      ;0xd709:   f2 4b 2b  ".K+" 
    LD D,A                            ;0xd70c:   57  "W" 
;--------------------------------------
C_D70D:                               ; XREF: 0xD73E 
    DEC E                             ;0xd70d:   1d  "." 
    JP nz, 0x2b4b                     ;0xd70e:   c2 4b 2b  ".K+" 
    LD HL,(0x37b1)                    ;0xd711:   2a b1 37  "*.7"  
    LD C,2                            ;0xd714:   0e 02  ".."  
    LD (0x37ab),HL                    ;0xd716:   22 ab 37  "".7"  
    PUSH BC                           ;0xd719:   c5  "." 
    CALL 0x214a                       ;0xd71a:   cd 4a 21  ".J!" 
    CALL 0x1e0c                       ;0xd71d:   cd 0c 1e  "..." 
    XOR A                             ;0xd720:   af  "." 
    CALL C_FC54                       ;0xd721:   cd 54 fc  ".T." 
    POP BC                            ;0xd724:   c1  "." 
    CALL 0x1d9e                       ;0xd725:   cd 9e 1d  "..." 
    LD HL,(0x37ab)                    ;0xd728:   2a ab 37  "*.7"  
    POP DE                            ;0xd72b:   d1  "." 
    PUSH DE                           ;0xd72c:   d5  "." 
    ADD HL,DE                         ;0xd72d:   19  "." 
    LD A,(0x3783)                     ;0xd72e:   3a 83 37  ":.7"  
    AND L                             ;0xd731:   a5  "." 
    LD C,1                            ;0xd732:   0e 01  ".."  
    NOP                               ;0xd734:   00  "." 
    JP nz, 0x2b5b                     ;0xd735:   c2 5b 2b  ".[+" 
    POP HL                            ;0xd738:   e1  "." 
    POP HL                            ;0xd739:   e1  "." 
    LD (D_CDAB),HL                    ;0xd73a:   22 ab cd  "".."  
    DEC HL                            ;0xd73d:   2b  "+" 
    JR nz, C_D70D                     ;0xd73e:   20 cd  " ." 
    XOR 0x21                          ;0xd740:   ee 21  ".!" 
    CALL 0x3053                       ;0xd742:   cd 53 30  ".S0" 
    CALL 0x1f58                       ;0xd745:   cd 58 1f  ".X." 
    LD A,(0x37a8)                     ;0xd748:   3a a8 37  ":.7"  
    CP 0x80                           ;0xd74b:   fe 80  ".." 
    JP c, 0x2a9c                      ;0xd74d:   da 9c 2a  "..*" 
    CALL 0x2871                       ;0xd750:   cd 71 28  ".q(" 
    LD A,(0x1c9f)                     ;0xd753:   3a 9f 1c  ":.."  
    OR A                              ;0xd756:   b7  "." 
    RET nz                            ;0xd757:   c0  "." 
    CALL 0x1ee0                       ;0xd758:   cd e0 1e  "..." 
    JP z, 0x2aba                      ;0xd75b:   ca ba 2a  "..*" 
    LD HL,0x37aa                      ;0xd75e:   21 aa 37  "!.7"  
    LD DE,0x3795                      ;0xd761:   11 95 37  "..7"  
    LD C,3                            ;0xd764:   0e 03  ".."  
    CALL 0x1d1f                       ;0xd766:   cd 1f 1d  "..." 
    JP z, 0x2ab5                      ;0xd769:   ca b5 2a  "..*" 
    LD A,0xff                         ;0xd76c:   3e ff  ">."  
    LD (0x3794),A                     ;0xd76e:   32 94 37  "2.7"  
    LD C,1                            ;0xd771:   0e 01  ".."  
    NOP                               ;0xd773:   00  "." 
    JP 0x2b11                         ;0xd774:   c3 11 2b  "..+" 
    CALL 0x1cdc                       ;0xd777:   cd dc 1c  "..." 
    CALL 0x1ea4                       ;0xd77a:   cd a4 1e  "..." 
    LD (0x379f),A                     ;0xd77d:   32 9f 37  "2.7"  
    LD BC,2                           ;0xd780:   01 02 00  "..."  
    OR A                              ;0xd783:   b7  "." 
    JP z, 0x2ad1                      ;0xd784:   ca d1 2a  "..*" 
    LD C,A                            ;0xd787:   4f  "O" 
    DEC BC                            ;0xd788:   0b  "." 
    CALL 0x1ecc                       ;0xd789:   cd cc 1e  "..." 
    LD B,H                            ;0xd78c:   44  "D" 
    LD C,L                            ;0xd78d:   4d  "M" 
    CALL 0x25b8                       ;0xd78e:   cd b8 25  "..%" 
    LD A,L                            ;0xd791:   7d  "}" 
    OR H                              ;0xd792:   b4  "." 
    JP nz, 0x2ade                     ;0xd793:   c2 de 2a  "..*" 
    LD A,2                            ;0xd796:   3e 02  ">."  
    JP 0x1972                         ;0xd798:   c3 72 19  ".r." 
    LD (0x37ab),HL                    ;0xd79b:   22 ab 37  "".7"  
    LD (0x3796),HL                    ;0xd79e:   22 96 37  "".7"  
    XOR A                             ;0xd7a1:   af  "." 
    LD (0x3794),A                     ;0xd7a2:   32 94 37  "2.7"  
    LD A,(0x37aa)                     ;0xd7a5:   3a aa 37  ":.7"  
    LD (0x3795),A                     ;0xd7a8:   32 95 37  "2.7"  
    EX DE,HL                          ;0xd7ab:   eb  "." 
    LD HL,(D_FBDB)                    ;0xd7ac:   2a db fb  "*.."  
    LD BC,0x110                       ;0xd7af:   01 10 01  "..."  
    NOP                               ;0xd7b2:   00  "." 
    ADD HL,BC                         ;0xd7b3:   09  "." 
    LD A,(0x37a3)                     ;0xd7b4:   3a a3 37  ":.7"  
    OR A                              ;0xd7b7:   b7  "." 
    LD A,(0x379f)                     ;0xd7b8:   3a 9f 37  ":.7"  
    JP z, 0x2b07                      ;0xd7bb:   ca 07 2b  "..+" 
    LD A,(0x3783)                     ;0xd7be:   3a 83 37  ":.7"  
    INC A                             ;0xd7c1:   3c  "<" 
    LD C,A                            ;0xd7c2:   4f  "O" 
    DEC B                             ;0xd7c3:   05  "." 
    JP z, 0x2a0d                      ;0xd7c4:   ca 0d 2a  "..*" 
    ADD A,C                           ;0xd7c7:   81  "." 
    JP 0x2a05                         ;0xd7c8:   c3 05 2a  "..*" 
    POP BC                            ;0xd7cb:   c1  "." 
    LD B,C                            ;0xd7cc:   41  "A" 
    LD C,A                            ;0xd7cd:   4f  "O" 
    LD A,(0x379c)                     ;0xd7ce:   3a 9c 37  ":.7"  
    OR A                              ;0xd7d1:   b7  "." 
    JP z, 0x2a1c                      ;0xd7d2:   ca 1c 2a  "..*" 
    LD A,B                            ;0xd7d5:   78  "x" 
    CP C                              ;0xd7d6:   b9  "." 
    JP c, 0x2a1d                      ;0xd7d7:   da 1d 2a  "..*" 
    LD A,C                            ;0xd7da:   79  "y" 
    POP HL                            ;0xd7db:   e1  "." 
    POP BC                            ;0xd7dc:   c1  "." 
    LD (HL),B                         ;0xd7dd:   70  "p" 
    POP BC                            ;0xd7de:   c1  "." 
    LD HL,0x3799                      ;0xd7df:   21 99 37  "!.7"  
    LD D,(HL)                         ;0xd7e2:   56  "V" 
    SUB B                             ;0xd7e3:   90  "." 
    CP D                              ;0xd7e4:   ba  "." 
    JP nc, 0x2a2b                     ;0xd7e5:   d2 2b 2a  ".+*" 
    LD D,A                            ;0xd7e8:   57  "W" 
    LD A,C                            ;0xd7e9:   79  "y" 
    CPL                               ;0xd7ea:   2f  "/" 
    AND D                             ;0xd7eb:   a2  "." 
    LD (0x3798),A                     ;0xd7ec:   32 98 37  "2.7"  
    JP z, 0x296f                      ;0xd7ef:   ca 6f 29  ".o)" 
    PUSH AF                           ;0xd7f2:   f5  "." 
    LD A,(0x379c)                     ;0xd7f3:   3a 9c 37  ":.7"  
    OR A                              ;0xd7f6:   b7  "." 
    JP z, 0x2a42                      ;0xd7f7:   ca 42 2a  ".B*" 
    CALL 0x3420                       ;0xd7fa:   cd 20 34  ". 4" 
    CALL 0x21b6                       ;0xd7fd:   cd b6 21  "..!" 
    POP AF                            ;0xd800:   f1  "." 
    LD H,A                            ;0xd801:   67  "g" 
    CALL 0x1e9d                       ;0xd802:   cd 9d 1e  "..." 
    LD A,H                            ;0xd805:   7c  "|" 
    CP 1                              ;0xd806:   fe 01  ".." 
    LD C,A                            ;0xd808:   4f  "O" 
    CALL nz, C_FC45                   ;0xd809:   c4 45 fc  ".E." 
    XOR A                             ;0xd80c:   af  "." 
    RET                               ;0xd80d:   c9  "." 
    CALL 0x204b                       ;0xd80e:   cd 4b 20  ".K " 
    AND 0x7f                          ;0xd811:   e6 7f  ".." 
    LD (HL),A                         ;0xd813:   77  "w" 
    RET                               ;0xd814:   c9  "." 
    CALL 0x204b                       ;0xd815:   cd 4b 20  ".K " 
    AND 0x40                          ;0xd818:   e6 40  ".@" 
    PUSH AF                           ;0xd81a:   f5  "." 
    LD A,(HL)                         ;0xd81b:   7e  "~" 
    OR 0x40                           ;0xd81c:   f6 40  ".@" 
    LD (HL),A                         ;0xd81e:   77  "w" 
    POP AF                            ;0xd81f:   f1  "." 
    RET                               ;0xd820:   c9  "." 
    LD A,1                            ;0xd821:   3e 01  ">."  
    NOP                               ;0xd823:   00  "." 
    LD (0x379c),A                     ;0xd824:   32 9c 37  "2.7"  
    CALL 0x2039                       ;0xd827:   cd 39 20  ".9 " 
    LD A,(0x37b6)                     ;0xd82a:   3a b6 37  ":.7"  
    OR A                              ;0xd82d:   b7  "." 
    LD A,3                            ;0xd82e:   3e 03  ">."  
    JP nz, 0x32e5                     ;0xd830:   c2 e5 32  "..2" 
    LD A,(0x37b5)                     ;0xd833:   3a b5 37  ":.7"  
    OR A                              ;0xd836:   b7  "." 
    LD A,3                            ;0xd837:   3e 03  ">."  
    JP nz, 0x32e5                     ;0xd839:   c2 e5 32  "..2" 
    LD HL,(D_FBDB)                    ;0xd83c:   2a db fb  "*.."  
    ADD A,(HL)                        ;0xd83f:   86  "." 
    CP 0x80                           ;0xd840:   fe 80  ".." 
    JP c, 0x2988                      ;0xd842:   da 88 29  "..)" 
    LD A,0x80                         ;0xd845:   3e 80  ">."  
    PUSH BC                           ;0xd847:   c5  "." 
    LD B,(HL)                         ;0xd848:   46  "F" 
    LD (HL),0x7f                      ;0xd849:   36 7f  "6."  
    PUSH BC                           ;0xd84b:   c5  "." 
    PUSH HL                           ;0xd84c:   e5  "." 
    PUSH AF                           ;0xd84d:   f5  "." 
    LD A,(0x3783)                     ;0xd84e:   3a 83 37  ":.7"  
    LD E,A                            ;0xd851:   5f  "_" 
    INC E                             ;0xd852:   1c  "." 
    CPL                               ;0xd853:   2f  "/" 
    AND B                             ;0xd854:   a0  "." 
    LD B,A                            ;0xd855:   47  "G" 
    POP HL                            ;0xd856:   e1  "." 
    LD A,(0x379c)                     ;0xd857:   3a 9c 37  ":.7"  
    OR A                              ;0xd85a:   b7  "." 
    JP z, 0x29a7                      ;0xd85b:   ca a7 29  "..)" 
    LD A,(0x37a5)                     ;0xd85e:   3a a5 37  ":.7"  
    AND D                             ;0xd861:   a2  "." 
    CP H                              ;0xd862:   bc  "." 
    JP c, 0x29a8                      ;0xd863:   da a8 29  "..)" 
    LD A,H                            ;0xd866:   7c  "|" 
    SUB B                             ;0xd867:   90  "." 
    LD C,A                            ;0xd868:   4f  "O" 
    CP E                              ;0xd869:   bb  "." 
    JP c, 0x2a1c                      ;0xd86a:   da 1c 2a  "..*" 
    PUSH BC                           ;0xd86d:   c5  "." 
    CALL 0x1ea4                       ;0xd86e:   cd a4 1e  "..." 
    LD B,A                            ;0xd871:   47  "G" 
    LD A,(0x379f)                     ;0xd872:   3a 9f 37  ":.7"  
    CP B                              ;0xd875:   b8  "." 
    LD E,A                            ;0xd876:   5f  "_" 
    JP z, 0x29fd                      ;0xd877:   ca fd 29  "..)" 
    LD C,A                            ;0xd87a:   4f  "O" 
    PUSH BC                           ;0xd87b:   c5  "." 
    LD B,1                            ;0xd87c:   06 01  ".."  
    NOP                               ;0xd87e:   00  "." 
    CALL 0x1ecc                       ;0xd87f:   cd cc 1e  "..." 
    PUSH HL                           ;0xd882:   e5  "." 
    INC BC                            ;0xd883:   03  "." 
    CALL 0x1ecc                       ;0xd884:   cd cc 1e  "..." 
    POP DE                            ;0xd887:   d1  "." 
    INC DE                            ;0xd888:   13  "." 
    LD A,D                            ;0xd889:   7a  "z" 
    SUB H                             ;0xd88a:   94  "." 
    LD D,A                            ;0xd88b:   57  "W" 
    LD A,E                            ;0xd88c:   7b  "{" 
    SUB L                             ;0xd88d:   95  "." 
    OR D                              ;0xd88e:   b2  "." 
    JP z, 0x29c2                      ;0xd88f:   ca c2 29  "..)" 
    LD A,H                            ;0xd892:   7c  "|" 
    OR L                              ;0xd893:   b5  "." 
    JP nz, 0x29f5                     ;0xd894:   c2 f5 29  "..)" 
    LD A,(0x379c)                     ;0xd897:   3a 9c 37  ":.7"  
    OR A                              ;0xd89a:   b7  "." 
    JP nz, 0x29f5                     ;0xd89b:   c2 f5 29  "..)" 
    LD HL,(0x3785)                    ;0xd89e:   2a 85 37  "*.7"  
    LD A,L                            ;0xd8a1:   7d  "}" 
    SUB E                             ;0xd8a2:   93  "." 
    LD A,H                            ;0xd8a3:   7c  "|" 
    SBC A,D                           ;0xd8a4:   9a  "." 
    JP c, 0x29f5                      ;0xd8a5:   da f5 29  "..)" 
    PUSH BC                           ;0xd8a8:   c5  "." 
    PUSH DE                           ;0xd8a9:   d5  "." 
    LD B,D                            ;0xd8aa:   42  "B" 
    LD C,E                            ;0xd8ab:   4b  "K" 
    CALL 0x224e                       ;0xd8ac:   cd 4e 22  ".N"" 
    POP HL                            ;0xd8af:   e1  "." 
    POP BC                            ;0xd8b0:   c1  "." 
    RRA                               ;0xd8b1:   1f  "." 
    JP nc, 0x29c2                     ;0xd8b2:   d2 c2 29  "..)" 
    DEC C                             ;0xd8b5:   0d  "." 
    POP DE                            ;0xd8b6:   d1  "." 
    LD A,D                            ;0xd8b7:   7a  "z" 
    CP C                              ;0xd8b8:   b9  "." 
    JP c, 0x29fd                      ;0xd8b9:   da fd 29  "..)" 
    LD A,C                            ;0xd8bc:   79  "y" 
    SUB E                             ;0xd8bd:   93  "." 
    LD B,A                            ;0xd8be:   47  "G" 
    INC B                             ;0xd8bf:   04  "." 
    LD A,(0x37a8)                     ;0xd8c0:   3a a8 37  ":.7"  
    LD HL,0x37a5                      ;0xd8c3:   21 a5 37  "!.7"  
    CP (HL)                           ;0xd8c6:   be  "." 
    JP c, 0x2919                      ;0xd8c7:   da 19 29  "..)" 
    CP 0x80                           ;0xd8ca:   fe 80  ".." 
    JP nz, 0x1976                     ;0xd8cc:   c2 76 19  ".v." 
    CALL 0x2871                       ;0xd8cf:   cd 71 28  ".q(" 
    LD A,(0x1c9f)                     ;0xd8d2:   3a 9f 1c  ":.."  
    OR A                              ;0xd8d5:   b7  "." 
    JP nz, 0x1976                     ;0xd8d6:   c2 76 19  ".v." 
    CALL 0x1cd5                       ;0xd8d9:   cd d5 1c  "..." 
    CALL 0x1ee0                       ;0xd8dc:   cd e0 1e  "..." 
    JP z, 0x1976                      ;0xd8df:   ca 76 19  ".v." 
    CALL 0x1ef2                       ;0xd8e2:   cd f2 1e  "..." 
    CALL 0x294d                       ;0xd8e5:   cd 4d 29  ".M)" 
    JP c, 0x1f82                      ;0xd8e8:   da 82 1f  "..." 
    JP nz, 0x293f                     ;0xd8eb:   c2 3f 29  ".?)" 
    CALL 0x21b6                       ;0xd8ee:   cd b6 21  "..!" 
    CALL 0x1e0c                       ;0xd8f1:   cd 0c 1e  "..." 
    LD A,1                            ;0xd8f4:   3e 01  ">."  
    CALL C_FC54                       ;0xd8f6:   cd 54 fc  ".T." 
    CALL 0x1d93                       ;0xd8f9:   cd 93 1d  "..." 
    JP 0x1f82                         ;0xd8fc:   c3 82 1f  "..." 
    LD HL,2                           ;0xd8ff:   21 02 00  "!.."  
    LD (0x3796),HL                    ;0xd902:   22 96 37  "".7"  
    LD A,1                            ;0xd905:   3e 01  ">."  
    CALL 0x37ff                       ;0xd907:   cd ff 37  "..7" 
    JP 0x1f82                         ;0xd90a:   c3 82 1f  "..." 
    LD A,(0x3793)                     ;0xd90d:   3a 93 37  ":.7"  
    LD B,A                            ;0xd910:   47  "G" 
    LD A,(0x3790)                     ;0xd911:   3a 90 37  ":.7"  
    LD C,A                            ;0xd914:   4f  "O" 
    AND B                             ;0xd915:   a0  "." 
    PUSH AF                           ;0xd916:   f5  "." 
    LD A,(0x3798)                     ;0xd917:   3a 98 37  ":.7"  
    CP 2                              ;0xd91a:   fe 02  ".." 
    JP c, 0x2968                      ;0xd91c:   da 68 29  ".h)" 
    DEC A                             ;0xd91f:   3d  "=" 
    LD (0x3798),A                     ;0xd920:   32 98 37  "2.7"  
    POP AF                            ;0xd923:   f1  "." 
    SCF                               ;0xd924:   37  "7" 
    RET nz                            ;0xd925:   c0  "." 
    XOR A                             ;0xd926:   af  "." 
    RET                               ;0xd927:   c9  "." 
    POP AF                            ;0xd928:   f1  "." 
    JP z, 0x2972                      ;0xd929:   ca 72 29  ".r)" 
    LD A,C                            ;0xd92c:   79  "y" 
    OR A                              ;0xd92d:   b7  "." 
    RET z                             ;0xd92e:   c8  "." 
    OR 1                              ;0xd92f:   f6 01  ".." 
    RET                               ;0xd931:   c9  "." 
    LD A,C                            ;0xd932:   79  "y" 
    CPL                               ;0xd933:   2f  "/" 
    LD D,A                            ;0xd934:   57  "W" 
    LD HL,0x37a8                      ;0xd935:   21 a8 37  "!.7"  
    LD A,(0x3799)                     ;0xd938:   3a 99 37  ":.7"  
    CP 2                              ;0xd93b:   fe 02  ".." 
    JP c, 0x296c                      ;0xd93d:   da 6c 29  ".l)" 
    PUSH HL                           ;0xd940:   e5  "." 
    PUSH BC                           ;0xd941:   c5  "." 
    CALL 0x273d                       ;0xd942:   cd 3d 27  ".='" 
    POP BC                            ;0xd945:   c1  "." 
    POP HL                            ;0xd946:   e1  "." 
    LD A,(0x1c9f)                     ;0xd947:   3a 9f 1c  ":.."  
    INC A                             ;0xd94a:   3c  "<" 
    RET z                             ;0xd94b:   c8  "." 
    LD A,0x1f                         ;0xd94c:   3e 1f  ">."  
    AND C                             ;0xd94e:   a1  "." 
    LD (HL),A                         ;0xd94f:   77  "w" 
    INC HL                            ;0xd950:   23  "#" 
    INC HL                            ;0xd951:   23  "#" 
    LD A,(HL)                         ;0xd952:   7e  "~" 
    LD (0x37a7),A                     ;0xd953:   32 a7 37  "2.7"  
    JP nz, 0x28a0                     ;0xd956:   c2 a0 28  "..(" 
    INC (HL)                          ;0xd959:   34  "4" 
    LD A,(HL)                         ;0xd95a:   7e  "~" 
    AND 0x3f                          ;0xd95b:   e6 3f  ".?" 
    JP z, 0x28c9                      ;0xd95d:   ca c9 28  "..(" 
    CALL 0x2803                       ;0xd960:   cd 03 28  "..(" 
    CALL 0x3c83                       ;0xd963:   cd 83 3c  "..<" 
    JP nz, 0x28b9                     ;0xd966:   c2 b9 28  "..(" 
    LD A,(0x379c)                     ;0xd969:   3a 9c 37  ":.7"  
    INC A                             ;0xd96c:   3c  "<" 
    JP z, 0x28c9                      ;0xd96d:   ca c9 28  "..(" 
    CALL 0x2816                       ;0xd970:   cd 16 28  "..(" 
    JP z, 0x28c9                      ;0xd973:   ca c9 28  "..(" 
    JP 0x28bc                         ;0xd976:   c3 bc 28  "..(" 
    CALL 0x26de                       ;0xd979:   cd de 26  "..&" 
    CALL 0x2141                       ;0xd97c:   cd 41 21  ".A!" 
    CALL 0x1f58                       ;0xd97f:   cd 58 1f  ".X." 
    XOR A                             ;0xd982:   af  "." 
    LD (0x37a8),A                     ;0xd983:   32 a8 37  "2.7"  
    JP 0x1972                         ;0xd986:   c3 72 19  ".r." 
    CALL 0x204b                       ;0xd989:   cd 4b 20  ".K " 
    LD A,(0x37a7)                     ;0xd98c:   3a a7 37  ":.7"  
    LD (HL),A                         ;0xd98f:   77  "w" 
    DEC HL                            ;0xd990:   2b  "+" 
    DEC HL                            ;0xd991:   2b  "+" 
    LD A,(HL)                         ;0xd992:   7e  "~" 
    DEC A                             ;0xd993:   3d  "=" 
    AND 0x1f                          ;0xd994:   e6 1f  ".." 
    LD (HL),A                         ;0xd996:   77  "w" 
    JP 0x1976                         ;0xd997:   c3 76 19  ".v." 
    INC (HL)                          ;0xd99a:   34  "4" 
    CALL 0x2397                       ;0xd99b:   cd 97 23  "..#" 
    LD C,A                            ;0xd99e:   4f  "O" 
    CP (HL)                           ;0xd99f:   be  "." 
    JP nc, 0x28ec                     ;0xd9a0:   d2 ec 28  "..(" 
    DEC (HL)                          ;0xd9a3:   35  "5" 
    LD A,(0x379c)                     ;0xd9a4:   3a 9c 37  ":.7"  
    INC A                             ;0xd9a7:   3c  "<" 
    JP z, 0x1976                      ;0xd9a8:   ca 76 19  ".v." 
    INC (HL)                          ;0xd9ab:   34  "4" 
    CALL 0x272d                       ;0xd9ac:   cd 2d 27  ".-'" 
    CALL 0x26fd                       ;0xd9af:   cd fd 26  "..&" 
    JP 0x28bc                         ;0xd9b2:   c3 bc 28  "..(" 
    CALL 0x21ee                       ;0xd9b5:   cd ee 21  "..!" 
    LD A,0xff                         ;0xd9b8:   3e ff  ">."  
    LD (0x379c),A                     ;0xd9ba:   32 9c 37  "2.7"  
    CALL 0x1f58                       ;0xd9bd:   cd 58 1f  ".X." 
    RET nz                            ;0xd9c0:   c0  "." 
    INC B                             ;0xd9c1:   04  "." 
    RET                               ;0xd9c2:   c9  "." 
    LD HL,D_FFFF                      ;0xd9c3:   21 ff ff  "!.."  
    LD (D_F617),HL                    ;0xd9c6:   22 17 f6  "".."  
    RET                               ;0xd9c9:   c9  "." 
    LD HL,(D_F617)                    ;0xd9ca:   2a 17 f6  "*.."  
    LD A,0xfc                         ;0xd9cd:   3e fc  ">."  
    AND L                             ;0xd9cf:   a5  "." 
    LD L,A                            ;0xd9d0:   6f  "o" 
    DEC HL                            ;0xd9d1:   2b  "+" 
    LD (D_FBE1),HL                    ;0xd9d2:   22 e1 fb  "".."  
    RET                               ;0xd9d5:   c9  "." 
    CALL 0x3c76                       ;0xd9d6:   cd 76 3c  ".v<" 
    CALL 0x21fb                       ;0xd9d9:   cd fb 21  "..!" 
    CALL nz, 0x280a                   ;0xd9dc:   c4 0a 28  "..(" 
    LD HL,(D_FBDB)                    ;0xd9df:   2a db fb  "*.."  
    PUSH HL                           ;0xd9e2:   e5  "." 
    LD HL,0x3762                      ;0xd9e3:   21 62 37  "!b7"  
    LD (D_FBDB),HL                    ;0xd9e6:   22 db fb  "".."  
    LD C,1                            ;0xd9e9:   0e 01  ".."  
    CALL 0x23dd                       ;0xd9eb:   cd dd 23  "..#" 
    CALL 0x2403                       ;0xd9ee:   cd 03 24  "..$" 
    POP HL                            ;0xd9f1:   e1  "." 
    LD (D_FBDB),HL                    ;0xd9f2:   22 db fb  "".."  
    RET z                             ;0xd9f5:   c8  "." 
    LD A,(D_F615)                     ;0xd9f6:   3a 15 f6  ":.."  
    OR A                              ;0xd9f9:   b7  "." 
    RET nz                            ;0xd9fa:   c0  "." 
    LD DE,0x10d                       ;0xd9fb:   11 0d 01  "..."  
    NOP                               ;0xd9fe:   00  "." 
    ADD HL,DE                         ;0xd9ff:   19  "." 
    LD (HL),D                         ;0xda00:   72  "r" 
    INC HL                            ;0xda01:   23  "#" 
    LD A,(HL)                         ;0xda02:   7e  "~" 
    PUSH AF                           ;0xda03:   f5  "." 
    PUSH HL                           ;0xda04:   e5  "." 
    AND 0x3f                          ;0xda05:   e6 3f  ".?" 
    LD (HL),A                         ;0xda07:   77  "w" 
    INC HL                            ;0xda08:   23  "#" 
    LD A,1                            ;0xda09:   3e 01  ">."  
    LD C,0x11                         ;0xda0b:   0e 11  ".."  
    LD (HL),D                         ;0xda0d:   72  "r" 
    INC HL                            ;0xda0e:   23  "#" 
    DEC C                             ;0xda0f:   0d  "." 
    JP nz, 0x284c                     ;0xda10:   c2 4c 28  ".L(" 
    DEC A                             ;0xda13:   3d  "=" 
    LD C,D                            ;0xda14:   4a  "J" 
    CALL z, 0x3012                    ;0xda15:   cc 12 30  "..0" 
    OR A                              ;0xda18:   b7  "." 
    LD C,10                           ;0xda19:   0e 0a  ".."  
    JP z, 0x284c                      ;0xda1b:   ca 4c 28  ".L(" 
    CALL 0x2076                       ;0xda1e:   cd 76 20  ".v " 
    LD C,1                            ;0xda21:   0e 01  ".."  
    NOP                               ;0xda23:   00  "." 
    LD DE,0x120                       ;0xda24:   11 20 01  ". ."  
    NOP                               ;0xda27:   00  "." 
    CALL 0x25f9                       ;0xda28:   cd f9 25  "..%" 
    POP HL                            ;0xda2b:   e1  "." 
    POP AF                            ;0xda2c:   f1  "." 
    LD (HL),A                         ;0xda2d:   77  "w" 
    CALL 0x3bc8                       ;0xda2e:   cd c8 3b  "..;" 
    JP 0x2062                         ;0xda31:   c3 62 20  ".b " 
    CALL 0x1cdc                       ;0xda34:   cd dc 1c  "..." 
    CALL 0x1f3f                       ;0xda37:   cd 3f 1f  ".?." 
    LD A,(HL)                         ;0xda3a:   7e  "~" 
    LD C,A                            ;0xda3b:   4f  "O" 
    INC C                             ;0xda3c:   0c  "." 
    CALL 0x2386                       ;0xda3d:   cd 86 23  "..#" 
    JP z, 0x28da                      ;0xda40:   ca da 28  "..(" 
    OR A                              ;0xda43:   b7  "." 
    LD A,(DE)                         ;0xda44:   1a  "." 
    JP nz, 0x2786                     ;0xda45:   c2 86 27  "..'" 
    LD (HL),A                         ;0xda48:   77  "w" 
    OR A                              ;0xda49:   b7  "." 
    JP nz, 0x278c                     ;0xda4a:   c2 8c 27  "..'" 
    LD A,(HL)                         ;0xda4d:   7e  "~" 
    LD (DE),A                         ;0xda4e:   12  "." 
    CP (HL)                           ;0xda4f:   be  "." 
    JP nz, 0x27f2                     ;0xda50:   c2 f2 27  "..'" 
    JP 0x27a8                         ;0xda53:   c3 a8 27  "..'" 
    CALL 0x271f                       ;0xda56:   cd 1f 27  "..'" 
    EX DE,HL                          ;0xda59:   eb  "." 
    CALL 0x271f                       ;0xda5a:   cd 1f 27  "..'" 
    EX DE,HL                          ;0xda5d:   eb  "." 
    LD A,(DE)                         ;0xda5e:   1a  "." 
    CP (HL)                           ;0xda5f:   be  "." 
    JP nz, 0x27f2                     ;0xda60:   c2 f2 27  "..'" 
    INC DE                            ;0xda63:   13  "." 
    INC HL                            ;0xda64:   23  "#" 
    LD A,(DE)                         ;0xda65:   1a  "." 
    CP (HL)                           ;0xda66:   be  "." 
    JP nz, 0x27f2                     ;0xda67:   c2 f2 27  "..'" 
    DEC C                             ;0xda6a:   0d  "." 
    INC DE                            ;0xda6b:   13  "." 
    INC HL                            ;0xda6c:   23  "#" 
    DEC C                             ;0xda6d:   0d  "." 
    JP nz, 0x2778                     ;0xda6e:   c2 78 27  ".x'" 
    EX DE,HL                          ;0xda71:   eb  "." 
    LD BC,S_FFEC                      ;0xda72:   01 ec ff  "..."  
    ADD HL,BC                         ;0xda75:   09  "." 
    PUSH HL                           ;0xda76:   e5  "." 
    CALL 0x2397                       ;0xda77:   cd 97 23  "..#" 
    POP DE                            ;0xda7a:   d1  "." 
    CALL 0x27f8                       ;0xda7b:   cd f8 27  "..'" 
    LD (HL),A                         ;0xda7e:   77  "w" 
    LD (DE),A                         ;0xda7f:   12  "." 
    PUSH BC                           ;0xda80:   c5  "." 
    LD BC,0x103                       ;0xda81:   01 03 01  "..."  
    NOP                               ;0xda84:   00  "." 
    ADD HL,BC                         ;0xda85:   09  "." 
    EX DE,HL                          ;0xda86:   eb  "." 
    ADD HL,BC                         ;0xda87:   09  "." 
    POP BC                            ;0xda88:   c1  "." 
    DEC B                             ;0xda89:   05  "." 
    JP z, 0x27d9                      ;0xda8a:   ca d9 27  "..'" 
    DEC B                             ;0xda8d:   05  "." 
    JP z, 0x27da                      ;0xda8e:   ca da 27  "..'" 
    LD A,(DE)                         ;0xda91:   1a  "." 
    CP (HL)                           ;0xda92:   be  "." 
    JP c, 0x27d9                      ;0xda93:   da d9 27  "..'" 
    OR A                              ;0xda96:   b7  "." 
    JP nz, 0x27da                     ;0xda97:   c2 da 27  "..'" 
    CALL 0x2715                       ;0xda9a:   cd 15 27  "..'" 
    EX DE,HL                          ;0xda9d:   eb  "." 
    LD A,(DE)                         ;0xda9e:   1a  "." 
    LD (HL),A                         ;0xda9f:   77  "w" 
    CALL 0x2040                       ;0xdaa0:   cd 40 20  ".@ " 
    LD DE,0x10b                       ;0xdaa3:   11 0b 01  "..."  
    NOP                               ;0xdaa6:   00  "." 
    ADD HL,DE                         ;0xdaa7:   19  "." 
    LD A,(HL)                         ;0xdaa8:   7e  "~" 
    AND 0x7f                          ;0xdaa9:   e6 7f  ".." 
    LD (HL),A                         ;0xdaab:   77  "w" 
    CALL 0x2062                       ;0xdaac:   cd 62 20  ".b " 
    LD C,1                            ;0xdaaf:   0e 01  ".."  
    CALL 0x2290                       ;0xdab1:   cd 90 22  ".."" 
    JP 0x219a                         ;0xdab4:   c3 9a 21  "..!" 
    CALL 0x21dd                       ;0xdab7:   cd dd 21  "..!" 
    JP 0x24c0                         ;0xdaba:   c3 c0 24  "..$" 
    LD B,1                            ;0xdabd:   06 01  ".."  
    CP (HL)                           ;0xdabf:   be  "." 
    RET nz                            ;0xdac0:   c0  "." 
    INC B                             ;0xdac1:   04  "." 
    EX DE,HL                          ;0xdac2:   eb  "." 
    CP (HL)                           ;0xdac3:   be  "." 
    EX DE,HL                          ;0xdac4:   eb  "." 
    LD HL,0x103                       ;0xdac5:   21 03 01  "!.."  
    NOP                               ;0xdac8:   00  "." 
    ADD HL,DE                         ;0xdac9:   19  "." 
    LD A,(DE)                         ;0xdaca:   1a  "." 
    SUB C                             ;0xdacb:   91  "." 
    JP z, 0x2712                      ;0xdacc:   ca 12 27  "..'" 
    LD A,B                            ;0xdacf:   78  "x" 
    JP nc, 0x2710                     ;0xdad0:   d2 10 27  "..'" 
    LD A,0x80                         ;0xdad3:   3e 80  ">."  
    OR (HL)                           ;0xdad5:   b6  "." 
    LD (HL),A                         ;0xdad6:   77  "w" 
    RET                               ;0xdad7:   c9  "." 
    LD A,(HL)                         ;0xdad8:   7e  "~" 
    OR A                              ;0xdad9:   b7  "." 
    RET nz                            ;0xdada:   c0  "." 
    LD (HL),1                         ;0xdadb:   36 01  "6."  
    NOP                               ;0xdadd:   00  "." 
    LD A,(0x379f)                     ;0xdade:   3a 9f 37  ":.7"  
    OR A                              ;0xdae1:   b7  "." 
    RET z                             ;0xdae2:   c8  "." 
    LD (HL),0x80                      ;0xdae3:   36 80  "6."  
    RET                               ;0xdae5:   c9  "." 
    LD A,(HL)                         ;0xdae6:   7e  "~" 
    INC HL                            ;0xdae7:   23  "#" 
    OR (HL)                           ;0xdae8:   b6  "." 
    DEC HL                            ;0xdae9:   2b  "+" 
    RET nz                            ;0xdaea:   c0  "." 
    LD A,(DE)                         ;0xdaeb:   1a  "." 
    LD (HL),A                         ;0xdaec:   77  "w" 
    INC DE                            ;0xdaed:   13  "." 
    INC HL                            ;0xdaee:   23  "#" 
    LD A,(DE)                         ;0xdaef:   1a  "." 
    LD (HL),A                         ;0xdaf0:   77  "w" 
    DEC DE                            ;0xdaf1:   1b  "." 
    DEC HL                            ;0xdaf2:   2b  "+" 
    RET                               ;0xdaf3:   c9  "." 
    PUSH HL                           ;0xdaf4:   e5  "." 
    LD DE,0x103                       ;0xdaf5:   11 03 01  "..."  
    NOP                               ;0xdaf8:   00  "." 
    ADD HL,DE                         ;0xdaf9:   19  "." 
    LD A,(HL)                         ;0xdafa:   7e  "~" 
    CP 0x81                           ;0xdafb:   fe 81  ".." 
    JP c, 0x273b                      ;0xdafd:   da 3b 27  ".;'" 
    AND 0x7f                          ;0xdb00:   e6 7f  ".." 
    LD (HL),A                         ;0xdb02:   77  "w" 
    POP HL                            ;0xdb03:   e1  "." 
    RET                               ;0xdb04:   c9  "." 
    XOR A                             ;0xdb05:   af  "." 
    LD (0x1c9f),A                     ;0xdb06:   32 9f 1c  "2.."  
    CALL 0x201a                       ;0xdb09:   cd 1a 20  ".. " 
    RET nz                            ;0xdb0c:   c0  "." 
    CALL 0x204b                       ;0xdb0d:   cd 4b 20  ".K " 
    AND 0x80                          ;0xdb10:   e6 80  ".." 
    RET nz                            ;0xdb12:   c0  "." 
    CALL 0x21e8                       ;0xdb13:   cd e8 21  "..!" 
    JP z, 0x27f2                      ;0xdb16:   ca f2 27  "..'" 
    CALL 0x3bfc                       ;0xdb19:   cd fc 3b  "..;" 
    LD C,A                            ;0xdb1c:   4f  "O" 
    LD B,(HL)                         ;0xdb1d:   46  "F" 
    PUSH BC                           ;0xdb1e:   c5  "." 
    LD (HL),C                         ;0xdb1f:   71  "q" 
    CALL 0x272d                       ;0xdb20:   cd 2d 27  ".-'" 
    LD A,C                            ;0xdb23:   79  "y" 
    CP B                              ;0xdb24:   b8  "." 
    CALL c, 0x26fd                    ;0xdb25:   dc fd 26  "..&" 
    CALL 0x276c                       ;0xdb28:   cd 6c 27  ".l'" 
    CALL 0x1f3f                       ;0xdb2b:   cd 3f 1f  ".?." 
    POP BC                            ;0xdb2e:   c1  "." 
    LD C,(HL)                         ;0xdb2f:   4e  "N" 
    LD (HL),B                         ;0xdb30:   70  "p" 
    JP 0x26fd                         ;0xdb31:   c3 fd 26  "..&" 
    CALL 0x23f0                       ;0xdb34:   cd f0 23  "..#" 
    RET z                             ;0xdb37:   c8  "." 
    LD BC,0x110                       ;0xdb38:   01 10 01  "..."  
    NOP                               ;0xdb3b:   00  "." 
    CALL 0x3567                       ;0xdb3c:   cd 67 35  ".g5" 
    LD C,0x10                         ;0xdb3f:   0e 10  ".."  
    LD A,(0x37a3)                     ;0xdb41:   3a a3 37  ":.7"  
    OR A                              ;0xdb44:   b7  "." 
    JP z, 0x2793                      ;0xdb45:   ca 93 27  "..'" 
    LD A,(HL)                         ;0xdb48:   7e  "~" 
    INC H                             ;0xdb49:   24  "$" 
    CALL 0x23f5                       ;0xdb4a:   cd f5 23  "..#" 
    RET z                             ;0xdb4d:   c8  "." 
    CALL 0x2028                       ;0xdb4e:   cd 28 20  ".( " 
    LD C,0x10                         ;0xdb51:   0e 10  ".."  
    LD E,12                           ;0xdb53:   1e 0c  ".."  
    CALL 0x25f7                       ;0xdb55:   cd f7 25  "..%" 
    CALL 0x3bc8                       ;0xdb58:   cd c8 3b  "..;" 
    CALL 0x2403                       ;0xdb5b:   cd 03 24  "..$" 
    JP nz, 0x2688                     ;0xdb5e:   c2 88 26  "..&" 
    CALL 0x2508                       ;0xdb61:   cd 08 25  "..%" 
    JP z, 0x2380                      ;0xdb64:   ca 80 23  "..#" 
    CALL 0x2648                       ;0xdb67:   cd 48 26  ".H&" 
    JP 0x2688                         ;0xdb6a:   c3 88 26  "..&" 
    CALL 0x1f18                       ;0xdb6d:   cd 18 1f  "..." 
    LD (0x37b3),A                     ;0xdb70:   32 b3 37  "2.7"  
    CALL 0x2e78                       ;0xdb73:   cd 78 2e  ".x." 
    CALL nz, 0x2e85                   ;0xdb76:   c4 85 2e  "..." 
    CALL 0x23f5                       ;0xdb79:   cd f5 23  "..#" 
    RET z                             ;0xdb7c:   c8  "." 
    LD C,1                            ;0xdb7d:   0e 01  ".."  
    NOP                               ;0xdb7f:   00  "." 
    LD E,12                           ;0xdb80:   1e 0c  ".."  
    CALL 0x2610                       ;0xdb82:   cd 10 26  "..&" 
    CALL 0x1d29                       ;0xdb85:   cd 29 1d  ".)." 
    LD A,(0x37b3)                     ;0xdb88:   3a b3 37  ":.7"  
    AND 0x40                          ;0xdb8b:   e6 40  ".@" 
    JP z, 0x26ce                      ;0xdb8d:   ca ce 26  "..&" 
    PUSH HL                           ;0xdb90:   e5  "." 
    CALL 0x1f4f                       ;0xdb91:   cd 4f 1f  ".O." 
    LD A,(HL)                         ;0xdb94:   7e  "~" 
    POP HL                            ;0xdb95:   e1  "." 
    INC HL                            ;0xdb96:   23  "#" 
    LD (HL),A                         ;0xdb97:   77  "w" 
    CALL 0x219a                       ;0xdb98:   cd 9a 21  "..!" 
    CALL 0x2403                       ;0xdb9b:   cd 03 24  "..$" 
    JP z, 0x2380                      ;0xdb9e:   ca 80 23  "..#" 
    JP 0x26b4                         ;0xdba1:   c3 b4 26  "..&" 
    CALL 0x3c83                       ;0xdba4:   cd 83 3c  "..<" 
    RET z                             ;0xdba7:   c8  "." 
    CALL 0x2062                       ;0xdba8:   cd 62 20  ".b " 
    LD E,A                            ;0xdbab:   5f  "_" 
    PUSH HL                           ;0xdbac:   e5  "." 
    DEC HL                            ;0xdbad:   2b  "+" 
    DEC HL                            ;0xdbae:   2b  "+" 
    LD D,(HL)                         ;0xdbaf:   56  "V" 
    PUSH DE                           ;0xdbb0:   d5  "." 
    CALL 0x2040                       ;0xdbb1:   cd 40 20  ".@ " 
    EX DE,HL                          ;0xdbb4:   eb  "." 
    LD HL,(D_FBDB)                    ;0xdbb5:   2a db fb  "*.."  
    LD C,0x20                         ;0xdbb8:   0e 20  ". "  
    CALL 0x1d29                       ;0xdbba:   cd 29 1d  ".)." 
    CALL 0x2397                       ;0xdbbd:   cd 97 23  "..#" 
    LD C,A                            ;0xdbc0:   4f  "O" 
    POP DE                            ;0xdbc1:   d1  "." 
    POP HL                            ;0xdbc2:   e1  "." 
    LD (HL),E                         ;0xdbc3:   73  "s" 
    DEC HL                            ;0xdbc4:   2b  "+" 
    DEC HL                            ;0xdbc5:   2b  "+" 
    LD (HL),D                         ;0xdbc6:   72  "r" 
    LD B,1                            ;0xdbc7:   06 01  ".."  
    NOP                               ;0xdbc9:   00  "." 
    EX DE,HL                          ;0xdbca:   eb  "." 
    LD HL,0xa07e                      ;0xdbcb:   21 7e a0  "!~."  
;--------------------------------------
C_DBCE:                               ; XREF: 0xD092 
    PUSH BC                           ;0xdbce:   c5  "." 
    LD B,A                            ;0xdbcf:   47  "G" 
    LD A,(DE)                         ;0xdbd0:   1a  "." 
    AND 0x7f                          ;0xdbd1:   e6 7f  ".." 
    OR B                              ;0xdbd3:   b0  "." 
    LD (HL),A                         ;0xdbd4:   77  "w" 
    POP BC                            ;0xdbd5:   c1  "." 
    INC HL                            ;0xdbd6:   23  "#" 
    INC DE                            ;0xdbd7:   13  "." 
    JP 0x25fd                         ;0xdbd8:   c3 fd 25  "..%" 
    PUSH DE                           ;0xdbdb:   d5  "." 
    LD B,1                            ;0xdbdc:   06 01  ".."  
    NOP                               ;0xdbde:   00  "." 
    LD HL,(D_FBDB)                    ;0xdbdf:   2a db fb  "*.."  
    ADD HL,BC                         ;0xdbe2:   09  "." 
    INC HL                            ;0xdbe3:   23  "#" 
    LD A,(HL)                         ;0xdbe4:   7e  "~" 
    SUB 0x24                          ;0xdbe5:   d6 24  ".$" 
    CALL z, 0x2625                    ;0xdbe7:   cc 25 26  ".%&" 
    DEC HL                            ;0xdbea:   2b  "+" 
    EX DE,HL                          ;0xdbeb:   eb  "." 
    CALL 0x2040                       ;0xdbec:   cd 40 20  ".@ " 
    POP BC                            ;0xdbef:   c1  "." 
    RET                               ;0xdbf0:   c9  "." 
    LD DE,D_FBB3                      ;0xdbf1:   11 b3 fb  "..."  
    LD A,(DE)                         ;0xdbf4:   1a  "." 
    OR 1                              ;0xdbf5:   f6 01  ".." 
    LD (DE),A                         ;0xdbf7:   12  "." 
    RET                               ;0xdbf8:   c9  "." 
    LD HL,(D_FBDB)                    ;0xdbf9:   2a db fb  "*.."  
    CALL 0x2639                       ;0xdbfc:   cd 39 26  ".9&" 
    RET nz                            ;0xdbff:   c0  "." 
    LD A,9                            ;0xdc00:   3e 09  ">."  
    JP 0x32e5                         ;0xdc02:   c3 e5 32  "..2" 
    LD C,11                           ;0xdc05:   0e 0b  ".."  
    INC HL                            ;0xdc07:   23  "#" 
    LD A,0x3f                         ;0xdc08:   3e 3f  ">?"  
    SUB (HL)                          ;0xdc0a:   96  "." 
    AND 0x7f                          ;0xdc0b:   e6 7f  ".." 
    RET z                             ;0xdc0d:   c8  "." 
    DEC C                             ;0xdc0e:   0d  "." 
    JP nz, 0x263b                     ;0xdc0f:   c2 3b 26  ".;&" 
    OR A                              ;0xdc12:   b7  "." 
    RET                               ;0xdc13:   c9  "." 
    LD HL,(D_FBDB)                    ;0xdc14:   2a db fb  "*.."  
    LD A,(HL)                         ;0xdc17:   7e  "~" 
    LD BC,0x110                       ;0xdc18:   01 10 01  "..."  
    NOP                               ;0xdc1b:   00  "." 
    ADD HL,BC                         ;0xdc1c:   09  "." 
    LD (HL),A                         ;0xdc1d:   77  "w" 
    RET                               ;0xdc1e:   c9  "." 
    CALL 0x262d                       ;0xdc1f:   cd 2d 26  ".-&" 
    CALL 0x2e78                       ;0xdc22:   cd 78 2e  ".x." 
    CALL nz, 0x2e85                   ;0xdc25:   c4 85 2e  "..." 
    CALL 0x24fd                       ;0xdc28:   cd fd 24  "..$" 
    CALL 0x2648                       ;0xdc2b:   cd 48 26  ".H&" 
    LD (0x37a0),HL                    ;0xdc2e:   22 a0 37  "".7"  
    CALL 0x2630                       ;0xdc31:   cd 30 26  ".0&" 
    LD C,12                           ;0xdc34:   0e 0c  ".."  
    LD HL,(0x37a0)                    ;0xdc36:   2a a0 37  "*.7"  
    CALL 0x23e3                       ;0xdc39:   cd e3 23  "..#" 
    CALL 0x23fa                       ;0xdc3c:   cd fa 23  "..#" 
    JP nz, 0x32e3                     ;0xdc3f:   c2 e3 32  "..2" 
    CALL 0x2508                       ;0xdc42:   cd 08 25  "..%" 
    CALL nz, 0x258a                   ;0xdc45:   c4 8a 25  "..%" 
    CALL 0x2648                       ;0xdc48:   cd 48 26  ".H&" 
    CALL 0x24fd                       ;0xdc4b:   cd fd 24  "..$" 
    JP 0x2545                         ;0xdc4e:   c3 45 25  ".E%" 
    CALL 0x23f5                       ;0xdc51:   cd f5 23  "..#" 
    JP z, 0x2380                      ;0xdc54:   ca 80 23  "..#" 
    CALL 0x2040                       ;0xdc57:   cd 40 20  ".@ " 
    LD A,(HL)                         ;0xdc5a:   7e  "~" 
    AND 0x10                          ;0xdc5b:   e6 10  ".." 
    JP nz, 0x259b                     ;0xdc5d:   c2 9b 25  "..%" 
    LD A,(0x37b3)                     ;0xdc60:   3a b3 37  ":.7"  
    AND 0x80                          ;0xdc63:   e6 80  ".." 
    JP nz, 0x259d                     ;0xdc65:   c2 9d 25  "..%" 
    LD (HL),0xe5                      ;0xdc68:   36 e5  "6."  
    PUSH AF                           ;0xdc6a:   f5  "." 
    CALL 0x3010                       ;0xdc6b:   cd 10 30  "..0" 
    OR A                              ;0xdc6e:   b7  "." 
    JP nz, 0x25a6                     ;0xdc6f:   c2 a6 25  "..%" 
    LD (HL),A                         ;0xdc72:   77  "w" 
    CALL 0x219a                       ;0xdc73:   cd 9a 21  "..!" 
    LD C,1                            ;0xdc76:   0e 01  ".."  
    NOP                               ;0xdc78:   00  "." 
    POP AF                            ;0xdc79:   f1  "." 
    CALL z, 0x228b                    ;0xdc7a:   cc 8b 22  ".."" 
    CALL 0x3bc8                       ;0xdc7d:   cd c8 3b  "..;" 
    CALL 0x2403                       ;0xdc80:   cd 03 24  "..$" 
    JP 0x2587                         ;0xdc83:   c3 87 25  "..%" 
    LD D,B                            ;0xdc86:   50  "P" 
    LD E,C                            ;0xdc87:   59  "Y" 
    LD HL,(0x3785)                    ;0xdc88:   2a 85 37  "*.7"  
    LD A,E                            ;0xdc8b:   7b  "{" 
    SUB L                             ;0xdc8c:   95  "." 
    LD A,D                            ;0xdc8d:   7a  "z" 
    SBC A,H                           ;0xdc8e:   9c  "." 
    JP nc, 0x25ee                     ;0xdc8f:   d2 ee 25  "..%" 
    INC DE                            ;0xdc92:   13  "." 
    PUSH BC                           ;0xdc93:   c5  "." 
    PUSH DE                           ;0xdc94:   d5  "." 
    LD B,D                            ;0xdc95:   42  "B" 
    LD C,E                            ;0xdc96:   4b  "K" 
    CALL 0x224e                       ;0xdc97:   cd 4e 22  ".N"" 
    RRA                               ;0xdc9a:   1f  "." 
    JP nc, 0x25e6                     ;0xdc9b:   d2 e6 25  "..%" 
    POP DE                            ;0xdc9e:   d1  "." 
    POP BC                            ;0xdc9f:   c1  "." 
    LD A,C                            ;0xdca0:   79  "y" 
    OR B                              ;0xdca1:   b0  "." 
    JP z, 0x25ba                      ;0xdca2:   ca ba 25  "..%" 
    DEC BC                            ;0xdca5:   0b  "." 
    PUSH DE                           ;0xdca6:   d5  "." 
    PUSH BC                           ;0xdca7:   c5  "." 
    CALL 0x224e                       ;0xdca8:   cd 4e 22  ".N"" 
    RRA                               ;0xdcab:   1f  "." 
    JP nc, 0x25e6                     ;0xdcac:   d2 e6 25  "..%" 
    POP BC                            ;0xdcaf:   c1  "." 
    POP DE                            ;0xdcb0:   d1  "." 
    JP 0x25ba                         ;0xdcb1:   c3 ba 25  "..%" 
    RLA                               ;0xdcb4:   17  "." 
    INC A                             ;0xdcb5:   3c  "<" 
    CALL 0x2270                       ;0xdcb6:   cd 70 22  ".p"" 
    POP HL                            ;0xdcb9:   e1  "." 
    POP DE                            ;0xdcba:   d1  "." 
    RET                               ;0xdcbb:   c9  "." 
    LD A,C                            ;0xdcbc:   79  "y" 
    OR B                              ;0xdcbd:   b0  "." 
    JP nz, 0x25d2                     ;0xdcbe:   c2 d2 25  "..%" 
    LD HL,2                           ;0xdcc1:   21 02 00  "!.."  
    RET                               ;0xdcc4:   c9  "." 
    LD D,0x80                         ;0xdcc5:   16 80  ".."  
    CALL 0x2610                       ;0xdcc7:   cd 10 26  "..&" 
    INC C                             ;0xdcca:   0c  "." 
;--------------------------------------
C_DCCB:                               ; XREF: 0xDCD3 
    DEC C                             ;0xdccb:   0d  "." 
    JP z, 0x169a                      ;0xdccc:   ca 9a 16  "..." 
    OR 0x3e                           ;0xdccf:   f6 3e  ".>" 
    CP 0x32                           ;0xdcd1:   fe 32  ".2" 
    JR C_DCCB                         ;0xdcd3:   18 f6  ".." 
    RET                               ;0xdcd5:   c9  "." 
    LD A,(D_F618)                     ;0xdcd6:   3a 18 f6  ":.."  
    CP 0xfe                           ;0xdcd9:   fe fe  ".." 
    RET z                             ;0xdcdb:   c8  "." 
    CALL 0x280a                       ;0xdcdc:   cd 0a 28  "..(" 
    XOR A                             ;0xdcdf:   af  "." 
    CALL 0x24ff                       ;0xdce0:   cd ff 24  "..$" 
    LD HL,(0x37a0)                    ;0xdce3:   2a a0 37  "*.7"  
    LD A,(HL)                         ;0xdce6:   7e  "~" 
    OR 0x10                           ;0xdce7:   f6 10  ".." 
    LD (HL),A                         ;0xdce9:   77  "w" 
    LD C,12                           ;0xdcea:   0e 0c  ".."  
    CALL 0x23e3                       ;0xdcec:   cd e3 23  "..#" 
    JP 0x2403                         ;0xdcef:   c3 03 24  "..$" 
    LD HL,(D_FBE1)                    ;0xdcf2:   2a e1 fb  "*.."  
    LD (D_F617),HL                    ;0xdcf5:   22 17 f6  "".."  
    RET                               ;0xdcf8:   c9  "." 
    CALL 0x280a                       ;0xdcf9:   cd 0a 28  "..(" 
    LD C,15                           ;0xdcfc:   0e 0f  ".."  
    CALL 0x23dd                       ;0xdcfe:   cd dd 23  "..#" 
    JP 0x2403                         ;0xdd01:   c3 03 24  "..$" 
    CALL 0x1f18                       ;0xdd04:   cd 18 1f  "..." 
    LD (0x37b3),A                     ;0xdd07:   32 b3 37  "2.7"  
    LD A,0xfe                         ;0xdd0a:   3e fe  ">."  
    CALL 0x24ff                       ;0xdd0c:   cd ff 24  "..$" 
    CALL 0x23f5                       ;0xdd0f:   cd f5 23  "..#" 
    RET z                             ;0xdd12:   c8  "." 
    JP z, 0x2584                      ;0xdd13:   ca 84 25  "..%" 
    CALL 0x2040                       ;0xdd16:   cd 40 20  ".@ " 
    LD A,(HL)                         ;0xdd19:   7e  "~" 
    AND 0x10                          ;0xdd1a:   e6 10  ".." 
    JP nz, 0x256b                     ;0xdd1c:   c2 6b 25  ".k%" 
    LD A,(0x37b3)                     ;0xdd1f:   3a b3 37  ":.7"  
    RLA                               ;0xdd22:   17  "." 
    CALL nc, 0x2028                   ;0xdd23:   d4 28 20  ".( " 
    CALL 0x2e73                       ;0xdd26:   cd 73 2e  ".s." 
    RLA                               ;0xdd29:   17  "." 
    JP c, 0x257e                      ;0xdd2a:   da 7e 25  ".~%" 
    LD HL,(D_FBDB)                    ;0xdd2d:   2a db fb  "*.."  
    CALL 0x2639                       ;0xdd30:   cd 39 26  ".9&" 
    JP z, 0x257e                      ;0xdd33:   ca 7e 25  ".~%" 
    JP 0x258a                         ;0xdd36:   c3 8a 25  "..%" 
    CALL 0x2e73                       ;0xdd39:   cd 73 2e  ".s." 
    RLA                               ;0xdd3c:   17  "." 
    JP nc, 0x257e                     ;0xdd3d:   d2 7e 25  ".~%" 
    CALL 0x2fd4                       ;0xdd40:   cd d4 2f  "../" 
    JP z, 0x257e                      ;0xdd43:   ca 7e 25  ".~%" 
    CALL 0x2e85                       ;0xdd46:   cd 85 2e  "..." 
    JP 0x253c                         ;0xdd49:   c3 3c 25  ".<%" 
    CALL 0x8603                       ;0xdd4c:   cd 03 86  "..." 
    INC HL                            ;0xdd4f:   23  "#" 
    LD B,A                            ;0xdd50:   47  "G" 
    LD A,(0x37be)                     ;0xdd51:   3a be 37  ":.7"  
    INC A                             ;0xdd54:   3c  "<" 
    JP z, 0x24de                      ;0xdd55:   ca de 24  "..$" 
    XOR A                             ;0xdd58:   af  "." 
    LD (0x37bd),A                     ;0xdd59:   32 bd 37  "2.7"  
    LD A,B                            ;0xdd5c:   78  "x" 
    POP BC                            ;0xdd5d:   c1  "." 
    OR A                              ;0xdd5e:   b7  "." 
    JP nz, 0x2403                     ;0xdd5f:   c2 03 24  "..$" 
    INC DE                            ;0xdd62:   13  "." 
    INC HL                            ;0xdd63:   23  "#" 
    INC B                             ;0xdd64:   04  "." 
    DEC C                             ;0xdd65:   0d  "." 
    JP 0x2457                         ;0xdd66:   c3 57 24  ".W$" 
    LD A,(0x37a2)                     ;0xdd69:   3a a2 37  ":.7"  
    INC A                             ;0xdd6c:   3c  "<" 
    JP nz, 0x24ad                     ;0xdd6d:   c2 ad 24  "..$" 
    LD A,(D_F618)                     ;0xdd70:   3a 18 f6  ":.."  
    CP 0xfe                           ;0xdd73:   fe fe  ".." 
    CALL z, 0x24ea                    ;0xdd75:   cc ea 24  "..$" 
    JP 0x2403                         ;0xdd78:   c3 03 24  "..$" 
    XOR A                             ;0xdd7b:   af  "." 
    LD (0x379d),A                     ;0xdd7c:   32 9d 37  "2.7"  
    LD (0x1c9f),A                     ;0xdd7f:   32 9f 1c  "2.."  
    LD B,A                            ;0xdd82:   47  "G" 
    INC B                             ;0xdd83:   04  "." 
    RET                               ;0xdd84:   c9  "." 
    AND 0x3f                          ;0xdd85:   e6 3f  ".?" 
    RET                               ;0xdd87:   c9  "." 
    CALL 0x24ed                       ;0xdd88:   cd ed 24  "..$" 
    CALL 0x2201                       ;0xdd8b:   cd 01 22  ".."" 
    LD A,0xff                         ;0xdd8e:   3e ff  ">."  
    LD B,A                            ;0xdd90:   47  "G" 
    INC B                             ;0xdd91:   04  "." 
    JP 0x1972                         ;0xdd92:   c3 72 19  ".r." 
    LD A,B                            ;0xdd95:   78  "x" 
    OR A                              ;0xdd96:   b7  "." 
    JP nz, 0x2403                     ;0xdd97:   c2 03 24  "..$" 
    LD A,(HL)                         ;0xdd9a:   7e  "~" 
    OR A                              ;0xdd9b:   b7  "." 
    JP nz, 0x2403                     ;0xdd9c:   c2 03 24  "..$" 
    LD A,(0x37bd)                     ;0xdd9f:   3a bd 37  ":.7"  
    OR A                              ;0xdda2:   b7  "." 
    JP z, 0x2403                      ;0xdda3:   ca 03 24  "..$" 
    LD (0x37be),A                     ;0xdda6:   32 be 37  "2.7"  
    JP 0x2494                         ;0xdda9:   c3 94 24  "..$" 
    OR B                              ;0xddac:   b0  "." 
    POP BC                            ;0xddad:   c1  "." 
    LD BC,0x2403                      ;0xddae:   01 03 24  "..$"  
    PUSH BC                           ;0xddb1:   c5  "." 
    RET nz                            ;0xddb2:   c0  "." 
    INC HL                            ;0xddb3:   23  "#" 
    INC HL                            ;0xddb4:   23  "#" 
    LD A,(HL)                         ;0xddb5:   7e  "~" 
    OR A                              ;0xddb6:   b7  "." 
    RET nz                            ;0xddb7:   c0  "." 
    CALL 0x24f5                       ;0xddb8:   cd f5 24  "..$" 
    PUSH HL                           ;0xddbb:   e5  "." 
    LD HL,(D_F617)                    ;0xddbc:   2a 17 f6  "*.."  
    INC H                             ;0xddbf:   24  "$" 
    JP nz, 0x24fb                     ;0xddc0:   c2 fb 24  "..$" 
    LD HL,(D_FBE1)                    ;0xddc3:   2a e1 fb  "*.."  
    LD (D_F617),HL                    ;0xddc6:   22 17 f6  "".."  
    POP HL                            ;0xddc9:   e1  "." 
    RET                               ;0xddca:   c9  "." 
    LD A,0xff                         ;0xddcb:   3e ff  ">."  
    LD (0x80cc),A                     ;0xddcd:   32 cc 80  "2.."  
    DEC E                             ;0xddd0:   1d  "." 
    XOR A                             ;0xddd1:   af  "." 
    LD (0x37be),A                     ;0xddd2:   32 be 37  "2.7"  
    CALL 0x3b6b                       ;0xddd5:   cd 6b 3b  ".k;" 
    JP nz, 0x24ba                     ;0xddd8:   c2 ba 24  "..$" 
    LD C,1                            ;0xdddb:   0e 01  ".."  
    NOP                               ;0xdddd:   00  "." 
    CALL 0x2208                       ;0xddde:   cd 08 22  ".."" 
    CALL 0x21f8                       ;0xdde1:   cd f8 21  "..!" 
    JP z, 0x24ba                      ;0xdde4:   ca ba 24  "..$" 
    LD HL,(0x37a0)                    ;0xdde7:   2a a0 37  "*.7"  
    EX DE,HL                          ;0xddea:   eb  "." 
    LD A,(DE)                         ;0xddeb:   1a  "." 
    CP 0xe5                           ;0xddec:   fe e5  ".." 
    JP z, 0x242a                      ;0xddee:   ca 2a 24  ".*$" 
    PUSH DE                           ;0xddf1:   d5  "." 
    CALL 0x2069                       ;0xddf2:   cd 69 20  ".i " 
    POP DE                            ;0xddf5:   d1  "." 
    JP nc, 0x24ba                     ;0xddf6:   d2 ba 24  "..$" 
    CALL 0x2040                       ;0xddf9:   cd 40 20  ".@ " 
    LD A,(D_FBE5)                     ;0xddfc:   3a e5 fb  ":.."  
    LD C,A                            ;0xddff:   4f  "O" 
    LD B,1                            ;0xde00:   06 01  ".."  
    NOP                               ;0xde02:   00  "." 
    LD A,(HL)                         ;0xde03:   7e  "~" 
    CP 0xe5                           ;0xde04:   fe e5  ".." 
    CALL z, 0x24ed                    ;0xde06:   cc ed 24  "..$" 
    XOR A                             ;0xde09:   af  "." 
    LD (0x37a2),A                     ;0xde0a:   32 a2 37  "2.7"  
    LD A,(HL)                         ;0xde0d:   7e  "~" 
    AND 0xef                          ;0xde0e:   e6 ef  ".." 
    CP (HL)                           ;0xde10:   be  "." 
    JP z, 0x2457                      ;0xde11:   ca 57 24  ".W$" 
    EX DE,HL                          ;0xde14:   eb  "." 
    CP (HL)                           ;0xde15:   be  "." 
    EX DE,HL                          ;0xde16:   eb  "." 
    JP nz, 0x2457                     ;0xde17:   c2 57 24  ".W$" 
    LD A,(D_F616)                     ;0xde1a:   3a 16 f6  ":.."  
    OR A                              ;0xde1d:   b7  "." 
    JP z, 0x2403                      ;0xde1e:   ca 03 24  "..$" 
    LD (0x37a2),A                     ;0xde21:   32 a2 37  "2.7"  
    JP 0x2494                         ;0xde24:   c3 94 24  "..$" 
    LD A,C                            ;0xde27:   79  "y" 
    OR A                              ;0xde28:   b7  "." 
    JP z, 0x249b                      ;0xde29:   ca 9b 24  "..$" 
    LD A,(DE)                         ;0xde2c:   1a  "." 
    CP 0x3f                           ;0xde2d:   fe 3f  ".?" 
    JP z, 0x2494                      ;0xde2f:   ca 94 24  "..$" 
    LD A,B                            ;0xde32:   78  "x" 
    CP 13                             ;0xde33:   fe 0d  ".." 
    JP z, 0x2494                      ;0xde35:   ca 94 24  "..$" 
    CP 12                             ;0xde38:   fe 0c  ".." 
    JP z, 0x247c                      ;0xde3a:   ca 7c 24  ".|$" 
    CP 14                             ;0xde3d:   fe 0e  ".." 
    LD A,(DE)                         ;0xde3f:   1a  "." 
    CALL z, 0x24b7                    ;0xde40:   cc b7 24  "..$" 
    SUB (HL)                          ;0xde43:   96  "." 
    AND 0x7f                          ;0xde44:   e6 7f  ".." 
    JP nz, 0x24c7                     ;0xde46:   c2 c7 24  "..$" 
    JP 0x2494                         ;0xde49:   c3 94 24  "..$" 
    LD A,(DE)                         ;0xde4c:   1a  "." 
    PUSH BC                           ;0xde4d:   c5  "." 
    LD C,(HL)                         ;0xde4e:   4e  "N" 
    CALL 0x9d3a                       ;0xde4f:   cd 3a 9d  ".:." 
    SCF                               ;0xde52:   37  "7" 
    JP 0x1972                         ;0xde53:   c3 72 19  ".r." 
    PUSH BC                           ;0xde56:   c5  "." 
    PUSH AF                           ;0xde57:   f5  "." 
    LD A,(0x3784)                     ;0xde58:   3a 84 37  ":.7"  
    CPL                               ;0xde5b:   2f  "/" 
    LD B,A                            ;0xde5c:   47  "G" 
    LD A,C                            ;0xde5d:   79  "y" 
    AND B                             ;0xde5e:   a0  "." 
    LD C,A                            ;0xde5f:   4f  "O" 
    POP AF                            ;0xde60:   f1  "." 
    AND B                             ;0xde61:   a0  "." 
    SUB C                             ;0xde62:   91  "." 
    AND 0x1f                          ;0xde63:   e6 1f  ".." 
    POP BC                            ;0xde65:   c1  "." 
    RET                               ;0xde66:   c9  "." 
    CALL 0x1f4f                       ;0xde67:   cd 4f 1f  ".O." 
    LD C,0x10                         ;0xde6a:   0e 10  ".."  
    LD B,C                            ;0xde6c:   41  "A" 
    INC C                             ;0xde6d:   0c  "." 
    PUSH BC                           ;0xde6e:   c5  "." 
    POP BC                            ;0xde6f:   c1  "." 
    DEC C                             ;0xde70:   0d  "." 
    XOR A                             ;0xde71:   af  "." 
    DEC HL                            ;0xde72:   2b  "+" 
    DEC B                             ;0xde73:   05  "." 
    CP (HL)                           ;0xde74:   be  "." 
    JP nz, 0x23ac                     ;0xde75:   c2 ac 23  "..#" 
    DEC C                             ;0xde78:   0d  "." 
    JP nz, 0x23a2                     ;0xde79:   c2 a2 23  "..#" 
    LD A,C                            ;0xde7c:   79  "y" 
    LD (0x379f),A                     ;0xde7d:   32 9f 37  "2.7"  
    LD A,(0x37a3)                     ;0xde80:   3a a3 37  ":.7"  
    OR A                              ;0xde83:   b7  "." 
    LD A,B                            ;0xde84:   78  "x" 
    JP nz, 0x23b9                     ;0xde85:   c2 b9 23  "..#" 
    RRA                               ;0xde88:   1f  "." 
    PUSH BC                           ;0xde89:   c5  "." 
    PUSH HL                           ;0xde8a:   e5  "." 
    LD L,A                            ;0xde8b:   6f  "o" 
    LD H,1                            ;0xde8c:   26 01  "&."  
    NOP                               ;0xde8e:   00  "." 
    LD A,(0x3782)                     ;0xde8f:   3a 82 37  ":.7"  
    LD D,A                            ;0xde92:   57  "W" 
    LD A,7                            ;0xde93:   3e 07  ">."  
    SUB D                             ;0xde95:   92  "." 
    LD C,A                            ;0xde96:   4f  "O" 
    CALL 0x1fab                       ;0xde97:   cd ab 1f  "..." 
    LD B,L                            ;0xde9a:   45  "E" 
    LD A,(0x3784)                     ;0xde9b:   3a 84 37  ":.7"  
    CP B                              ;0xde9e:   b8  "." 
    POP HL                            ;0xde9f:   e1  "." 
    JP c, 0x239f                      ;0xdea0:   da 9f 23  "..#" 
    CALL 0x1f3f                       ;0xdea3:   cd 3f 1f  ".?." 
    LD C,(HL)                         ;0xdea6:   4e  "N" 
    CPL                               ;0xdea7:   2f  "/" 
    AND 0x1f                          ;0xdea8:   e6 1f  ".." 
    AND C                             ;0xdeaa:   a1  "." 
    OR B                              ;0xdeab:   b0  "." 
    POP BC                            ;0xdeac:   c1  "." 
    RET                               ;0xdead:   c9  "." 
    LD HL,(D_FBDB)                    ;0xdeae:   2a db fb  "*.."  
    LD (0x37a0),HL                    ;0xdeb1:   22 a0 37  "".7"  
    LD A,C                            ;0xdeb4:   79  "y" 
    LD (D_FBE5),A                     ;0xdeb5:   32 e5 fb  "2.."  
    CALL 0x3aa6                       ;0xdeb8:   cd a6 3a  "..:" 
    LD A,0xff                         ;0xdebb:   3e ff  ">."  
    LD (0x379d),A                     ;0xdebd:   32 9d 37  "2.7"  
    RET                               ;0xdec0:   c9  "." 
    LD C,15                           ;0xdec1:   0e 0f  ".."  
    JP 0x23f7                         ;0xdec3:   c3 f7 23  "..#" 
    LD C,12                           ;0xdec6:   0e 0c  ".."  
    CALL 0x23dd                       ;0xdec8:   cd dd 23  "..#" 
    CALL 0x2201                       ;0xdecb:   cd 01 22  ".."" 
    DEFB 0xcd                         ;0xdece:   ('M') + 0x80
    DEFB 0xf5                         ;0xdecf:   ('u') + 0x80
    DEFB 0x20                         ;0xded0:   " "
    DEFB 0x52                         ;0xded1:   "R"
    DEFB 0x21                         ;0xded2:   "!"
    DEFB 0xcd                         ;0xded3:   ('M') + 0x80
    DEFB 0x58                         ;0xded4:   "X"
    DEFB 0x21                         ;0xded5:   "!"
    DEFB 0xcd                         ;0xded6:   ('M') + 0x80
    DEFB 0xde                         ;0xded7:   ('^') + 0x80
    DEFB 0x22                         ;0xded8:   """
    DEFB 0x44                         ;0xded9:   "D"
    DEFB 0x4d                         ;0xdeda:   "M"
    DEFB 0x2a                         ;0xdedb:   "*"
    DEFB 0x77                         ;0xdedc:   "w"
;--------------------------------------
C_DEDD:                               ; XREF: 0xFE03 
    SCF                               ;0xdedd:   37  "7" 
    LD (HL),1                         ;0xdede:   36 01  "6."  
    NOP                               ;0xdee0:   00  "." 
    INC HL                            ;0xdee1:   23  "#" 
    DEC BC                            ;0xdee2:   0b  "." 
    LD A,B                            ;0xdee3:   78  "x" 
    OR C                              ;0xdee4:   b1  "." 
    JP nz, 0x230d                     ;0xdee5:   c2 0d 23  "..#" 
    LD HL,(0x376f)                    ;0xdee8:   2a 6f 37  "*o7"  
    LD (HL),A                         ;0xdeeb:   77  "w" 
    LD HL,(0x3789)                    ;0xdeec:   2a 89 37  "*.7"  
    EX DE,HL                          ;0xdeef:   eb  "." 
    LD HL,(0x3777)                    ;0xdef0:   2a 77 37  "*w7"  
    LD (HL),E                         ;0xdef3:   73  "s" 
    INC HL                            ;0xdef4:   23  "#" 
    LD (HL),D                         ;0xdef5:   72  "r" 
    CALL 0x1d80                       ;0xdef6:   cd 80 1d  "..." 
    LD HL,(0x3769)                    ;0xdef9:   2a 69 37  "*i7"  
    LD (HL),4                         ;0xdefc:   36 04  "6."  
    INC HL                            ;0xdefe:   23  "#" 
    LD (HL),1                         ;0xdeff:   36 01  "6."  
    NOP                               ;0xdf01:   00  "." 
    CALL 0x2201                       ;0xdf02:   cd 01 22  ".."" 
    LD HL,(0x377d)                    ;0xdf05:   2a 7d 37  "*}7"  
    LD (0x37b1),HL                    ;0xdf08:   22 b1 37  "".7"  
    LD C,0xff                         ;0xdf0b:   0e ff  ".."  
    CALL 0x2208                       ;0xdf0d:   cd 08 22  ".."" 
    CALL 0x21f8                       ;0xdf10:   cd f8 21  "..!" 
    JP z, 0x3c6a                      ;0xdf13:   ca 6a 3c  ".j<" 
    CALL 0x2040                       ;0xdf16:   cd 40 20  ".@ " 
    EX DE,HL                          ;0xdf19:   eb  "." 
    LD HL,(0x37b1)                    ;0xdf1a:   2a b1 37  "*.7"  
    LD A,H                            ;0xdf1d:   7c  "|" 
    AND L                             ;0xdf1e:   a5  "." 
    INC A                             ;0xdf1f:   3c  "<" 
    EX DE,HL                          ;0xdf20:   eb  "." 
    CALL nz, 0x3a8f                   ;0xdf21:   c4 8f 3a  "..:" 
    LD A,0x21                         ;0xdf24:   3e 21  ">!"  
    CP (HL)                           ;0xdf26:   be  "." 
    JP z, 0x2338                      ;0xdf27:   ca 38 23  ".8#" 
    LD A,0xe5                         ;0xdf2a:   3e e5  ">."  
    CP (HL)                           ;0xdf2c:   be  "." 
    JP z, 0x2338                      ;0xdf2d:   ca 38 23  ".8#" 
    LD A,0x20                         ;0xdf30:   3e 20  "> "  
    CP (HL)                           ;0xdf32:   be  "." 
;--------------------------------------
C_DF33:                               ; XREF: 0xEFB6 
    JP z, 0x2374                      ;0xdf33:   ca 74 23  ".t#" 
    LD A,0x10                         ;0xdf36:   3e 10  ">."  
    AND (HL)                          ;0xdf38:   a6  "." 
    JP nz, 0x236e                     ;0xdf39:   c2 6e 23  ".n#" 
    LD C,1                            ;0xdf3c:   0e 01  ".."  
    CALL 0x22a6                       ;0xdf3e:   cd a6 22  ".."" 
    CALL 0x2076                       ;0xdf41:   cd 76 20  ".v " 
    JP 0x2338                         ;0xdf44:   c3 38 23  ".8#" 
    LD DE,0x10c                       ;0xdf47:   11 0c 01  "..."  
    NOP                               ;0xdf4a:   00  "." 
    ADD HL,DE                         ;0xdf4b:   19  "." 
    LD A,(HL)                         ;0xdf4c:   7e  "~" 
    LD HL,(0x376f)                    ;0xdf4d:   2a 6f 37  "*o7"  
    LD (HL),A                         ;0xdf50:   77  "w" 
    JP 0x236e                         ;0xdf51:   c3 6e 23  ".n#" 
    LD D,H                            ;0xdf54:   54  "T" 
    LD E,L                            ;0xdf55:   5d  "]" 
    ADD HL,BC                         ;0xdf56:   09  "." 
    POP AF                            ;0xdf57:   f1  "." 
    JP z, 0xfc4b                      ;0xdf58:   ca 4b fc  ".K." 
    EX DE,HL                          ;0xdf5b:   eb  "." 
    JP 0xfc4b                         ;0xdf5c:   c3 4b fc  ".K." 
    PUSH BC                           ;0xdf5f:   c5  "." 
    CALL 0x22a6                       ;0xdf60:   cd a6 22  ".."" 
    POP BC                            ;0xdf63:   c1  "." 
    PUSH BC                           ;0xdf64:   c5  "." 
    CALL 0x22de                       ;0xdf65:   cd de 22  ".."" 
    EX DE,HL                          ;0xdf68:   eb  "." 
    LD HL,(0x3777)                    ;0xdf69:   2a 77 37  "*w7"  
    POP BC                            ;0xdf6c:   c1  "." 
    PUSH HL                           ;0xdf6d:   e5  "." 
    ADD HL,DE                         ;0xdf6e:   19  "." 
    LD (0x3777),HL                    ;0xdf6f:   22 77 37  ""w7"  
    CALL 0x22a6                       ;0xdf72:   cd a6 22  ".."" 
    POP HL                            ;0xdf75:   e1  "." 
    LD (0x3777),HL                    ;0xdf76:   22 77 37  ""w7"  
    RET                               ;0xdf79:   c9  "." 
    CALL 0x2040                       ;0xdf7a:   cd 40 20  ".@ " 
    LD DE,0x110                       ;0xdf7d:   11 10 01  "..."  
    NOP                               ;0xdf80:   00  "." 
    ADD HL,DE                         ;0xdf81:   19  "." 
    PUSH BC                           ;0xdf82:   c5  "." 
    LD C,0x11                         ;0xdf83:   0e 11  ".."  
    POP DE                            ;0xdf85:   d1  "." 
    DEC C                             ;0xdf86:   0d  "." 
    RET z                             ;0xdf87:   c8  "." 
    PUSH DE                           ;0xdf88:   d5  "." 
    LD A,(0x37a3)                     ;0xdf89:   3a a3 37  ":.7"  
    OR A                              ;0xdf8c:   b7  "." 
    JP z, 0x22c3                      ;0xdf8d:   ca c3 22  ".."" 
    PUSH BC                           ;0xdf90:   c5  "." 
    PUSH HL                           ;0xdf91:   e5  "." 
    LD C,(HL)                         ;0xdf92:   4e  "N" 
    LD B,1                            ;0xdf93:   06 01  ".."  
    NOP                               ;0xdf95:   00  "." 
    JP 0x22c9                         ;0xdf96:   c3 c9 22  ".."" 
    DEC C                             ;0xdf99:   0d  "." 
    PUSH BC                           ;0xdf9a:   c5  "." 
    LD C,(HL)                         ;0xdf9b:   4e  "N" 
    INC HL                            ;0xdf9c:   23  "#" 
    LD B,(HL)                         ;0xdf9d:   46  "F" 
    PUSH HL                           ;0xdf9e:   e5  "." 
    LD A,C                            ;0xdf9f:   79  "y" 
    OR B                              ;0xdfa0:   b0  "." 
    JP z, 0x22d8                      ;0xdfa1:   ca d8 22  ".."" 
    LD HL,(0x3785)                    ;0xdfa4:   2a 85 37  "*.7"  
    LD A,L                            ;0xdfa7:   7d  "}" 
    SUB C                             ;0xdfa8:   91  "." 
    LD A,H                            ;0xdfa9:   7c  "|" 
    SBC A,B                           ;0xdfaa:   98  "." 
    CALL nc, 0x2268                   ;0xdfab:   d4 68 22  ".h"" 
    POP HL                            ;0xdfae:   e1  "." 
    INC HL                            ;0xdfaf:   23  "#" 
    POP BC                            ;0xdfb0:   c1  "." 
    JP 0x22b0                         ;0xdfb1:   c3 b0 22  ".."" 
    LD HL,(0x3785)                    ;0xdfb4:   2a 85 37  "*.7"  
    LD C,3                            ;0xdfb7:   0e 03  ".."  
    CALL 0x1fab                       ;0xdfb9:   cd ab 1f  "..." 
    INC HL                            ;0xdfbc:   23  "#" 
    RET                               ;0xdfbd:   c9  "." 
    CALL 0x210c                       ;0xdfbe:   cd 0c 21  "..!" 
    LD (HL),1                         ;0xdfc1:   36 01  "6."  
    NOP                               ;0xdfc3:   00  "." 
    CALL 0x1deb                       ;0xdfc4:   cd eb 1d  "..." 
    JP nz, 0x22ff                     ;0xdfc7:   c2 ff 22  ".."" 
    LD HL,(0x3771)                    ;0xdfca:   2a 71 37  "*q7"  
    CP (HL)                           ;0xdfcd:   be  "." 
    LD (BC),A                         ;0xdfce:   02  "." 
    NOP                               ;0xdfcf:   00  "." 
    JP z, 0x22ff                      ;0xdfd0:   ca ff 22  ".."" 
    JP 0x3c40                         ;0xdfd3:   c3 40 3c  ".@<" 
    CALL 0x21c9                       ;0xdfd6:   cd c9 21  "..!" 
    RST 0x38                          ;0xdfd9:   ff  "." 
    RST 0x38                          ;0xdfda:   ff  "." 
    LD (D_FBE1),HL                    ;0xdfdb:   22 e1 fb  "".."  
    RET                               ;0xdfde:   c9  "." 
    CALL 0x220e                       ;0xdfdf:   cd 0e 22  ".."" 
    JP 0x2240                         ;0xdfe2:   c3 40 22  ".@"" 
    LD HL,(0x3787)                    ;0xdfe5:   2a 87 37  "*.7"  
    EX DE,HL                          ;0xdfe8:   eb  "." 
    LD HL,(D_FBE1)                    ;0xdfe9:   2a e1 fb  "*.."  
    INC HL                            ;0xdfec:   23  "#" 
    LD (D_FBE1),HL                    ;0xdfed:   22 e1 fb  "".."  
    CALL 0x207f                       ;0xdff0:   cd 7f 20  ".. " 
    JP c, 0x2201                      ;0xdff3:   da 01 22  ".."" 
    LD A,(D_FBE1)                     ;0xdff6:   3a e1 fb  ":.."  
    AND 3                             ;0xdff9:   e6 03  ".." 
    LD B,5                            ;0xdffb:   06 05  ".."  
    ADD A,A                           ;0xdffd:   87  "." 
    DEC B                             ;0xdffe:   05  "." 
    JP nz, 0x2226                     ;0xdfff:   c2 26 22  ".&"" 
    LD (0x37b7),A                     ;0xe002:   32 b7 37  "2.7"  
    OR A                              ;0xe005:   b7  "." 
    RET nz                            ;0xe006:   c0  "." 
    PUSH BC                           ;0xe007:   c5  "." 
    CALL 0x2192                       ;0xe008:   cd 92 21  "..!" 
    POP BC                            ;0xe00b:   c1  "." 
    LD A,(D_FBDE)                     ;0xe00c:   3a de fb  ":.."  
    OR A                              ;0xe00f:   b7  "." 
    RET nz                            ;0xe010:   c0  "." 
    JP 0x2088                         ;0xe011:   c3 88 20  ".. " 
    CALL 0x2230                       ;0xe014:   cd 30 22  ".0"" 
    LD A,(D_FBDE)                     ;0xe017:   3a de fb  ":.."  
    OR A                              ;0xe01a:   b7  "." 
    RET z                             ;0xe01b:   c8  "." 
    CALL 0x2113                       ;0xe01c:   cd 13 21  "..!" 
    CALL 0x212b                       ;0xe01f:   cd 2b 21  ".+!" 
    JP 0x2192                         ;0xe022:   c3 92 21  "..!" 
    LD A,C                            ;0xe025:   79  "y" 
    AND 7                             ;0xe026:   e6 07  ".." 
    INC A                             ;0xe028:   3c  "<" 
    LD E,A                            ;0xe029:   5f  "_" 
    LD D,A                            ;0xe02a:   57  "W" 
    LD H,B                            ;0xe02b:   60  "`" 
    LD L,C                            ;0xe02c:   69  "i" 
    LD C,3                            ;0xe02d:   0e 03  ".."  
    CALL 0x1fab                       ;0xe02f:   cd ab 1f  "..." 
    LD B,H                            ;0xe032:   44  "D" 
    LD C,L                            ;0xe033:   4d  "M" 
    LD HL,(0x3777)                    ;0xe034:   2a 77 37  "*w7"  
    ADD HL,BC                         ;0xe037:   09  "." 
    LD A,(HL)                         ;0xe038:   7e  "~" 
    RLCA                              ;0xe039:   07  "." 
    DEC E                             ;0xe03a:   1d  "." 
    JP nz, 0x2262                     ;0xe03b:   c2 62 22  ".b"" 
    RET                               ;0xe03e:   c9  "." 
    PUSH DE                           ;0xe03f:   d5  "." 
    CALL 0x224e                       ;0xe040:   cd 4e 22  ".N"" 
    AND 0xfe                          ;0xe043:   e6 fe  ".." 
    POP BC                            ;0xe045:   c1  "." 
    OR C                              ;0xe046:   b1  "." 
    RRCA                              ;0xe047:   0f  "." 
    DEC D                             ;0xe048:   15  "." 
    JP nz, 0x2270                     ;0xe049:   c2 70 22  ".p"" 
    LD (HL),A                         ;0xe04c:   77  "w" 
    RET                               ;0xe04d:   c9  "." 
    PUSH AF                           ;0xe04e:   f5  "." 
    CALL 0x22de                       ;0xe04f:   cd de 22  ".."" 
    LD B,H                            ;0xe052:   44  "D" 
    LD C,L                            ;0xe053:   4d  "M" 
    LD HL,(0x3777)                    ;0xe054:   2a 77 37  "*w7"  
    LD H,L                            ;0xe057:   65  "e" 
    LD HL,0x11d5                      ;0xe058:   21 d5 11  "!.."  
    LD A,(BC)                         ;0xe05b:   0a  "." 
    LD BC,0x1900                      ;0xe05c:   01 00 19  "..."  
    LD E,(HL)                         ;0xe05f:   5e  "^" 
    INC HL                            ;0xe060:   23  "#" 
    LD D,(HL)                         ;0xe061:   56  "V" 
    INC HL                            ;0xe062:   23  "#" 
    LD A,(HL)                         ;0xe063:   7e  "~" 
    LD (0x37fa),A                     ;0xe064:   32 fa 37  "2.7"  
    EX DE,HL                          ;0xe067:   eb  "." 
    POP DE                            ;0xe068:   d1  "." 
    RET                               ;0xe069:   c9  "." 
    CALL 0x1df5                       ;0xe06a:   cd f5 1d  "..." 
    LD A,3                            ;0xe06d:   3e 03  ">."  
    JP 0x21a2                         ;0xe06f:   c3 a2 21  "..!" 
    CALL 0x2039                       ;0xe072:   cd 39 20  ".9 " 
    CALL 0x2086                       ;0xe075:   cd 86 20  ".. " 
    LD A,5                            ;0xe078:   3e 05  ">."  
    LD HL,2                           ;0xe07a:   21 02 00  "!.."  
    LD (0x3796),HL                    ;0xe07d:   22 96 37  "".7"  
    LD HL,(0x3779)                    ;0xe080:   2a 79 37  "*y7"  
    CP 5                              ;0xe083:   fe 05  ".." 
    JP nz, 0x21b3                     ;0xe085:   c2 b3 21  "..!" 
    LD HL,(0x37f0)                    ;0xe088:   2a f0 37  "*.7"  
    CALL 0x3858                       ;0xe08b:   cd 58 38  ".X8" 
    LD HL,(D_FBD8)                    ;0xe08e:   2a d8 fb  "*.."  
    JP 0x21bf                         ;0xe091:   c3 bf 21  "..!" 
    CALL 0x2182                       ;0xe094:   cd 82 21  "..!" 
    LD (D_F61B),HL                    ;0xe097:   22 1b f6  "".."  
    RET                               ;0xe09a:   c9  "." 
    LD HL,(0x3767)                    ;0xe09b:   2a 67 37  "*g7"  
    EX DE,HL                          ;0xe09e:   eb  "." 
    LD HL,(D_F619)                    ;0xe09f:   2a 19 f6  "*.."  
    LD BC,0x180                       ;0xe0a2:   01 80 01  "..."  
    NOP                               ;0xe0a5:   00  "." 
    CALL 0xfc4b                       ;0xe0a6:   cd 4b fc  ".K." 
    LD HL,0x1c9f                      ;0xe0a9:   21 9f 1c  "!.."  
    LD A,(HL)                         ;0xe0ac:   7e  "~" 
    INC A                             ;0xe0ad:   3c  "<" 
    RET z                             ;0xe0ae:   c8  "." 
    LD A,(D_FBE1)                     ;0xe0af:   3a e1 fb  ":.."  
    AND 3                             ;0xe0b2:   e6 03  ".." 
    LD (HL),A                         ;0xe0b4:   77  "w" 
    RET                               ;0xe0b5:   c9  "." 
    CALL 0x2062                       ;0xe0b6:   cd 62 20  ".b " 
    INC HL                            ;0xe0b9:   23  "#" 
    INC HL                            ;0xe0ba:   23  "#" 
    LD A,0xff                         ;0xe0bb:   3e ff  ">."  
    LD (HL),A                         ;0xe0bd:   77  "w" 
    INC HL                            ;0xe0be:   23  "#" 
    LD (HL),A                         ;0xe0bf:   77  "w" 
    RET                               ;0xe0c0:   c9  "." 
    CALL 0x1ec4                       ;0xe0c1:   cd c4 1e  "..." 
    JP 0x21fb                         ;0xe0c4:   c3 fb 21  "..!" 
    CALL 0x21e8                       ;0xe0c7:   cd e8 21  "..!" 
    RET nz                            ;0xe0ca:   c0  "." 
    POP HL                            ;0xe0cb:   e1  "." 
    LD A,9                            ;0xe0cc:   3e 09  ">."  
    JP 0x1972                         ;0xe0ce:   c3 72 19  ".r." 
    LD HL,D_FBE1                      ;0xe0d1:   21 e1 fb  "!.."  
    LD A,(HL)                         ;0xe0d4:   7e  "~" 
    INC HL                            ;0xe0d5:   23  "#" 
    CP (HL)                           ;0xe0d6:   be  "." 
    RET nz                            ;0xe0d7:   c0  "." 
    INC A                             ;0xe0d8:   3c  "<" 
    EI                                ;0xe0d9:   fb  "." 
    LD B,A                            ;0xe0da:   47  "G" 
    LD A,(HL)                         ;0xe0db:   7e  "~" 
    CP B                              ;0xe0dc:   b8  "." 
    RET z                             ;0xe0dd:   c8  "." 
    INC HL                            ;0xe0de:   23  "#" 
    OR A                              ;0xe0df:   b7  "." 
    JP nz, 0x2102                     ;0xe0e0:   c2 02 21  "..!" 
    INC A                             ;0xe0e3:   3c  "<" 
    RET                               ;0xe0e4:   c9  "." 
    LD HL,(0x3771)                    ;0xe0e5:   2a 71 37  "*q7"  
    INC HL                            ;0xe0e8:   23  "#" 
    LD A,(HL)                         ;0xe0e9:   7e  "~" 
    OR A                              ;0xe0ea:   b7  "." 
    RET                               ;0xe0eb:   c9  "." 
    LD HL,0x373b                      ;0xe0ec:   21 3b 37  "!;7"  
    PUSH HL                           ;0xe0ef:   e5  "." 
    LD HL,0x37cd                      ;0xe0f0:   21 cd 37  "!.7"  
    CALL 0x20fe                       ;0xe0f3:   cd fe 20  ".. " 
    JP z, 0x1ff9                      ;0xe0f6:   ca f9 1f  "..." 
    LD HL,0x37d4                      ;0xe0f9:   21 d4 37  "!.7"  
    CALL 0x20fe                       ;0xe0fc:   cd fe 20  ".. " 
    JP z, 0x24c0                      ;0xe0ff:   ca c0 24  "..$" 
    POP HL                            ;0xe102:   e1  "." 
    RET                               ;0xe103:   c9  "." 
    LD HL,D_FBDE                      ;0xe104:   21 de fb  "!.."  
    LD A,(HL)                         ;0xe107:   7e  "~" 
    OR A                              ;0xe108:   b7  "." 
    RET z                             ;0xe109:   c8  "." 
    LD (HL),1                         ;0xe10a:   36 01  "6."  
    NOP                               ;0xe10c:   00  "." 
    CALL 0x2d6b                       ;0xe10d:   cd 6b 2d  ".k-" 
    LD HL,2                           ;0xe110:   21 02 00  "!.."  
    LD (D_FBE1),HL                    ;0xe113:   22 e1 fb  "".."  
    XOR A                             ;0xe116:   af  "." 
    LD (0x37b7),A                     ;0xe117:   32 b7 37  "2.7"  
    RET                               ;0xe11a:   c9  "." 
    LD HL,(0x3771)                    ;0xe11b:   2a 71 37  "*q7"  
    LD C,(HL)                         ;0xe11e:   4e  "N" 
    CALL 0x1f31                       ;0xe11f:   cd 31 1f  ".1." 
    LD (HL),C                         ;0xe122:   71  "q" 
    RET                               ;0xe123:   c9  "." 
    LD HL,(0x377b)                    ;0xe124:   2a 7b 37  "*{7"  
    LD C,4                            ;0xe127:   0e 04  ".."  
    JP 0x215d                         ;0xe129:   c3 5d 21  ".]!" 
    LD HL,(0x377b)                    ;0xe12c:   2a 7b 37  "*{7"  
    JP 0x215b                         ;0xe12f:   c3 5b 21  ".[!" 
    LD HL,(0x3779)                    ;0xe132:   2a 79 37  "*y7"  
    LD C,1                            ;0xe135:   0e 01  ".."  
    LD A,L                            ;0xe137:   7d  "}" 
    AND H                             ;0xe138:   a4  "." 
    INC A                             ;0xe139:   3c  "<" 
    RET z                             ;0xe13a:   c8  "." 
    LD E,(HL)                         ;0xe13b:   5e  "^" 
    INC HL                            ;0xe13c:   23  "#" 
    LD D,(HL)                         ;0xe13d:   56  "V" 
    EX DE,HL                          ;0xe13e:   eb  "." 
    PUSH HL                           ;0xe13f:   e5  "." 
    PUSH BC                           ;0xe140:   c5  "." 
    LD DE,0x37aa                      ;0xe141:   11 aa 37  "..7"  
    CALL 0x1d1f                       ;0xe144:   cd 1f 1d  "..." 
    POP BC                            ;0xe147:   c1  "." 
    POP HL                            ;0xe148:   e1  "." 
    JP nz, 0x2174                     ;0xe149:   c2 74 21  ".t!" 
    LD (HL),0xff                      ;0xe14c:   36 ff  "6."  
    LD DE,0x10d                       ;0xe14e:   11 0d 01  "..."  
    NOP                               ;0xe151:   00  "." 
    ADD HL,DE                         ;0xe152:   19  "." 
    LD E,(HL)                         ;0xe153:   5e  "^" 
    INC HL                            ;0xe154:   23  "#" 
    LD D,(HL)                         ;0xe155:   56  "V" 
    EX DE,HL                          ;0xe156:   eb  "." 
    LD A,L                            ;0xe157:   7d  "}" 
    OR H                              ;0xe158:   b4  "." 
    RET z                             ;0xe159:   c8  "." 
    JP 0x6f95                         ;0xe15a:   c3 95 6f  "..o" 
    LD A,D                            ;0xe15d:   7a  "z" 
    SBC A,H                           ;0xe15e:   9c  "." 
    LD H,A                            ;0xe15f:   67  "g" 
    RET                               ;0xe160:   c9  "." 
    LD C,0xfe                         ;0xe161:   0e fe  ".."  
    LD HL,(0x3791)                    ;0xe163:   2a 91 37  "*.7"  
    EX DE,HL                          ;0xe166:   eb  "." 
    LD HL,(0x378b)                    ;0xe167:   2a 8b 37  "*.7"  
    LD A,H                            ;0xe16a:   7c  "|" 
    AND 0x7f                          ;0xe16b:   e6 7f  ".." 
    LD H,A                            ;0xe16d:   67  "g" 
    CALL 0x207f                       ;0xe16e:   cd 7f 20  ".. " 
    RET nc                            ;0xe171:   d0  "." 
    PUSH BC                           ;0xe172:   c5  "." 
    CALL 0x1fb8                       ;0xe173:   cd b8 1f  "..." 
    LD HL,(0x3775)                    ;0xe176:   2a 75 37  "*u7"  
    EX DE,HL                          ;0xe179:   eb  "." 
    LD HL,(0x3791)                    ;0xe17a:   2a 91 37  "*.7"  
    ADD HL,DE                         ;0xe17d:   19  "." 
    POP BC                            ;0xe17e:   c1  "." 
    INC C                             ;0xe17f:   0c  "." 
    JP z, 0x20c6                      ;0xe180:   ca c6 20  ".. " 
    INC C                             ;0xe183:   0c  "." 
    JP z, 0x20d1                      ;0xe184:   ca d1 20  ".. " 
    CP (HL)                           ;0xe187:   be  "." 
    RET z                             ;0xe188:   c8  "." 
    CALL 0x201a                       ;0xe189:   cd 1a 20  ".. " 
    LD BC,D_CD00                      ;0xe18c:   01 00 cd  "..."  
    LD D,D                            ;0xe18f:   52  "R" 
    LD HL,S_FF3E                      ;0xe190:   21 3e ff  "!>."  
    LD (D_FBDE),A                     ;0xe193:   32 de fb  "2.."  
    LD (D_FB9C),A                     ;0xe196:   32 9c fb  "2.."  
    CALL 0x20e8                       ;0xe199:   cd e8 20  ".. " 
    CALL 0x2005                       ;0xe19c:   cd 05 20  ".. " 
    JP 0x335a                         ;0xe19f:   c3 5a 33  ".Z3" 
    CP (HL)                           ;0xe1a2:   be  "." 
    LD (HL),A                         ;0xe1a3:   77  "w" 
    RET z                             ;0xe1a4:   c8  "." 
    LD HL,(0x3771)                    ;0xe1a5:   2a 71 37  "*q7"  
    LD A,1                            ;0xe1a8:   3e 01  ">."  
    OR (HL)                           ;0xe1aa:   b6  "." 
    LD (HL),A                         ;0xe1ab:   77  "w" 
    RET                               ;0xe1ac:   c9  "." 
    LD (HL),A                         ;0xe1ad:   77  "w" 
    RET                               ;0xe1ae:   c9  "." 
    LD A,(0x37a4)                     ;0xe1af:   3a a4 37  ":.7"  
    LD DE,0x3763                      ;0xe1b2:   11 63 37  ".c7"  
    CALL 0x200b                       ;0xe1b5:   cd 0b 20  ".. " 
    LD HL,(0x3787)                    ;0xe1b8:   2a 87 37  "*.7"  
    INC HL                            ;0xe1bb:   23  "#" 
    EX DE,HL                          ;0xe1bc:   eb  "." 
    LD HL,(0x3769)                    ;0xe1bd:   2a 69 37  "*i7"  
    LD (HL),E                         ;0xe1c0:   73  "s" 
    INC HL                            ;0xe1c1:   23  "#" 
    LD (HL),D                         ;0xe1c2:   72  "r" 
    RET                               ;0xe1c3:   c9  "." 
    LD HL,(0xfb90)                    ;0xe1c4:   2a 90 fb  "*.."  
    CALL 0x201d                       ;0xe1c7:   cd 1d 20  ".. " 
    RET z                             ;0xe1ca:   c8  "." 
    LD DE,D_FB92                      ;0xe1cb:   11 92 fb  "..."  
    JP 0x2008                         ;0xe1ce:   c3 08 20  ".. " 
    LD A,(0x378c)                     ;0xe1d1:   3a 8c 37  ":.7"  
    AND 0x80                          ;0xe1d4:   e6 80  ".." 
    RET nz                            ;0xe1d6:   c0  "." 
    LD HL,0x37c0                      ;0xe1d7:   21 c0 37  "!.7"  
    LD A,(D_C8DF)                     ;0xe1da:   3a df c8  ":.."  
    ADD HL,HL                         ;0xe1dd:   29  ")" 
    JP 0x1fff                         ;0xe1de:   c3 ff 1f  "..." 
    LD DE,0x3765                      ;0xe1e1:   11 65 37  ".e7"  
    LD A,(0x37a9)                     ;0xe1e4:   3a a9 37  ":.7"  
    LD C,A                            ;0xe1e7:   4f  "O" 
    LD HL,0x101                       ;0xe1e8:   21 01 01  "!.."  
    NOP                               ;0xe1eb:   00  "." 
    CALL 0x1ffe                       ;0xe1ec:   cd fe 1f  "..." 
    LD A,(DE)                         ;0xe1ef:   1a  "." 
    OR L                              ;0xe1f0:   b5  "." 
    LD (DE),A                         ;0xe1f1:   12  "." 
    INC DE                            ;0xe1f2:   13  "." 
    LD A,(DE)                         ;0xe1f3:   1a  "." 
    OR H                              ;0xe1f4:   b4  "." 
    LD (DE),A                         ;0xe1f5:   12  "." 
    RET                               ;0xe1f6:   c9  "." 
    LD HL,(0x3763)                    ;0xe1f7:   2a 63 37  "*c7"  
    LD A,(0x37a9)                     ;0xe1fa:   3a a9 37  ":.7"  
    LD C,A                            ;0xe1fd:   4f  "O" 
    CALL 0x1fab                       ;0xe1fe:   cd ab 1f  "..." 
    LD A,L                            ;0xe201:   7d  "}" 
    AND 1                             ;0xe202:   e6 01  ".." 
    RET                               ;0xe204:   c9  "." 
    CALL 0x2040                       ;0xe205:   cd 40 20  ".@ " 
    CALL 0x2032                       ;0xe208:   cd 32 20  ".2 " 
    RET nc                            ;0xe20b:   d0  "." 
    JP 0x1ca6                         ;0xe20c:   c3 a6 1c  "..." 
    LD DE,0x109                       ;0xe20f:   11 09 01  "..."  
    NOP                               ;0xe212:   00  "." 
    ADD HL,DE                         ;0xe213:   19  "." 
    LD A,(HL)                         ;0xe214:   7e  "~" 
    RLA                               ;0xe215:   17  "." 
    RET                               ;0xe216:   c9  "." 
    CALL 0x201a                       ;0xe217:   cd 1a 20  ".. " 
    RET z                             ;0xe21a:   c8  "." 
    JP 0x1ca1                         ;0xe21b:   c3 a1 1c  "..." 
    LD HL,(0x3767)                    ;0xe21e:   2a 67 37  "*g7"  
    LD A,(0x37b7)                     ;0xe221:   3a b7 37  ":.7"  
    ADD A,L                           ;0xe224:   85  "." 
    LD L,A                            ;0xe225:   6f  "o" 
    RET nc                            ;0xe226:   d0  "." 
    INC H                             ;0xe227:   24  "$" 
    RET                               ;0xe228:   c9  "." 
    LD HL,(D_FBDB)                    ;0xe229:   2a db fb  "*.."  
    LD DE,0x10e                       ;0xe22c:   11 0e 01  "..."  
    NOP                               ;0xe22f:   00  "." 
    ADD HL,DE                         ;0xe230:   19  "." 
    LD A,(HL)                         ;0xe231:   7e  "~" 
    RET                               ;0xe232:   c9  "." 
    CALL 0x204b                       ;0xe233:   cd 4b 20  ".K " 
    LD (HL),1                         ;0xe236:   36 01  "6."  
    NOP                               ;0xe238:   00  "." 
    RET                               ;0xe239:   c9  "." 
    CALL 0x1f3f                       ;0xe23a:   cd 3f 1f  ".?." 
    LD A,(HL)                         ;0xe23d:   7e  "~" 
    AND 0x1f                          ;0xe23e:   e6 1f  ".." 
    LD (HL),A                         ;0xe240:   77  "w" 
    RET                               ;0xe241:   c9  "." 
    CALL 0x204b                       ;0xe242:   cd 4b 20  ".K " 
    OR 0x80                           ;0xe245:   f6 80  ".." 
    LD (HL),A                         ;0xe247:   77  "w" 
    RET                               ;0xe248:   c9  "." 
    LD HL,(D_FBE1)                    ;0xe249:   2a e1 fb  "*.."  
    EX DE,HL                          ;0xe24c:   eb  "." 
    LD HL,(0x3769)                    ;0xe24d:   2a 69 37  "*i7"  
    LD A,E                            ;0xe250:   7b  "{" 
    SUB (HL)                          ;0xe251:   96  "." 
    INC HL                            ;0xe252:   23  "#" 
    LD A,D                            ;0xe253:   7a  "z" 
    SBC A,(HL)                        ;0xe254:   9e  "." 
    RET                               ;0xe255:   c9  "." 
    CALL 0x2069                       ;0xe256:   cd 69 20  ".i " 
    RET c                             ;0xe259:   d8  "." 
    INC DE                            ;0xe25a:   13  "." 
    LD (HL),D                         ;0xe25b:   72  "r" 
    DEC HL                            ;0xe25c:   2b  "+" 
    LD (HL),E                         ;0xe25d:   73  "s" 
    RET                               ;0xe25e:   c9  "." 
    LD A,E                            ;0xe25f:   7b  "{" 
    SCF                               ;0xe260:   37  "7" 
    RET                               ;0xe261:   c9  "." 
    CALL 0x1f4f                       ;0xe262:   cd 4f 1f  ".O." 
    LD A,(0x37a8)                     ;0xe265:   3a a8 37  ":.7"  
    LD (HL),A                         ;0xe268:   77  "w" 
    LD A,(D_FBDF)                     ;0xe269:   3a df fb  ":.."  
    CP 0x16                           ;0xe26c:   fe 16  ".." 
    JP nc, 0x1f92                     ;0xe26e:   d2 92 1f  "..." 
    INC (HL)                          ;0xe271:   34  "4" 
    EX DE,HL                          ;0xe272:   eb  "." 
    LD A,(HL)                         ;0xe273:   7e  "~" 
    CP 0x80                           ;0xe274:   fe 80  ".." 
    RET nc                            ;0xe276:   d0  "." 
    LD A,(0x37a5)                     ;0xe277:   3a a5 37  ":.7"  
    LD (HL),A                         ;0xe27a:   77  "w" 
    RET                               ;0xe27b:   c9  "." 
    CALL 0x1f3f                       ;0xe27c:   cd 3f 1f  ".?." 
    LD (HL),D                         ;0xe27f:   72  "r" 
    INC HL                            ;0xe280:   23  "#" 
    INC HL                            ;0xe281:   23  "#" 
    LD (HL),D                         ;0xe282:   72  "r" 
    RET                               ;0xe283:   c9  "." 
    LD (HL),B                         ;0xe284:   70  "p" 
    INC HL                            ;0xe285:   23  "#" 
    DEC C                             ;0xe286:   0d  "." 
    RET z                             ;0xe287:   c8  "." 
    JP 0x1fa4                         ;0xe288:   c3 a4 1f  "..." 
    INC C                             ;0xe28b:   0c  "." 
    DEC C                             ;0xe28c:   0d  "." 
    RET z                             ;0xe28d:   c8  "." 
    LD A,H                            ;0xe28e:   7c  "|" 
    OR A                              ;0xe28f:   b7  "." 
    RRA                               ;0xe290:   1f  "." 
    LD H,A                            ;0xe291:   67  "g" 
    LD A,L                            ;0xe292:   7d  "}" 
    RRA                               ;0xe293:   1f  "." 
    LD L,A                            ;0xe294:   6f  "o" 
    JP 0x1fac                         ;0xe295:   c3 ac 1f  "..." 
    LD HL,(0x3767)                    ;0xe298:   2a 67 37  "*g7"  
    LD BC,0x104                       ;0xe29b:   01 04 01  "..."  
    NOP                               ;0xe29e:   00  "." 
    LD D,0x20                         ;0xe29f:   16 20  ". "  
    XOR A                             ;0xe2a1:   af  "." 
    ADD A,(HL)                        ;0xe2a2:   86  "." 
    INC HL                            ;0xe2a3:   23  "#" 
    DEC D                             ;0xe2a4:   15  "." 
    JP nz, 0x1fc1                     ;0xe2a5:   c2 c1 1f  "..." 
    XOR B                             ;0xe2a8:   a8  "." 
    LD B,A                            ;0xe2a9:   47  "G" 
    DEC C                             ;0xe2aa:   0d  "." 
    JP nz, 0x1fbe                     ;0xe2ab:   c2 be 1f  "..." 
    RET                               ;0xe2ae:   c9  "." 
    CALL 0x1f31                       ;0xe2af:   cd 31 1f  ".1." 
    LD HL,(0x3771)                    ;0xe2b2:   2a 71 37  "*q7"  
    CP (HL)                           ;0xe2b5:   be  "." 
    CALL nz, 0x1fe3                   ;0xe2b6:   c4 e3 1f  "..." 
    LD A,(0x37b5)                     ;0xe2b9:   3a b5 37  ":.7"  
    OR A                              ;0xe2bc:   b7  "." 
    RET z                             ;0xe2bd:   c8  "." 
    LD HL,(D_FBDB)                    ;0xe2be:   2a db fb  "*.."  
    XOR A                             ;0xe2c1:   af  "." 
    LD (HL),A                         ;0xe2c2:   77  "w" 
    RET                               ;0xe2c3:   c9  "." 
    LD HL,(D_F61E)                    ;0xe2c4:   2a 1e f6  "*.."  
    EX DE,HL                          ;0xe2c7:   eb  "." 
    LD HL,(0xfbfe)                    ;0xe2c8:   2a fe fb  "*.."  
    CALL 0x207f                       ;0xe2cb:   cd 7f 20  ".. " 
    JP nc, 0x1ff7                     ;0xe2ce:   d2 f7 1f  "..." 
    LD HL,(D_FB92)                    ;0xe2d1:   2a 92 fb  "*.."  
    CALL 0x201d                       ;0xe2d4:   cd 1d 20  ".. " 
    RET z                             ;0xe2d7:   c8  "." 
    POP HL                            ;0xe2d8:   e1  "." 
    POP HL                            ;0xe2d9:   e1  "." 
    LD A,10                           ;0xe2da:   3e 0a  ">."  
    JP 0x1972                         ;0xe2dc:   c3 72 19  ".r." 
    INC C                             ;0xe2df:   0c  "." 
    DEC C                             ;0xe2e0:   0d  "." 
    LD (0x37ad),A                     ;0xe2e1:   32 ad 37  "2.7"  
    LD (0x37b1),HL                    ;0xe2e4:   22 b1 37  "".7"  
    LD A,(0x3783)                     ;0xe2e7:   3a 83 37  ":.7"  
    LD C,A                            ;0xe2ea:   4f  "O" 
    LD A,(0x37a8)                     ;0xe2eb:   3a a8 37  ":.7"  
    AND C                             ;0xe2ee:   a1  "." 
    LD B,A                            ;0xe2ef:   47  "G" 
    LD (0x3793),A                     ;0xe2f0:   32 93 37  "2.7"  
    LD HL,0x37ab                      ;0xe2f3:   21 ab 37  "!.7"  
    OR (HL)                           ;0xe2f6:   b6  "." 
    LD (HL),A                         ;0xe2f7:   77  "w" 
    RET                               ;0xe2f8:   c9  "." 
    LD HL,(D_FBDB)                    ;0xe2f9:   2a db fb  "*.."  
    LD DE,0x108                       ;0xe2fc:   11 08 01  "..."  
    NOP                               ;0xe2ff:   00  "." 
    ADD HL,DE                         ;0xe300:   19  "." 
    LD C,4                            ;0xe301:   0e 04  ".."  
    LD A,(HL)                         ;0xe303:   7e  "~" 
    ADD A,A                           ;0xe304:   87  "." 
    PUSH AF                           ;0xe305:   f5  "." 
    LD A,D                            ;0xe306:   7a  "z" 
    RRA                               ;0xe307:   1f  "." 
    LD D,A                            ;0xe308:   57  "W" 
    POP AF                            ;0xe309:   f1  "." 
    RRCA                              ;0xe30a:   0f  "." 
    LD (HL),A                         ;0xe30b:   77  "w" 
    DEC HL                            ;0xe30c:   2b  "+" 
    DEC C                             ;0xe30d:   0d  "." 
    JP nz, 0x1f21                     ;0xe30e:   c2 21 1f  ".!." 
    LD A,D                            ;0xe311:   7a  "z" 
    RET                               ;0xe312:   c9  "." 
    CALL 0x1f3f                       ;0xe313:   cd 3f 1f  ".?." 
    INC HL                            ;0xe316:   23  "#" 
    LD A,(HL)                         ;0xe317:   7e  "~" 
    RET                               ;0xe318:   c9  "." 
    LD HL,(D_FBDB)                    ;0xe319:   2a db fb  "*.."  
    LD DE,0x121                       ;0xe31c:   11 21 01  ".!."  
    NOP                               ;0xe31f:   00  "." 
    ADD HL,DE                         ;0xe320:   19  "." 
    RET                               ;0xe321:   c9  "." 
    LD HL,(D_FBDB)                    ;0xe322:   2a db fb  "*.."  
    LD DE,0x10c                       ;0xe325:   11 0c 01  "..."  
    NOP                               ;0xe328:   00  "." 
    ADD HL,DE                         ;0xe329:   19  "." 
    RET                               ;0xe32a:   c9  "." 
    LD HL,(D_FBDB)                    ;0xe32b:   2a db fb  "*.."  
    LD DE,0x10f                       ;0xe32e:   11 0f 01  "..."  
    NOP                               ;0xe331:   00  "." 
    ADD HL,DE                         ;0xe332:   19  "." 
    RET                               ;0xe333:   c9  "." 
    CALL 0x1f47                       ;0xe334:   cd 47 1f  ".G." 
    EX DE,HL                          ;0xe337:   eb  "." 
    LD HL,0x111                       ;0xe338:   21 11 01  "!.."  
    NOP                               ;0xe33b:   00  "." 
    ADD HL,DE                         ;0xe33c:   19  "." 
    RET                               ;0xe33d:   c9  "." 
    CALL 0x1f4f                       ;0xe33e:   cd 4f 1f  ".O." 
    LD A,(HL)                         ;0xe341:   7e  "~" 
    LD (0x37a8),A                     ;0xe342:   32 a8 37  "2.7"  
    EX DE,HL                          ;0xe345:   eb  "." 
    LD A,(HL)                         ;0xe346:   7e  "~" 
    OR A                              ;0xe347:   b7  "." 
    JP nz, 0x1f6d                     ;0xe348:   c2 6d 1f  ".m." 
    CALL 0x2397                       ;0xe34b:   cd 97 23  "..#" 
    LD C,A                            ;0xe34e:   4f  "O" 
    CALL 0x26fd                       ;0xe34f:   cd fd 26  "..&" 
    LD A,(HL)                         ;0xe352:   7e  "~" 
    CP 0x81                           ;0xe353:   fe 81  ".." 
    JP c, 0x1f74                      ;0xe355:   da 74 1f  ".t." 
    LD A,0x80                         ;0xe358:   3e 80  ">."  
    LD (0x37a5),A                     ;0xe35a:   32 a5 37  "2.7"  
    CALL 0x1f3f                       ;0xe35d:   cd 3f 1f  ".?." 
    LD A,(0x3784)                     ;0xe360:   3a 84 37  ":.7"  
    AND (HL)                          ;0xe363:   a6  "." 
    LD (0x67a6),A                     ;0xe364:   32 a6 67  "2.g"  
    CALL 0x1e9d                       ;0xe367:   cd 9d 1e  "..." 
    LD B,H                            ;0xe36a:   44  "D" 
    LD C,L                            ;0xe36b:   4d  "M" 
    LD HL,(0x379a)                    ;0xe36c:   2a 9a 37  "*.7"  
    EX DE,HL                          ;0xe36f:   eb  "." 
    CALL 0xfc30                       ;0xe370:   cd 30 fc  ".0." 
    LD C,L                            ;0xe373:   4d  "M" 
    LD B,H                            ;0xe374:   44  "D" 
    LD (0x37fd),HL                    ;0xe375:   22 fd 37  "".7"  
    CALL 0xfc21                       ;0xe378:   cd 21 fc  ".!." 
    LD HL,(D_F61B)                    ;0xe37b:   2a 1b f6  "*.."  
    LD C,L                            ;0xe37e:   4d  "M" 
    LD B,H                            ;0xe37f:   44  "D" 
    JP 0xfc24                         ;0xe380:   c3 24 fc  ".$." 
    LD A,(0x378f)                     ;0xe383:   3a 8f 37  ":.7"  
    LD C,A                            ;0xe386:   4f  "O" 
    JP 0x1fab                         ;0xe387:   c3 ab 1f  "..." 
    LD HL,0x3782                      ;0xe38a:   21 82 37  "!.7"  
    LD C,(HL)                         ;0xe38d:   4e  "N" 
    LD A,(0x37a8)                     ;0xe38e:   3a a8 37  ":.7"  
    OR A                              ;0xe391:   b7  "." 
    RRA                               ;0xe392:   1f  "." 
    DEC C                             ;0xe393:   0d  "." 
    JP nz, 0x1eab                     ;0xe394:   c2 ab 1e  "..." 
    LD B,A                            ;0xe397:   47  "G" 
    LD A,8                            ;0xe398:   3e 08  ">."  
    SUB (HL)                          ;0xe39a:   96  "." 
    LD C,A                            ;0xe39b:   4f  "O" 
    LD A,(0x37a6)                     ;0xe39c:   3a a6 37  ":.7"  
    DEC C                             ;0xe39f:   0d  "." 
    JP z, 0x1ec2                      ;0xe3a0:   ca c2 1e  "..." 
    OR A                              ;0xe3a3:   b7  "." 
    RLA                               ;0xe3a4:   17  "." 
    JP 0x1eb9                         ;0xe3a5:   c3 b9 1e  "..." 
    ADD A,B                           ;0xe3a8:   80  "." 
    RET                               ;0xe3a9:   c9  "." 
    LD HL,(D_FBDB)                    ;0xe3aa:   2a db fb  "*.."  
    LD DE,0x110                       ;0xe3ad:   11 10 01  "..."  
    NOP                               ;0xe3b0:   00  "." 
    ADD HL,DE                         ;0xe3b1:   19  "." 
    RET                               ;0xe3b2:   c9  "." 
    CALL 0x1ec4                       ;0xe3b3:   cd c4 1e  "..." 
    ADD HL,BC                         ;0xe3b6:   09  "." 
    LD A,(0x37a3)                     ;0xe3b7:   3a a3 37  ":.7"  
    OR A                              ;0xe3ba:   b7  "." 
    JP z, 0x1eda                      ;0xe3bb:   ca da 1e  "..." 
    LD L,(HL)                         ;0xe3be:   6e  "n" 
    LD H,B                            ;0xe3bf:   60  "`" 
    RET                               ;0xe3c0:   c9  "." 
    ADD HL,BC                         ;0xe3c1:   09  "." 
    LD A,(HL)                         ;0xe3c2:   7e  "~" 
    INC HL                            ;0xe3c3:   23  "#" 
    LD H,(HL)                         ;0xe3c4:   66  "f" 
    LD L,A                            ;0xe3c5:   6f  "o" 
    RET                               ;0xe3c6:   c9  "." 
    CALL 0x1ea4                       ;0xe3c7:   cd a4 1e  "..." 
    LD (0x379f),A                     ;0xe3ca:   32 9f 37  "2.7"  
    LD C,A                            ;0xe3cd:   4f  "O" 
    LD B,1                            ;0xe3ce:   06 01  ".."  
    NOP                               ;0xe3d0:   00  "." 
    CALL 0x1ecc                       ;0xe3d1:   cd cc 1e  "..." 
    LD (0x37ab),HL                    ;0xe3d4:   22 ab 37  "".7"  
    LD A,L                            ;0xe3d7:   7d  "}" 
    OR H                              ;0xe3d8:   b4  "." 
    RET                               ;0xe3d9:   c9  "." 
    LD A,(0x3782)                     ;0xe3da:   3a 82 37  ":.7"  
    LD C,A                            ;0xe3dd:   4f  "O" 
    LD HL,(0x37ab)                    ;0xe3de:   2a ab 37  "*.7"  
    XOR A                             ;0xe3e1:   af  "." 
    CALL 0x1cf6                       ;0xe3e2:   cd f6 1c  "..." 
    LD (0x37ab),HL                    ;0xe3e5:   22 ab 37  "".7"  
    LD B,1                            ;0xe3e8:   06 01  ".."  
    NOP                               ;0xe3ea:   00  "." 
    EX DE,HL                          ;0xe3eb:   eb  "." 
    LD HL,0x37ab                      ;0xe3ec:   21 ab 37  "!.7"  
    LD (HL),E                         ;0xe3ef:   73  "s" 
    INC HL                            ;0xe3f0:   23  "#" 
    LD (HL),D                         ;0xe3f1:   72  "r" 
    INC HL                            ;0xe3f2:   23  "#" 
    LD (HL),B                         ;0xe3f3:   70  "p" 
    RET                               ;0xe3f4:   c9  "." 
    LD HL,(0x376b)                    ;0xe3f5:   2a 6b 37  "*k7"  
    LD C,(HL)                         ;0xe3f8:   4e  "N" 
    INC HL                            ;0xe3f9:   23  "#" 
    LD B,(HL)                         ;0xe3fa:   46  "F" 
    PUSH BC                           ;0xe3fb:   c5  "." 
    LD HL,(0x376d)                    ;0xe3fc:   2a 6d 37  "*m7"  
    LD E,(HL)                         ;0xe3ff:   5e  "^" 
    INC HL                            ;0xe400:   23  "#" 
    LD D,(HL)                         ;0xe401:   56  "V" 
    INC HL                            ;0xe402:   23  "#" 
    LD B,(HL)                         ;0xe403:   46  "F" 
    LD HL,(0x37ab)                    ;0xe404:   2a ab 37  "*.7"  
    LD A,(0x37ad)                     ;0xe407:   3a ad 37  ":.7"  
    LD C,A                            ;0xe40a:   4f  "O" 
    LD A,L                            ;0xe40b:   7d  "}" 
    SUB E                             ;0xe40c:   93  "." 
    LD A,H                            ;0xe40d:   7c  "|" 
    SBC A,D                           ;0xe40e:   9a  "." 
    LD A,C                            ;0xe40f:   79  "y" 
    SBC A,B                           ;0xe410:   98  "." 
    PUSH HL                           ;0xe411:   e5  "." 
    JP nc, 0x1e39                     ;0xe412:   d2 39 1e  ".9." 
    LD HL,(0x3780)                    ;0xe415:   2a 80 37  "*.7"  
    CALL 0x1ce4                       ;0xe418:   cd e4 1c  "..." 
    POP HL                            ;0xe41b:   e1  "." 
    EX (SP),HL                        ;0xe41c:   e3  "." 
    DEC HL                            ;0xe41d:   2b  "+" 
    EX (SP),HL                        ;0xe41e:   e3  "." 
    JP 0x1e22                         ;0xe41f:   c3 22 1e  "."." 
    LD HL,(0x3780)                    ;0xe422:   2a 80 37  "*.7"  
    CALL 0x1ced                       ;0xe425:   cd ed 1c  "..." 
    POP HL                            ;0xe428:   e1  "." 
    LD A,L                            ;0xe429:   7d  "}" 
    SUB E                             ;0xe42a:   93  "." 
    LD A,H                            ;0xe42b:   7c  "|" 
    SBC A,D                           ;0xe42c:   9a  "." 
    LD A,C                            ;0xe42d:   79  "y" 
    SBC A,B                           ;0xe42e:   98  "." 
    JP c, 0x1e50                      ;0xe42f:   da 50 1e  ".P." 
    EX (SP),HL                        ;0xe432:   e3  "." 
    INC HL                            ;0xe433:   23  "#" 
    EX (SP),HL                        ;0xe434:   e3  "." 
    PUSH HL                           ;0xe435:   e5  "." 
    JP 0x1e39                         ;0xe436:   c3 39 1e  ".9." 
    EX (SP),HL                        ;0xe439:   e3  "." 
    PUSH HL                           ;0xe43a:   e5  "." 
    LD HL,(0x3780)                    ;0xe43b:   2a 80 37  "*.7"  
    CALL 0x1ce4                       ;0xe43e:   cd e4 1c  "..." 
    POP HL                            ;0xe441:   e1  "." 
    PUSH DE                           ;0xe442:   d5  "." 
    PUSH BC                           ;0xe443:   c5  "." 
    PUSH HL                           ;0xe444:   e5  "." 
    EX DE,HL                          ;0xe445:   eb  "." 
    LD HL,(0x378d)                    ;0xe446:   2a 8d 37  "*.7"  
    ADD HL,DE                         ;0xe449:   19  "." 
    LD B,H                            ;0xe44a:   44  "D" 
    LD C,L                            ;0xe44b:   4d  "M" 
    LD (0x37fb),HL                    ;0xe44c:   22 fb 37  "".7"  
    CALL C_FC1E                       ;0xe44f:   cd 1e fc  "..." 
    POP DE                            ;0xe452:   d1  "." 
    LD HL,(0x376b)                    ;0xe453:   2a 6b 37  "*k7"  
    LD (HL),E                         ;0xe456:   73  "s" 
    INC HL                            ;0xe457:   23  "#" 
    LD (HL),D                         ;0xe458:   72  "r" 
    POP BC                            ;0xe459:   c1  "." 
    POP DE                            ;0xe45a:   d1  "." 
    LD HL,(0x376d)                    ;0xe45b:   2a 6d 37  "*m7"  
    LD (HL),E                         ;0xe45e:   73  "s" 
    INC HL                            ;0xe45f:   23  "#" 
    LD (HL),D                         ;0xe460:   72  "r" 
    INC HL                            ;0xe461:   23  "#" 
    LD (HL),B                         ;0xe462:   70  "p" 
    POP BC                            ;0xe463:   c1  "." 
    LD A,C                            ;0xe464:   79  "y" 
    SUB E                             ;0xe465:   93  "." 
    LD L,A                            ;0xe466:   6f  "o" 
    LD A,B                            ;0xe467:   78  "x" 
    SBC A,D                           ;0xe468:   9a  "." 
    CALL C_FC18                       ;0xe469:   cd 18 fc  "..." 
    XOR A                             ;0xe46c:   af  "." 
    LD HL,(0x376b)                    ;0xe46d:   2a 6b 37  "*k7"  
    LD (HL),A                         ;0xe470:   77  "w" 
    INC HL                            ;0xe471:   23  "#" 
    LD (HL),A                         ;0xe472:   77  "w" 
    LD HL,(0x376d)                    ;0xe473:   2a 6d 37  "*m7"  
    LD (HL),A                         ;0xe476:   77  "w" 
    INC HL                            ;0xe477:   23  "#" 
    LD (HL),A                         ;0xe478:   77  "w" 
    INC HL                            ;0xe479:   23  "#" 
    LD (HL),A                         ;0xe47a:   77  "w" 
    RET                               ;0xe47b:   c9  "." 
    LD A,1                            ;0xe47c:   3e 01  ">."  
    LD (0x37b4),A                     ;0xe47e:   32 b4 37  "2.7"  
    CALL C_FC27                       ;0xe481:   cd 27 fc  ".'." 
    JP 0x1da5                         ;0xe484:   c3 a5 1d  "..." 
    XOR A                             ;0xe487:   af  "." 
    LD (0x37b4),A                     ;0xe488:   32 b4 37  "2.7"  
    CALL 0xfc2a                       ;0xe48b:   cd 2a fc  ".*." 
    OR A                              ;0xe48e:   b7  "." 
    RET z                             ;0xe48f:   c8  "." 
    LD C,A                            ;0xe490:   4f  "O" 
    CALL 0x1db6                       ;0xe491:   cd b6 1d  "..." 
    LD A,C                            ;0xe494:   79  "y" 
    CP 3                              ;0xe495:   fe 03  ".." 
    JP c, 0x1cb2                      ;0xe497:   da b2 1c  "..." 
    LD C,1                            ;0xe49a:   0e 01  ".."  
    JP 0x1cb2                         ;0xe49c:   c3 b2 1c  "..." 
    INC A                             ;0xe49f:   3c  "<" 
    RET nz                            ;0xe4a0:   c0  "." 
    CALL 0x1deb                       ;0xe4a1:   cd eb 1d  "..." 
    RET z                             ;0xe4a4:   c8  "." 
    LD HL,(0x3765)                    ;0xe4a5:   2a 65 37  "*e7"  
    CALL 0x201d                       ;0xe4a8:   cd 1d 20  ".. " 
    LD C,1                            ;0xe4ab:   0e 01  ".."  
    RET z                             ;0xe4ad:   c8  "." 
    CALL 0x20b2                       ;0xe4ae:   cd b2 20  ".. " 
    POP HL                            ;0xe4b1:   e1  "." 
    LD A,(D_FBDF)                     ;0xe4b2:   3a df fb  ":.."  
    CP 0x30                           ;0xe4b5:   fe 30  ".0" 
    RET z                             ;0xe4b7:   c8  "." 
    LD HL,0x37aa                      ;0xe4b8:   21 aa 37  "!.7"  
    LD A,(0x37a4)                     ;0xe4bb:   3a a4 37  ":.7"  
    CP (HL)                           ;0xe4be:   be  "." 
    JP nz, 0x1de6                     ;0xe4bf:   c2 e6 1d  "..." 
    CALL 0x2113                       ;0xe4c2:   cd 13 21  "..!" 
    LD A,(0x37b4)                     ;0xe4c5:   3a b4 37  ":.7"  
    OR A                              ;0xe4c8:   b7  "." 
    RET nz                            ;0xe4c9:   c0  "." 
    LD C,2                            ;0xe4ca:   0e 02  ".."  
    JP 0x1cb2                         ;0xe4cc:   c3 b2 1c  "..." 
    XOR A                             ;0xe4cf:   af  "." 
    LD (D_FBDE),A                     ;0xe4d0:   32 de fb  "2.."  
    RET                               ;0xe4d3:   c9  "." 
    LD HL,(0x378b)                    ;0xe4d4:   2a 8b 37  "*.7"  
    LD A,0x80                         ;0xe4d7:   3e 80  ">."  
    CP H                              ;0xe4d9:   bc  "." 
    RET nz                            ;0xe4da:   c0  "." 
    XOR A                             ;0xe4db:   af  "." 
    CP L                              ;0xe4dc:   bd  "." 
    RET                               ;0xe4dd:   c9  "." 
    LD HL,(D_FBE1)                    ;0xe4de:   2a e1 fb  "*.."  
    LD C,2                            ;0xe4e1:   0e 02  ".."  
    CALL 0x1fab                       ;0xe4e3:   cd ab 1f  "..." 
    LD (0x3791),HL                    ;0xe4e6:   22 91 37  "".7"  
    RRA                               ;0xe4e9:   1f  "." 
    INC (HL)                          ;0xe4ea:   34  "4" 
    RET nz                            ;0xe4eb:   c0  "." 
    INC HL                            ;0xe4ec:   23  "#" 
    INC (HL)                          ;0xe4ed:   34  "4" 
    RET nz                            ;0xe4ee:   c0  "." 
    INC HL                            ;0xe4ef:   23  "#" 
    INC (HL)                          ;0xe4f0:   34  "4" 
    RET                               ;0xe4f1:   c9  "." 
    CALL 0x1d12                       ;0xe4f2:   cd 12 1d  "..." 
    EX DE,HL                          ;0xe4f5:   eb  "." 
    LD C,3                            ;0xe4f6:   0e 03  ".."  
    JP 0x1d29                         ;0xe4f8:   c3 29 1d  ".)." 
    CALL 0x1f37                       ;0xe4fb:   cd 37 1f  ".7." 
    LD DE,0x37ae                      ;0xe4fe:   11 ae 37  "..7"  
    RET                               ;0xe501:   c9  "." 
    CALL 0x1d12                       ;0xe502:   cd 12 1d  "..." 
    JP 0x1d0d                         ;0xe505:   c3 0d 1d  "..." 
    LD A,(DE)                         ;0xe508:   1a  "." 
    CP (HL)                           ;0xe509:   be  "." 
    RET nz                            ;0xe50a:   c0  "." 
    INC HL                            ;0xe50b:   23  "#" 
    INC DE                            ;0xe50c:   13  "." 
    DEC C                             ;0xe50d:   0d  "." 
    RET z                             ;0xe50e:   c8  "." 
    JP 0x1d1f                         ;0xe50f:   c3 1f 1d  "..." 
    INC C                             ;0xe512:   0c  "." 
    DEC C                             ;0xe513:   0d  "." 
    RET z                             ;0xe514:   c8  "." 
    LD A,(DE)                         ;0xe515:   1a  "." 
    LD (HL),A                         ;0xe516:   77  "w" 
    INC DE                            ;0xe517:   13  "." 
    INC HL                            ;0xe518:   23  "#" 
    JP 0x1d2a                         ;0xe519:   c3 2a 1d  ".*." 
    LD C,D                            ;0xe51c:   4a  "J" 
    CALL C_FC1B                       ;0xe51d:   cd 1b fc  "..." 
    LD A,H                            ;0xe520:   7c  "|" 
    OR L                              ;0xe521:   b5  "." 
    RET z                             ;0xe522:   c8  "." 
    LD E,(HL)                         ;0xe523:   5e  "^" 
    INC HL                            ;0xe524:   23  "#" 
    LD D,(HL)                         ;0xe525:   56  "V" 
    INC HL                            ;0xe526:   23  "#" 
    LD (0x3769),HL                    ;0xe527:   22 69 37  ""i7"  
    INC HL                            ;0xe52a:   23  "#" 
    INC HL                            ;0xe52b:   23  "#" 
    LD (0x376b),HL                    ;0xe52c:   22 6b 37  ""k7"  
    INC HL                            ;0xe52f:   23  "#" 
    INC HL                            ;0xe530:   23  "#" 
    LD (0x376d),HL                    ;0xe531:   22 6d 37  ""m7"  
    INC HL                            ;0xe534:   23  "#" 
    INC HL                            ;0xe535:   23  "#" 
    INC HL                            ;0xe536:   23  "#" 
    LD (0x376f),HL                    ;0xe537:   22 6f 37  ""o7"  
    INC HL                            ;0xe53a:   23  "#" 
    LD (0x3771),HL                    ;0xe53b:   22 71 37  ""q7"  
    INC HL                            ;0xe53e:   23  "#" 
    INC HL                            ;0xe53f:   23  "#" 
    EX DE,HL                          ;0xe540:   eb  "." 
    LD (0x379a),HL                    ;0xe541:   22 9a 37  "".7"  
    LD HL,0x3773                      ;0xe544:   21 73 37  "!s7"  
    LD C,13                           ;0xe547:   0e 0d  ".."  
    CALL 0x1d29                       ;0xe549:   cd 29 1d  ".)." 
    LD HL,(0x3773)                    ;0xe54c:   2a 73 37  "*s7"  
    EX DE,HL                          ;0xe54f:   eb  "." 
    LD HL,0x3780                      ;0xe550:   21 80 37  "!.7"  
    LD C,0x11                         ;0xe553:   0e 11  ".."  
    CALL 0x1d29                       ;0xe555:   cd 29 1d  ".)." 
    LD HL,(0x3785)                    ;0xe558:   2a 85 37  "*.7"  
    LD A,H                            ;0xe55b:   7c  "|" 
    LD HL,0x37a3                      ;0xe55c:   21 a3 37  "!.7"  
    LD (HL),0xff                      ;0xe55f:   36 ff  "6."  
    OR A                              ;0xe561:   b7  "." 
    JP z, 0x1d7e                      ;0xe562:   ca 7e 1d  ".~." 
    LD (HL),1                         ;0xe565:   36 01  "6."  
    NOP                               ;0xe567:   00  "." 
    SCF                               ;0xe568:   37  "7" 
    RET                               ;0xe569:   c9  "." 
    DEFB "rror"                       ;0xe56a:   0xe56a to 0xe56e
    DEFB 0x1                          ;0xe56e:   0x1
    DEFB 0x0                          ;0xe56f:   
    DEFB "File Exists"                ;0xe570:   0xe570 to 0xe57b
    DEFB 0x1                          ;0xe57b:   0x1
    DEFB 0x0                          ;0xe57c:   
    DEFB "? in Filename"              ;0xe57d:   0xe57d to 0xe58a
    DEFB 0x3                          ;0xe58a:   0x3
    DEFB 0x0                          ;0xe58b:   
    DEFB 0xe                          ;0xe58c:   0xe
    DEFB 0x2                          ;0xe58d:   0x2
    DEFB 0xc3                         ;0xe58e:   
    DEFB 0xb2                         ;0xe58f:   
    DEFB 0x1c                         ;0xe590:   0x1c
    DEFB 0xe                          ;0xe591:   0xe
    DEFB 0x3                          ;0xe592:   0x3
    DEFB 0xc3                         ;0xe593:   
    DEFB 0xb2                         ;0xe594:   
    DEFB 0x1c                         ;0xe595:   0x1c
    DEFB 0xe                          ;0xe596:   0xe
    DEFB 0x4                          ;0xe597:   0x4
    DEFB 0x3e                         ;0xe598:   
    DEFB 0xff                         ;0xe599:   
    DEFB 0x32                         ;0xe59a:   
    DEFB 0xa9                         ;0xe59b:   
    DEFB "7a.", 0x61                  ;0xe59c:   0xe59c to 0xe59d
    DEFB 0x22                         ;0xe5a0:   
    DEFB 0x9f                         ;0xe5a1:   
    DEFB 0x1c                         ;0xe5a2:   0x1c
    DEFB 0x3a                         ;0xe5a3:   
    DEFB 0xaa                         ;0xe5a4:   
    DEFB 0x37                         ;0xe5a5:   
    DEFB 0x32                         ;0xe5a6:   
    DEFB 0xed                         ;0xe5a7:   
    DEFB 0xfb                         ;0xe5a8:   
    DEFB 0x3a                         ;0xe5a9:   
    DEFB 0xe7                         ;0xe5aa:   
    DEFB 0xfb                         ;0xe5ab:   
    DEFB 0x3c                         ;0xe5ac:   
    DEFB 0xc4                         ;0xe5ad:   
    DEFB 0xfb                         ;0xe5ae:   
    DEFB 0xfb                         ;0xe5af:   
    DEFB 0x3a                         ;0xe5b0:   
    DEFB 0xdf                         ;0xe5b1:   
    DEFB 0xfb                         ;0xe5b2:   
    DEFB 0xfe                         ;0xe5b3:   
    DEFB 0x1b                         ;0xe5b4:   0x1b
    DEFB 0xca                         ;0xe5b5:   
    DEFB 0x35                         ;0xe5b6:   
    DEFB 0x37                         ;0xe5b7:   
    DEFB 0xfe                         ;0xe5b8:   
    DEFB 0x1f                         ;0xe5b9:   0x1f
    DEFB 0xca                         ;0xe5ba:   
;--------------------------------------
C_E5BB:                               ; XREF: 0xE574 
    DEC (HL)                          ;0xe5bb:   35  "5" 
    SCF                               ;0xe5bc:   37  "7" 
    JP 0x373b                         ;0xe5bd:   c3 3b 37  ".;7" 
    LD A,(0x37bc)                     ;0xe5c0:   3a bc 37  ":.7"  
    LD (D_F61D),A                     ;0xe5c3:   32 1d f6  "2.."  
    RET                               ;0xe5c6:   c9  "." 
    XOR A                             ;0xe5c7:   af  "." 
    LD (0x37bc),A                     ;0xe5c8:   32 bc 37  "2.7"  
    LD (D_F61D),A                     ;0xe5cb:   32 1d f6  "2.."  
    RET                               ;0xe5ce:   c9  "." 
    LD A,E                            ;0xe5cf:   7b  "{" 
    SUB L                             ;0xe5d0:   95  "." 
    LD E,A                            ;0xe5d1:   5f  "_" 
    LD A,D                            ;0xe5d2:   7a  "z" 
    SBC A,H                           ;0xe5d3:   9c  "." 
    LD D,A                            ;0xe5d4:   57  "W" 
    RET nc                            ;0xe5d5:   d0  "." 
    DEC B                             ;0xe5d6:   05  "." 
    RET                               ;0xe5d7:   c9  "." 
    LD A,E                            ;0xe5d8:   7b  "{" 
    ADD A,L                           ;0xe5d9:   85  "." 
    LD E,A                            ;0xe5da:   5f  "_" 
    LD A,D                            ;0xe5db:   7a  "z" 
    ADC A,H                           ;0xe5dc:   8c  "." 
    LD D,A                            ;0xe5dd:   57  "W" 
    RET nc                            ;0xe5de:   d0  "." 
    INC B                             ;0xe5df:   04  "." 
    RET                               ;0xe5e0:   c9  "." 
    INC C                             ;0xe5e1:   0c  "." 
    DEC C                             ;0xe5e2:   0d  "." 
    RET z                             ;0xe5e3:   c8  "." 
    ADD HL,HL                         ;0xe5e4:   29  ")" 
    ADC A,A                           ;0xe5e5:   8f  "." 
    JP 0x1cf7                         ;0xe5e6:   c3 f7 1c  "..." 
;--------------------------------------
C_E5E9:                               ; XREF: 0xE57E 
    CALL 0x2f37                       ;0xe5e9:   cd 37 2f  ".7/" 
    NOP                               ;0xe5ec:   00  "." 
    DEFB "CP/M Error On  : "          ;0xe5ed:   0xe5ed to 0xe5fe
    DEFB 0x1                          ;0xe5fe:   0x1
    DEFB 0x0                          ;0xe5ff:   
    DEFB "Disk I/O"                   ;0xe600:   0xe600 to 0xe608
    DEFB 0x1                          ;0xe608:   0x1
    DEFB 0x0                          ;0xe609:   
    DEFB "Invalid Drive"              ;0xe60a:   0xe60a to 0xe617
    DEFB 0x1                          ;0xe617:   0x1
    DEFB 0x0                          ;0xe618:   
    DEFB "Read/Only File"             ;0xe619:   0xe619 to 0xe627
    DEFB 0x1                          ;0xe627:   0x1
    DEFB 0x0                          ;0xe628:   
    DEFB "Read/Only Disk"             ;0xe629:   0xe629 to 0xe637
    DEFB 0x1                          ;0xe637:   0x1
;--------------------------------------
C_E638:                               ; XREF: 0xE5F1 
    NOP                               ;0xe638:   00  "." 
    DEFB "Password E"                 ;0xe639:   0xe639 to 0xe643
    DEFB 0x4                          ;0xe643:   0x4
    DEFB 0x0                          ;0xe644:   
    DEFB 0xfe                         ;0xe645:   
    DEFB 0x0                          ;0xe646:   
    DEFB 0xfe                         ;0xe647:   
;--------------------------------------
C_E648:                               ; XREF: 0xE5F7 
    NOP                               ;0xe648:   00  "." 
    EI                                ;0xe649:   fb  "." 
    JP z, 0x3329                      ;0xe64a:   ca 29 33  ".)3" 
    EX DE,HL                          ;0xe64d:   eb  "." 
    LD (D_FBCF),HL                    ;0xe64e:   22 cf fb  "".."  
    RET                               ;0xe651:   c9  "." 
    LD HL,D_FBD3                      ;0xe652:   21 d3 fb  "!.."  
    LD A,D                            ;0xe655:   7a  "z" 
    AND E                             ;0xe656:   a3  "." 
;--------------------------------------
C_E657:                               ; XREF: 0xE611 
    INC A                             ;0xe657:   3c  "<" 
    LD A,(HL)                         ;0xe658:   7e  "~" 
    JP z, 0x1972                      ;0xe659:   ca 72 19  ".r." 
    LD (HL),E                         ;0xe65c:   73  "s" 
    RET                               ;0xe65d:   c9  "." 
    EX DE,HL                          ;0xe65e:   eb  "." 
    LD E,(HL)                         ;0xe65f:   5e  "^" 
    INC HL                            ;0xe660:   23  "#" 
    LD D,(HL)                         ;0xe661:   56  "V" 
    INC HL                            ;0xe662:   23  "#" 
    LD C,(HL)                         ;0xe663:   4e  "N" 
    INC HL                            ;0xe664:   23  "#" 
    LD B,(HL)                         ;0xe665:   46  "F" 
    EX DE,HL                          ;0xe666:   eb  "." 
    LD A,B                            ;0xe667:   78  "x" 
    OR C                              ;0xe668:   b1  "." 
    RET z                             ;0xe669:   c8  "." 
;--------------------------------------
C_E66A:                               ; XREF: 0xE622 
    PUSH BC                           ;0xe66a:   c5  "." 
    PUSH HL                           ;0xe66b:   e5  "." 
    LD C,(HL)                         ;0xe66c:   4e  "N" 
    LD A,(D_FBDF)                     ;0xe66d:   3a df fb  ":.."  
    CP 0x6f                           ;0xe670:   fe 6f  ".o" 
    JP z, 0x19b2                      ;0xe672:   ca b2 19  "..." 
    CALL 0xfb80                       ;0xe675:   cd 80 fb  "..." 
;--------------------------------------
C_E678:                               ; XREF: 0xE632 
    JP 0x19b5                         ;0xe678:   c3 b5 19  "..." 
    CALL 0x1428                       ;0xe67b:   cd 28 14  ".(." 
    POP HL                            ;0xe67e:   e1  "." 
    INC HL                            ;0xe67f:   23  "#" 
    POP BC                            ;0xe680:   c1  "." 
    DEC BC                            ;0xe681:   0b  "." 
    JP 0x199e                         ;0xe682:   c3 9e 19  "..." 
    LD B,H                            ;0xe685:   44  "D" 
    NOP                               ;0xe686:   00  "." 
    INC DE                            ;0xe687:   13  "." 
;--------------------------------------
C_E688:                               ; XREF: 0xE641 
    CALL C_FC15                       ;0xe688:   cd 15 fc  "..." 
    JP 0x1972                         ;0xe68b:   c3 72 19  ".r." 
    LD A,C                            ;0xe68e:   79  "y" 
    INC A                             ;0xe68f:   3c  "<" 
    JP z, 0x1920                      ;0xe690:   ca 20 19  ". ." 
    INC A                             ;0xe693:   3c  "<" 
    JP z, 0x1917                      ;0xe694:   ca 17 19  "..." 
    INC A                             ;0xe697:   3c  "<" 
    JP z, 0x1925                      ;0xe698:   ca 25 19  ".%." 
    JP C_FB7A                         ;0xe69b:   c3 7a fb  ".z." 
    CALL 0x12ff                       ;0xe69e:   cd ff 12  "..." 
    JP nz, 0x24c0                     ;0xe6a1:   c2 c0 24  "..$" 
    JP 0x1972                         ;0xe6a4:   c3 72 19  ".r." 
    CALL 0x12ff                       ;0xe6a7:   cd ff 12  "..." 
    OR A                              ;0xe6aa:   b7  "." 
    RET z                             ;0xe6ab:   c8  "." 
    CALL 0x12b7                       ;0xe6ac:   cd b7 12  "..." 
    JP 0x1972                         ;0xe6af:   c3 72 19  ".r." 
    CALL 0xfc36                       ;0xe6b2:   cd 36 fc  ".6." 
    JP 0x1972                         ;0xe6b5:   c3 72 19  ".r." 
    CALL 0xfc39                       ;0xe6b8:   cd 39 fc  ".9." 
    JP 0x1972                         ;0xe6bb:   c3 72 19  ".r." 
    EX DE,HL                          ;0xe6be:   eb  "." 
    LD C,L                            ;0xe6bf:   4d  "M" 
    LD B,H                            ;0xe6c0:   44  "D" 
    JP 0x148c                         ;0xe6c1:   c3 8c 14  "..." 
    LD A,(D_FBCF)                     ;0xe6c4:   3a cf fb  ":.."  
    RRA                               ;0xe6c7:   1f  "." 
    JP nc, 0x196f                     ;0xe6c8:   d2 6f 19  ".o." 
    LD HL,D_FBD5                      ;0xe6cb:   21 d5 fb  "!.."  
    LD (HL),0x80                      ;0xe6ce:   36 80  "6."  
    PUSH HL                           ;0xe6d0:   e5  "." 
    LD HL,0x1968                      ;0xe6d1:   21 68 19  "!h."  
    PUSH HL                           ;0xe6d4:   e5  "." 
    LD A,(D_F620)                     ;0xe6d5:   3a 20 f6  ": ."  
    CP 3                              ;0xe6d8:   fe 03  ".." 
    JP z, 0x139a                      ;0xe6da:   ca 9a 13  "..." 
    CALL C_FB6E                       ;0xe6dd:   cd 6e fb  ".n." 
    OR A                              ;0xe6e0:   b7  "." 
    RET z                             ;0xe6e1:   c8  "." 
    CALL 0xfb74                       ;0xe6e2:   cd 74 fb  ".t." 
;--------------------------------------
C_E6E5:                               ; XREF: 0xFE09 
    CP 3                              ;0xe6e5:   fe 03  ".." 
    JP z, 0x137f                      ;0xe6e7:   ca 7f 13  "..." 
    LD (D_F620),A                     ;0xe6ea:   32 20 f6  "2 ."  
    XOR A                             ;0xe6ed:   af  "." 
    RET                               ;0xe6ee:   c9  "." 
    CALL 0x1972                       ;0xe6ef:   cd 72 19  ".r." 
    POP HL                            ;0xe6f2:   e1  "." 
    LD (HL),1                         ;0xe6f3:   36 01  "6."  
    NOP                               ;0xe6f5:   00  "." 
    RET                               ;0xe6f6:   c9  "." 
    CALL 0x131b                       ;0xe6f7:   cd 1b 13  "..." 
    LD (0x1c9f),A                     ;0xe6fa:   32 9f 1c  "2.."  
    RET                               ;0xe6fd:   c9  "." 
    LD A,1                            ;0xe6fe:   3e 01  ">."  
    JP 0x1972                         ;0xe700:   c3 72 19  ".r." 
    LD A,D                            ;0xe703:   7a  "z" 
;--------------------------------------
D_E704:                               ; XREF: 0xF833 
    DEFB 0xa3                         ;0xe704:   ('#') + 0x80
    DEFB 0x3c                         ;0xe705:   "<"
    DEFB 0x2a                         ;0xe706:   "*"
    DEFB 0xcf                         ;0xe707:   ('O') + 0x80
    DEFB 0x7                          ;0xe708:   0x7
    DEFB 0xca                         ;0xe709:   ('J') + 0x80
    DEFB 0x39                         ;0xe70a:   "9"
    DEFB 0x17                         ;0xe70b:   0x17
    DEFB 0xfe                         ;0xe70c:   ('~') + 0x80
    DEFB 0x7f                         ;0xe70d:   0x7f
    DEFB 0xca                         ;0xe70e:   ('J') + 0x80
    DEFB 0x8c                         ;0xe70f:   0x8c
    DEFB 0x18                         ;0xe710:   0x18
    DEFB 0xcd                         ;0xe711:   ('M') + 0x80
    DEFB 0x5e                         ;0xe712:   "^"
    DEFB 0x15                         ;0xe713:   0x15
    DEFB 0x3a                         ;0xe714:   ":"
    DEFB 0xcf                         ;0xe715:   ('O') + 0x80
    DEFB 0xfb                         ;0xe716:   ('{') + 0x80
    DEFB 0xe6                         ;0xe717:   ('f') + 0x80
    DEFB 0x8                          ;0xe718:   0x8
    DEFB 0xc2                         ;0xe719:   ('B') + 0x80
    DEFB 0x97                         ;0xe71a:   0x97
    DEFB 0x18                         ;0xe71b:   0x18
    DEFB 0x7e                         ;0xe71c:   "~"
    DEFB 0xfe                         ;0xe71d:   ('~') + 0x80
    DEFB 0x3                          ;0xe71e:   0x3
    DEFB 0x78                         ;0xe71f:   "x"
    DEFB 0xc2                         ;0xe720:   ('B') + 0x80
    DEFB 0xa0                         ;0xe721:   (' ') + 0x80
    DEFB 0x18                         ;0xe722:   0x18
    DEFB 0xfe                         ;0xe723:   ('~') + 0x80
    DEFB 0x1                          ;0xe724:   0x1
    DEFB 0xca                         ;0xe725:   ('J') + 0x80
    DEFB 0x29                         ;0xe726:   ")"
    DEFB 0x12                         ;0xe727:   0x12
    DEFB 0xb9                         ;0xe728:   ('9') + 0x80
    DEFB 0xd2                         ;0xe729:   ('R') + 0x80
    DEFB 0xe0                         ;0xe72a:   ('`') + 0x80
    DEFB 0x18                         ;0xe72b:   0x18
    DEFB 0xc5                         ;0xe72c:   ('E') + 0x80
    DEFB 0xe5                         ;0xe72d:   ('e') + 0x80
    DEFB 0xcd                         ;0xe72e:   ('M') + 0x80
    DEFB 0xc0                         ;0xe72f:   ('@') + 0x80
    DEFB 0x14                         ;0xe730:   0x14
    DEFB 0xda                         ;0xe731:   ('Z') + 0x80
    DEFB 0x1                          ;0xe732:   0x1
    DEFB 0x16                         ;0xe733:   0x16
    DEFB 0x3a                         ;0xe734:   ":"
    DEFB 0x2a                         ;0xe735:   "*"
    DEFB 0x1c                         ;0xe736:   0x1c
    DEFB 0xb7                         ;0xe737:   ('7') + 0x80
    DEFB 0xca                         ;0xe738:   ('J') + 0x80
    DEFB 0xc0                         ;0xe739:   ('@') + 0x80
    DEFB 0x18                         ;0xe73a:   0x18
    DEFB 0x3a                         ;0xe73b:   ":"
    DEFB 0xbf                         ;0xe73c:   ('?') + 0x80
    DEFB 0x19                         ;0xe73d:   0x19
    DEFB 0xfe                         ;0xe73e:   ('~') + 0x80
    DEFB 0x17                         ;0xe73f:   0x17
    DEFB 0xca                         ;0xe740:   ('J') + 0x80
    DEFB 0xc5                         ;0xe741:   ('E') + 0x80
    DEFB 0x18                         ;0xe742:   0x18
    DEFB 0xfe                         ;0xe743:   ('~') + 0x80
    DEFB 0x6                          ;0xe744:   0x6
    DEFB 0xca                         ;0xe745:   ('J') + 0x80
    DEFB 0xc5                         ;0xe746:   ('E') + 0x80
    DEFB 0x18                         ;0xe747:   0x18
    DEFB 0x3e                         ;0xe748:   ">"
    DEFB 0x5                          ;0xe749:   0x5
    DEFB 0xc3                         ;0xe74a:   ('C') + 0x80
    DEFB 0x8                          ;0xe74b:   0x8
    DEFB 0x16                         ;0xe74c:   0x16
    DEFB 0xe1                         ;0xe74d:   ('a') + 0x80
    DEFB 0xc1                         ;0xe74e:   ('A') + 0x80
    DEFB 0x5                          ;0xe74f:   0x5
    DEFB 0xeb                         ;0xe750:   ('k') + 0x80
    DEFB 0x2a                         ;0xe751:   "*"
    DEFB 0x28                         ;0xe752:   "("
    DEFB 0x1c                         ;0xe753:   0x1c
    DEFB 0x2b                         ;0xe754:   "+"
    DEFB 0x22                         ;0xe755:   """
    DEFB 0x28                         ;0xe756:   "("
    DEFB 0x1c                         ;0xe757:   0x1c
    DEFB 0x1a                         ;0xe758:   0x1a
    DEFB 0x77                         ;0xe759:   "w"
    DEFB 0xeb                         ;0xe75a:   ('k') + 0x80
    DEFB 0x2b                         ;0xe75b:   "+"
    DEFB 0xc5                         ;0xe75c:   ('E') + 0x80
    DEFB 0xe5                         ;0xe75d:   ('e') + 0x80
    DEFB 0xcd                         ;0xe75e:   ('M') + 0x80
    DEFB 0x2b                         ;0xe75f:   "+"
    DEFB 0x15                         ;0xe760:   0x15
    DEFB 0xaf                         ;0xe761:   ('/') + 0x80
    DEFB 0x32                         ;0xe762:   "2"
    DEFB 0x2b                         ;0xe763:   "+"
    DEFB 0x1c                         ;0xe764:   0x1c
    DEFB 0xc3                         ;0xe765:   ('C') + 0x80
    DEFB 0x1                          ;0xe766:   0x1
    DEFB 0x16                         ;0xe767:   0x16
    DEFB 0xaf                         ;0xe768:   ('/') + 0x80
    DEFB 0x32                         ;0xe769:   "2"
    DEFB 0x2b                         ;0xe76a:   "+"
    DEFB 0x1c                         ;0xe76b:   0x1c
    DEFB 0xc3                         ;0xe76c:   ('C') + 0x80
    DEFB 0xff                         ;0xe76d:   0xff
    DEFB 0x15                         ;0xe76e:   0x15
    DEFB 0xcd                         ;0xe76f:   ('M') + 0x80
    DEFB 0xc9                         ;0xe770:   ('I') + 0x80
    DEFB 0x14                         ;0xe771:   0x14
    DEFB 0xe1                         ;0xe772:   ('a') + 0x80
    DEFB 0x70                         ;0xe773:   "p"
    DEFB 0xc5                         ;0xe774:   ('E') + 0x80
    DEFB 0xcd                         ;0xe775:   ('M') + 0x80
    DEFB 0xd8                         ;0xe776:   ('X') + 0x80
    DEFB 0x14                         ;0xe777:   0x14
    DEFB 0xc1                         ;0xe778:   ('A') + 0x80
    DEFB 0xe                          ;0xe779:   0xe
    DEFB 0xff                         ;0xe77a:   0xff
    DEFB 0xcd                         ;0xe77b:   ('M') + 0x80
    DEFB 0xee                         ;0xe77c:   ('n') + 0x80
    DEFB 0x14                         ;0xe77d:   0x14
    DEFB 0x21                         ;0xe77e:   "!"
    DEFB 0x2                          ;0xe77f:   0x2
    DEFB 0x0                          ;0xe780:   0x0
    DEFB 0x22                         ;0xe781:   """
    DEFB 0xba                         ;0xe782:   (':') + 0x80
    DEFB 0xfb                         ;0xe783:   ('{') + 0x80
    DEFB 0xe                          ;0xe784:   0xe
    DEFB 0xd                          ;0xe785:   0xd
    DEFB 0xc3                         ;0xe786:   ('C') + 0x80
    DEFB 0xcd                         ;0xe787:   ('M') + 0x80
    DEFB 0x3e                         ;0xe788:   ">"
    DEFB 0x17                         ;0xe789:   0x17
    DEFB 0x32                         ;0xe78a:   "2"
    DEFB 0x2b                         ;0xe78b:   "+"
    DEFB 0x1c                         ;0xe78c:   0x1c
    DEFB 0x32                         ;0xe78d:   "2"
    DEFB 0x2a                         ;0xe78e:   "*"
    DEFB 0x1c                         ;0xe78f:   0x1c
    DEFB 0xc3                         ;0xe790:   ('C') + 0x80
    DEFB 0x1                          ;0xe791:   0x1
    DEFB 0x16                         ;0xe792:   0x16
    DEFB 0xc5                         ;0xe793:   ('E') + 0x80
    DEFB 0xcd                         ;0xe794:   ('M') + 0x80
    DEFB 0x6a                         ;0xe795:   "j"
    DEFB 0x14                         ;0xe796:   0x14
    DEFB 0xc1                         ;0xe797:   ('A') + 0x80
    DEFB 0xe1                         ;0xe798:   ('a') + 0x80
    DEFB 0xe5                         ;0xe799:   ('e') + 0x80
    DEFB 0xc5                         ;0xe79a:   ('E') + 0x80
    DEFB 0x78                         ;0xe79b:   "x"
    DEFB 0xb7                         ;0xe79c:   ('7') + 0x80
    DEFB 0xca                         ;0xe79d:   ('J') + 0x80
    DEFB 0x2e                         ;0xe79e:   "."
    DEFB 0x18                         ;0xe79f:   0x18
    DEFB 0x23                         ;0xe7a0:   "#"
    DEFB 0x4e                         ;0xe7a1:   "N"
    DEFB 0x5                          ;0xe7a2:   0x5
    DEFB 0xd1                         ;0xe7a3:   ('Q') + 0x80
    DEFB 0xd5                         ;0xe7a4:   ('U') + 0x80
    DEFB 0x7a                         ;0xe7a5:   "z"
    DEFB 0x90                         ;0xe7a6:   0x90
    DEFB 0x57                         ;0xe7a7:   "W"
    DEFB 0xc5                         ;0xe7a8:   ('E') + 0x80
    DEFB 0xe5                         ;0xe7a9:   ('e') + 0x80
    DEFB 0x3a                         ;0xe7aa:   ":"
    DEFB 0xbe                         ;0xe7ab:   ('>') + 0x80
    DEFB 0x19                         ;0xe7ac:   0x19
    DEFB 0xba                         ;0xe7ad:   (':') + 0x80
    DEFB 0xdc                         ;0xe7ae:   ('\') + 0x80
    DEFB 0x13                         ;0xe7af:   0x13
    DEFB 0x14                         ;0xe7b0:   0x14
    DEFB 0xe1                         ;0xe7b1:   ('a') + 0x80
    DEFB 0xc1                         ;0xe7b2:   ('A') + 0x80
    DEFB 0xc3                         ;0xe7b3:   ('C') + 0x80
    DEFB 0x13                         ;0xe7b4:   0x13
    DEFB 0x18                         ;0xe7b5:   0x18
    DEFB 0xe5                         ;0xe7b6:   ('e') + 0x80
    DEFB 0x3a                         ;0xe7b7:   ":"
    DEFB 0xbc                         ;0xe7b8:   ('<') + 0x80
    DEFB 0x19                         ;0xe7b9:   0x19
    DEFB 0xb7                         ;0xe7ba:   ('7') + 0x80
    DEFB 0xca                         ;0xe7bb:   ('J') + 0x80
    DEFB 0x1                          ;0xe7bc:   0x1
    DEFB 0x16                         ;0xe7bd:   0x16
    DEFB 0x21                         ;0xe7be:   "!"
    DEFB 0xb7                         ;0xe7bf:   ('7') + 0x80
    DEFB 0xfb                         ;0xe7c0:   ('{') + 0x80
    DEFB 0x96                         ;0xe7c1:   0x96
    DEFB 0x32                         ;0xe7c2:   "2"
    DEFB 0xbc                         ;0xe7c3:   ('<') + 0x80
    DEFB 0x19                         ;0xe7c4:   0x19
    DEFB 0xcd                         ;0xe7c5:   ('M') + 0x80
    DEFB 0x57                         ;0xe7c6:   "W"
    DEFB 0x14                         ;0xe7c7:   0x14
    DEFB 0x21                         ;0xe7c8:   "!"
    DEFB 0xbc                         ;0xe7c9:   ('<') + 0x80
    DEFB 0x19                         ;0xe7ca:   0x19
    DEFB 0x35                         ;0xe7cb:   "5"
    DEFB 0xc2                         ;0xe7cc:   ('B') + 0x80
    DEFB 0x3d                         ;0xe7cd:   "="
    DEFB 0x18                         ;0xe7ce:   0x18
    DEFB 0xcd                         ;0xe7cf:   ('M') + 0x80
    DEFB 0x5e                         ;0xe7d0:   "^"
    DEFB 0x15                         ;0xe7d1:   0x15
    DEFB 0xc3                         ;0xe7d2:   ('C') + 0x80
    DEFB 0x1                          ;0xe7d3:   0x1
    DEFB 0x16                         ;0xe7d4:   0x16
    DEFB 0xf5                         ;0xe7d5:   ('u') + 0x80
    DEFB 0x78                         ;0xe7d6:   "x"
    DEFB 0xb9                         ;0xe7d7:   ('9') + 0x80
    DEFB 0xda                         ;0xe7d8:   ('Z') + 0x80
    DEFB 0x5e                         ;0xe7d9:   "^"
    DEFB 0x18                         ;0xe7da:   0x18
    DEFB 0xf1                         ;0xe7db:   ('q') + 0x80
    DEFB 0xc5                         ;0xe7dc:   ('E') + 0x80
    DEFB 0xe5                         ;0xe7dd:   ('e') + 0x80
    DEFB 0xe                          ;0xe7de:   0xe
    DEFB 0x7                          ;0xe7df:   0x7
    DEFB 0xcd                         ;0xe7e0:   ('M') + 0x80
    DEFB 0x7a                         ;0xe7e1:   "z"
    DEFB 0xfb                         ;0xe7e2:   ('{') + 0x80
    DEFB 0xc3                         ;0xe7e3:   ('C') + 0x80
    DEFB 0x1                          ;0xe7e4:   0x1
    DEFB 0x16                         ;0xe7e5:   0x16
    DEFB 0x3a                         ;0xe7e6:   ":"
    DEFB 0xbf                         ;0xe7e7:   ('?') + 0x80
    DEFB 0x19                         ;0xe7e8:   0x19
    DEFB 0xfe                         ;0xe7e9:   ('~') + 0x80
    DEFB 0x7                          ;0xe7ea:   0x7
    DEFB 0xca                         ;0xe7eb:   ('J') + 0x80
    DEFB 0x6d                         ;0xe7ec:   "m"
    DEFB 0x18                         ;0xe7ed:   0x18
    DEFB 0x3a                         ;0xe7ee:   ":"
    DEFB 0x2a                         ;0xe7ef:   "*"
    DEFB 0x1c                         ;0xe7f0:   0x1c
    DEFB 0xb7                         ;0xe7f1:   ('7') + 0x80
    DEFB 0xc4                         ;0xe7f2:   ('D') + 0x80
    DEFB 0x3b                         ;0xe7f3:   ";"
    DEFB 0x15                         ;0xe7f4:   0x15
    DEFB 0xf1                         ;0xe7f5:   ('q') + 0x80
    DEFB 0x23                         ;0xe7f6:   "#"
    DEFB 0x77                         ;0xe7f7:   "w"
    DEFB 0x4                          ;0xe7f8:   0x4
    DEFB 0xc5                         ;0xe7f9:   ('E') + 0x80
    DEFB 0xe5                         ;0xe7fa:   ('e') + 0x80
    DEFB 0x4f                         ;0xe7fb:   "O"
    DEFB 0xcd                         ;0xe7fc:   ('M') + 0x80
    DEFB 0x14                         ;0xe7fd:   0x14
    DEFB 0x15                         ;0xe7fe:   0x15
    DEFB 0xcd                         ;0xe7ff:   ('M') + 0x80
    DEFB 0x13                         ;0xe800:   0x13
    DEFB 0x14                         ;0xe801:   0x14
    DEFB 0xe1                         ;0xe802:   ('a') + 0x80
    DEFB 0xc1                         ;0xe803:   ('A') + 0x80
    DEFB 0x3a                         ;0xe804:   ":"
    DEFB 0xbf                         ;0xe805:   ('?') + 0x80
    DEFB 0x19                         ;0xe806:   0x19
    DEFB 0xfe                         ;0xe807:   ('~') + 0x80
    DEFB 0x1c                         ;0xe808:   0x1c
    DEFB 0xb7                         ;0xe809:   ('7') + 0x80
    DEFB 0xc4                         ;0xe80a:   ('D') + 0x80
    DEFB 0x1b                         ;0xe80b:   0x1b
    DEFB 0x15                         ;0xe80c:   0x15
    DEFB 0xcd                         ;0xe80d:   ('M') + 0x80
    DEFB 0x82                         ;0xe80e:   0x82
    DEFB 0x14                         ;0xe80f:   0x14
    DEFB 0xcd                         ;0xe810:   ('M') + 0x80
    DEFB 0x5e                         ;0xe811:   "^"
    DEFB 0x15                         ;0xe812:   0x15
    DEFB 0xaf                         ;0xe813:   ('/') + 0x80
    DEFB 0x32                         ;0xe814:   "2"
    DEFB 0xbd                         ;0xe815:   ('=') + 0x80
    DEFB 0x19                         ;0xe816:   0x19
    DEFB 0xc3                         ;0xe817:   ('C') + 0x80
    DEFB 0x1                          ;0xe818:   0x1
    DEFB 0x16                         ;0xe819:   0x16
    DEFB 0xfe                         ;0xe81a:   ('~') + 0x80
    DEFB 0x10                         ;0xe81b:   0x10
    DEFB 0xc2                         ;0xe81c:   ('B') + 0x80
    DEFB 0xa2                         ;0xe81d:   ('"') + 0x80
    DEFB 0x17                         ;0xe81e:   0x17
    DEFB 0xe5                         ;0xe81f:   ('e') + 0x80
    DEFB 0xc5                         ;0xe820:   ('E') + 0x80
    DEFB 0xaf                         ;0xe821:   ('/') + 0x80
    DEFB 0xcd                         ;0xe822:   ('M') + 0x80
    DEFB 0xa0                         ;0xe823:   (' ') + 0x80
    DEFB 0x13                         ;0xe824:   0x13
    DEFB 0xc1                         ;0xe825:   ('A') + 0x80
    DEFB 0xe1                         ;0xe826:   ('a') + 0x80
    DEFB 0xc3                         ;0xe827:   ('C') + 0x80
    DEFB 0xff                         ;0xe828:   0xff
    DEFB 0x15                         ;0xe829:   0x15
    DEFB 0xfe                         ;0xe82a:   ('~') + 0x80
    DEFB 0x18                         ;0xe82b:   0x18
    DEFB 0xc2                         ;0xe82c:   ('B') + 0x80
    DEFB 0xc4                         ;0xe82d:   ('D') + 0x80
    DEFB 0x17                         ;0xe82e:   0x17
    DEFB 0xe1                         ;0xe82f:   ('a') + 0x80
    DEFB 0x3a                         ;0xe830:   ":"
    DEFB 0xbd                         ;0xe831:   ('=') + 0x80
    DEFB 0x19                         ;0xe832:   0x19
    DEFB 0x21                         ;0xe833:   "!"
    DEFB 0xb7                         ;0xe834:   ('7') + 0x80
    DEFB 0xfb                         ;0xe835:   ('{') + 0x80
    DEFB 0xbe                         ;0xe836:   ('>') + 0x80
    DEFB 0xda                         ;0xe837:   ('Z') + 0x80
    DEFB 0xbd                         ;0xe838:   ('=') + 0x80
    DEFB 0x17                         ;0xe839:   0x17
    DEFB 0x2a                         ;0xe83a:   "*"
    DEFB 0x28                         ;0xe83b:   "("
    DEFB 0x1c                         ;0xe83c:   0x1c
    DEFB 0x7e                         ;0xe83d:   "~"
    DEFB 0xb7                         ;0xe83e:   ('7') + 0x80
    DEFB 0xc2                         ;0xe83f:   ('B') + 0x80
    DEFB 0xdd                         ;0xe840:   (']') + 0x80
    DEFB 0x15                         ;0xe841:   0x15
    DEFB 0xc3                         ;0xe842:   ('C') + 0x80
    DEFB 0xd7                         ;0xe843:   ('W') + 0x80
    DEFB 0x15                         ;0xe844:   0x15
    DEFB 0x35                         ;0xe845:   "5"
    DEFB 0xcd                         ;0xe846:   ('M') + 0x80
    DEFB 0x57                         ;0xe847:   "W"
    DEFB 0x14                         ;0xe848:   0x14
    DEFB 0xc3                         ;0xe849:   ('C') + 0x80
    DEFB 0xa8                         ;0xe84a:   ('(') + 0x80
    DEFB 0x17                         ;0xe84b:   0x17
    DEFB 0xfe                         ;0xe84c:   ('~') + 0x80
    DEFB 0x15                         ;0xe84d:   0x15
    DEFB 0xc2                         ;0xe84e:   ('B') + 0x80
    DEFB 0xd5                         ;0xe84f:   ('U') + 0x80
    DEFB 0x17                         ;0xe850:   0x17
    DEFB 0xe3                         ;0xe851:   ('c') + 0x80
    DEFB 0xcd                         ;0xe852:   ('M') + 0x80
    DEFB 0xd8                         ;0xe853:   ('X') + 0x80
    DEFB 0x14                         ;0xe854:   0x14
    DEFB 0xe3                         ;0xe855:   ('c') + 0x80
    DEFB 0xcd                         ;0xe856:   ('M') + 0x80
    DEFB 0x6a                         ;0xe857:   "j"
    DEFB 0x14                         ;0xe858:   0x14
    DEFB 0xe1                         ;0xe859:   ('a') + 0x80
    DEFB 0xc3                         ;0xe85a:   ('C') + 0x80
    DEFB 0xd7                         ;0xe85b:   ('W') + 0x80
    DEFB 0x15                         ;0xe85c:   0x15
    DEFB 0xfe                         ;0xe85d:   ('~') + 0x80
    DEFB 0x12                         ;0xe85e:   0x12
    DEFB 0xc2                         ;0xe85f:   ('B') + 0x80
    DEFB 0x4d                         ;0xe860:   "M"
    DEFB 0x18                         ;0xe861:   0x18
    DEFB 0xaf                         ;0xe862:   ('/') + 0x80
    DEFB 0x32                         ;0xe863:   "2"
    DEFB 0xbe                         ;0xe864:   ('>') + 0x80
    DEFB 0x19                         ;0xe865:   0x19
    DEFB 0xeb                         ;0xe866:   ('k') + 0x80
    DEFB 0xcd                         ;0xe867:   ('M') + 0x80
    DEFB 0xa8                         ;0xe868:   ('(') + 0x80
    DEFB 0x15                         ;0xe869:   0x15
    DEFB 0xeb                         ;0xe86a:   ('k') + 0x80
    DEFB 0x78                         ;0xe86b:   "x"
    DEFB 0xb7                         ;0xe86c:   ('7') + 0x80
    DEFB 0xca                         ;0xe86d:   ('J') + 0x80
    DEFB 0xce                         ;0xe86e:   ('N') + 0x80
    DEFB 0x17                         ;0xe86f:   0x17
    DEFB 0xeb                         ;0xe870:   ('k') + 0x80
    DEFB 0x2a                         ;0xe871:   "*"
    DEFB 0x28                         ;0xe872:   "("
    DEFB 0x1c                         ;0xe873:   0x1c
    DEFB 0x4                          ;0xe874:   0x4
    DEFB 0x5                          ;0xe875:   0x5
    DEFB 0xca                         ;0xe876:   ('J') + 0x80
    DEFB 0xf8                         ;0xe877:   ('x') + 0x80
    DEFB 0x17                         ;0xe878:   0x17
    DEFB 0x2b                         ;0xe879:   "+"
    DEFB 0x1a                         ;0xe87a:   0x1a
    DEFB 0x77                         ;0xe87b:   "w"
    DEFB 0x1b                         ;0xe87c:   0x1b
    DEFB 0xc3                         ;0xe87d:   ('C') + 0x80
    DEFB 0xed                         ;0xe87e:   ('m') + 0x80
    DEFB 0x17                         ;0xe87f:   0x17
    DEFB 0x22                         ;0xe880:   """
    DEFB 0x28                         ;0xe881:   "("
    DEFB 0x1c                         ;0xe882:   0x1c
    DEFB 0xc5                         ;0xe883:   ('E') + 0x80
    DEFB 0xd5                         ;0xe884:   ('U') + 0x80
    DEFB 0xcd                         ;0xe885:   ('M') + 0x80
    DEFB 0x6a                         ;0xe886:   "j"
    DEFB 0x14                         ;0xe887:   0x14
    DEFB 0xca                         ;0xe888:   ('J') + 0x80
    DEFB 0x1                          ;0xe889:   0x1
    DEFB 0x16                         ;0xe88a:   0x16
    DEFB 0xe                          ;0xe88b:   0xe
    DEFB 0x8                          ;0xe88c:   0x8
    DEFB 0xcd                         ;0xe88d:   ('M') + 0x80
    DEFB 0xcd                         ;0xe88e:   ('M') + 0x80
    DEFB 0x13                         ;0xe88f:   0x13
    DEFB 0xc3                         ;0xe890:   ('C') + 0x80
    DEFB 0xf8                         ;0xe891:   ('x') + 0x80
    DEFB 0x16                         ;0xe892:   0x16
    DEFB 0xfe                         ;0xe893:   ('~') + 0x80
    DEFB 0xb                          ;0xe894:   0xb
    DEFB 0xc2                         ;0xe895:   ('B') + 0x80
    DEFB 0x1e                         ;0xe896:   0x1e
    DEFB 0x17                         ;0xe897:   0x17
    DEFB 0xeb                         ;0xe898:   ('k') + 0x80
    DEFB 0x21                         ;0xe899:   "!"
    DEFB 0x25                         ;0xe89a:   "%"
    DEFB 0x1c                         ;0xe89b:   0x1c
    DEFB 0x22                         ;0xe89c:   """
    DEFB 0x28                         ;0xe89d:   "("
    DEFB 0x1c                         ;0xe89e:   0x1c
    DEFB 0xeb                         ;0xe89f:   ('k') + 0x80
    DEFB 0xcd                         ;0xe8a0:   ('M') + 0x80
    DEFB 0x5e                         ;0xe8a1:   "^"
    DEFB 0x15                         ;0xe8a2:   0x15
    DEFB 0xc3                         ;0xe8a3:   ('C') + 0x80
    DEFB 0xff                         ;0xe8a4:   0xff
    DEFB 0x15                         ;0xe8a5:   0x15
    DEFB 0xfe                         ;0xe8a6:   ('~') + 0x80
    DEFB 0x7                          ;0xe8a7:   0x7
    DEFB 0xc2                         ;0xe8a8:   ('B') + 0x80
    DEFB 0x2d                         ;0xe8a9:   "-"
    DEFB 0x17                         ;0xe8aa:   0x17
    DEFB 0x3a                         ;0xe8ab:   ":"
    DEFB 0x2a                         ;0xe8ac:   "*"
    DEFB 0x1c                         ;0xe8ad:   0x1c
    DEFB 0xb7                         ;0xe8ae:   ('7') + 0x80
    DEFB 0xca                         ;0xe8af:   ('J') + 0x80
    DEFB 0xff                         ;0xe8b0:   0xff
    DEFB 0x15                         ;0xe8b1:   0x15
    DEFB 0xc3                         ;0xe8b2:   ('C') + 0x80
    DEFB 0x24                         ;0xe8b3:   "$"
    DEFB 0x16                         ;0xe8b4:   0x16
    DEFB 0xfe                         ;0xe8b5:   ('~') + 0x80
    DEFB 0x8                          ;0xe8b6:   0x8
    DEFB 0xc2                         ;0xe8b7:   ('B') + 0x80
    DEFB 0x50                         ;0xe8b8:   "P"
    DEFB 0x17                         ;0xe8b9:   0x17
    DEFB 0x3a                         ;0xe8ba:   ":"
    DEFB 0xca                         ;0xe8bb:   ('J') + 0x80
    DEFB 0xfb                         ;0xe8bc:   ('{') + 0x80
    DEFB 0x3c                         ;0xe8bd:   "<"
    DEFB 0xca                         ;0xe8be:   ('J') + 0x80
    DEFB 0x5c                         ;0xe8bf:   "\"
    DEFB 0x17                         ;0xe8c0:   0x17
    DEFB 0x3a                         ;0xe8c1:   ":"
    DEFB 0xbd                         ;0xe8c2:   ('=') + 0x80
    DEFB 0x19                         ;0xe8c3:   0x19
    DEFB 0x57                         ;0xe8c4:   "W"
    DEFB 0x3a                         ;0xe8c5:   ":"
    DEFB 0xb7                         ;0xe8c6:   ('7') + 0x80
    DEFB 0xfb                         ;0xe8c7:   ('{') + 0x80
    DEFB 0xba                         ;0xe8c8:   (':') + 0x80
    DEFB 0xca                         ;0xe8c9:   ('J') + 0x80
    DEFB 0xff                         ;0xe8ca:   0xff
    DEFB 0x15                         ;0xe8cb:   0x15
    DEFB 0x32                         ;0xe8cc:   "2"
    DEFB 0xbc                         ;0xe8cd:   ('<') + 0x80
    DEFB 0x19                         ;0xe8ce:   0x19
    DEFB 0x78                         ;0xe8cf:   "x"
    DEFB 0xb7                         ;0xe8d0:   ('7') + 0x80
    DEFB 0xca                         ;0xe8d1:   ('J') + 0x80
    DEFB 0x4d                         ;0xe8d2:   "M"
    DEFB 0x17                         ;0xe8d3:   0x17
    DEFB 0x5                          ;0xe8d4:   0x5
    DEFB 0xc3                         ;0xe8d5:   ('C') + 0x80
    DEFB 0xb                          ;0xe8d6:   0xb
    DEFB 0x18                         ;0xe8d7:   0x18
    DEFB 0xfe                         ;0xe8d8:   ('~') + 0x80
    DEFB 0x7f                         ;0xe8d9:   0x7f
    DEFB 0xc2                         ;0xe8da:   ('B') + 0x80
    DEFB 0x73                         ;0xe8db:   "s"
    DEFB 0x17                         ;0xe8dc:   0x17
    DEFB 0x3a                         ;0xe8dd:   ":"
    DEFB 0xcb                         ;0xe8de:   ('K') + 0x80
    DEFB 0xfb                         ;0xe8df:   ('{') + 0x80
    DEFB 0x3c                         ;0xe8e0:   "<"
    DEFB 0xca                         ;0xe8e1:   ('J') + 0x80
    DEFB 0x39                         ;0xe8e2:   "9"
    DEFB 0x17                         ;0xe8e3:   0x17
    DEFB 0x3e                         ;0xe8e4:   ">"
    DEFB 0x7f                         ;0xe8e5:   0x7f
    DEFB 0x32                         ;0xe8e6:   "2"
    DEFB 0xbf                         ;0xe8e7:   ('?') + 0x80
    DEFB 0x19                         ;0xe8e8:   0x19
    DEFB 0x3a                         ;0xe8e9:   ":"
    DEFB 0x2a                         ;0xe8ea:   "*"
    DEFB 0x1c                         ;0xe8eb:   0x1c
    DEFB 0xb7                         ;0xe8ec:   ('7') + 0x80
    DEFB 0xc2                         ;0xe8ed:   ('B') + 0x80
    DEFB 0x39                         ;0xe8ee:   "9"
    DEFB 0x17                         ;0xe8ef:   0x17
    DEFB 0x78                         ;0xe8f0:   "x"
    DEFB 0xb7                         ;0xe8f1:   ('7') + 0x80
    DEFB 0xca                         ;0xe8f2:   ('J') + 0x80
    DEFB 0xff                         ;0xe8f3:   0xff
    DEFB 0x15                         ;0xe8f4:   0x15
    DEFB 0x7e                         ;0xe8f5:   "~"
    DEFB 0x5                          ;0xe8f6:   0x5
    DEFB 0x2b                         ;0xe8f7:   "+"
    DEFB 0xc3                         ;0xe8f8:   ('C') + 0x80
    DEFB 0x71                         ;0xe8f9:   "q"
    DEFB 0x18                         ;0xe8fa:   0x18
    DEFB 0xfe                         ;0xe8fb:   ('~') + 0x80
    DEFB 0x5                          ;0xe8fc:   0x5
    DEFB 0xc2                         ;0xe8fd:   ('B') + 0x80
    DEFB 0x92                         ;0xe8fe:   0x92
    DEFB 0x17                         ;0xe8ff:   0x17
    DEFB 0xc5                         ;0xe900:   ('E') + 0x80
    DEFB 0x78                         ;0xe901:   "x"
    DEFB 0x32                         ;0xe902:   "2"
    DEFB 0xbe                         ;0xe903:   ('>') + 0x80
    DEFB 0x19                         ;0xe904:   0x19
    DEFB 0xe5                         ;0xe905:   ('e') + 0x80
    DEFB 0x3a                         ;0xe906:   ":"
    DEFB 0x2a                         ;0xe907:   "*"
    DEFB 0xb3                         ;0xe908:   ('3') + 0x80
    DEFB 0x15                         ;0xe909:   0x15
    DEFB 0x2a                         ;0xe90a:   "*"
    DEFB 0x26                         ;0xe90b:   "&"
    DEFB 0x1c                         ;0xe90c:   0x1c
    DEFB 0x7e                         ;0xe90d:   "~"
    DEFB 0xb7                         ;0xe90e:   ('7') + 0x80
    DEFB 0x32                         ;0xe90f:   "2"
    DEFB 0x2b                         ;0xe910:   "+"
    DEFB 0x1c                         ;0xe911:   0x1c
    DEFB 0xca                         ;0xe912:   ('J') + 0x80
    DEFB 0x6f                         ;0xe913:   "o"
    DEFB 0x16                         ;0xe914:   0x16
    DEFB 0x23                         ;0xe915:   "#"
    DEFB 0x22                         ;0xe916:   """
    DEFB 0x26                         ;0xe917:   "&"
    DEFB 0x1c                         ;0xe918:   0x1c
    DEFB 0x21                         ;0xe919:   "!"
    DEFB 0x2b                         ;0xe91a:   "+"
    DEFB 0x1c                         ;0xe91b:   0x1c
    DEFB 0x36                         ;0xe91c:   "6"
    DEFB 0x17                         ;0xe91d:   0x17
    DEFB 0xeb                         ;0xe91e:   ('k') + 0x80
    DEFB 0xc3                         ;0xe91f:   ('C') + 0x80
    DEFB 0x4d                         ;0xe920:   "M"
    DEFB 0x18                         ;0xe921:   0x18
    DEFB 0xfe                         ;0xe922:   ('~') + 0x80
    DEFB 0x1                          ;0xe923:   0x1
    DEFB 0xc2                         ;0xe924:   ('B') + 0x80
    DEFB 0xc5                         ;0xe925:   ('E') + 0x80
    DEFB 0x16                         ;0xe926:   0x16
    DEFB 0x3a                         ;0xe927:   ":"
    DEFB 0xbd                         ;0xe928:   ('=') + 0x80
    DEFB 0x19                         ;0xe929:   0x19
    DEFB 0x57                         ;0xe92a:   "W"
    DEFB 0x3a                         ;0xe92b:   ":"
    DEFB 0xb7                         ;0xe92c:   ('7') + 0x80
    DEFB 0xfb                         ;0xe92d:   ('{') + 0x80
    DEFB 0xba                         ;0xe92e:   (':') + 0x80
    DEFB 0xca                         ;0xe92f:   ('J') + 0x80
    DEFB 0xff                         ;0xe930:   0xff
    DEFB 0x15                         ;0xe931:   0x15
    DEFB 0x32                         ;0xe932:   "2"
    DEFB 0xbc                         ;0xe933:   ('<') + 0x80
    DEFB 0x19                         ;0xe934:   0x19
    DEFB 0x78                         ;0xe935:   "x"
    DEFB 0xb7                         ;0xe936:   ('7') + 0x80
    DEFB 0xca                         ;0xe937:   ('J') + 0x80
    DEFB 0xb                          ;0xe938:   0xb
    DEFB 0x18                         ;0xe939:   0x18
    DEFB 0x5                          ;0xe93a:   0x5
    DEFB 0xe5                         ;0xe93b:   ('e') + 0x80
    DEFB 0xcd                         ;0xe93c:   ('M') + 0x80
    DEFB 0xba                         ;0xe93d:   (':') + 0x80
    DEFB 0x15                         ;0xe93e:   0x15
    DEFB 0xd1                         ;0xe93f:   ('Q') + 0x80
    DEFB 0x2a                         ;0xe940:   "*"
    DEFB 0x28                         ;0xe941:   "("
    DEFB 0x1c                         ;0xe942:   0x1c
    DEFB 0x2b                         ;0xe943:   "+"
    DEFB 0x22                         ;0xe944:   """
    DEFB 0x28                         ;0xe945:   "("
    DEFB 0x1c                         ;0xe946:   0x1c
    DEFB 0x1a                         ;0xe947:   0x1a
    DEFB 0x77                         ;0xe948:   "w"
    DEFB 0xeb                         ;0xe949:   ('k') + 0x80
    DEFB 0xc3                         ;0xe94a:   ('C') + 0x80
    DEFB 0xb                          ;0xe94b:   0xb
    DEFB 0x18                         ;0xe94c:   0x18
    DEFB 0xfe                         ;0xe94d:   ('~') + 0x80
    DEFB 0x2                          ;0xe94e:   0x2
    DEFB 0xc2                         ;0xe94f:   ('B') + 0x80
    DEFB 0xb                          ;0xe950:   0xb
    DEFB 0x17                         ;0xe951:   0x17
    DEFB 0x3a                         ;0xe952:   ":"
    DEFB 0xbe                         ;0xe953:   ('>') + 0x80
    DEFB 0x19                         ;0xe954:   0x19
    DEFB 0xb8                         ;0xe955:   ('8') + 0x80
    DEFB 0xc2                         ;0xe956:   ('B') + 0x80
    DEFB 0xdc                         ;0xe957:   ('\') + 0x80
    DEFB 0x16                         ;0xe958:   0x16
    DEFB 0x3e                         ;0xe959:   ">"
    DEFB 0x17                         ;0xe95a:   0x17
    DEFB 0x32                         ;0xe95b:   "2"
    DEFB 0x2a                         ;0xe95c:   "*"
    DEFB 0x1c                         ;0xe95d:   0x1c
    DEFB 0x32                         ;0xe95e:   "2"
    DEFB 0xbf                         ;0xe95f:   ('?') + 0x80
    DEFB 0x19                         ;0xe960:   0x19
    DEFB 0xc3                         ;0xe961:   ('C') + 0x80
    DEFB 0x3a                         ;0xe962:   ":"
    DEFB 0x16                         ;0xe963:   0x16
    DEFB 0xeb                         ;0xe964:   ('k') + 0x80
    DEFB 0x2a                         ;0xe965:   "*"
    DEFB 0x28                         ;0xe966:   "("
    DEFB 0x1c                         ;0xe967:   0x1c
    DEFB 0x4                          ;0xe968:   0x4
    DEFB 0x5                          ;0xe969:   0x5
    DEFB 0x3a                         ;0xe96a:   ":"
    DEFB 0xbe                         ;0xe96b:   ('>') + 0x80
    DEFB 0x19                         ;0xe96c:   0x19
    DEFB 0xb8                         ;0xe96d:   ('8') + 0x80
    DEFB 0xca                         ;0xe96e:   ('J') + 0x80
    DEFB 0xf0                         ;0xe96f:   ('p') + 0x80
    DEFB 0x16                         ;0xe970:   0x16
    DEFB 0x2b                         ;0xe971:   "+"
    DEFB 0x1a                         ;0xe972:   0x1a
    DEFB 0x77                         ;0xe973:   "w"
    DEFB 0x1b                         ;0xe974:   0x1b
    DEFB 0xc3                         ;0xe975:   ('C') + 0x80
    DEFB 0xe1                         ;0xe976:   ('a') + 0x80
    DEFB 0x16                         ;0xe977:   0x16
    DEFB 0x22                         ;0xe978:   """
    DEFB 0x28                         ;0xe979:   "("
    DEFB 0x1c                         ;0xe97a:   0x1c
    DEFB 0xc5                         ;0xe97b:   ('E') + 0x80
    DEFB 0xd5                         ;0xe97c:   ('U') + 0x80
    DEFB 0xcd                         ;0xe97d:   ('M') + 0x80
    DEFB 0xba                         ;0xe97e:   (':') + 0x80
    DEFB 0x15                         ;0xe97f:   0x15
    DEFB 0x3a                         ;0xe980:   ":"
    DEFB 0xb7                         ;0xe981:   ('7') + 0x80
    DEFB 0xfb                         ;0xe982:   ('{') + 0x80
    DEFB 0x47                         ;0xe983:   "G"
    DEFB 0x3a                         ;0xe984:   ":"
    DEFB 0xbd                         ;0xe985:   ('=') + 0x80
    DEFB 0x19                         ;0xe986:   0x19
    DEFB 0xb8                         ;0xe987:   ('8') + 0x80
    DEFB 0xe5                         ;0xe988:   ('e') + 0x80
    DEFB 0x3a                         ;0xe989:   ":"
    DEFB 0x2b                         ;0xe98a:   "+"
    DEFB 0x1c                         ;0xe98b:   0x1c
    DEFB 0xb7                         ;0xe98c:   ('7') + 0x80
    DEFB 0xcc                         ;0xe98d:   ('L') + 0x80
    DEFB 0x9c                         ;0xe98e:   0x9c
    DEFB 0x14                         ;0xe98f:   0x14
    DEFB 0x32                         ;0xe990:   "2"
    DEFB 0xbf                         ;0xe991:   ('?') + 0x80
    DEFB 0x19                         ;0xe992:   0x19
    DEFB 0xe1                         ;0xe993:   ('a') + 0x80
    DEFB 0xc1                         ;0xe994:   ('A') + 0x80
    DEFB 0xfe                         ;0xe995:   ('~') + 0x80
    DEFB 0xd                          ;0xe996:   0xd
    DEFB 0xca                         ;0xe997:   ('J') + 0x80
    DEFB 0xe7                         ;0xe998:   ('g') + 0x80
    DEFB 0x18                         ;0xe999:   0x18
    DEFB 0xfe                         ;0xe99a:   ('~') + 0x80
    DEFB 0xa                          ;0xe99b:   0xa
    DEFB 0xca                         ;0xe99c:   ('J') + 0x80
    DEFB 0xe7                         ;0xe99d:   ('g') + 0x80
    DEFB 0x18                         ;0xe99e:   0x18
    DEFB 0xfe                         ;0xe99f:   ('~') + 0x80
    DEFB 0x6                          ;0xe9a0:   0x6
    DEFB 0xc2                         ;0xe9a1:   ('B') + 0x80
    DEFB 0x35                         ;0xe9a2:   "5"
    DEFB 0x16                         ;0xe9a3:   0x16
    DEFB 0xcd                         ;0xe9a4:   ('M') + 0x80
    DEFB 0xc0                         ;0xe9a5:   ('@') + 0x80
    DEFB 0x14                         ;0xe9a6:   0x14
    DEFB 0x1d                         ;0xe9a7:   0x1d
    DEFB 0xbb                         ;0xe9a8:   (';') + 0x80
    DEFB 0xd2                         ;0xe9a9:   ('R') + 0x80
    DEFB 0xff                         ;0xe9aa:   0xff
    DEFB 0x15                         ;0xe9ab:   0x15
    DEFB 0xeb                         ;0xe9ac:   ('k') + 0x80
    DEFB 0x2a                         ;0xe9ad:   "*"
    DEFB 0x28                         ;0xe9ae:   "("
    DEFB 0x1c                         ;0xe9af:   0x1c
    DEFB 0x7e                         ;0xe9b0:   "~"
    DEFB 0xb7                         ;0xe9b1:   ('7') + 0x80
    DEFB 0xca                         ;0xe9b2:   ('J') + 0x80
    DEFB 0x6f                         ;0xe9b3:   "o"
    DEFB 0x16                         ;0xe9b4:   0x16
    DEFB 0x23                         ;0xe9b5:   "#"
    DEFB 0x22                         ;0xe9b6:   """
    DEFB 0x28                         ;0xe9b7:   "("
    DEFB 0x1c                         ;0xe9b8:   0x1c
    DEFB 0xeb                         ;0xe9b9:   ('k') + 0x80
    DEFB 0xc3                         ;0xe9ba:   ('C') + 0x80
    DEFB 0x4d                         ;0xe9bb:   "M"
    DEFB 0x18                         ;0xe9bc:   0x18
    DEFB 0xfe                         ;0xe9bd:   ('~') + 0x80
    DEFB 0x17                         ;0xe9be:   0x17
    DEFB 0xc2                         ;0xe9bf:   ('B') + 0x80
    DEFB 0x9a                         ;0xe9c0:   0x9a
    DEFB 0x16                         ;0xe9c1:   0x16
    DEFB 0xeb                         ;0xe9c2:   ('k') + 0x80
    DEFB 0x2a                         ;0xe9c3:   "*"
    DEFB 0x28                         ;0xe9c4:   "("
    DEFB 0x1c                         ;0xe9c5:   0x1c
    DEFB 0x7e                         ;0xe9c6:   "~"
    DEFB 0xb7                         ;0xe9c7:   ('7') + 0x80
    DEFB 0xca                         ;0xe9c8:   ('J') + 0x80
    DEFB 0x60                         ;0xe9c9:   "`"
    DEFB 0x16                         ;0xe9ca:   0x16
    DEFB 0xeb                         ;0xe9cb:   ('k') + 0x80
    DEFB 0xcd                         ;0xe9cc:   ('M') + 0x80
    DEFB 0xc0                         ;0xe9cd:   ('@') + 0x80
    DEFB 0x14                         ;0xe9ce:   0x14
    DEFB 0x1d                         ;0xe9cf:   0x1d
    DEFB 0xbb                         ;0xe9d0:   (';') + 0x80
    DEFB 0xeb                         ;0xe9d1:   ('k') + 0x80
    DEFB 0xda                         ;0xe9d2:   ('Z') + 0x80
    DEFB 0x55                         ;0xe9d3:   "U"
    DEFB 0x16                         ;0xe9d4:   0x16
    DEFB 0xeb                         ;0xe9d5:   ('k') + 0x80
    DEFB 0xcd                         ;0xe9d6:   ('M') + 0x80
    DEFB 0x6f                         ;0xe9d7:   "o"
    DEFB 0x15                         ;0xe9d8:   0x15
    DEFB 0xeb                         ;0xe9d9:   ('k') + 0x80
    DEFB 0xc3                         ;0xe9da:   ('C') + 0x80
    DEFB 0x6a                         ;0xe9db:   "j"
    DEFB 0x16                         ;0xe9dc:   0x16
    DEFB 0x2a                         ;0xe9dd:   "*"
    DEFB 0x28                         ;0xe9de:   "("
    DEFB 0x1c                         ;0xe9df:   0x1c
    DEFB 0x7e                         ;0xe9e0:   "~"
    DEFB 0x23                         ;0xe9e1:   "#"
    DEFB 0x22                         ;0xe9e2:   """
    DEFB 0x28                         ;0xe9e3:   "("
    DEFB 0x1c                         ;0xe9e4:   0x1c
    DEFB 0xc3                         ;0xe9e5:   ('C') + 0x80
    DEFB 0x91                         ;0xe9e6:   0x91
    DEFB 0x16                         ;0xe9e7:   0x16
    DEFB 0x21                         ;0xe9e8:   "!"
    DEFB 0x2a                         ;0xe9e9:   "*"
    DEFB 0x1c                         ;0xe9ea:   0x1c
    DEFB 0x7e                         ;0xe9eb:   "~"
    DEFB 0x36                         ;0xe9ec:   "6"
    DEFB 0x1                          ;0xe9ed:   0x1
    DEFB 0x0                          ;0xe9ee:   0x0
    DEFB 0xb7                         ;0xe9ef:   ('7') + 0x80
    DEFB 0xca                         ;0xe9f0:   ('J') + 0x80
    DEFB 0x73                         ;0xe9f1:   "s"
    DEFB 0x16                         ;0xe9f2:   0x16
    DEFB 0x21                         ;0xe9f3:   "!"
    DEFB 0x2b                         ;0xe9f4:   "+"
    DEFB 0x1c                         ;0xe9f5:   0x1c
    DEFB 0x36                         ;0xe9f6:   "6"
    DEFB 0x1                          ;0xe9f7:   0x1
    DEFB 0x0                          ;0xe9f8:   0x0
    DEFB 0xeb                         ;0xe9f9:   ('k') + 0x80
    DEFB 0xc3                         ;0xe9fa:   ('C') + 0x80
    DEFB 0xff                         ;0xe9fb:   0xff
    DEFB 0x15                         ;0xe9fc:   0x15
    DEFB 0x3a                         ;0xe9fd:   ":"
    DEFB 0x2b                         ;0xe9fe:   "+"
    DEFB 0x1c                         ;0xe9ff:   0x1c
    DEFB 0xb7                         ;0xea00:   ('7') + 0x80
    DEFB 0xc2                         ;0xea01:   ('B') + 0x80
    DEFB 0x82                         ;0xea02:   0x82
    DEFB 0x16                         ;0xea03:   0x16
    DEFB 0x78                         ;0xea04:   "x"
    DEFB 0xb7                         ;0xea05:   ('7') + 0x80
    DEFB 0xc2                         ;0xea06:   ('B') + 0x80
    DEFB 0x6f                         ;0xea07:   "o"
    DEFB 0x16                         ;0xea08:   0x16
    DEFB 0xcd                         ;0xea09:   ('M') + 0x80
    DEFB 0xda                         ;0xea0a:   ('Z') + 0x80
    DEFB 0x8a                         ;0xea0b:   0x8a
    DEFB 0x15                         ;0xea0c:   0x15
    DEFB 0x7b                         ;0xea0d:   "{"
    DEFB 0x32                         ;0xea0e:   "2"
    DEFB 0xb7                         ;0xea0f:   ('7') + 0x80
    DEFB 0xfb                         ;0xea10:   ('{') + 0x80
    DEFB 0xc3                         ;0xea11:   ('C') + 0x80
    DEFB 0x93                         ;0xea12:   0x93
    DEFB 0x15                         ;0xea13:   0x15
    DEFB 0xe5                         ;0xea14:   ('e') + 0x80
    DEFB 0xcd                         ;0xea15:   ('M') + 0x80
    DEFB 0x13                         ;0xea16:   0x13
    DEFB 0x14                         ;0xea17:   0x14
    DEFB 0xe1                         ;0xea18:   ('a') + 0x80
    DEFB 0x23                         ;0xea19:   "#"
    DEFB 0xc3                         ;0xea1a:   ('C') + 0x80
    DEFB 0x77                         ;0xea1b:   "w"
    DEFB 0x15                         ;0xea1c:   0x15
    DEFB 0x3a                         ;0xea1d:   ":"
    DEFB 0xb7                         ;0xea1e:   ('7') + 0x80
    DEFB 0xfb                         ;0xea1f:   ('{') + 0x80
    DEFB 0x32                         ;0xea20:   "2"
    DEFB 0x2e                         ;0xea21:   "."
    DEFB 0x1c                         ;0xea22:   0x1c
    DEFB 0xcd                         ;0xea23:   ('M') + 0x80
    DEFB 0x1b                         ;0xea24:   0x1b
    DEFB 0x15                         ;0xea25:   0x15
    DEFB 0xcd                         ;0xea26:   ('M') + 0x80
    DEFB 0x2b                         ;0xea27:   "+"
    DEFB 0x15                         ;0xea28:   0x15
    DEFB 0x3a                         ;0xea29:   ":"
    DEFB 0x2e                         ;0xea2a:   "."
    DEFB 0x1c                         ;0xea2b:   0x1c
    DEFB 0x32                         ;0xea2c:   "2"
    DEFB 0x2d                         ;0xea2d:   "-"
    DEFB 0x1c                         ;0xea2e:   0x1c
    DEFB 0xc1                         ;0xea2f:   ('A') + 0x80
    DEFB 0xe1                         ;0xea30:   ('a') + 0x80
    DEFB 0xc9                         ;0xea31:   ('I') + 0x80
    DEFB 0x21                         ;0xea32:   "!"
    DEFB 0x25                         ;0xea33:   "%"
    DEFB 0x1c                         ;0xea34:   0x1c
    DEFB 0x22                         ;0xea35:   """
    DEFB 0x28                         ;0xea36:   "("
    DEFB 0x1c                         ;0xea37:   0x1c
    DEFB 0xaf                         ;0xea38:   ('/') + 0x80
    DEFB 0x32                         ;0xea39:   "2"
    DEFB 0x2a                         ;0xea3a:   "*"
    DEFB 0x1c                         ;0xea3b:   0x1c
    DEFB 0xc9                         ;0xea3c:   ('I') + 0x80
    DEFB 0x21                         ;0xea3d:   "!"
    DEFB 0xc2                         ;0xea3e:   ('B') + 0x80
    DEFB 0x1a                         ;0xea3f:   0x1a
    DEFB 0x22                         ;0xea40:   """
    DEFB 0x26                         ;0xea41:   "&"
    DEFB 0x1c                         ;0xea42:   0x1c
    DEFB 0xc9                         ;0xea43:   ('I') + 0x80
    DEFB 0x21                         ;0xea44:   "!"
    DEFB 0x2a                         ;0xea45:   "*"
    DEFB 0x1c                         ;0xea46:   0x1c
    DEFB 0x7e                         ;0xea47:   "~"
    DEFB 0xb7                         ;0xea48:   ('7') + 0x80
    DEFB 0xc0                         ;0xea49:   ('@') + 0x80
    DEFB 0x34                         ;0xea4a:   "4"
    DEFB 0x3a                         ;0xea4b:   ":"
    DEFB 0xb7                         ;0xea4c:   ('7') + 0x80
    DEFB 0xfb                         ;0xea4d:   ('{') + 0x80
    DEFB 0x32                         ;0xea4e:   "2"
    DEFB 0x2d                         ;0xea4f:   "-"
    DEFB 0x1c                         ;0xea50:   0x1c
    DEFB 0xc9                         ;0xea51:   ('I') + 0x80
    DEFB 0xcd                         ;0xea52:   ('M') + 0x80
    DEFB 0xc0                         ;0xea53:   ('@') + 0x80
    DEFB 0x14                         ;0xea54:   0x14
    DEFB 0xd4                         ;0xea55:   ('T') + 0x80
    DEFB 0x82                         ;0xea56:   0x82
    DEFB 0x14                         ;0xea57:   0x14
    DEFB 0x3a                         ;0xea58:   ":"
    DEFB 0xc0                         ;0xea59:   ('@') + 0x80
    DEFB 0x19                         ;0xea5a:   0x19
    DEFB 0x47                         ;0xea5b:   "G"
    DEFB 0xe                          ;0xea5c:   0xe
    DEFB 0x1                          ;0xea5d:   0x1
    DEFB 0x0                          ;0xea5e:   0x0
    DEFB 0xcd                         ;0xea5f:   ('M') + 0x80
    DEFB 0xee                         ;0xea60:   ('n') + 0x80
    DEFB 0x14                         ;0xea61:   0x14
    DEFB 0xcd                         ;0xea62:   ('M') + 0x80
    DEFB 0xb3                         ;0xea63:   ('3') + 0x80
    DEFB 0x15                         ;0xea64:   0x15
    DEFB 0xcd                         ;0xea65:   ('M') + 0x80
    DEFB 0xa8                         ;0xea66:   ('(') + 0x80
    DEFB 0x15                         ;0xea67:   0x15
    DEFB 0xcd                         ;0xea68:   ('M') + 0x80
    DEFB 0x5e                         ;0xea69:   "^"
    DEFB 0x15                         ;0xea6a:   0x15
    DEFB 0xaf                         ;0xea6b:   ('/') + 0x80
    DEFB 0x32                         ;0xea6c:   "2"
    DEFB 0x2b                         ;0xea6d:   "+"
    DEFB 0x1c                         ;0xea6e:   0x1c
    DEFB 0x3e                         ;0xea6f:   ">"
    DEFB 0x1                          ;0xea70:   0x1
    DEFB 0x32                         ;0xea71:   "2"
    DEFB 0xdf                         ;0xea72:   ('_') + 0x80
    DEFB 0xfb                         ;0xea73:   ('{') + 0x80
    DEFB 0x3a                         ;0xea74:   ":"
    DEFB 0xb7                         ;0xea75:   ('7') + 0x80
    DEFB 0xfb                         ;0xea76:   ('{') + 0x80
    DEFB 0x32                         ;0xea77:   "2"
    DEFB 0xbd                         ;0xea78:   ('=') + 0x80
    DEFB 0x19                         ;0xea79:   0x19
    DEFB 0x2a                         ;0xea7a:   "*"
    DEFB 0xdb                         ;0xea7b:   ('[') + 0x80
    DEFB 0xfb                         ;0xea7c:   ('{') + 0x80
    DEFB 0x4e                         ;0xea7d:   "N"
    DEFB 0x23                         ;0xea7e:   "#"
    DEFB 0xe5                         ;0xea7f:   ('e') + 0x80
    DEFB 0xaf                         ;0xea80:   ('/') + 0x80
    DEFB 0x47                         ;0xea81:   "G"
    DEFB 0x32                         ;0xea82:   "2"
    DEFB 0xbe                         ;0xea83:   ('>') + 0x80
    DEFB 0x19                         ;0xea84:   0x19
    DEFB 0xb9                         ;0xea85:   ('9') + 0x80
    DEFB 0xc2                         ;0xea86:   ('B') + 0x80
    DEFB 0xff                         ;0xea87:   0xff
    DEFB 0x15                         ;0xea88:   0x15
    DEFB 0xc                          ;0xea89:   0xc
    DEFB 0xc5                         ;0xea8a:   ('E') + 0x80
    DEFB 0xc8                         ;0xea8b:   ('H') + 0x80
    DEFB 0x32                         ;0xea8c:   "2"
    DEFB 0xc0                         ;0xea8d:   ('@') + 0x80
    DEFB 0x19                         ;0xea8e:   0x19
    DEFB 0xd5                         ;0xea8f:   ('U') + 0x80
    DEFB 0x1                          ;0xea90:   0x1
    DEFB 0xf                          ;0xea91:   0xf
    DEFB 0x15                         ;0xea92:   0x15
    DEFB 0xc5                         ;0xea93:   ('E') + 0x80
    DEFB 0x47                         ;0xea94:   "G"
    DEFB 0x4                          ;0xea95:   0x4
    DEFB 0x48                         ;0xea96:   "H"
    DEFB 0xc3                         ;0xea97:   ('C') + 0x80
    DEFB 0x29                         ;0xea98:   ")"
    DEFB 0x1d                         ;0xea99:   0x1d
    DEFB 0xe1                         ;0xea9a:   ('a') + 0x80
    DEFB 0x2b                         ;0xea9b:   "+"
    DEFB 0x36                         ;0xea9c:   "6"
    DEFB 0x1                          ;0xea9d:   0x1
    DEFB 0x0                          ;0xea9e:   0x0
    DEFB 0xc9                         ;0xea9f:   ('I') + 0x80
    DEFB 0x3a                         ;0xeaa0:   ":"
    DEFB 0xb7                         ;0xeaa1:   ('7') + 0x80
    DEFB 0xfb                         ;0xeaa2:   ('{') + 0x80
    DEFB 0x32                         ;0xeaa3:   "2"
    DEFB 0x2c                         ;0xeaa4:   ","
    DEFB 0x1c                         ;0xeaa5:   0x1c
    DEFB 0xc9                         ;0xeaa6:   ('I') + 0x80
    DEFB 0x3a                         ;0xeaa7:   ":"
    DEFB 0xb7                         ;0xeaa8:   ('7') + 0x80
    DEFB 0xfb                         ;0xeaa9:   ('{') + 0x80
    DEFB 0x21                         ;0xeaaa:   "!"
    DEFB 0x2d                         ;0xeaab:   "-"
    DEFB 0x1c                         ;0xeaac:   0x1c
    DEFB 0xbe                         ;0xeaad:   ('>') + 0x80
    DEFB 0xd0                         ;0xeaae:   ('P') + 0x80
    DEFB 0xe                          ;0xeaaf:   0xe
    DEFB 0x20                         ;0xeab0:   " "
    DEFB 0xcd                         ;0xeab1:   ('M') + 0x80
    DEFB 0xcd                         ;0xeab2:   ('M') + 0x80
    DEFB 0x13                         ;0xeab3:   0x13
    DEFB 0xc3                         ;0xeab4:   ('C') + 0x80
    DEFB 0x1b                         ;0xeab5:   0x1b
    DEFB 0x15                         ;0xeab6:   0x15
    DEFB 0x3a                         ;0xeab7:   ":"
    DEFB 0x2c                         ;0xeab8:   ","
    DEFB 0x1c                         ;0xeab9:   0x1c
    DEFB 0x21                         ;0xeaba:   "!"
    DEFB 0xb7                         ;0xeabb:   ('7') + 0x80
    DEFB 0xfb                         ;0xeabc:   ('{') + 0x80
    DEFB 0xbe                         ;0xeabd:   ('>') + 0x80
    DEFB 0xd0                         ;0xeabe:   ('P') + 0x80
    DEFB 0xe                          ;0xeabf:   0xe
    DEFB 0x8                          ;0xeac0:   0x8
    DEFB 0xcd                         ;0xeac1:   ('M') + 0x80
    DEFB 0xcd                         ;0xeac2:   ('M') + 0x80
    DEFB 0x13                         ;0xeac3:   0x13
    DEFB 0xc3                         ;0xeac4:   ('C') + 0x80
    DEFB 0x2b                         ;0xeac5:   "+"
    DEFB 0x15                         ;0xeac6:   0x15
    DEFB 0xc5                         ;0xeac7:   ('E') + 0x80
    DEFB 0xe5                         ;0xeac8:   ('e') + 0x80
    DEFB 0x2a                         ;0xeac9:   "*"
    DEFB 0x28                         ;0xeaca:   "("
    DEFB 0x1c                         ;0xeacb:   0x1c
    DEFB 0x1e                         ;0xeacc:   0x1e
    DEFB 0x1                          ;0xeacd:   0x1
    DEFB 0x0                          ;0xeace:   0x0
    DEFB 0x7e                         ;0xeacf:   "~"
    DEFB 0xb7                         ;0xead0:   ('7') + 0x80
    DEFB 0xca                         ;0xead1:   ('J') + 0x80
    DEFB 0x4c                         ;0xead2:   "L"
    DEFB 0x15                         ;0xead3:   0x15
    DEFB 0x1c                         ;0xead4:   0x1c
    DEFB 0x23                         ;0xead5:   "#"
    DEFB 0xc3                         ;0xead6:   ('C') + 0x80
    DEFB 0x42                         ;0xead7:   "B"
    DEFB 0x15                         ;0xead8:   0x15
    DEFB 0x78                         ;0xead9:   "x"
    DEFB 0x83                         ;0xeada:   0x83
    DEFB 0xb9                         ;0xeadb:   ('9') + 0x80
    DEFB 0xf5                         ;0xeadc:   ('u') + 0x80
    DEFB 0xe                          ;0xeadd:   0xe
    DEFB 0x7                          ;0xeade:   0x7
    DEFB 0xd4                         ;0xeadf:   ('T') + 0x80
    DEFB 0x7a                         ;0xeae0:   "z"
    DEFB 0xfb                         ;0xeae1:   ('{') + 0x80
    DEFB 0xf1                         ;0xeae2:   ('q') + 0x80
    DEFB 0xe1                         ;0xeae3:   ('a') + 0x80
    DEFB 0xc1                         ;0xeae4:   ('A') + 0x80
    DEFB 0xd8                         ;0xeae5:   ('X') + 0x80
    DEFB 0xd1                         ;0xeae6:   ('Q') + 0x80
    DEFB 0xd1                         ;0xeae7:   ('Q') + 0x80
    DEFB 0xc3                         ;0xeae8:   ('C') + 0x80
    DEFB 0xff                         ;0xeae9:   0xff
    DEFB 0x15                         ;0xeaea:   0x15
    DEFB 0x3a                         ;0xeaeb:   ":"
    DEFB 0x2a                         ;0xeaec:   "*"
    DEFB 0x1c                         ;0xeaed:   0x1c
    DEFB 0xb7                         ;0xeaee:   ('7') + 0x80
    DEFB 0xc8                         ;0xeaef:   ('H') + 0x80
    DEFB 0x3a                         ;0xeaf0:   ":"
    DEFB 0xbf                         ;0xeaf1:   ('?') + 0x80
    DEFB 0x19                         ;0xeaf2:   0x19
    DEFB 0xfe                         ;0xeaf3:   ('~') + 0x80
    DEFB 0x1                          ;0xeaf4:   0x1
    DEFB 0xc8                         ;0xeaf5:   ('H') + 0x80
    DEFB 0xfe                         ;0xeaf6:   ('~') + 0x80
    DEFB 0x6                          ;0xeaf7:   0x6
    DEFB 0xc8                         ;0xeaf8:   ('H') + 0x80
    DEFB 0xfe                         ;0xeaf9:   ('~') + 0x80
    DEFB 0x17                         ;0xeafa:   0x17
    DEFB 0xc8                         ;0xeafb:   ('H') + 0x80
    DEFB 0xe5                         ;0xeafc:   ('e') + 0x80
    DEFB 0xc5                         ;0xeafd:   ('E') + 0x80
    DEFB 0xcd                         ;0xeafe:   ('M') + 0x80
    DEFB 0x14                         ;0xeaff:   0x14
    DEFB 0x15                         ;0xeb00:   0x15
    DEFB 0x2a                         ;0xeb01:   "*"
    DEFB 0x28                         ;0xeb02:   "("
    DEFB 0x1c                         ;0xeb03:   0x1c
    DEFB 0x7e                         ;0xeb04:   "~"
    DEFB 0xb7                         ;0xeb05:   ('7') + 0x80
    DEFB 0xca                         ;0xeb06:   ('J') + 0x80
    DEFB 0x93                         ;0xeb07:   0x93
    DEFB 0x15                         ;0xeb08:   0x15
    DEFB 0x4f                         ;0xeb09:   "O"
    DEFB 0xcd                         ;0xeb0a:   ('M') + 0x80
    DEFB 0xc0                         ;0xeb0b:   ('@') + 0x80
    DEFB 0x14                         ;0xeb0c:   0x14
    DEFB 0x72                         ;0xeb0d:   "r"
    DEFB 0x14                         ;0xeb0e:   0x14
    DEFB 0xe                          ;0xeb0f:   0xe
    DEFB 0xd                          ;0xeb10:   0xd
    DEFB 0xcd                         ;0xeb11:   ('M') + 0x80
    DEFB 0xcd                         ;0xeb12:   ('M') + 0x80
    DEFB 0x13                         ;0xeb13:   0x13
    DEFB 0xe                          ;0xeb14:   0xe
    DEFB 0xa                          ;0xeb15:   0xa
    DEFB 0xc3                         ;0xeb16:   ('C') + 0x80
    DEFB 0xcd                         ;0xeb17:   ('M') + 0x80
    DEFB 0x13                         ;0xeb18:   0x13
    DEFB 0x21                         ;0xeb19:   "!"
    DEFB 0xd3                         ;0xeb1a:   ('S') + 0x80
    DEFB 0xfb                         ;0xeb1b:   ('{') + 0x80
    DEFB 0xa                          ;0xeb1c:   0xa
    DEFB 0xbe                         ;0xeb1d:   ('>') + 0x80
    DEFB 0xc8                         ;0xeb1e:   ('H') + 0x80
    DEFB 0x3                          ;0xeb1f:   0x3
    DEFB 0xc5                         ;0xeb20:   ('E') + 0x80
    DEFB 0x4f                         ;0xeb21:   "O"
    DEFB 0xcd                         ;0xeb22:   ('M') + 0x80
    DEFB 0x28                         ;0xeb23:   "("
    DEFB 0x14                         ;0xeb24:   0x14
    DEFB 0xc1                         ;0xeb25:   ('A') + 0x80
    DEFB 0xc3                         ;0xeb26:   ('C') + 0x80
    DEFB 0x8c                         ;0xeb27:   0x8c
    DEFB 0x14                         ;0xeb28:   0x14
    DEFB 0x2a                         ;0xeb29:   "*"
    DEFB 0x28                         ;0xeb2a:   "("
    DEFB 0x1c                         ;0xeb2b:   0x1c
    DEFB 0x7e                         ;0xeb2c:   "~"
    DEFB 0x32                         ;0xeb2d:   "2"
    DEFB 0x2a                         ;0xeb2e:   "*"
    DEFB 0x1c                         ;0xeb2f:   0x1c
    DEFB 0x2a                         ;0xeb30:   "*"
;--------------------------------------
D_EB31:                               ; XREF: 0xF096 
    DEFB 0xba                         ;0xeb31:   (':') + 0x80
    DEFB 0xfb                         ;0xeb32:   ('{') + 0x80
    DEFB 0x7d                         ;0xeb33:   "}"
    DEFB 0xb4                         ;0xeb34:   ('4') + 0x80
    DEFB 0xca                         ;0xeb35:   ('J') + 0x80
    DEFB 0xb7                         ;0xeb36:   ('7') + 0x80
    DEFB 0x12                         ;0xeb37:   0x12
    DEFB 0xcd                         ;0xeb38:   ('M') + 0x80
    DEFB 0x21                         ;0xeb39:   "!"
    DEFB 0xf6                         ;0xeb3a:   ('v') + 0x80
    DEFB 0x23                         ;0xeb3b:   "#"
    DEFB 0xb7                         ;0xeb3c:   ('7') + 0x80
    DEFB 0xc2                         ;0xeb3d:   ('B') + 0x80
    DEFB 0xb6                         ;0xeb3e:   ('6') + 0x80
    DEFB 0x14                         ;0xeb3f:   0x14
    DEFB 0x21                         ;0xeb40:   "!"
    DEFB 0x2                          ;0xeb41:   0x2
    DEFB 0x0                          ;0xeb42:   0x0
    DEFB 0x22                         ;0xeb43:   """
    DEFB 0xba                         ;0xeb44:   (':') + 0x80
    DEFB 0xfb                         ;0xeb45:   ('{') + 0x80
    DEFB 0x22                         ;0xeb46:   """
    DEFB 0xbc                         ;0xeb47:   ('<') + 0x80
    DEFB 0xfb                         ;0xeb48:   ('{') + 0x80
    DEFB 0xc0                         ;0xeb49:   ('@') + 0x80
    DEFB 0xc3                         ;0xeb4a:   ('C') + 0x80
    DEFB 0xb7                         ;0xeb4b:   ('7') + 0x80
    DEFB 0x12                         ;0xeb4c:   0x12
    DEFB 0x3a                         ;0xeb4d:   ":"
    DEFB 0xb6                         ;0xeb4e:   ('6') + 0x80
    DEFB 0xfb                         ;0xeb4f:   ('{') + 0x80
    DEFB 0x5f                         ;0xeb50:   "_"
    DEFB 0x3a                         ;0xeb51:   ":"
    DEFB 0xb7                         ;0xeb52:   ('7') + 0x80
    DEFB 0xfb                         ;0xeb53:   ('{') + 0x80
    DEFB 0xbb                         ;0xeb54:   (';') + 0x80
    DEFB 0xc9                         ;0xeb55:   ('I') + 0x80
    DEFB 0xeb                         ;0xeb56:   ('k') + 0x80
    DEFB 0x2a                         ;0xeb57:   "*"
    DEFB 0x28                         ;0xeb58:   "("
    DEFB 0x1c                         ;0xeb59:   0x1c
    DEFB 0xeb                         ;0xeb5a:   ('k') + 0x80
    DEFB 0x1a                         ;0xeb5b:   0x1a
    DEFB 0xb7                         ;0xeb5c:   ('7') + 0x80
    DEFB 0xc8                         ;0xeb5d:   ('H') + 0x80
    DEFB 0x13                         ;0xeb5e:   0x13
    DEFB 0x23                         ;0xeb5f:   "#"
    DEFB 0x77                         ;0xeb60:   "w"
    DEFB 0x4                          ;0xeb61:   0x4
    DEFB 0xc3                         ;0xeb62:   ('C') + 0x80
    DEFB 0xce                         ;0xeb63:   ('N') + 0x80
    DEFB 0x14                         ;0xeb64:   0x14
    DEFB 0x78                         ;0xeb65:   "x"
    DEFB 0xb7                         ;0xeb66:   ('7') + 0x80
    DEFB 0xc8                         ;0xeb67:   ('H') + 0x80
    DEFB 0xc5                         ;0xeb68:   ('E') + 0x80
    DEFB 0x48                         ;0xeb69:   "H"
    DEFB 0xe5                         ;0xeb6a:   ('e') + 0x80
    DEFB 0xeb                         ;0xeb6b:   ('k') + 0x80
    DEFB 0x13                         ;0xeb6c:   0x13
    DEFB 0x21                         ;0xeb6d:   "!"
    DEFB 0xc2                         ;0xeb6e:   ('B') + 0x80
    DEFB 0x1a                         ;0xeb6f:   0x1a
    DEFB 0xcd                         ;0xeb70:   ('M') + 0x80
    DEFB 0x29                         ;0xeb71:   ")"
    DEFB 0x1d                         ;0xeb72:   0x1d
    DEFB 0x36                         ;0xeb73:   "6"
    DEFB 0x1                          ;0xeb74:   0x1
    DEFB 0x0                          ;0xeb75:   0x0
    DEFB 0x22                         ;0xeb76:   """
    DEFB 0x26                         ;0xeb77:   "&"
    DEFB 0x1c                         ;0xeb78:   0x1c
    DEFB 0xe1                         ;0xeb79:   ('a') + 0x80
    DEFB 0xc1                         ;0xeb7a:   ('A') + 0x80
    DEFB 0xc9                         ;0xeb7b:   ('I') + 0x80
    DEFB 0x3a                         ;0xeb7c:   ":"
    DEFB 0xb4                         ;0xeb7d:   ('4') + 0x80
    DEFB 0xfb                         ;0xeb7e:   ('{') + 0x80
    DEFB 0x17                         ;0xeb7f:   0x17
    DEFB 0xd0                         ;0xeb80:   ('P') + 0x80
    DEFB 0x21                         ;0xeb81:   "!"
    DEFB 0xc2                         ;0xeb82:   ('B') + 0x80
    DEFB 0x1a                         ;0xeb83:   0x1a
    DEFB 0x11                         ;0xeb84:   0x11
    DEFB 0xc1                         ;0xeb85:   ('A') + 0x80
    DEFB 0x19                         ;0xeb86:   0x19
    DEFB 0xc                          ;0xeb87:   0xc
    DEFB 0xc2                         ;0xeb88:   ('B') + 0x80
    DEFB 0xa                          ;0xeb89:   0xa
    DEFB 0x15                         ;0xeb8a:   0x15
    DEFB 0xeb                         ;0xeb8b:   ('k') + 0x80
    DEFB 0x78                         ;0xeb8c:   "x"
    DEFB 0xb7                         ;0xeb8d:   ('7') + 0x80
    DEFB 0xd0                         ;0xeb8e:   ('P') + 0x80
    DEFB 0x35                         ;0xeb8f:   "5"
    DEFB 0x7e                         ;0xeb90:   "~"
    DEFB 0xb7                         ;0xeb91:   ('7') + 0x80
    DEFB 0xc8                         ;0xeb92:   ('H') + 0x80
    DEFB 0x79                         ;0xeb93:   "y"
    DEFB 0xfe                         ;0xeb94:   ('~') + 0x80
    DEFB 0x8                          ;0xeb95:   0x8
    DEFB 0xc2                         ;0xeb96:   ('B') + 0x80
    DEFB 0xd                          ;0xeb97:   0xd
    DEFB 0x14                         ;0xeb98:   0x14
    DEFB 0x35                         ;0xeb99:   "5"
    DEFB 0xc9                         ;0xeb9a:   ('I') + 0x80
    DEFB 0xfe                         ;0xeb9b:   ('~') + 0x80
    DEFB 0xd                          ;0xeb9c:   0xd
    DEFB 0xc0                         ;0xeb9d:   ('@') + 0x80
    DEFB 0x36                         ;0xeb9e:   "6"
    DEFB 0x1                          ;0xeb9f:   0x1
    DEFB 0x0                          ;0xeba0:   0x0
    DEFB 0xc9                         ;0xeba1:   ('I') + 0x80
    DEFB 0x79                         ;0xeba2:   "y"
    DEFB 0xcd                         ;0xeba3:   ('M') + 0x80
    DEFB 0xf0                         ;0xeba4:   ('p') + 0x80
    DEFB 0x12                         ;0xeba5:   0x12
    DEFB 0xd2                         ;0xeba6:   ('R') + 0x80
    DEFB 0x28                         ;0xeba7:   "("
    DEFB 0x14                         ;0xeba8:   0x14
    DEFB 0xf5                         ;0xeba9:   ('u') + 0x80
    DEFB 0xe                          ;0xebaa:   0xe
    DEFB 0x5e                         ;0xebab:   "^"
    DEFB 0xcd                         ;0xebac:   ('M') + 0x80
    DEFB 0xcd                         ;0xebad:   ('M') + 0x80
    DEFB 0x13                         ;0xebae:   0x13
    DEFB 0xf1                         ;0xebaf:   ('q') + 0x80
    DEFB 0xf6                         ;0xebb0:   ('v') + 0x80
    DEFB 0x40                         ;0xebb1:   "@"
    DEFB 0x4f                         ;0xebb2:   "O"
    DEFB 0xcd                         ;0xebb3:   ('M') + 0x80
    DEFB 0xc0                         ;0xebb4:   ('@') + 0x80
    DEFB 0x14                         ;0xebb5:   0x14
    DEFB 0xc8                         ;0xebb6:   ('H') + 0x80
    DEFB 0x3a                         ;0xebb7:   ":"
    DEFB 0xdf                         ;0xebb8:   ('_') + 0x80
    DEFB 0xfb                         ;0xebb9:   ('{') + 0x80
    DEFB 0x3d                         ;0xebba:   "="
    DEFB 0xca                         ;0xebbb:   ('J') + 0x80
    DEFB 0x37                         ;0xebbc:   "7"
    DEFB 0x14                         ;0xebbd:   0x14
    DEFB 0x3a                         ;0xebbe:   ":"
    DEFB 0xcf                         ;0xebbf:   ('O') + 0x80
    DEFB 0xfb                         ;0xebc0:   ('{') + 0x80
    DEFB 0xe6                         ;0xebc1:   ('f') + 0x80
    DEFB 0x14                         ;0xebc2:   0x14
    DEFB 0xc2                         ;0xebc3:   ('B') + 0x80
    DEFB 0xcd                         ;0xebc4:   ('M') + 0x80
    DEFB 0x13                         ;0xebc5:   0x13
    DEFB 0x79                         ;0xebc6:   "y"
    DEFB 0xfe                         ;0xebc7:   ('~') + 0x80
    DEFB 0x9                          ;0xebc8:   0x9
    DEFB 0xc2                         ;0xebc9:   ('B') + 0x80
    DEFB 0xcd                         ;0xebca:   ('M') + 0x80
    DEFB 0x13                         ;0xebcb:   0x13
    DEFB 0x3a                         ;0xebcc:   ":"
    DEFB 0xdf                         ;0xebcd:   ('_') + 0x80
    DEFB 0xfb                         ;0xebce:   ('{') + 0x80
    DEFB 0xfe                         ;0xebcf:   ('~') + 0x80
    DEFB 0x1                          ;0xebd0:   0x1
    DEFB 0xc2                         ;0xebd1:   ('B') + 0x80
    DEFB 0x49                         ;0xebd2:   "I"
    DEFB 0x14                         ;0xebd3:   0x14
    DEFB 0xcd                         ;0xebd4:   ('M') + 0x80
    DEFB 0xc0                         ;0xebd5:   ('@') + 0x80
    DEFB 0x14                         ;0xebd6:   0x14
    DEFB 0xc8                         ;0xebd7:   ('H') + 0x80
    DEFB 0xe                          ;0xebd8:   0xe
    DEFB 0x20                         ;0xebd9:   " "
    DEFB 0xcd                         ;0xebda:   ('M') + 0x80
    DEFB 0xcd                         ;0xebdb:   ('M') + 0x80
    DEFB 0x13                         ;0xebdc:   0x13
    DEFB 0x3a                         ;0xebdd:   ":"
    DEFB 0xb7                         ;0xebde:   ('7') + 0x80
    DEFB 0xfb                         ;0xebdf:   ('{') + 0x80
    DEFB 0xe6                         ;0xebe0:   ('f') + 0x80
    DEFB 0x7                          ;0xebe1:   0x7
    DEFB 0xc2                         ;0xebe2:   ('B') + 0x80
    DEFB 0x3d                         ;0xebe3:   "="
    DEFB 0x14                         ;0xebe4:   0x14
    DEFB 0xc9                         ;0xebe5:   ('I') + 0x80
    DEFB 0xcd                         ;0xebe6:   ('M') + 0x80
    DEFB 0x65                         ;0xebe7:   "e"
    DEFB 0x14                         ;0xebe8:   0x14
    DEFB 0x3a                         ;0xebe9:   ":"
    DEFB 0xbf                         ;0xebea:   ('?') + 0x80
    DEFB 0x19                         ;0xebeb:   0x19
    DEFB 0xfe                         ;0xebec:   ('~') + 0x80
    DEFB 0x1                          ;0xebed:   0x1
    DEFB 0xc8                         ;0xebee:   ('H') + 0x80
    DEFB 0xe                          ;0xebef:   0xe
    DEFB 0x20                         ;0xebf0:   " "
    DEFB 0xcd                         ;0xebf1:   ('M') + 0x80
    DEFB 0x7a                         ;0xebf2:   "z"
    DEFB 0xfb                         ;0xebf3:   ('{') + 0x80
    DEFB 0xe                          ;0xebf4:   0xe
    DEFB 0x8                          ;0xebf5:   0x8
    DEFB 0xc3                         ;0xebf6:   ('C') + 0x80
    DEFB 0x7a                         ;0xebf7:   "z"
    DEFB 0xfb                         ;0xebf8:   ('{') + 0x80
    DEFB 0xe                          ;0xebf9:   0xe
    DEFB 0x23                         ;0xebfa:   "#"
    DEFB 0xcd                         ;0xebfb:   ('M') + 0x80
    DEFB 0xcd                         ;0xebfc:   ('M') + 0x80
    DEFB 0x13                         ;0xebfd:   0x13
    DEFB 0xcd                         ;0xebfe:   ('M') + 0x80
    DEFB 0x82                         ;0xebff:   0x82
    DEFB 0x14                         ;0xec00:   0x14
    DEFB 0x3a                         ;0xec01:   ":"
    DEFB 0xb7                         ;0xec02:   ('7') + 0x80
    DEFB 0xfb                         ;0xec03:   ('{') + 0x80
    DEFB 0x21                         ;0xec04:   "!"
    DEFB 0xbd                         ;0xec05:   ('=') + 0x80
    DEFB 0x19                         ;0xec06:   0x19
    DEFB 0xbe                         ;0xec07:   ('>') + 0x80
    DEFB 0xd0                         ;0xec08:   ('P') + 0x80
    DEFB 0xe                          ;0xec09:   0xe
    DEFB 0x20                         ;0xec0a:   " "
    DEFB 0xcd                         ;0xec0b:   ('M') + 0x80
    DEFB 0xcd                         ;0xec0c:   ('M') + 0x80
    DEFB 0x13                         ;0xec0d:   0x13
    DEFB 0xc3                         ;0xec0e:   ('C') + 0x80
    DEFB 0x20                         ;0xec0f:   " "
    DEFB 0xf6                         ;0xec10:   ('v') + 0x80
    DEFB 0x47                         ;0xec11:   "G"
    DEFB 0x3a                         ;0xec12:   ":"
    DEFB 0xcf                         ;0xec13:   ('O') + 0x80
    DEFB 0xfb                         ;0xec14:   ('{') + 0x80
    DEFB 0x1f                         ;0xec15:   0x1f
    DEFB 0xd2                         ;0xec16:   ('R') + 0x80
    DEFB 0x8e                         ;0xec17:   0x8e
    DEFB 0x13                         ;0xec18:   0x13
    DEFB 0x3e                         ;0xec19:   ">"
    DEFB 0x3                          ;0xec1a:   0x3
    DEFB 0xbe                         ;0xec1b:   ('>') + 0x80
    DEFB 0xc8                         ;0xec1c:   ('H') + 0x80
    DEFB 0x78                         ;0xec1d:   "x"
    DEFB 0xfe                         ;0xec1e:   ('~') + 0x80
    DEFB 0x11                         ;0xec1f:   0x11
    DEFB 0xca                         ;0xec20:   ('J') + 0x80
    DEFB 0x9d                         ;0xec21:   0x9d
    DEFB 0x13                         ;0xec22:   0x13
    DEFB 0xfe                         ;0xec23:   ('~') + 0x80
    DEFB 0x10                         ;0xec24:   0x10
    DEFB 0xca                         ;0xec25:   ('J') + 0x80
    DEFB 0x9d                         ;0xec26:   0x9d
    DEFB 0x13                         ;0xec27:   0x13
    DEFB 0x77                         ;0xec28:   "w"
    DEFB 0x3e                         ;0xec29:   ">"
    DEFB 0x1                          ;0xec2a:   0x1
    DEFB 0xc9                         ;0xec2b:   ('I') + 0x80
    DEFB 0xaf                         ;0xec2c:   ('/') + 0x80
    DEFB 0x77                         ;0xec2d:   "w"
    DEFB 0xc9                         ;0xec2e:   ('I') + 0x80
    DEFB 0xcc                         ;0xec2f:   ('L') + 0x80
    DEFB 0xa9                         ;0xec30:   (')') + 0x80
    DEFB 0x13                         ;0xec31:   0x13
    DEFB 0xe                          ;0xec32:   0xe
    DEFB 0x7                          ;0xec33:   0x7
    DEFB 0xc4                         ;0xec34:   ('D') + 0x80
    DEFB 0x7a                         ;0xec35:   "z"
    DEFB 0xfb                         ;0xec36:   ('{') + 0x80
    DEFB 0xc9                         ;0xec37:   ('I') + 0x80
    DEFB 0x3a                         ;0xec38:   ":"
    DEFB 0xcf                         ;0xec39:   ('O') + 0x80
    DEFB 0xfb                         ;0xec3a:   ('{') + 0x80
    DEFB 0xe6                         ;0xec3b:   ('f') + 0x80
    DEFB 0x14                         ;0xec3c:   0x14
    DEFB 0xc2                         ;0xec3d:   ('B') + 0x80
    DEFB 0xbb                         ;0xec3e:   (';') + 0x80
    DEFB 0x13                         ;0xec3f:   0x13
    DEFB 0x21                         ;0xec40:   "!"
    DEFB 0xd4                         ;0xec41:   ('T') + 0x80
    DEFB 0xfb                         ;0xec42:   ('{') + 0x80
    DEFB 0x3e                         ;0xec43:   ">"
    DEFB 0x1                          ;0xec44:   0x1
    DEFB 0xae                         ;0xec45:   ('.') + 0x80
    DEFB 0xe6                         ;0xec46:   ('f') + 0x80
    DEFB 0x1                          ;0xec47:   0x1
    DEFB 0x77                         ;0xec48:   "w"
    DEFB 0xc9                         ;0xec49:   ('I') + 0x80
    DEFB 0xaf                         ;0xec4a:   ('/') + 0x80
    DEFB 0xc9                         ;0xec4b:   ('I') + 0x80
    DEFB 0x3a                         ;0xec4c:   ":"
    DEFB 0xdf                         ;0xec4d:   ('_') + 0x80
    DEFB 0xfb                         ;0xec4e:   ('{') + 0x80
    DEFB 0x3d                         ;0xec4f:   "="
    DEFB 0xca                         ;0xec50:   ('J') + 0x80
    DEFB 0x7a                         ;0xec51:   "z"
    DEFB 0xfb                         ;0xec52:   ('{') + 0x80
    DEFB 0x78                         ;0xec53:   "x"
    DEFB 0xe6                         ;0xec54:   ('f') + 0x80
    DEFB 0x10                         ;0xec55:   0x10
    DEFB 0xc2                         ;0xec56:   ('B') + 0x80
    DEFB 0x7a                         ;0xec57:   "z"
    DEFB 0xfb                         ;0xec58:   ('{') + 0x80
    DEFB 0xc3                         ;0xec59:   ('C') + 0x80
    DEFB 0x7a                         ;0xec5a:   "z"
    DEFB 0xfb                         ;0xec5b:   ('{') + 0x80
    DEFB 0x3a                         ;0xec5c:   ":"
    DEFB 0xbc                         ;0xec5d:   ('<') + 0x80
    DEFB 0x19                         ;0xec5e:   0x19
    DEFB 0xb7                         ;0xec5f:   ('7') + 0x80
    DEFB 0xc2                         ;0xec60:   ('B') + 0x80
    DEFB 0xf6                         ;0xec61:   ('v') + 0x80
    DEFB 0x13                         ;0xec62:   0x13
    DEFB 0x3a                         ;0xec63:   ":"
    DEFB 0xcf                         ;0xec64:   ('O') + 0x80
    DEFB 0xfb                         ;0xec65:   ('{') + 0x80
    DEFB 0xe6                         ;0xec66:   ('f') + 0x80
    DEFB 0x14                         ;0xec67:   0x14
    DEFB 0x47                         ;0xec68:   "G"
    DEFB 0xc5                         ;0xec69:   ('E') + 0x80
    DEFB 0x3a                         ;0xec6a:   ":"
    DEFB 0xdf                         ;0xec6b:   ('_') + 0x80
    DEFB 0xfb                         ;0xec6c:   ('{') + 0x80
    DEFB 0x3d                         ;0xec6d:   "="
    DEFB 0xc4                         ;0xec6e:   ('D') + 0x80
    DEFB 0x2f                         ;0xec6f:   "/"
    DEFB 0x13                         ;0xec70:   0x13
    DEFB 0xc1                         ;0xec71:   ('A') + 0x80
    DEFB 0xc5                         ;0xec72:   ('E') + 0x80
    DEFB 0xcd                         ;0xec73:   ('M') + 0x80
    DEFB 0xbd                         ;0xec74:   ('=') + 0x80
    DEFB 0x13                         ;0xec75:   0x13
    DEFB 0xc1                         ;0xec76:   ('A') + 0x80
    DEFB 0x78                         ;0xec77:   "x"
    DEFB 0xb7                         ;0xec78:   ('7') + 0x80
    DEFB 0xc2                         ;0xec79:   ('B') + 0x80
    DEFB 0xf6                         ;0xec7a:   ('v') + 0x80
    DEFB 0x13                         ;0xec7b:   0x13
    DEFB 0xc5                         ;0xec7c:   ('E') + 0x80
    DEFB 0x3a                         ;0xec7d:   ":"
    DEFB 0xd4                         ;0xec7e:   ('T') + 0x80
    DEFB 0xfb                         ;0xec7f:   ('{') + 0x80
    DEFB 0xb7                         ;0xec80:   ('7') + 0x80
    DEFB 0xc4                         ;0xec81:   ('D') + 0x80
    DEFB 0x80                         ;0xec82:   0x80
    DEFB 0xfb                         ;0xec83:   ('{') + 0x80
    DEFB 0xc1                         ;0xec84:   ('A') + 0x80
    DEFB 0x79                         ;0xec85:   "y"
    DEFB 0x21                         ;0xec86:   "!"
;--------------------------------------
C_EC87:                               ; XREF: 0xEC8F 
    OR A                              ;0xec87:   b7  "." 
    EI                                ;0xec88:   fb  "." 
    CP 0x7f                           ;0xec89:   fe 7f  ".." 
    RET z                             ;0xec8b:   c8  "." 
    INC (HL)                          ;0xec8c:   34  "4" 
    CP 0x20                           ;0xec8d:   fe 20  ". " 
    JR nz, C_EC87                     ;0xec8f:   20 f6  " ." 
    OR A                              ;0xec91:   b7  "." 
    JP nz, 0x139a                     ;0xec92:   c2 9a 13  "..." 
    CALL C_FB6E                       ;0xec95:   cd 6e fb  ".n." 
    AND 1                             ;0xec98:   e6 01  ".." 
    RET                               ;0xec9a:   c9  "." 
    LD HL,D_FBD5                      ;0xec9b:   21 d5 fb  "!.."  
    LD (HL),0x40                      ;0xec9e:   36 40  "6@"  
    EX (SP),HL                        ;0xeca0:   e3  "." 
    JP (HL)                           ;0xeca1:   e9  "." 
    LD B,A                            ;0xeca2:   47  "G" 
    LD A,(D_FBCF)                     ;0xeca3:   3a cf fb  ":.."  
    AND 2                             ;0xeca6:   e6 02  ".." 
    LD A,B                            ;0xeca8:   78  "x" 
    RET                               ;0xeca9:   c9  "." 
    CALL 0x1313                       ;0xecaa:   cd 13 13  "..." 
    JP nz, 0x12ff                     ;0xecad:   c2 ff 12  "..." 
    LD A,(D_F620)                     ;0xecb0:   3a 20 f6  ": ."  
    OR A                              ;0xecb3:   b7  "." 
    JP nz, 0x1350                     ;0xecb4:   c2 50 13  ".P." 
    LD A,(D_FBCC)                     ;0xecb7:   3a cc fb  ":.."  
    INC A                             ;0xecba:   3c  "<" 
    JP z, 0x12ff                      ;0xecbb:   ca ff 12  "..." 
    CALL 0x1313                       ;0xecbe:   cd 13 13  "..." 
    RET nz                            ;0xecc1:   c0  "." 
    LD A,(D_F620)                     ;0xecc2:   3a 20 f6  ": ."  
    CP 0x13                           ;0xecc5:   fe 13  ".." 
    JP z, 0x1350                      ;0xecc7:   ca 50 13  ".P." 
    CALL 0x130c                       ;0xecca:   cd 0c 13  "..." 
    CALL C_FB6E                       ;0xeccd:   cd 6e fb  ".n." 
    POP HL                            ;0xecd0:   e1  "." 
    LD (HL),1                         ;0xecd1:   36 01  "6."  
    NOP                               ;0xecd3:   00  "." 
    AND 1                             ;0xecd4:   e6 01  ".." 
    RET z                             ;0xecd6:   c8  "." 
    CALL 0x130c                       ;0xecd7:   cd 0c 13  "..." 
    CALL 0xfb74                       ;0xecda:   cd 74 fb  ".t." 
    POP HL                            ;0xecdd:   e1  "." 
    LD (HL),1                         ;0xecde:   36 01  "6."  
    NOP                               ;0xece0:   00  "." 
    CP 0x13                           ;0xece1:   fe 13  ".." 
    JP nz, 0x137f                     ;0xece3:   c2 7f 13  "..." 
    LD HL,D_F620                      ;0xece6:   21 20 f6  "! ."  
    CP (HL)                           ;0xece9:   be  "." 
    JP nz, 0x135e                     ;0xecea:   c2 5e 13  ".^." 
    LD (HL),1                         ;0xeced:   36 01  "6."  
    NOP                               ;0xecef:   00  "." 
    CALL 0x130c                       ;0xecf0:   cd 0c 13  "..." 
    CALL 0xfb74                       ;0xecf3:   cd 74 fb  ".t." 
    POP HL                            ;0xecf6:   e1  "." 
    LD (HL),1                         ;0xecf7:   36 01  "6."  
    NOP                               ;0xecf9:   00  "." 
    CP 3                              ;0xecfa:   fe 03  ".." 
    JP nz, 0x1375                     ;0xecfc:   c2 75 13  ".u." 
    LD A,(D_FBCF)                     ;0xecff:   3a cf fb  ":.."  
    AND 8                             ;0xed02:   e6 08  ".." 
    JP z, 0x1229                      ;0xed04:   ca 29 12  ".)." 
    XOR A                             ;0xed07:   af  "." 
    SUB 0x11                          ;0xed08:   d6 11  ".." 
    RET z                             ;0xed0a:   c8  "." 
    INC A                             ;0xed0b:   3c  "<" 
    CALL 0x13a0                       ;0xed0c:   cd a0 13  "..." 
    JP 0x135e                         ;0xed0f:   c3 5e 13  ".^." 
    LD HL,D_FBD8                      ;0xed12:   21 d8 fb  "!.."  
    LD DE,0x180                       ;0xed15:   11 80 01  "..."  
    NOP                               ;0xed18:   00  "." 
    ADD HL,DE                         ;0xed19:   19  "." 
    JP 0x1293                         ;0xed1a:   c3 93 12  "..." 
    LD HL,(D_FBD8)                    ;0xed1d:   2a d8 fb  "*.."  
    LD (0x1272),HL                    ;0xed20:   22 72 12  ""r."  
    RET                               ;0xed23:   c9  "." 
    LD HL,(0x1272)                    ;0xed24:   2a 72 12  "*r."  
    LD (D_FBD8),HL                    ;0xed27:   22 d8 fb  "".."  
    JP 0x21bf                         ;0xed2a:   c3 bf 21  "..!" 
    POP BC                            ;0xed2d:   c1  "." 
    INC A                             ;0xed2e:   3c  "<" 
    RET z                             ;0xed2f:   c8  "." 
    LD A,(D_FBE6)                     ;0xed30:   3a e6 fb  ":.."  
    SUB B                             ;0xed33:   90  "." 
    LD H,A                            ;0xed34:   67  "g" 
    RET                               ;0xed35:   c9  "." 
    PUSH HL                           ;0xed36:   e5  "." 
    LD A,(D_FBDF)                     ;0xed37:   3a df fb  ":.."  
    CP 0x21                           ;0xed3a:   fe 21  ".!" 
    CALL nc, 0x1d19                   ;0xed3c:   d4 19 1d  "..." 
    CALL 0x1290                       ;0xed3f:   cd 90 12  "..." 
    POP DE                            ;0xed42:   d1  "." 
    LD HL,(0x1266)                    ;0xed43:   2a 66 12  "*f."  
    LD SP,HL                          ;0xed46:   f9  "." 
    EX DE,HL                          ;0xed47:   eb  "." 
    LD A,L                            ;0xed48:   7d  "}" 
    LD B,H                            ;0xed49:   44  "D" 
    RET                               ;0xed4a:   c9  "." 
    LD HL,D_F620                      ;0xed4b:   21 20 f6  "! ."  
    LD A,(HL)                         ;0xed4e:   7e  "~" 
    LD (HL),1                         ;0xed4f:   36 01  "6."  
    NOP                               ;0xed51:   00  "." 
    OR A                              ;0xed52:   b7  "." 
    RET nz                            ;0xed53:   c0  "." 
    JP 0xfb74                         ;0xed54:   c3 74 fb  ".t." 
    LD HL,0x1972                      ;0xed57:   21 72 19  "!r."  
    PUSH HL                           ;0xed5a:   e5  "." 
    CALL 0x12b7                       ;0xed5b:   cd b7 12  "..." 
    CALL 0x12f0                       ;0xed5e:   cd f0 12  "..." 
    JP c, 0x12d6                      ;0xed61:   da d6 12  "..." 
    PUSH AF                           ;0xed64:   f5  "." 
    LD C,A                            ;0xed65:   4f  "O" 
    CALL 0x1428                       ;0xed66:   cd 28 14  ".(." 
    POP AF                            ;0xed69:   f1  "." 
    RET                               ;0xed6a:   c9  "." 
    CALL 0x1313                       ;0xed6b:   cd 13 13  "..." 
    RET nz                            ;0xed6e:   c0  "." 
    CP 0x13                           ;0xed6f:   fe 13  ".." 
    JP nz, 0x12e5                     ;0xed71:   c2 e5 12  "..." 
    CALL 0x135e                       ;0xed74:   cd 5e 13  ".^." 
    JP 0x12c6                         ;0xed77:   c3 c6 12  "..." 
    CP 0x11                           ;0xed7a:   fe 11  ".." 
    JP z, 0x12c6                      ;0xed7c:   ca c6 12  "..." 
    CP 0x10                           ;0xed7f:   fe 10  ".." 
    JP z, 0x12c6                      ;0xed81:   ca c6 12  "..." 
    RET                               ;0xed84:   c9  "." 
    CP 13                             ;0xed85:   fe 0d  ".." 
    RET z                             ;0xed87:   c8  "." 
    CP 10                             ;0xed88:   fe 0a  ".." 
    RET z                             ;0xed8a:   c8  "." 
    CP 9                              ;0xed8b:   fe 09  ".." 
    RET z                             ;0xed8d:   c8  "." 
    CP 8                              ;0xed8e:   fe 08  ".." 
    RET z                             ;0xed90:   c8  "." 
    CP 0x20                           ;0xed91:   fe 20  ". " 
    RET                               ;0xed93:   c9  "." 
    DEFB ":Function =     File = ", 0x0d  ;0xed94:   0xed94 to 0xedae
    DEFB 0x0                          ;0xedac:   
    DEFB 0x21                         ;0xedad:   
    DEFB 0xfd                         ;0xedae:   
    DEFB 0xff                         ;0xedaf:   
    DEFB 0xc3                         ;0xedb0:   
    DEFB 0x2c                         ;0xedb1:   
    DEFB 0x12                         ;0xedb2:   0x12
    DEFB 0xcd                         ;0xedb3:   
    DEFB "$<",34,"", 0x3c             ;0xedb4:   0xedb4 to 0xedb5
    NOP                               ;0xedbd:   00  "." 
    LD HL,2                           ;0xedbe:   21 02 00  "!.."  
;--------------------------------------
C_EDC1:                               ; XREF: 0xED9F 
    ADD HL,SP                         ;0xedc1:   39  "9" 
    LD (0x1266),HL                    ;0xedc2:   22 66 12  ""f."  
    LD HL,0x12a2                      ;0xedc5:   21 a2 12  "!.."  
    PUSH HL                           ;0xedc8:   e5  "." 
    CALL 0x1d09                       ;0xedc9:   cd 09 1d  "..." 
    CALL 0x1289                       ;0xedcc:   cd 89 12  "..." 
    LD A,(D_FBE6)                     ;0xedcf:   3a e6 fb  ":.."  
    PUSH AF                           ;0xedd2:   f5  "." 
    LD (0x3799),A                     ;0xedd3:   32 99 37  "2.7"  
    CALL 0x1274                       ;0xedd6:   cd 74 12  ".t." 
    OR A                              ;0xedd9:   b7  "." 
    JP nz, 0x1299                     ;0xedda:   c2 99 12  "..." 
    LD A,(D_FBDF)                     ;0xeddd:   3a df fb  ":.."  
    CP 0x21                           ;0xede0:   fe 21  ".!" 
    CALL nc, 0x1cfe                   ;0xede2:   d4 fe 1c  "..." 
    CALL 0x127f                       ;0xede5:   cd 7f 12  "..." 
    POP AF                            ;0xede8:   f1  "." 
    DEC A                             ;0xede9:   3d  "=" 
    JP nz, 0x1248                     ;0xedea:   c2 48 12  ".H." 
    LD H,A                            ;0xeded:   67  "g" 
    LD L,A                            ;0xedee:   6f  "o" 
    RET                               ;0xedef:   c9  "." 
    LD (BC),A                         ;0xedf0:   02  "." 
    NOP                               ;0xedf1:   00  "." 
    RST 0                             ;0xedf2:   c7  "." 
    RST 0                             ;0xedf3:   c7  "." 
    RST 0                             ;0xedf4:   c7  "." 
    RST 0                             ;0xedf5:   c7  "." 
    RST 0                             ;0xedf6:   c7  "." 
    RST 0                             ;0xedf7:   c7  "." 
    RST 0                             ;0xedf8:   c7  "." 
    RST 0                             ;0xedf9:   c7  "." 
    RST 0                             ;0xedfa:   c7  "." 
    RST 0                             ;0xedfb:   c7  "." 
    LD (BC),A                         ;0xedfc:   02  "." 
    NOP                               ;0xedfd:   00  "." 
    LD A,(D_FBDF)                     ;0xedfe:   3a df fb  ":.."  
    LD C,A                            ;0xee01:   4f  "O" 
    LD HL,(D_FBDB)                    ;0xee02:   2a db fb  "*.."  
    EX DE,HL                          ;0xee05:   eb  "." 
    JP 0xf3b                          ;0xee06:   c3 3b 0f  ".;." 
    LD HL,(D_CDE5)                    ;0xee09:   2a e5 cd  "*.."  
    ADD A,D                           ;0xee0c:   82  "." 
    INC D                             ;0xee0d:   14  "." 
    LD A,(0x37aa)                     ;0xee0e:   3a aa 37  ":.7"  
    ADD A,0x41                        ;0xee11:   c6 41  ".A" 
    LD (0x1c3d),A                     ;0xee13:   32 3d 1c  "2=."  
    LD BC,0x1c2f                      ;0xee16:   01 2f 1c  "./."  
    CALL 0x11ee                       ;0xee19:   cd ee 11  "..." 
    POP BC                            ;0xee1c:   c1  "." 
    LD A,(D_FBF3)                     ;0xee1d:   3a f3 fb  ":.."  
    RLA                               ;0xee20:   17  "." 
    JP nc, 0x11ee                     ;0xee21:   d2 ee 11  "..." 
    CALL 0x11ee                       ;0xee24:   cd ee 11  "..." 
    LD A,(D_FBDF)                     ;0xee27:   3a df fb  ":.."  
    LD B,0x30                         ;0xee2a:   06 30  ".0"  
    LD HL,0x120b                      ;0xee2c:   21 0b 12  "!.."  
    CP 0x64                           ;0xee2f:   fe 64  ".d" 
    JP c, 0x11af                      ;0xee31:   da af 11  "..." 
    LD (HL),0x31                      ;0xee34:   36 31  "61"  
    INC HL                            ;0xee36:   23  "#" 
    SUB 0x64                          ;0xee37:   d6 64  ".d" 
    SUB 10                            ;0xee39:   d6 0a  ".." 
    JP c, 0x11b8                      ;0xee3b:   da b8 11  "..." 
    INC B                             ;0xee3e:   04  "." 
    JP 0x11af                         ;0xee3f:   c3 af 11  "..." 
    LD (HL),B                         ;0xee42:   70  "p" 
    INC HL                            ;0xee43:   23  "#" 
    ADD A,0x3a                        ;0xee44:   c6 3a  ".:" 
    LD (HL),A                         ;0xee46:   77  "w" 
    INC HL                            ;0xee47:   23  "#" 
    LD (HL),0x20                      ;0xee48:   36 20  "6 "  
    LD HL,0x120e                      ;0xee4a:   21 0e 12  "!.."  
    LD (HL),1                         ;0xee4d:   36 01  "6."  
    NOP                               ;0xee4f:   00  "." 
    LD A,(D_FBDD)                     ;0xee50:   3a dd fb  ":.."  
    OR A                              ;0xee53:   b7  "." 
    JP z, 0x11e5                      ;0xee54:   ca e5 11  "..." 
    LD (HL),0x20                      ;0xee57:   36 20  "6 "  
    PUSH DE                           ;0xee59:   d5  "." 
    LD HL,(D_FBDB)                    ;0xee5a:   2a db fb  "*.."  
    INC HL                            ;0xee5d:   23  "#" 
    EX DE,HL                          ;0xee5e:   eb  "." 
    LD HL,0x1216                      ;0xee5f:   21 16 12  "!.."  
    LD C,8                            ;0xee62:   0e 08  ".."  
    CALL 0x1d29                       ;0xee64:   cd 29 1d  ".)." 
    LD (HL),0x2e                      ;0xee67:   36 2e  "6."  
    INC HL                            ;0xee69:   23  "#" 
    LD C,3                            ;0xee6a:   0e 03  ".."  
    CALL 0x1d29                       ;0xee6c:   cd 29 1d  ".)." 
    POP DE                            ;0xee6f:   d1  "." 
    CALL 0x1482                       ;0xee70:   cd 82 14  "..." 
    LD BC,0x11fb                      ;0xee73:   01 fb 11  "..."  
    JP 0x11ee                         ;0xee76:   c3 ee 11  "..." 
    LD A,(BC)                         ;0xee79:   0a  "." 
    OR A                              ;0xee7a:   b7  "." 
    RET z                             ;0xee7b:   c8  "." 
    PUSH BC                           ;0xee7c:   c5  "." 
    LD C,A                            ;0xee7d:   4f  "O" 
    CALL 0x1428                       ;0xee7e:   cd 28 14  ".(." 
    POP BC                            ;0xee81:   c1  "." 
    INC BC                            ;0xee82:   03  "." 
    JP 0x11ee                         ;0xee83:   c3 ee 11  "..." 
    DEFB "BDOS "                      ;0xee86:   0xee86 to 0xee8b
    DEFB 0x1                          ;0xee8b:   0x1
    DEFB 0x0                          ;0xee8c:   
;--------------------------------------
C_EE8D:                               ; XREF: 0xEE8A 
    ADD HL,BC                         ;0xee8d:   09  "." 
    LD BC,0x701                       ;0xee8e:   01 01 07  "..."  
    CALL 0x1119                       ;0xee91:   cd 19 11  "..." 
    JP nz, 0x1105                     ;0xee94:   c2 05 11  "..." 
    LD A,7                            ;0xee97:   3e 07  ">."  
    SUB B                             ;0xee99:   90  "." 
    POP HL                            ;0xee9a:   e1  "." 
    PUSH HL                           ;0xee9b:   e5  "." 
    LD BC,0x11a                       ;0xee9c:   01 1a 01  "..."  
    NOP                               ;0xee9f:   00  "." 
    ADD HL,BC                         ;0xeea0:   09  "." 
    LD (HL),A                         ;0xeea1:   77  "w" 
    LD A,(DE)                         ;0xeea2:   1a  "." 
    JP 0x10e0                         ;0xeea3:   c3 e0 10  "..." 
    CALL 0x114d                       ;0xeea6:   cd 4d 11  ".M." 
    RET z                             ;0xeea9:   c8  "." 
    CP 0x20                           ;0xeeaa:   fe 20  ". " 
    INC DE                            ;0xeeac:   13  "." 
    JP c, 0x10f5                      ;0xeead:   da f5 10  "..." 
    INC B                             ;0xeeb0:   04  "." 
    DEC B                             ;0xeeb1:   05  "." 
    JP m, 0x10f5                      ;0xeeb2:   fa f5 10  "..." 
    INC C                             ;0xeeb5:   0c  "." 
    DEC C                             ;0xeeb6:   0d  "." 
    JP nz, 0x1132                     ;0xeeb7:   c2 32 11  ".2." 
    CP 0x2a                           ;0xeeba:   fe 2a  ".*" 
    JP z, 0x1137                      ;0xeebc:   ca 37 11  ".7." 
    LD (HL),A                         ;0xeebf:   77  "w" 
    INC HL                            ;0xeec0:   23  "#" 
    DEC B                             ;0xeec1:   05  "." 
    OR A                              ;0xeec2:   b7  "." 
    RET                               ;0xeec3:   c9  "." 
    LD (HL),0x3f                      ;0xeec4:   36 3f  "6?"  
    INC HL                            ;0xeec6:   23  "#" 
    DEC B                             ;0xeec7:   05  "." 
    JP p, 0x1137                      ;0xeec8:   f2 37 11  ".7." 
    RET                               ;0xeecb:   c9  "." 
    DEC C                             ;0xeecc:   0d  "." 
    ADD HL,BC                         ;0xeecd:   09  "." 
    JR nz, $+48                       ;0xeece:   20 2e  " ." 
    INC L                             ;0xeed0:   2c  "," 
    LD A,(0x5b3b)                     ;0xeed1:   3a 3b 5b  ":;["  
    LD E,L                            ;0xeed4:   5d  "]" 
    DEC A                             ;0xeed5:   3d  "=" 
    INC A                             ;0xeed6:   3c  "<" 
    LD A,0x7c                         ;0xeed7:   3e 7c  ">|"  
    LD BC,0x1a00                      ;0xeed9:   01 00 1a  "..."  
    PUSH HL                           ;0xeedc:   e5  "." 
    LD HL,0x113f                      ;0xeedd:   21 3f 11  "!?."  
    CP (HL)                           ;0xeee0:   be  "." 
    JP z, 0x115d                      ;0xeee1:   ca 5d 11  ".]." 
    INC (HL)                          ;0xeee4:   34  "4" 
    DEC (HL)                          ;0xeee5:   35  "5" 
    INC HL                            ;0xeee6:   23  "#" 
    JP nz, 0x1152                     ;0xeee7:   c2 52 11  ".R." 
    OR A                              ;0xeeea:   b7  "." 
    POP HL                            ;0xeeeb:   e1  "." 
    RET z                             ;0xeeec:   c8  "." 
;--------------------------------------
C_EEED:                               ; XREF: 0xFE0D 
    CP 0x61                           ;0xeeed:   fe 61  ".a" 
    RET c                             ;0xeeef:   d8  "." 
    CP 0x7b                           ;0xeef0:   fe 7b  ".{" 
    JP nc, 0x1169                     ;0xeef2:   d2 69 11  ".i." 
    AND 0x5f                          ;0xeef5:   e6 5f  "._" 
    AND 0x7f                          ;0xeef7:   e6 7f  ".." 
    RET                               ;0xeef9:   c9  "." 
    LD (HL),B                         ;0xeefa:   70  "p" 
    INC HL                            ;0xeefb:   23  "#" 
    DEC C                             ;0xeefc:   0d  "." 
    JP nz, 0x116c                     ;0xeefd:   c2 6c 11  ".l." 
    RET                               ;0xef00:   c9  "." 
    LD A,(DE)                         ;0xef01:   1a  "." 
    INC DE                            ;0xef02:   13  "." 
    CP 0x20                           ;0xef03:   fe 20  ". " 
    JP z, 0x1173                      ;0xef05:   ca 73 11  ".s." 
    CP 9                              ;0xef08:   fe 09  ".." 
    JP z, 0x1173                      ;0xef0a:   ca 73 11  ".s." 
    RET                               ;0xef0d:   c9  "." 
    LD BC,0x2008                      ;0xef0e:   01 08 20  ".. "  
    CALL 0x116c                       ;0xef11:   cd 6c 11  ".l." 
    LD BC,0x10c                       ;0xef14:   01 0c 01  "..."  
    NOP                               ;0xef17:   00  "." 
    CALL 0x116c                       ;0xef18:   cd 6c 11  ".l." 
    CALL 0x1173                       ;0xef1b:   cd 73 11  ".s." 
    LD A,(DE)                         ;0xef1e:   1a  "." 
    CP 0x3a                           ;0xef1f:   fe 3a  ".:" 
    DEC DE                            ;0xef21:   1b  "." 
    POP HL                            ;0xef22:   e1  "." 
    PUSH HL                           ;0xef23:   e5  "." 
    JP nz, 0x10ac                     ;0xef24:   c2 ac 10  "..." 
    CALL 0x114d                       ;0xef27:   cd 4d 11  ".M." 
    JP z, 0x10e0                      ;0xef2a:   ca e0 10  "..." 
    SUB 0x41                          ;0xef2d:   d6 41  ".A" 
    JP c, 0x10f6                      ;0xef2f:   da f6 10  "..." 
    CP 0x10                           ;0xef32:   fe 10  ".." 
    JP nc, 0x10f6                     ;0xef34:   d2 f6 10  "..." 
    INC DE                            ;0xef37:   13  "." 
    INC DE                            ;0xef38:   13  "." 
    INC A                             ;0xef39:   3c  "<" 
    LD (HL),A                         ;0xef3a:   77  "w" 
    INC HL                            ;0xef3b:   23  "#" 
    CALL 0x114d                       ;0xef3c:   cd 4d 11  ".M." 
    JP z, 0x10e0                      ;0xef3f:   ca e0 10  "..." 
    LD BC,1                           ;0xef42:   01 01 00  "..."  
    RLCA                              ;0xef45:   07  "." 
    LD A,(DE)                         ;0xef46:   1a  "." 
    CP 0x2e                           ;0xef47:   fe 2e  ".." 
    JP z, 0x10ca                      ;0xef49:   ca ca 10  "..." 
    CP 0x3b                           ;0xef4c:   fe 3b  ".;" 
    JP z, 0x10fb                      ;0xef4e:   ca fb 10  "..." 
    CALL 0x1119                       ;0xef51:   cd 19 11  "..." 
    JP nz, 0x10b6                     ;0xef54:   c2 b6 10  "..." 
    JP 0x10e0                         ;0xef57:   c3 e0 10  "..." 
    INC DE                            ;0xef5a:   13  "." 
    POP HL                            ;0xef5b:   e1  "." 
    PUSH HL                           ;0xef5c:   e5  "." 
    LD BC,0x109                       ;0xef5d:   01 09 01  "..."  
    NOP                               ;0xef60:   00  "." 
    ADD HL,BC                         ;0xef61:   09  "." 
    LD BC,1                           ;0xef62:   01 01 00  "..."  
    LD (BC),A                         ;0xef65:   02  "." 
    LD A,(DE)                         ;0xef66:   1a  "." 
    CP 0x3b                           ;0xef67:   fe 3b  ".;" 
    JP z, 0x10fb                      ;0xef69:   ca fb 10  "..." 
    CALL 0x1119                       ;0xef6c:   cd 19 11  "..." 
    JP nz, 0x10d4                     ;0xef6f:   c2 d4 10  "..." 
    POP BC                            ;0xef72:   c1  "." 
    PUSH DE                           ;0xef73:   d5  "." 
    CALL 0x1173                       ;0xef74:   cd 73 11  ".s." 
    DEC DE                            ;0xef77:   1b  "." 
    CALL 0x114d                       ;0xef78:   cd 4d 11  ".M." 
    POP HL                            ;0xef7b:   e1  "." 
    RET nz                            ;0xef7c:   c0  "." 
    LD HL,2                           ;0xef7d:   21 02 00  "!.."  
    OR A                              ;0xef80:   b7  "." 
    RET z                             ;0xef81:   c8  "." 
    CP 13                             ;0xef82:   fe 0d  ".." 
    RET z                             ;0xef84:   c8  "." 
    EX DE,HL                          ;0xef85:   eb  "." 
    RET                               ;0xef86:   c9  "." 
    POP BC                            ;0xef87:   c1  "." 
    POP BC                            ;0xef88:   c1  "." 
    LD HL,D_FFFF                      ;0xef89:   21 ff ff  "!.."  
    RET                               ;0xef8c:   c9  "." 
    INC DE                            ;0xef8d:   13  "." 
    POP HL                            ;0xef8e:   e1  "." 
    PUSH HL                           ;0xef8f:   e5  "." 
    LD BC,0x1110                      ;0xef90:   01 10 11  "..."  
    INC SP                            ;0xef93:   33  "3" 
    RLA                               ;0xef94:   17  "." 
    INC SP                            ;0xef95:   33  "3" 
    INC HL                            ;0xef96:   23  "#" 
    INC SP                            ;0xef97:   33  "3" 
    DEC L                             ;0xef98:   2d  "-" 
    INC SP                            ;0xef99:   33  "3" 
    LD B,C                            ;0xef9a:   41  "A" 
    INC SP                            ;0xef9b:   33  "3" 
    LD C,D                            ;0xef9c:   4a  "J" 
    INC SP                            ;0xef9d:   33  "3" 
    LD D,E                            ;0xef9e:   53  "S" 
    INC SP                            ;0xef9f:   33  "3" 
    LD B,B                            ;0xefa0:   40  "@" 
    DEC L                             ;0xefa1:   2d  "-" 
    LD E,C                            ;0xefa2:   59  "Y" 
    INC SP                            ;0xefa3:   33  "3" 
    LD (HL),L                         ;0xefa4:   75  "u" 
    ADD HL,DE                         ;0xefa5:   19  "." 
    LD (HL),L                         ;0xefa6:   75  "u" 
    ADD HL,DE                         ;0xefa7:   19  "." 
    LD C,D                            ;0xefa8:   4a  "J" 
    INC SP                            ;0xefa9:   33  "3" 
    RET nz                            ;0xefaa:   c0  "." 
    INC H                             ;0xefab:   24  "$" 
    LD (HL),L                         ;0xefac:   75  "u" 
    ADD HL,DE                         ;0xefad:   19  "." 
    LD (HL),L                         ;0xefae:   75  "u" 
    ADD HL,DE                         ;0xefaf:   19  "." 
    LD A,L                            ;0xefb0:   7d  "}" 
    INC SP                            ;0xefb1:   33  "3" 
    ADC A,E                           ;0xefb2:   8b  "." 
    INC SP                            ;0xefb3:   33  "3" 
    SUB B                             ;0xefb4:   90  "." 
    INC SP                            ;0xefb5:   33  "3" 
    CALL C_DF33                       ;0xefb6:   cd 33 df  ".3." 
    INC SP                            ;0xefb9:   33  "3" 
    LD HL,(0x5034)                    ;0xefba:   2a 34 50  "*4P"  
    INC (HL)                          ;0xefbd:   34  "4" 
    RET pe                            ;0xefbe:   e8  "." 
    INC SP                            ;0xefbf:   33  "3" 
    RET z                             ;0xefc0:   c8  "." 
    INC (HL)                          ;0xefc1:   34  "4" 
    AND (HL)                          ;0xefc2:   a6  "." 
    DEC (HL)                          ;0xefc3:   35  "5" 
    RRA                               ;0xefc4:   1f  "." 
    LD (HL),0x28                      ;0xefc5:   36 28  "6("  
    LD (HL),0x64                      ;0xefc7:   36 64  "6d"  
    LD (HL),0xf1                      ;0xefc9:   36 f1  "6."  
    LD (HL),0xfe                      ;0xefcb:   36 fe  "6."  
    LD (HL),0x13                      ;0xefcd:   36 13  "6."  
    SCF                               ;0xefcf:   37  "7" 
    LD E,0x37                         ;0xefd0:   1e 37  ".7"  
    DAA                               ;0xefd2:   27  "'" 
    SCF                               ;0xefd3:   37  "7" 
    LD A,E                            ;0xefd4:   7b  "{" 
    ADD HL,DE                         ;0xefd5:   19  "." 
    ADC A,C                           ;0xefd6:   89  "." 
    ADD HL,DE                         ;0xefd7:   19  "." 
    SUB L                             ;0xefd8:   95  "." 
    ADD HL,DE                         ;0xefd9:   19  "." 
    SUB L                             ;0xefda:   95  "." 
    ADD HL,DE                         ;0xefdb:   19  "." 
    LD B,C                            ;0xefdc:   41  "A" 
    INC E                             ;0xefdd:   1c  "." 
    LD H,A                            ;0xefde:   67  "g" 
    INC E                             ;0xefdf:   1c  "." 
    LD E,B                            ;0xefe0:   58  "X" 
    INC E                             ;0xefe1:   1c  "." 
    LD C,D                            ;0xefe2:   4a  "J" 
    INC E                             ;0xefe3:   1c  "." 
    INC B                             ;0xefe4:   04  "." 
    NOP                               ;0xefe5:   00  "." 
    HALT                              ;0xefe6:   76  "v" 
    INC E                             ;0xefe7:   1c  "." 
    ADD A,L                           ;0xefe8:   85  "." 
    INC E                             ;0xefe9:   1c  "." 
    SUB C                             ;0xefea:   91  "." 
    INC E                             ;0xefeb:   1c  "." 
    CP 0x98                           ;0xefec:   fe 98  ".." 
    RET nz                            ;0xefee:   c0  "." 
    LD HL,0x3329                      ;0xefef:   21 29 33  "!)3"  
    PUSH HL                           ;0xeff2:   e5  "." 
    LD HL,(D_FBDB)                    ;0xeff3:   2a db fb  "*.."  
;--------------------------------------
C_EFF6:                               ; XREF: 0xF071 
    LD E,(HL)                         ;0xeff6:   5e  "^" 
    INC HL                            ;0xeff7:   23  "#" 
    LD D,(HL)                         ;0xeff8:   56  "V" 
    PUSH DE                           ;0xeff9:   d5  "." 
    INC HL                            ;0xeffa:   23  "#" 
    LD E,(HL)                         ;0xeffb:   5e  "^" 
    INC HL                            ;0xeffc:   23  "#" 
    LD D,(HL)                         ;0xeffd:   56  "V" 
    POP HL                            ;0xeffe:   e1  "." 
    EX DE,HL                          ;0xefff:   eb  "." 
;--------------------------------------
C_F000:                               ; XREF: 0xF077 
    PUSH HL                           ;0xf000:   e5  "." 
    XOR A                             ;0xf001:   af  "." 
    LD (HL),A                         ;0xf002:   77  "w" 
    INC HL                            ;0xf003:   23  "#" 
    LD BC,0x200b                      ;0xf004:   01 0b 20  ".. "  
    CALL 0x116c                       ;0xf007:   cd 6c 11  ".l." 
    LD BC,0x104                       ;0xf00a:   01 04 01  "..."  
    NOP                               ;0xf00d:   00  "." 
    CALL 0x116c                       ;0xf00e:   cd 6c 11  ".l." 
    LD HL,0x104a                      ;0xf011:   21 4a 10  "!J."  
    ADD HL,BC                         ;0xf014:   09  "." 
    ADD HL,BC                         ;0xf015:   09  "." 
    LD E,(HL)                         ;0xf016:   5e  "^" 
;--------------------------------------
C_F017:                               ; XREF: 0xF075 
    INC HL                            ;0xf017:   23  "#" 
    LD D,(HL)                         ;0xf018:   56  "V" 
    EX DE,HL                          ;0xf019:   eb  "." 
    CALL 0x1180                       ;0xf01a:   cd 80 11  "..." 
    POP BC                            ;0xf01d:   c1  "." 
    LD A,(D_FBE7)                     ;0xf01e:   3a e7 fb  ":.."  
    OR A                              ;0xf021:   b7  "." 
    RET nz                            ;0xf022:   c0  "." 
    JP 0x1223                         ;0xf023:   c3 23 12  ".#." 
    INC D                             ;0xf026:   14  "." 
    DEC D                             ;0xf027:   15  "." 
    LD HL,0x2822                      ;0xf028:   21 22 28  "!"("  
    LD BC,0x4300                      ;0xf02b:   01 00 43  "..C"  
    DEFB "OPYRIGHT (C) 1982, DIGITAL RESEARCH 151282/", 0x50  ;0xf02e:   0xf02e to 0xf02f
    DEFB 0xc2                         ;0xf05a:   
    DEFB 0x12                         ;0xf05b:   0x12
    DEFB 0x28                         ;0xf05c:   
    DEFB 0x14                         ;0xf05d:   0x14
    DEFB 0x1                          ;0xf05e:   0x1
    DEFB 0x19                         ;0xf05f:   0x19
;--------------------------------------
C_F060:                               ; XREF: 0xF036 
    LD (DE),A                         ;0xf060:   12  "." 
    CALL m, 0xfb80                    ;0xf061:   fc 80 fb  "..." 
    RLCA                              ;0xf064:   07  "." 
    ADD HL,DE                         ;0xf065:   19  "." 
    DEC HL                            ;0xf066:   2b  "+" 
    ADD HL,DE                         ;0xf067:   19  "." 
    LD SP,0x3719                      ;0xf068:   31 19 37  "1.7"  
    ADD HL,DE                         ;0xf06b:   19  "." 
    RET z                             ;0xf06c:   c8  "." 
;--------------------------------------
C_F06D:                               ; XREF: 0xF03A 
    DEC D                             ;0xf06d:   15  "." 
    DEC A                             ;0xf06e:   3d  "=" 
    ADD HL,DE                         ;0xf06f:   19  "." 
    LD A,L                            ;0xf070:   7d  "}" 
;--------------------------------------
C_F071:                               ; XREF: 0xF03D 
    JR nc, C_EFF6                     ;0xf071:   30 83  "0." 
    JR nc, $-104                      ;0xf073:   30 96  "0." 
    JR nc, C_F017                     ;0xf075:   30 a0  "0." 
    JR nc, C_F000                     ;0xf077:   30 87  "0." 
    LD SP,0x319b                      ;0xf079:   31 9b 31  "1.1"  
    CALL pe, C_F531                   ;0xf07c:   ec 31 f5  ".1." 
    LD SP,0x31fb                      ;0xf07f:   31 fb 31  "1.1"  
    INC B                             ;0xf082:   04  "." 
    LD (0x320d),A                     ;0xf083:   32 0d 32  "2.2"  
;--------------------------------------
C_F086:                               ; XREF: 0xF040 
    RST 0x28                          ;0xf086:   ef  "." 
    LD (0x32f5),A                     ;0xf087:   32 f5 32  "2.2"  
    EI                                ;0xf08a:   fb  "." 
    LD (0x3301),A                     ;0xf08b:   32 01 33  "2.3"  
    EX AF,AF'                         ;0xf08e:   08  "." 
    INC SP                            ;0xf08f:   33  "3" 
    OUT (0x0020),A                    ;0xf090:   d3 20  ". " 
    LD (HL),0x35                      ;0xf092:   36 35  "65"  
    INC (HL)                          ;0xf094:   34  "4" 
    INC SP                            ;0xf095:   33  "3" 
    LD (D_EB31),A                     ;0xf096:   32 31 eb  "21."  
    LD (D_FBDB),HL                    ;0xf099:   22 db fb  "".."  
;--------------------------------------
C_F09C:                               ; XREF: 0xF048 
    EX DE,HL                          ;0xf09c:   eb  "." 
    LD A,C                            ;0xf09d:   79  "y" 
    LD (D_FBDF),A                     ;0xf09e:   32 df fb  "2.."  
    CP 14                             ;0xf0a1:   fe 0e  ".." 
    JP c, 0xf3b                       ;0xf0a3:   da 3b 0f  ".;." 
    LD HL,2                           ;0xf0a6:   21 02 00  "!.."  
    LD (0x3798),HL                    ;0xf0a9:   22 98 37  "".7"  
    LD A,(D_FBDA)                     ;0xf0ac:   3a da fb  ":.."  
    LD (0x37a4),A                     ;0xf0af:   32 a4 37  "2.7"  
    DEC A                             ;0xf0b2:   3d  "=" 
    LD (0x37bc),A                     ;0xf0b3:   32 bc 37  "2.7"  
    LD A,(D_FBE6)                     ;0xf0b6:   3a e6 fb  ":.."  
    DEC A                             ;0xf0b9:   3d  "=" 
    JP z, 0xf3b                       ;0xf0ba:   ca 3b 0f  ".;." 
    LD HL,0xf95                       ;0xf0bd:   21 95 0f  "!.."  
    LD A,(HL)                         ;0xf0c0:   7e  "~" 
    OR A                              ;0xf0c1:   b7  "." 
    JP z, 0xf3b                       ;0xf0c2:   ca 3b 0f  ".;." 
    CP C                              ;0xf0c5:   b9  "." 
    JP z, 0x1234                      ;0xf0c6:   ca 34 12  ".4." 
    INC HL                            ;0xf0c9:   23  "#" 
    JP 0xf2e                          ;0xf0ca:   c3 2e 0f  "..." 
    LD A,E                            ;0xf0cd:   7b  "{" 
    LD (0x379e),A                     ;0xf0ce:   32 9e 37  "2.7"  
    LD HL,2                           ;0xf0d1:   21 02 00  "!.."  
    LD (0x1c9f),HL                    ;0xf0d4:   22 9f 1c  "".."  
    LD (D_FBDD),HL                    ;0xf0d7:   22 dd fb  "".."  
    ADD HL,SP                         ;0xf0da:   39  "9" 
    LD (0x1232),HL                    ;0xf0db:   22 32 12  ""2."  
    LD HL,0x373b                      ;0xf0de:   21 3b 37  "!;7"  
    PUSH HL                           ;0xf0e1:   e5  "." 
    LD A,C                            ;0xf0e2:   79  "y" 
    CP 0x33                           ;0xf0e3:   fe 33  ".3" 
    JP nc, 0xf5d                      ;0xf0e5:   d2 5d 0f  ".]." 
    LD C,E                            ;0xf0e8:   4b  "K" 
    LD HL,0xfc6                       ;0xf0e9:   21 c6 0f  "!.."  
    JP 0xf6f                          ;0xf0ec:   c3 6f 0f  ".o." 
    CP 0x80                           ;0xf0ef:   fe 80  ".." 
    JP nc, 0x105c                     ;0xf0f1:   d2 5c 10  ".\." 
    SUB 0x62                          ;0xf0f4:   d6 62  ".b" 
    JP c, 0x24c0                      ;0xf0f6:   da c0 24  "..$" 
    CP 15                             ;0xf0f9:   fe 0f  ".." 
    JP nc, 0x24c0                     ;0xf0fb:   d2 c0 24  "..$" 
    LD HL,0x102c                      ;0xf0fe:   21 2c 10  "!,."  
    LD E,A                            ;0xf101:   5f  "_" 
    LD D,1                            ;0xf102:   16 01  ".."  
    NOP                               ;0xf104:   00  "." 
    ADD HL,DE                         ;0xf105:   19  "." 
    ADD HL,DE                         ;0xf106:   19  "." 
    LD E,(HL)                         ;0xf107:   5e  "^" 
    INC HL                            ;0xf108:   23  "#" 
    LD D,(HL)                         ;0xf109:   56  "V" 
    LD HL,(D_FBDB)                    ;0xf10a:   2a db fb  "*.."  
    EX DE,HL                          ;0xf10d:   eb  "." 
    JP (HL)                           ;0xf10e:   e9  "." 
    LD B,1                            ;0xf10f:   06 01  ".."  
    NOP                               ;0xf111:   00  "." 
    PUSH BC                           ;0xf112:   c5  "." 
    DEC C                             ;0xf113:   0d  "." 
    JP 0x41a                          ;0xf114:   c3 1a 04  "..." 
    INC BC                            ;0xf117:   03  "." 
    NOP                               ;0xf118:   00  "." 
    JP 0x11b                          ;0xf119:   c3 1b 01  "..." 
    JP 0x106                          ;0xf11c:   c3 06 01  "..." 
    NOP                               ;0xf11f:   00  "." 
    RLCA                              ;0xf120:   07  "." 
    INC BC                            ;0xf121:   03  "." 
    NOP                               ;0xf122:   00  "." 
    DEFB "LOADER  "                   ;0xf123:   0xf123 to 0xf12b
    DEFB 0x2                          ;0xf12c:   0x2
    DEFB 0x0                          ;0xf12d:   
    DEFB 0x79                         ;0xf12e:   
    DEFB 0xfe                         ;0xf12f:   
    DEFB 0x3b                         ;0xf130:   
    DEFB 0xc2                         ;0xf131:   
    DEFB 0x9                          ;0xf132:   0x9
    DEFB 0x1                          ;0xf133:   0x1
    DEFB 0xc1                         ;0xf134:   
    DEFB 0xc5                         ;0xf135:   
    DEFB 0x21                         ;0xf136:   
    DEFB 0x2                          ;0xf137:   0x2
    DEFB 0x0                          ;0xf138:   
    DEFB 0x39                         ;0xf139:   
    DEFB 0x31                         ;0xf13a:   
    DEFB 0xbe                         ;0xf13b:   
    DEFB 0x3                          ;0xf13c:   0x3
    DEFB 0x22                         ;0xf13d:   
    DEFB 0x9a                         ;0xf13e:   
    DEFB 0x3                          ;0xf13f:   0x3
    DEFB 0xc5                         ;0xf140:   
    DEFB 0xeb                         ;0xf141:   
    DEFB 0x22                         ;0xf142:   
    DEFB 0x98                         ;0xf143:   
    DEFB 0x3                          ;0xf144:   0x3
    DEFB 0x7c                         ;0xf145:   
    DEFB 0xb5                         ;0xf146:   
    DEFB 0xf5                         ;0xf147:   
    DEFB 0xcc                         ;0xf148:   
    DEFB 0x1                          ;0xf149:   0x1
    DEFB 0x0                          ;0xf14a:   
;--------------------------------------
C_F14B:                               ; XREF: 0xF129 
    LD (BC),A                         ;0xf14b:   02  "." 
    POP AF                            ;0xf14c:   f1  "." 
    CALL nz, 0x230                    ;0xf14d:   c4 30 02  ".0." 
    POP DE                            ;0xf150:   d1  "." 
    LD HL,1                           ;0xf151:   21 01 00  "!.."  
    LD BC,S_FE7E                      ;0xf154:   01 7e fe  ".~."  
    RET                               ;0xf157:   c9  "." 
    JP z, 0x19e                       ;0xf158:   ca 9e 01  "..." 
    LD A,D                            ;0xf15b:   7a  "z" 
    DEC A                             ;0xf15c:   3d  "=" 
    OR E                              ;0xf15d:   b3  "." 
    JP nz, 0x15f                      ;0xf15e:   c2 5f 01  "._." 
    LD A,(0x10d)                      ;0xf161:   3a 0d 01  ":.."  
    OR A                              ;0xf164:   b7  "." 
    JP nz, 0x15f                      ;0xf165:   c2 5f 01  "._." 
    LD HL,(0x10a)                     ;0xf168:   2a 0a 01  "*.."  
    LD (0x106),HL                     ;0xf16b:   22 06 01  "".."  
    NOP                               ;0xf16e:   00  "." 
    LD (0x394),HL                     ;0xf16f:   22 94 03  "".."  
    CALL 0x1f8                        ;0xf172:   cd f8 01  "..." 
    LD HL,(0x39a)                     ;0xf175:   2a 9a 03  "*.."  
    LD SP,HL                          ;0xf178:   f9  "." 
    XOR A                             ;0xf179:   af  "." 
    LD L,A                            ;0xf17a:   6f  "o" 
    LD H,A                            ;0xf17b:   67  "g" 
    RET                               ;0xf17c:   c9  "." 
    LD DE,0x1fe                       ;0xf17d:   11 fe 01  "..."  
    NOP                               ;0xf180:   00  "." 
    LD HL,(0x39a)                     ;0xf181:   2a 9a 03  "*.."  
    LD SP,HL                          ;0xf184:   f9  "." 
    POP HL                            ;0xf185:   e1  "." 
    PUSH HL                           ;0xf186:   e5  "." 
    DEC H                             ;0xf187:   25  "%" 
    LD A,H                            ;0xf188:   7c  "|" 
    OR L                              ;0xf189:   b5  "." 
    EX DE,HL                          ;0xf18a:   eb  "." 
    LD A,L                            ;0xf18b:   7d  "}" 
    LD B,H                            ;0xf18c:   44  "D" 
    RET nz                            ;0xf18d:   c0  "." 
    LD C,9                            ;0xf18e:   0e 09  ".."  
    LD DE,0x353                       ;0xf190:   11 53 03  ".S."  
    CALL 0x105                        ;0xf193:   cd 05 01  "..." 
    NOP                               ;0xf196:   00  "." 
    JP 0x2                            ;0xf197:   c3 02 00  "..." 
    INC HL                            ;0xf19a:   23  "#" 
    LD C,(HL)                         ;0xf19b:   4e  "N" 
    INC HL                            ;0xf19c:   23  "#" 
    LD B,(HL)                         ;0xf19d:   46  "F" 
    LD A,(0x38f)                      ;0xf19e:   3a 8f 03  ":.."  
    OR A                              ;0xf1a1:   b7  "." 
    JP z, 0x192                       ;0xf1a2:   ca 92 01  "..." 
    INC HL                            ;0xf1a5:   23  "#" 
    INC (HL)                          ;0xf1a6:   34  "4" 
    JP z, 0x19d                       ;0xf1a7:   ca 9d 01  "..." 
    PUSH DE                           ;0xf1aa:   d5  "." 
    CALL 0x30f                        ;0xf1ab:   cd 0f 03  "..." 
    POP HL                            ;0xf1ae:   e1  "." 
    CALL 0x2ca                        ;0xf1af:   cd ca 02  "..." 
    CALL 0x1d0                        ;0xf1b2:   cd d0 01  "..." 
    POP HL                            ;0xf1b5:   e1  "." 
    LD DE,0x110                       ;0xf1b6:   11 10 01  "..."  
    NOP                               ;0xf1b9:   00  "." 
    ADD HL,DE                         ;0xf1ba:   19  "." 
    PUSH HL                           ;0xf1bb:   e5  "." 
    LD E,(HL)                         ;0xf1bc:   5e  "^" 
    INC HL                            ;0xf1bd:   23  "#" 
    LD D,(HL)                         ;0xf1be:   56  "V" 
    LD A,E                            ;0xf1bf:   7b  "{" 
    OR D                              ;0xf1c0:   b2  "." 
    JP nz, 0x182                      ;0xf1c1:   c2 82 01  "..." 
    CALL 0x103                        ;0xf1c4:   cd 03 01  "..." 
    LD A,(0x1)                        ;0xf1c7:   3a 01 00  ":.."  
    LD (BC),A                         ;0xf1ca:   02  "." 
    CP 0xc9                           ;0xf1cb:   fe c9  ".." 
    JP nz, 0x1bf                      ;0xf1cd:   c2 bf 01  "..." 
    LD HL,(0x38d)                     ;0xf1d0:   2a 8d 03  "*.."  
    LD L,0xb3                         ;0xf1d3:   2e b3  ".."  
    LD A,(HL)                         ;0xf1d5:   7e  "~" 
    OR 2                              ;0xf1d6:   f6 02  ".." 
    LD (HL),A                         ;0xf1d8:   77  "w" 
    LD HL,(0x101)                     ;0xf1d9:   2a 01 01  "*.."  
    LD B,H                            ;0xf1dc:   44  "D" 
    LD C,L                            ;0xf1dd:   4d  "M" 
    LD HL,1                           ;0xf1de:   21 01 00  "!.."  
    LD (BC),A                         ;0xf1e1:   02  "." 
    LD DE,1                           ;0xf1e2:   11 01 00  "..."  
    LD BC,0x26cd                      ;0xf1e5:   01 cd 26  "..&"  
    INC BC                            ;0xf1e8:   03  "." 
    JP 0x15f                          ;0xf1e9:   c3 5f 01  "._." 
    LD HL,(0x106)                     ;0xf1ec:   2a 06 01  "*.."  
    NOP                               ;0xf1ef:   00  "." 
    LD L,1                            ;0xf1f0:   2e 01  ".."  
    NOP                               ;0xf1f2:   00  "." 
    LD BC,0x106                       ;0xf1f3:   01 06 01  "..."  
    NOP                               ;0xf1f6:   00  "." 
    CALL 0x326                        ;0xf1f7:   cd 26 03  ".&." 
    LD E,0x18                         ;0xf1fa:   1e 18  ".."  
    LD (DE),A                         ;0xf1fc:   12  "." 
    LD E,13                           ;0xf1fd:   1e 0d  ".."  
    LD (DE),A                         ;0xf1ff:   12  "." 
    DEC DE                            ;0xf200:   1b  "." 
    LD A,7                            ;0xf201:   3e 07  ">."  
    LD (DE),A                         ;0xf203:   12  "." 
    LD L,E                            ;0xf204:   6b  "k" 
    LD E,11                           ;0xf205:   1e 0b  ".."  
    LD (HL),E                         ;0xf207:   73  "s" 
    INC HL                            ;0xf208:   23  "#" 
    LD (HL),D                         ;0xf209:   72  "r" 
    EX DE,HL                          ;0xf20a:   eb  "." 
    LD (HL),D                         ;0xf20b:   72  "r" 
    DEC HL                            ;0xf20c:   2b  "+" 
    LD (HL),6                         ;0xf20d:   36 06  "6."  
    LD L,6                            ;0xf20f:   2e 06  ".."  
    LD (0x106),HL                     ;0xf211:   22 06 01  "".."  
    NOP                               ;0xf214:   00  "." 
    LD (0x394),HL                     ;0xf215:   22 94 03  "".."  
    LD DE,0x392                       ;0xf218:   11 92 03  "..."  
    LD C,0x31                         ;0xf21b:   0e 31  ".1"  
    JP 0x105                          ;0xf21d:   c3 05 01  "..." 
    NOP                               ;0xf220:   00  "." 
    LD HL,(0x106)                     ;0xf221:   2a 06 01  "*.."  
    NOP                               ;0xf224:   00  "." 
    LD B,H                            ;0xf225:   44  "D" 
    LD H,B                            ;0xf226:   60  "`" 
    LD L,0x18                         ;0xf227:   2e 18  ".."  
    INC (HL)                          ;0xf229:   34  "4" 
    DEC (HL)                          ;0xf22a:   35  "5" 
    RET nz                            ;0xf22b:   c0  "." 
    LD L,11                           ;0xf22c:   2e 0b  ".."  
    LD B,(HL)                         ;0xf22e:   46  "F" 
    LD L,14                           ;0xf22f:   2e 0e  ".."  
    LD A,(HL)                         ;0xf231:   7e  "~" 
    OR A                              ;0xf232:   b7  "." 
    JP z, 0x204                       ;0xf233:   ca 04 02  "..." 
    LD L,12                           ;0xf236:   2e 0c  ".."  
    LD E,(HL)                         ;0xf238:   5e  "^" 
    INC HL                            ;0xf239:   23  "#" 
    LD D,(HL)                         ;0xf23a:   56  "V" 
    LD A,B                            ;0xf23b:   78  "x" 
    LD (DE),A                         ;0xf23c:   12  "." 
    DEC DE                            ;0xf23d:   1b  "." 
    LD A,6                            ;0xf23e:   3e 06  ">."  
    LD (DE),A                         ;0xf240:   12  "." 
    INC DE                            ;0xf241:   13  "." 
    LD H,B                            ;0xf242:   60  "`" 
    LD L,12                           ;0xf243:   2e 0c  ".."  
    LD (HL),E                         ;0xf245:   73  "s" 
    INC HL                            ;0xf246:   23  "#" 
    LD (HL),D                         ;0xf247:   72  "r" 
    LD A,D                            ;0xf248:   7a  "z" 
    OR A                              ;0xf249:   b7  "." 
    PUSH BC                           ;0xf24a:   c5  "." 
    CALL z, 0x1f0                     ;0xf24b:   cc f0 01  "..." 
    POP BC                            ;0xf24e:   c1  "." 
    JP 0x204                          ;0xf24f:   c3 04 02  "..." 
    PUSH HL                           ;0xf252:   e5  "." 
    LD DE,0x390                       ;0xf253:   11 90 03  "..."  
    CALL 0x1fb                        ;0xf256:   cd fb 01  "..." 
    EX DE,HL                          ;0xf259:   eb  "." 
    POP HL                            ;0xf25a:   e1  "." 
    PUSH HL                           ;0xf25b:   e5  "." 
    LD BC,0x120                       ;0xf25c:   01 20 01  ". ."  
    NOP                               ;0xf25f:   00  "." 
    ADD HL,BC                         ;0xf260:   09  "." 
    LD (HL),1                         ;0xf261:   36 01  "6."  
    NOP                               ;0xf263:   00  "." 
    INC HL                            ;0xf264:   23  "#" 
    LD C,(HL)                         ;0xf265:   4e  "N" 
    INC HL                            ;0xf266:   23  "#" 
    LD H,(HL)                         ;0xf267:   66  "f" 
    LD L,C                            ;0xf268:   69  "i" 
    DEC H                             ;0xf269:   25  "%" 
    INC H                             ;0xf26a:   24  "$" 
    JP z, 0x167                       ;0xf26b:   ca 67 01  ".g." 
    PUSH HL                           ;0xf26e:   e5  "." 
    PUSH DE                           ;0xf26f:   d5  "." 
    PUSH HL                           ;0xf270:   e5  "." 
    CALL 0x331                        ;0xf271:   cd 31 03  ".1." 
    POP HL                            ;0xf274:   e1  "." 
    PUSH AF                           ;0xf275:   f5  "." 
    LD E,0x80                         ;0xf276:   1e 80  ".."  
    LD A,(0x107)                      ;0xf278:   3a 07 01  ":.."  
    NOP                               ;0xf27b:   00  "." 
    DEC A                             ;0xf27c:   3d  "=" 
    SUB H                             ;0xf27d:   94  "." 
    JP c, 0x2fa                       ;0xf27e:   da fa 02  "..." 
    INC A                             ;0xf281:   3c  "<" 
    CP 0x40                           ;0xf282:   fe 40  ".@" 
    JP nc, 0x276                      ;0xf284:   d2 76 02  ".v." 
    RLCA                              ;0xf287:   07  "." 
    LD E,A                            ;0xf288:   5f  "_" 
    LD A,L                            ;0xf289:   7d  "}" 
    OR A                              ;0xf28a:   b7  "." 
    JP z, 0x276                       ;0xf28b:   ca 76 02  ".v." 
    LD B,2                            ;0xf28e:   06 02  ".."  
    DEC A                             ;0xf290:   3d  "=" 
    JP m, 0x270                       ;0xf291:   fa 70 02  ".p." 
    DEC B                             ;0xf294:   05  "." 
    LD A,E                            ;0xf295:   7b  "{" 
    SUB B                             ;0xf296:   90  "." 
    JP z, 0x2fa                       ;0xf297:   ca fa 02  "..." 
    LD E,A                            ;0xf29a:   5f  "_" 
    PUSH DE                           ;0xf29b:   d5  "." 
    PUSH HL                           ;0xf29c:   e5  "." 
    CALL 0x333                        ;0xf29d:   cd 33 03  ".3." 
    POP HL                            ;0xf2a0:   e1  "." 
    PUSH HL                           ;0xf2a1:   e5  "." 
    CALL 0x33b                        ;0xf2a2:   cd 3b 03  ".;." 
    POP HL                            ;0xf2a5:   e1  "." 
    POP DE                            ;0xf2a6:   d1  "." 
    PUSH AF                           ;0xf2a7:   f5  "." 
    LD A,E                            ;0xf2a8:   7b  "{" 
    INC A                             ;0xf2a9:   3c  "<" 
    RRA                               ;0xf2aa:   1f  "." 
    ADD A,H                           ;0xf2ab:   84  "." 
    LD H,A                            ;0xf2ac:   67  "g" 
    LD (0x396),HL                     ;0xf2ad:   22 96 03  "".."  
    POP AF                            ;0xf2b0:   f1  "." 
    JP z, 0x254                       ;0xf2b1:   ca 54 02  ".T." 
    POP BC                            ;0xf2b4:   c1  "." 
    DEC A                             ;0xf2b5:   3d  "=" 
    LD E,B                            ;0xf2b6:   58  "X" 
    CALL 0x333                        ;0xf2b7:   cd 33 03  ".3." 
    LD C,0x1a                         ;0xf2ba:   0e 1a  ".."  
    POP DE                            ;0xf2bc:   d1  "." 
    PUSH AF                           ;0xf2bd:   f5  "." 
    CALL 0x105                        ;0xf2be:   cd 05 01  "..." 
    NOP                               ;0xf2c1:   00  "." 
    POP AF                            ;0xf2c2:   f1  "." 
    LD HL,(0x39c)                     ;0xf2c3:   2a 9c 03  "*.."  
    EX DE,HL                          ;0xf2c6:   eb  "." 
    JP nz, 0x16a                      ;0xf2c7:   c2 6a 01  ".j." 
    POP DE                            ;0xf2ca:   d1  "." 
    POP HL                            ;0xf2cb:   e1  "." 
    LD BC,0x109                       ;0xf2cc:   01 09 01  "..."  
    NOP                               ;0xf2cf:   00  "." 
    ADD HL,BC                         ;0xf2d0:   09  "." 
    LD A,(HL)                         ;0xf2d1:   7e  "~" 
    AND 0x7f                          ;0xf2d2:   e6 7f  ".." 
    CP 0x50                           ;0xf2d4:   fe 50  ".P" 
    RET nz                            ;0xf2d6:   c0  "." 
    INC HL                            ;0xf2d7:   23  "#" 
    LD A,(HL)                         ;0xf2d8:   7e  "~" 
    AND 0x7f                          ;0xf2d9:   e6 7f  ".." 
    CP 0x52                           ;0xf2db:   fe 52  ".R" 
    RET nz                            ;0xf2dd:   c0  "." 
    INC HL                            ;0xf2de:   23  "#" 
    LD A,(HL)                         ;0xf2df:   7e  "~" 
    AND 0x7f                          ;0xf2e0:   e6 7f  ".." 
    SUB 0x4c                          ;0xf2e2:   d6 4c  ".L" 
    RET nz                            ;0xf2e4:   c0  "." 
    LD A,E                            ;0xf2e5:   7b  "{" 
    OR A                              ;0xf2e6:   b7  "." 
    JP nz, 0x167                      ;0xf2e7:   c2 67 01  ".g." 
    LD H,D                            ;0xf2ea:   62  "b" 
    LD L,E                            ;0xf2eb:   6b  "k" 
    INC HL                            ;0xf2ec:   23  "#" 
    LD C,(HL)                         ;0xf2ed:   4e  "N" 
    INC HL                            ;0xf2ee:   23  "#" 
    LD B,(HL)                         ;0xf2ef:   46  "F" 
    LD L,E                            ;0xf2f0:   6b  "k" 
    INC H                             ;0xf2f1:   24  "$" 
    PUSH DE                           ;0xf2f2:   d5  "." 
    PUSH BC                           ;0xf2f3:   c5  "." 
    CALL 0x326                        ;0xf2f4:   cd 26 03  ".&." 
    POP BC                            ;0xf2f7:   c1  "." 
    POP DE                            ;0xf2f8:   d1  "." 
    PUSH DE                           ;0xf2f9:   d5  "." 
    LD E,D                            ;0xf2fa:   5a  "Z" 
    DEC E                             ;0xf2fb:   1d  "." 
    PUSH HL                           ;0xf2fc:   e5  "." 
    LD H,E                            ;0xf2fd:   63  "c" 
    LD E,1                            ;0xf2fe:   1e 01  ".."  
    NOP                               ;0xf300:   00  "." 
    LD A,B                            ;0xf301:   78  "x" 
    OR C                              ;0xf302:   b1  "." 
    JP z, 0x2f7                       ;0xf303:   ca f7 02  "..." 
    DEC BC                            ;0xf306:   0b  "." 
    LD A,E                            ;0xf307:   7b  "{" 
    AND 7                             ;0xf308:   e6 07  ".." 
    JP nz, 0x2ea                      ;0xf30a:   c2 ea 02  "..." 
    EX (SP),HL                        ;0xf30d:   e3  "." 
    LD A,(HL)                         ;0xf30e:   7e  "~" 
    INC HL                            ;0xf30f:   23  "#" 
    EX (SP),HL                        ;0xf310:   e3  "." 
    LD L,A                            ;0xf311:   6f  "o" 
    LD A,L                            ;0xf312:   7d  "}" 
    RLA                               ;0xf313:   17  "." 
    LD L,A                            ;0xf314:   6f  "o" 
    JP nc, 0x2f3                      ;0xf315:   d2 f3 02  "..." 
    LD A,(DE)                         ;0xf318:   1a  "." 
    ADD A,H                           ;0xf319:   84  "." 
    LD (DE),A                         ;0xf31a:   12  "." 
    INC DE                            ;0xf31b:   13  "." 
    JP 0x2d9                          ;0xf31c:   c3 d9 02  "..." 
    POP DE                            ;0xf31f:   d1  "." 
    POP DE                            ;0xf320:   d1  "." 
    RET                               ;0xf321:   c9  "." 
    CALL 0x331                        ;0xf322:   cd 31 03  ".1." 
    LD HL,0x180                       ;0xf325:   21 80 01  "!.."  
    NOP                               ;0xf328:   00  "." 
    CALL 0x33b                        ;0xf329:   cd 3b 03  ".;." 
    JP nz, 0x28f                      ;0xf32c:   c2 8f 02  "..." 
    LD HL,0x1fe                       ;0xf32f:   21 fe 01  "!.."  
    NOP                               ;0xf332:   00  "." 
    LD (0x39c),HL                     ;0xf333:   22 9c 03  "".."  
    JP 0x28f                          ;0xf336:   c3 8f 02  "..." 
    LD A,(0x107)                      ;0xf339:   3a 07 01  ":.."  
    NOP                               ;0xf33c:   00  "." 
    DEC A                             ;0xf33d:   3d  "=" 
    DEC BC                            ;0xf33e:   0b  "." 
    SUB B                             ;0xf33f:   90  "." 
    INC BC                            ;0xf340:   03  "." 
    CP 15                             ;0xf341:   fe 0f  ".." 
    JP c, 0x177                       ;0xf343:   da 77 01  ".w." 
    LD HL,(0x396)                     ;0xf346:   2a 96 03  "*.."  
    CP H                              ;0xf349:   bc  "." 
    JP c, 0x177                       ;0xf34a:   da 77 01  ".w." 
    LD D,A                            ;0xf34d:   57  "W" 
    LD E,1                            ;0xf34e:   1e 01  ".."  
    NOP                               ;0xf350:   00  "." 
    RET                               ;0xf351:   c9  "." 
    LD A,B                            ;0xf352:   78  "x" 
    OR C                              ;0xf353:   b1  "." 
    RET z                             ;0xf354:   c8  "." 
    DEC BC                            ;0xf355:   0b  "." 
    LD A,(HL)                         ;0xf356:   7e  "~" 
    LD (DE),A                         ;0xf357:   12  "." 
    INC DE                            ;0xf358:   13  "." 
    INC HL                            ;0xf359:   23  "#" 
    JP 0x326                          ;0xf35a:   c3 26 03  ".&." 
    LD E,1                            ;0xf35d:   1e 01  ".."  
    LD HL,(0x38d)                     ;0xf35f:   2a 8d 03  "*.."  
    LD L,0xe6                         ;0xf362:   2e e6  ".."  
    LD A,(HL)                         ;0xf364:   7e  "~" 
    LD (HL),E                         ;0xf365:   73  "s" 
    RET                               ;0xf366:   c9  "." 
    EX DE,HL                          ;0xf367:   eb  "." 
    LD C,0x1a                         ;0xf368:   0e 1a  ".."  
    PUSH HL                           ;0xf36a:   e5  "." 
    CALL 0x105                        ;0xf36b:   cd 05 01  "..." 
    NOP                               ;0xf36e:   00  "." 
    LD C,0x14                         ;0xf36f:   0e 14  ".."  
    LD HL,(0x398)                     ;0xf371:   2a 98 03  "*.."  
    EX DE,HL                          ;0xf374:   eb  "." 
    CALL 0x105                        ;0xf375:   cd 05 01  "..." 
    NOP                               ;0xf378:   00  "." 
    LD (0x39c),HL                     ;0xf379:   22 9c 03  "".."  
    POP DE                            ;0xf37c:   d1  "." 
    OR A                              ;0xf37d:   b7  "." 
    RET z                             ;0xf37e:   c8  "." 
    LD E,H                            ;0xf37f:   5c  "\" 
    RET                               ;0xf380:   c9  "." 
    DEC C                             ;0xf381:   0d  "." 
    LD A,(BC)                         ;0xf382:   0a  "." 
    DEFB "Cannot load Program$221282  COPYR '82 DRI "  ;0xf383:   0xf383 to 0xf3ad
    DEFB 0x11                         ;0xf3ad:   0x11
    DEFB 0x0                          ;0xf3ae:   
    DEFB 0x3c                         ;0xf3af:   
    DEFB 0x1                          ;0xf3b0:   0x1
    DEFB 0x0                          ;0xf3b1:   
    DEFB 0x62                         ;0xf3b2:   
    DEFB 0xfe                         ;0xf3b3:   
    DEFB 0x1                          ;0xf3b4:   0x1
    DEFB 0x0                          ;0xf3b5:   
    DEFB 0x80                         ;0xf3b6:   
    DEFB 0x2                          ;0xf3b7:   0x2
    DEFB 0x0                          ;0xf3b8:   
    DEFB 0x80                         ;0xf3b9:   
    DEFB 0x48                         ;0xf3ba:   
    DEFB 0x41                         ;0xf3bb:   
    DEFB 0x10                         ;0xf3bc:   0x10
    DEFB 0x4                          ;0xf3bd:   0x4
    DEFB 0x12                         ;0xf3be:   0x12
;--------------------------------------
C_F3BF:                               ; XREF: 0xF39D 
    INC H                             ;0xf3bf:   24  "$" 
    LD (DE),A                         ;0xf3c0:   12  "." 
    LD B,B                            ;0xf3c1:   40  "@" 
;--------------------------------------
C_F3C2:                               ; XREF: 0xF3BC 
    EX AF,AF'                         ;0xf3c2:   08  "." 
    LD BC,0x1000                      ;0xf3c3:   01 00 10  "..."  
    LD BC,0x8800                      ;0xf3c6:   01 00 88  "..."  
    LD B,H                            ;0xf3c9:   44  "D" 
    LD C,B                            ;0xf3ca:   48  "H" 
    LD BC,0x2000                      ;0xf3cb:   01 00 20  ".. "  
    INC B                             ;0xf3ce:   04  "." 
    ADD A,B                           ;0xf3cf:   80  "." 
    LD BC,0x900                       ;0xf3d0:   01 00 09  "..."  
    LD BC,0x2000                      ;0xf3d3:   01 00 20  ".. "  
    LD (BC),A                         ;0xf3d6:   02  "." 
    NOP                               ;0xf3d7:   00  "." 
    LD BC,0x220                       ;0xf3d8:   01 20 02  ". ."  
    NOP                               ;0xf3db:   00  "." 
    DJNZ $+4                          ;0xf3dc:   10 02  ".." 
    NOP                               ;0xf3de:   00  "." 
    LD DE,0x212                       ;0xf3df:   11 12 02  "..."  
    NOP                               ;0xf3e2:   00  "." 
    LD B,C                            ;0xf3e3:   41  "A" 
    LD BC,0x1000                      ;0xf3e4:   01 00 10  "..."  
    LD B,B                            ;0xf3e7:   40  "@" 
    ADD A,D                           ;0xf3e8:   82  "." 
    EX AF,AF'                         ;0xf3e9:   08  "." 
    LD HL,1                           ;0xf3ea:   21 01 00  "!.."  
    LD (0x108),HL                     ;0xf3ed:   22 08 01  "".."  
    DJNZ C_F3F5                       ;0xf3f0:   10 03  ".." 
    NOP                               ;0xf3f2:   00  "." 
    JR nz, $+3                        ;0xf3f3:   20 01  " ." 
;--------------------------------------
C_F3F5:                               ; XREF: 0xF3F0 
    LD BC,0x400                       ;0xf3f5:   01 00 04  "..."  
    EX AF,AF'                         ;0xf3f8:   08  "." 
    LD BC,0x802                       ;0xf3f9:   01 02 08  "..."  
    INC H                             ;0xf3fc:   24  "$" 
    LD (DE),A                         ;0xf3fd:   12  "." 
    LD BC,0x2400                      ;0xf3fe:   01 00 24  "..$"  
    LD B,B                            ;0xf401:   40  "@" 
    LD BC,0x8400                      ;0xf402:   01 00 84  "..."  
    LD BC,0x200                       ;0xf405:   01 00 02  "..."  
    INC B                             ;0xf408:   04  "." 
    ADD HL,BC                         ;0xf409:   09  "." 
    NOP                               ;0xf40a:   00  "." 
    LD A,(DE)                         ;0xf40b:   1a  "." 
    LD A,(DE)                         ;0xf40c:   1a  "." 
    LD A,(DE)                         ;0xf40d:   1a  "." 
    LD A,(DE)                         ;0xf40e:   1a  "." 
    LD A,(DE)                         ;0xf40f:   1a  "." 
    LD A,(DE)                         ;0xf410:   1a  "." 
    LD A,(DE)                         ;0xf411:   1a  "." 
    LD A,(DE)                         ;0xf412:   1a  "." 
    LD A,(DE)                         ;0xf413:   1a  "." 
    LD A,(DE)                         ;0xf414:   1a  "." 
    LD A,(DE)                         ;0xf415:   1a  "." 
    LD A,(DE)                         ;0xf416:   1a  "." 
    LD A,(DE)                         ;0xf417:   1a  "." 
    LD A,(DE)                         ;0xf418:   1a  "." 
    LD A,(DE)                         ;0xf419:   1a  "." 
    LD A,(DE)                         ;0xf41a:   1a  "." 
    LD A,(DE)                         ;0xf41b:   1a  "." 
    LD A,(DE)                         ;0xf41c:   1a  "." 
    LD A,(DE)                         ;0xf41d:   1a  "." 
    LD A,(DE)                         ;0xf41e:   1a  "." 
    LD A,(DE)                         ;0xf41f:   1a  "." 
    LD A,(DE)                         ;0xf420:   1a  "." 
;--------------------------------------
C_F421:                               ; XREF: 0xCA9A 
    LD A,(DE)                         ;0xf421:   1a  "." 
    LD A,(DE)                         ;0xf422:   1a  "." 
    LD A,(DE)                         ;0xf423:   1a  "." 
    INC BC                            ;0xf424:   03  "." 
    NOP                               ;0xf425:   00  "." 
    XOR A                             ;0xf426:   af  "." 
    LD (0xd4d),A                      ;0xf427:   32 4d 0d  "2M."  
    JP 0x699                          ;0xf42a:   c3 99 06  "..." 
    JP z, 0xb58                       ;0xf42d:   ca 58 0b  ".X." 
    CP 0x20                           ;0xf430:   fe 20  ". " 
    JP z, 0xb58                       ;0xf432:   ca 58 0b  ".X." 
    CP 9                              ;0xf435:   fe 09  ".." 
    JP z, 0xb58                       ;0xf437:   ca 58 0b  ".X." 
    JP 0xb53                          ;0xf43a:   c3 53 0b  ".S." 
    LD SP,0xf2d                       ;0xf43d:   31 2d 0f  "1-."  
    LD HL,0x50c                       ;0xf440:   21 0c 05  "!.."  
    PUSH HL                           ;0xf443:   e5  "." 
    LD DE,0xd6a                       ;0xf444:   11 6a 0d  ".j."  
    LD C,0x31                         ;0xf447:   0e 31  ".1"  
    CALL 0x105                        ;0xf449:   cd 05 01  "..." 
    NOP                               ;0xf44c:   00  "." 
    LD (0x38d),HL                     ;0xf44d:   22 8d 03  "".."  
    LD L,0xfa                         ;0xf450:   2e fa  ".."  
    LD A,(HL)                         ;0xf452:   7e  "~" 
    LD (0x38f),A                      ;0xf453:   32 8f 03  "2.."  
    LD L,0x99                         ;0xf456:   2e 99  ".."  
    LD A,(HL)                         ;0xf458:   7e  "~" 
    LD (0xda0),A                      ;0xf459:   32 a0 0d  "2.."  
    LD A,(0x107)                      ;0xf45c:   3a 07 01  ":.."  
    NOP                               ;0xf45f:   00  "." 
    SUB (HL)                          ;0xf460:   96  "." 
    JP nz, 0x458                      ;0xf461:   c2 58 04  ".X." 
    LD BC,0x294                       ;0xf464:   01 94 02  "..."  
    CALL 0x30f                        ;0xf467:   cd 0f 03  "..." 
    LD H,E                            ;0xf46a:   63  "c" 
    LD L,E                            ;0xf46b:   6b  "k" 
    CALL 0x2ca                        ;0xf46c:   cd ca 02  "..." 
    LD HL,(0x106)                     ;0xf46f:   2a 06 01  "*.."  
    NOP                               ;0xf472:   00  "." 
    LD L,E                            ;0xf473:   6b  "k" 
    LD C,6                            ;0xf474:   0e 06  ".."  
    CALL 0xbae                        ;0xf476:   cd ae 0b  "..." 
    LD E,11                           ;0xf479:   1e 0b  ".."  
    CALL 0x1eb                        ;0xf47b:   cd eb 01  "..." 
    LD C,0x62                         ;0xf47e:   0e 62  ".b"  
    CALL 0x105                        ;0xf480:   cd 05 01  "..." 
    NOP                               ;0xf483:   00  "." 
    LD B,0xb6                         ;0xf484:   06 b6  ".."  
    CALL 0xbff                        ;0xf486:   cd ff 0b  "..." 
    INC A                             ;0xf489:   3c  "<" 
    RRCA                              ;0xf48a:   0f  "." 
    RRCA                              ;0xf48b:   0f  "." 
    RRCA                              ;0xf48c:   0f  "." 
    RRCA                              ;0xf48d:   0f  "." 
    AND 15                            ;0xf48e:   e6 0f  ".." 
    LD DE,0xd97                       ;0xf490:   11 97 0d  "..."  
    LD (DE),A                         ;0xf493:   12  "." 
    LD L,0xb8                         ;0xf494:   2e b8  ".."  
    LD A,(HL)                         ;0xf496:   7e  "~" 
    DEC A                             ;0xf497:   3d  "=" 
    INC DE                            ;0xf498:   13  "." 
    LD (DE),A                         ;0xf499:   12  "." 
    XOR A                             ;0xf49a:   af  "." 
    INC DE                            ;0xf49b:   13  "." 
    LD (DE),A                         ;0xf49c:   12  "." 
    LD A,0x24                         ;0xf49d:   3e 24  ">$"  
    INC DE                            ;0xf49f:   13  "." 
    LD (DE),A                         ;0xf4a0:   12  "." 
    LD L,0xd3                         ;0xf4a1:   2e d3  ".."  
    LD (HL),A                         ;0xf4a3:   77  "w" 
    LD L,0xe6                         ;0xf4a4:   2e e6  ".."  
    LD (HL),1                         ;0xf4a6:   36 01  "6."  
    INC HL                            ;0xf4a8:   23  "#" 
    XOR A                             ;0xf4a9:   af  "." 
    LD (HL),A                         ;0xf4aa:   77  "w" 
    LD L,0xcf                         ;0xf4ab:   2e cf  ".."  
    LD (HL),1                         ;0xf4ad:   36 01  "6."  
    INC HL                            ;0xf4af:   23  "#" 
    LD (HL),A                         ;0xf4b0:   77  "w" 
    LD L,0xa1                         ;0xf4b1:   2e a1  ".."  
    LD (HL),0x31                      ;0xf4b3:   36 31  "61"  
    LD L,0xb4                         ;0xf4b5:   2e b4  ".."  
    LD A,(HL)                         ;0xf4b7:   7e  "~" 
    AND 0x20                          ;0xf4b8:   e6 20  ". " 
    LD C,13                           ;0xf4ba:   0e 0d  ".."  
    PUSH HL                           ;0xf4bc:   e5  "." 
    CALL nz, 0x105                    ;0xf4bd:   c4 05 01  "..." 
    NOP                               ;0xf4c0:   00  "." 
    POP HL                            ;0xf4c1:   e1  "." 
    LD L,0xb3                         ;0xf4c2:   2e b3  ".."  
    LD A,(HL)                         ;0xf4c4:   7e  "~" 
    AND 2                             ;0xf4c5:   e6 02  ".." 
    PUSH HL                           ;0xf4c7:   e5  "." 
    CALL z, 0x1                       ;0xf4c8:   cc 01 00  "..." 
    LD (BC),A                         ;0xf4cb:   02  "." 
    POP HL                            ;0xf4cc:   e1  "." 
    LD A,(HL)                         ;0xf4cd:   7e  "~" 
    AND 0xfd                          ;0xf4ce:   e6 fd  ".." 
    LD (HL),A                         ;0xf4d0:   77  "w" 
    AND 0x40                          ;0xf4d1:   e6 40  ".@" 
    PUSH HL                           ;0xf4d3:   e5  "." 
    LD L,0xb0                         ;0xf4d4:   2e b0  ".."  
    LD BC,0xd70                       ;0xf4d6:   01 70 0d  ".p."  
    LD D,H                            ;0xf4d9:   54  "T" 
    LD E,0xe0                         ;0xf4da:   1e e0  ".."  
    LD A,(DE)                         ;0xf4dc:   1a  "." 
    LD (BC),A                         ;0xf4dd:   02  "." 
    LD A,(HL)                         ;0xf4de:   7e  "~" 
    JP nz, 0x4ba                      ;0xf4df:   c2 ba 04  "..." 
    LD (BC),A                         ;0xf4e2:   02  "." 
    LD (DE),A                         ;0xf4e3:   12  "." 
    INC BC                            ;0xf4e4:   03  "." 
    LD E,0xda                         ;0xf4e5:   1e da  ".."  
    LD A,(DE)                         ;0xf4e7:   1a  "." 
    JP nz, 0x4c4                      ;0xf4e8:   c2 c4 04  "..." 
    LD A,0xff                         ;0xf4eb:   3e ff  ">."  
    LD (BC),A                         ;0xf4ed:   02  "." 
    DEC HL                            ;0xf4ee:   2b  "+" 
    INC BC                            ;0xf4ef:   03  "." 
    LD A,(HL)                         ;0xf4f0:   7e  "~" 
    LD (BC),A                         ;0xf4f1:   02  "." 
    LD (DE),A                         ;0xf4f2:   12  "." 
    LD L,0xec                         ;0xf4f3:   2e ec  ".."  
    INC BC                            ;0xf4f5:   03  "." 
    LD A,(HL)                         ;0xf4f6:   7e  "~" 
    LD (BC),A                         ;0xf4f7:   02  "." 
    POP HL                            ;0xf4f8:   e1  "." 
    LD A,(HL)                         ;0xf4f9:   7e  "~" 
    AND 0x80                          ;0xf4fa:   e6 80  ".." 
    JP z, 0x4e7                       ;0xf4fc:   ca e7 04  "..." 
    LD HL,0x180                       ;0xf4ff:   21 80 01  "!.."  
    NOP                               ;0xf502:   00  "." 
    LD DE,0xdf5                       ;0xf503:   11 f5 0d  "..."  
    LD C,0x7f                         ;0xf506:   0e 7f  ".."  
    LD A,C                            ;0xf508:   79  "y" 
    LD (DE),A                         ;0xf509:   12  "." 
    INC DE                            ;0xf50a:   13  "." 
    CALL 0xbae                        ;0xf50b:   cd ae 0b  "..." 
    JP 0x58b                          ;0xf50e:   c3 8b 05  "..." 
    LD L,0xb5                         ;0xf511:   2e b5  ".."  
    LD A,(HL)                         ;0xf513:   7e  "~" 
    AND 2                             ;0xf514:   e6 02  ".." 
    JP nz, 0x506                      ;0xf516:   c2 06 05  "..." 
    LD A,(HL)                         ;0xf519:   7e  "~" 
    OR 2                              ;0xf51a:   f6 02  ".." 
    LD (HL),A                         ;0xf51c:   77  "w" 
    LD (0xd67),A                      ;0xf51d:   32 67 0d  "2g."  
    LD HL,0x4fc                       ;0xf520:   21 fc 04  "!.."  
    JP 0x4d9                          ;0xf523:   c3 d9 04  "..." 
    DEFB "PROFILE.S"                  ;0xf526:   0xf526 to 0xf52f
    DEFB 0x1                          ;0xf52f:   0x1
    DEFB 0x0                          ;0xf530:   
;--------------------------------------
C_F531:                               ; XREF: 0xF07C 
    CALL 0xbe4                        ;0xf531:   cd e4 0b  "..." 
    CALL 0xc09                        ;0xf534:   cd 09 0c  "..." 
    LD HL,0xf2b                       ;0xf537:   21 2b 0f  "!+."  
    LD SP,HL                          ;0xf53a:   f9  "." 
    XOR A                             ;0xf53b:   af  "." 
    LD (0xd99),A                      ;0xf53c:   32 99 0d  "2.."  
    LD HL,0x50c                       ;0xf53f:   21 0c 05  "!.."  
    PUSH HL                           ;0xf542:   e5  "." 
    CALL 0xbe4                        ;0xf543:   cd e4 0b  "..." 
    DEC HL                            ;0xf546:   2b  "+" 
    LD A,(HL)                         ;0xf547:   7e  "~" 
    AND 1                             ;0xf548:   e6 01  ".." 
    JP z, 0x564                       ;0xf54a:   ca 64 05  ".d." 
    LD DE,0xdf5                       ;0xf54d:   11 f5 0d  "..."  
    CALL 0x97b                        ;0xf550:   cd 7b 09  ".{." 
    LD C,15                           ;0xf553:   0e 0f  ".."  
    CALL 0x9f0                        ;0xf555:   cd f0 09  "..." 
    LD C,11                           ;0xf558:   0e 0b  ".."  
    CALL z, 0x9f0                     ;0xf55a:   cc f0 09  "..." 
    JP nz, 0x54f                      ;0xf55d:   c2 4f 05  ".O." 
    LD HL,0xd96                       ;0xf560:   21 96 0d  "!.."  
    LD (HL),A                         ;0xf563:   77  "w" 
    DEC HL                            ;0xf564:   2b  "+" 
    LD (HL),A                         ;0xf565:   77  "w" 
    DEC HL                            ;0xf566:   2b  "+" 
    PUSH HL                           ;0xf567:   e5  "." 
    LD A,(0xd82)                      ;0xf568:   3a 82 0d  ":.."  
    DEC A                             ;0xf56b:   3d  "=" 
    LD (HL),A                         ;0xf56c:   77  "w" 
    LD C,0x21                         ;0xf56d:   0e 21  ".!"  
    CALL p, 0x9f0                     ;0xf56f:   f4 f0 09  "..." 
    POP HL                            ;0xf572:   e1  "." 
    DEC (HL)                          ;0xf573:   35  "5" 
    LD C,0x13                         ;0xf574:   0e 13  ".."  
    CALL m, 0x9f0                     ;0xf576:   fc f0 09  "..." 
    OR A                              ;0xf579:   b7  "." 
    PUSH AF                           ;0xf57a:   f5  "." 
    LD C,0x63                         ;0xf57b:   0e 63  ".c"  
    CALL 0x9f0                        ;0xf57d:   cd f0 09  "..." 
    POP AF                            ;0xf580:   f1  "." 
    JP z, 0x58b                       ;0xf581:   ca 8b 05  "..." 
    LD BC,0xb301                      ;0xf584:   01 01 b3  "..."  
    CALL 0xbf1                        ;0xf587:   cd f1 0b  "..." 
    LD C,0x13                         ;0xf58a:   0e 13  ".."  
    CALL 0x9f0                        ;0xf58c:   cd f0 09  "..." 
    LD A,(0xd70)                      ;0xf58f:   3a 70 0d  ":p."  
    OR A                              ;0xf592:   b7  "." 
    CALL nz, 0xc13                    ;0xf593:   c4 13 0c  "..." 
    CALL 0x66d                        ;0xf596:   cd 6d 06  ".m." 
    LD A,0x3e                         ;0xf599:   3e 3e  ">>"  
    CALL 0x916                        ;0xf59b:   cd 16 09  "..." 
    LD DE,0xb1ba                      ;0xf59e:   11 ba b1  "..."  
    CALL 0xba7                        ;0xf5a1:   cd a7 0b  "..." 
    OR A                              ;0xf5a4:   b7  "." 
    PUSH AF                           ;0xf5a5:   f5  "." 
    LD BC,0xb480                      ;0xf5a6:   01 80 b4  "..."  
    CALL nz, 0xbf1                    ;0xf5a9:   c4 f1 0b  "..." 
    CALL 0x94e                        ;0xf5ac:   cd 4e 09  ".N." 
    CALL 0xbee                        ;0xf5af:   cd ee 0b  "..." 
    POP AF                            ;0xf5b2:   f1  "." 
    CALL nz, 0xaa8                    ;0xf5b3:   c4 a8 0a  "..." 
    CALL 0xbda                        ;0xf5b6:   cd da 0b  "..." 
    JP nz, 0x596                      ;0xf5b9:   c2 96 05  "..." 
    LD L,0xc9                         ;0xf5bc:   2e c9  ".."  
    LD A,(HL)                         ;0xf5be:   7e  "~" 
    DEC HL                            ;0xf5bf:   2b  "+" 
    LD (HL),A                         ;0xf5c0:   77  "w" 
    LD L,0xc8                         ;0xf5c1:   2e c8  ".."  
    LD A,(HL)                         ;0xf5c3:   7e  "~" 
    LD (0xd9a),A                      ;0xf5c4:   32 9a 0d  "2.."  
    CALL 0x9f6                        ;0xf5c7:   cd f6 09  "..." 
    RET z                             ;0xf5ca:   c8  "." 
    LD DE,0xdac                       ;0xf5cb:   11 ac 0d  "..."  
    CALL 0xb39                        ;0xf5ce:   cd 39 0b  ".9." 
    LD A,(0xdb6)                      ;0xf5d1:   3a b6 0d  ":.."  
    CP 0x20                           ;0xf5d4:   fe 20  ". " 
    JP nz, 0x604                      ;0xf5d6:   c2 04 06  "..." 
    LD HL,0xdac                       ;0xf5d9:   21 ac 0d  "!.."  
    LD A,(HL)                         ;0xf5dc:   7e  "~" 
    INC HL                            ;0xf5dd:   23  "#" 
    OR (HL)                           ;0xf5de:   b6  "." 
    INC HL                            ;0xf5df:   23  "#" 
    LD A,(HL)                         ;0xf5e0:   7e  "~" 
    JP nz, 0x60a                      ;0xf5e1:   c2 0a 06  "..." 
    LD HL,0x637                       ;0xf5e4:   21 37 06  "!7."  
    LD DE,0xdae                       ;0xf5e7:   11 ae 0d  "..."  
    LD A,(0xdb0)                      ;0xf5ea:   3a b0 0d  ":.."  
    CP 0x21                           ;0xf5ed:   fe 21  ".!" 
    CALL nc, 0xcbf                    ;0xf5ef:   d4 bf 0c  "..." 
    JP nz, 0x5e8                      ;0xf5f2:   c2 e8 05  "..." 
    LD A,(0xda1)                      ;0xf5f5:   3a a1 0d  ":.."  
    OR A                              ;0xf5f8:   b7  "." 
    LD A,B                            ;0xf5f9:   78  "x" 
    LD HL,(0xd6c)                     ;0xf5fa:   2a 6c 0d  "*l."  
    LD (0xd9d),HL                     ;0xf5fd:   22 9d 0d  "".."  
    LD HL,0x65a                       ;0xf600:   21 5a 06  "!Z."  
    JP z, 0x858                       ;0xf603:   ca 58 08  ".X." 
    CP 4                              ;0xf606:   fe 04  ".." 
    JP c, 0x786                       ;0xf608:   da 86 07  "..." 
    LD HL,0xdb1                       ;0xf60b:   21 b1 0d  "!.."  
    JP nz, 0x5e8                      ;0xf60e:   c2 e8 05  "..." 
    LD (HL),0x20                      ;0xf611:   36 20  "6 "  
    DEFB 0x1                          ;0xf613:   0x1
;--------------------------------------
D_F614:                               ; XREF: 0xC679 
    DEFB 0x18                         ;0xf614:   0x18
;--------------------------------------
D_F615:                               ; XREF: 0xD465 0xCB13 0xD9F6 0xCF17 0xCC58 
    DEFB 0xb4                         ;0xf615:   ('4') + 0x80
;--------------------------------------
D_F616:                               ; XREF: 0xDE1A 
    DEFB 0xcd                         ;0xf616:   ('M') + 0x80
;--------------------------------------
D_F617:                               ; XREF: 0xD9C6 0xDDC6 0xD468 0xD9CA 0xDCF5 0xDDBC 0xC65C 
    DEFB 0xdd                         ;0xf617:   (']') + 0x80
;--------------------------------------
D_F618:                               ; XREF: 0xD148 0xD329 0xDD70 0xDCD6 0xD15B 
    DEFB 0xb                          ;0xf618:   0xb
;--------------------------------------
D_F619:                               ; XREF: 0xD2C2 0xD244 0xD248 0xCF2D 0xD2ED 0xCE56 0xE09F 
    DEFB 0xca                         ;0xf619:   ('J') + 0x80
    DEFB 0x4                          ;0xf61a:   0x4
;--------------------------------------
D_F61B:                               ; XREF: 0xCA6B 0xC8F1 0xC134 0xE097 0xE37B 
    DEFB 0x6                          ;0xf61b:   0x6
    DEFB 0x6                          ;0xf61c:   0x6
;--------------------------------------
D_F61D:                               ; XREF: 0xC170 0xE5CB 0xE5C3 0xC0AE 
    DEFB 0x8                          ;0xf61d:   0x8
;--------------------------------------
D_F61E:                               ; XREF: 0xE2C4 0xC07D 
    DEFB 0x90                         ;0xf61e:   0x90
    DEFB 0xca                         ;0xf61f:   ('J') + 0x80
;--------------------------------------
D_F620:                               ; XREF: 0xC240 0xECC2 0xECE6 0xC24A 0xE6EA 0xED4B 0xECB0 0xE6D5 
    DEFB 0xf9                         ;0xf620:   ('y') + 0x80
;--------------------------------------
C_F621:                               ; XREF: 0xEB38 
    DEFB 0x5                          ;0xf621:   0x5
    LD B,1                            ;0xf622:   06 01  ".."  
    NOP                               ;0xf624:   00  "." 
    PUSH BC                           ;0xf625:   c5  "." 
    CALL 0x87a                        ;0xf626:   cd 7a 08  ".z." 
    CALL 0x7e4                        ;0xf629:   cd e4 07  "..." 
    POP AF                            ;0xf62c:   f1  "." 
    CALL 0x87a                        ;0xf62d:   cd 7a 08  ".z." 
    CALL 0x7e4                        ;0xf630:   cd e4 07  "..." 
    JP 0xc3a                          ;0xf633:   c3 3a 0c  ".:." 
    CP 0x20                           ;0xf636:   fe 20  ". " 
    JP nz, 0x5e8                      ;0xf638:   c2 e8 05  "..." 
    CALL 0xc36                        ;0xf63b:   cd 36 0c  ".6." 
    LD A,(0xdac)                      ;0xf63e:   3a ac 0d  ":.."  
    SUB 1                             ;0xf641:   d6 01  ".." 
    JP c, 0x625                       ;0xf643:   da 25 06  ".%." 
    LD (0xd70),A                      ;0xf646:   32 70 0d  "2p."  
    LD B,0xb0                         ;0xf649:   06 b0  ".."  
    CALL 0xbf9                        ;0xf64b:   cd f9 0b  "..." 
    CALL 0x986                        ;0xf64e:   cd 86 09  "..." 
    LD A,(0xdad)                      ;0xf651:   3a ad 0d  ":.."  
    DEC A                             ;0xf654:   3d  "=" 
    RET m                             ;0xf655:   f8  "." 
    PUSH AF                           ;0xf656:   f5  "." 
    CALL 0x980                        ;0xf657:   cd 80 09  "..." 
    POP AF                            ;0xf65a:   f1  "." 
    LD (0xd72),A                      ;0xf65b:   32 72 0d  "2r."  
    LD B,0xaf                         ;0xf65e:   06 af  ".."  
    JP 0xbf9                          ;0xf660:   c3 f9 0b  "..." 
    DEFB "DIR TYPE ERASE RENAME DIRSYS USER "  ;0xf663:   0xf663 to 0xf685
    DEFB 0x1                          ;0xf685:   0x1
;--------------------------------------
D_F686:                               ; XREF: 0xC2A8 
    DEFB 0x0                          ;0xf686:   0x0
;--------------------------------------
C_F687:                               ; XREF: 0xF684 
    LD (HL),L                         ;0xf687:   75  "u" 
    LD B,0xf4                         ;0xf688:   06 f4  ".."  
    LD B,0x22                         ;0xf68a:   06 22  ".""  
    RLCA                              ;0xf68c:   07  "." 
    LD D,C                            ;0xf68d:   51  "Q" 
    RLCA                              ;0xf68e:   07  "." 
    LD A,L                            ;0xf68f:   7d  "}" 
    LD B,0x15                         ;0xf690:   06 15  ".."  
    RLCA                              ;0xf692:   07  "." 
    LD A,(0x15c)                      ;0xf693:   3a 5c 01  ":\."  
    NOP                               ;0xf696:   00  "." 
    DEC A                             ;0xf697:   3d  "=" 
    JP p, 0x670                       ;0xf698:   f2 70 06  ".p." 
    LD A,(0xd72)                      ;0xf69b:   3a 72 0d  ":r."  
    ADD A,0x41                        ;0xf69e:   c6 41  ".A" 
    JP 0xca6                          ;0xf6a0:   c3 a6 0c  "..." 
    LD C,1                            ;0xf6a3:   0e 01  ".."  
    NOP                               ;0xf6a5:   00  "." 
    LD DE,0xd52                       ;0xf6a6:   11 52 0d  ".R."  
    JP 0x682                          ;0xf6a9:   c3 82 06  "..." 
    LD C,0x80                         ;0xf6ac:   0e 80  ".."  
    LD DE,0xd4e                       ;0xf6ae:   11 4e 0d  ".N."  
    PUSH DE                           ;0xf6b1:   d5  "." 
;--------------------------------------
C_F6B2:                               ; XREF: 0xF66B 
    CALL 0x403                        ;0xf6b2:   cd 03 04  "..." 
    POP DE                            ;0xf6b5:   d1  "." 
    JP z, 0x7b8                       ;0xf6b6:   ca b8 07  "..." 
    LD A,L                            ;0xf6b9:   7d  "}" 
    CP B                              ;0xf6ba:   b8  "." 
    CALL nc, 0xc09                    ;0xf6bb:   d4 09 0c  "..." 
;--------------------------------------
C_F6BE:                               ; XREF: 0xF678 
    LD HL,0xd4d                       ;0xf6be:   21 4d 0d  "!M."  
    DEC (HL)                          ;0xf6c1:   35  "5" 
    INC (HL)                          ;0xf6c2:   34  "4" 
;--------------------------------------
C_F6C3:                               ; XREF: 0xC220 
    RET z                             ;0xf6c3:   c8  "." 
    DEC (HL)                          ;0xf6c4:   35  "5" 
;--------------------------------------
C_F6C5:                               ; XREF: 0xF671 
    JP 0xc05                          ;0xf6c5:   c3 05 0c  "..." 
;--------------------------------------
C_F6C8:                               ; XREF: 0xC228 
    PUSH BC                           ;0xf6c8:   c5  "." 
    CALL 0x978                        ;0xf6c9:   cd 78 09  ".x." 
    CALL 0xad8                        ;0xf6cc:   cd d8 0a  "..." 
    LD DE,0x15d                       ;0xf6cf:   11 5d 01  ".]."  
    NOP                               ;0xf6d2:   00  "." 
    LD A,(DE)                         ;0xf6d3:   1a  "." 
    CP 0x20                           ;0xf6d4:   fe 20  ". " 
;--------------------------------------
C_F6D6:                               ; XREF: 0xF67F 
    LD B,11                           ;0xf6d6:   06 0b  ".."  
;--------------------------------------
C_F6D8:                               ; XREF: 0xC23A 
    CALL z, 0xcb5                     ;0xf6d8:   cc b5 0c  "..." 
    CALL 0xc36                        ;0xf6db:   cd 36 0c  ".6." 
    CALL 0x9c3                        ;0xf6de:   cd c3 09  "..." 
    POP BC                            ;0xf6e1:   c1  "." 
    RET z                             ;0xf6e2:   c8  "." 
    LD A,(0xd97)                      ;0xf6e3:   3a 97 0d  ":.."  
    LD L,A                            ;0xf6e6:   6f  "o" 
    LD B,A                            ;0xf6e7:   47  "G" 
    INC B                             ;0xf6e8:   04  "." 
    PUSH HL                           ;0xf6e9:   e5  "." 
    LD HL,0x10a                       ;0xf6ea:   21 0a 01  "!.."  
    NOP                               ;0xf6ed:   00  "." 
    ADD HL,DE                         ;0xf6ee:   19  "." 
    LD A,(HL)                         ;0xf6ef:   7e  "~" 
    POP HL                            ;0xf6f0:   e1  "." 
    AND 0x80                          ;0xf6f1:   e6 80  ".." 
    CP C                              ;0xf6f3:   b9  "." 
    JP z, 0x6ce                       ;0xf6f4:   ca ce 06  "..." 
    LD A,1                            ;0xf6f7:   3e 01  ">."  
    LD (0xd4d),A                      ;0xf6f9:   32 4d 0d  "2M."  
    JP 0x6e5                          ;0xf6fc:   c3 e5 06  "..." 
    DEC B                             ;0xf6ff:   05  "." 
    CALL z, 0xc08                     ;0xf700:   cc 08 0c  "..." 
    LD A,B                            ;0xf703:   78  "x" 
    CP L                              ;0xf704:   bd  "." 
    CALL z, 0x666                     ;0xf705:   cc 66 06  ".f." 
    LD A,0x3a                         ;0xf708:   3e 3a  ">:"  
    CALL 0xca6                        ;0xf70a:   cd a6 0c  "..." 
    CALL 0xca4                        ;0xf70d:   cd a4 0c  "..." 
;--------------------------------------
C_F710:                               ; XREF: 0xC177 
    CALL 0xc8d                        ;0xf710:   cd 8d 0c  "..." 
    CALL 0xca4                        ;0xf713:   cd a4 0c  "..." 
    PUSH BC                           ;0xf716:   c5  "." 
    PUSH HL                           ;0xf717:   e5  "." 
    CALL 0x966                        ;0xf718:   cd 66 09  ".f." 
    CALL 0x9c8                        ;0xf71b:   cd c8 09  "..." 
    POP HL                            ;0xf71e:   e1  "." 
    POP BC                            ;0xf71f:   c1  "." 
    JP nz, 0x6b9                      ;0xf720:   c2 b9 06  "..." 
    INC A                             ;0xf723:   3c  "<" 
    RET                               ;0xf724:   c9  "." 
    LD HL,0x506                       ;0xf725:   21 06 05  "!.."  
    PUSH HL                           ;0xf728:   e5  "." 
    CALL 0xad8                        ;0xf729:   cd d8 0a  "..." 
    LD A,0x7f                         ;0xf72c:   3e 7f  ">."  
    LD (0xd9f),A                      ;0xf72e:   32 9f 0d  "2.."  
    LD C,15                           ;0xf731:   0e 0f  ".."  
    CALL 0x76c                        ;0xf733:   cd 6c 07  ".l." 
    CALL 0x966                        ;0xf736:   cd 66 09  ".f." 
    CALL 0xbc4                        ;0xf739:   cd c4 0b  "..." 
    RET nz                            ;0xf73c:   c0  "." 
    CP 0x1a                           ;0xf73d:   fe 1a  ".." 
    RET z                             ;0xf73f:   c8  "." 
    CALL 0x916                        ;0xf740:   cd 16 09  "..." 
    JP 0x705                          ;0xf743:   c3 05 07  "..." 
    LD DE,0xcf3                       ;0xf746:   11 f3 0c  "..."  
    CALL 0x7ab                        ;0xf749:   cd ab 07  "..." 
    CALL 0xc52                        ;0xf74c:   cd 52 0c  ".R." 
    RET z                             ;0xf74f:   c8  "." 
    JP 0x61a                          ;0xf750:   c3 1a 06  "..." 
;--------------------------------------
C_F753:                               ; XREF: 0xC26D 
    CALL 0xad8                        ;0xf753:   cd d8 0a  "..." 
    JP z, 0x74c                       ;0xf756:   ca 4c 07  ".L." 
    CALL 0x79e                        ;0xf759:   cd 9e 07  "..." 
    JP nz, 0x74c                      ;0xf75c:   c2 4c 07  ".L." 
    LD DE,0xd14                       ;0xf75f:   11 14 0d  "..."  
    CALL 0x949                        ;0xf762:   cd 49 09  ".I." 
    LD HL,(0xd9b)                     ;0xf765:   2a 9b 0d  "*.."  
    LD C,0x20                         ;0xf768:   0e 20  ". "  
;--------------------------------------
C_F76A:                               ; XREF: 0xC1CF 
    CALL 0xc2a                        ;0xf76a:   cd 2a 0c  ".*." 
    LD DE,0xd1b                       ;0xf76d:   11 1b 0d  "..."  
;--------------------------------------
D_F770:                               ; XREF: 0xC1BD 
    DEFB 0xcd                         ;0xf770:   ('M') + 0x80
    DEFB 0x41                         ;0xf771:   "A"
    DEFB 0x9                          ;0xf772:   0x9
    DEFB 0xcd                         ;0xf773:   ('M') + 0x80
    DEFB 0x9                          ;0xf774:   0x9
    DEFB 0xc                          ;0xf775:   0xc
    DEFB 0x7d                         ;0xf776:   "}"
;--------------------------------------
C_F777:                               ; XREF: 0xC28B 
    AND 0x5f                          ;0xf777:   e6 5f  "._" 
    CP 0x59                           ;0xf779:   fe 59  ".Y" 
    RET nz                            ;0xf77b:   c0  "." 
    OR A                              ;0xf77c:   b7  "." 
    LD C,0x13                         ;0xf77d:   0e 13  ".."  
    JP 0x76c                          ;0xf77f:   c3 6c 07  ".l." 
    CALL 0xad8                        ;0xf782:   cd d8 0a  "..." 
    PUSH AF                           ;0xf785:   f5  "." 
    LD HL,0x110                       ;0xf786:   21 10 01  "!.."  
    NOP                               ;0xf789:   00  "." 
    ADD HL,DE                         ;0xf78a:   19  "." 
    EX DE,HL                          ;0xf78b:   eb  "." 
    PUSH DE                           ;0xf78c:   d5  "." 
;--------------------------------------
D_F78D:                               ; XREF: 0xC0F4 
    DEFB 0xe5                         ;0xf78d:   ('e') + 0x80
    DEFB 0xe                          ;0xf78e:   0xe
    DEFB 0x10                         ;0xf78f:   0x10
    DEFB 0xcd                         ;0xf790:   ('M') + 0x80
    DEFB 0xae                         ;0xf791:   ('.') + 0x80
    DEFB 0xb                          ;0xf792:   0xb
    DEFB 0xcd                         ;0xf793:   ('M') + 0x80
;--------------------------------------
C_F794:                               ; XREF: 0xC2A2 
    RET c                             ;0xf794:   d8  "." 
    LD A,(BC)                         ;0xf795:   0a  "." 
    POP HL                            ;0xf796:   e1  "." 
    POP DE                            ;0xf797:   d1  "." 
    CALL 0x792                        ;0xf798:   cd 92 07  "..." 
    LD C,0x17                         ;0xf79b:   0e 17  ".."  
    POP AF                            ;0xf79d:   f1  "." 
    PUSH AF                           ;0xf79e:   f5  "." 
    CALL nz, 0xc36                    ;0xf79f:   c4 36 0c  ".6." 
    POP AF                            ;0xf7a2:   f1  "." 
    LD DE,0x15c                       ;0xf7a3:   11 5c 01  ".\."  
    NOP                               ;0xf7a6:   00  "." 
    LD B,0xff                         ;0xf7a7:   06 ff  ".."  
    LD H,1                            ;0xf7a9:   26 01  "&."  
    CALL nz, 0x991                    ;0xf7ab:   c4 91 09  "..." 
    RET nz                            ;0xf7ae:   c0  "." 
    DEC H                             ;0xf7af:   25  "%" 
;--------------------------------------
C_F7B0:                               ; XREF: 0xC107 
    JP m, 0x7b8                       ;0xf7b0:   fa b8 07  "..." 
    LD HL,(0xd9d)                     ;0xf7b3:   2a 9d 0d  "*.."  
    LD (0xd6c),HL                     ;0xf7b6:   22 6c 0d  ""l."  
    CALL 0x7e4                        ;0xf7b9:   cd e4 07  "..." 
    CALL 0xc8d                        ;0xf7bc:   cd 8d 0c  "..." 
    LD DE,0xd0a                       ;0xf7bf:   11 0a 0d  "..."  
    JP 0x7bb                          ;0xf7c2:   c3 bb 07  "..." 
    LD A,(DE)                         ;0xf7c5:   1a  "." 
    CP (HL)                           ;0xf7c6:   be  "." 
;--------------------------------------
C_F7C7:                               ; XREF: 0xC123 
    RET z                             ;0xf7c7:   c8  "." 
    OR A                              ;0xf7c8:   b7  "." 
    RET z                             ;0xf7c9:   c8  "." 
    INC (HL)                          ;0xf7ca:   34  "4" 
;--------------------------------------
C_F7CB:                               ; XREF: 0xC128 
    DEC (HL)                          ;0xf7cb:   35  "5" 
    JP nz, 0xc3a                      ;0xf7cc:   c2 3a 0c  ".:." 
;--------------------------------------
C_F7CF:                               ; XREF: 0xC11E 
    LD (HL),A                         ;0xf7cf:   77  "w" 
    RET                               ;0xf7d0:   c9  "." 
    LD B,11                           ;0xf7d1:   06 0b  ".."  
    INC DE                            ;0xf7d3:   13  "." 
    LD A,(DE)                         ;0xf7d4:   1a  "." 
    CP 0x3f                           ;0xf7d5:   fe 3f  ".?" 
    RET z                             ;0xf7d7:   c8  "." 
    DEC B                             ;0xf7d8:   05  "." 
    JP nz, 0x7a0                      ;0xf7d9:   c2 a0 07  "..." 
    DEC B                             ;0xf7dc:   05  "." 
    RET                               ;0xf7dd:   c9  "." 
    CALL 0xa41                        ;0xf7de:   cd 41 0a  ".A." 
    RET nz                            ;0xf7e1:   c0  "." 
    CALL 0x949                        ;0xf7e2:   cd 49 09  ".I." 
    CALL 0x94e                        ;0xf7e5:   cd 4e 09  ".N." 
    JP 0x9f6                          ;0xf7e8:   c3 f6 09  "..." 
    LD DE,0xd02                       ;0xf7eb:   11 02 0d  "..."  
    CALL 0xc05                        ;0xf7ee:   cd 05 0c  "..." 
    JP 0x50c                          ;0xf7f1:   c3 0c 05  "..." 
    LD BC,0x5300                      ;0xf7f4:   01 00 53  "..S"  
    DEFB "UBMIT", 0x42                ;0xf7f7:   0xf7f7 to 0xf7f8
    DEFB " COM", 0x43                 ;0xf7fd:   0xf7fd to 0xf7fe
    DEFB 0x6                          ;0xf802:   0x6
    DEFB 0xab                         ;0xf803:   
    DEFB 0xcd                         ;0xf804:   
    DEFB 0xf9                         ;0xf805:   
    DEFB 0xb                          ;0xf806:   0xb
    DEFB 0x21                         ;0xf807:   
    DEFB 0xc1                         ;0xf808:   
    DEFB 0x7                          ;0xf809:   0x7
    DEFB 0xe                          ;0xf80a:   0xe
    DEFB 0xc                          ;0xf80b:   0xc
    DEFB 0xcd                         ;0xf80c:   
    DEFB 0xae                         ;0xf80d:   
    DEFB 0xb                          ;0xf80e:   0xb
    DEFB 0x21                         ;0xf80f:   
    DEFB 0xf5                         ;0xf810:   
    DEFB 0xd                          ;0xf811:   
    DEFB 0x36                         ;0xf812:   
;--------------------------------------
C_F813:                               ; XREF: 0xC15C 
    JR nz, $+37                       ;0xf813:   20 23  " #" 
    LD (0xd6c),HL                     ;0xf815:   22 6c 0d  ""l."  
    LD DE,0xdb6                       ;0xf818:   11 b6 0d  "..."  
    LD HL,0x863                       ;0xf81b:   21 63 08  "!c."  
;--------------------------------------
C_F81E:                               ; XREF: 0xF7FC 
    CALL 0xcbf                        ;0xf81e:   cd bf 0c  "..." 
    RET nz                            ;0xf821:   c0  "." 
    LD DE,0xdac                       ;0xf822:   11 ac 0d  "..."  
    LD A,(DE)                         ;0xf825:   1a  "." 
    OR A                              ;0xf826:   b7  "." 
    RET nz                            ;0xf827:   c0  "." 
    INC DE                            ;0xf828:   13  "." 
    LD A,(DE)                         ;0xf829:   1a  "." 
    LD C,A                            ;0xf82a:   4f  "O" 
    PUSH BC                           ;0xf82b:   c5  "." 
    LD C,1                            ;0xf82c:   0e 01  ".."  
    NOP                               ;0xf82e:   00  "." 
    OR A                              ;0xf82f:   b7  "." 
    JP nz, 0x821                      ;0xf830:   c2 21 08  ".!." 
    LD BC,D_E704                      ;0xf833:   01 04 e7  "..."  
    LD A,(0xd72)                      ;0xf836:   3a 72 0d  ":r."  
    INC A                             ;0xf839:   3c  "<" 
    LD H,A                            ;0xf83a:   67  "g" 
    LD L,1                            ;0xf83b:   2e 01  ".."  
    INC B                             ;0xf83d:   04  "." 
    DEC C                             ;0xf83e:   0d  "." 
    LD A,C                            ;0xf83f:   79  "y" 
;--------------------------------------
C_F840:                               ; XREF: 0xC092 
    PUSH HL                           ;0xf840:   e5  "." 
    CALL p, 0xbff                     ;0xf841:   f4 ff 0b  "..." 
    POP HL                            ;0xf844:   e1  "." 
    OR A                              ;0xf845:   b7  "." 
    JP m, 0x876                       ;0xf846:   fa 76 08  ".v." 
    JP z, 0x81b                       ;0xf849:   ca 1b 08  "..." 
    CP H                              ;0xf84c:   bc  "." 
    JP nz, 0x820                      ;0xf84d:   c2 20 08  ". ." 
    LD A,H                            ;0xf850:   7c  "|" 
    DEC L                             ;0xf851:   2d  "-" 
    JP m, 0x808                       ;0xf852:   fa 08 08  "..." 
    LD (DE),A                         ;0xf855:   12  "." 
    PUSH BC                           ;0xf856:   c5  "." 
    PUSH HL                           ;0xf857:   e5  "." 
    CALL 0x98b                        ;0xf858:   cd 8b 09  "..." 
    POP HL                            ;0xf85b:   e1  "." 
;--------------------------------------
C_F85C:                               ; XREF: 0xC0A6 
    POP BC                            ;0xf85c:   c1  "." 
    JP z, 0x808                       ;0xf85d:   ca 08 08  "..." 
    LD BC,0xb403                      ;0xf860:   01 03 b4  "..."  
    CALL 0xbdd                        ;0xf863:   cd dd 0b  "..." 
    JP z, 0x854                       ;0xf866:   ca 54 08  ".T." 
    LD A,(DE)                         ;0xf869:   1a  "." 
    CALL 0x669                        ;0xf86a:   cd 69 06  ".i." 
    LD A,0x3a                         ;0xf86d:   3e 3a  ">:"  
    CALL 0xca6                        ;0xf86f:   cd a6 0c  "..." 
    PUSH DE                           ;0xf872:   d5  "." 
    CALL 0xc8d                        ;0xf873:   cd 8d 0c  "..." 
    POP DE                            ;0xf876:   d1  "." 
    PUSH DE                           ;0xf877:   d5  "." 
    LD HL,0x108                       ;0xf878:   21 08 01  "!.."  
    NOP                               ;0xf87b:   00  "." 
    ADD HL,DE                         ;0xf87c:   19  "." 
    LD A,(HL)                         ;0xf87d:   7e  "~" 
    AND 0x80                          ;0xf87e:   e6 80  ".." 
    LD DE,0xd42                       ;0xf880:   11 42 0d  ".B."  
    CALL nz, 0x949                    ;0xf883:   c4 49 09  ".I." 
    CALL 0xc09                        ;0xf886:   cd 09 0c  "..." 
    POP DE                            ;0xf889:   d1  "." 
    POP AF                            ;0xf88a:   f1  "." 
    LD HL,0x870                       ;0xf88b:   21 70 08  "!p."  
    ADD A,A                           ;0xf88e:   87  "." 
    CALL 0xcb0                        ;0xf88f:   cd b0 0c  "..." 
    PUSH DE                           ;0xf892:   d5  "." 
    LD E,(HL)                         ;0xf893:   5e  "^" 
    INC HL                            ;0xf894:   23  "#" 
    LD D,(HL)                         ;0xf895:   56  "V" 
    EX DE,HL                          ;0xf896:   eb  "." 
    POP DE                            ;0xf897:   d1  "." 
    JP (HL)                           ;0xf898:   e9  "." 
    DEFB "COM SUB PRL "               ;0xf899:   0xf899 to 0xf8a5
    DEFB 0x1                          ;0xf8a5:   0x1
    DEFB 0x0                          ;0xf8a6:   
;--------------------------------------
C_F8A7:                               ; XREF: 0xF8A4 
    ADC A,C                           ;0xf8a7:   89  "." 
    EX AF,AF'                         ;0xf8a8:   08  "." 
    CALL 0x8907                       ;0xf8a9:   cd 07 89  "..." 
    EX AF,AF'                         ;0xf8ac:   08  "." 
    POP BC                            ;0xf8ad:   c1  "." 
    LD A,C                            ;0xf8ae:   79  "y" 
    LD (DE),A                         ;0xf8af:   12  "." 
    RET                               ;0xf8b0:   c9  "." 
    RRCA                              ;0xf8b1:   0f  "." 
    LD HL,0x863                       ;0xf8b2:   21 63 08  "!c."  
    CALL 0xcb0                        ;0xf8b5:   cd b0 0c  "..." 
    LD DE,0xdb6                       ;0xf8b8:   11 b6 0d  "..."  
    LD C,3                            ;0xf8bb:   0e 03  ".."  
    JP 0xbae                          ;0xf8bd:   c3 ae 0b  "..." 
    LD HL,1                           ;0xf8c0:   21 01 00  "!.."  
    LD BC,D_CE22                      ;0xf8c3:   01 22 ce  "."."  
    DEC C                             ;0xf8c6:   0d  "." 
    LD HL,(0xd9f)                     ;0xf8c7:   2a 9f 0d  "*.."  
    DEC H                             ;0xf8ca:   25  "%" 
;--------------------------------------
D_F8CB:                               ; XREF: 0xC29C 
    DEFB 0x2e                         ;0xf8cb:   "."
    DEFB 0xc0                         ;0xf8cc:   ('@') + 0x80
    DEFB 0xe5                         ;0xf8cd:   ('e') + 0x80
    DEFB 0x1a                         ;0xf8ce:   0x1a
    DEFB 0x32                         ;0xf8cf:   "2"
    DEFB 0x50                         ;0xf8d0:   "P"
    DEFB 0x1                          ;0xf8d1:   0x1
    DEFB 0x0                          ;0xf8d2:   0x0
    DEFB 0xeb                         ;0xf8d3:   ('k') + 0x80
    DEFB 0xe                          ;0xf8d4:   0xe
;--------------------------------------
C_F8D5:                               ; XREF: 0xC080 
    INC HL                            ;0xf8d5:   23  "#" 
    CALL 0xbae                        ;0xf8d6:   cd ae 0b  "..." 
    LD HL,0xd67                       ;0xf8d9:   21 67 0d  "!g."  
    INC (HL)                          ;0xf8dc:   34  "4" 
    LD HL,(0xd6c)                     ;0xf8dd:   2a 6c 0d  "*l."  
    DEC HL                            ;0xf8e0:   2b  "+" 
    LD DE,0x181                       ;0xf8e1:   11 81 01  "..."  
    NOP                               ;0xf8e4:   00  "." 
    EX DE,HL                          ;0xf8e5:   eb  "." 
    LD (0xd6c),HL                     ;0xf8e6:   22 6c 0d  ""l."  
    CALL 0xbb7                        ;0xf8e9:   cd b7 0b  "..." 
    LD (0x180),A                      ;0xf8ec:   32 80 01  "2.."  
    NOP                               ;0xf8ef:   00  "." 
    CALL 0xad8                        ;0xf8f0:   cd d8 0a  "..." 
    LD (0x151),HL                     ;0xf8f3:   22 51 01  ""Q."  
    NOP                               ;0xf8f6:   00  "." 
    LD A,B                            ;0xf8f7:   78  "x" 
    LD (0x153),A                      ;0xf8f8:   32 53 01  "2S."  
    NOP                               ;0xf8fb:   00  "." 
    LD DE,0x16c                       ;0xf8fc:   11 6c 01  ".l."  
    NOP                               ;0xf8ff:   00  "." 
    CALL 0xadb                        ;0xf900:   cd db 0a  "..." 
    LD (0x154),HL                     ;0xf903:   22 54 01  ""T."  
    NOP                               ;0xf906:   00  "." 
    LD A,B                            ;0xf907:   78  "x" 
    LD (0x156),A                      ;0xf908:   32 56 01  "2V."  
    NOP                               ;0xf90b:   00  "." 
    LD HL,0xd71                       ;0xf90c:   21 71 0d  "!q."  
    LD A,(HL)                         ;0xf90f:   7e  "~" 
    OR A                              ;0xf910:   b7  "." 
    CALL p, 0x980                     ;0xf911:   f4 80 09  "..." 
    LD A,(0xd70)                      ;0xf914:   3a 70 0d  ":p."  
    CALL 0x986                        ;0xf917:   cd 86 09  "..." 
    ADD A,A                           ;0xf91a:   87  "." 
    ADD A,A                           ;0xf91b:   87  "." 
    ADD A,A                           ;0xf91c:   87  "." 
    ADD A,A                           ;0xf91d:   87  "." 
    LD L,0xda                         ;0xf91e:   2e da  ".."  
    OR (HL)                           ;0xf920:   b6  "." 
    LD (0x104),A                      ;0xf921:   32 04 01  "2.."  
    NOP                               ;0xf924:   00  "." 
    POP DE                            ;0xf925:   d1  "." 
    LD HL,(0xd9f)                     ;0xf926:   2a 9f 0d  "*.."  
    XOR A                             ;0xf929:   af  "." 
    LD L,A                            ;0xf92a:   6f  "o" 
    LD SP,HL                          ;0xf92b:   f9  "." 
    LD H,A                            ;0xf92c:   67  "g" 
    PUSH HL                           ;0xf92d:   e5  "." 
    INC H                             ;0xf92e:   24  "$" 
    PUSH HL                           ;0xf92f:   e5  "." 
    LD (0x17c),A                      ;0xf930:   32 7c 01  "2|."  
    NOP                               ;0xf933:   00  "." 
    LD B,0xcf                         ;0xf934:   06 cf  ".."  
    CALL 0xbf9                        ;0xf936:   cd f9 0b  "..." 
    LD L,0x90                         ;0xf939:   2e 90  ".."  
    LD (HL),A                         ;0xf93b:   77  "w" 
    INC HL                            ;0xf93c:   23  "#" 
    LD (HL),A                         ;0xf93d:   77  "w" 
    INC HL                            ;0xf93e:   23  "#" 
    LD (HL),A                         ;0xf93f:   77  "w" 
    INC HL                            ;0xf940:   23  "#" 
    LD (HL),A                         ;0xf941:   77  "w" 
    LD L,0xb3                         ;0xf942:   2e b3  ".."  
    LD A,(HL)                         ;0xf944:   7e  "~" 
    AND 0x80                          ;0xf945:   e6 80  ".." 
    JP nz, 0x90d                      ;0xf947:   c2 0d 09  "..." 
    LD L,0xac                         ;0xf94a:   2e ac  ".."  
    LD (HL),A                         ;0xf94c:   77  "w" 
    INC HL                            ;0xf94d:   23  "#" 
    LD (HL),A                         ;0xf94e:   77  "w" 
    LD A,(HL)                         ;0xf94f:   7e  "~" 
    AND 0x3f                          ;0xf950:   e6 3f  ".?" 
    LD (HL),A                         ;0xf952:   77  "w" 
    LD C,0x3b                         ;0xf953:   0e 3b  ".;"  
    JP 0x105                          ;0xf955:   c3 05 01  "..." 
    NOP                               ;0xf958:   00  "." 
    CP 10                             ;0xf959:   fe 0a  ".." 
    JP nz, 0x93b                      ;0xf95b:   c2 3b 09  ".;." 
    LD HL,0xd98                       ;0xf95e:   21 98 0d  "!.."  
    LD A,(HL)                         ;0xf961:   7e  "~" 
    INC HL                            ;0xf962:   23  "#" 
    INC (HL)                          ;0xf963:   34  "4" 
    SUB (HL)                          ;0xf964:   96  "." 
    JP nz, 0x939                      ;0xf965:   c2 39 09  ".9." 
    LD (HL),A                         ;0xf968:   77  "w" 
    INC HL                            ;0xf969:   23  "#" 
    LD A,(HL)                         ;0xf96a:   7e  "~" 
    OR A                              ;0xf96b:   b7  "." 
    LD DE,0xd24                       ;0xf96c:   11 24 0d  ".$."  
    CALL z, 0x941                     ;0xf96f:   cc 41 09  ".A." 
    CP 3                              ;0xf972:   fe 03  ".." 
    JP z, 0x506                       ;0xf974:   ca 06 05  "..." 
    LD E,13                           ;0xf977:   1e 0d  ".."  
    CALL 0x93c                        ;0xf979:   cd 3c 09  ".<." 
    LD A,10                           ;0xf97c:   3e 0a  ">."  
    LD E,A                            ;0xf97e:   5f  "_" 
    LD C,2                            ;0xf97f:   0e 02  ".."  
    JP 0x105                          ;0xf981:   c3 05 01  "..." 
    NOP                               ;0xf984:   00  "." 
    CALL 0x949                        ;0xf985:   cd 49 09  ".I." 
    LD C,1                            ;0xf988:   0e 01  ".."  
    JP 0x105                          ;0xf98a:   c3 05 01  "..." 
    NOP                               ;0xf98d:   00  "." 
    LD C,9                            ;0xf98e:   0e 09  ".."  
    JP 0x105                          ;0xf990:   c3 05 01  "..." 
    NOP                               ;0xf993:   00  "." 
    LD HL,0xdf4                       ;0xf994:   21 f4 0d  "!.."  
    LD (HL),0xe7                      ;0xf997:   36 e7  "6."  
    EX DE,HL                          ;0xf999:   eb  "." 
    LD C,10                           ;0xf99a:   0e 0a  ".."  
    CALL 0x105                        ;0xf99c:   cd 05 01  "..." 
    NOP                               ;0xf99f:   00  "." 
    LD HL,0xdf5                       ;0xf9a0:   21 f5 0d  "!.."  
    LD A,(HL)                         ;0xf9a3:   7e  "~" 
    INC HL                            ;0xf9a4:   23  "#" 
    CALL 0xcb0                        ;0xf9a5:   cd b0 0c  "..." 
    LD (HL),1                         ;0xf9a8:   36 01  "6."  
    NOP                               ;0xf9aa:   00  "." 
    JP 0xc09                          ;0xf9ab:   c3 09 0c  "..." 
    CALL 0x96d                        ;0xf9ae:   cd 6d 09  ".m." 
    RET z                             ;0xf9b1:   c8  "." 
    JP 0x506                          ;0xf9b2:   c3 06 05  "..." 
    DEFB 0xe                          ;0xf9b5:   0xe
    DEFB 0xb                          ;0xf9b6:   0xb
    DEFB 0xcd                         ;0xf9b7:   ('M') + 0x80
    DEFB 0xeb                         ;0xf9b8:   ('k') + 0x80
    DEFB 0x9                          ;0xf9b9:   0x9
    DEFB 0xc8                         ;0xf9ba:   ('H') + 0x80
    DEFB 0xe                          ;0xf9bb:   0xe
    DEFB 0x1                          ;0xf9bc:   0x1
    DEFB 0xc3                         ;0xf9bd:   ('C') + 0x80
    DEFB 0xeb                         ;0xf9be:   ('k') + 0x80
    DEFB 0x9                          ;0xf9bf:   0x9
    DEFB 0x11                         ;0xf9c0:   0x11
    DEFB 0x80                         ;0xf9c1:   0x80
    DEFB 0x1                          ;0xf9c2:   0x1
    DEFB 0x0                          ;0xf9c3:   0x0
    DEFB 0xe                          ;0xf9c4:   0xe
    DEFB 0x1a                         ;0xf9c5:   0x1a
    DEFB 0xc3                         ;0xf9c6:   ('C') + 0x80
    DEFB 0x5                          ;0xf9c7:   0x5
    DEFB 0x1                          ;0xf9c8:   0x1
    DEFB 0x0                          ;0xf9c9:   0x0
    DEFB 0x5f                         ;0xf9ca:   "_"
    DEFB 0xe                          ;0xf9cb:   0xe
    DEFB 0xe                          ;0xf9cc:   0xe
    DEFB 0xc3                         ;0xf9cd:   ('C') + 0x80
    DEFB 0x5                          ;0xf9ce:   0x5
    DEFB 0x1                          ;0xf9cf:   0x1
    DEFB 0x0                          ;0xf9d0:   0x0
    DEFB 0x6                          ;0xf9d1:   0x6
    DEFB 0xe0                         ;0xf9d2:   ('`') + 0x80
    DEFB 0xc3                         ;0xf9d3:   ('C') + 0x80
    DEFB 0xf9                         ;0xf9d4:   ('y') + 0x80
    DEFB 0xb                          ;0xf9d5:   0xb
    DEFB 0x1                          ;0xf9d6:   0x1
    DEFB 0xf                          ;0xf9d7:   0xf
    DEFB 0x1                          ;0xf9d8:   0x1
    DEFB 0x0                          ;0xf9d9:   0x0
    DEFB 0x11                         ;0xf9da:   0x11
    DEFB 0xad                         ;0xf9db:   ('-') + 0x80
    DEFB 0xd                          ;0xf9dc:   0xd
    DEFB 0x21                         ;0xf9dd:   "!"
    DEFB 0x20                         ;0xf9de:   " "
    DEFB 0x1                          ;0xf9df:   0x1
    DEFB 0x0                          ;0xf9e0:   0x0
    DEFB 0x19                         ;0xf9e1:   0x19
;--------------------------------------
D_F9E2:                               ; XREF: 0xC140 
    DEFB 0x36                         ;0xf9e2:   "6"
    DEFB 0x1                          ;0xf9e3:   0x1
    DEFB 0x0                          ;0xf9e4:   0x0
    DEFB 0xc5                         ;0xf9e5:   ('E') + 0x80
    DEFB 0xd5                         ;0xf9e6:   ('U') + 0x80
    DEFB 0x1a                         ;0xf9e7:   0x1a
    DEFB 0xa0                         ;0xf9e8:   (' ') + 0x80
    DEFB 0x3d                         ;0xf9e9:   "="
    DEFB 0xf4                         ;0xf9ea:   ('t') + 0x80
    DEFB 0x80                         ;0xf9eb:   0x80
    DEFB 0x9                          ;0xf9ec:   0x9
    DEFB 0x11                         ;0xf9ed:   0x11
    DEFB 0xa2                         ;0xf9ee:   ('"') + 0x80
    DEFB 0xd                          ;0xf9ef:   0xd
    DEFB 0xcd                         ;0xf9f0:   ('M') + 0x80
    DEFB 0x7b                         ;0xf9f1:   "{"
    DEFB 0x9                          ;0xf9f2:   0x9
    DEFB 0xd1                         ;0xf9f3:   ('Q') + 0x80
    DEFB 0xc1                         ;0xf9f4:   ('A') + 0x80
    DEFB 0xd5                         ;0xf9f5:   ('U') + 0x80
    DEFB 0x2a                         ;0xf9f6:   "*"
    DEFB 0x8d                         ;0xf9f7:   0x8d
    DEFB 0x3                          ;0xf9f8:   0x3
    DEFB 0x2e                         ;0xf9f9:   "."
    DEFB 0xe7                         ;0xf9fa:   ('g') + 0x80
    DEFB 0x70                         ;0xf9fb:   "p"
    DEFB 0xe5                         ;0xf9fc:   ('e') + 0x80
    DEFB 0xcd                         ;0xf9fd:   ('M') + 0x80
    DEFB 0x5                          ;0xf9fe:   0x5
    DEFB 0x1                          ;0xf9ff:   0x1
    DEFB 0x0                          ;0xfa00:   0x0
    DEFB 0xd1                         ;0xfa01:   ('Q') + 0x80
    DEFB 0xaf                         ;0xfa02:   ('/') + 0x80
    DEFB 0x12                         ;0xfa03:   0x12
    DEFB 0x3a                         ;0xfa04:   ":"
    DEFB 0x72                         ;0xfa05:   "r"
    DEFB 0xd                          ;0xfa06:   0xd
    DEFB 0x1e                         ;0xfa07:   0x1e
    DEFB 0xda                         ;0xfa08:   ('Z') + 0x80
    DEFB 0x12                         ;0xfa09:   0x12
    DEFB 0xe5                         ;0xfa0a:   ('e') + 0x80
    DEFB 0xcd                         ;0xfa0b:   ('M') + 0x80
    DEFB 0x78                         ;0xfa0c:   "x"
    DEFB 0x9                          ;0xfa0d:   0x9
    DEFB 0xe1                         ;0xfa0e:   ('a') + 0x80
    DEFB 0x2c                         ;0xfa0f:   ","
    DEFB 0xd1                         ;0xfa10:   ('Q') + 0x80
    DEFB 0xc9                         ;0xfa11:   ('I') + 0x80
    DEFB 0xe                          ;0xfa12:   0xe
    DEFB 0x11                         ;0xfa13:   0x11
    DEFB 0xc3                         ;0xfa14:   ('C') + 0x80
    DEFB 0xca                         ;0xfa15:   ('J') + 0x80
    DEFB 0x9                          ;0xfa16:   0x9
    DEFB 0xe                          ;0xfa17:   0xe
    DEFB 0x12                         ;0xfa18:   0x12
    DEFB 0x11                         ;0xfa19:   0x11
    DEFB 0x5c                         ;0xfa1a:   "\"
    DEFB 0x1                          ;0xfa1b:   0x1
    DEFB 0x0                          ;0xfa1c:   0x0
    DEFB 0xcd                         ;0xfa1d:   ('M') + 0x80
    DEFB 0x5                          ;0xfa1e:   0x5
    DEFB 0x1                          ;0xfa1f:   0x1
    DEFB 0x0                          ;0xfa20:   0x0
    DEFB 0x3c                         ;0xfa21:   "<"
    DEFB 0xc8                         ;0xfa22:   ('H') + 0x80
    DEFB 0x3d                         ;0xfa23:   "="
;--------------------------------------
D_FA24:                               ; XREF: 0xC1C1 0xC1AB 
    DEFB 0x87                         ;0xfa24:   0x87
;--------------------------------------
D_FA25:                               ; XREF: 0xC066 
    DEFB 0x87                         ;0xfa25:   0x87
    DEFB 0x87                         ;0xfa26:   0x87
    DEFB 0x87                         ;0xfa27:   0x87
;--------------------------------------
D_FA28:                               ; XREF: 0xC048 0xC292 
    DEFB 0x87                         ;0xfa28:   0x87
    DEFB 0x21                         ;0xfa29:   "!"
;--------------------------------------
D_FA2A:                               ; XREF: 0xC184 0xC089 0xC06C 0xC076 
    DEFB 0x80                         ;0xfa2a:   0x80
;--------------------------------------
D_FA2B:                               ; XREF: 0xC19D 
    DEFB 0x1                          ;0xfa2b:   0x1
;--------------------------------------
D_FA2C:                               ; XREF: 0xC17A 
    DEFB 0x0                          ;0xfa2c:   0x0
    DEFB 0xcd                         ;0xfa2d:   ('M') + 0x80
    DEFB 0xb0                         ;0xfa2e:   ('0') + 0x80
    DEFB 0xc                          ;0xfa2f:   0xc
    DEFB 0xeb                         ;0xfa30:   ('k') + 0x80
    DEFB 0xaf                         ;0xfa31:   ('/') + 0x80
    DEFB 0x3d                         ;0xfa32:   "="
    DEFB 0xc9                         ;0xfa33:   ('I') + 0x80
    DEFB 0xaf                         ;0xfa34:   ('/') + 0x80
    DEFB 0x32                         ;0xfa35:   "2"
    DEFB 0x9f                         ;0xfa36:   0x9f
    DEFB 0xd                          ;0xfa37:   0xd
    DEFB 0xe                          ;0xfa38:   0xe
    DEFB 0x14                         ;0xfa39:   0x14
    DEFB 0x11                         ;0xfa3a:   0x11
    DEFB 0x5c                         ;0xfa3b:   "\"
    DEFB 0x1                          ;0xfa3c:   0x1
    DEFB 0x0                          ;0xfa3d:   0x0
    DEFB 0xcd                         ;0xfa3e:   ('M') + 0x80
    DEFB 0x5                          ;0xfa3f:   0x5
    DEFB 0x1                          ;0xfa40:   0x1
    DEFB 0x0                          ;0xfa41:   0x0
    DEFB 0xb7                         ;0xfa42:   ('7') + 0x80
    DEFB 0xc9                         ;0xfa43:   ('I') + 0x80
    DEFB 0x11                         ;0xfa44:   0x11
    DEFB 0x73                         ;0xfa45:   "s"
    DEFB 0xd                          ;0xfa46:   0xd
    DEFB 0xc3                         ;0xfa47:   ('C') + 0x80
    DEFB 0xeb                         ;0xfa48:   ('k') + 0x80
    DEFB 0x9                          ;0xfa49:   0x9
    DEFB 0xcd                         ;0xfa4a:   ('M') + 0x80
    DEFB 0xee                         ;0xfa4b:   ('n') + 0x80
    DEFB 0xb                          ;0xfa4c:   0xb
    DEFB 0xeb                         ;0xfa4d:   ('k') + 0x80
;--------------------------------------
D_FA4E:                               ; XREF: 0xC0D2 0xC163 0xC0DF 
    DEFB 0xaf                         ;0xfa4e:   ('/') + 0x80
    DEFB 0x32                         ;0xfa4f:   "2"
    DEFB 0xa1                         ;0xfa50:   ('!') + 0x80
    DEFB 0xd                          ;0xfa51:   0xd
    DEFB 0x21                         ;0xfa52:   "!"
    DEFB 0xf6                         ;0xfa53:   ('v') + 0x80
    DEFB 0xd                          ;0xfa54:   0xd
    DEFB 0xcd                         ;0xfa55:   ('M') + 0x80
    DEFB 0x44                         ;0xfa56:   "D"
    DEFB 0xa                          ;0xfa57:   0xa
    DEFB 0xeb                         ;0xfa58:   ('k') + 0x80
    DEFB 0xfe                         ;0xfa59:   ('~') + 0x80
    DEFB 0x3b                         ;0xfa5a:   ";"
    DEFB 0xc8                         ;0xfa5b:   ('H') + 0x80
    DEFB 0xfe                         ;0xfa5c:   ('~') + 0x80
    DEFB 0x21                         ;0xfa5d:   "!"
    DEFB 0xca                         ;0xfa5e:   ('J') + 0x80
    DEFB 0x1c                         ;0xfa5f:   0x1c
    DEFB 0xa                          ;0xfa60:   0xa
    DEFB 0xfe                         ;0xfa61:   ('~') + 0x80
    DEFB 0x3a                         ;0xfa62:   ":"
    DEFB 0xc2                         ;0xfa63:   ('B') + 0x80
    DEFB 0x1d                         ;0xfa64:   0x1d
    DEFB 0xa                          ;0xfa65:   0xa
    DEFB 0x2e                         ;0xfa66:   "."
    DEFB 0xac                         ;0xfa67:   (',') + 0x80
    DEFB 0x34                         ;0xfa68:   "4"
    DEFB 0x34                         ;0xfa69:   "4"
    DEFB 0xca                         ;0xfa6a:   ('J') + 0x80
    DEFB 0x1c                         ;0xfa6b:   0x1c
    DEFB 0xa                          ;0xfa6c:   0xa
    DEFB 0x23                         ;0xfa6d:   "#"
    DEFB 0x34                         ;0xfa6e:   "4"
    DEFB 0xc8                         ;0xfa6f:   ('H') + 0x80
    DEFB 0x13                         ;0xfa70:   0x13
    DEFB 0xeb                         ;0xfa71:   ('k') + 0x80
    DEFB 0x22                         ;0xfa72:   """
    DEFB 0x6c                         ;0xfa73:   "l"
    DEFB 0xd                          ;0xfa74:   0xd
    DEFB 0x7e                         ;0xfa75:   "~"
    DEFB 0xfe                         ;0xfa76:   ('~') + 0x80
    DEFB 0x5b                         ;0xfa77:   "["
    DEFB 0xc2                         ;0xfa78:   ('B') + 0x80
    DEFB 0x2a                         ;0xfa79:   "*"
    DEFB 0xa                          ;0xfa7a:   0xa
    DEFB 0x32                         ;0xfa7b:   "2"
    DEFB 0xa1                         ;0xfa7c:   ('!') + 0x80
    DEFB 0xd                          ;0xfa7d:   0xd
    DEFB 0xfe                         ;0xfa7e:   ('~') + 0x80
    DEFB 0x61                         ;0xfa7f:   "a"
    DEFB 0xda                         ;0xfa80:   ('Z') + 0x80
    DEFB 0x37                         ;0xfa81:   "7"
    DEFB 0xa                          ;0xfa82:   0xa
    DEFB 0xfe                         ;0xfa83:   ('~') + 0x80
    DEFB 0x7b                         ;0xfa84:   "{"
    DEFB 0xd2                         ;0xfa85:   ('R') + 0x80
    DEFB 0x37                         ;0xfa86:   "7"
    DEFB 0xa                          ;0xfa87:   0xa
    DEFB 0xd6                         ;0xfa88:   ('V') + 0x80
    DEFB 0x20                         ;0xfa89:   " "
    DEFB 0x77                         ;0xfa8a:   "w"
    DEFB 0xfe                         ;0xfa8b:   ('~') + 0x80
    DEFB 0x21                         ;0xfa8c:   "!"
    DEFB 0xcc                         ;0xfa8d:   ('L') + 0x80
    DEFB 0x59                         ;0xfa8e:   "Y"
    DEFB 0xa                          ;0xfa8f:   0xa
    DEFB 0x23                         ;0xfa90:   "#"
    DEFB 0xb7                         ;0xfa91:   ('7') + 0x80
    DEFB 0xc2                         ;0xfa92:   ('B') + 0x80
    DEFB 0x21                         ;0xfa93:   "!"
    DEFB 0xa                          ;0xfa94:   0xa
    DEFB 0x2a                         ;0xfa95:   "*"
    DEFB 0x6c                         ;0xfa96:   "l"
    DEFB 0xd                          ;0xfa97:   0xd
    DEFB 0x22                         ;0xfa98:   """
    DEFB 0x6c                         ;0xfa99:   "l"
    DEFB 0xd                          ;0xfa9a:   0xd
    DEFB 0x22                         ;0xfa9b:   """
    DEFB 0x9b                         ;0xfa9c:   0x9b
    DEFB 0xd                          ;0xfa9d:   0xd
    DEFB 0x7e                         ;0xfa9e:   "~"
    DEFB 0xb7                         ;0xfa9f:   ('7') + 0x80
    DEFB 0xc8                         ;0xfaa0:   ('H') + 0x80
    DEFB 0xfe                         ;0xfaa1:   ('~') + 0x80
    DEFB 0x20                         ;0xfaa2:   " "
    DEFB 0xca                         ;0xfaa3:   ('J') + 0x80
    DEFB 0x55                         ;0xfaa4:   "U"
    DEFB 0xa                          ;0xfaa5:   0xa
    DEFB 0xfe                         ;0xfaa6:   ('~') + 0x80
    DEFB 0x9                          ;0xfaa7:   0x9
    DEFB 0xc0                         ;0xfaa8:   ('@') + 0x80
    DEFB 0x23                         ;0xfaa9:   "#"
    DEFB 0xc3                         ;0xfaaa:   ('C') + 0x80
    DEFB 0x44                         ;0xfaab:   "D"
    DEFB 0xa                          ;0xfaac:   0xa
    DEFB 0x5d                         ;0xfaad:   "]"
    DEFB 0x54                         ;0xfaae:   "T"
;--------------------------------------
D_FAAF:                               ; XREF: 0xC0ED 
    DEFB 0x13                         ;0xfaaf:   0x13
    DEFB 0x1a                         ;0xfab0:   0x1a
    DEFB 0xfe                         ;0xfab1:   ('~') + 0x80
    DEFB 0x21                         ;0xfab2:   "!"
    DEFB 0xf5                         ;0xfab3:   ('u') + 0x80
    DEFB 0xe5                         ;0xfab4:   ('e') + 0x80
    DEFB 0xcc                         ;0xfab5:   ('L') + 0x80
    DEFB 0xb7                         ;0xfab6:   ('7') + 0x80
    DEFB 0xb                          ;0xfab7:   0xb
    DEFB 0xe1                         ;0xfab8:   ('a') + 0x80
    DEFB 0xf1                         ;0xfab9:   ('q') + 0x80
    DEFB 0xc8                         ;0xfaba:   ('H') + 0x80
    DEFB 0x36                         ;0xfabb:   "6"
    DEFB 0x1                          ;0xfabc:   0x1
    DEFB 0x0                          ;0xfabd:   0x0
    DEFB 0xeb                         ;0xfabe:   ('k') + 0x80
    DEFB 0x2a                         ;0xfabf:   "*"
    DEFB 0x6                          ;0xfac0:   0x6
    DEFB 0x1                          ;0xfac1:   0x1
    DEFB 0x0                          ;0xfac2:   0x0
    DEFB 0x25                         ;0xfac3:   "%"
    DEFB 0x2e                         ;0xfac4:   "."
    DEFB 0x18                         ;0xfac5:   0x18
    DEFB 0x77                         ;0xfac6:   "w"
    DEFB 0xe5                         ;0xfac7:   ('e') + 0x80
    DEFB 0x23                         ;0xfac8:   "#"
    DEFB 0x13                         ;0xfac9:   0x13
    DEFB 0x1a                         ;0xfaca:   0x1a
    DEFB 0x77                         ;0xfacb:   "w"
    DEFB 0xfe                         ;0xfacc:   ('~') + 0x80
    DEFB 0x21                         ;0xfacd:   "!"
    DEFB 0xc2                         ;0xface:   ('B') + 0x80
    DEFB 0x7d                         ;0xfacf:   "}"
    DEFB 0xa                          ;0xfad0:   0xa
    DEFB 0x36                         ;0xfad1:   "6"
    DEFB 0xd                          ;0xfad2:   0xd
    DEFB 0xb7                         ;0xfad3:   ('7') + 0x80
    DEFB 0xc2                         ;0xfad4:   ('B') + 0x80
    DEFB 0x72                         ;0xfad5:   "r"
    DEFB 0xa                          ;0xfad6:   0xa
    DEFB 0x36                         ;0xfad7:   "6"
    DEFB 0xd                          ;0xfad8:   0xd
    DEFB 0x23                         ;0xfad9:   "#"
    DEFB 0x77                         ;0xfada:   "w"
    DEFB 0x2e                         ;0xfadb:   "."
    DEFB 0x6                          ;0xfadc:   0x6
    DEFB 0x36                         ;0xfadd:   "6"
    DEFB 0xc3                         ;0xfade:   ('C') + 0x80
    DEFB 0x23                         ;0xfadf:   "#"
    DEFB 0x36                         ;0xfae0:   "6"
    DEFB 0x9                          ;0xfae1:   0x9
    DEFB 0x23                         ;0xfae2:   "#"
    DEFB 0x74                         ;0xfae3:   "t"
    DEFB 0x23                         ;0xfae4:   "#"
    DEFB 0x36                         ;0xfae5:   "6"
    DEFB 0xc3                         ;0xfae6:   ('C') + 0x80
    DEFB 0x2e                         ;0xfae7:   "."
    DEFB 0xe                          ;0xfae8:   0xe
    DEFB 0x77                         ;0xfae9:   "w"
    DEFB 0x6f                         ;0xfaea:   "o"
    DEFB 0xeb                         ;0xfaeb:   ('k') + 0x80
    DEFB 0xcd                         ;0xfaec:   ('M') + 0x80
    DEFB 0xd0                         ;0xfaed:   ('P') + 0x80
    DEFB 0x1                          ;0xfaee:   0x1
    DEFB 0x2a                         ;0xfaef:   "*"
    DEFB 0x8d                         ;0xfaf0:   0x8d
    DEFB 0x3                          ;0xfaf1:   0x3
    DEFB 0x2e                         ;0xfaf2:   "."
    DEFB 0xb1                         ;0xfaf3:   ('1') + 0x80
    DEFB 0xd1                         ;0xfaf4:   ('Q') + 0x80
    DEFB 0x13                         ;0xfaf5:   0x13
    DEFB 0x73                         ;0xfaf6:   "s"
    DEFB 0x23                         ;0xfaf7:   "#"
    DEFB 0x72                         ;0xfaf8:   "r"
    DEFB 0x2e                         ;0xfaf9:   "."
    DEFB 0xae                         ;0xfafa:   ('.') + 0x80
    DEFB 0x72                         ;0xfafb:   "r"
    DEFB 0xaf                         ;0xfafc:   ('/') + 0x80
    DEFB 0xc9                         ;0xfafd:   ('I') + 0x80
    DEFB 0x11                         ;0xfafe:   0x11
    DEFB 0xb1                         ;0xfaff:   ('1') + 0x80
    DEFB 0xba                         ;0xfb00:   (':') + 0x80
    DEFB 0xcd                         ;0xfb01:   ('M') + 0x80
    DEFB 0xa7                         ;0xfb02:   (''') + 0x80
    DEFB 0xb                          ;0xfb03:   0xb
    DEFB 0xb7                         ;0xfb04:   ('7') + 0x80
    DEFB 0x11                         ;0xfb05:   0x11
    DEFB 0xb1                         ;0xfb06:   ('1') + 0x80
    DEFB 0xbc                         ;0xfb07:   ('<') + 0x80
    DEFB 0xcc                         ;0xfb08:   ('L') + 0x80
    DEFB 0xa7                         ;0xfb09:   (''') + 0x80
    DEFB 0xb                          ;0xfb0a:   0xb
    DEFB 0xe5                         ;0xfb0b:   ('e') + 0x80
    DEFB 0xcd                         ;0xfb0c:   ('M') + 0x80
    DEFB 0x6d                         ;0xfb0d:   "m"
    DEFB 0x9                          ;0xfb0e:   0x9
    DEFB 0xe1                         ;0xfb0f:   ('a') + 0x80
    DEFB 0x2e                         ;0xfb10:   "."
    DEFB 0xb1                         ;0xfb11:   ('1') + 0x80
    DEFB 0xc2                         ;0xfb12:   ('B') + 0x80
    DEFB 0xcb                         ;0xfb13:   ('K') + 0x80
    DEFB 0xa                          ;0xfb14:   0xa
    DEFB 0x5e                         ;0xfb15:   "^"
    DEFB 0x23                         ;0xfb16:   "#"
    DEFB 0x56                         ;0xfb17:   "V"
    DEFB 0x34                         ;0xfb18:   "4"
    DEFB 0x35                         ;0xfb19:   "5"
    DEFB 0x2b                         ;0xfb1a:   "+"
    DEFB 0xca                         ;0xfb1b:   ('J') + 0x80
    DEFB 0xcb                         ;0xfb1c:   ('K') + 0x80
    DEFB 0xa                          ;0xfb1d:   0xa
    DEFB 0x1a                         ;0xfb1e:   0x1a
    DEFB 0xb7                         ;0xfb1f:   ('7') + 0x80
    DEFB 0xc0                         ;0xfb20:   ('@') + 0x80
    DEFB 0xaf                         ;0xfb21:   ('/') + 0x80
    DEFB 0x77                         ;0xfb22:   "w"
    DEFB 0x23                         ;0xfb23:   "#"
    DEFB 0x77                         ;0xfb24:   "w"
    DEFB 0x2e                         ;0xfb25:   "."
    DEFB 0xae                         ;0xfb26:   ('.') + 0x80
    DEFB 0x66                         ;0xfb27:   "f"
    DEFB 0x2e                         ;0xfb28:   "."
    DEFB 0xe                          ;0xfb29:   0xe
    DEFB 0x35                         ;0xfb2a:   "5"
    DEFB 0xc3                         ;0xfb2b:   ('C') + 0x80
    DEFB 0x1                          ;0xfb2c:   0x1
    DEFB 0x0                          ;0xfb2d:   0x0
    DEFB 0x2                          ;0xfb2e:   0x2
    DEFB 0x11                         ;0xfb2f:   0x11
    DEFB 0x5c                         ;0xfb30:   "\"
    DEFB 0x1                          ;0xfb31:   0x1
    DEFB 0x0                          ;0xfb32:   0x0
    DEFB 0xcd                         ;0xfb33:   ('M') + 0x80
    DEFB 0x41                         ;0xfb34:   "A"
    DEFB 0xa                          ;0xfb35:   0xa
    DEFB 0xf5                         ;0xfb36:   ('u') + 0x80
    DEFB 0xcd                         ;0xfb37:   ('M') + 0x80
    DEFB 0xe4                         ;0xfb38:   ('d') + 0x80
    DEFB 0xa                          ;0xfb39:   0xa
    DEFB 0xf1                         ;0xfb3a:   ('q') + 0x80
    DEFB 0xc9                         ;0xfb3b:   ('I') + 0x80
    DEFB 0x22                         ;0xfb3c:   """
    DEFB 0x6c                         ;0xfb3d:   "l"
    DEFB 0xd                          ;0xfb3e:   0xd
    DEFB 0x22                         ;0xfb3f:   """
    DEFB 0x9b                         ;0xfb40:   0x9b
    DEFB 0xd                          ;0xfb41:   0xd
    DEFB 0xd5                         ;0xfb42:   ('U') + 0x80
    DEFB 0x11                         ;0xfb43:   0x11
    DEFB 0x6c                         ;0xfb44:   "l"
    DEFB 0xd                          ;0xfb45:   0xd
    DEFB 0xe                          ;0xfb46:   0xe
    DEFB 0x98                         ;0xfb47:   0x98
    DEFB 0xcd                         ;0xfb48:   ('M') + 0x80
    DEFB 0x5                          ;0xfb49:   0x5
    DEFB 0x1                          ;0xfb4a:   0x1
    DEFB 0x0                          ;0xfb4b:   0x0
    DEFB 0xd1                         ;0xfb4c:   ('Q') + 0x80
    DEFB 0x7c                         ;0xfb4d:   "|"
    DEFB 0xb5                         ;0xfb4e:   ('5') + 0x80
    DEFB 0x46                         ;0xfb4f:   "F"
    DEFB 0x23                         ;0xfb50:   "#"
    DEFB 0xc2                         ;0xfb51:   ('B') + 0x80
    DEFB 0xfe                         ;0xfb52:   ('~') + 0x80
    DEFB 0xa                          ;0xfb53:   0xa
    DEFB 0x21                         ;0xfb54:   "!"
    DEFB 0x28                         ;0xfb55:   "("
    DEFB 0xb                          ;0xfb56:   0xb
    DEFB 0x7c                         ;0xfb57:   "|"
    DEFB 0xb5                         ;0xfb58:   ('5') + 0x80
    DEFB 0xc2                         ;0xfb59:   ('B') + 0x80
    DEFB 0x9                          ;0xfb5a:   0x9
    DEFB 0xb                          ;0xfb5b:   0xb
    DEFB 0x21                         ;0xfb5c:   "!"
    DEFB 0x28                         ;0xfb5d:   "("
    DEFB 0xb                          ;0xfb5e:   0xb
    DEFB 0xcd                         ;0xfb5f:   ('M') + 0x80
    DEFB 0x3a                         ;0xfb60:   ":"
    DEFB 0xc                          ;0xfb61:   0xc
    DEFB 0x78                         ;0xfb62:   "x"
    DEFB 0xfe                         ;0xfb63:   ('~') + 0x80
    DEFB 0x2e                         ;0xfb64:   "."
    DEFB 0xc2                         ;0xfb65:   ('B') + 0x80
;--------------------------------------
D_FB66:                               ; XREF: 0xC299 0xC296 
    DEFB 0x10                         ;0xfb66:   0x10
    DEFB 0xb                          ;0xfb67:   0xb
;--------------------------------------
C_FB68:                               ; XREF: 0xEDB9 
    DEC HL                            ;0xfb68:   2b  "+" 
    LD (0xd6c),HL                     ;0xfb69:   22 6c 0d  ""l."  
    LD C,0x10                         ;0xfb6c:   0e 10  ".."  
;--------------------------------------
C_FB6E:                               ; XREF: 0xE6DD 
    LD HL,0xdd0                       ;0xfb6e:   21 d0 0d  "!.."  
    PUSH DE                           ;0xfb71:   d5  "." 
    CALL 0xbae                        ;0xfb72:   cd ae 0b  "..." 
    LD DE,0xda2                       ;0xfb75:   11 a2 0d  "..."  
    LD C,10                           ;0xfb78:   0e 0a  ".."  
;--------------------------------------
C_FB7A:                               ; XREF: 0xE69B 
    CALL 0xbae                        ;0xfb7a:   cd ae 0b  "..." 
    POP DE                            ;0xfb7d:   d1  "." 
    LD A,(HL)                         ;0xfb7e:   7e  "~" 
    LD HL,2                           ;0xfb7f:   21 02 00  "!.."  
    OR A                              ;0xfb82:   b7  "." 
    LD B,A                            ;0xfb83:   47  "G" 
    JP z, 0xb38                       ;0xfb84:   ca 38 0b  ".8." 
    LD HL,(0xd9b)                     ;0xfb87:   2a 9b 0d  "*.."  
    LD A,(HL)                         ;0xfb8a:   7e  "~" 
    CP 0x3b                           ;0xfb8b:   fe 3b  ".;" 
    INC HL                            ;0xfb8d:   23  "#" 
    JP nz, 0xb31                      ;0xfb8e:   c2 31 0b  ".1." 
    DEFB 0xc9                         ;0xfb91:   ('I') + 0x80
;--------------------------------------
D_FB92:                               ; XREF: 0xE2D1 0xE1CB 
    DEFB 0xd5                         ;0xfb92:   ('U') + 0x80
    DEFB 0xaf                         ;0xfb93:   ('/') + 0x80
    DEFB 0x12                         ;0xfb94:   0x12
    DEFB 0x13                         ;0xfb95:   0x13
    DEFB 0x12                         ;0xfb96:   0x12
    DEFB 0x13                         ;0xfb97:   0x13
    DEFB 0xcd                         ;0xfb98:   ('M') + 0x80
    DEFB 0x41                         ;0xfb99:   "A"
    DEFB 0xa                          ;0xfb9a:   0xa
    DEFB 0x2a                         ;0xfb9b:   "*"
;--------------------------------------
D_FB9C:                               ; XREF: 0xCDC2 0xC7C6 0xC689 0xE196 0xC757 0xC7BA 0xC69C 0xC79D 
    DEFB 0x6c                         ;0xfb9c:   "l"
;--------------------------------------
D_FB9D:                               ; XREF: 0xC708 0xC7CA 0xC6B3 0xC77D 
    DEFB 0xd                          ;0xfb9d:   0xd
;--------------------------------------
D_FB9E:                               ; XREF: 0xC705 
    DEFB 0xd1                         ;0xfb9e:   ('Q') + 0x80
    DEFB 0xd5                         ;0xfb9f:   ('U') + 0x80
    DEFB 0x6                          ;0xfba0:   0x6
;--------------------------------------
D_FBA1:                               ; XREF: 0xD217 
    DEFB 0x4                          ;0xfba1:   0x4
    DEFB 0x7e                         ;0xfba2:   "~"
    DEFB 0xfe                         ;0xfba3:   ('~') + 0x80
    DEFB 0x3a                         ;0xfba4:   ":"
    DEFB 0xca                         ;0xfba5:   ('J') + 0x80
    DEFB 0x67                         ;0xfba6:   "g"
    DEFB 0xb                          ;0xfba7:   0xb
    DEFB 0xb7                         ;0xfba8:   ('7') + 0x80
    DEFB 0xc3                         ;0xfba9:   ('C') + 0x80
    DEFB 0xa                          ;0xfbaa:   0xa
    DEFB 0x4                          ;0xfbab:   0x4
;--------------------------------------
D_FBAC:                               ; XREF: 0xCACB 0xCAC4 0xEDB6 
    DEFB 0x5                          ;0xfbac:   0x5
    DEFB 0x23                         ;0xfbad:   "#"
    DEFB 0xc2                         ;0xfbae:   ('B') + 0x80
    DEFB 0x49                         ;0xfbaf:   "I"
    DEFB 0xb                          ;0xfbb0:   0xb
;--------------------------------------
D_FBB1:                               ; XREF: 0xC60A 
    DEFB 0xd1                         ;0xfbb1:   ('Q') + 0x80
    DEFB 0xaf                         ;0xfbb2:   ('/') + 0x80
;--------------------------------------
D_FBB3:                               ; XREF: 0xDBF1 0xCE5F 
    DEFB 0x12                         ;0xfbb3:   0x12
;--------------------------------------
D_FBB4:                               ; XREF: 0xEB7C 
    DEFB 0x2a                         ;0xfbb4:   "*"
    DEFB 0x6c                         ;0xfbb5:   "l"
;--------------------------------------
D_FBB6:                               ; XREF: 0xC2E4 0xEB4D 
    DEFB 0xd                          ;0xfbb6:   0xd
;--------------------------------------
D_FBB7:                               ; XREF: 0xE980 0xEAA0 0xEC01 0xE8C5 0xEC86 0xEAA7 0xE92B 0xEA4B 0xEA0E 0xEBDD 0xEB51 0xE833 0xEA74 0xEABA 0xEA1D 0xE7BE 
    DEFB 0x13                         ;0xfbb7:   0x13
;--------------------------------------
D_FBB8:                               ; XREF: 0xC2E8 
    DEFB 0x1a                         ;0xfbb8:   0x1a
    DEFB 0xf5                         ;0xfbb9:   ('u') + 0x80
;--------------------------------------
D_FBBA:                               ; XREF: 0xE781 0xEB43 0xC607 0xEB30 0xC17D 
    DEFB 0xcd                         ;0xfbba:   ('M') + 0x80
    DEFB 0xe4                         ;0xfbbb:   ('d') + 0x80
;--------------------------------------
D_FBBC:                               ; XREF: 0xEB46 
    DEFB 0xa                          ;0xfbbc:   0xa
    DEFB 0xf1                         ;0xfbbd:   ('q') + 0x80
;--------------------------------------
D_FBBE:                               ; XREF: 0xC563 0xC45C 0xC46E 
    DEFB 0x12                         ;0xfbbe:   0x12
    DEFB 0xc9                         ;0xfbbf:   ('I') + 0x80
;--------------------------------------
D_FBC0:                               ; XREF: 0xC4FA 0xC5BC 0xC4DD 0xC566 
    DEFB 0x2a                         ;0xfbc0:   "*"
    DEFB 0x6c                         ;0xfbc1:   "l"
;--------------------------------------
D_FBC2:                               ; XREF: 0xC4E1 0xC585 
    DEFB 0xd                          ;0xfbc2:   0xd
    DEFB 0x7e                         ;0xfbc3:   "~"
;--------------------------------------
D_FBC4:                               ; XREF: 0xC588 
    DEFB 0xfe                         ;0xfbc4:   ('~') + 0x80
    DEFB 0x30                         ;0xfbc5:   "0"
;--------------------------------------
D_FBC6:                               ; XREF: 0xC56B 0xC504 
    DEFB 0xda                         ;0xfbc6:   ('Z') + 0x80
    DEFB 0x85                         ;0xfbc7:   0x85
;--------------------------------------
D_FBC8:                               ; XREF: 0xC4FE 
    DEFB 0xb                          ;0xfbc8:   0xb
    DEFB 0xfe                         ;0xfbc9:   ('~') + 0x80
;--------------------------------------
D_FBCA:                               ; XREF: 0xE8BA 
    DEFB 0x3a                         ;0xfbca:   ":"
;--------------------------------------
D_FBCB:                               ; XREF: 0xE8DD 
    DEFB 0xd2                         ;0xfbcb:   ('R') + 0x80
;--------------------------------------
D_FBCC:                               ; XREF: 0xECB7 
    DEFB 0x85                         ;0xfbcc:   0x85
    DEFB 0xb                          ;0xfbcd:   0xb
    DEFB 0xcd                         ;0xfbce:   ('M') + 0x80
;--------------------------------------
D_FBCF:                               ; XREF: 0xEC63 0xE6C4 0xECA3 0xC1C9 0xE64E 0xEC12 0xE714 0xEC38 0xEBBE 0xECFF 
    DEFB 0x71                         ;0xfbcf:   "q"
    DEFB 0xc                          ;0xfbd0:   0xc
    DEFB 0xd1                         ;0xfbd1:   ('Q') + 0x80
    DEFB 0xd5                         ;0xfbd2:   ('U') + 0x80
;--------------------------------------
D_FBD3:                               ; XREF: 0xEB19 0xE652 0xC264 
    DEFB 0x1a                         ;0xfbd3:   0x1a
;--------------------------------------
D_FBD4:                               ; XREF: 0xEC40 0xEC7D 
    DEFB 0xb7                         ;0xfbd4:   ('7') + 0x80
;--------------------------------------
D_FBD5:                               ; XREF: 0xE6CB 0xEC9B 
    DEFB 0xc2                         ;0xfbd5:   ('B') + 0x80
    DEFB 0x58                         ;0xfbd6:   "X"
    DEFB 0xb                          ;0xfbd7:   0xb
;--------------------------------------
D_FBD8:                               ; XREF: 0xC180 0xC900 0xD126 0xED27 0xC0CB 0xE08E 0xC131 0xED12 0xCE94 0xC0D8 0xED1D 0xC15F 
    DEFB 0x78                         ;0xfbd8:   "x"
    DEFB 0x3c                         ;0xfbd9:   "<"
;--------------------------------------
D_FBDA:                               ; XREF: 0xD132 0xF0AC 0xD11F 
    DEFB 0x12                         ;0xfbda:   0x12
;--------------------------------------
D_FBDB:                               ; XREF: 0xEE02 0xF10A 0xD48E 0xDC14 0xD395 0xE319 0xF099 0xD21D 0xD69E 0xD3A1 0xE322 0xE229 0xE3AA 0xE32B 0xD7AC 0xDD2D 0xD22E 0xDEAE 0xCC30 0xCD33 0xDBB5 0xD83C 0xD33D 0xE2BE 0xD344 0xCD45 0xCC46 0xD445 0xD258 0xEE5A 0xCADC 0xD9DF 0xDBDF 0xD9E6 0xD169 0xD9F2 0xD473 0xEFF3 0xE2F9 0xD376 0xCCF8 0xDBF9 0xEA7A 
    DEFB 0xc3                         ;0xfbdb:   ('C') + 0x80
    DEFB 0x9c                         ;0xfbdc:   0x9c
;--------------------------------------
D_FBDD:                               ; XREF: 0xD470 0xEE50 0xCAD5 0xF0D7 
    DEFB 0xb                          ;0xfbdd:   0xb
;--------------------------------------
D_FBDE:                               ; XREF: 0xE104 0xE00C 0xE4D0 0xD3B1 0xE193 0xE017 
    DEFB 0xfe                         ;0xfbde:   ('~') + 0x80
;--------------------------------------
D_FBDF:                               ; XREF: 0xC683 0xCE8A 0xD30E 0xF09E 0xC2A5 0xC7A6 0xEE27 0xE5B0 0xE4B2 0xED37 0xEBB7 0xD3BD 0xD5C7 0xEBCC 0xEC4C 0xD6D0 0xEDDD 0xE269 0xEC6A 0xE66D 0xEA71 0xD379 0xEDFE 
    DEFB 0x41                         ;0xfbdf:   "A"
;--------------------------------------
D_FBE0:                               ; XREF: 0xCECF 0xD48B 0xD13F 0xCEC7 
    DEFB 0xda                         ;0xfbe0:   ('Z') + 0x80
;--------------------------------------
D_FBE1:                               ; XREF: 0xDDC3 0xD064 0xD1A9 0xC6CA 0xD06B 0xDFE9 0xDFED 0xE249 0xE0AF 0xD3D0 0xE0D1 0xD9D2 0xDCF2 0xE113 0xDFF6 0xDFDB 0xD05C 0xE4DE 
    DEFB 0x58                         ;0xfbe1:   "X"
    DEFB 0xb                          ;0xfbe2:   0xb
;--------------------------------------
D_FBE3:                               ; XREF: 0xC139 0xC13C 
    DEFB 0xfe                         ;0xfbe3:   ('~') + 0x80
    DEFB 0x51                         ;0xfbe4:   "Q"
;--------------------------------------
D_FBE5:                               ; XREF: 0xC75C 0xDEB5 0xD076 0xDDFC 
    DEFB 0xd2                         ;0xfbe5:   ('R') + 0x80
;--------------------------------------
D_FBE6:                               ; XREF: 0xED30 0xCE19 0xF0B6 0xEDCF 
    DEFB 0x58                         ;0xfbe6:   "X"
;--------------------------------------
D_FBE7:                               ; XREF: 0xE5A9 0xC345 0xCE1E 0xF01E 
    DEFB 0xb                          ;0xfbe7:   0xb
    DEFB 0xd1                         ;0xfbe8:   ('Q') + 0x80
    DEFB 0xd5                         ;0xfbe9:   ('U') + 0x80
    DEFB 0x13                         ;0xfbea:   0x13
    DEFB 0x1a                         ;0xfbeb:   0x1a
    DEFB 0xb7                         ;0xfbec:   ('7') + 0x80
;--------------------------------------
D_FBED:                               ; XREF: 0xE5A6 
    DEFB 0xc2                         ;0xfbed:   ('B') + 0x80
    DEFB 0x58                         ;0xfbee:   "X"
    DEFB 0xb                          ;0xfbef:   0xb
;--------------------------------------
D_FBF0:                               ; XREF: 0xD3D4 
    DEFB 0x7e                         ;0xfbf0:   "~"
    DEFB 0xd6                         ;0xfbf1:   ('V') + 0x80
    DEFB 0x40                         ;0xfbf2:   "@"
;--------------------------------------
D_FBF3:                               ; XREF: 0xEE1D 
    DEFB 0x12                         ;0xfbf3:   0x12
;--------------------------------------
D_FBF4:                               ; XREF: 0xCB71 0xC5AB 0xD28B 0xC5AF 
    DEFB 0x23                         ;0xfbf4:   "#"
    DEFB 0x7e                         ;0xfbf5:   "~"
    DEFB 0xfe                         ;0xfbf6:   ('~') + 0x80
    DEFB 0x3a                         ;0xfbf7:   ":"
    DEFB 0xc2                         ;0xfbf8:   ('B') + 0x80
;--------------------------------------
D_FBF9:                               ; XREF: 0xC59A 0xCD2A 
    DEFB 0x6b                         ;0xfbf9:   "k"
;--------------------------------------
D_FBFA:                               ; XREF: 0xC90C 0xC925 
    DEFB 0xb                          ;0xfbfa:   0xb
;--------------------------------------
C_FBFB:                               ; XREF: 0xE5AD 
    INC HL                            ;0xfbfb:   23  "#" 
    POP DE                            ;0xfbfc:   d1  "." 
    JP 0xb5e                          ;0xfbfd:   c3 5e 0b  ".^." 
    DEFB 0x2a                         ;0xfc00:   "*"
    DEFB 0x8d                         ;0xfc01:   0x8d
    DEFB 0x3                          ;0xfc02:   0x3
    DEFB 0x6a                         ;0xfc03:   "j"
    DEFB 0x54                         ;0xfc04:   "T"
    DEFB 0xe                          ;0xfc05:   0xe
;--------------------------------------
C_FC06:                               ; XREF: 0xC247 
    LD (BC),A                         ;0xfc06:   02  "." 
    LD A,(HL)                         ;0xfc07:   7e  "~" 
    LD (DE),A                         ;0xfc08:   12  "." 
;--------------------------------------
C_FC09:                               ; XREF: 0xC253 
    INC HL                            ;0xfc09:   23  "#" 
    INC DE                            ;0xfc0a:   13  "." 
    DEC C                             ;0xfc0b:   0d  "." 
;--------------------------------------
C_FC0C:                               ; XREF: 0xC1DA 
    JP nz, 0xbae                      ;0xfc0c:   c2 ae 0b  "..." 
;--------------------------------------
C_FC0F:                               ; XREF: 0xC1C6 
    RET                               ;0xfc0f:   c9  "." 
    LD C,1                            ;0xfc10:   0e 01  ".."  
;--------------------------------------
C_FC12:                               ; XREF: 0xC217 
    NOP                               ;0xfc12:   00  "." 
    LD A,(DE)                         ;0xfc13:   1a  "." 
    LD (HL),A                         ;0xfc14:   77  "w" 
;--------------------------------------
C_FC15:                               ; XREF: 0xC210 
    OR A                              ;0xfc15:   b7  "." 
    LD A,C                            ;0xfc16:   79  "y" 
    RET z                             ;0xfc17:   c8  "." 
;--------------------------------------
C_FC18:                               ; XREF: 0xE469 
    INC HL                            ;0xfc18:   23  "#" 
    INC DE                            ;0xfc19:   13  "." 
    INC BC                            ;0xfc1a:   03  "." 
;--------------------------------------
C_FC1B:                               ; XREF: 0xE51D 
    JP 0xbb9                          ;0xfc1b:   c3 b9 0b  "..." 
;--------------------------------------
C_FC1E:                               ; XREF: 0xE44F 
    XOR A                             ;0xfc1e:   af  "." 
    LD HL,0xd9f                       ;0xfc1f:   21 9f 0d  "!.."  
    INC (HL)                          ;0xfc22:   34  "4" 
    CALL m, 0x9e2                     ;0xfc23:   fc e2 09  "..." 
    OR A                              ;0xfc26:   b7  "." 
;--------------------------------------
C_FC27:                               ; XREF: 0xE481 
    RET nz                            ;0xfc27:   c0  "." 
    LD A,(0xd9f)                      ;0xfc28:   3a 9f 0d  ":.."  
    LD HL,0x180                       ;0xfc2b:   21 80 01  "!.."  
    NOP                               ;0xfc2e:   00  "." 
    CALL 0xcb0                        ;0xfc2f:   cd b0 0c  "..." 
    XOR A                             ;0xfc32:   af  "." 
    LD A,(HL)                         ;0xfc33:   7e  "~" 
    RET                               ;0xfc34:   c9  "." 
    LD BC,0xb440                      ;0xfc35:   01 40 b4  ".@."  
    LD HL,(0x38d)                     ;0xfc38:   2a 8d 03  "*.."  
    LD L,B                            ;0xfc3b:   68  "h" 
    LD A,(HL)                         ;0xfc3c:   7e  "~" 
    AND C                             ;0xfc3d:   a1  "." 
    RET                               ;0xfc3e:   c9  "." 
    LD BC,0xb4a0                      ;0xfc3f:   01 a0 b4  "..."  
    CALL 0xbdd                        ;0xfc42:   cd dd 0b  "..." 
;--------------------------------------
C_FC45:                               ; XREF: 0xD809 
    LD A,C                            ;0xfc45:   79  "y" 
    OR (HL)                           ;0xfc46:   b6  "." 
    LD (HL),A                         ;0xfc47:   77  "w" 
;--------------------------------------
C_FC48:                               ; XREF: 0xCDAC 
    RET                               ;0xfc48:   c9  "." 
    LD BC,0xb4a0                      ;0xfc49:   01 a0 b4  "..."  
    CALL 0xbdd                        ;0xfc4c:   cd dd 0b  "..." 
    LD A,C                            ;0xfc4f:   79  "y" 
    CPL                               ;0xfc50:   2f  "/" 
;--------------------------------------
C_FC51:                               ; XREF: 0xC042 
    AND (HL)                          ;0xfc51:   a6  "." 
    LD (HL),A                         ;0xfc52:   77  "w" 
    RET                               ;0xfc53:   c9  "." 
;--------------------------------------
C_FC54:                               ; XREF: 0xC96B 
    LD HL,(0x38d)                     ;0xfc54:   2a 8d 03  "*.."  
;--------------------------------------
C_FC57:                               ; XREF: 0xC95E 
    LD L,B                            ;0xfc57:   68  "h" 
    LD (HL),A                         ;0xfc58:   77  "w" 
    RET                               ;0xfc59:   c9  "." 
    LD HL,(0x38d)                     ;0xfc5a:   2a 8d 03  "*.."  
    LD L,B                            ;0xfc5d:   68  "h" 
    LD A,(HL)                         ;0xfc5e:   7e  "~" 
    RET                               ;0xfc5f:   c9  "." 
    CALL 0x949                        ;0xfc60:   cd 49 09  ".I." 
;--------------------------------------
C_FC63:                               ; XREF: 0xC597 
    LD B,L                            ;0xfc63:   45  "E" 
    LD A,13                           ;0xfc64:   3e 0d  ">."  
    CALL 0xca6                        ;0xfc66:   cd a6 0c  "..." 
    LD A,10                           ;0xfc69:   3e 0a  ">."  
    JP 0xca6                          ;0xfc6b:   c3 a6 0c  "..." 
    SUB 10                            ;0xfc6e:   d6 0a  ".." 
    JP c, 0xc25                       ;0xfc70:   da 25 0c  ".%." 
    LD E,0x30                         ;0xfc73:   1e 30  ".0"  
    INC E                             ;0xfc75:   1c  "." 
    SUB 10                            ;0xfc76:   d6 0a  ".." 
    JP nc, 0xc1a                      ;0xfc78:   d2 1a 0c  "..." 
    PUSH AF                           ;0xfc7b:   f5  "." 
    CALL 0x93c                        ;0xfc7c:   cd 3c 09  ".<." 
    POP AF                            ;0xfc7f:   f1  "." 
    ADD A,0x3a                        ;0xfc80:   c6 3a  ".:" 
    JP 0x916                          ;0xfc82:   c3 16 09  "..." 
    LD A,(HL)                         ;0xfc85:   7e  "~" 
    OR A                              ;0xfc86:   b7  "." 
    RET z                             ;0xfc87:   c8  "." 
    CP C                              ;0xfc88:   b9  "." 
    RET z                             ;0xfc89:   c8  "." 
    CALL 0xca6                        ;0xfc8a:   cd a6 0c  "..." 
    INC HL                            ;0xfc8d:   23  "#" 
    JP 0xc2a                          ;0xfc8e:   c3 2a 0c  ".*." 
    CALL 0xa41                        ;0xfc91:   cd 41 0a  ".A." 
    RET z                             ;0xfc94:   c8  "." 
    LD HL,0xd67                       ;0xfc95:   21 67 0d  "!g."  
    LD A,(HL)                         ;0xfc98:   7e  "~" 
    OR A                              ;0xfc99:   b7  "." 
    LD (HL),1                         ;0xfc9a:   36 01  "6."  
    NOP                               ;0xfc9c:   00  "." 
    RET nz                            ;0xfc9d:   c0  "." 
    LD HL,(0xd9b)                     ;0xfc9e:   2a 9b 0d  "*.."  
    LD C,0x20                         ;0xfca1:   0e 20  ". "  
    CALL 0xc2a                        ;0xfca3:   cd 2a 0c  ".*." 
    LD A,0x3f                         ;0xfca6:   3e 3f  ">?"  
    CALL 0x916                        ;0xfca8:   cd 16 09  "..." 
    JP 0x506                          ;0xfcab:   c3 06 05  "..." 
    CALL 0xa41                        ;0xfcae:   cd 41 0a  ".A." 
    LD HL,(0xd6c)                     ;0xfcb1:   2a 6c 0d  "*l."  
    LD (0xd9b),HL                     ;0xfcb4:   22 9b 0d  "".."  
    RET z                             ;0xfcb7:   c8  "." 
    LD A,(HL)                         ;0xfcb8:   7e  "~" 
    CP 0x30                           ;0xfcb9:   fe 30  ".0" 
    JP c, 0xc3a                       ;0xfcbb:   da 3a 0c  ".:." 
    CP 0x3a                           ;0xfcbe:   fe 3a  ".:" 
;--------------------------------------
ERROR_MESSAGES:                       ; XREF: 
    DEFB 0xd2                         ;0xfcc0:   
    DEFB 0x3a                         ;0xfcc1:   
    DEFB 0xc                          ;0xfcc2:   0xc
    DEFB 0xcd                         ;0xfcc3:   
    DEFB 0x71                         ;0xfcc4:   
    DEFB 0xc                          ;0xfcc5:   0xc
    DEFB 0x22                         ;0xfcc6:   
    DEFB 0x6c                         ;0xfcc7:   
    DEFB 0xd                          ;0xfcc8:   
    DEFB 0xf6                         ;0xfcc9:   
    DEFB 0x1                          ;0xfcca:   0x1
    DEFB 0x78                         ;0xfccb:   
    DEFB 0xc9                         ;0xfccc:   
    DEFB 0x6                          ;0xfccd:   0x6
    DEFB 0x1                          ;0xfcce:   0x1
    DEFB 0x0                          ;0xfccf:   
    DEFB 0x7e                         ;0xfcd0:   
    DEFB 0xd6                         ;0xfcd1:   
    DEFB 0x30                         ;0xfcd2:   
    DEFB 0xd8                         ;0xfcd3:   
    DEFB 0xfe                         ;0xfcd4:   
    DEFB 0xa                          ;0xfcd5:   0xa
    DEFB 0xd0                         ;0xfcd6:   
    DEFB 0xf5                         ;0xfcd7:   
    DEFB 0x78                         ;0xfcd8:   
    DEFB 0x87                         ;0xfcd9:   
    DEFB 0x87                         ;0xfcda:   
    DEFB 0x80                         ;0xfcdb:   
    DEFB 0x87                         ;0xfcdc:   
    DEFB 0x47                         ;0xfcdd:   
    DEFB 0xf1                         ;0xfcde:   
    DEFB 0x23                         ;0xfcdf:   
    DEFB 0x80                         ;0xfce0:   
    DEFB 0x47                         ;0xfce1:   
    DEFB 0xfe                         ;0xfce2:   
    DEFB 0x10                         ;0xfce3:   0x10
    DEFB 0xda                         ;0xfce4:   
    DEFB 0x73                         ;0xfce5:   
    DEFB 0xc                          ;0xfce6:   0xc
    DEFB 0xc3                         ;0xfce7:   
    DEFB 0x3a                         ;0xfce8:   
    DEFB 0xc                          ;0xfce9:   0xc
    DEFB 0x13                         ;0xfcea:   0x13
    DEFB 0x26                         ;0xfceb:   
    DEFB 0x8                          ;0xfcec:   0x8
    DEFB 0xcd                         ;0xfced:   
    DEFB 0x98                         ;0xfcee:   
    DEFB 0xc                          ;0xfcef:   0xc
    DEFB 0xcd                         ;0xfcf0:   
    DEFB 0xa4                         ;0xfcf1:   
    DEFB 0xc                          ;0xfcf2:   0xc
    DEFB 0x26                         ;0xfcf3:   
    DEFB 0x3                          ;0xfcf4:   0x3
    DEFB 0x1a                         ;0xfcf5:   0x1a
    DEFB 0xe6                         ;0xfcf6:   
    DEFB 0x7f                         ;0xfcf7:   
    DEFB 0xcd                         ;0xfcf8:   
    DEFB 0xa6                         ;0xfcf9:   
    DEFB 0xc                          ;0xfcfa:   0xc
    DEFB 0x13                         ;0xfcfb:   0x13
    DEFB 0x25                         ;0xfcfc:   
    DEFB 0xc2                         ;0xfcfd:   
    DEFB 0x98                         ;0xfcfe:   
    DEFB 0xc                          ;0xfcff:   0xc
    DEFB 0xc9                         ;0xfd00:   
    DEFB 0x3e                         ;0xfd01:   
    DEFB 0x20                         ;0xfd02:   
    DEFB 0xc5                         ;0xfd03:   
    DEFB 0xd5                         ;0xfd04:   
    DEFB 0xe5                         ;0xfd05:   
    DEFB 0xcd                         ;0xfd06:   
    DEFB 0x16                         ;0xfd07:   0x16
    DEFB 0x9                          ;0xfd08:   0x9
    DEFB 0xe1                         ;0xfd09:   
    DEFB 0xd1                         ;0xfd0a:   
    DEFB 0xc1                         ;0xfd0b:   
    DEFB 0xc9                         ;0xfd0c:   
    DEFB 0x85                         ;0xfd0d:   
    DEFB 0x6f                         ;0xfd0e:   
    DEFB 0xd0                         ;0xfd0f:   
    DEFB 0x24                         ;0xfd10:   
    DEFB 0xc9                         ;0xfd11:   
    DEFB 0x3e                         ;0xfd12:   
    DEFB 0x3f                         ;0xfd13:   
    DEFB 0x12                         ;0xfd14:   0x12
    DEFB 0x13                         ;0xfd15:   0x13
    DEFB 0x5                          ;0xfd16:   0x5
    DEFB 0xc2                         ;0xfd17:   
    DEFB 0xb7                         ;0xfd18:   
    DEFB 0xc                          ;0xfd19:   0xc
    DEFB 0xb7                         ;0xfd1a:   
    DEFB 0xc9                         ;0xfd1b:   
    DEFB 0x1                          ;0xfd1c:   0x1
    DEFB 0xff                         ;0xfd1d:   
    DEFB 0x1                          ;0xfd1e:   0x1
    DEFB 0x0                          ;0xfd1f:   
    DEFB 0xd5                         ;0xfd20:   
    DEFB 0xe5                         ;0xfd21:   
    DEFB 0x1a                         ;0xfd22:   0x1a
    DEFB 0xe6                         ;0xfd23:   
    DEFB 0x7f                         ;0xfd24:   
    DEFB 0xfe                         ;0xfd25:   
    DEFB 0x21                         ;0xfd26:   
    DEFB 0xda                         ;0xfd27:   
    DEFB 0xd0                         ;0xfd28:   
    DEFB 0xc                          ;0xfd29:   0xc
    DEFB 0xbe                         ;0xfd2a:   
    DEFB 0xc2                         ;0xfd2b:   
    DEFB 0xe0                         ;0xfd2c:   
    DEFB 0xc                          ;0xfd2d:   0xc
    DEFB 0x13                         ;0xfd2e:   0x13
    DEFB 0xc                          ;0xfd2f:   0xc
    DEFB 0x3e                         ;0xfd30:   
    DEFB 0x20                         ;0xfd31:   
    DEFB 0xbe                         ;0xfd32:   
    DEFB 0x23                         ;0xfd33:   
    DEFB 0xc2                         ;0xfd34:   
    DEFB 0xc4                         ;0xfd35:   
    DEFB 0xc                          ;0xfd36:   0xc
    DEFB 0xe1                         ;0xfd37:   
    DEFB 0xd1                         ;0xfd38:   
    DEFB 0xcd                         ;0xfd39:   
    DEFB 0xae                         ;0xfd3a:   
    DEFB 0xb                          ;0xfd3b:   0xb
    DEFB 0x78                         ;0xfd3c:   
    DEFB 0xc9                         ;0xfd3d:   
    DEFB 0x3e                         ;0xfd3e:   
    DEFB 0x20                         ;0xfd3f:   
    DEFB 0xbe                         ;0xfd40:   
    DEFB 0x23                         ;0xfd41:   
    DEFB 0xc2                         ;0xfd42:   
    DEFB 0xe2                         ;0xfd43:   
    DEFB 0xc                          ;0xfd44:   0xc
    DEFB 0xd1                         ;0xfd45:   
    DEFB 0xd1                         ;0xfd46:   
    DEFB 0x4                          ;0xfd47:   0x4
    DEFB 0xe                          ;0xfd48:   0xe
    DEFB 0xff                         ;0xfd49:   
    DEFB 0x7e                         ;0xfd4a:   
    DEFB 0xd6                         ;0xfd4b:   
    DEFB 0x1                          ;0xfd4c:   0x1
    DEFB 0xd2                         ;0xfd4d:   
    DEFB 0xc2                         ;0xfd4e:   
    DEFB 0xc                          ;0xfd4f:   0xc
    DEFB 0xc9                         ;0xfd50:   
    DEFB "Enter User #: $No File$ required$ERASE $ (Y/N)? $", 0x0d  ;0xfd51:   0xfd51 to 0xfd85
    DEFB 0xa                          ;0xfd83:   0xa
    DEFB 0xd                          ;0xfd84:   
    DEFB 0xa                          ;0xfd85:   0xa
    DEFB "Press RETURN to Continue $  (User 0)$"  ;0xfd86:   0xfd86 to 0xfdab
    DEFB 0x1                          ;0xfdab:   0x1
    DEFB 0x0                          ;0xfdac:   
;--------------------------------------
S_FDAD:                               ; XREF: 0xFD56 
    DEFB "NON-SYSTEM FILE(S) EXIST$"  ;0xfdad:   0xfdad to 0xfdc6
    DEFB 0x3                          ;0xfdc6:   0x3
    DEFB 0x0                          ;0xfdc7:   
    DEFB 0x3a                         ;0xfdc8:   
    DEFB 0x3                          ;0xfdc9:   0x3
    DEFB 0x0                          ;0xfdca:   
    DEFB 0xd0                         ;0xfdcb:   
    DEFB 0xd                          ;0xfdcc:   
    DEFB 0x3                          ;0xfdcd:   0x3
    DEFB 0x0                          ;0xfdce:   
    DEFB 0x1                          ;0xfdcf:   0x1
    DEFB "$$$     SUB"                ;0xfdd0:   0xfdd0 to 0xfddb
    DEFB 0x1                          ;0xfddb:   0x1
;--------------------------------------
S_FDDC:                               ; XREF: 0xFD68 
    DEFB 0x0                          ;0xfddc:   
    DEFB 0x1a                         ;0xfddd:   0x1a
    DEFB 0x9                          ;0xfdde:   0x9
;--------------------------------------
S_FDDF:                               ; XREF: 0xFD8B 
    DEFB 0x0                          ;0xfddf:   
    DEFB 0xfe                         ;0xfde0:   
    DEFB 0x0                          ;0xfde1:   
    DEFB 0xfe                         ;0xfde2:   
    DEFB 0x0                          ;0xfde3:   
    DEFB 0xfe                         ;0xfde4:   
    DEFB 0x0                          ;0xfde5:   
    DEFB 0xfe                         ;0xfde6:   
    DEFB 0x0                          ;0xfde7:   
    DEFB 0xfe                         ;0xfde8:   
    DEFB 0x0                          ;0xfde9:   
    DEFB 0x21                         ;0xfdea:   
    DEFB 0xe                          ;0xfdeb:   0xe
    DEFB 0x71                         ;0xfdec:   
    DEFB 0x11                         ;0xfded:   0x11
    DEFB 0x1                          ;0xfdee:   0x1
;--------------------------------------
S_FDEF:                               ; XREF: 0xFFCF 
    DEFB 0x0                          ;0xfdef:   
    DEFB 0x1                          ;0xfdf0:   0x1
    DEFB 0x1                          ;0xfdf1:   0x1
    DEFB 0xe6                         ;0xfdf2:   
    DEFB 0x1                          ;0xfdf3:   0x1
    DEFB 0xed                         ;0xfdf4:   
;--------------------------------------
S_FDF5:                               ; XREF: 0xFDD3 
    DEFB 0xb0                         ;0xfdf5:   
    DEFB 0xc3                         ;0xfdf6:   
;--------------------------------------
S_FDF7:                               ; XREF: 0xC42C 
    DEFB 0x65                         ;0xfdf7:   
    DEFB 0x1                          ;0xfdf8:   0x1
;--------------------------------------
S_FDF9:                               ; XREF: 0xFDA2 
    DEFB 0x1                          ;0xfdf9:   0x1
    DEFB 0x0                          ;0xfdfa:   
    DEFB 0xcc                         ;0xfdfb:   
    DEFB 0xcd                         ;0xfdfc:   
    DEFB 0xce                         ;0xfdfd:   
    DEFB 0xcf                         ;0xfdfe:   
;--------------------------------------
S_FDFF:                               ; XREF: 0xFDB7 
    DEFB 0xd4                         ;0xfdff:   
    DEFB 0xd5                         ;0xfe00:   
    DEFB 0xd6                         ;0xfe01:   
    DEFB 0xd7                         ;0xfe02:   
    DEFB 0xdc                         ;0xfe03:   
    DEFB 0xdd                         ;0xfe04:   
    DEFB 0xde                         ;0xfe05:   
;--------------------------------------
S_FE06:                               ; XREF: 0xFDBF 
    DEFB 0xdf                         ;0xfe06:   
    DEFB 0x2                          ;0xfe07:   0x2
;--------------------------------------
S_FE08:                               ; XREF: 0xFD92 
    DEFB 0x0                          ;0xfe08:   
    DEFB 0xe4                         ;0xfe09:   
    DEFB 0xe5                         ;0xfe0a:   
    DEFB 0xe6                         ;0xfe0b:   
    DEFB 0xe7                         ;0xfe0c:   
    DEFB 0xec                         ;0xfe0d:   
    DEFB 0xed                         ;0xfe0e:   
    DEFB 0xee                         ;0xfe0f:   
    DEFB 0xef                         ;0xfe10:   
;--------------------------------------
S_FE11:                               ; XREF: 0xFDBC 
    DEFB 0xf4                         ;0xfe11:   
    DEFB 0xf5                         ;0xfe12:   
    DEFB 0xf6                         ;0xfe13:   
    DEFB 0xf7                         ;0xfe14:   
    DEFB 0xfc                         ;0xfe15:   
;--------------------------------------
S_FE16:                               ; XREF: 0xC49C 
    DEFB 0xfd                         ;0xfe16:   
    DEFB 0xfe                         ;0xfe17:   
    DEFB 0xff                         ;0xfe18:   
    DEFB 0x1                          ;0xfe19:   0x1
    DEFB 0x0                          ;0xfe1a:   
    DEFB 0x80                         ;0xfe1b:   
    DEFB 0x1                          ;0xfe1c:   0x1
    DEFB 0x0                          ;0xfe1d:   
    DEFB 0x3                          ;0xfe1e:   0x3
    DEFB 0x7                          ;0xfe1f:   0x7
    DEFB 0x1                          ;0xfe20:   0x1
    DEFB 0x0                          ;0xfe21:   
    DEFB 0xbf                         ;0xfe22:   
    DEFB 0x1                          ;0xfe23:   0x1
    DEFB 0x0                          ;0xfe24:   
    DEFB 0x3f                         ;0xfe25:   
;--------------------------------------
S_FE26:                               ; XREF: 0xC56E 
    DEFB 0x1                          ;0xfe26:   0x1
    DEFB 0x0                          ;0xfe27:   
    DEFB 0xc0                         ;0xfe28:   
    DEFB 0x2                          ;0xfe29:   0x2
    DEFB 0x0                          ;0xfe2a:   
    DEFB 0x80                         ;0xfe2b:   
;--------------------------------------
S_FE2C:                               ; XREF: 0xFDD7 
    DEFB 0x4                          ;0xfe2c:   0x4
    DEFB 0x3                          ;0xfe2d:   0x3
    DEFB 0x0                          ;0xfe2e:   
;--------------------------------------
S_FE2F:                               ; XREF: 0xC3FD 
    DEFB 0x2c                         ;0xfe2f:   
    DEFB " 190K", 0x31                ;0xfe30:   0xfe30 to 0xfe31
    DEFB 0x1                          ;0xfe36:   0x1
    DEFB 0x0                          ;0xfe37:   
    DEFB 0x3                          ;0xfe38:   0x3
    DEFB 0x7                          ;0xfe39:   0x7
    DEFB 0x1                          ;0xfe3a:   0x1
    DEFB 0x0                          ;0xfe3b:   
    DEFB 0xff                         ;0xfe3c:   
    DEFB 0x1                          ;0xfe3d:   0x1
    DEFB 0x0                          ;0xfe3e:   
    DEFB 0x3f                         ;0xfe3f:   
    DEFB 0x1                          ;0xfe40:   0x1
    DEFB 0x0                          ;0xfe41:   
    DEFB 0xc0                         ;0xfe42:   
    DEFB 0x2                          ;0xfe43:   0x2
    DEFB 0x0                          ;0xfe44:   
    DEFB 0x80                         ;0xfe45:   
    DEFB 0x10                         ;0xfe46:   0x10
    DEFB 0x3                          ;0xfe47:   0x3
    DEFB 0x0                          ;0xfe48:   
    DEFB 0x2c                         ;0xfe49:   
    DEFB 0x20                         ;0xfe4a:   
;--------------------------------------
S_FE4B:                               ; XREF: 0xFE46 
    DEFB 0x32                         ;0xfe4b:   
    DEFB "54K", 0x34                  ;0xfe4c:   0xfe4c to 0xfe4d
    DEFB 0x1                          ;0xfe50:   0x1
    DEFB 0x0                          ;0xfe51:   
    DEFB 0x4                          ;0xfe52:   0x4
    DEFB 0xf                          ;0xfe53:   0xf
    DEFB 0x1                          ;0xfe54:   0x1
    DEFB 0xdf                         ;0xfe55:   
    DEFB 0x1                          ;0xfe56:   0x1
    DEFB 0x0                          ;0xfe57:   
;--------------------------------------
S_FE58:                               ; XREF: 0xC3C6 
    DEFB 0x7f                         ;0xfe58:   
    DEFB 0x1                          ;0xfe59:   0x1
    DEFB 0x0                          ;0xfe5a:   
    DEFB 0xc0                         ;0xfe5b:   
    DEFB 0x2                          ;0xfe5c:   0x2
    DEFB 0x0                          ;0xfe5d:   
    DEFB 0x80                         ;0xfe5e:   
    DEFB 0x4                          ;0xfe5f:   0x4
    DEFB 0x3                          ;0xfe60:   0x3
    DEFB 0x0                          ;0xfe61:   
    DEFB 0x2c                         ;0xfe62:   
;--------------------------------------
S_FE63:                               ; XREF: 0xFE30 
    DEFB 0x20                         ;0xfe63:   
    DEFB "444K", 0x34                 ;0xfe64:   0xfe64 to 0xfe65
    DEFB 0xd5                         ;0xfe69:   
    DEFB 0xc5                         ;0xfe6a:   
    DEFB 0xf5                         ;0xfe6b:   
    DEFB 0x3a                         ;0xfe6c:   
    DEFB 0x1                          ;0xfe6d:   0x1
    DEFB 0x0                          ;0xfe6e:   
    DEFB 0x40                         ;0xfe6f:   
    DEFB 0x32                         ;0xfe70:   
    DEFB 0xe4                         ;0xfe71:   
    DEFB 0x2                          ;0xfe72:   0x2
    DEFB 0x21                         ;0xfe73:   
    DEFB 0x1                          ;0xfe74:   0x1
    DEFB 0x1                          ;0xfe75:   0x1
    DEFB 0xcd                         ;0xfe76:   
    DEFB 0x66                         ;0xfe77:   
    DEFB 0x2                          ;0xfe78:   0x2
    DEFB 0x20                         ;0xfe79:   
    DEFB 0x5                          ;0xfe7a:   0x5
    DEFB 0x3e                         ;0xfe7b:   
    DEFB 0x1                          ;0xfe7c:   0x1
    DEFB 0x32                         ;0xfe7d:   
;--------------------------------------
S_FE7E:                               ; XREF: 0xF154 
    DEFB 0xe5                         ;0xfe7e:   
    DEFB 0x2                          ;0xfe7f:   0x2
;--------------------------------------
S_FE80:                               ; XREF: 0xFF48 0xFE33 0xFE9B 
    DEFB 0x21                         ;0xfe80:   
    DEFB 0xf                          ;0xfe81:   0xf
    DEFB 0x1                          ;0xfe82:   0x1
    DEFB 0xcd                         ;0xfe83:   
;--------------------------------------
S_FE84:                               ; XREF: 0xFEAA 
    DEFB 0x66                         ;0xfe84:   
    DEFB 0x2                          ;0xfe85:   0x2
    DEFB 0x20                         ;0xfe86:   
    DEFB 0x8                          ;0xfe87:   0x8
    DEFB 0x3a                         ;0xfe88:   
    DEFB 0xe5                         ;0xfe89:   
    DEFB 0x2                          ;0xfe8a:   0x2
    DEFB 0xc6                         ;0xfe8b:   
    DEFB 0x2                          ;0xfe8c:   0x2
    DEFB 0x32                         ;0xfe8d:   
    DEFB 0xe5                         ;0xfe8e:   
    DEFB 0x2                          ;0xfe8f:   0x2
;--------------------------------------
S_FE90:                               ; XREF: 0xFE86 
    DEFB 0x3a                         ;0xfe90:   
    DEFB 0xe5                         ;0xfe91:   
    DEFB 0x2                          ;0xfe92:   0x2
    DEFB 0xb7                         ;0xfe93:   
    DEFB 0x20                         ;0xfe94:   
    DEFB 0x3e                         ;0xfe95:   
    DEFB 0x1                          ;0xfe96:   0x1
    DEFB 0xc1                         ;0xfe97:   
    DEFB 0x7f                         ;0xfe98:   
;--------------------------------------
S_FE99:                               ; XREF: 0xFE63 
    DEFB 0xed                         ;0xfe99:   
    DEFB 0x49                         ;0xfe9a:   
    DEFB 0x11                         ;0xfe9b:   0x11
    DEFB 0x80                         ;0xfe9c:   
    DEFB 0xfe                         ;0xfe9d:   
    DEFB 0x21                         ;0xfe9e:   
;--------------------------------------
S_FE9F:                               ; XREF: 0xFFBE 
    DEFB 0xa6                         ;0xfe9f:   
    DEFB 0x2                          ;0xfea0:   0x2
    DEFB 0x1                          ;0xfea1:   0x1
    DEFB 0x4                          ;0xfea2:   0x4
    DEFB 0x1                          ;0xfea3:   0x1
    DEFB 0x0                          ;0xfea4:   
    DEFB 0xed                         ;0xfea5:   
    DEFB 0xb0                         ;0xfea6:   
    DEFB 0x21                         ;0xfea7:   
    DEFB 0xba                         ;0xfea8:   
    DEFB 0x2                          ;0xfea9:   0x2
    DEFB 0x11                         ;0xfeaa:   0x11
    DEFB 0x84                         ;0xfeab:   
    DEFB 0xfe                         ;0xfeac:   
    DEFB 0x1                          ;0xfead:   0x1
    DEFB 0xb                          ;0xfeae:   0xb
    DEFB 0x1                          ;0xfeaf:   0x1
    DEFB 0x0                          ;0xfeb0:   
    DEFB 0xed                         ;0xfeb1:   
    DEFB 0xb0                         ;0xfeb2:   
    DEFB 0x1                          ;0xfeb3:   0x1
    DEFB 0xc0                         ;0xfeb4:   
    DEFB 0x7f                         ;0xfeb5:   
    DEFB 0xed                         ;0xfeb6:   
    DEFB 0x49                         ;0xfeb7:   
    DEFB 0x1                          ;0xfeb8:   0x1
    DEFB 0xc1                         ;0xfeb9:   
    DEFB 0x7f                         ;0xfeba:   
    DEFB 0xed                         ;0xfebb:   
    DEFB "I!d", 0x21                  ;0xfebc:   0xfebc to 0xfebd
    DEFB 0x11                         ;0xfec0:   0x11
    DEFB 0x65                         ;0xfec1:   
    DEFB 0xff                         ;0xfec2:   
    DEFB 0x1                          ;0xfec3:   0x1
    DEFB 0x3b                         ;0xfec4:   
    DEFB 0x1                          ;0xfec5:   0x1
    DEFB 0x0                          ;0xfec6:   
    DEFB 0x36                         ;0xfec7:   
    DEFB 0x1                          ;0xfec8:   0x1
    DEFB 0x0                          ;0xfec9:   
    DEFB 0xed                         ;0xfeca:   
    DEFB 0xb0                         ;0xfecb:   
    DEFB 0x1                          ;0xfecc:   0x1
    DEFB 0xc0                         ;0xfecd:   
    DEFB 0x7f                         ;0xfece:   
    DEFB 0xed                         ;0xfecf:   
    DEFB 0x49                         ;0xfed0:   
    DEFB 0xf1                         ;0xfed1:   
    DEFB 0xc1                         ;0xfed2:   
    DEFB 0xd1                         ;0xfed3:   
;--------------------------------------
S_FED4:                               ; XREF: 0xFE94 
    DEFB 0xe1                         ;0xfed4:   
    DEFB 0xc3                         ;0xfed5:   
    DEFB 0x19                         ;0xfed6:   0x19
    DEFB 0xbd                         ;0xfed7:   
    DEFB 0x21                         ;0xfed8:   
    DEFB 0xe1                         ;0xfed9:   
    DEFB "?",34,"3&:", 0x22           ;0xfeda:   0xfeda to 0xfedb
    DEFB 0x3a                         ;0xfee5:   
    DEFB 0x1                          ;0xfee6:   0x1
    DEFB 0x1                          ;0xfee7:   0x1
    DEFB 0x18                         ;0xfee8:   0x18
    DEFB 0x3                          ;0xfee9:   0x3
;--------------------------------------
S_FEEA:                               ; XREF: 0xFEE3 
    DEFB 0x3a                         ;0xfeea:   
    DEFB 0xf                          ;0xfeeb:   0xf
    DEFB 0x1                          ;0xfeec:   0x1
;--------------------------------------
S_FEED:                               ; XREF: 0xFEE8 
    DEFB 0xed                         ;0xfeed:   
    DEFB 0x79                         ;0xfeee:   
    DEFB 0x21                         ;0xfeef:   
    DEFB 0x1                          ;0xfef0:   0x1
    DEFB 0x0                          ;0xfef1:   
    DEFB 0x40                         ;0xfef2:   
    DEFB 0x6                          ;0xfef3:   0x6
    DEFB 0x40                         ;0xfef4:   
;--------------------------------------
S_FEF5:                               ; XREF: 0xC972 
    DEFB 0xe5                         ;0xfef5:   
;--------------------------------------
S_FEF6:                               ; XREF: 0xFF03 
    DEFB 0xc5                         ;0xfef6:   
    DEFB 0xcd                         ;0xfef7:   
    DEFB 0x4d                         ;0xfef8:   
    DEFB 0x2                          ;0xfef9:   0x2
    DEFB 0xc1                         ;0xfefa:   
    DEFB 0xe1                         ;0xfefb:   
    DEFB 0x28                         ;0xfefc:   
;--------------------------------------
S_FEFD:                               ; XREF: 0xFE15 
    DEFB 0x8                          ;0xfefd:   0x8
    DEFB 0x11                         ;0xfefe:   0x11
    DEFB 0x20                         ;0xfeff:   
;--------------------------------------
S_FF00:                               ; XREF: 0xFE3A 
    DEFB 0x1                          ;0xff00:   0x1
    DEFB 0x0                          ;0xff01:   
    DEFB 0x19                         ;0xff02:   0x19
    DEFB 0x10                         ;0xff03:   0x10
    DEFB 0xf1                         ;0xff04:   
    DEFB 0x18                         ;0xff05:   0x18
;--------------------------------------
S_FF06:                               ; XREF: 0xFEFC 
    DEFB 0xd                          ;0xff06:   
    DEFB 0x21                         ;0xff07:   
    DEFB 0x1                          ;0xff08:   0x1
    DEFB 0x0                          ;0xff09:   
    DEFB 0x40                         ;0xff0a:   
    DEFB 0x11                         ;0xff0b:   0x11
    DEFB 0x1                          ;0xff0c:   0x1
    DEFB 0x40                         ;0xff0d:   
    DEFB 0x1                          ;0xff0e:   0x1
    DEFB 0xff                         ;0xff0f:   
    DEFB 0x3f                         ;0xff10:   
    DEFB 0x36                         ;0xff11:   
    DEFB 0xe5                         ;0xff12:   
    DEFB 0xed                         ;0xff13:   
;--------------------------------------
S_FF14:                               ; XREF: 0xFF05 
    DEFB 0xb0                         ;0xff14:   
    DEFB 0x1                          ;0xff15:   0x1
    DEFB 0x1                          ;0xff16:   0x1
    DEFB 0x0                          ;0xff17:   
    DEFB 0x7f                         ;0xff18:   
    DEFB 0x3e                         ;0xff19:   
    DEFB 0xc0                         ;0xff1a:   
    DEFB 0xed                         ;0xff1b:   
    DEFB 0x79                         ;0xff1c:   
    DEFB 0x3a                         ;0xff1d:   
    DEFB 0xe5                         ;0xff1e:   
    DEFB 0x2                          ;0xff1f:   0x2
    DEFB 0x21                         ;0xff20:   
    DEFB 0x20                         ;0xff21:   
    DEFB 0x1                          ;0xff22:   0x1
    DEFB 0xfe                         ;0xff23:   
    DEFB 0x1                          ;0xff24:   0x1
    DEFB 0x28                         ;0xff25:   
    DEFB 0xa                          ;0xff26:   0xa
    DEFB 0x21                         ;0xff27:   
    DEFB 0x37                         ;0xff28:   
    DEFB 0x1                          ;0xff29:   0x1
    DEFB 0xfe                         ;0xff2a:   
    DEFB 0x2                          ;0xff2b:   0x2
    DEFB 0x28                         ;0xff2c:   
    DEFB 0x3                          ;0xff2d:   0x3
    DEFB 0x21                         ;0xff2e:   
    DEFB 0x4e                         ;0xff2f:   
    DEFB 0x1                          ;0xff30:   0x1
;--------------------------------------
S_FF31:                               ; XREF: 0xFF25 
    DEFB 0x1                          ;0xff31:   0x1
    DEFB 0xc1                         ;0xff32:   
    DEFB 0x7f                         ;0xff33:   
    DEFB 0xed                         ;0xff34:   
    DEFB 0x49                         ;0xff35:   
    DEFB 0x11                         ;0xff36:   0x11
    DEFB 0x53                         ;0xff37:   
    DEFB 0xff                         ;0xff38:   
    DEFB 0x1                          ;0xff39:   0x1
    DEFB 0x11                         ;0xff3a:   0x11
    DEFB 0x1                          ;0xff3b:   0x1
    DEFB 0x0                          ;0xff3c:   
    DEFB 0xed                         ;0xff3d:   
;--------------------------------------
S_FF3E:                               ; XREF: 0xE190 0xCF14 
    DEFB 0xb0                         ;0xff3e:   
    DEFB 0x11                         ;0xff3f:   0x11
    DEFB 0xc5                         ;0xff40:   
    DEFB 0x2                          ;0xff41:   0x2
    DEFB 0x1                          ;0xff42:   0x1
    DEFB 0x6                          ;0xff43:   0x6
    DEFB 0x1                          ;0xff44:   0x1
    DEFB 0x0                          ;0xff45:   
    DEFB 0xed                         ;0xff46:   
    DEFB 0xb0                         ;0xff47:   
    DEFB 0x11                         ;0xff48:   0x11
    DEFB 0x80                         ;0xff49:   
    DEFB 0xfe                         ;0xff4a:   
    DEFB 0x21                         ;0xff4b:   
    DEFB 0xa6                         ;0xff4c:   
    DEFB 0x2                          ;0xff4d:   0x2
    DEFB 0x1                          ;0xff4e:   0x1
    DEFB 0x3e                         ;0xff4f:   
    DEFB 0x1                          ;0xff50:   0x1
    DEFB 0x0                          ;0xff51:   
    DEFB 0xed                         ;0xff52:   
;--------------------------------------
S_FF53:                               ; XREF: 0xC55C 0xFF36 
    DEFB 0xb0                         ;0xff53:   
    DEFB 0x1                          ;0xff54:   0x1
    DEFB 0xc0                         ;0xff55:   
    DEFB 0x7f                         ;0xff56:   
    DEFB 0xed                         ;0xff57:   
    DEFB 0x49                         ;0xff58:   
    DEFB 0xc3                         ;0xff59:   
    DEFB 0xb2                         ;0xff5a:   
    DEFB 0x1                          ;0xff5b:   0x1
    DEFB 0x7e                         ;0xff5c:   
    DEFB 0xfe                         ;0xff5d:   
    DEFB 0xe5                         ;0xff5e:   
    DEFB 0x28                         ;0xff5f:   
    DEFB 0x6                          ;0xff60:   0x6
    DEFB 0xe6                         ;0xff61:   
    DEFB 0xf0                         ;0xff62:   
    DEFB 0x28                         ;0xff63:   
;--------------------------------------
S_FF64:                               ; XREF: 0xFEBD 
    DEFB 0x2                          ;0xff64:   0x2
;--------------------------------------
S_FF65:                               ; XREF: 0xFEC0 
    DEFB 0xaf                         ;0xff65:   
    DEFB 0xc9                         ;0xff66:   
;--------------------------------------
S_FF67:                               ; XREF: 0xFF5F 
    DEFB 0x23                         ;0xff67:   
    DEFB 0x6                          ;0xff68:   0x6
    DEFB 0xb                          ;0xff69:   0xb
;--------------------------------------
S_FF6A:                               ; XREF: 0xFF6F 
    DEFB 0x7e                         ;0xff6a:   
    DEFB 0xe6                         ;0xff6b:   
    DEFB 0xe0                         ;0xff6c:   
    DEFB 0xc8                         ;0xff6d:   
    DEFB 0x23                         ;0xff6e:   
    DEFB 0x10                         ;0xff6f:   0x10
    DEFB 0xf9                         ;0xff70:   
    DEFB 0x3e                         ;0xff71:   
    DEFB 0x1                          ;0xff72:   0x1
    DEFB 0xb7                         ;0xff73:   
    DEFB 0xc9                         ;0xff74:   
    DEFB 0x11                         ;0xff75:   0x11
    DEFB 0xe7                         ;0xff76:   
    DEFB 0x2                          ;0xff77:   0x2
    DEFB 0xd5                         ;0xff78:   
    DEFB 0xe5                         ;0xff79:   
    DEFB 0x6                          ;0xff7a:   0x6
    DEFB 0x7f                         ;0xff7b:   
    DEFB 0x7e                         ;0xff7c:   
    DEFB 0xa7                         ;0xff7d:   
;--------------------------------------
S_FF7E:                               ; XREF: 0xFF8E 
    DEFB 0x28                         ;0xff7e:   
    DEFB 0xe                          ;0xff7f:   0xe
;--------------------------------------
S_FF80:                               ; XREF: 0xC9EF 
    DEFB 0xed                         ;0xff80:   
    DEFB 0x79                         ;0xff81:   
    DEFB 0x3a                         ;0xff82:   
    DEFB 0x1                          ;0xff83:   0x1
    DEFB 0x0                          ;0xff84:   
    DEFB 0x40                         ;0xff85:   
    DEFB 0x12                         ;0xff86:   0x12
    DEFB 0x7e                         ;0xff87:   
    DEFB 0x32                         ;0xff88:   
    DEFB 0x1                          ;0xff89:   0x1
    DEFB 0x0                          ;0xff8a:   
    DEFB 0x40                         ;0xff8b:   
    DEFB 0x23                         ;0xff8c:   
    DEFB 0x13                         ;0xff8d:   0x13
;--------------------------------------
S_FF8E:                               ; XREF: 0xFF7E 
    DEFB 0x18                         ;0xff8e:   0x18
    DEFB 0xee                         ;0xff8f:   
    DEFB 0x3e                         ;0xff90:   
    DEFB 0xc0                         ;0xff91:   
    DEFB 0xed                         ;0xff92:   
    DEFB 0x79                         ;0xff93:   
    DEFB 0x3a                         ;0xff94:   
    DEFB 0xe4                         ;0xff95:   
    DEFB 0x2                          ;0xff96:   0x2
    DEFB 0x32                         ;0xff97:   
    DEFB 0x1                          ;0xff98:   0x1
    DEFB 0x0                          ;0xff99:   
    DEFB 0x40                         ;0xff9a:   
    DEFB 0xe1                         ;0xff9b:   
    DEFB 0xd1                         ;0xff9c:   
    DEFB 0x7e                         ;0xff9d:   
    DEFB 0xb7                         ;0xff9e:   
;--------------------------------------
S_FF9F:                               ; XREF: 0xFFB1 
    DEFB 0x28                         ;0xff9f:   
    DEFB 0x10                         ;0xffa0:   0x10
    DEFB 0xed                         ;0xffa1:   
    DEFB 0x79                         ;0xffa2:   
    DEFB 0x3a                         ;0xffa3:   
;--------------------------------------
S_FFA4:                               ; XREF: 0xC433 
    DEFB 0x1                          ;0xffa4:   0x1
    DEFB 0x0                          ;0xffa5:   
    DEFB 0x40                         ;0xffa6:   
    DEFB 0xbe                         ;0xffa7:   
    DEFB 0x20                         ;0xffa8:   
    DEFB 0x8                          ;0xffa9:   0x8
    DEFB 0x1a                         ;0xffaa:   0x1a
    DEFB 0x32                         ;0xffab:   
    DEFB 0x1                          ;0xffac:   0x1
    DEFB 0x0                          ;0xffad:   
    DEFB 0x40                         ;0xffae:   
    DEFB 0x23                         ;0xffaf:   
    DEFB 0x13                         ;0xffb0:   0x13
;--------------------------------------
S_FFB1:                               ; XREF: 0xFF9F 
    DEFB 0x18                         ;0xffb1:   0x18
;--------------------------------------
S_FFB2:                               ; XREF: 0xFFA8 
    DEFB 0xec                         ;0xffb2:   
    DEFB 0xf5                         ;0xffb3:   
    DEFB 0xe                          ;0xffb4:   0xe
    DEFB 0xc0                         ;0xffb5:   
    DEFB 0xed                         ;0xffb6:   
    DEFB 0x49                         ;0xffb7:   
    DEFB 0xf1                         ;0xffb8:   
    DEFB 0xc9                         ;0xffb9:   
    DEFB 0xe5                         ;0xffba:   
    DEFB 0xd5                         ;0xffbb:   
    DEFB 0xc5                         ;0xffbc:   
    DEFB 0xf5                         ;0xffbd:   
    DEFB 0x21                         ;0xffbe:   
    DEFB 0x9f                         ;0xffbf:   
    DEFB 0xfe                         ;0xffc0:   
;--------------------------------------
S_FFC1:                               ; XREF: 0xFFCC 
    DEFB 0x7e                         ;0xffc1:   
    DEFB 0xb7                         ;0xffc2:   
    DEFB 0x28                         ;0xffc3:   
    DEFB 0x9                          ;0xffc4:   0x9
    DEFB 0x4f                         ;0xffc5:   
    DEFB 0x23                         ;0xffc6:   
    DEFB 0xe5                         ;0xffc7:   
    DEFB 0xcd                         ;0xffc8:   
    DEFB 0x3                          ;0xffc9:   0x3
    DEFB 0x3d                         ;0xffca:   
    DEFB 0xe1                         ;0xffcb:   
    DEFB 0x18                         ;0xffcc:   0x18
    DEFB 0xf3                         ;0xffcd:   
;--------------------------------------
S_FFCE:                               ; XREF: 0xFFC3 
    DEFB 0xaf                         ;0xffce:   
    DEFB 0x32                         ;0xffcf:   
    DEFB 0xef                         ;0xffd0:   
    DEFB 0xfd                         ;0xffd1:   
    DEFB 0xf1                         ;0xffd2:   
    DEFB 0xc1                         ;0xffd3:   
    DEFB 0xd1                         ;0xffd4:   
    DEFB 0xe1                         ;0xffd5:   
    DEFB 0xc3                         ;0xffd6:   
    DEFB 0x72                         ;0xffd7:   
    DEFB 0x5                          ;0xffd8:   0x5
    DEFB 0x6                          ;0xffd9:   0x6
    DEFB 0x0                          ;0xffda:   
    DEFB " Dk'tronics ram drive C:"   ;0xffdb:   0xffdb to 0xfff3
;--------------------------------------
S_FFF3:                               ; XREF: 0xC882 
    DEFB 0x4                          ;0xfff3:   0x4
    DEFB 0x0                          ;0xfff4:   
    DEFB 0x1a                         ;0xfff5:   0x1a
;--------------------------------------
S_FFF6:                               ; XREF: 0xC3DE 
    DEFB 0x1a                         ;0xfff6:   0x1a
    DEFB 0x1a                         ;0xfff7:   0x1a
;--------------------------------------
S_FFF8:                               ; XREF: 0xC3D9 0xCB96 
    DEFB 0x1a                         ;0xfff8:   0x1a
    DEFB 0x1a                         ;0xfff9:   0x1a
;--------------------------------------
S_FFFA:                               ; XREF: 0xC4B7 
    DEFB 0x1a                         ;0xfffa:   0x1a
    DEFB 0x1a                         ;0xfffb:   0x1a
    DEFB 0x1a                         ;0xfffc:   0x1a
;--------------------------------------
S_FFFD:                               ; XREF: 0xEDAD 
    DEFB 0x1a                         ;0xfffd:   0x1a
;--------------------------------------
D_FFFE:                               ; XREF: 0xC4AF 
    DEFB 0x1a                         ;0xfffe:   0x1a
;--------------------------------------
D_FFFF:                               ; XREF: 0xCA00 0xD9C3 0xEF89 0xCACF 0xC015 0xD118 
    DEFB 0x1a                         ;0xffff:   0x1a
