;-----------------------------------
; Produced using: z80-disassembler.py v0.85 - A Smart Z80 reverse assembler
; Visit https://github.com/cormacj/z80-smart-disassembler for updates and to report issues
;
; Command line used: z80-disassembler.py -o amsdos.asm -t amsdos-template.txt -l 0xc000 --labels amstrad-labels.txt AMSDOS.ROM 
;-----------------------------------

; Define labels for external calls
KL_CURR_SELECTION equ 0xb912
KL_LDIR           equ 0xb91b
KM_WAIT_CHAR      equ 0xbb06
KM_READ_CHAR      equ 0xbb09
TXT_OUTPUT        equ 0xbb5a
TXT_GET_WINDOW    equ 0xbb69
TXT_GET_CURSOR    equ 0xbb78
CAS_IN_OPEN       equ 0xbc77
CAS_OUT_OPEN      equ 0xbc8c
CAS_CATALOG       equ 0xbc9b
KL_DEL_TICKER     equ 0xbcec
KL_INIT_EVENT     equ 0xbcef
MC_START_PROGRAM  equ 0xbd16
MC_PRINT_CHAR     equ 0xbd2b
MC_BUSY_PRINTER   equ 0xbd2e



    org 0xc000

;--------------------------------------
ROM_TYPE:                      ;          XREF: 0xC13A 0xC1DC 0xC105 
    x9 DEFB 0x1                ;0xc000:   0x1
;--------------------------------------
ROM_MAJOR:                     ;          XREF: 
    x9 DEFB 0x0                ;0xc001:   0x0
;--------------------------------------
ROM_MARK:                      ;          XREF: 
    x9 DEFB 0x5                ;0xc002:   0x5
;--------------------------------------
ROM_MOD:                       ;          XREF: 
    x9 DEFB 0x0                ;0xc003:   0x0
;--------------------------------------
CMD_TABLE_PTR:                 ;          XREF: 
    DEFB S_c072                ;0xc004:   Pointer to S_c072 (0xc072)
;--------------------------------------
JUMP_TABLE:                    ;          XREF: 
    JP ROM_INIT                ;0xc006:   c3 bc c1  "..." 
    JP BAR_CPM                 ;0xc009:   c3 b2 c1  "..." 
    JP BAR_DISC                ;0xc00c:   c3 d1 cc  "..." 
    JP BAR_DISC_IN             ;0xc00f:   c3 d5 cc  "..." 
    JP BAR_DISC_OUT            ;0xc012:   c3 e4 cc  "..." 
    JP BAR_TAPE                ;0xc015:   c3 fd cc  "..." 
    JP BAR_TAPE_IN             ;0xc018:   c3 01 cd  "..." 
    JP BAR_TAPE_OUT            ;0xc01b:   c3 18 cd  "..." 
    JP BAR_A                   ;0xc01e:   c3 da cd  "..." 
    JP BAR_B                   ;0xc021:   c3 dd cd  "..." 
    JP BAR_DRIVE               ;0xc024:   c3 e4 cd  "..." 
    JP BAR_USER                ;0xc027:   c3 fe cd  "..." 
    JP BAR_DIR                 ;0xc02a:   c3 2e d4  "..." 
    JP BAR_ERA                 ;0xc02d:   c3 8a d4  "..." 
    JP BAR_REN                 ;0xc030:   c3 c4 d4  "..." 
;--------------------------------------
EXTENDED_JUMPBLOCK:            ;          XREF: 0xC1F9 
    JP EXT_SET_MESSAGE           ;0xc033:   c3 72 ca  ".r." 
    JP EXT_SETUP_DISC           ;0xc036:   c3 0d c6  "..." 
    JP EXT_SELECT_FORMAT           ;0xc039:   c3 81 c5  "..." 
    JP EXT_READ_SECTOR           ;0xc03c:   c3 66 c6  ".f." 
    JP EXT_WRITE_SECTOR           ;0xc03f:   c3 4e c6  ".N." 
    JP EXT_FORMAT_TRACK           ;0xc042:   c3 52 c6  ".R." 
    JP EXT_MOVE_TRACK           ;0xc045:   c3 63 c7  ".c." 
    JP EXT_GET_DRIVE_STATUS           ;0xc048:   c3 30 c6  ".0." 
    JP EXT_SET_RETRY_COUNT           ;0xc04b:   c3 03 c6  "..." 
    JP ENTER_FIRMWARE           ;0xc04e:   c3 68 c1  ".h." 
    JP SET_REG_SAVE            ;0xc051:   c3 db c0  "..." 
    JP SET_SIO                 ;0xc054:   c3 89 c3  "..." 
    JP SET_CMD_BUFFER           ;0xc057:   c3 01 c3  "..." 
    JP D0_IN_STATUS            ;0xc05a:   c3 db c3  "..." 
    JP D0_IN                   ;0xc05d:   c3 f7 c3  "..." 
    JP D0_OUT_STATUS           ;0xc060:   c3 35 c4  ".5." 
    JP D0_OUT                  ;0xc063:   c3 45 c4  ".E." 
    JP D1_IN_STATUS            ;0xc066:   c3 e3 c3  "..." 
    JP D1_IN                   ;0xc069:   c3 ff c3  "..." 
    JP D1_OUT_STATUS           ;0xc06c:   c3 3a c4  ".:." 
    JP D1_OUT                  ;0xc06f:   c3 4b c4  ".K." 
;--------------------------------------
S_c072:                        ;          XREF: 
    x1 DEFB "CPM RO", 'M' + 0x80  ;0xc072:   0xc072 to 0xc07b
    x4 DEFB "CP", 'M' + 0x80   ;0xc079:   0xc079 to 0xc07c
    x1 DEFB "DIS", 'C' + 0x80  ;0xc07c:   0xc07c to 0xc082
;--------------------------------------
S_c080:                        ;          XREF: 
    x1 DEFB "DISC.I", 'N' + 0x80  ;0xc080:   0xc080 to 0xc089
;--------------------------------------
S_c087:                        ;          XREF: 
    x1 DEFB "DISC.OU", 'T' + 0x80  ;0xc087:   0xc087 to 0xc091
    x1 DEFB "TAP", 'E' + 0x80  ;0xc08f:   0xc08f to 0xc095
;--------------------------------------
S_c093:                        ;          XREF: 
    x1 DEFB "TAPE.I", 'N' + 0x80  ;0xc093:   0xc093 to 0xc09c
;--------------------------------------
S_c09a:                        ;          XREF: 
    x1 DEFB "TAPE.OU", 'T' + 0x80  ;0xc09a:   0xc09a to 0xc0a4
    x7 DEFB 0xc1               ;0xc0a2:   
    x7 DEFB 0xc2               ;0xc0a3:   
;--------------------------------------
S_c0a4:                        ;          XREF: 
    x1 DEFB "DRIV", 'E' + 0x80  ;0xc0a4:   0xc0a4 to 0xc0ab
    x1 DEFB "USE", 'R' + 0x80  ;0xc0a9:   0xc0a9 to 0xc0af
    x4 DEFB "DI", 'R' + 0x80   ;0xc0ad:   0xc0ad to 0xc0b0
    x4 DEFB "ER", 'A' + 0x80   ;0xc0b0:   0xc0b0 to 0xc0b3
    x4 DEFB "RE", 'N' + 0x80   ;0xc0b3:   0xc0b3 to 0xc0b6
    x6 DEFB  0x81              ;0xc0b6:   
    x6 DEFB  0x82              ;0xc0b7:   
    x6 DEFB  0x83              ;0xc0b8:   
    x6 DEFB  0x84              ;0xc0b9:   
    x6 DEFB  0x85              ;0xc0ba:   
    x6 DEFB  0x86              ;0xc0bb:   
    x6 DEFB  0x87              ;0xc0bc:   
    x6 DEFB  0x88              ;0xc0bd:   
    x6 DEFB  0x89              ;0xc0be:   
    x7 DEFB 0x0                ;0xc0bf:   
;--------------------------------------
C_c0c0:                        ;          XREF: 0xC204 
    LD HL,(0x39)               ;0xc0c0:   2a 39 00  "*9."  
    LD (0xad3e),HL             ;0xc0c3:   22 3e ad  "">."  
    LD A,0xc3                  ;0xc0c6:   3e c3  ">."  
    LD (0xad33),A              ;0xc0c8:   32 33 ad  "23."  
    XOR A                      ;0xc0cb:   af  "." 
    LD (0xad40),A              ;0xc0cc:   32 40 ad  "2@."  
;--------------------------------------
C_c0cf:                        ;          XREF: 0xC0E6 
    DI                         ;0xc0cf:   f3  "." 
    EXX                        ;0xc0d0:   d9  "." 
    LD (0xad3c),BC             ;0xc0d1:   ed 43 3c ad  ".C<."  
    EXX                        ;0xc0d5:   d9  "." 
    LD HL,C_c0fa               ;0xc0d6:   21 fa c0  "!.."  
    JR C_c0f5                  ;0xc0d9:   18 1a  ".." 
;--------------------------------------
SET_REG_SAVE:                  ;          XREF: 0xC051 
    LD HL,0xad40               ;0xc0db:   21 40 ad  "!@."  
    CP (HL)                    ;0xc0de:   be  "." 
    RET z                      ;0xc0df:   c8  "." 
    PUSH BC                    ;0xc0e0:   c5  "." 
    LD B,(HL)                  ;0xc0e1:   46  "F" 
    LD (HL),A                  ;0xc0e2:   77  "w" 
    OR A                       ;0xc0e3:   b7  "." 
    LD A,B                     ;0xc0e4:   78  "x" 
    POP BC                     ;0xc0e5:   c1  "." 
    JR z, C_c0cf               ;0xc0e6:   28 e7  "(." 
    DI                         ;0xc0e8:   f3  "." 
    EX AF,AF'                  ;0xc0e9:   08  "." 
    EXX                        ;0xc0ea:   d9  "." 
    LD BC,(0xad3c)             ;0xc0eb:   ed 4b 3c ad  ".K<."  
    OR A                       ;0xc0ef:   b7  "." 
    EX AF,AF'                  ;0xc0f0:   08  "." 
    EXX                        ;0xc0f1:   d9  "." 
    LD HL,C_c132               ;0xc0f2:   21 32 c1  "!2."  
;--------------------------------------
C_c0f5:                        ;          XREF: 0xC0D9 
    LD (0xad34),HL             ;0xc0f5:   22 34 ad  ""4."  
    EI                         ;0xc0f8:   fb  "." 
    RET                        ;0xc0f9:   c9  "." 
;--------------------------------------
C_c0fa:                        ;          XREF: 0xC0D6 
    DI                         ;0xc0fa:   f3  "." 
    EX AF,AF'                  ;0xc0fb:   08  "." 
    EXX                        ;0xc0fc:   d9  "." 
    LD (0xad38),HL             ;0xc0fd:   22 38 ad  ""8."  
    POP HL                     ;0xc100:   e1  "." 
    LD (0xad36),SP             ;0xc101:   ed 73 36 ad  ".s6."  
    LD SP,ROM_TYPE             ;0xc105:   31 00 c0  "1.."  
    PUSH DE                    ;0xc108:   d5  "." 
    PUSH BC                    ;0xc109:   c5  "." 
    PUSH AF                    ;0xc10a:   f5  "." 
    PUSH IY                    ;0xc10b:   fd e5  ".." 
    LD BC,(0xad3c)             ;0xc10d:   ed 4b 3c ad  ".K<."  
    OR A                       ;0xc111:   b7  "." 
    CALL C_c14f                ;0xc112:   cd 4f c1  ".O." 
    DI                         ;0xc115:   f3  "." 
    EX AF,AF'                  ;0xc116:   08  "." 
    EXX                        ;0xc117:   d9  "." 
    LD (0xad3c),BC             ;0xc118:   ed 43 3c ad  ".C<."  
    LD HL,C_c163               ;0xc11c:   21 63 c1  "!c."  
    LD (0x39),HL               ;0xc11f:   22 39 00  ""9."  
    POP IY                     ;0xc122:   fd e1  ".." 
    POP AF                     ;0xc124:   f1  "." 
    POP BC                     ;0xc125:   c1  "." 
    POP DE                     ;0xc126:   d1  "." 
    LD HL,(0xad38)             ;0xc127:   2a 38 ad  "*8."  
    EX AF,AF'                  ;0xc12a:   08  "." 
    EXX                        ;0xc12b:   d9  "." 
    LD SP,(0xad36)             ;0xc12c:   ed 7b 36 ad  ".{6."  
    EI                         ;0xc130:   fb  "." 
    RET                        ;0xc131:   c9  "." 
;--------------------------------------
C_c132:                        ;          XREF: 0xC0F2 
    DI                         ;0xc132:   f3  "." 
    EX AF,AF'                  ;0xc133:   08  "." 
    EXX                        ;0xc134:   d9  "." 
    POP HL                     ;0xc135:   e1  "." 
    LD (0xad36),SP             ;0xc136:   ed 73 36 ad  ".s6."  
    LD SP,ROM_TYPE             ;0xc13a:   31 00 c0  "1.."  
    CALL C_c14f                ;0xc13d:   cd 4f c1  ".O." 
    DI                         ;0xc140:   f3  "." 
    EXX                        ;0xc141:   d9  "." 
    LD HL,C_c163               ;0xc142:   21 63 c1  "!c."  
    LD (0x39),HL               ;0xc145:   22 39 00  ""9."  
    EXX                        ;0xc148:   d9  "." 
    LD SP,(0xad36)             ;0xc149:   ed 7b 36 ad  ".{6."  
    EI                         ;0xc14d:   fb  "." 
    RET                        ;0xc14e:   c9  "." 
;--------------------------------------
C_c14f:                        ;          XREF: 0xC112 
    LD DE,(0xad3e)             ;0xc14f:   ed 5b 3e ad  ".[>."  
    LD (0x39),DE               ;0xc153:   ed 53 39 00  ".S9."  
    LD IY,0xac48               ;0xc157:   fd 21 48 ac  ".!H."  
    LD E,(HL)                  ;0xc15b:   5e  "^" 
    INC HL                     ;0xc15c:   23  "#" 
    LD D,(HL)                  ;0xc15d:   56  "V" 
    PUSH DE                    ;0xc15e:   d5  "." 
    EX AF,AF'                  ;0xc15f:   08  "." 
    EXX                        ;0xc160:   d9  "." 
    EI                         ;0xc161:   fb  "." 
    RET                        ;0xc162:   c9  "." 
;--------------------------------------
C_c163:                        ;          XREF: 0xC142 0xC11C 0xC177 
    CALL 0xad33                ;0xc163:   cd 33 ad  ".3." 
    JR c, ENTER_FIRMWARE           ;0xc166:   38 00  "8." 
;--------------------------------------
ENTER_FIRMWARE:                ;          XREF: 0xC04E 
    LD (0xad3a),HL             ;0xc168:   22 3a ad  "":."  
    POP HL                     ;0xc16b:   e1  "." 
    PUSH HL                    ;0xc16c:   e5  "." 
    INC HL                     ;0xc16d:   23  "#" 
    INC HL                     ;0xc16e:   23  "#" 
;--------------------------------------
C_C16F:                        ;          XREF: 0xFD6F 
    EX (SP),HL                 ;0xc16f:   e3  "." 
    PUSH HL                    ;0xc170:   e5  "." 
    LD HL,(0xad3a)             ;0xc171:   2a 3a ad  "*:."  
    JP 0xad33                  ;0xc174:   c3 33 ad  ".3." 
;--------------------------------------
C_c177:                        ;          XREF: 0xC221 
    LD HL,C_c163               ;0xc177:   21 63 c1  "!c."  
    LD (0x39),HL               ;0xc17a:   22 39 00  ""9."  
    EX DE,HL                   ;0xc17d:   eb  "." 
    JP (HL)                    ;0xc17e:   e9  "." 
;--------------------------------------
C_c17f:                        ;          XREF: 0xC279 0xC21B 
    JP BAR_CPM                 ;0xc17f:   c3 b2 c1  "..." 
    JP CPM_WBOOT               ;0xc182:   c3 be c2  "..." 
    JP CPM_CONST               ;0xc185:   c3 e1 c2  "..." 
    JP CPM_CONIN               ;0xc188:   c3 c3 c2  "..." 
    JP CPM_CONOUT              ;0xc18b:   c3 c8 c2  "..." 
    JP CPM_LIST                ;0xc18e:   c3 d2 c2  "..." 
    JP CPM_PUNCH               ;0xc191:   c3 d7 c2  "..." 
    JP CPM_READER              ;0xc194:   c3 dc c2  "..." 
    JP CPM_HOME                ;0xc197:   c3 e9 c2  "..." 
    JP CPM_SELDSK              ;0xc19a:   c3 f2 c2  "..." 
    JP CPM_SETTRK              ;0xc19d:   c3 24 c5  ".$." 
    JP CPM_SETSEC              ;0xc1a0:   c3 29 c5  ".)." 
    JP CPM_SETDMA              ;0xc1a3:   c3 1a c5  "..." 
    JP CPM_READ                ;0xc1a6:   c3 f7 c2  "..." 
    JP CPM_WRITE               ;0xc1a9:   c3 fc c2  "..." 
    JP CPM_LSTST               ;0xc1ac:   c3 cd c2  "..." 
    JP CPM_SECTRAN             ;0xc1af:   c3 5a c5  ".Z." 
;--------------------------------------
BAR_CPM:                       ;          XREF: 0xC009 
    CALL KL_CURR_SELECTION     ;0xc1b2:   cd 12 b9  "..." 
    LD C,A                     ;0xc1b5:   4f  "O" 
    LD HL,C_c1dc               ;0xc1b6:   21 dc c1  "!.."  
    JP MC_START_PROGRAM        ;0xc1b9:   c3 16 bd  "..." 
;--------------------------------------
ROM_INIT:                      ;          XREF: 0xEF68 0xC006 
    JR c, C_C1C4               ;0xc1bc:   38 06  "8." 
    CALL KL_CURR_SELECTION     ;0xc1be:   cd 12 b9  "..." 
;--------------------------------------
C_c1c1:                        ;          XREF: 
    OR A                       ;0xc1c1:   b7  "." 
    JR z, C_c1dc               ;0xc1c2:   28 18  "(." 
;--------------------------------------
C_C1C4:                        ;          XREF: 0xC1BC 
    PUSH IY                    ;0xc1c4:   fd e5  ".." 
    PUSH DE                    ;0xc1c6:   d5  "." 
    LD DE,0xfb00               ;0xc1c7:   11 00 fb  "..."  
    ADD HL,DE                  ;0xc1ca:   19  "." 
    PUSH HL                    ;0xc1cb:   e5  "." 
    INC HL                     ;0xc1cc:   23  "#" 
    PUSH HL                    ;0xc1cd:   e5  "." 
    POP IY                     ;0xc1ce:   fd e1  ".." 
    CALL 0xc5dd                ;0xc1d0:   cd dd c5  "..." 
    CALL C_CCA0                ;0xc1d3:   cd a0 cc  "..." 
    POP HL                     ;0xc1d6:   e1  "." 
    POP DE                     ;0xc1d7:   d1  "." 
    POP IY                     ;0xc1d8:   fd e1  ".." 
    SCF                        ;0xc1da:   37  "7" 
    RET                        ;0xc1db:   c9  "." 
;--------------------------------------
C_c1dc:                        ;          XREF: 0xC1B6 
    LD SP,ROM_TYPE             ;0xc1dc:   31 00 c0  "1.."  
    LD IY,0xac48               ;0xc1df:   fd 21 48 ac  ".!H."  
    LD DE,0xad33               ;0xc1e3:   11 33 ad  ".3."  
    LD BC,0xa5                 ;0xc1e6:   01 a5 00  "..."  
    CALL C_CAAF                ;0xc1e9:   cd af ca  "..." 
    LD HL,0xad41               ;0xc1ec:   21 41 ad  "!A."  
    DEC (HL)                   ;0xc1ef:   35  "5" 
    LD A,0x81                  ;0xc1f0:   3e 81  ">."  
    LD (0x3),A                 ;0xc1f2:   32 03 00  "2.."  
    XOR A                      ;0xc1f5:   af  "." 
    LD (0x4),A                 ;0xc1f6:   32 04 00  "2.."  
    LD HL,EXTENDED_JUMPBLOCK   ;0xc1f9:   21 33 c0  "!3."  
    LD DE,0xbe80               ;0xc1fc:   11 80 be  "..."  
    LD BC,0x3f                 ;0xc1ff:   01 3f 00  ".?."  
    LDIR                       ;0xc202:   ed b0  ".." 
    CALL C_c0c0                ;0xc204:   cd c0 c0  "..." 
    CALL 0xc5dd                ;0xc207:   cd dd c5  "..." 
;--------------------------------------
C_C20A:                        ;          XREF: 0xC229 
    LD C,0x41                  ;0xc20a:   0e 41  ".A"  
    LD DE,0                    ;0xc20c:   11 00 00  "..."  
    LD HL,0x100                ;0xc20f:   21 00 01  "!.."  
    CALL EXT_READ_SECTOR           ;0xc212:   cd 66 c6  ".f." 
    CALL c, C_C2AC             ;0xc215:   dc ac c2  "..." 
    JR nc, C_C224              ;0xc218:   30 0a  "0." 
    EX DE,HL                   ;0xc21a:   eb  "." 
    LD BC,C_c17f               ;0xc21b:   01 7f c1  "..."  
    LD SP,0xad33               ;0xc21e:   31 33 ad  "13."  
    JP C_c177                  ;0xc221:   c3 77 c1  ".w." 
;--------------------------------------
C_C224:                        ;          XREF: 0xC218 
    LD A,15                    ;0xc224:   3e 0f  ">."  
    CALL C_CAB8                ;0xc226:   cd b8 ca  "..." 
    JR C_C20A                  ;0xc229:   18 df  ".." 
;--------------------------------------
C_C22B:                        ;          XREF: 0xC297 
    CALL C_C86F                ;0xc22b:   cd 6f c8  ".o." 
    CALL C_C8B0                ;0xc22e:   cd b0 c8  "..." 
    LD BC,0x148                ;0xc231:   01 48 01  ".H."  
    LD DE,0                    ;0xc234:   11 00 00  "..."  
    PUSH HL                    ;0xc237:   e5  "." 
    CALL C_C299                ;0xc238:   cd 99 c2  "..." 
    POP HL                     ;0xc23b:   e1  "." 
    CALL c, C_C2AC             ;0xc23c:   dc ac c2  "..." 
    JR nc, C_C292              ;0xc23f:   30 51  "0Q" 
    PUSH HL                    ;0xc241:   e5  "." 
    INC HL                     ;0xc242:   23  "#" 
    LD E,(HL)                  ;0xc243:   5e  "^" 
    INC HL                     ;0xc244:   23  "#" 
    LD D,(HL)                  ;0xc245:   56  "V" 
    LD HL,D_FCA4               ;0xc246:   21 a4 fc  "!.."  
    ADD HL,DE                  ;0xc249:   19  "." 
    EX DE,HL                   ;0xc24a:   eb  "." 
    POP HL                     ;0xc24b:   e1  "." 
    LD BC,0x200                ;0xc24c:   01 00 02  "..."  
    LDIR                       ;0xc24f:   ed b0  ".." 
    EX DE,HL                   ;0xc251:   eb  "." 
    LD BC,0xa49                ;0xc252:   01 49 0a  ".I."  
    LD DE,0                    ;0xc255:   11 00 00  "..."  
    CALL C_C299                ;0xc258:   cd 99 c2  "..." 
    JR nc, C_C292              ;0xc25b:   30 35  "05" 
    EX DE,HL                   ;0xc25d:   eb  "." 
    LD HL,D_EA00               ;0xc25e:   21 00 ea  "!.."  
    ADD HL,DE                  ;0xc261:   19  "." 
    PUSH HL                    ;0xc262:   e5  "." 
    LD HL,D_F206               ;0xc263:   21 06 f2  "!.."  
    ADD HL,DE                  ;0xc266:   19  "." 
    LD A,0xc3                  ;0xc267:   3e c3  ">."  
    LD (0x5),A                 ;0xc269:   32 05 00  "2.."  
    LD (0x6),HL                ;0xc26c:   22 06 00  "".."  
    LD (0x0),A                 ;0xc26f:   32 00 00  "2.."  
    LD HL,3                    ;0xc272:   21 03 00  "!.."  
    ADD HL,DE                  ;0xc275:   19  "." 
    LD (0x1),HL                ;0xc276:   22 01 00  "".."  
    LD HL,C_c17f               ;0xc279:   21 7f c1  "!.."  
    LD BC,0x33                 ;0xc27c:   01 33 00  ".3."  
    LDIR                       ;0xc27f:   ed b0  ".." 
    LD HL,4                    ;0xc281:   21 04 00  "!.."  
    LD A,(HL)                  ;0xc284:   7e  "~" 
    AND 15                     ;0xc285:   e6 0f  ".." 
    CP 2                       ;0xc287:   fe 02  ".." 
    JR c, C_C28D               ;0xc289:   38 02  "8." 
    LD (HL),0                  ;0xc28b:   36 00  "6."  
;--------------------------------------
C_C28D:                        ;          XREF: 0xC289 
    LD C,(HL)                  ;0xc28d:   4e  "N" 
    POP DE                     ;0xc28e:   d1  "." 
    JP C_c177                  ;0xc28f:   c3 77 c1  ".w." 
;--------------------------------------
C_C292:                        ;          XREF: 0xC23F 
    LD A,14                    ;0xc292:   3e 0e  ">."  
    CALL C_CAB8                ;0xc294:   cd b8 ca  "..." 
    JR C_C22B                  ;0xc297:   18 92  ".." 
;--------------------------------------
C_C299:                        ;          XREF: 0xC238 
    CALL EXT_READ_SECTOR           ;0xc299:   cd 66 c6  ".f." 
    RET nc                     ;0xc29c:   d0  "." 
    LD A,C                     ;0xc29d:   79  "y" 
    INC C                      ;0xc29e:   0c  "." 
    CP 0x49                    ;0xc29f:   fe 49  ".I" 
    JR c, C_C2A6               ;0xc2a1:   38 03  "8." 
    LD C,0x41                  ;0xc2a3:   0e 41  ".A"  
    INC D                      ;0xc2a5:   14  "." 
;--------------------------------------
C_C2A6:                        ;          XREF: 0xC2A1 
    INC H                      ;0xc2a6:   24  "$" 
    INC H                      ;0xc2a7:   24  "$" 
    DJNZ C_C299                ;0xc2a8:   10 ef  ".." 
    SCF                        ;0xc2aa:   37  "7" 
    RET                        ;0xc2ab:   c9  "." 
;--------------------------------------
C_C2AC:                        ;          XREF: 0xC215 
    PUSH HL                    ;0xc2ac:   e5  "." 
    LD BC,2                    ;0xc2ad:   01 02 00  "..."  
    LD A,(HL)                  ;0xc2b0:   7e  "~" 
;--------------------------------------
C_C2B1:                        ;          XREF: 0xC2B6 
    CP (HL)                    ;0xc2b1:   be  "." 
    INC HL                     ;0xc2b2:   23  "#" 
    SCF                        ;0xc2b3:   37  "7" 
    JR nz, C_C2BC              ;0xc2b4:   20 06  " ." 
    DJNZ C_C2B1                ;0xc2b6:   10 f9  ".." 
    DEC C                      ;0xc2b8:   0d  "." 
    JR nz, C_C2B1              ;0xc2b9:   20 f6  " ." 
    OR A                       ;0xc2bb:   b7  "." 
;--------------------------------------
C_C2BC:                        ;          XREF: 0xC2B4 
    POP HL                     ;0xc2bc:   e1  "." 
    RET                        ;0xc2bd:   c9  "." 
;--------------------------------------
CPM_WBOOT:                     ;          XREF: 0xC182 
    CALL 0xad33                ;0xc2be:   cd 33 ad  ".3." 
;--------------------------------------
C_C2C1:                        ;          XREF: 0xC0A1 
    DEC HL                     ;0xc2c1:   2b  "+" 
    JP nz, 0x8621              ;0xc2c2:   c2 21 86  ".!." 
    CALL nz, 0x1c18            ;0xc2c5:   c4 18 1c  "..." 
;--------------------------------------
CPM_CONOUT:                    ;          XREF: 0xC18B 
    LD HL,C_c48f               ;0xc2c8:   21 8f c4  "!.."  
    JR C_C2E4                  ;0xc2cb:   18 17  ".." 
;--------------------------------------
CPM_LSTST:                     ;          XREF: 0xC1AC 
    LD HL,C_c498               ;0xc2cd:   21 98 c4  "!.."  
    JR C_C2E4                  ;0xc2d0:   18 12  ".." 
;--------------------------------------
CPM_LIST:                      ;          XREF: 0xC18E 
    LD HL,C_c4a1               ;0xc2d2:   21 a1 c4  "!.."  
    JR C_C2E4                  ;0xc2d5:   18 0d  ".." 
;--------------------------------------
CPM_PUNCH:                     ;          XREF: 0xC191 
    LD HL,C_c4aa               ;0xc2d7:   21 aa c4  "!.."  
    JR C_C2E4                  ;0xc2da:   18 08  ".." 
;--------------------------------------
CPM_READER:                    ;          XREF: 0xC194 
    LD HL,C_c4bc               ;0xc2dc:   21 bc c4  "!.."  
    JR C_C2E4                  ;0xc2df:   18 03  ".." 
;--------------------------------------
CPM_CONST:                     ;          XREF: 0xC185 
    LD HL,C_c47d               ;0xc2e1:   21 7d c4  "!}."  
;--------------------------------------
C_C2E4:                        ;          XREF: 0xC2CB 
    CALL 0xad33                ;0xc2e4:   cd 33 ad  ".3." 
    LD L,D                     ;0xc2e7:   6a  "j" 
    CALL nz, 0x68cd            ;0xc2e8:   c4 cd 68  "..h" 
    POP BC                     ;0xc2eb:   c1  "." 
    RRA                        ;0xc2ec:   1f  "." 
    PUSH BC                    ;0xc2ed:   c5  "." 
    LD HL,0xbe89               ;0xc2ee:   21 89 be  "!.."  
    RET                        ;0xc2f1:   c9  "." 
;--------------------------------------
CPM_SELDSK:                    ;          XREF: 0xC19A 
    CALL 0xad33                ;0xc2f2:   cd 33 ad  ".3." 
    RET p                      ;0xc2f5:   f0  "." 
    CALL nz, 0x33cd            ;0xc2f6:   c4 cd 33  "..3" 
    XOR L                      ;0xc2f9:   ad  "." 
    LD C,H                     ;0xc2fa:   4c  "L" 
    PUSH BC                    ;0xc2fb:   c5  "." 
;--------------------------------------
CPM_WRITE:                     ;          XREF: 0xC1A9 
    CALL 0xad33                ;0xc2fc:   cd 33 ad  ".3." 
    LD L,0xc5                  ;0xc2ff:   2e c5  ".."  
;--------------------------------------
SET_CMD_BUFFER:                ;          XREF: 0xC057 
    LD (0xadc5),A              ;0xc301:   32 c5 ad  "2.."  
    LD BC,0x81                 ;0xc304:   01 81 00  "..."  
    LD DE,0xad42               ;0xc307:   11 42 ad  ".B."  
    LDIR                       ;0xc30a:   ed b0  ".." 
    LD HL,0xad43               ;0xc30c:   21 43 ad  "!C."  
    LD (0xadc3),HL             ;0xc30f:   22 c3 ad  "".."  
    RET                        ;0xc312:   c9  "." 
;--------------------------------------
C_C313:                        ;          XREF: 0xC4D6 
    LD HL,0xad41               ;0xc313:   21 41 ad  "!A."  
    LD A,(HL)                  ;0xc316:   7e  "~" 
    OR A                       ;0xc317:   b7  "." 
    JR z, C_C31E               ;0xc318:   28 04  "(." 
    DEC (HL)                   ;0xc31a:   35  "5" 
    CALL z, 0xbb81             ;0xc31b:   cc 81 bb  "..." 
;--------------------------------------
C_C31E:                        ;          XREF: 0xC318 
    CALL KM_READ_CHAR          ;0xc31e:   cd 09 bb  "..." 
    CALL c, 0xbb0c             ;0xc321:   dc 0c bb  "..." 
    SBC A,A                    ;0xc324:   9f  "." 
    RET                        ;0xc325:   c9  "." 
;--------------------------------------
C_C326:                        ;          XREF: 0xC4CD 
    LD HL,0xad42               ;0xc326:   21 42 ad  "!B."  
    LD A,(HL)                  ;0xc329:   7e  "~" 
    OR A                       ;0xc32a:   b7  "." 
    JR z, C_C348               ;0xc32b:   28 1b  "(." 
    CALL KM_READ_CHAR          ;0xc32d:   cd 09 bb  "..." 
    JR nc, C_C33E              ;0xc330:   30 0c  "0." 
    LD HL,0xadc5               ;0xc332:   21 c5 ad  "!.."  
    INC (HL)                   ;0xc335:   34  "4" 
    DEC (HL)                   ;0xc336:   35  "5" 
    RET nz                     ;0xc337:   c0  "." 
    LD HL,0xad42               ;0xc338:   21 42 ad  "!B."  
    LD (HL),0                  ;0xc33b:   36 00  "6."  
    RET                        ;0xc33d:   c9  "." 
;--------------------------------------
C_C33E:                        ;          XREF: 0xC330 
    DEC (HL)                   ;0xc33e:   35  "5" 
    LD HL,(0xadc3)             ;0xc33f:   2a c3 ad  "*.."  
    LD A,(HL)                  ;0xc342:   7e  "~" 
    INC HL                     ;0xc343:   23  "#" 
    LD (0xadc3),HL             ;0xc344:   22 c3 ad  "".."  
    RET                        ;0xc347:   c9  "." 
;--------------------------------------
C_C348:                        ;          XREF: 0xC32B 
    LD HL,0xad41               ;0xc348:   21 41 ad  "!A."  
    LD A,(HL)                  ;0xc34b:   7e  "~" 
    OR A                       ;0xc34c:   b7  "." 
    CALL nz, 0xbb81            ;0xc34d:   c4 81 bb  "..." 
    LD (HL),0                  ;0xc350:   36 00  "6."  
    JP KM_WAIT_CHAR            ;0xc352:   c3 06 bb  "..." 
    LD A,0x1a                  ;0xc355:   3e 1a  ">."  
    RET                        ;0xc357:   c9  "." 
    LD A,0xff                  ;0xc358:   3e ff  ">."  
    RET                        ;0xc35a:   c9  "." 
    LD HL,0xad41               ;0xc35b:   21 41 ad  "!A."  
    LD A,(HL)                  ;0xc35e:   7e  "~" 
    OR A                       ;0xc35f:   b7  "." 
    CALL z, 0xbb84             ;0xc360:   cc 84 bb  "..." 
    LD (HL),0xff               ;0xc363:   36 ff  "6."  
    LD A,C                     ;0xc365:   79  "y" 
    CALL TXT_OUTPUT            ;0xc366:   cd 5a bb  ".Z." 
    CP 0x20                    ;0xc369:   fe 20  ". " 
    RET nc                     ;0xc36b:   d0  "." 
    CALL TXT_GET_CURSOR        ;0xc36c:   cd 78 bb  ".x." 
    CALL 0xbb87                ;0xc36f:   cd 87 bb  "..." 
    RET c                      ;0xc372:   d8  "." 
    CALL 0xbb8a                ;0xc373:   cd 8a bb  "..." 
    JP 0xbb8d                  ;0xc376:   c3 8d bb  "..." 
;--------------------------------------
C_C379:                        ;          XREF: 0xC49C 
    CALL MC_BUSY_PRINTER       ;0xc379:   cd 2e bd  "..." 
    CCF                        ;0xc37c:   3f  "?" 
    SBC A,A                    ;0xc37d:   9f  "." 
    RET                        ;0xc37e:   c9  "." 
;--------------------------------------
C_C37F:                        ;          XREF: 0xC387 
    LD A,C                     ;0xc37f:   79  "y" 
    CALL MC_PRINT_CHAR         ;0xc380:   cd 2b bd  ".+." 
    RET c                      ;0xc383:   d8  "." 
    CALL C_C4D3                ;0xc384:   cd d3 c4  "..." 
    JR C_C37F                  ;0xc387:   18 f6  ".." 
;--------------------------------------
SET_SIO:                       ;          XREF: 0xC054 
    DI                         ;0xc389:   f3  "." 
    LD BC,D_FADD               ;0xc38a:   01 dd fa  "..."  
    LD DE,0xadc6               ;0xc38d:   11 c6 ad  "..."  
    CALL C_C3BD                ;0xc390:   cd bd c3  "..." 
    INC BC                     ;0xc393:   03  "." 
    INC BC                     ;0xc394:   03  "." 
    INC DE                     ;0xc395:   13  "." 
    CALL C_C3BD                ;0xc396:   cd bd c3  "..." 
    LD A,0x36                  ;0xc399:   3e 36  ">6"  
    LD E,0xdc                  ;0xc39b:   1e dc  ".."  
    CALL C_C3AE                ;0xc39d:   cd ae c3  "..." 
    LD A,0x76                  ;0xc3a0:   3e 76  ">v"  
    INC E                      ;0xc3a2:   1c  "." 
    CALL C_C3AE                ;0xc3a3:   cd ae c3  "..." 
    LD A,0xb6                  ;0xc3a6:   3e b6  ">."  
    INC E                      ;0xc3a8:   1c  "." 
    CALL C_C3AE                ;0xc3a9:   cd ae c3  "..." 
    EI                         ;0xc3ac:   fb  "." 
    RET                        ;0xc3ad:   c9  "." 
;--------------------------------------
C_C3AE:                        ;          XREF: 0xC39D 
    LD BC,D_FBDF               ;0xc3ae:   01 df fb  "..."  
    OUT (C),A                  ;0xc3b1:   ed 79  ".y" 
    LD C,E                     ;0xc3b3:   4b  "K" 
    LD A,(HL)                  ;0xc3b4:   7e  "~" 
    INC HL                     ;0xc3b5:   23  "#" 
    OUT (C),A                  ;0xc3b6:   ed 79  ".y" 
    LD A,(HL)                  ;0xc3b8:   7e  "~" 
    INC HL                     ;0xc3b9:   23  "#" 
    OUT (C),A                  ;0xc3ba:   ed 79  ".y" 
    RET                        ;0xc3bc:   c9  "." 
;--------------------------------------
C_C3BD:                        ;          XREF: 0xC390 
    LD A,0x18                  ;0xc3bd:   3e 18  ">."  
    OUT (C),A                  ;0xc3bf:   ed 79  ".y" 
    LD A,4                     ;0xc3c1:   3e 04  ">."  
    OUT (C),A                  ;0xc3c3:   ed 79  ".y" 
    LD A,(HL)                  ;0xc3c5:   7e  "~" 
    INC HL                     ;0xc3c6:   23  "#" 
    OUT (C),A                  ;0xc3c7:   ed 79  ".y" 
    LD A,5                     ;0xc3c9:   3e 05  ">."  
    OUT (C),A                  ;0xc3cb:   ed 79  ".y" 
    LD A,(HL)                  ;0xc3cd:   7e  "~" 
    LD (DE),A                  ;0xc3ce:   12  "." 
    INC HL                     ;0xc3cf:   23  "#" 
    OUT (C),A                  ;0xc3d0:   ed 79  ".y" 
    LD A,3                     ;0xc3d2:   3e 03  ">."  
    OUT (C),A                  ;0xc3d4:   ed 79  ".y" 
    LD A,(HL)                  ;0xc3d6:   7e  "~" 
    INC HL                     ;0xc3d7:   23  "#" 
    OUT (C),A                  ;0xc3d8:   ed 79  ".y" 
    RET                        ;0xc3da:   c9  "." 
;--------------------------------------
D0_IN_STATUS:                  ;          XREF: 0xC05A 
    LD BC,D_FADD               ;0xc3db:   01 dd fa  "..."  
    LD HL,0xadc6               ;0xc3de:   21 c6 ad  "!.."  
    JR C_C3E9                  ;0xc3e1:   18 06  ".." 
;--------------------------------------
D1_IN_STATUS:                  ;          XREF: 0xC066 
    LD BC,D_FADF               ;0xc3e3:   01 df fa  "..."  
    LD HL,0xadc7               ;0xc3e6:   21 c7 ad  "!.."  
;--------------------------------------
C_C3E9:                        ;          XREF: 0xC3E1 
    IN A,(C)                   ;0xc3e9:   ed 78  ".x" 
    RRCA                       ;0xc3eb:   0f  "." 
    SBC A,A                    ;0xc3ec:   9f  "." 
    RET c                      ;0xc3ed:   d8  "." 
    CALL C_C424                ;0xc3ee:   cd 24 c4  ".$." 
    IN A,(C)                   ;0xc3f1:   ed 78  ".x" 
    RRCA                       ;0xc3f3:   0f  "." 
    SBC A,A                    ;0xc3f4:   9f  "." 
    JR C_C420                  ;0xc3f5:   18 29  ".)" 
;--------------------------------------
D0_IN:                         ;          XREF: 0xC05D 
    LD BC,D_FADD               ;0xc3f7:   01 dd fa  "..."  
    LD HL,0xadc6               ;0xc3fa:   21 c6 ad  "!.."  
    JR C_C405                  ;0xc3fd:   18 06  ".." 
;--------------------------------------
D1_IN:                         ;          XREF: 0xC069 
    LD BC,D_FADF               ;0xc3ff:   01 df fa  "..."  
    LD HL,0xadc7               ;0xc402:   21 c7 ad  "!.."  
;--------------------------------------
C_C405:                        ;          XREF: 0xC3FD 
    IN A,(C)                   ;0xc405:   ed 78  ".x" 
    RRCA                       ;0xc407:   0f  "." 
    JR c, C_C41C               ;0xc408:   38 12  "8." 
    CALL C_C424                ;0xc40a:   cd 24 c4  ".$." 
;--------------------------------------
C_C40D:                        ;          XREF: 0xC417 
    CALL C_C4C5                ;0xc40d:   cd c5 c4  "..." 
    CP 0x1a                    ;0xc410:   fe 1a  ".." 
    JR z, C_C420               ;0xc412:   28 0c  "(." 
    IN A,(C)                   ;0xc414:   ed 78  ".x" 
    RRCA                       ;0xc416:   0f  "." 
    JR nc, C_C40D              ;0xc417:   30 f4  "0." 
    CALL C_C420                ;0xc419:   cd 20 c4  ". ." 
;--------------------------------------
C_C41C:                        ;          XREF: 0xC408 
    DEC BC                     ;0xc41c:   0b  "." 
    IN A,(C)                   ;0xc41d:   ed 78  ".x" 
    RET                        ;0xc41f:   c9  "." 
;--------------------------------------
C_C420:                        ;          XREF: 0xC3F5 
    LD E,0                     ;0xc420:   1e 00  ".."  
    JR C_C426                  ;0xc422:   18 02  ".." 
;--------------------------------------
C_C424:                        ;          XREF: 0xC3EE 
    LD E,0x80                  ;0xc424:   1e 80  ".."  
;--------------------------------------
C_C426:                        ;          XREF: 0xC422 
    DI                         ;0xc426:   f3  "." 
    PUSH AF                    ;0xc427:   f5  "." 
    LD A,5                     ;0xc428:   3e 05  ">."  
    OUT (C),A                  ;0xc42a:   ed 79  ".y" 
    LD A,(HL)                  ;0xc42c:   7e  "~" 
    AND 0x7f                   ;0xc42d:   e6 7f  ".." 
    OR E                       ;0xc42f:   b3  "." 
    OUT (C),A                  ;0xc430:   ed 79  ".y" 
    POP AF                     ;0xc432:   f1  "." 
    EI                         ;0xc433:   fb  "." 
    RET                        ;0xc434:   c9  "." 
;--------------------------------------
D0_OUT_STATUS:                 ;          XREF: 0xC060 
    LD BC,D_FADD               ;0xc435:   01 dd fa  "..."  
    JR C_C43D                  ;0xc438:   18 03  ".." 
;--------------------------------------
D1_OUT_STATUS:                 ;          XREF: 0xC06C 
    LD BC,D_FADF               ;0xc43a:   01 df fa  "..."  
;--------------------------------------
C_C43D:                        ;          XREF: 0xC438 
    IN A,(C)                   ;0xc43d:   ed 78  ".x" 
    AND 4                      ;0xc43f:   e6 04  ".." 
    RET z                      ;0xc441:   c8  "." 
    SCF                        ;0xc442:   37  "7" 
    SBC A,A                    ;0xc443:   9f  "." 
    RET                        ;0xc444:   c9  "." 
;--------------------------------------
D0_OUT:                        ;          XREF: 0xC063 
    LD A,C                     ;0xc445:   79  "y" 
    LD BC,D_FADD               ;0xc446:   01 dd fa  "..."  
    JR C_C44F                  ;0xc449:   18 04  ".." 
;--------------------------------------
D1_OUT:                        ;          XREF: 0xC06F 
    LD A,C                     ;0xc44b:   79  "y" 
    LD BC,D_FADF               ;0xc44c:   01 df fa  "..."  
;--------------------------------------
C_C44F:                        ;          XREF: 0xC449 
    PUSH AF                    ;0xc44f:   f5  "." 
;--------------------------------------
C_C450:                        ;          XREF: 0xC456 
    CALL C_C4D3                ;0xc450:   cd d3 c4  "..." 
    CALL C_C43D                ;0xc453:   cd 3d c4  ".=." 
    JR nc, C_C450              ;0xc456:   30 f8  "0." 
    POP AF                     ;0xc458:   f1  "." 
    DEC BC                     ;0xc459:   0b  "." 
    OUT (C),A                  ;0xc45a:   ed 79  ".y" 
    RET                        ;0xc45c:   c9  "." 
;--------------------------------------
C_C45D:                        ;          XREF: 0xC481 
    LD HL,C_c4b3               ;0xc45d:   21 b3 c4  "!.."  
    JR C_C46A                  ;0xc460:   18 08  ".." 
    LD HL,C_c4bc               ;0xc462:   21 bc c4  "!.."  
    JR C_C46A                  ;0xc465:   18 03  ".." 
;--------------------------------------
C_C467:                        ;          XREF: 0xC493 
    LD HL,C_c4a1               ;0xc467:   21 a1 c4  "!.."  
;--------------------------------------
C_C46A:                        ;          XREF: 0xC460 
    LD B,(HL)                  ;0xc46a:   46  "F" 
    INC HL                     ;0xc46b:   23  "#" 
    LD A,(0x3)                 ;0xc46c:   3a 03 00  ":.."  
;--------------------------------------
C_C46F:                        ;          XREF: 0xC470 
    RLCA                       ;0xc46f:   07  "." 
    DJNZ C_C46F                ;0xc470:   10 fd  ".." 
    AND 6                      ;0xc472:   e6 06  ".." 
    LD D,0                     ;0xc474:   16 00  ".."  
    LD E,A                     ;0xc476:   5f  "_" 
    ADD HL,DE                  ;0xc477:   19  "." 
    LD E,(HL)                  ;0xc478:   5e  "^" 
    INC HL                     ;0xc479:   23  "#" 
    LD D,(HL)                  ;0xc47a:   56  "V" 
    EX DE,HL                   ;0xc47b:   eb  "." 
    JP (HL)                    ;0xc47c:   e9  "." 
;--------------------------------------
C_c47d:                        ;          XREF: 0xC2E1 
    LD BC,0xbea7               ;0xc47d:   01 a7 be  "..."  
    INC DE                     ;0xc480:   13  "." 
    JP C_C45D                  ;0xc481:   c3 5d c4  ".]." 
    OR E                       ;0xc484:   b3  "." 
    CP (HL)                    ;0xc485:   be  "." 
    LD BC,0xbeaa               ;0xc486:   01 aa be  "..."  
    LD H,0xc3                  ;0xc489:   26 c3  "&."  
    LD H,D                     ;0xc48b:   62  "b" 
    CALL nz, 0xbeb6            ;0xc48c:   c4 b6 be  "..." 
;--------------------------------------
C_c48f:                        ;          XREF: 0xC2C8 
    LD BC,0xbeb0               ;0xc48f:   01 b0 be  "..."  
    LD E,E                     ;0xc492:   5b  "[" 
    JP C_C467                  ;0xc493:   c3 67 c4  ".g." 
    CP H                       ;0xc496:   bc  "." 
    CP (HL)                    ;0xc497:   be  "." 
;--------------------------------------
C_c498:                        ;          XREF: 0xC2CD 
    INC BC                     ;0xc498:   03  "." 
    XOR L                      ;0xc499:   ad  "." 
    CP (HL)                    ;0xc49a:   be  "." 
    LD E,B                     ;0xc49b:   58  "X" 
    JP C_C379                  ;0xc49c:   c3 79 c3  ".y." 
    CP C                       ;0xc49f:   b9  "." 
    CP (HL)                    ;0xc4a0:   be  "." 
;--------------------------------------
C_c4a1:                        ;          XREF: 0xC2D2 0xC467 
    INC BC                     ;0xc4a1:   03  "." 
    OR B                       ;0xc4a2:   b0  "." 
    CP (HL)                    ;0xc4a3:   be  "." 
    LD E,E                     ;0xc4a4:   5b  "[" 
    JP C_C37F                  ;0xc4a5:   c3 7f c3  "..." 
    CP H                       ;0xc4a8:   bc  "." 
    CP (HL)                    ;0xc4a9:   be  "." 
;--------------------------------------
C_c4aa:                        ;          XREF: 0xC2D7 
    DEC B                      ;0xc4aa:   05  "." 
    OR B                       ;0xc4ab:   b0  "." 
    CP (HL)                    ;0xc4ac:   be  "." 
    LD E,D                     ;0xc4ad:   5a  "Z" 
    JP 0xbebc                  ;0xc4ae:   c3 bc be  "..." 
    LD E,E                     ;0xc4b1:   5b  "[" 
    JP 0xa707                  ;0xc4b2:   c3 07 a7  "..." 
    CP (HL)                    ;0xc4b5:   be  "." 
    LD E,B                     ;0xc4b6:   58  "X" 
    JP 0xbeb3                  ;0xc4b7:   c3 b3 be  "..." 
    INC DE                     ;0xc4ba:   13  "." 
    JP 0xaa07                  ;0xc4bb:   c3 07 aa  "..." 
    CP (HL)                    ;0xc4be:   be  "." 
    LD D,L                     ;0xc4bf:   55  "U" 
    JP 0xbeb6                  ;0xc4c0:   c3 b6 be  "..." 
    LD H,0xc3                  ;0xc4c3:   26 c3  "&."  
;--------------------------------------
C_C4C5:                        ;          XREF: 0xC40D 
    CALL C_C4D3                ;0xc4c5:   cd d3 c4  "..." 
    CP 0x13                    ;0xc4c8:   fe 13  ".." 
    RET nz                     ;0xc4ca:   c0  "." 
    PUSH HL                    ;0xc4cb:   e5  "." 
    PUSH BC                    ;0xc4cc:   c5  "." 
    CALL C_C326                ;0xc4cd:   cd 26 c3  ".&." 
    POP BC                     ;0xc4d0:   c1  "." 
    POP HL                     ;0xc4d1:   e1  "." 
    RET                        ;0xc4d2:   c9  "." 
;--------------------------------------
C_C4D3:                        ;          XREF: 0xC384 
    PUSH HL                    ;0xc4d3:   e5  "." 
    PUSH DE                    ;0xc4d4:   d5  "." 
    PUSH BC                    ;0xc4d5:   c5  "." 
    CALL C_C313                ;0xc4d6:   cd 13 c3  "..." 
    OR A                       ;0xc4d9:   b7  "." 
    JR z, C_C4EB               ;0xc4da:   28 0f  "(." 
    CALL C_C326                ;0xc4dc:   cd 26 c3  ".&." 
    CP 3                       ;0xc4df:   fe 03  ".." 
    JR nz, C_C4EB              ;0xc4e1:   20 08  " ." 
    LD A,13                    ;0xc4e3:   3e 0d  ">."  
    CALL C_CAEB                ;0xc4e5:   cd eb ca  "..." 
    JP C_C22B                  ;0xc4e8:   c3 2b c2  ".+." 
;--------------------------------------
C_C4EB:                        ;          XREF: 0xC4DA 
    POP BC                     ;0xc4eb:   c1  "." 
    POP DE                     ;0xc4ec:   d1  "." 
    POP HL                     ;0xc4ed:   e1  "." 
    RET                        ;0xc4ee:   c9  "." 
    RST 0x38                   ;0xc4ef:   ff  "." 
;--------------------------------------
C_C4F0:                        ;          XREF: 0xCE2D 
    LD A,C                     ;0xc4f0:   79  "y" 
    CP 2                       ;0xc4f1:   fe 02  ".." 
    LD HL,0                    ;0xc4f3:   21 00 00  "!.."  
    RET nc                     ;0xc4f6:   d0  "." 
    LD A,E                     ;0xc4f7:   7b  "{" 
    RRA                        ;0xc4f8:   1f  "." 
    JR c, C_C50A               ;0xc4f9:   38 0f  "8." 
    LD E,C                     ;0xc4fb:   59  "Y" 
    LD A,0x18                  ;0xc4fc:   3e 18  ">."  
    CALL C_CA5C                ;0xc4fe:   cd 5c ca  ".\." 
    OR A                       ;0xc501:   b7  "." 
    JR nz, C_C50A              ;0xc502:   20 06  " ." 
    PUSH HL                    ;0xc504:   e5  "." 
    CALL C_C56C                ;0xc505:   cd 6c c5  ".l." 
    POP HL                     ;0xc508:   e1  "." 
    RET nc                     ;0xc509:   d0  "." 
;--------------------------------------
C_C50A:                        ;          XREF: 0xC4F9 
    LD A,C                     ;0xc50a:   79  "y" 
    LD (0xbe53),A              ;0xc50b:   32 53 be  "2S."  
    LD HL,0x210                ;0xc50e:   21 10 02  "!.."  
    OR A                       ;0xc511:   b7  "." 
    JR z, C_C517               ;0xc512:   28 03  "(." 
    LD HL,0x220                ;0xc514:   21 20 02  "! ."  
;--------------------------------------
C_C517:                        ;          XREF: 0xC512 
    JP C_CA9F                  ;0xc517:   c3 9f ca  "..." 
;--------------------------------------
CPM_SETDMA:                    ;          XREF: 0xC1A3 
    LD (0xbe60),BC             ;0xc51a:   ed 43 60 be  ".C`."  
    RET                        ;0xc51e:   c9  "." 
;--------------------------------------
C_C51F:                        ;          XREF: 0xD1D3 
    CALL C_C86F                ;0xc51f:   cd 6f c8  ".o." 
    LD C,0                     ;0xc522:   0e 00  ".."  
;--------------------------------------
CPM_SETTRK:                    ;          XREF: 0xC19D 
    LD A,C                     ;0xc524:   79  "y" 
    LD (0xbe54),A              ;0xc525:   32 54 be  "2T."  
    RET                        ;0xc528:   c9  "." 
;--------------------------------------
CPM_SETSEC:                    ;          XREF: 0xC1A0 
    LD A,C                     ;0xc529:   79  "y" 
    LD (0xbe55),A              ;0xc52a:   32 55 be  "2U."  
    RET                        ;0xc52d:   c9  "." 
;--------------------------------------
C_C52E:                        ;          XREF: 0xD9FB 
    PUSH BC                    ;0xc52e:   c5  "." 
    LD A,C                     ;0xc52f:   79  "y" 
    CP 2                       ;0xc530:   fe 02  ".." 
    CALL z, C_C7EB             ;0xc532:   cc eb c7  "..." 
    CALL C_C800                ;0xc535:   cd 00 c8  "..." 
;--------------------------------------
C_c538:                        ;          XREF: 0xF864 
    CALL c, C_C81B             ;0xc538:   dc 1b c8  "..." 
    CALL C_C832                ;0xc53b:   cd 32 c8  ".2." 
    POP BC                     ;0xc53e:   c1  "." 
    RET nc                     ;0xc53f:   d0  "." 
    CALL C_C8B6                ;0xc540:   cd b6 c8  "..." 
    DEC C                      ;0xc543:   0d  "." 
    SCF                        ;0xc544:   37  "7" 
    CALL z, C_C86F             ;0xc545:   cc 6f c8  ".o." 
    RET nc                     ;0xc548:   d0  "." 
    LD A,0                     ;0xc549:   3e 00  ">."  
    RET                        ;0xc54b:   c9  "." 
;--------------------------------------
C_C54C:                        ;          XREF: 0xD9EE 
    XOR A                      ;0xc54c:   af  "." 
    LD (0xbe59),A              ;0xc54d:   32 59 be  "2Y."  
    CALL C_C832                ;0xc550:   cd 32 c8  ".2." 
    CALL C_C8C7                ;0xc553:   cd c7 c8  "..." 
    RET nc                     ;0xc556:   d0  "." 
    LD A,0                     ;0xc557:   3e 00  ">."  
    RET                        ;0xc559:   c9  "." 
;--------------------------------------
CPM_SECTRAN:                   ;          XREF: 0xC1AF 
    LD H,B                     ;0xc55a:   60  "`" 
    LD L,C                     ;0xc55b:   69  "i" 
    RET                        ;0xc55c:   c9  "." 
;--------------------------------------
C_c55d:                        ;          XREF: 0xC577 
    LD BC,0xfb7e               ;0xc55d:   01 7e fb  ".~."  
    LD A,0x4a                  ;0xc560:   3e 4a  ">J"  
    CALL C_C95C                ;0xc562:   cd 5c c9  ".\." 
    LD A,E                     ;0xc565:   7b  "{" 
    CALL C_C95C                ;0xc566:   cd 5c c9  ".\." 
    JP C_C8F9                  ;0xc569:   c3 f9 c8  "..." 
;--------------------------------------
C_C56C:                        ;          XREF: 0xC505 
    CALL C_C976                ;0xc56c:   cd 76 c9  ".v." 
    LD A,0x16                  ;0xc56f:   3e 16  ">."  
    CALL C_CA5C                ;0xc571:   cd 5c ca  ".\." 
    LD D,A                     ;0xc574:   57  "W" 
    LD C,0x10                  ;0xc575:   0e 10  ".."  
    LD HL,C_c55d               ;0xc577:   21 5d c5  "!]."  
    CALL C_C6FF                ;0xc57a:   cd ff c6  "..." 
    RET nc                     ;0xc57d:   d0  "." 
    LD A,(0xbe51)              ;0xc57e:   3a 51 be  ":Q."  
;--------------------------------------
EXT_SELECT_FORMAT:             ;          XREF: 0xC039 
    PUSH AF                    ;0xc581:   f5  "." 
    XOR A                      ;0xc582:   af  "." 
    CALL C_CA63                ;0xc583:   cd 63 ca  ".c." 
    PUSH HL                    ;0xc586:   e5  "." 
    EX DE,HL                   ;0xc587:   eb  "." 
    LD HL,C_ca43               ;0xc588:   21 43 ca  "!C."  
    LD BC,0x16                 ;0xc58b:   01 16 00  "..."  
    LDIR                       ;0xc58e:   ed b0  ".." 
    POP HL                     ;0xc590:   e1  "." 
    POP AF                     ;0xc591:   f1  "." 
    AND 0xc0                   ;0xc592:   e6 c0  ".." 
    CP 0x40                    ;0xc594:   fe 40  ".@" 
    SCF                        ;0xc596:   37  "7" 
    RET z                      ;0xc597:   c8  "." 
    LD DE,0xc5ca               ;0xc598:   11 ca c5  "..."  
    CP 0xc0                    ;0xc59b:   fe c0  ".." 
    JR z, C_C5A2               ;0xc59d:   28 03  "(." 
    LD DE,D_C5C0               ;0xc59f:   11 c0 c5  "..."  
;--------------------------------------
C_C5A2:                        ;          XREF: 0xC59D 
    LD A,(DE)                  ;0xc5a2:   1a  "." 
    INC DE                     ;0xc5a3:   13  "." 
    LD (HL),A                  ;0xc5a4:   77  "w" 
    INC HL                     ;0xc5a5:   23  "#" 
    LD A,(DE)                  ;0xc5a6:   1a  "." 
    INC DE                     ;0xc5a7:   13  "." 
    LD (HL),A                  ;0xc5a8:   77  "w" 
    LD BC,4                    ;0xc5a9:   01 04 00  "..."  
    ADD HL,BC                  ;0xc5ac:   09  "." 
    LD A,(DE)                  ;0xc5ad:   1a  "." 
    INC DE                     ;0xc5ae:   13  "." 
    LD (HL),A                  ;0xc5af:   77  "w" 
    INC HL                     ;0xc5b0:   23  "#" 
    LD A,(DE)                  ;0xc5b1:   1a  "." 
    INC DE                     ;0xc5b2:   13  "." 
    LD (HL),A                  ;0xc5b3:   77  "w" 
    LD BC,7                    ;0xc5b4:   01 07 00  "..."  
    ADD HL,BC                  ;0xc5b7:   09  "." 
    EX DE,HL                   ;0xc5b8:   eb  "." 
    LD BC,6                    ;0xc5b9:   01 06 00  "..."  
    LDIR                       ;0xc5bc:   ed b0  ".." 
    SCF                        ;0xc5be:   37  "7" 
    RET                        ;0xc5bf:   c9  "." 
;--------------------------------------
D_C5C0:                        ;          XREF: 0xC59F 
    x9 DEFB 0x20               ;0xc5c0:   " "
    x9 DEFB 0x0                ;0xc5c1:   0x0
;--------------------------------------
C_c5c2:                        ;          XREF: 0xC5C0 
    SBC A,E                    ;0xc5c2:   9b  "." 
    NOP                        ;0xc5c3:   00  "." 
    LD BC,0x100                ;0xc5c4:   01 00 01  "..."  
    EX AF,AF'                  ;0xc5c7:   08  "." 
    LD HL,(0x2450)             ;0xc5c8:   2a 50 24  "*P$"  
    NOP                        ;0xc5cb:   00  "." 
    OR E                       ;0xc5cc:   b3  "." 
    NOP                        ;0xc5cd:   00  "." 
    NOP                        ;0xc5ce:   00  "." 
    NOP                        ;0xc5cf:   00  "." 
    POP BC                     ;0xc5d0:   c1  "." 
    ADD HL,BC                  ;0xc5d1:   09  "." 
    LD HL,(0x3252)             ;0xc5d2:   2a 52 32  "*R2"  
    NOP                        ;0xc5d5:   00  "." 
    JP m, 0xaf00               ;0xc5d6:   fa 00 af  "..." 
    RRCA                       ;0xc5d9:   0f  "." 
    INC C                      ;0xc5da:   0c  "." 
    LD BC,0x1103               ;0xc5db:   01 03 11  "..."  
    LD B,B                     ;0xc5de:   40  "@" 
    CP (HL)                    ;0xc5df:   be  "." 
    LD BC,0x3d                 ;0xc5e0:   01 3d 00  ".=."  
    CALL C_CAAF                ;0xc5e3:   cd af ca  "..." 
    CALL C_C9F4                ;0xc5e6:   cd f4 c9  "..." 
    CALL C_C9E8                ;0xc5e9:   cd e8 c9  "..." 
    LD HL,C_c5d4               ;0xc5ec:   21 d4 c5  "!.."  
    CALL EXT_SETUP_DISC           ;0xc5ef:   cd 0d c6  "..." 
    CALL KL_CURR_SELECTION     ;0xc5f2:   cd 12 b9  "..." 
    LD C,A                     ;0xc5f5:   4f  "O" 
    LD B,0x80                  ;0xc5f6:   06 80  ".."  
    LD HL,0xbe6d               ;0xc5f8:   21 6d be  "!m."  
    LD DE,C_c9d6               ;0xc5fb:   11 d6 c9  "..."  
    CALL KL_INIT_EVENT         ;0xc5fe:   cd ef bc  "..." 
    LD A,0x10                  ;0xc601:   3e 10  ">."  
;--------------------------------------
EXT_SET_RETRY_COUNT:           ;          XREF: 0xC04B 
    PUSH HL                    ;0xc603:   e5  "." 
    LD HL,(0xbe66)             ;0xc604:   2a 66 be  "*f."  
    LD (0xbe66),A              ;0xc607:   32 66 be  "2f."  
    LD A,L                     ;0xc60a:   7d  "}" 
    POP HL                     ;0xc60b:   e1  "." 
    RET                        ;0xc60c:   c9  "." 
;--------------------------------------
EXT_SETUP_DISC:                ;          XREF: 0xC036 
    LD DE,0xbe44               ;0xc60d:   11 44 be  ".D."  
    LD BC,7                    ;0xc610:   01 07 00  "..."  
    LDIR                       ;0xc613:   ed b0  ".." 
    LD BC,0xfb7e               ;0xc615:   01 7e fb  ".~."  
    LD A,3                     ;0xc618:   3e 03  ">."  
    CALL C_C95C                ;0xc61a:   cd 5c c9  ".\." 
    LD A,(0xbe4a)              ;0xc61d:   3a 4a be  ":J."  
    DEC A                      ;0xc620:   3d  "=" 
    RLCA                       ;0xc621:   07  "." 
    RLCA                       ;0xc622:   07  "." 
    RLCA                       ;0xc623:   07  "." 
    CPL                        ;0xc624:   2f  "/" 
    AND 0xf0                   ;0xc625:   e6 f0  ".." 
    OR (HL)                    ;0xc627:   b6  "." 
    CALL C_C95C                ;0xc628:   cd 5c c9  ".\." 
    INC HL                     ;0xc62b:   23  "#" 
    LD A,(HL)                  ;0xc62c:   7e  "~" 
    JP C_C95C                  ;0xc62d:   c3 5c c9  ".\." 
;--------------------------------------
EXT_GET_DRIVE_STATUS:          ;          XREF: 0xC048 
    CALL C_C638                ;0xc630:   cd 38 c6  ".8." 
    RET nc                     ;0xc633:   d0  "." 
    LD A,(0xbe4c)              ;0xc634:   3a 4c be  ":L."  
    RET                        ;0xc637:   c9  "." 
;--------------------------------------
C_C638:                        ;          XREF: 0xC630 
    CALL C_C976                ;0xc638:   cd 76 c9  ".v." 
    PUSH AF                    ;0xc63b:   f5  "." 
    CALL C_C947                ;0xc63c:   cd 47 c9  ".G." 
    LD BC,0xfb7e               ;0xc63f:   01 7e fb  ".~."  
    LD A,4                     ;0xc642:   3e 04  ">."  
    CALL C_C95C                ;0xc644:   cd 5c c9  ".\." 
    POP AF                     ;0xc647:   f1  "." 
    CALL C_C95C                ;0xc648:   cd 5c c9  ".\." 
    JP C_C91C                  ;0xc64b:   c3 1c c9  "..." 
;--------------------------------------
EXT_WRITE_SECTOR:              ;          XREF: 0xC03F 
    LD A,0x45                  ;0xc64e:   3e 45  ">E"  
    JR C_C654                  ;0xc650:   18 02  ".." 
;--------------------------------------
EXT_FORMAT_TRACK:              ;          XREF: 0xC042 
    LD A,0x4d                  ;0xc652:   3e 4d  ">M"  
;--------------------------------------
C_C654:                        ;          XREF: 0xC650 
    CALL C_C976                ;0xc654:   cd 76 c9  ".v." 
    LD B,0x11                  ;0xc657:   06 11  ".."  
    CALL C_C66D                ;0xc659:   cd 6d c6  ".m." 
    LD A,(0xbe48)              ;0xc65c:   3a 48 be  ":H."  
;--------------------------------------
C_C65F:                        ;          XREF: 0xC663 
    DEC A                      ;0xc65f:   3d  "=" 
    INC BC                     ;0xc660:   03  "." 
    INC BC                     ;0xc661:   03  "." 
    INC BC                     ;0xc662:   03  "." 
    JR nz, C_C65F              ;0xc663:   20 fa  " ." 
    RET                        ;0xc665:   c9  "." 
;--------------------------------------
EXT_READ_SECTOR:               ;          XREF: 0xC03C 
    CALL C_C976                ;0xc666:   cd 76 c9  ".v." 
    LD A,0x66                  ;0xc669:   3e 66  ">f"  
    LD B,0x10                  ;0xc66b:   06 10  ".."  
;--------------------------------------
C_C66D:                        ;          XREF: 0xC659 
    LD (0xbe62),HL             ;0xc66d:   22 62 be  ""b."  
    LD H,A                     ;0xc670:   67  "g" 
    LD L,C                     ;0xc671:   69  "i" 
    LD (0xbe74),HL             ;0xc672:   22 74 be  ""t."  
    LD C,B                     ;0xc675:   48  "H" 
    LD HL,C_c67c               ;0xc676:   21 7c c6  "!|."  
    JP C_C6FF                  ;0xc679:   c3 ff c6  "..." 
;--------------------------------------
C_c67c:                        ;          XREF: 0xC676 
    LD HL,(0xbe74)             ;0xc67c:   2a 74 be  "*t."  
    LD BC,0xfb7e               ;0xc67f:   01 7e fb  ".~."  
    LD A,H                     ;0xc682:   7c  "|" 
    CALL C_C95C                ;0xc683:   cd 5c c9  ".\." 
    LD A,E                     ;0xc686:   7b  "{" 
    CALL C_C95C                ;0xc687:   cd 5c c9  ".\." 
    LD A,H                     ;0xc68a:   7c  "|" 
    CP 0x4d                    ;0xc68b:   fe 4d  ".M" 
    JR nz, C_C6A5              ;0xc68d:   20 16  " ." 
    LD A,0x14                  ;0xc68f:   3e 14  ">."  
    CALL C_C959                ;0xc691:   cd 59 c9  ".Y." 
    LD A,0x10                  ;0xc694:   3e 10  ">."  
    CALL C_C959                ;0xc696:   cd 59 c9  ".Y." 
    LD A,0x12                  ;0xc699:   3e 12  ">."  
    CALL C_C959                ;0xc69b:   cd 59 c9  ".Y." 
    LD A,0x13                  ;0xc69e:   3e 13  ">."  
    CALL C_CA5C                ;0xc6a0:   cd 5c ca  ".\." 
    JR C_C6C1                  ;0xc6a3:   18 1c  ".." 
;--------------------------------------
C_C6A5:                        ;          XREF: 0xC68D 
    LD A,D                     ;0xc6a5:   7a  "z" 
    CALL C_C95C                ;0xc6a6:   cd 5c c9  ".\." 
    XOR A                      ;0xc6a9:   af  "." 
    CALL C_C95C                ;0xc6aa:   cd 5c c9  ".\." 
    LD A,L                     ;0xc6ad:   7d  "}" 
    CALL C_C95C                ;0xc6ae:   cd 5c c9  ".\." 
    LD A,0x14                  ;0xc6b1:   3e 14  ">."  
    CALL C_C959                ;0xc6b3:   cd 59 c9  ".Y." 
    LD A,L                     ;0xc6b6:   7d  "}" 
    CALL C_C95C                ;0xc6b7:   cd 5c c9  ".\." 
    LD A,0x11                  ;0xc6ba:   3e 11  ">."  
    CALL C_C959                ;0xc6bc:   cd 59 c9  ".Y." 
    LD A,0xff                  ;0xc6bf:   3e ff  ">."  
;--------------------------------------
C_C6C1:                        ;          XREF: 0xC6A3 
    CALL C_C6D1                ;0xc6c1:   cd d1 c6  "..." 
    EI                         ;0xc6c4:   fb  "." 
    CALL C_C907                ;0xc6c5:   cd 07 c9  "..." 
    RET c                      ;0xc6c8:   d8  "." 
    RET nz                     ;0xc6c9:   c0  "." 
    LD A,(0xbe4d)              ;0xc6ca:   3a 4d be  ":M."  
    ADD A,A                    ;0xc6cd:   87  "." 
    RET c                      ;0xc6ce:   d8  "." 
    XOR A                      ;0xc6cf:   af  "." 
    RET                        ;0xc6d0:   c9  "." 
;--------------------------------------
C_C6D1:                        ;          XREF: 0xC6C1 
    DI                         ;0xc6d1:   f3  "." 
    CALL C_C95C                ;0xc6d2:   cd 5c c9  ".\." 
    LD A,H                     ;0xc6d5:   7c  "|" 
    LD HL,(0xbe62)             ;0xc6d6:   2a 62 be  "*b."  
    CP 0x66                    ;0xc6d9:   fe 66  ".f" 
    JR nz, C_C6F5              ;0xc6db:   20 18  " ." 
    JR C_C6E5                  ;0xc6dd:   18 06  ".." 
;--------------------------------------
C_C6DF:                        ;          XREF: 0xC6EC 
    INC C                      ;0xc6df:   0c  "." 
    IN A,(C)                   ;0xc6e0:   ed 78  ".x" 
    LD (HL),A                  ;0xc6e2:   77  "w" 
    DEC C                      ;0xc6e3:   0d  "." 
    INC HL                     ;0xc6e4:   23  "#" 
;--------------------------------------
C_C6E5:                        ;          XREF: 0xC6DD 
    IN A,(C)                   ;0xc6e5:   ed 78  ".x" 
    JP p, C_C6E5               ;0xc6e7:   f2 e5 c6  "..." 
    AND 0x20                   ;0xc6ea:   e6 20  ". " 
    JR nz, C_C6DF              ;0xc6ec:   20 f1  " ." 
    RET                        ;0xc6ee:   c9  "." 
;--------------------------------------
C_C6EF:                        ;          XREF: 0xC6FC 
    INC C                      ;0xc6ef:   0c  "." 
    LD A,(HL)                  ;0xc6f0:   7e  "~" 
    OUT (C),A                  ;0xc6f1:   ed 79  ".y" 
    DEC C                      ;0xc6f3:   0d  "." 
    INC HL                     ;0xc6f4:   23  "#" 
;--------------------------------------
C_C6F5:                        ;          XREF: 0xC6DB 
    IN A,(C)                   ;0xc6f5:   ed 78  ".x" 
    JP p, C_C6F5               ;0xc6f7:   f2 f5 c6  "..." 
    AND 0x20                   ;0xc6fa:   e6 20  ". " 
    JR nz, C_C6EF              ;0xc6fc:   20 f1  " ." 
    RET                        ;0xc6fe:   c9  "." 
;--------------------------------------
C_C6FF:                        ;          XREF: 0xC57A 
    LD A,(0xbe66)              ;0xc6ff:   3a 66 be  ":f."  
    LD B,A                     ;0xc702:   47  "G" 
;--------------------------------------
C_C703:                        ;          XREF: 0xC715 
    CALL C_C72B                ;0xc703:   cd 2b c7  ".+." 
    RET c                      ;0xc706:   d8  "." 
    JR z, C_C722               ;0xc707:   28 19  "(." 
    LD A,B                     ;0xc709:   78  "x" 
    AND 4                      ;0xc70a:   e6 04  ".." 
    JR z, C_C717               ;0xc70c:   28 09  "(." 
    PUSH DE                    ;0xc70e:   d5  "." 
    LD D,0x27                  ;0xc70f:   16 27  ".'"  
    CALL C_C766                ;0xc711:   cd 66 c7  ".f." 
    POP DE                     ;0xc714:   d1  "." 
    JR C_C703                  ;0xc715:   18 ec  ".." 
;--------------------------------------
C_C717:                        ;          XREF: 0xC70C 
    PUSH HL                    ;0xc717:   e5  "." 
    LD A,0x17                  ;0xc718:   3e 17  ">."  
    CALL C_CA63                ;0xc71a:   cd 63 ca  ".c." 
    LD (HL),0                  ;0xc71d:   36 00  "6."  
    POP HL                     ;0xc71f:   e1  "." 
    JR C_C703                  ;0xc720:   18 e1  ".." 
;--------------------------------------
C_C722:                        ;          XREF: 0xC707 
    LD A,C                     ;0xc722:   79  "y" 
    PUSH BC                    ;0xc723:   c5  "." 
    CALL C_CA7A                ;0xc724:   cd 7a ca  ".z." 
    POP BC                     ;0xc727:   c1  "." 
    JR nz, C_C6FF              ;0xc728:   20 d5  " ." 
    RET                        ;0xc72a:   c9  "." 
;--------------------------------------
C_C72B:                        ;          XREF: 0xC703 
    CALL C_C754                ;0xc72b:   cd 54 c7  ".T." 
    RET c                      ;0xc72e:   d8  "." 
    RET z                      ;0xc72f:   c8  "." 
    CALL C_C947                ;0xc730:   cd 47 c9  ".G." 
    CALL C_C754                ;0xc733:   cd 54 c7  ".T." 
    RET c                      ;0xc736:   d8  "." 
    RET z                      ;0xc737:   c8  "." 
    LD A,D                     ;0xc738:   7a  "z" 
    CP 0x27                    ;0xc739:   fe 27  ".'" 
    DEC B                      ;0xc73b:   05  "." 
    JR nc, C_C748              ;0xc73c:   30 0a  "0." 
    INC B                      ;0xc73e:   04  "." 
    INC D                      ;0xc73f:   14  "." 
    CALL C_C766                ;0xc740:   cd 66 c7  ".f." 
    DEC D                      ;0xc743:   15  "." 
    CALL C_C754                ;0xc744:   cd 54 c7  ".T." 
    RET c                      ;0xc747:   d8  "." 
;--------------------------------------
C_C748:                        ;          XREF: 0xC73C 
    RET z                      ;0xc748:   c8  "." 
    LD A,D                     ;0xc749:   7a  "z" 
    OR A                       ;0xc74a:   b7  "." 
    JR nz, C_C74F              ;0xc74b:   20 02  " ." 
    DEC B                      ;0xc74d:   05  "." 
    RET                        ;0xc74e:   c9  "." 
;--------------------------------------
C_C74F:                        ;          XREF: 0xC74B 
    DEC D                      ;0xc74f:   15  "." 
    CALL C_C766                ;0xc750:   cd 66 c7  ".f." 
    INC D                      ;0xc753:   14  "." 
;--------------------------------------
C_C754:                        ;          XREF: 0xC72B 
    CALL C_C766                ;0xc754:   cd 66 c7  ".f." 
    PUSH HL                    ;0xc757:   e5  "." 
    PUSH BC                    ;0xc758:   c5  "." 
    CALL 0x1e                  ;0xc759:   cd 1e 00  "..." 
    POP BC                     ;0xc75c:   c1  "." 
    POP HL                     ;0xc75d:   e1  "." 
    RET c                      ;0xc75e:   d8  "." 
    JR nz, C_C754              ;0xc75f:   20 f3  " ." 
    DEC B                      ;0xc761:   05  "." 
    RET                        ;0xc762:   c9  "." 
;--------------------------------------
EXT_MOVE_TRACK:                ;          XREF: 0xC045 
    CALL C_C976                ;0xc763:   cd 76 c9  ".v." 
;--------------------------------------
C_C766:                        ;          XREF: 0xC711 
    PUSH HL                    ;0xc766:   e5  "." 
    PUSH DE                    ;0xc767:   d5  "." 
    PUSH BC                    ;0xc768:   c5  "." 
    LD A,(0xbe66)              ;0xc769:   3a 66 be  ":f."  
    LD B,A                     ;0xc76c:   47  "G" 
    LD A,0x17                  ;0xc76d:   3e 17  ">."  
    CALL C_CA63                ;0xc76f:   cd 63 ca  ".c." 
    LD A,(HL)                  ;0xc772:   7e  "~" 
    OR A                       ;0xc773:   b7  "." 
    JR nz, C_C795              ;0xc774:   20 1f  " ." 
;--------------------------------------
C_C776:                        ;          XREF: 0xC7B7 
    PUSH BC                    ;0xc776:   c5  "." 
    LD BC,0xfb7e               ;0xc777:   01 7e fb  ".~."  
    LD A,7                     ;0xc77a:   3e 07  ">."  
    CALL C_C95C                ;0xc77c:   cd 5c c9  ".\." 
    LD A,E                     ;0xc77f:   7b  "{" 
    CALL C_C95C                ;0xc780:   cd 5c c9  ".\." 
    LD A,0x28                  ;0xc783:   3e 28  ">("  
    CALL C_C7C7                ;0xc785:   cd c7 c7  "..." 
    JR nc, C_C7B4              ;0xc788:   30 2a  "0*" 
    LD A,0x16                  ;0xc78a:   3e 16  ">."  
    CALL C_CA63                ;0xc78c:   cd 63 ca  ".c." 
    LD (HL),0                  ;0xc78f:   36 00  "6."  
    INC HL                     ;0xc791:   23  "#" 
    LD (HL),0xff               ;0xc792:   36 ff  "6."  
    POP BC                     ;0xc794:   c1  "." 
;--------------------------------------
C_C795:                        ;          XREF: 0xC774 
    DEC HL                     ;0xc795:   2b  "+" 
    LD A,(HL)                  ;0xc796:   7e  "~" 
    SUB D                      ;0xc797:   92  "." 
    JR z, C_C7C2               ;0xc798:   28 28  "((" 
    PUSH BC                    ;0xc79a:   c5  "." 
    LD BC,0xfb7e               ;0xc79b:   01 7e fb  ".~."  
    LD A,15                    ;0xc79e:   3e 0f  ">."  
    CALL C_C95C                ;0xc7a0:   cd 5c c9  ".\." 
    LD A,E                     ;0xc7a3:   7b  "{" 
    CALL C_C95C                ;0xc7a4:   cd 5c c9  ".\." 
    LD A,D                     ;0xc7a7:   7a  "z" 
    CALL C_C95C                ;0xc7a8:   cd 5c c9  ".\." 
    SUB (HL)                   ;0xc7ab:   96  "." 
    JR nc, C_C7B0              ;0xc7ac:   30 02  "0." 
    LD A,(HL)                  ;0xc7ae:   7e  "~" 
    SUB D                      ;0xc7af:   92  "." 
;--------------------------------------
C_C7B0:                        ;          XREF: 0xC7AC 
    LD (HL),D                  ;0xc7b0:   72  "r" 
    CALL C_C7C7                ;0xc7b1:   cd c7 c7  "..." 
;--------------------------------------
C_C7B4:                        ;          XREF: 0xC788 
    POP BC                     ;0xc7b4:   c1  "." 
    JR c, C_C7C2               ;0xc7b5:   38 0b  "8." 
    JR nz, C_C776              ;0xc7b7:   20 bd  " ." 
    DEC B                      ;0xc7b9:   05  "." 
    JP z, C_c9ad               ;0xc7ba:   ca ad c9  "..." 
    CALL C_C947                ;0xc7bd:   cd 47 c9  ".G." 
    JR C_C776                  ;0xc7c0:   18 b4  ".." 
;--------------------------------------
C_C7C2:                        ;          XREF: 0xC798 
    POP BC                     ;0xc7c2:   c1  "." 
    POP DE                     ;0xc7c3:   d1  "." 
    POP HL                     ;0xc7c4:   e1  "." 
    SCF                        ;0xc7c5:   37  "7" 
    RET                        ;0xc7c6:   c9  "." 
;--------------------------------------
C_C7C7:                        ;          XREF: 0xC785 
    PUSH AF                    ;0xc7c7:   f5  "." 
    LD A,(0xbe4a)              ;0xc7c8:   3a 4a be  ":J."  
    CALL C_C7E0                ;0xc7cb:   cd e0 c7  "..." 
    POP AF                     ;0xc7ce:   f1  "." 
    DEC A                      ;0xc7cf:   3d  "=" 
    JR nz, C_C7C7              ;0xc7d0:   20 f5  " ." 
    LD A,(0xbe49)              ;0xc7d2:   3a 49 be  ":I."  
    CALL C_C7E0                ;0xc7d5:   cd e0 c7  "..." 
    LD A,8                     ;0xc7d8:   3e 08  ">."  
    CALL C_C95C                ;0xc7da:   cd 5c c9  ".\." 
    JP C_C8F9                  ;0xc7dd:   c3 f9 c8  "..." 
;--------------------------------------
C_C7E0:                        ;          XREF: 0xC7CB 
    PUSH AF                    ;0xc7e0:   f5  "." 
    LD A,0xf6                  ;0xc7e1:   3e f6  ">."  
;--------------------------------------
C_C7E3:                        ;          XREF: 0xC7E4 
    DEC A                      ;0xc7e3:   3d  "=" 
    JR nz, C_C7E3              ;0xc7e4:   20 fd  " ." 
    POP AF                     ;0xc7e6:   f1  "." 
    DEC A                      ;0xc7e7:   3d  "=" 
    JR nz, C_C7E0              ;0xc7e8:   20 f6  " ." 
    RET                        ;0xc7ea:   c9  "." 
;--------------------------------------
C_C7EB:                        ;          XREF: 0xC532 
    LD HL,0xbe53               ;0xc7eb:   21 53 be  "!S."  
    LD E,(HL)                  ;0xc7ee:   5e  "^" 
    LD A,3                     ;0xc7ef:   3e 03  ">."  
    CALL C_CA5C                ;0xc7f1:   cd 5c ca  ".\." 
    INC A                      ;0xc7f4:   3c  "<" 
    LD DE,0xbe59               ;0xc7f5:   11 59 be  ".Y."  
    LD (DE),A                  ;0xc7f8:   12  "." 
    INC DE                     ;0xc7f9:   13  "." 
    LD BC,3                    ;0xc7fa:   01 03 00  "..."  
    LDIR                       ;0xc7fd:   ed b0  ".." 
    RET                        ;0xc7ff:   c9  "." 
;--------------------------------------
C_C800:                        ;          XREF: 0xC535 
    LD DE,0xbe59               ;0xc800:   11 59 be  ".Y."  
    LD A,(DE)                  ;0xc803:   1a  "." 
    OR A                       ;0xc804:   b7  "." 
    RET z                      ;0xc805:   c8  "." 
    INC DE                     ;0xc806:   13  "." 
    LD HL,0xbe53               ;0xc807:   21 53 be  "!S."  
    LD B,3                     ;0xc80a:   06 03  ".."  
;--------------------------------------
C_C80C:                        ;          XREF: 0xC812 
    LD A,(DE)                  ;0xc80c:   1a  "." 
    XOR (HL)                   ;0xc80d:   ae  "." 
    JR nz, C_C816              ;0xc80e:   20 06  " ." 
    INC DE                     ;0xc810:   13  "." 
    INC HL                     ;0xc811:   23  "#" 
    DJNZ C_C80C                ;0xc812:   10 f8  ".." 
    SCF                        ;0xc814:   37  "7" 
    RET                        ;0xc815:   c9  "." 
;--------------------------------------
C_C816:                        ;          XREF: 0xC80E 
    XOR A                      ;0xc816:   af  "." 
    LD (0xbe59),A              ;0xc817:   32 59 be  "2Y."  
    RET                        ;0xc81a:   c9  "." 
;--------------------------------------
C_C81B:                        ;          XREF: 0xC538 
    PUSH AF                    ;0xc81b:   f5  "." 
    LD HL,0xbe59               ;0xc81c:   21 59 be  "!Y."  
    DEC (HL)                   ;0xc81f:   35  "5" 
    INC HL                     ;0xc820:   23  "#" 
    LD E,(HL)                  ;0xc821:   5e  "^" 
    INC HL                     ;0xc822:   23  "#" 
    INC HL                     ;0xc823:   23  "#" 
    INC (HL)                   ;0xc824:   34  "4" 
    XOR A                      ;0xc825:   af  "." 
    CALL C_CA5C                ;0xc826:   cd 5c ca  ".\." 
    CP (HL)                    ;0xc829:   be  "." 
    JR nz, C_C830              ;0xc82a:   20 04  " ." 
    LD (HL),0                  ;0xc82c:   36 00  "6."  
    DEC HL                     ;0xc82e:   2b  "+" 
    INC (HL)                   ;0xc82f:   34  "4" 
;--------------------------------------
C_C830:                        ;          XREF: 0xC82A 
    POP AF                     ;0xc830:   f1  "." 
    RET                        ;0xc831:   c9  "." 
;--------------------------------------
C_C832:                        ;          XREF: 0xC53B 
    PUSH AF                    ;0xc832:   f5  "." 
    CALL C_C854                ;0xc833:   cd 54 c8  ".T." 
    JR c, C_C851               ;0xc836:   38 19  "8." 
    CALL C_C86F                ;0xc838:   cd 6f c8  ".o." 
    POP BC                     ;0xc83b:   c1  "." 
    RET nc                     ;0xc83c:   d0  "." 
    PUSH BC                    ;0xc83d:   c5  "." 
    CALL C_C880                ;0xc83e:   cd 80 c8  "..." 
    POP AF                     ;0xc841:   f1  "." 
    JR c, C_C84A               ;0xc842:   38 06  "8." 
    CALL C_C8A2                ;0xc844:   cd a2 c8  "..." 
    CALL EXT_READ_SECTOR           ;0xc847:   cd 66 c6  ".f." 
;--------------------------------------
C_C84A:                        ;          XREF: 0xC842 
    PUSH AF                    ;0xc84a:   f5  "." 
    SBC A,A                    ;0xc84b:   9f  "." 
    LD (0xbe5e),A              ;0xc84c:   32 5e be  "2^."  
    POP AF                     ;0xc84f:   f1  "." 
    RET                        ;0xc850:   c9  "." 
;--------------------------------------
C_C851:                        ;          XREF: 0xC836 
    POP AF                     ;0xc851:   f1  "." 
    SCF                        ;0xc852:   37  "7" 
    RET                        ;0xc853:   c9  "." 
;--------------------------------------
C_C854:                        ;          XREF: 0xC833 
    LD A,(0xbe5e)              ;0xc854:   3a 5e be  ":^."  
    OR A                       ;0xc857:   b7  "." 
    RET z                      ;0xc858:   c8  "." 
    LD BC,0xbe53               ;0xc859:   01 53 be  ".S."  
    LD HL,0xbe56               ;0xc85c:   21 56 be  "!V."  
    LD E,(HL)                  ;0xc85f:   5e  "^" 
    LD A,(BC)                  ;0xc860:   0a  "." 
    XOR (HL)                   ;0xc861:   ae  "." 
    RET nz                     ;0xc862:   c0  "." 
    INC BC                     ;0xc863:   03  "." 
    INC HL                     ;0xc864:   23  "#" 
    LD A,(BC)                  ;0xc865:   0a  "." 
    XOR (HL)                   ;0xc866:   ae  "." 
    RET nz                     ;0xc867:   c0  "." 
    CALL C_C892                ;0xc868:   cd 92 c8  "..." 
    XOR (HL)                   ;0xc86b:   ae  "." 
    RET nz                     ;0xc86c:   c0  "." 
    SCF                        ;0xc86d:   37  "7" 
    RET                        ;0xc86e:   c9  "." 
;--------------------------------------
C_C86F:                        ;          XREF: 0xC22B 
    LD HL,0xbe5e               ;0xc86f:   21 5e be  "!^."  
    LD (HL),0                  ;0xc872:   36 00  "6."  
    DEC HL                     ;0xc874:   2b  "+" 
    LD A,(HL)                  ;0xc875:   7e  "~" 
    OR A                       ;0xc876:   b7  "." 
    SCF                        ;0xc877:   37  "7" 
    RET z                      ;0xc878:   c8  "." 
    INC (HL)                   ;0xc879:   34  "4" 
    CALL C_C8A2                ;0xc87a:   cd a2 c8  "..." 
    JP EXT_WRITE_SECTOR           ;0xc87d:   c3 4e c6  ".N." 
;--------------------------------------
C_C880:                        ;          XREF: 0xC83E 
    LD HL,0xbe56               ;0xc880:   21 56 be  "!V."  
    LD BC,0xbe53               ;0xc883:   01 53 be  ".S."  
    LD A,(BC)                  ;0xc886:   0a  "." 
    LD (HL),A                  ;0xc887:   77  "w" 
    LD E,A                     ;0xc888:   5f  "_" 
    INC HL                     ;0xc889:   23  "#" 
    INC BC                     ;0xc88a:   03  "." 
    LD A,(BC)                  ;0xc88b:   0a  "." 
    LD (HL),A                  ;0xc88c:   77  "w" 
    CALL C_C892                ;0xc88d:   cd 92 c8  "..." 
    LD (HL),A                  ;0xc890:   77  "w" 
    RET                        ;0xc891:   c9  "." 
;--------------------------------------
C_C892:                        ;          XREF: 0xC868 
    INC BC                     ;0xc892:   03  "." 
    INC HL                     ;0xc893:   23  "#" 
    LD A,0x15                  ;0xc894:   3e 15  ">."  
    CALL C_CA5C                ;0xc896:   cd 5c ca  ".\." 
    LD D,A                     ;0xc899:   57  "W" 
    LD A,(BC)                  ;0xc89a:   0a  "." 
;--------------------------------------
C_C89B:                        ;          XREF: 0xC8A0 
    SRL D                      ;0xc89b:   cb 3a  ".:" 
    RET c                      ;0xc89d:   d8  "." 
    SRL A                      ;0xc89e:   cb 3f  ".?" 
    JR C_C89B                  ;0xc8a0:   18 f9  ".." 
;--------------------------------------
C_C8A2:                        ;          XREF: 0xC844 
    LD DE,(0xbe56)             ;0xc8a2:   ed 5b 56 be  ".[V."  
    LD A,15                    ;0xc8a6:   3e 0f  ">."  
    CALL C_CA5C                ;0xc8a8:   cd 5c ca  ".\." 
    LD HL,0xbe58               ;0xc8ab:   21 58 be  "!X."  
    ADD A,(HL)                 ;0xc8ae:   86  "." 
    LD C,A                     ;0xc8af:   4f  "O" 
;--------------------------------------
C_C8B0:                        ;          XREF: 0xC22E 
    LD HL,0x2b0                ;0xc8b0:   21 b0 02  "!.."  
    JP C_CA9F                  ;0xc8b3:   c3 9f ca  "..." 
;--------------------------------------
C_C8B6:                        ;          XREF: 0xC540 
    PUSH HL                    ;0xc8b6:   e5  "." 
    PUSH DE                    ;0xc8b7:   d5  "." 
    PUSH BC                    ;0xc8b8:   c5  "." 
    PUSH AF                    ;0xc8b9:   f5  "." 
    LD A,0xff                  ;0xc8ba:   3e ff  ">."  
    LD (0xbe5d),A              ;0xc8bc:   32 5d be  "2]."  
    CALL C_C8D6                ;0xc8bf:   cd d6 c8  "..." 
    CALL KL_LDIR               ;0xc8c2:   cd 1b b9  "..." 
    JR C_C8D1                  ;0xc8c5:   18 0a  ".." 
;--------------------------------------
C_C8C7:                        ;          XREF: 0xC553 
    PUSH HL                    ;0xc8c7:   e5  "." 
    PUSH DE                    ;0xc8c8:   d5  "." 
    PUSH BC                    ;0xc8c9:   c5  "." 
    PUSH AF                    ;0xc8ca:   f5  "." 
    CALL C_C8D6                ;0xc8cb:   cd d6 c8  "..." 
    EX DE,HL                   ;0xc8ce:   eb  "." 
    LDIR                       ;0xc8cf:   ed b0  ".." 
;--------------------------------------
C_C8D1:                        ;          XREF: 0xC8C5 
    POP AF                     ;0xc8d1:   f1  "." 
    POP BC                     ;0xc8d2:   c1  "." 
    POP DE                     ;0xc8d3:   d1  "." 
    POP HL                     ;0xc8d4:   e1  "." 
    RET                        ;0xc8d5:   c9  "." 
;--------------------------------------
C_C8D6:                        ;          XREF: 0xC8BF 
    LD HL,0xbe53               ;0xc8d6:   21 53 be  "!S."  
    LD E,(HL)                  ;0xc8d9:   5e  "^" 
    LD A,0x15                  ;0xc8da:   3e 15  ">."  
    CALL C_CA5C                ;0xc8dc:   cd 5c ca  ".\." 
    DEC A                      ;0xc8df:   3d  "=" 
    INC HL                     ;0xc8e0:   23  "#" 
    INC HL                     ;0xc8e1:   23  "#" 
    AND (HL)                   ;0xc8e2:   a6  "." 
    LD DE,0x80                 ;0xc8e3:   11 80 00  "..."  
    LD HL,0x230                ;0xc8e6:   21 30 02  "!0."  
    INC A                      ;0xc8e9:   3c  "<" 
;--------------------------------------
C_C8EA:                        ;          XREF: 0xC8EC 
    ADD HL,DE                  ;0xc8ea:   19  "." 
    DEC A                      ;0xc8eb:   3d  "=" 
    JR nz, C_C8EA              ;0xc8ec:   20 fc  " ." 
    EX DE,HL                   ;0xc8ee:   eb  "." 
    CALL C_CA98                ;0xc8ef:   cd 98 ca  "..." 
    LD HL,(0xbe60)             ;0xc8f2:   2a 60 be  "*`."  
    LD BC,0x80                 ;0xc8f5:   01 80 00  "..."  
    RET                        ;0xc8f8:   c9  "." 
;--------------------------------------
C_C8F9:                        ;          XREF: 0xC569 
    CALL C_C91C                ;0xc8f9:   cd 1c c9  "..." 
    RET c                      ;0xc8fc:   d8  "." 
    LD A,(0xbe4c)              ;0xc8fd:   3a 4c be  ":L."  
    AND 8                      ;0xc900:   e6 08  ".." 
    RET z                      ;0xc902:   c8  "." 
    LD A,0x13                  ;0xc903:   3e 13  ">."  
    JR C_C914                  ;0xc905:   18 0d  ".." 
;--------------------------------------
C_C907:                        ;          XREF: 0xC6C5 
    CALL C_C8F9                ;0xc907:   cd f9 c8  "..." 
    RET c                      ;0xc90a:   d8  "." 
    RET nz                     ;0xc90b:   c0  "." 
    LD A,(0xbe4d)              ;0xc90c:   3a 4d be  ":M."  
    AND 2                      ;0xc90f:   e6 02  ".." 
    RET z                      ;0xc911:   c8  "." 
    LD A,0x12                  ;0xc912:   3e 12  ">."  
;--------------------------------------
C_C914:                        ;          XREF: 0xC905 
    CALL C_CA7A                ;0xc914:   cd 7a ca  ".z." 
    RET c                      ;0xc917:   d8  "." 
    JP z, C_c9ad               ;0xc918:   ca ad c9  "..." 
    RET                        ;0xc91b:   c9  "." 
;--------------------------------------
C_C91C:                        ;          XREF: 0xC64B 
    PUSH HL                    ;0xc91c:   e5  "." 
    PUSH DE                    ;0xc91d:   d5  "." 
    LD D,0                     ;0xc91e:   16 00  ".."  
    LD HL,0xbe4c               ;0xc920:   21 4c be  "!L."  
    PUSH HL                    ;0xc923:   e5  "." 
;--------------------------------------
C_C924:                        ;          XREF: 0xC928 
    IN A,(C)                   ;0xc924:   ed 78  ".x" 
    CP 0xc0                    ;0xc926:   fe c0  ".." 
    JR c, C_C924               ;0xc928:   38 fa  "8." 
    INC C                      ;0xc92a:   0c  "." 
    IN A,(C)                   ;0xc92b:   ed 78  ".x" 
    DEC C                      ;0xc92d:   0d  "." 
    LD (HL),A                  ;0xc92e:   77  "w" 
    INC HL                     ;0xc92f:   23  "#" 
    INC D                      ;0xc930:   14  "." 
    LD A,5                     ;0xc931:   3e 05  ">."  
;--------------------------------------
C_C933:                        ;          XREF: 0xC934 
    DEC A                      ;0xc933:   3d  "=" 
    JR nz, C_C933              ;0xc934:   20 fd  " ." 
    IN A,(C)                   ;0xc936:   ed 78  ".x" 
    AND 0x10                   ;0xc938:   e6 10  ".." 
    JR nz, C_C924              ;0xc93a:   20 e8  " ." 
    POP HL                     ;0xc93c:   e1  "." 
    LD A,(HL)                  ;0xc93d:   7e  "~" 
    AND 0xc0                   ;0xc93e:   e6 c0  ".." 
    DEC HL                     ;0xc940:   2b  "+" 
    LD (HL),D                  ;0xc941:   72  "r" 
    POP DE                     ;0xc942:   d1  "." 
    POP HL                     ;0xc943:   e1  "." 
    RET nz                     ;0xc944:   c0  "." 
    SCF                        ;0xc945:   37  "7" 
    RET                        ;0xc946:   c9  "." 
;--------------------------------------
C_C947:                        ;          XREF: 0xC63C 
    PUSH BC                    ;0xc947:   c5  "." 
    LD BC,0xfb7e               ;0xc948:   01 7e fb  ".~."  
;--------------------------------------
C_C94B:                        ;          XREF: 0xC955 
    LD A,8                     ;0xc94b:   3e 08  ">."  
    CALL C_C95C                ;0xc94d:   cd 5c c9  ".\." 
    CALL C_C91C                ;0xc950:   cd 1c c9  "..." 
    CP 0x80                    ;0xc953:   fe 80  ".." 
    JR nz, C_C94B              ;0xc955:   20 f4  " ." 
    POP BC                     ;0xc957:   c1  "." 
    RET                        ;0xc958:   c9  "." 
;--------------------------------------
C_C959:                        ;          XREF: 0xC691 
    CALL C_CA5C                ;0xc959:   cd 5c ca  ".\." 
;--------------------------------------
C_C95C:                        ;          XREF: 0xC562 
    PUSH AF                    ;0xc95c:   f5  "." 
    PUSH AF                    ;0xc95d:   f5  "." 
;--------------------------------------
C_C95E:                        ;          XREF: 0xC961 
    IN A,(C)                   ;0xc95e:   ed 78  ".x" 
    ADD A,A                    ;0xc960:   87  "." 
    JR nc, C_C95E              ;0xc961:   30 fb  "0." 
    ADD A,A                    ;0xc963:   87  "." 
    JR nc, C_C969              ;0xc964:   30 03  "0." 
    POP AF                     ;0xc966:   f1  "." 
    POP AF                     ;0xc967:   f1  "." 
    RET                        ;0xc968:   c9  "." 
;--------------------------------------
C_C969:                        ;          XREF: 0xC964 
    POP AF                     ;0xc969:   f1  "." 
    INC C                      ;0xc96a:   0c  "." 
    OUT (C),A                  ;0xc96b:   ed 79  ".y" 
    DEC C                      ;0xc96d:   0d  "." 
    LD A,5                     ;0xc96e:   3e 05  ">."  
;--------------------------------------
C_C970:                        ;          XREF: 0xC972 
    DEC A                      ;0xc970:   3d  "=" 
    NOP                        ;0xc971:   00  "." 
    JR nz, C_C970              ;0xc972:   20 fc  " ." 
    POP AF                     ;0xc974:   f1  "." 
    RET                        ;0xc975:   c9  "." 
;--------------------------------------
C_C976:                        ;          XREF: 0xC56C 
    LD (0xbe76),HL             ;0xc976:   22 76 be  ""v."  
    EX (SP),HL                 ;0xc979:   e3  "." 
    PUSH DE                    ;0xc97a:   d5  "." 
    PUSH BC                    ;0xc97b:   c5  "." 
    LD (0xbe64),SP             ;0xc97c:   ed 73 64 be  ".sd."  
    PUSH HL                    ;0xc980:   e5  "." 
    LD HL,C_c9ad               ;0xc981:   21 ad c9  "!.."  
    EX (SP),HL                 ;0xc984:   e3  "." 
    PUSH HL                    ;0xc985:   e5  "." 
    PUSH DE                    ;0xc986:   d5  "." 
    PUSH BC                    ;0xc987:   c5  "." 
    PUSH AF                    ;0xc988:   f5  "." 
    CALL C_C9DF                ;0xc989:   cd df c9  "..." 
    LD A,(0xbe5f)              ;0xc98c:   3a 5f be  ":_."  
    OR A                       ;0xc98f:   b7  "." 
    JR nz, C_C9A6              ;0xc990:   20 14  " ." 
    LD BC,D_FA7E               ;0xc992:   01 7e fa  ".~."  
    LD A,1                     ;0xc995:   3e 01  ">."  
    OUT (C),A                  ;0xc997:   ed 79  ".y" 
    LD DE,(0xbe44)             ;0xc999:   ed 5b 44 be  ".[D."  
    CALL C_C9CD                ;0xc99d:   cd cd c9  "..." 
;--------------------------------------
C_C9A0:                        ;          XREF: 0xC9A4 
    LD A,(0xbe5f)              ;0xc9a0:   3a 5f be  ":_."  
    OR A                       ;0xc9a3:   b7  "." 
    JR z, C_C9A0               ;0xc9a4:   28 fa  "(." 
;--------------------------------------
C_C9A6:                        ;          XREF: 0xC990 
    POP AF                     ;0xc9a6:   f1  "." 
    POP BC                     ;0xc9a7:   c1  "." 
    POP DE                     ;0xc9a8:   d1  "." 
    LD HL,(0xbe76)             ;0xc9a9:   2a 76 be  "*v."  
    RET                        ;0xc9ac:   c9  "." 
;--------------------------------------
C_c9ad:                        ;          XREF: 0xC981 0xC7BA 
    LD SP,(0xbe64)             ;0xc9ad:   ed 7b 64 be  ".{d."  
    PUSH AF                    ;0xc9b1:   f5  "." 
    LD DE,(0xbe46)             ;0xc9b2:   ed 5b 46 be  ".[F."  
    CALL C_C9CD                ;0xc9b6:   cd cd c9  "..." 
    POP AF                     ;0xc9b9:   f1  "." 
    POP BC                     ;0xc9ba:   c1  "." 
    POP DE                     ;0xc9bb:   d1  "." 
    POP HL                     ;0xc9bc:   e1  "." 
    LD A,0                     ;0xc9bd:   3e 00  ">."  
    RET c                      ;0xc9bf:   d8  "." 
    LD HL,0xbe4c               ;0xc9c0:   21 4c be  "!L."  
    LD A,(HL)                  ;0xc9c3:   7e  "~" 
    AND 8                      ;0xc9c4:   e6 08  ".." 
    INC HL                     ;0xc9c6:   23  "#" 
    OR (HL)                    ;0xc9c7:   b6  "." 
    OR 0x40                    ;0xc9c8:   f6 40  ".@" 
    DEC HL                     ;0xc9ca:   2b  "+" 
    DEC HL                     ;0xc9cb:   2b  "+" 
    RET                        ;0xc9cc:   c9  "." 
;--------------------------------------
C_C9CD:                        ;          XREF: 0xC99D 
    LD HL,0xbe67               ;0xc9cd:   21 67 be  "!g."  
    LD BC,0                    ;0xc9d0:   01 00 00  "..."  
    JP 0xbce9                  ;0xc9d3:   c3 e9 bc  "..." 
;--------------------------------------
C_c9d6:                        ;          XREF: 0xC5FB 
    LD HL,0xbe5f               ;0xc9d6:   21 5f be  "!_."  
    LD A,(HL)                  ;0xc9d9:   7e  "~" 
    CPL                        ;0xc9da:   2f  "/" 
    LD (HL),A                  ;0xc9db:   77  "w" 
    OR A                       ;0xc9dc:   b7  "." 
    JR z, C_C9E5               ;0xc9dd:   28 06  "(." 
;--------------------------------------
C_C9DF:                        ;          XREF: 0xC989 
    LD HL,0xbe67               ;0xc9df:   21 67 be  "!g."  
    JP KL_DEL_TICKER           ;0xc9e2:   c3 ec bc  "..." 
;--------------------------------------
C_C9E5:                        ;          XREF: 0xC9DD 
    CALL C_C9DF                ;0xc9e5:   cd df c9  "..." 
;--------------------------------------
C_C9E8:                        ;          XREF: 0xC5E9 
    LD A,0                     ;0xc9e8:   3e 00  ">."  
    LD BC,D_FA7E               ;0xc9ea:   01 7e fa  ".~."  
    OUT (C),A                  ;0xc9ed:   ed 79  ".y" 
    XOR A                      ;0xc9ef:   af  "." 
    LD (0xbe5f),A              ;0xc9f0:   32 5f be  "2_."  
    RET                        ;0xc9f3:   c9  "." 
;--------------------------------------
C_C9F4:                        ;          XREF: 0xC5E6 
    LD HL,0x220                ;0xc9f4:   21 20 02  "! ."  
    LD DE,0x1d0                ;0xc9f7:   11 d0 01  "..."  
    CALL C_CA03                ;0xc9fa:   cd 03 ca  "..." 
    LD HL,0x210                ;0xc9fd:   21 10 02  "!.."  
    LD DE,0x190                ;0xca00:   11 90 01  "..."  
;--------------------------------------
C_CA03:                        ;          XREF: 0xC9FA 
    CALL C_CA98                ;0xca03:   cd 98 ca  "..." 
    LD (0xbe42),DE             ;0xca06:   ed 53 42 be  ".SB."  
    PUSH DE                    ;0xca0a:   d5  "." 
    CALL C_CA9F                ;0xca0b:   cd 9f ca  "..." 
    LD (0xbe40),HL             ;0xca0e:   22 40 be  ""@."  
    PUSH HL                    ;0xca11:   e5  "." 
    LD HL,C_ca43               ;0xca12:   21 43 ca  "!C."  
    LD BC,0x19                 ;0xca15:   01 19 00  "..."  
    LDIR                       ;0xca18:   ed b0  ".." 
    LD C,E                     ;0xca1a:   4b  "K" 
    LD B,D                     ;0xca1b:   42  "B" 
    POP HL                     ;0xca1c:   e1  "." 
    LD (HL),0                  ;0xca1d:   36 00  "6."  
    INC HL                     ;0xca1f:   23  "#" 
    LD (HL),0                  ;0xca20:   36 00  "6."  
    LD DE,7                    ;0xca22:   11 07 00  "..."  
    ADD HL,DE                  ;0xca25:   19  "." 
    LD DE,0x230                ;0xca26:   11 30 02  ".0."  
    CALL C_CA98                ;0xca29:   cd 98 ca  "..." 
    LD (HL),E                  ;0xca2c:   73  "s" 
    INC HL                     ;0xca2d:   23  "#" 
    LD (HL),D                  ;0xca2e:   72  "r" 
    INC HL                     ;0xca2f:   23  "#" 
    POP DE                     ;0xca30:   d1  "." 
    LD (HL),E                  ;0xca31:   73  "s" 
    INC HL                     ;0xca32:   23  "#" 
    LD (HL),D                  ;0xca33:   72  "r" 
    INC HL                     ;0xca34:   23  "#" 
    LD (HL),C                  ;0xca35:   71  "q" 
    INC HL                     ;0xca36:   23  "#" 
    LD (HL),B                  ;0xca37:   70  "p" 
    INC HL                     ;0xca38:   23  "#" 
    EX DE,HL                   ;0xca39:   eb  "." 
    LD HL,0x10                 ;0xca3a:   21 10 00  "!.."  
    ADD HL,BC                  ;0xca3d:   09  "." 
    EX DE,HL                   ;0xca3e:   eb  "." 
    LD (HL),E                  ;0xca3f:   73  "s" 
    INC HL                     ;0xca40:   23  "#" 
    LD (HL),D                  ;0xca41:   72  "r" 
    RET                        ;0xca42:   c9  "." 
;--------------------------------------
C_ca43:                        ;          XREF: 0xC588 0xCA12 
    INC H                      ;0xca43:   24  "$" 
    NOP                        ;0xca44:   00  "." 
    INC BC                     ;0xca45:   03  "." 
    RLCA                       ;0xca46:   07  "." 
    NOP                        ;0xca47:   00  "." 
    XOR D                      ;0xca48:   aa  "." 
    NOP                        ;0xca49:   00  "." 
    CCF                        ;0xca4a:   3f  "?" 
    NOP                        ;0xca4b:   00  "." 
    RET nz                     ;0xca4c:   c0  "." 
    NOP                        ;0xca4d:   00  "." 
    DJNZ C_CA50                ;0xca4e:   10 00  ".." 
;--------------------------------------
C_CA50:                        ;          XREF: 0xCA4E 
    LD (BC),A                  ;0xca50:   02  "." 
    NOP                        ;0xca51:   00  "." 
    LD B,C                     ;0xca52:   41  "A" 
    ADD HL,BC                  ;0xca53:   09  "." 
    LD HL,(D_E552)             ;0xca54:   2a 52 e5  "*R."  
    LD (BC),A                  ;0xca57:   02  "." 
    INC B                      ;0xca58:   04  "." 
    NOP                        ;0xca59:   00  "." 
    NOP                        ;0xca5a:   00  "." 
    NOP                        ;0xca5b:   00  "." 
;--------------------------------------
C_CA5C:                        ;          XREF: 0xC4FE 
    PUSH HL                    ;0xca5c:   e5  "." 
    CALL C_CA63                ;0xca5d:   cd 63 ca  ".c." 
    LD A,(HL)                  ;0xca60:   7e  "~" 
    POP HL                     ;0xca61:   e1  "." 
    RET                        ;0xca62:   c9  "." 
;--------------------------------------
C_CA63:                        ;          XREF: 0xC583 
    PUSH DE                    ;0xca63:   d5  "." 
    LD HL,(0xbe42)             ;0xca64:   2a 42 be  "*B."  
    DEC E                      ;0xca67:   1d  "." 
    LD DE,0x40                 ;0xca68:   11 40 00  ".@."  
    JR nz, C_CA6E              ;0xca6b:   20 01  " ." 
    ADD HL,DE                  ;0xca6d:   19  "." 
;--------------------------------------
C_CA6E:                        ;          XREF: 0xCA6B 
    LD E,A                     ;0xca6e:   5f  "_" 
    ADD HL,DE                  ;0xca6f:   19  "." 
    POP DE                     ;0xca70:   d1  "." 
    RET                        ;0xca71:   c9  "." 
;--------------------------------------
EXT_SET_MESSAGE:               ;          XREF: 0xC033 
    LD HL,(0xbe78)             ;0xca72:   2a 78 be  "*x."  
    LD (0xbe78),A              ;0xca75:   32 78 be  "2x."  
    LD A,L                     ;0xca78:   7d  "}" 
    RET                        ;0xca79:   c9  "." 
;--------------------------------------
C_CA7A:                        ;          XREF: 0xC724 
    PUSH AF                    ;0xca7a:   f5  "." 
    LD A,(0xbe78)              ;0xca7b:   3a 78 be  ":x."  
    OR A                       ;0xca7e:   b7  "." 
    JR nz, C_CA86              ;0xca7f:   20 05  " ." 
    POP AF                     ;0xca81:   f1  "." 
    LD C,E                     ;0xca82:   4b  "K" 
    JP C_CAB8                  ;0xca83:   c3 b8 ca  "..." 
;--------------------------------------
C_CA86:                        ;          XREF: 0xCA7F 
    POP AF                     ;0xca86:   f1  "." 
    XOR A                      ;0xca87:   af  "." 
    RET                        ;0xca88:   c9  "." 
    RST 0x38                   ;0xca89:   ff  "." 
    RST 0x38                   ;0xca8a:   ff  "." 
    RST 0x38                   ;0xca8b:   ff  "." 
    RST 0x38                   ;0xca8c:   ff  "." 
    RST 0x38                   ;0xca8d:   ff  "." 
    RST 0x38                   ;0xca8e:   ff  "." 
    RST 0x38                   ;0xca8f:   ff  "." 
;--------------------------------------
C_CA90:                        ;          XREF: 0xD1F8 
    PUSH IY                    ;0xca90:   fd e5  ".." 
    EX (SP),HL                 ;0xca92:   e3  "." 
    ADD HL,BC                  ;0xca93:   09  "." 
    LD B,H                     ;0xca94:   44  "D" 
    LD C,L                     ;0xca95:   4d  "M" 
    POP HL                     ;0xca96:   e1  "." 
    RET                        ;0xca97:   c9  "." 
;--------------------------------------
C_CA98:                        ;          XREF: 0xC8EF 
    PUSH IY                    ;0xca98:   fd e5  ".." 
    EX (SP),HL                 ;0xca9a:   e3  "." 
    ADD HL,DE                  ;0xca9b:   19  "." 
    EX DE,HL                   ;0xca9c:   eb  "." 
    POP HL                     ;0xca9d:   e1  "." 
    RET                        ;0xca9e:   c9  "." 
;--------------------------------------
C_CA9F:                        ;          XREF: 0xC517 
    PUSH DE                    ;0xca9f:   d5  "." 
    PUSH IY                    ;0xcaa0:   fd e5  ".." 
    POP DE                     ;0xcaa2:   d1  "." 
    ADD HL,DE                  ;0xcaa3:   19  "." 
    POP DE                     ;0xcaa4:   d1  "." 
    RET                        ;0xcaa5:   c9  "." 
;--------------------------------------
C_CAA6:                        ;          XREF: 0xCACB 
    CP 0x61                    ;0xcaa6:   fe 61  ".a" 
    RET c                      ;0xcaa8:   d8  "." 
    CP 0x7b                    ;0xcaa9:   fe 7b  ".{" 
    RET nc                     ;0xcaab:   d0  "." 
    ADD A,0xe0                 ;0xcaac:   c6 e0  ".." 
    RET                        ;0xcaae:   c9  "." 
;--------------------------------------
C_CAAF:                        ;          XREF: 0xC1E9 
    XOR A                      ;0xcaaf:   af  "." 
    LD (DE),A                  ;0xcab0:   12  "." 
    INC DE                     ;0xcab1:   13  "." 
    DEC BC                     ;0xcab2:   0b  "." 
    LD A,B                     ;0xcab3:   78  "x" 
    OR C                       ;0xcab4:   b1  "." 
    JR nz, C_CAAF              ;0xcab5:   20 f8  " ." 
    RET                        ;0xcab7:   c9  "." 
;--------------------------------------
C_CAB8:                        ;          XREF: 0xC226 
    CALL C_CAEB                ;0xcab8:   cd eb ca  "..." 
    LD A,0x14                  ;0xcabb:   3e 14  ">."  
    CALL C_CAEB                ;0xcabd:   cd eb ca  "..." 
;--------------------------------------
C_CAC0:                        ;          XREF: 0xCAC3 
    CALL KM_READ_CHAR          ;0xcac0:   cd 09 bb  "..." 
    JR c, C_CAC0               ;0xcac3:   38 fb  "8." 
    CALL 0xbb81                ;0xcac5:   cd 81 bb  "..." 
;--------------------------------------
C_CAC8:                        ;          XREF: 0xCAE0 
    CALL KM_WAIT_CHAR          ;0xcac8:   cd 06 bb  "..." 
    CALL C_CAA6                ;0xcacb:   cd a6 ca  "..." 
    CP 0x43                    ;0xcace:   fe 43  ".C" 
    JR z, C_CAE3               ;0xcad0:   28 11  "(." 
    CP 0x49                    ;0xcad2:   fe 49  ".I" 
    SCF                        ;0xcad4:   37  "7" 
    JR z, C_CAE3               ;0xcad5:   28 0c  "(." 
    CP 0x52                    ;0xcad7:   fe 52  ".R" 
    JR z, C_CAE2               ;0xcad9:   28 07  "(." 
    LD A,7                     ;0xcadb:   3e 07  ">."  
    CALL TXT_OUTPUT            ;0xcadd:   cd 5a bb  ".Z." 
    JR C_CAC8                  ;0xcae0:   18 e6  ".." 
;--------------------------------------
C_CAE2:                        ;          XREF: 0xCAD9 
    OR A                       ;0xcae2:   b7  "." 
;--------------------------------------
C_CAE3:                        ;          XREF: 0xCAD0 
    CALL TXT_OUTPUT            ;0xcae3:   cd 5a bb  ".Z." 
    CALL 0xbb84                ;0xcae6:   cd 84 bb  "..." 
;--------------------------------------
C_CAE9:                        ;          XREF: 0xCB7F 
    LD A,0                     ;0xcae9:   3e 00  ">."  
;--------------------------------------
C_CAEB:                        ;          XREF: 0xC4E5 
    PUSH HL                    ;0xcaeb:   e5  "." 
    PUSH BC                    ;0xcaec:   c5  "." 
    PUSH AF                    ;0xcaed:   f5  "." 
    AND 0x7f                   ;0xcaee:   e6 7f  ".." 
    LD HL,D_CB86               ;0xcaf0:   21 86 cb  "!.."  
    LD B,A                     ;0xcaf3:   47  "G" 
    INC B                      ;0xcaf4:   04  "." 
    JR C_CAFC                  ;0xcaf5:   18 05  ".." 
;--------------------------------------
C_CAF7:                        ;          XREF: 0xCAFA 
    LD A,(HL)                  ;0xcaf7:   7e  "~" 
    INC HL                     ;0xcaf8:   23  "#" 
    INC A                      ;0xcaf9:   3c  "<" 
    JR nz, C_CAF7              ;0xcafa:   20 fb  " ." 
;--------------------------------------
C_CAFC:                        ;          XREF: 0xCAF5 
    DJNZ C_CAF7                ;0xcafc:   10 f9  ".." 
;--------------------------------------
C_CAFE:                        ;          XREF: 0xCB0D 
    LD A,(HL)                  ;0xcafe:   7e  "~" 
    INC HL                     ;0xcaff:   23  "#" 
    CP 0xff                    ;0xcb00:   fe ff  ".." 
    JR z, C_CB0F               ;0xcb02:   28 0b  "(." 
    PUSH HL                    ;0xcb04:   e5  "." 
    PUSH DE                    ;0xcb05:   d5  "." 
    PUSH BC                    ;0xcb06:   c5  "." 
    CALL C_CB13                ;0xcb07:   cd 13 cb  "..." 
    POP BC                     ;0xcb0a:   c1  "." 
    POP DE                     ;0xcb0b:   d1  "." 
    POP HL                     ;0xcb0c:   e1  "." 
    JR C_CAFE                  ;0xcb0d:   18 ef  ".." 
;--------------------------------------
C_CB0F:                        ;          XREF: 0xCB02 
    POP AF                     ;0xcb0f:   f1  "." 
    POP BC                     ;0xcb10:   c1  "." 
    POP HL                     ;0xcb11:   e1  "." 
    RET                        ;0xcb12:   c9  "." 
;--------------------------------------
C_CB13:                        ;          XREF: 0xCB07 
    OR A                       ;0xcb13:   b7  "." 
    JP p, C_CB66               ;0xcb14:   f2 66 cb  ".f." 
    CP 0xfe                    ;0xcb17:   fe fe  ".." 
    JR z, C_CB61               ;0xcb19:   28 46  "(F" 
    CP 0xfc                    ;0xcb1b:   fe fc  ".." 
    JR z, C_CB39               ;0xcb1d:   28 1a  "(." 
    CP 0xfd                    ;0xcb1f:   fe fd  ".." 
    JR nz, C_CAEB              ;0xcb21:   20 c8  " ." 
    LD B,8                     ;0xcb23:   06 08  ".."  
    CALL C_CB2F                ;0xcb25:   cd 2f cb  "./." 
    LD A,0x2e                  ;0xcb28:   3e 2e  ">."  
    CALL C_CB83                ;0xcb2a:   cd 83 cb  "..." 
    LD B,3                     ;0xcb2d:   06 03  ".."  
;--------------------------------------
C_CB2F:                        ;          XREF: 0xCB25 
    INC DE                     ;0xcb2f:   13  "." 
    LD A,(DE)                  ;0xcb30:   1a  "." 
    AND 0x7f                   ;0xcb31:   e6 7f  ".." 
    CALL C_CB83                ;0xcb33:   cd 83 cb  "..." 
    DJNZ C_CB2F                ;0xcb36:   10 f7  ".." 
    RET                        ;0xcb38:   c9  "." 
;--------------------------------------
C_CB39:                        ;          XREF: 0xCB1D 
    EX DE,HL                   ;0xcb39:   eb  "." 
    LD D,0x20                  ;0xcb3a:   16 20  ". "  
    LD BC,0xff9c               ;0xcb3c:   01 9c ff  "..."  
    CALL C_CB4D                ;0xcb3f:   cd 4d cb  ".M." 
    LD BC,D_FFF6               ;0xcb42:   01 f6 ff  "..."  
    CALL C_CB4D                ;0xcb45:   cd 4d cb  ".M." 
    LD A,L                     ;0xcb48:   7d  "}" 
    ADD A,0x30                 ;0xcb49:   c6 30  ".0" 
    JR C_CB83                  ;0xcb4b:   18 36  ".6" 
;--------------------------------------
C_CB4D:                        ;          XREF: 0xCB3F 
    LD A,0xff                  ;0xcb4d:   3e ff  ">."  
;--------------------------------------
C_CB4F:                        ;          XREF: 0xCB56 
    PUSH HL                    ;0xcb4f:   e5  "." 
    INC A                      ;0xcb50:   3c  "<" 
    ADD HL,BC                  ;0xcb51:   09  "." 
    JR nc, C_CB58              ;0xcb52:   30 04  "0." 
    EX (SP),HL                 ;0xcb54:   e3  "." 
    POP HL                     ;0xcb55:   e1  "." 
    JR C_CB4F                  ;0xcb56:   18 f7  ".." 
;--------------------------------------
C_CB58:                        ;          XREF: 0xCB52 
    POP HL                     ;0xcb58:   e1  "." 
    OR A                       ;0xcb59:   b7  "." 
    JR z, C_CB5E               ;0xcb5a:   28 02  "(." 
    LD D,0x30                  ;0xcb5c:   16 30  ".0"  
;--------------------------------------
C_CB5E:                        ;          XREF: 0xCB5A 
    ADD A,D                    ;0xcb5e:   82  "." 
    JR C_CB83                  ;0xcb5f:   18 22  "."" 
;--------------------------------------
C_CB61:                        ;          XREF: 0xCB19 
    LD A,C                     ;0xcb61:   79  "y" 
    ADD A,0x41                 ;0xcb62:   c6 41  ".A" 
    JR C_CB83                  ;0xcb64:   18 1d  ".." 
;--------------------------------------
C_CB66:                        ;          XREF: 0xCB14 
    PUSH AF                    ;0xcb66:   f5  "." 
    CP 0x20                    ;0xcb67:   fe 20  ". " 
    JR nz, C_CB82              ;0xcb69:   20 17  " ." 
    PUSH HL                    ;0xcb6b:   e5  "." 
    PUSH DE                    ;0xcb6c:   d5  "." 
    CALL TXT_GET_WINDOW        ;0xcb6d:   cd 69 bb  ".i." 
    CALL TXT_GET_CURSOR        ;0xcb70:   cd 78 bb  ".x." 
    LD A,D                     ;0xcb73:   7a  "z" 
    SUB 4                      ;0xcb74:   d6 04  ".." 
    CCF                        ;0xcb76:   3f  "?" 
    JR nc, C_CB7A              ;0xcb77:   30 01  "0." 
    CP H                       ;0xcb79:   bc  "." 
;--------------------------------------
C_CB7A:                        ;          XREF: 0xCB77 
    POP DE                     ;0xcb7a:   d1  "." 
    POP HL                     ;0xcb7b:   e1  "." 
    JR nc, C_CB82              ;0xcb7c:   30 04  "0." 
    POP AF                     ;0xcb7e:   f1  "." 
    JP C_CAE9                  ;0xcb7f:   c3 e9 ca  "..." 
;--------------------------------------
C_CB82:                        ;          XREF: 0xCB69 
    POP AF                     ;0xcb82:   f1  "." 
;--------------------------------------
C_CB83:                        ;          XREF: 0xCB2A 
    JP TXT_OUTPUT              ;0xcb83:   c3 5a bb  ".Z." 
;--------------------------------------
D_CB86:                        ;          XREF: 0xCAF0 
    x9 DEFB 0xd                ;0xcb86:   0xd
    x9 DEFB 0xa                ;0xcb87:   0xa
    x9 DEFB 0xff               ;0xcb88:   0xff
    x9 DEFB 0x20               ;0xcb89:   " "
    x9 DEFB 0x20               ;0xcb8a:   " "
;--------------------------------------
C_CB8B:                        ;          XREF: 0xCBEC 
    JR nz, $+1                 ;0xcb8b:   20 ff  " ." 
    CALL m, C_FF4B             ;0xcb8d:   fc 4b ff  ".K." 
    SUB A                      ;0xcb90:   97  "." 
    ADD A,D                    ;0xcb91:   82  "." 
;--------------------------------------
S_cb92:                        ;          XREF: 
    x2 DEFB " free"            ;0xcb92:   0xcb92 to 0xcb97
    x6 DEFB  '' + 0x80        ;0xcb98:   
    x7 DEFB 0x80               ;0xcb99:   
;--------------------------------------
S_cb9a:                        ;          XREF: 
    x2 DEFB "Bad command"      ;0xcb9a:   0xcb9a to 0xcba5
    x6 DEFB  '' + 0x80        ;0xcba6:   
    x6 DEFB  0x9b              ;0xcba7:   
;--------------------------------------
S_cba8:                        ;          XREF: 
    x2 DEFB "already exists"   ;0xcba8:   0xcba8 to 0xcbb6
    x6 DEFB  '' + 0x80        ;0xcbb7:   
    x6 DEFB  0x9b              ;0xcbb8:   
;--------------------------------------
S_cbb9:                        ;          XREF: 
    x2 DEFB "not found"        ;0xcbb9:   0xcbb9 to 0xcbc2
;--------------------------------------
C_CBC3:                        ;          XREF: 0xCC25 
    RST 0x38                   ;0xcbc3:   ff  "." 
    SUB L                      ;0xcbc4:   95  "." 
;--------------------------------------
S_cbc5:                        ;          XREF: 
    x2 DEFB "directory "       ;0xcbc5:   0xcbc5 to 0xcbcf
    x6 DEFB  '' + 0x80        ;0xcbd0:   
    x6 DEFB  0x98              ;0xcbd1:   
    x6 DEFB  0x9a              ;0xcbd2:   
    x6 DEFB  '' + 0x80        ;0xcbd3:   
    x6 DEFB  0x98              ;0xcbd4:   
;--------------------------------------
S_cbd5:                        ;          XREF: 
    x1 DEFB "changed, closing ", '}' + 0x80  ;0xcbd5:   0xcbd5 to 0xcbe9
    x4 DEFB "is ", 0x69        ;0xcbe7:   0xcbe7 to 0xcbeb
    x4 DEFB "s ", 0x9d         ;0xcbeb:   0xcbeb to 0xcbee
;--------------------------------------
S_cbee:                        ;          XREF: 
    x2 DEFB " only"            ;0xcbee:   0xcbee to 0xcbf3
    x6 DEFB  '' + 0x80        ;0xcbf4:   
    x7 DEFB 0xfd               ;0xcbf5:   
    x6 DEFB  '' + 0x80        ;0xcbf6:   
    x6 DEFB  0x95              ;0xcbf7:   
;--------------------------------------
S_cbf8:                        ;          XREF: 
    x1 DEFB "user", '|' + 0x80  ;0xcbf8:   0xcbf8 to 0xcbff
    x7 DEFB 0x80               ;0xcbfd:   
    x6 DEFB  '' + 0x80        ;0xcbfe:   
;--------------------------------------
S_cbff:                        ;          XREF: 
    x7 DEFB 0x2e               ;0xcbff:   
    x4 DEFB "..", 0x5e         ;0xcc00:   0xcc00 to 0xcc03
    x4 DEFB "C", '' + 0x80    ;0xcc03:   0xcc03 to 0xcc05
    SUB (HL)                   ;0xcc05:   96  "." 
;--------------------------------------
S_cc06:                        ;          XREF: 
    x7 DEFB 0x43               ;0xcc06:   
    x4 DEFB "P/M", 0x80        ;0xcc07:   0xcc07 to 0xcc0b
    RST 0x38                   ;0xcc0b:   ff  "." 
    SUB (HL)                   ;0xcc0c:   96  "." 
;--------------------------------------
S_cc0d:                        ;          XREF: 
    x2 DEFB "boot sector"      ;0xcc0d:   0xcc0d to 0xcc18
    x4 DEFB "i", 0x95          ;0xcc19:   0xcc19 to 0xcc1b
    x4 DEFB "i", 0x99          ;0xcc1b:   0xcc1b to 0xcc1d
    x4 DEFB "i", 0x95          ;0xcc1d:   0xcc1d to 0xcc1f
    x4 DEFB "i", 0x99          ;0xcc1f:   0xcc1f to 0xcc21
    x4 DEFB "i", 0x98          ;0xcc21:   0xcc21 to 0xcc23
    x4 DEFB "i", 0x73          ;0xcc23:   0xcc23 to 0xcc25
    JR nz, C_CBC3              ;0xcc25:   20 9c  " ." 
;--------------------------------------
S_cc27:                        ;          XREF: 
    x2 DEFB " protected"       ;0xcc27:   0xcc27 to 0xcc31
    x6 DEFB  '' + 0x80        ;0xcc32:   
    x6 DEFB  0x98              ;0xcc33:   
;--------------------------------------
S_cc34:                        ;          XREF: 
    x2 DEFB "missing"          ;0xcc34:   0xcc34 to 0xcc3b
    x6 DEFB  '' + 0x80        ;0xcc3c:   
    x7 DEFB 0x80               ;0xcc3d:   
;--------------------------------------
S_cc3e:                        ;          XREF: 
    x3 DEFB "Retry, Ignore or Cancel? "  ;0xcc3e:   0xcc3e to 0xcc57
;--------------------------------------
C_CC57:                        ;          XREF: 0xCC56 
    RST 0x38                   ;0xcc57:   ff  "." 
    ADD A,B                    ;0xcc58:   80  "." 
;--------------------------------------
S_cc59:                        ;          XREF: 
    x3 DEFB "Drive "           ;0xcc59:   0xcc59 to 0xcc5f
;--------------------------------------
C_CC5F:                        ;          XREF: 0xCBEE 
    CP 0x3a                    ;0xcc5f:   fe 3a  ".:" 
    JR nz, $+1                 ;0xcc61:   20 ff  " ." 
    ADD A,B                    ;0xcc63:   80  "." 
;--------------------------------------
S_cc64:                        ;          XREF: 
    x3 DEFB "Failed to load "  ;0xcc64:   0xcc64 to 0xcc73
;--------------------------------------
C_CC73:                        ;          XREF: 0xCC72 
    RST 0x38                   ;0xcc73:   ff  "." 
    ADD A,B                    ;0xcc74:   80  "." 
    ADD A,B                    ;0xcc75:   80  "." 
    RST 0x38                   ;0xcc76:   ff  "." 
    SUB L                      ;0xcc77:   95  "." 
;--------------------------------------
S_cc78:                        ;          XREF: 
    x3 DEFB "disc "            ;0xcc78:   0xcc78 to 0xcc7d
;--------------------------------------
C_CC7D:                        ;          XREF: 0xCC7C 
    RST 0x38                   ;0xcc7d:   ff  "." 
;--------------------------------------
S_cc7e:                        ;          XREF: 
    x2 DEFB " fail"            ;0xcc7e:   0xcc7e to 0xcc83
    x6 DEFB  '' + 0x80        ;0xcc84:   
;--------------------------------------
S_cc85:                        ;          XREF: 
    x2 DEFB "full"             ;0xcc85:   0xcc85 to 0xcc89
    x6 DEFB  '' + 0x80        ;0xcc8a:   
    x7 DEFB 0x80               ;0xcc8b:   
    x7 DEFB 0xfd               ;0xcc8c:   
    x4 DEFB " ", '' + 0x80    ;0xcc8d:   0xcc8d to 0xcc8f
;--------------------------------------
S_cc8f:                        ;          XREF: 0xCC44 
    x3 DEFB "write"            ;0xcc8f:   0xcc8f to 0xcc94
    RST 0x38                   ;0xcc94:   ff  "." 
;--------------------------------------
S_cc95:                        ;          XREF: 
    x3 DEFB "read"             ;0xcc95:   0xcc95 to 0xcc99
;--------------------------------------
C_CC99:                        ;          XREF: 0xCC27 
    RST 0x38                   ;0xcc99:   ff  "." 
    RST 0x38                   ;0xcc9a:   ff  "." 
    RST 0x38                   ;0xcc9b:   ff  "." 
    RST 0x38                   ;0xcc9c:   ff  "." 
    RST 0x38                   ;0xcc9d:   ff  "." 
    RST 0x38                   ;0xcc9e:   ff  "." 
    RST 0x38                   ;0xcc9f:   ff  "." 
;--------------------------------------
C_CCA0:                        ;          XREF: 0xC1D3 
    XOR A                      ;0xcca0:   af  "." 
    LD (IY+0),A                ;0xcca1:   fd 77 00  ".w." 
    LD (IY+1),A                ;0xcca4:   fd 77 01  ".w." 
    DEC A                      ;0xcca7:   3d  "=" 
    LD (IY+8),A                ;0xcca8:   fd 77 08  ".w." 
    LD (IY+0x2c),A             ;0xccab:   fd 77 2c  ".w," 
    LD (0xbe7d),IY             ;0xccae:   fd 22 7d be  "."}."  
    LD HL,CAS_IN_OPEN          ;0xccb2:   21 77 bc  "!w."  
    LD DE,0x164                ;0xccb5:   11 64 01  ".d."  
    CALL C_CA98                ;0xccb8:   cd 98 ca  "..." 
    LD BC,0x27                 ;0xccbb:   01 27 00  ".'."  
    LDIR                       ;0xccbe:   ed b0  ".." 
    EX DE,HL                   ;0xccc0:   eb  "." 
    LD (HL),0x30               ;0xccc1:   36 30  "60"  
    INC HL                     ;0xccc3:   23  "#" 
    LD (HL),0xcd               ;0xccc4:   36 cd  "6."  
    INC HL                     ;0xccc6:   23  "#" 
    CALL KL_CURR_SELECTION     ;0xccc7:   cd 12 b9  "..." 
    LD (HL),A                  ;0xccca:   77  "w" 
    LD A,0xc9                  ;0xcccb:   3e c9  ">."  
    LD (0xbe7f),A              ;0xcccd:   32 7f be  "2.."  
    XOR A                      ;0xccd0:   af  "." 
;--------------------------------------
BAR_DISC:                      ;          XREF: 0xC00C 
    CALL BAR_DISC_OUT           ;0xccd1:   cd e4 cc  "..." 
    RET nc                     ;0xccd4:   d0  "." 
;--------------------------------------
BAR_DISC_IN:                   ;          XREF: 0xC00F 
    LD HL,CAS_IN_OPEN          ;0xccd5:   21 77 bc  "!w."  
    LD B,7                     ;0xccd8:   06 07  ".."  
    CALL C_CCE9                ;0xccda:   cd e9 cc  "..." 
    RET nc                     ;0xccdd:   d0  "." 
    LD HL,CAS_CATALOG          ;0xccde:   21 9b bc  "!.."  
    INC B                      ;0xcce1:   04  "." 
    JR C_CCE9                  ;0xcce2:   18 05  ".." 
;--------------------------------------
BAR_DISC_OUT:                  ;          XREF: 0xC012 
    LD HL,CAS_OUT_OPEN         ;0xcce4:   21 8c bc  "!.."  
    LD B,5                     ;0xcce7:   06 05  ".."  
;--------------------------------------
C_CCE9:                        ;          XREF: 0xCCDA 
    OR A                       ;0xcce9:   b7  "." 
    JR nz, C_CD2B              ;0xccea:   20 3f  " ?" 
    LD DE,0x18b                ;0xccec:   11 8b 01  "..."  
    CALL C_CA98                ;0xccef:   cd 98 ca  "..." 
;--------------------------------------
C_CCF2:                        ;          XREF: 0xCCF9 
    LD (HL),0xdf               ;0xccf2:   36 df  "6."  
    INC HL                     ;0xccf4:   23  "#" 
    LD (HL),E                  ;0xccf5:   73  "s" 
    INC HL                     ;0xccf6:   23  "#" 
    LD (HL),D                  ;0xccf7:   72  "r" 
    INC HL                     ;0xccf8:   23  "#" 
    DJNZ C_CCF2                ;0xccf9:   10 f7  ".." 
    SCF                        ;0xccfb:   37  "7" 
    RET                        ;0xccfc:   c9  "." 
;--------------------------------------
BAR_TAPE:                      ;          XREF: 0xC015 
    CALL BAR_TAPE_OUT           ;0xccfd:   cd 18 cd  "..." 
    RET nc                     ;0xcd00:   d0  "." 
;--------------------------------------
BAR_TAPE_IN:                   ;          XREF: 0xC018 
    LD HL,0x164                ;0xcd01:   21 64 01  "!d."  
    LD DE,CAS_IN_OPEN          ;0xcd04:   11 77 bc  ".w."  
    LD BC,0x15                 ;0xcd07:   01 15 00  "..."  
    CALL C_CD21                ;0xcd0a:   cd 21 cd  ".!." 
    RET nc                     ;0xcd0d:   d0  "." 
    LD HL,0x188                ;0xcd0e:   21 88 01  "!.."  
    LD DE,CAS_CATALOG          ;0xcd11:   11 9b bc  "..."  
    LD C,3                     ;0xcd14:   0e 03  ".."  
    JR C_CD21                  ;0xcd16:   18 09  ".." 
;--------------------------------------
BAR_TAPE_OUT:                  ;          XREF: 0xC01B 
    LD HL,0x179                ;0xcd18:   21 79 01  "!y."  
    LD DE,CAS_OUT_OPEN         ;0xcd1b:   11 8c bc  "..."  
    LD BC,15                   ;0xcd1e:   01 0f 00  "..."  
;--------------------------------------
C_CD21:                        ;          XREF: 0xCD0A 
    OR A                       ;0xcd21:   b7  "." 
    JR nz, C_CD2B              ;0xcd22:   20 07  " ." 
    CALL C_CA9F                ;0xcd24:   cd 9f ca  "..." 
    LDIR                       ;0xcd27:   ed b0  ".." 
    SCF                        ;0xcd29:   37  "7" 
    RET                        ;0xcd2a:   c9  "." 
;--------------------------------------
C_CD2B:                        ;          XREF: 0xCCEA 
    LD A,4                     ;0xcd2b:   3e 04  ">."  
    JP C_CAEB                  ;0xcd2d:   c3 eb ca  "..." 
    LD IY,(0xbe7d)             ;0xcd30:   fd 2a 7d be  ".*}."  
    DI                         ;0xcd34:   f3  "." 
    EX AF,AF'                  ;0xcd35:   08  "." 
    EXX                        ;0xcd36:   d9  "." 
    LD A,C                     ;0xcd37:   79  "y" 
    POP DE                     ;0xcd38:   d1  "." 
    POP BC                     ;0xcd39:   c1  "." 
    POP HL                     ;0xcd3a:   e1  "." 
    EX (SP),HL                 ;0xcd3b:   e3  "." 
    PUSH BC                    ;0xcd3c:   c5  "." 
    PUSH DE                    ;0xcd3d:   d5  "." 
    LD C,A                     ;0xcd3e:   4f  "O" 
    LD B,0x7f                  ;0xcd3f:   06 7f  ".."  
    LD DE,0x10d2               ;0xcd41:   11 d2 10  "..."  
    ADD HL,DE                  ;0xcd44:   19  "." 
    PUSH HL                    ;0xcd45:   e5  "." 
    EXX                        ;0xcd46:   d9  "." 
    EX AF,AF'                  ;0xcd47:   08  "." 
    EI                         ;0xcd48:   fb  "." 
    JP 0xbe7f                  ;0xcd49:   c3 7f be  "..." 
    JP C_CEAF                  ;0xcd4c:   c3 af ce  "..." 
    JP C_D1B6                  ;0xcd4f:   c3 b6 d1  "..." 
    JP C_D1BC                  ;0xcd52:   c3 bc d1  "..." 
    JP C_CF64                  ;0xcd55:   c3 64 cf  ".d." 
    JP C_CFF5                  ;0xcd58:   c3 f5 cf  "..." 
    JP C_D069                  ;0xcd5b:   c3 69 d0  ".i." 
    JP C_D065                  ;0xcd5e:   c3 65 d0  ".e." 
    JP C_CF37                  ;0xcd61:   c3 37 cf  ".7." 
    JP C_D1D8                  ;0xcd64:   c3 d8 d1  "..." 
    JP C_D1C2                  ;0xcd67:   c3 c2 d1  "..." 
    JP C_D08F                  ;0xcd6a:   c3 8f d0  "..." 
    JP C_D0D8                  ;0xcd6d:   c3 d8 d0  "..." 
    JP C_D513                  ;0xcd70:   c3 13 d5  "..." 
;--------------------------------------
C_CD73:                        ;          XREF: 0xCDDF 
    CALL C_CD77                ;0xcd73:   cd 77 cd  ".w." 
    RET                        ;0xcd76:   c9  "." 
;--------------------------------------
C_CD77:                        ;          XREF: 0xCD73 
    PUSH HL                    ;0xcd77:   e5  "." 
    LD HL,6                    ;0xcd78:   21 06 00  "!.."  
    ADD HL,SP                  ;0xcd7b:   39  "9" 
    LD (IY+6),L                ;0xcd7c:   fd 75 06  ".u." 
    LD (IY+7),H                ;0xcd7f:   fd 74 07  ".t." 
    POP HL                     ;0xcd82:   e1  "." 
    RET                        ;0xcd83:   c9  "." 
;--------------------------------------
C_CD84:                        ;          XREF: 0xCF74 
    CALL C_CD77                ;0xcd84:   cd 77 cd  ".w." 
    PUSH AF                    ;0xcd87:   f5  "." 
    LD A,(IY+8)                ;0xcd88:   fd 7e 08  ".~." 
    JR C_CD94                  ;0xcd8b:   18 07  ".." 
;--------------------------------------
C_CD8D:                        ;          XREF: 0xD08F 
    CALL C_CD77                ;0xcd8d:   cd 77 cd  ".w." 
    PUSH AF                    ;0xcd90:   f5  "." 
    LD A,(IY+0x2c)             ;0xcd91:   fd 7e 2c  ".~," 
;--------------------------------------
C_CD94:                        ;          XREF: 0xCD8B 
    CP 0xff                    ;0xcd94:   fe ff  ".." 
    JR z, C_CDAA               ;0xcd96:   28 12  "(." 
    CALL C_CE16                ;0xcd98:   cd 16 ce  "..." 
    POP AF                     ;0xcd9b:   f1  "." 
    RET                        ;0xcd9c:   c9  "." 
;--------------------------------------
C_CD9D:                        ;          XREF: 0xCEAF 
    LD A,(IY+8)                ;0xcd9d:   fd 7e 08  ".~." 
    JR C_CDA5                  ;0xcda0:   18 03  ".." 
;--------------------------------------
C_CDA2:                        ;          XREF: 0xCF37 
    LD A,(IY+0x2c)             ;0xcda2:   fd 7e 2c  ".~," 
;--------------------------------------
C_CDA5:                        ;          XREF: 0xCDA0 
    CALL C_CD77                ;0xcda5:   cd 77 cd  ".w." 
    INC A                      ;0xcda8:   3c  "<" 
    RET z                      ;0xcda9:   c8  "." 
;--------------------------------------
C_CDAA:                        ;          XREF: 0xCD96 
    LD A,14                    ;0xcdaa:   3e 0e  ">."  
    OR A                       ;0xcdac:   b7  "." 
    JR C_CDB9                  ;0xcdad:   18 0a  ".." 
;--------------------------------------
C_CDAF:                        ;          XREF: 0xCDC4 
    LD A,4                     ;0xcdaf:   3e 04  ">."  
;--------------------------------------
C_CDB1:                        ;          XREF: 0xD38F 
    CALL C_DBCA                ;0xcdb1:   cd ca db  "..." 
    ADD A,12                   ;0xcdb4:   c6 0c  ".." 
;--------------------------------------
C_CDB6:                        ;          XREF: 0xD9FF 
    OR 0x80                    ;0xcdb6:   f6 80  ".." 
;--------------------------------------
C_CDB8:                        ;          XREF: 0xD4AD 
    CP A                       ;0xcdb8:   bf  "." 
;--------------------------------------
C_CDB9:                        ;          XREF: 0xCDAD 
    LD L,(IY+6)                ;0xcdb9:   fd 6e 06  ".n." 
    LD H,(IY+7)                ;0xcdbc:   fd 66 07  ".f." 
    LD SP,HL                   ;0xcdbf:   f9  "." 
    RET                        ;0xcdc0:   c9  "." 
;--------------------------------------
C_CDC1:                        ;          XREF: 0xD4C7 
    DEC A                      ;0xcdc1:   3d  "=" 
;--------------------------------------
C_CDC2:                        ;          XREF: 0xCDE7 
    DEC A                      ;0xcdc2:   3d  "=" 
    RET z                      ;0xcdc3:   c8  "." 
    JP C_CDAF                  ;0xcdc4:   c3 af cd  "..." 
;--------------------------------------
C_CDC7:                        ;          XREF: 0xCDEA 
    CALL C_CDCF                ;0xcdc7:   cd cf cd  "..." 
    LD B,(HL)                  ;0xcdca:   46  "F" 
    INC HL                     ;0xcdcb:   23  "#" 
;--------------------------------------
C_CDCC:                        ;          XREF: 0xF7EB 
    JP C_DBF9                  ;0xcdcc:   c3 f9 db  "..." 
;--------------------------------------
C_CDCF:                        ;          XREF: 0xCDC7 
    LD L,(IX+0)                ;0xcdcf:   dd 6e 00  ".n." 
    LD H,(IX+1)                ;0xcdd2:   dd 66 01  ".f." 
    INC IX                     ;0xcdd5:   dd 23  ".#" 
    INC IX                     ;0xcdd7:   dd 23  ".#" 
    RET                        ;0xcdd9:   c9  "." 
;--------------------------------------
BAR_A:                         ;          XREF: 0xC01E 
    XOR A                      ;0xcdda:   af  "." 
    JR C_CDDF                  ;0xcddb:   18 02  ".." 
;--------------------------------------
BAR_B:                         ;          XREF: 0xC021 
    LD A,1                     ;0xcddd:   3e 01  ">."  
;--------------------------------------
C_CDDF:                        ;          XREF: 0xCDDB 
    CALL C_CD73                ;0xcddf:   cd 73 cd  ".s." 
    JR C_CDF7                  ;0xcde2:   18 13  ".." 
;--------------------------------------
BAR_DRIVE:                     ;          XREF: 0xC024 
    CALL C_CD73                ;0xcde4:   cd 73 cd  ".s." 
    CALL C_CDC2                ;0xcde7:   cd c2 cd  "..." 
    CALL C_CDC7                ;0xcdea:   cd c7 cd  "..." 
    DEC B                      ;0xcded:   05  "." 
    JP nz, C_CDAF              ;0xcdee:   c2 af cd  "..." 
    LD A,(HL)                  ;0xcdf1:   7e  "~" 
    CALL C_CAA6                ;0xcdf2:   cd a6 ca  "..." 
    SUB 0x41                   ;0xcdf5:   d6 41  ".A" 
;--------------------------------------
C_CDF7:                        ;          XREF: 0xCDE2 
    CALL C_CE16                ;0xcdf7:   cd 16 ce  "..." 
    LD (IY+0),A                ;0xcdfa:   fd 77 00  ".w." 
    RET                        ;0xcdfd:   c9  "." 
;--------------------------------------
BAR_USER:                      ;          XREF: 0xC027 
    CALL C_CD73                ;0xcdfe:   cd 73 cd  ".s." 
    CALL C_CDC2                ;0xce01:   cd c2 cd  "..." 
    CALL C_CDCF                ;0xce04:   cd cf cd  "..." 
    LD DE,0x10                 ;0xce07:   11 10 00  "..."  
    CALL C_DBF3                ;0xce0a:   cd f3 db  "..." 
    JP nc, C_CDAF              ;0xce0d:   d2 af cd  "..." 
    LD (IY+1),L                ;0xce10:   fd 75 01  ".u." 
    RET                        ;0xce13:   c9  "." 
;--------------------------------------
C_CE14:                        ;          XREF: 0xCEB6 
    LD A,(BC)                  ;0xce14:   0a  "." 
    INC BC                     ;0xce15:   03  "." 
;--------------------------------------
C_CE16:                        ;          XREF: 0xCD98 
    PUSH HL                    ;0xce16:   e5  "." 
    PUSH DE                    ;0xce17:   d5  "." 
    PUSH BC                    ;0xce18:   c5  "." 
    PUSH AF                    ;0xce19:   f5  "." 
    LD C,A                     ;0xce1a:   4f  "O" 
    LD E,0xff                  ;0xce1b:   1e ff  ".."  
    LD A,(IY+8)                ;0xce1d:   fd 7e 08  ".~." 
    CP C                       ;0xce20:   b9  "." 
    JR z, C_CE2B               ;0xce21:   28 08  "(." 
    LD A,(IY+0x2c)             ;0xce23:   fd 7e 2c  ".~," 
    CP C                       ;0xce26:   b9  "." 
    JR z, C_CE2B               ;0xce27:   28 02  "(." 
    LD E,0                     ;0xce29:   1e 00  ".."  
;--------------------------------------
C_CE2B:                        ;          XREF: 0xCE21 
    PUSH DE                    ;0xce2b:   d5  "." 
    PUSH BC                    ;0xce2c:   c5  "." 
    CALL C_C4F0                ;0xce2d:   cd f0 c4  "..." 
    POP BC                     ;0xce30:   c1  "." 
    POP DE                     ;0xce31:   d1  "." 
    LD A,H                     ;0xce32:   7c  "|" 
    OR L                       ;0xce33:   b5  "." 
    JP z, C_CDAF               ;0xce34:   ca af cd  "..." 
    LD (IY+3),L                ;0xce37:   fd 75 03  ".u." 
    LD (IY+4),H                ;0xce3a:   fd 74 04  ".t." 
    LD (IY+5),E                ;0xce3d:   fd 73 05  ".s." 
    LD (IY+2),C                ;0xce40:   fd 71 02  ".q." 
    POP AF                     ;0xce43:   f1  "." 
    POP BC                     ;0xce44:   c1  "." 
    POP DE                     ;0xce45:   d1  "." 
    POP HL                     ;0xce46:   e1  "." 
    RET                        ;0xce47:   c9  "." 
;--------------------------------------
C_CE48:                        ;          XREF: 0xCEE8 
    LD HL,0x50                 ;0xce48:   21 50 00  "!P."  
    CALL C_CE5A                ;0xce4b:   cd 5a ce  ".Z." 
    PUSH HL                    ;0xce4e:   e5  "." 
    LD DE,0x42                 ;0xce4f:   11 42 00  ".B."  
    ADD HL,DE                  ;0xce52:   19  "." 
    LD (HL),0x80               ;0xce53:   36 80  "6."  
    POP HL                     ;0xce55:   e1  "." 
    RET                        ;0xce56:   c9  "." 
;--------------------------------------
C_CE57:                        ;          XREF: 0xCF42 
    LD HL,0x9a                 ;0xce57:   21 9a 00  "!.."  
;--------------------------------------
C_CE5A:                        ;          XREF: 0xCE4B 
    PUSH BC                    ;0xce5a:   c5  "." 
    PUSH DE                    ;0xce5b:   d5  "." 
    CALL C_CA9F                ;0xce5c:   cd 9f ca  "..." 
    LD (HL),0                  ;0xce5f:   36 00  "6."  
    INC HL                     ;0xce61:   23  "#" 
    LD (HL),E                  ;0xce62:   73  "s" 
    INC HL                     ;0xce63:   23  "#" 
    LD (HL),D                  ;0xce64:   72  "r" 
    INC HL                     ;0xce65:   23  "#" 
    LD (HL),E                  ;0xce66:   73  "s" 
    INC HL                     ;0xce67:   23  "#" 
    LD (HL),D                  ;0xce68:   72  "r" 
    INC HL                     ;0xce69:   23  "#" 
    PUSH HL                    ;0xce6a:   e5  "." 
    PUSH BC                    ;0xce6b:   c5  "." 
    LD BC,0x45                 ;0xce6c:   01 45 00  ".E."  
    EX DE,HL                   ;0xce6f:   eb  "." 
    CALL C_CAAF                ;0xce70:   cd af ca  "..." 
    POP BC                     ;0xce73:   c1  "." 
    LD H,B                     ;0xce74:   60  "`" 
    LD L,C                     ;0xce75:   69  "i" 
    POP DE                     ;0xce76:   d1  "." 
    PUSH DE                    ;0xce77:   d5  "." 
    LD BC,12                   ;0xce78:   01 0c 00  "..."  
    LDIR                       ;0xce7b:   ed b0  ".." 
    POP HL                     ;0xce7d:   e1  "." 
    POP DE                     ;0xce7e:   d1  "." 
    PUSH HL                    ;0xce7f:   e5  "." 
    LD BC,0x12                 ;0xce80:   01 12 00  "..."  
    ADD HL,BC                  ;0xce83:   09  "." 
    LD (HL),0x16               ;0xce84:   36 16  "6."  
    INC HL                     ;0xce86:   23  "#" 
    INC HL                     ;0xce87:   23  "#" 
    INC HL                     ;0xce88:   23  "#" 
    LD (HL),E                  ;0xce89:   73  "s" 
    INC HL                     ;0xce8a:   23  "#" 
    LD (HL),D                  ;0xce8b:   72  "r" 
    INC HL                     ;0xce8c:   23  "#" 
    LD (HL),0xff               ;0xce8d:   36 ff  "6."  
    POP HL                     ;0xce8f:   e1  "." 
    POP BC                     ;0xce90:   c1  "." 
    RET                        ;0xce91:   c9  "." 
;--------------------------------------
C_CE92:                        ;          XREF: 0xCEA5 
    PUSH HL                    ;0xce92:   e5  "." 
    LD HL,0                    ;0xce93:   21 00 00  "!.."  
    LD D,H                     ;0xce96:   54  "T" 
    LD B,0x43                  ;0xce97:   06 43  ".C"  
;--------------------------------------
C_CE99:                        ;          XREF: 0xCE9F 
    EX (SP),HL                 ;0xce99:   e3  "." 
    LD A,(HL)                  ;0xce9a:   7e  "~" 
    INC HL                     ;0xce9b:   23  "#" 
    EX (SP),HL                 ;0xce9c:   e3  "." 
    LD E,A                     ;0xce9d:   5f  "_" 
    ADD HL,DE                  ;0xce9e:   19  "." 
    DJNZ C_CE99                ;0xce9f:   10 f8  ".." 
    EX DE,HL                   ;0xcea1:   eb  "." 
    POP HL                     ;0xcea2:   e1  "." 
    RET                        ;0xcea3:   c9  "." 
;--------------------------------------
C_CEA4:                        ;          XREF: 0xD225 
    PUSH HL                    ;0xcea4:   e5  "." 
    CALL C_CE92                ;0xcea5:   cd 92 ce  "..." 
    LD (HL),E                  ;0xcea8:   73  "s" 
    INC HL                     ;0xcea9:   23  "#" 
    LD (HL),D                  ;0xceaa:   72  "r" 
    POP HL                     ;0xceab:   e1  "." 
    JP C_D3F9                  ;0xceac:   c3 f9 d3  "..." 
;--------------------------------------
C_CEAF:                        ;          XREF: 0xCD4C 
    CALL C_CD9D                ;0xceaf:   cd 9d cd  "..." 
    PUSH DE                    ;0xceb2:   d5  "." 
    CALL C_DA6F                ;0xceb3:   cd 6f da  ".o." 
    CALL C_CE14                ;0xceb6:   cd 14 ce  "..." 
    LD HL,9                    ;0xceb9:   21 09 00  "!.."  
    ADD HL,BC                  ;0xcebc:   09  "." 
    LD A,(HL)                  ;0xcebd:   7e  "~" 
    INC A                      ;0xcebe:   3c  "<" 
    JR z, C_CEC9               ;0xcebf:   28 08  "(." 
    CALL C_D651                ;0xcec1:   cd 51 d6  ".Q." 
    JP nc, C_D50C              ;0xcec4:   d2 0c d5  "..." 
    JR C_CEE7                  ;0xcec7:   18 1e  ".." 
;--------------------------------------
C_CEC9:                        ;          XREF: 0xCEBF 
    CALL C_D2A8                ;0xcec9:   cd a8 d2  "..." 
    CALL C_D651                ;0xcecc:   cd 51 d6  ".Q." 
    JR c, C_CEE7               ;0xcecf:   38 16  "8." 
    CALL C_D2B3                ;0xced1:   cd b3 d2  "..." 
    CALL C_D651                ;0xced4:   cd 51 d6  ".Q." 
    JR c, C_CEE7               ;0xced7:   38 0e  "8." 
    CALL C_D2B7                ;0xced9:   cd b7 d2  "..." 
    CALL C_D651                ;0xcedc:   cd 51 d6  ".Q." 
    PUSH AF                    ;0xcedf:   f5  "." 
    CALL nc, C_D2A8            ;0xcee0:   d4 a8 d2  "..." 
    POP AF                     ;0xcee3:   f1  "." 
    JP nc, C_D50C              ;0xcee4:   d2 0c d5  "..." 
;--------------------------------------
C_CEE7:                        ;          XREF: 0xCEC7 
    POP DE                     ;0xcee7:   d1  "." 
    CALL C_CE48                ;0xcee8:   cd 48 ce  ".H." 
    PUSH HL                    ;0xceeb:   e5  "." 
    LD DE,8                    ;0xceec:   11 08 00  "..."  
    CALL C_CA98                ;0xceef:   cd 98 ca  "..." 
    DEC BC                     ;0xcef2:   0b  "." 
    LD A,(BC)                  ;0xcef3:   0a  "." 
    LD (DE),A                  ;0xcef4:   12  "." 
    CALL C_D79C                ;0xcef5:   cd 9c d7  "..." 
    LD HL,0xe4                 ;0xcef8:   21 e4 00  "!.."  
    CALL C_CA9F                ;0xcefb:   cd 9f ca  "..." 
    CALL C_D392                ;0xcefe:   cd 92 d3  "..." 
    JR nc, C_CF22              ;0xcf01:   30 1f  "0." 
    PUSH HL                    ;0xcf03:   e5  "." 
    PUSH DE                    ;0xcf04:   d5  "." 
    CALL C_CE92                ;0xcf05:   cd 92 ce  "..." 
    CALL C_DBF9                ;0xcf08:   cd f9 db  "..." 
    CALL C_DBF3                ;0xcf0b:   cd f3 db  "..." 
    POP DE                     ;0xcf0e:   d1  "." 
    POP HL                     ;0xcf0f:   e1  "." 
    JR nz, C_CF1F              ;0xcf10:   20 0d  " ." 
    LD DE,0x55                 ;0xcf12:   11 55 00  ".U."  
    CALL C_CA98                ;0xcf15:   cd 98 ca  "..." 
    LD BC,0x45                 ;0xcf18:   01 45 00  ".E."  
    LDIR                       ;0xcf1b:   ed b0  ".." 
    JR C_CF22                  ;0xcf1d:   18 03  ".." 
;--------------------------------------
C_CF1F:                        ;          XREF: 0xCF10 
    CALL C_D79C                ;0xcf1f:   cd 9c d7  "..." 
;--------------------------------------
C_CF22:                        ;          XREF: 0xCF01 
    POP HL                     ;0xcf22:   e1  "." 
    PUSH HL                    ;0xcf23:   e5  "." 
    LD DE,0x15                 ;0xcf24:   11 15 00  "..."  
    ADD HL,DE                  ;0xcf27:   19  "." 
    LD E,(HL)                  ;0xcf28:   5e  "^" 
    INC HL                     ;0xcf29:   23  "#" 
    LD D,(HL)                  ;0xcf2a:   56  "V" 
    INC HL                     ;0xcf2b:   23  "#" 
    INC HL                     ;0xcf2c:   23  "#" 
    LD C,(HL)                  ;0xcf2d:   4e  "N" 
    INC HL                     ;0xcf2e:   23  "#" 
    LD B,(HL)                  ;0xcf2f:   46  "F" 
    POP HL                     ;0xcf30:   e1  "." 
    SCF                        ;0xcf31:   37  "7" 
    SBC A,A                    ;0xcf32:   9f  "." 
    LD A,(IY+0x67)             ;0xcf33:   fd 7e 67  ".~g" 
    RET                        ;0xcf36:   c9  "." 
;--------------------------------------
C_CF37:                        ;          XREF: 0xCD61 
    CALL C_CDA2                ;0xcf37:   cd a2 cd  "..." 
    PUSH DE                    ;0xcf3a:   d5  "." 
    CALL C_DA6A                ;0xcf3b:   cd 6a da  ".j." 
    CALL C_CE14                ;0xcf3e:   cd 14 ce  "..." 
    POP DE                     ;0xcf41:   d1  "." 
    CALL C_CE57                ;0xcf42:   cd 57 ce  ".W." 
    PUSH HL                    ;0xcf45:   e5  "." 
    CALL C_D2AB                ;0xcf46:   cd ab d2  "..." 
    CALL C_D676                ;0xcf49:   cd 76 d6  ".v." 
    LD H,B                     ;0xcf4c:   60  "`" 
    LD L,C                     ;0xcf4d:   69  "i" 
    DEC HL                     ;0xcf4e:   2b  "+" 
    LD DE,0x2c                 ;0xcf4f:   11 2c 00  ".,."  
    CALL C_CA98                ;0xcf52:   cd 98 ca  "..." 
    LD BC,13                   ;0xcf55:   01 0d 00  "..."  
    LDIR                       ;0xcf58:   ed b0  ".." 
    LD BC,0x17                 ;0xcf5a:   01 17 00  "..."  
    CALL C_CAAF                ;0xcf5d:   cd af ca  "..." 
    POP HL                     ;0xcf60:   e1  "." 
    SCF                        ;0xcf61:   37  "7" 
    SBC A,A                    ;0xcf62:   9f  "." 
    RET                        ;0xcf63:   c9  "." 
;--------------------------------------
C_CF64:                        ;          XREF: 0xCD55 
    PUSH HL                    ;0xcf64:   e5  "." 
    PUSH DE                    ;0xcf65:   d5  "." 
    PUSH BC                    ;0xcf66:   c5  "." 
    CALL C_CF74                ;0xcf67:   cd 74 cf  ".t." 
    POP BC                     ;0xcf6a:   c1  "." 
    POP DE                     ;0xcf6b:   d1  "." 
    POP HL                     ;0xcf6c:   e1  "." 
    RET nc                     ;0xcf6d:   d0  "." 
    CP 0x1a                    ;0xcf6e:   fe 1a  ".." 
    SCF                        ;0xcf70:   37  "7" 
    RET nz                     ;0xcf71:   c0  "." 
    OR A                       ;0xcf72:   b7  "." 
    RET                        ;0xcf73:   c9  "." 
;--------------------------------------
C_CF74:                        ;          XREF: 0xCF67 
    CALL C_CD84                ;0xcf74:   cd 84 cd  "..." 
    PUSH IY                    ;0xcf77:   fd e5  ".." 
    POP DE                     ;0xcf79:   d1  "." 
    LD HL,0x50                 ;0xcf7a:   21 50 00  "!P."  
    ADD HL,DE                  ;0xcf7d:   19  "." 
    LD A,(HL)                  ;0xcf7e:   7e  "~" 
    CP 2                       ;0xcf7f:   fe 02  ".." 
    JP z, C_CDAA               ;0xcf81:   ca aa cd  "..." 
    LD (HL),1                  ;0xcf84:   36 01  "6."  
    LD HL,0x95                 ;0xcf86:   21 95 00  "!.."  
    ADD HL,DE                  ;0xcf89:   19  "." 
    LD A,(HL)                  ;0xcf8a:   7e  "~" 
    INC HL                     ;0xcf8b:   23  "#" 
    OR (HL)                    ;0xcf8c:   b6  "." 
    INC HL                     ;0xcf8d:   23  "#" 
    OR (HL)                    ;0xcf8e:   b6  "." 
    JR z, C_CFC7               ;0xcf8f:   28 36  "(6" 
    LD HL,0x68                 ;0xcf91:   21 68 00  "!h."  
    ADD HL,DE                  ;0xcf94:   19  "." 
    LD A,(HL)                  ;0xcf95:   7e  "~" 
    INC HL                     ;0xcf96:   23  "#" 
    OR (HL)                    ;0xcf97:   b6  "." 
    DEC HL                     ;0xcf98:   2b  "+" 
    CALL z, C_CFCB             ;0xcf99:   cc cb cf  "..." 
    LD A,(HL)                  ;0xcf9c:   7e  "~" 
    INC HL                     ;0xcf9d:   23  "#" 
    OR (HL)                    ;0xcf9e:   b6  "." 
    JR z, C_CFC7               ;0xcf9f:   28 26  "(&" 
    LD B,(HL)                  ;0xcfa1:   46  "F" 
    DEC HL                     ;0xcfa2:   2b  "+" 
    LD C,(HL)                  ;0xcfa3:   4e  "N" 
    DEC BC                     ;0xcfa4:   0b  "." 
    LD (HL),C                  ;0xcfa5:   71  "q" 
    INC HL                     ;0xcfa6:   23  "#" 
    LD (HL),B                  ;0xcfa7:   70  "p" 
    LD HL,0x95                 ;0xcfa8:   21 95 00  "!.."  
    ADD HL,DE                  ;0xcfab:   19  "." 
    LD B,3                     ;0xcfac:   06 03  ".."  
;--------------------------------------
C_CFAE:                        ;          XREF: 0xCFB5 
    LD A,(HL)                  ;0xcfae:   7e  "~" 
    SUB 1                      ;0xcfaf:   d6 01  ".." 
    LD (HL),A                  ;0xcfb1:   77  "w" 
    JR nc, C_CFB7              ;0xcfb2:   30 03  "0." 
    INC HL                     ;0xcfb4:   23  "#" 
    DJNZ C_CFAE                ;0xcfb5:   10 f7  ".." 
;--------------------------------------
C_CFB7:                        ;          XREF: 0xCFB2 
    LD HL,0x53                 ;0xcfb7:   21 53 00  "!S."  
    ADD HL,DE                  ;0xcfba:   19  "." 
    LD E,(HL)                  ;0xcfbb:   5e  "^" 
    INC HL                     ;0xcfbc:   23  "#" 
    LD D,(HL)                  ;0xcfbd:   56  "V" 
    EX DE,HL                   ;0xcfbe:   eb  "." 
    RST 0x20                   ;0xcfbf:   e7  "." 
    EX DE,HL                   ;0xcfc0:   eb  "." 
    INC DE                     ;0xcfc1:   13  "." 
    LD (HL),D                  ;0xcfc2:   72  "r" 
    DEC HL                     ;0xcfc3:   2b  "+" 
    LD (HL),E                  ;0xcfc4:   73  "s" 
    SCF                        ;0xcfc5:   37  "7" 
    RET                        ;0xcfc6:   c9  "." 
;--------------------------------------
C_CFC7:                        ;          XREF: 0xCF8F 
    LD A,15                    ;0xcfc7:   3e 0f  ">."  
    OR A                       ;0xcfc9:   b7  "." 
    RET                        ;0xcfca:   c9  "." 
;--------------------------------------
C_CFCB:                        ;          XREF: 0xCF99 
    PUSH HL                    ;0xcfcb:   e5  "." 
    PUSH DE                    ;0xcfcc:   d5  "." 
    PUSH HL                    ;0xcfcd:   e5  "." 
    LD HL,0x51                 ;0xcfce:   21 51 00  "!Q."  
    ADD HL,DE                  ;0xcfd1:   19  "." 
    CALL C_DBF9                ;0xcfd2:   cd f9 db  "..." 
    PUSH HL                    ;0xcfd5:   e5  "." 
    LD BC,0x10                 ;0xcfd6:   01 10 00  "..."  
    CALL C_D049                ;0xcfd9:   cd 49 d0  ".I." 
    LD A,0x10                  ;0xcfdc:   3e 10  ">."  
    SUB C                      ;0xcfde:   91  "." 
    LD B,A                     ;0xcfdf:   47  "G" 
    LD C,0                     ;0xcfe0:   0e 00  ".."  
    SRL B                      ;0xcfe2:   cb 38  ".8" 
    RR C                       ;0xcfe4:   cb 19  ".." 
    POP DE                     ;0xcfe6:   d1  "." 
    POP HL                     ;0xcfe7:   e1  "." 
    LD (HL),C                  ;0xcfe8:   71  "q" 
    INC HL                     ;0xcfe9:   23  "#" 
    LD (HL),B                  ;0xcfea:   70  "p" 
    LD BC,D_FFEA               ;0xcfeb:   01 ea ff  "..."  
    ADD HL,BC                  ;0xcfee:   09  "." 
    LD (HL),E                  ;0xcfef:   73  "s" 
    INC HL                     ;0xcff0:   23  "#" 
    LD (HL),D                  ;0xcff1:   72  "r" 
    POP DE                     ;0xcff2:   d1  "." 
    POP HL                     ;0xcff3:   e1  "." 
    RET                        ;0xcff4:   c9  "." 
;--------------------------------------
C_CFF5:                        ;          XREF: 0xCD58 
    CALL C_CD84                ;0xcff5:   cd 84 cd  "..." 
    PUSH HL                    ;0xcff8:   e5  "." 
    LD HL,0x50                 ;0xcff9:   21 50 00  "!P."  
    CALL C_CA9F                ;0xcffc:   cd 9f ca  "..." 
    LD A,(HL)                  ;0xcfff:   7e  "~" 
    CP 1                       ;0xd000:   fe 01  ".." 
    JP z, C_CDAA               ;0xd002:   ca aa cd  "..." 
    LD (HL),2                  ;0xd005:   36 02  "6."  
    LD DE,0x45                 ;0xd007:   11 45 00  ".E."  
    ADD HL,DE                  ;0xd00a:   19  "." 
    LD E,(HL)                  ;0xd00b:   5e  "^" 
    INC HL                     ;0xd00c:   23  "#" 
    LD D,(HL)                  ;0xd00d:   56  "V" 
    POP HL                     ;0xd00e:   e1  "." 
    PUSH DE                    ;0xd00f:   d5  "." 
    PUSH HL                    ;0xd010:   e5  "." 
    EX DE,HL                   ;0xd011:   eb  "." 
    LD A,7                     ;0xd012:   3e 07  ">."  
    CALL C_DBEB                ;0xd014:   cd eb db  "..." 
    LD B,H                     ;0xd017:   44  "D" 
    LD C,L                     ;0xd018:   4d  "M" 
    POP HL                     ;0xd019:   e1  "." 
    CALL C_D049                ;0xd01a:   cd 49 d0  ".I." 
    POP DE                     ;0xd01d:   d1  "." 
    JR nc, C_D03E              ;0xd01e:   30 1e  "0." 
    LD A,E                     ;0xd020:   7b  "{" 
    AND 0x7f                   ;0xd021:   e6 7f  ".." 
    JR z, C_D03E               ;0xd023:   28 19  "(." 
    PUSH AF                    ;0xd025:   f5  "." 
    PUSH HL                    ;0xd026:   e5  "." 
    LD HL,0xe4                 ;0xd027:   21 e4 00  "!.."  
    CALL C_CA9F                ;0xd02a:   cd 9f ca  "..." 
    PUSH HL                    ;0xd02d:   e5  "." 
    LD BC,1                    ;0xd02e:   01 01 00  "..."  
    CALL C_D049                ;0xd031:   cd 49 d0  ".I." 
    POP HL                     ;0xd034:   e1  "." 
    POP DE                     ;0xd035:   d1  "." 
    POP BC                     ;0xd036:   c1  "." 
    JR nc, C_D03E              ;0xd037:   30 05  "0." 
    LD C,B                     ;0xd039:   48  "H" 
    LD B,0                     ;0xd03a:   06 00  ".."  
    LDIR                       ;0xd03c:   ed b0  ".." 
;--------------------------------------
C_D03E:                        ;          XREF: 0xD01E 
    LD HL,0x6f                 ;0xd03e:   21 6f 00  "!o."  
    CALL C_CA9F                ;0xd041:   cd 9f ca  "..." 
    SCF                        ;0xd044:   37  "7" 
    SBC A,A                    ;0xd045:   9f  "." 
    JP C_DBF9                  ;0xd046:   c3 f9 db  "..." 
;--------------------------------------
C_D049:                        ;          XREF: 0xCFD9 
    JR C_D05F                  ;0xd049:   18 14  ".." 
;--------------------------------------
C_D04B:                        ;          XREF: 0xD061 
    CALL C_D392                ;0xd04b:   cd 92 d3  "..." 
    RET nc                     ;0xd04e:   d0  "." 
    LD DE,0x67                 ;0xd04f:   11 67 00  ".g."  
    CALL C_CA98                ;0xd052:   cd 98 ca  "..." 
    LD A,(DE)                  ;0xd055:   1a  "." 
    RRA                        ;0xd056:   1f  "." 
    CALL c, C_D252             ;0xd057:   dc 52 d2  ".R." 
    LD DE,0x80                 ;0xd05a:   11 80 00  "..."  
    ADD HL,DE                  ;0xd05d:   19  "." 
    DEC BC                     ;0xd05e:   0b  "." 
;--------------------------------------
C_D05F:                        ;          XREF: 0xD049 
    LD A,B                     ;0xd05f:   78  "x" 
    OR C                       ;0xd060:   b1  "." 
    JR nz, C_D04B              ;0xd061:   20 e8  " ." 
    SCF                        ;0xd063:   37  "7" 
    RET                        ;0xd064:   c9  "." 
;--------------------------------------
C_D065:                        ;          XREF: 0xCD5E 
    CALL C_CF64                ;0xd065:   cd 64 cf  ".d." 
    RET nc                     ;0xd068:   d0  "." 
;--------------------------------------
C_D069:                        ;          XREF: 0xCD5B 
    PUSH HL                    ;0xd069:   e5  "." 
    PUSH DE                    ;0xd06a:   d5  "." 
    PUSH AF                    ;0xd06b:   f5  "." 
    LD HL,0x53                 ;0xd06c:   21 53 00  "!S."  
    CALL C_CA9F                ;0xd06f:   cd 9f ca  "..." 
    LD E,(HL)                  ;0xd072:   5e  "^" 
    INC HL                     ;0xd073:   23  "#" 
    LD D,(HL)                  ;0xd074:   56  "V" 
    DEC DE                     ;0xd075:   1b  "." 
    LD (HL),D                  ;0xd076:   72  "r" 
    DEC HL                     ;0xd077:   2b  "+" 
    LD (HL),E                  ;0xd078:   73  "s" 
    LD D,H                     ;0xd079:   54  "T" 
    LD E,L                     ;0xd07a:   5d  "]" 
    LD HL,0x42                 ;0xd07b:   21 42 00  "!B."  
    ADD HL,DE                  ;0xd07e:   19  "." 
    CALL C_D7AB                ;0xd07f:   cd ab d7  "..." 
    LD HL,0x15                 ;0xd082:   21 15 00  "!.."  
    ADD HL,DE                  ;0xd085:   19  "." 
    INC (HL)                   ;0xd086:   34  "4" 
    JR nz, C_D08B              ;0xd087:   20 02  " ." 
    INC HL                     ;0xd089:   23  "#" 
    INC (HL)                   ;0xd08a:   34  "4" 
;--------------------------------------
C_D08B:                        ;          XREF: 0xD087 
    POP AF                     ;0xd08b:   f1  "." 
    POP DE                     ;0xd08c:   d1  "." 
    POP HL                     ;0xd08d:   e1  "." 
    RET                        ;0xd08e:   c9  "." 
;--------------------------------------
C_D08F:                        ;          XREF: 0xCD6A 
    CALL C_CD8D                ;0xd08f:   cd 8d cd  "..." 
    PUSH HL                    ;0xd092:   e5  "." 
    PUSH DE                    ;0xd093:   d5  "." 
    PUSH BC                    ;0xd094:   c5  "." 
    PUSH AF                    ;0xd095:   f5  "." 
    PUSH IY                    ;0xd096:   fd e5  ".." 
    POP DE                     ;0xd098:   d1  "." 
    LD HL,0x9a                 ;0xd099:   21 9a 00  "!.."  
    ADD HL,DE                  ;0xd09c:   19  "." 
    LD A,(HL)                  ;0xd09d:   7e  "~" 
    CP 2                       ;0xd09e:   fe 02  ".." 
    JP z, C_CDAA               ;0xd0a0:   ca aa cd  "..." 
    LD (HL),1                  ;0xd0a3:   36 01  "6."  
    LD HL,0xb2                 ;0xd0a5:   21 b2 00  "!.."  
    ADD HL,DE                  ;0xd0a8:   19  "." 
    PUSH HL                    ;0xd0a9:   e5  "." 
    CALL C_DBF9                ;0xd0aa:   cd f9 db  "..." 
    LD BC,D_F800               ;0xd0ad:   01 00 f8  "..."  
    ADD HL,BC                  ;0xd0b0:   09  "." 
    PUSH DE                    ;0xd0b1:   d5  "." 
    CALL c, C_D118             ;0xd0b2:   dc 18 d1  "..." 
    POP DE                     ;0xd0b5:   d1  "." 
    POP HL                     ;0xd0b6:   e1  "." 
    INC (HL)                   ;0xd0b7:   34  "4" 
    INC HL                     ;0xd0b8:   23  "#" 
    JR nz, C_D0BC              ;0xd0b9:   20 01  " ." 
    INC (HL)                   ;0xd0bb:   34  "4" 
;--------------------------------------
C_D0BC:                        ;          XREF: 0xD0B9 
    LD HL,0xdf                 ;0xd0bc:   21 df 00  "!.."  
    ADD HL,DE                  ;0xd0bf:   19  "." 
    CALL C_D7AB                ;0xd0c0:   cd ab d7  "..." 
    LD HL,0x9d                 ;0xd0c3:   21 9d 00  "!.."  
    ADD HL,DE                  ;0xd0c6:   19  "." 
    POP AF                     ;0xd0c7:   f1  "." 
    LD C,(HL)                  ;0xd0c8:   4e  "N" 
    INC HL                     ;0xd0c9:   23  "#" 
    LD B,(HL)                  ;0xd0ca:   46  "F" 
    DEC HL                     ;0xd0cb:   2b  "+" 
    LD (BC),A                  ;0xd0cc:   02  "." 
    INC (HL)                   ;0xd0cd:   34  "4" 
    JR nz, C_D0D2              ;0xd0ce:   20 02  " ." 
    INC HL                     ;0xd0d0:   23  "#" 
    INC (HL)                   ;0xd0d1:   34  "4" 
;--------------------------------------
C_D0D2:                        ;          XREF: 0xD0CE 
    POP BC                     ;0xd0d2:   c1  "." 
    POP DE                     ;0xd0d3:   d1  "." 
    POP HL                     ;0xd0d4:   e1  "." 
    SCF                        ;0xd0d5:   37  "7" 
    SBC A,A                    ;0xd0d6:   9f  "." 
    RET                        ;0xd0d7:   c9  "." 
;--------------------------------------
C_D0D8:                        ;          XREF: 0xCD6D 
    CALL C_CD8D                ;0xd0d8:   cd 8d cd  "..." 
    PUSH AF                    ;0xd0db:   f5  "." 
    PUSH HL                    ;0xd0dc:   e5  "." 
    PUSH DE                    ;0xd0dd:   d5  "." 
    LD HL,0x9a                 ;0xd0de:   21 9a 00  "!.."  
    CALL C_CA9F                ;0xd0e1:   cd 9f ca  "..." 
    LD A,(HL)                  ;0xd0e4:   7e  "~" 
    CP 1                       ;0xd0e5:   fe 01  ".." 
    JP z, C_CDAA               ;0xd0e7:   ca aa cd  "..." 
    LD (HL),2                  ;0xd0ea:   36 02  "6."  
    LD DE,0x20                 ;0xd0ec:   11 20 00  ". ."  
    ADD HL,DE                  ;0xd0ef:   19  "." 
    LD (HL),B                  ;0xd0f0:   70  "p" 
    DEC HL                     ;0xd0f1:   2b  "+" 
    LD (HL),C                  ;0xd0f2:   71  "q" 
    POP BC                     ;0xd0f3:   c1  "." 
    DEC HL                     ;0xd0f4:   2b  "+" 
    LD (HL),B                  ;0xd0f5:   70  "p" 
    DEC HL                     ;0xd0f6:   2b  "+" 
    LD (HL),C                  ;0xd0f7:   71  "q" 
    LD DE,0x29                 ;0xd0f8:   11 29 00  ".)."  
    ADD HL,DE                  ;0xd0fb:   19  "." 
    LD (HL),B                  ;0xd0fc:   70  "p" 
    DEC HL                     ;0xd0fd:   2b  "+" 
    LD (HL),C                  ;0xd0fe:   71  "q" 
    LD DE,D_FFD3               ;0xd0ff:   11 d3 ff  "..."  
    ADD HL,DE                  ;0xd102:   19  "." 
    LD (HL),C                  ;0xd103:   71  "q" 
    INC HL                     ;0xd104:   23  "#" 
    LD (HL),B                  ;0xd105:   70  "p" 
    POP BC                     ;0xd106:   c1  "." 
    INC HL                     ;0xd107:   23  "#" 
    LD (HL),C                  ;0xd108:   71  "q" 
    INC HL                     ;0xd109:   23  "#" 
    LD (HL),B                  ;0xd10a:   70  "p" 
    LD DE,D_FFE6               ;0xd10b:   11 e6 ff  "..."  
    ADD HL,DE                  ;0xd10e:   19  "." 
    LD (HL),C                  ;0xd10f:   71  "q" 
    INC HL                     ;0xd110:   23  "#" 
    LD (HL),B                  ;0xd111:   70  "p" 
    POP AF                     ;0xd112:   f1  "." 
    LD DE,0x15                 ;0xd113:   11 15 00  "..."  
    ADD HL,DE                  ;0xd116:   19  "." 
    LD (HL),A                  ;0xd117:   77  "w" 
;--------------------------------------
C_D118:                        ;          XREF: 0xD0B2 
    PUSH IY                    ;0xd118:   fd e5  ".." 
    POP DE                     ;0xd11a:   d1  "." 
    LD HL,0xb6                 ;0xd11b:   21 b6 00  "!.."  
    ADD HL,DE                  ;0xd11e:   19  "." 
    LD A,(HL)                  ;0xd11f:   7e  "~" 
    OR A                       ;0xd120:   b7  "." 
    JR z, C_D13B               ;0xd121:   28 18  "(." 
    LD HL,0xb1                 ;0xd123:   21 b1 00  "!.."  
    ADD HL,DE                  ;0xd126:   19  "." 
    LD A,(HL)                  ;0xd127:   7e  "~" 
    AND 15                     ;0xd128:   e6 0f  ".." 
    CP 6                       ;0xd12a:   fe 06  ".." 
    JR z, C_D13B               ;0xd12c:   28 0d  "(." 
    LD HL,0x2c                 ;0xd12e:   21 2c 00  "!,."  
    ADD HL,DE                  ;0xd131:   19  "." 
    PUSH DE                    ;0xd132:   d5  "." 
    EX DE,HL                   ;0xd133:   eb  "." 
    CALL C_D7A7                ;0xd134:   cd a7 d7  "..." 
    CALL C_D77D                ;0xd137:   cd 7d d7  ".}." 
    POP DE                     ;0xd13a:   d1  "." 
;--------------------------------------
C_D13B:                        ;          XREF: 0xD121 
    LD HL,0xb2                 ;0xd13b:   21 b2 00  "!.."  
    ADD HL,DE                  ;0xd13e:   19  "." 
    PUSH HL                    ;0xd13f:   e5  "." 
    LD E,(HL)                  ;0xd140:   5e  "^" 
    INC HL                     ;0xd141:   23  "#" 
    LD D,(HL)                  ;0xd142:   56  "V" 
    LD BC,D_FFE8               ;0xd143:   01 e8 ff  "..."  
    ADD HL,BC                  ;0xd146:   09  "." 
    CALL C_DBF9                ;0xd147:   cd f9 db  "..." 
    PUSH HL                    ;0xd14a:   e5  "." 
    CALL C_D164                ;0xd14b:   cd 64 d1  ".d." 
    POP BC                     ;0xd14e:   c1  "." 
    POP HL                     ;0xd14f:   e1  "." 
    LD (HL),0                  ;0xd150:   36 00  "6."  
    INC HL                     ;0xd152:   23  "#" 
    LD (HL),0                  ;0xd153:   36 00  "6."  
    INC HL                     ;0xd155:   23  "#" 
    INC HL                     ;0xd156:   23  "#" 
    INC HL                     ;0xd157:   23  "#" 
    LD (HL),0                  ;0xd158:   36 00  "6."  
    LD DE,D_FFE7               ;0xd15a:   11 e7 ff  "..."  
    ADD HL,DE                  ;0xd15d:   19  "." 
    LD (HL),C                  ;0xd15e:   71  "q" 
    INC HL                     ;0xd15f:   23  "#" 
    LD (HL),B                  ;0xd160:   70  "p" 
    SCF                        ;0xd161:   37  "7" 
    SBC A,A                    ;0xd162:   9f  "." 
    RET                        ;0xd163:   c9  "." 
;--------------------------------------
C_D164:                        ;          XREF: 0xD14B 
    PUSH DE                    ;0xd164:   d5  "." 
    LD A,7                     ;0xd165:   3e 07  ">."  
    EX DE,HL                   ;0xd167:   eb  "." 
    CALL C_DBEB                ;0xd168:   cd eb db  "..." 
    EX DE,HL                   ;0xd16b:   eb  "." 
    LD B,D                     ;0xd16c:   42  "B" 
    LD C,E                     ;0xd16d:   4b  "K" 
    CALL C_D188                ;0xd16e:   cd 88 d1  "..." 
    POP BC                     ;0xd171:   c1  "." 
    LD A,C                     ;0xd172:   79  "y" 
    AND 0x7f                   ;0xd173:   e6 7f  ".." 
    RET z                      ;0xd175:   c8  "." 
    LD C,A                     ;0xd176:   4f  "O" 
    LD B,0                     ;0xd177:   06 00  ".."  
    LD DE,0xe4                 ;0xd179:   11 e4 00  "..."  
    CALL C_CA98                ;0xd17c:   cd 98 ca  "..." 
    PUSH DE                    ;0xd17f:   d5  "." 
    CALL KL_LDIR               ;0xd180:   cd 1b b9  "..." 
    LD A,0x1a                  ;0xd183:   3e 1a  ">."  
    LD (DE),A                  ;0xd185:   12  "." 
    POP HL                     ;0xd186:   e1  "." 
    INC BC                     ;0xd187:   03  "." 
;--------------------------------------
C_D188:                        ;          XREF: 0xD16E 
    JR C_D1B1                  ;0xd188:   18 27  ".'" 
;--------------------------------------
C_D18A:                        ;          XREF: 0xD1B3 
    PUSH HL                    ;0xd18a:   e5  "." 
    LD DE,0xb1                 ;0xd18b:   11 b1 00  "..."  
    CALL C_CA98                ;0xd18e:   cd 98 ca  "..." 
    LD A,(DE)                  ;0xd191:   1a  "." 
    RRA                        ;0xd192:   1f  "." 
    JR nc, C_D1A8              ;0xd193:   30 13  "0." 
    PUSH BC                    ;0xd195:   c5  "." 
    LD DE,0xe4                 ;0xd196:   11 e4 00  "..."  
    CALL C_CA98                ;0xd199:   cd 98 ca  "..." 
    PUSH DE                    ;0xd19c:   d5  "." 
    LD BC,0x80                 ;0xd19d:   01 80 00  "..."  
    CALL KL_LDIR               ;0xd1a0:   cd 1b b9  "..." 
    POP HL                     ;0xd1a3:   e1  "." 
    POP BC                     ;0xd1a4:   c1  "." 
    CALL C_D252                ;0xd1a5:   cd 52 d2  ".R." 
;--------------------------------------
C_D1A8:                        ;          XREF: 0xD193 
    CALL C_D3AF                ;0xd1a8:   cd af d3  "..." 
    POP HL                     ;0xd1ab:   e1  "." 
    LD DE,0x80                 ;0xd1ac:   11 80 00  "..."  
    ADD HL,DE                  ;0xd1af:   19  "." 
    DEC BC                     ;0xd1b0:   0b  "." 
;--------------------------------------
C_D1B1:                        ;          XREF: 0xD188 
    LD A,B                     ;0xd1b1:   78  "x" 
    OR C                       ;0xd1b2:   b1  "." 
    JR nz, C_D18A              ;0xd1b3:   20 d5  " ." 
    RET                        ;0xd1b5:   c9  "." 
;--------------------------------------
C_D1B6:                        ;          XREF: 0xCD4F 
    CALL C_CD84                ;0xd1b6:   cd 84 cd  "..." 
    CALL C_C9E5                ;0xd1b9:   cd e5 c9  "..." 
;--------------------------------------
C_D1BC:                        ;          XREF: 0xCD52 
    LD (IY+8),0xff             ;0xd1bc:   fd 36 08 ff  ".6.."  
    JR C_D230                  ;0xd1c0:   18 6e  ".n" 
;--------------------------------------
C_D1C2:                        ;          XREF: 0xCD67 
    CALL C_CD8D                ;0xd1c2:   cd 8d cd  "..." 
    LD DE,0x2d                 ;0xd1c5:   11 2d 00  ".-."  
    CALL C_CA98                ;0xd1c8:   cd 98 ca  "..." 
    XOR A                      ;0xd1cb:   af  "." 
    CALL C_D83C                ;0xd1cc:   cd 3c d8  ".<." 
    DEC DE                     ;0xd1cf:   1b  "." 
    LD A,0xff                  ;0xd1d0:   3e ff  ">."  
    LD (DE),A                  ;0xd1d2:   12  "." 
    CALL C_C51F                ;0xd1d3:   cd 1f c5  "..." 
    JR C_D230                  ;0xd1d6:   18 58  ".X" 
;--------------------------------------
C_D1D8:                        ;          XREF: 0xCD64 
    LD HL,0xdf                 ;0xd1d8:   21 df 00  "!.."  
    CALL C_CA9F                ;0xd1db:   cd 9f ca  "..." 
    LD A,(HL)                  ;0xd1de:   7e  "~" 
    INC HL                     ;0xd1df:   23  "#" 
    OR (HL)                    ;0xd1e0:   b6  "." 
    INC HL                     ;0xd1e1:   23  "#" 
    OR (HL)                    ;0xd1e2:   b6  "." 
    JR z, C_D1C2               ;0xd1e3:   28 dd  "(." 
    CALL C_CD8D                ;0xd1e5:   cd 8d cd  "..." 
    CALL C_D118                ;0xd1e8:   cd 18 d1  "..." 
    LD DE,0x2c                 ;0xd1eb:   11 2c 00  ".,."  
    CALL C_CA98                ;0xd1ee:   cd 98 ca  "..." 
    PUSH DE                    ;0xd1f1:   d5  "." 
    CALL C_D78C                ;0xd1f2:   cd 8c d7  "..." 
    LD BC,0x9f                 ;0xd1f5:   01 9f 00  "..."  
    CALL C_CA90                ;0xd1f8:   cd 90 ca  "..." 
    LD HL,0x12                 ;0xd1fb:   21 12 00  "!.."  
    ADD HL,BC                  ;0xd1fe:   09  "." 
    LD E,(HL)                  ;0xd1ff:   5e  "^" 
    LD HL,9                    ;0xd200:   21 09 00  "!.."  
    ADD HL,BC                  ;0xd203:   09  "." 
    LD A,(HL)                  ;0xd204:   7e  "~" 
    INC A                      ;0xd205:   3c  "<" 
    JR nz, C_D21E              ;0xd206:   20 16  " ." 
    LD A,E                     ;0xd208:   7b  "{" 
    AND 14                     ;0xd209:   e6 0e  ".." 
    JR nz, C_D212              ;0xd20b:   20 05  " ." 
    CALL C_D2B3                ;0xd20d:   cd b3 d2  "..." 
    JR C_D21E                  ;0xd210:   18 0c  ".." 
;--------------------------------------
C_D212:                        ;          XREF: 0xD20B 
    CP 2                       ;0xd212:   fe 02  ".." 
    JR nz, C_D21B              ;0xd214:   20 05  " ." 
    CALL C_D2B7                ;0xd216:   cd b7 d2  "..." 
    JR C_D21E                  ;0xd219:   18 03  ".." 
;--------------------------------------
C_D21B:                        ;          XREF: 0xD214 
    CALL C_D2A8                ;0xd21b:   cd a8 d2  "..." 
;--------------------------------------
C_D21E:                        ;          XREF: 0xD206 
    LD H,B                     ;0xd21e:   60  "`" 
    LD L,C                     ;0xd21f:   69  "i" 
    LD A,E                     ;0xd220:   7b  "{" 
    AND 15                     ;0xd221:   e6 0f  ".." 
    CP 6                       ;0xd223:   fe 06  ".." 
    CALL nz, C_CEA4            ;0xd225:   c4 a4 ce  "..." 
    POP BC                     ;0xd228:   c1  "." 
    LD A,0xff                  ;0xd229:   3e ff  ">."  
    LD (BC),A                  ;0xd22b:   02  "." 
    INC BC                     ;0xd22c:   03  "." 
    CALL C_D2DA                ;0xd22d:   cd da d2  "..." 
;--------------------------------------
C_D230:                        ;          XREF: 0xD1C0 
    SCF                        ;0xd230:   37  "7" 
    SBC A,A                    ;0xd231:   9f  "." 
    RET                        ;0xd232:   c9  "." 
;--------------------------------------
C_D233:                        ;          XREF: 0xD975 
    LD H,(IY+2)                ;0xd233:   fd 66 02  ".f." 
    LD (IY+5),0                ;0xd236:   fd 36 05 00  ".6.."  
    LD DE,8                    ;0xd23a:   11 08 00  "..."  
    CALL C_D243                ;0xd23d:   cd 43 d2  ".C." 
    LD DE,0x2c                 ;0xd240:   11 2c 00  ".,."  
;--------------------------------------
C_D243:                        ;          XREF: 0xD23D 
    CALL C_CA98                ;0xd243:   cd 98 ca  "..." 
    LD A,(DE)                  ;0xd246:   1a  "." 
    CP H                       ;0xd247:   bc  "." 
    RET nz                     ;0xd248:   c0  "." 
    LD A,0xff                  ;0xd249:   3e ff  ">."  
    LD (DE),A                  ;0xd24b:   12  "." 
    INC DE                     ;0xd24c:   13  "." 
    LD A,9                     ;0xd24d:   3e 09  ">."  
    JP C_DBCA                  ;0xd24f:   c3 ca db  "..." 
;--------------------------------------
C_D252:                        ;          XREF: 0xD057 
    PUSH HL                    ;0xd252:   e5  "." 
    PUSH BC                    ;0xd253:   c5  "." 
    PUSH HL                    ;0xd254:   e5  "." 
    LD DE,0x101                ;0xd255:   11 01 01  "..."  
    LD B,0x81                  ;0xd258:   06 81  ".."  
    JR C_D26A                  ;0xd25a:   18 0e  ".." 
;--------------------------------------
C_D25C:                        ;          XREF: 0xD27B 
    EX (SP),HL                 ;0xd25c:   e3  "." 
    RST 0x20                   ;0xd25d:   e7  "." 
    EX (SP),HL                 ;0xd25e:   e3  "." 
    XOR (HL)                   ;0xd25f:   ae  "." 
    XOR (IX+0)                 ;0xd260:   dd ae 00  "..." 
    EX (SP),HL                 ;0xd263:   e3  "." 
    LD (HL),A                  ;0xd264:   77  "w" 
    INC HL                     ;0xd265:   23  "#" 
    EX (SP),HL                 ;0xd266:   e3  "." 
    INC IX                     ;0xd267:   dd 23  ".#" 
    INC HL                     ;0xd269:   23  "#" 
;--------------------------------------
C_D26A:                        ;          XREF: 0xD25A 
    DEC D                      ;0xd26a:   15  "." 
    JR nz, C_D273              ;0xd26b:   20 06  " ." 
    LD D,11                    ;0xd26d:   16 0b  ".."  
    LD IX,D_D281               ;0xd26f:   dd 21 81 d2  ".!.."  
;--------------------------------------
C_D273:                        ;          XREF: 0xD26B 
    DEC E                      ;0xd273:   1d  "." 
    JR nz, C_D27B              ;0xd274:   20 05  " ." 
    LD E,13                    ;0xd276:   1e 0d  ".."  
    LD HL,D_D28C               ;0xd278:   21 8c d2  "!.."  
;--------------------------------------
C_D27B:                        ;          XREF: 0xD274 
    DJNZ C_D25C                ;0xd27b:   10 df  ".." 
    POP HL                     ;0xd27d:   e1  "." 
    POP DE                     ;0xd27e:   d1  "." 
    POP HL                     ;0xd27f:   e1  "." 
    RET                        ;0xd280:   c9  "." 
;--------------------------------------
D_D281:                        ;          XREF: 0xD26F 
    x9 DEFB 0x49               ;0xd281:   "I"
    x9 DEFB 0xb1               ;0xd282:   ('1') + 0x80
    x9 DEFB 0x36               ;0xd283:   "6"
    x9 DEFB 0xf0               ;0xd284:   ('p') + 0x80
    x9 DEFB 0x2e               ;0xd285:   "."
    x9 DEFB 0x1e               ;0xd286:   0x1e
    x9 DEFB 0x6                ;0xd287:   0x6
    x9 DEFB 0x2a               ;0xd288:   "*"
    x9 DEFB 0x28               ;0xd289:   "("
    x9 DEFB 0x19               ;0xd28a:   0x19
    x9 DEFB 0xea               ;0xd28b:   ('j') + 0x80
;--------------------------------------
D_D28C:                        ;          XREF: 0xD278 
    x9 DEFB 0xe2               ;0xd28c:   ('b') + 0x80
    x9 DEFB 0x9d               ;0xd28d:   0x9d
    x9 DEFB 0xdb               ;0xd28e:   ('[') + 0x80
    x9 DEFB 0x1a               ;0xd28f:   0x1a
    x9 DEFB 0x42               ;0xd290:   "B"
    x9 DEFB 0x29               ;0xd291:   ")"
    x9 DEFB 0x39               ;0xd292:   "9"
    x9 DEFB 0xc6               ;0xd293:   ('F') + 0x80
    x9 DEFB 0xb3               ;0xd294:   ('3') + 0x80
    x9 DEFB 0xc6               ;0xd295:   ('F') + 0x80
    x9 DEFB 0x90               ;0xd296:   0x90
    x9 DEFB 0x45               ;0xd297:   "E"
    x9 DEFB 0x8a               ;0xd298:   0x8a
;--------------------------------------
S_d299:                        ;          XREF: 
    x3 DEFB "   $$$BAKBASBIN"  ;0xd299:   0xd299 to 0xd2a8
;--------------------------------------
C_D2A8:                        ;          XREF: 0xCEC9 
    XOR A                      ;0xd2a8:   af  "." 
    JR C_D2B9                  ;0xd2a9:   18 0e  ".." 
;--------------------------------------
C_D2AB:                        ;          XREF: 0xCF46 
    LD A,3                     ;0xd2ab:   3e 03  ">."  
    JR C_D2B9                  ;0xd2ad:   18 0a  ".." 
;--------------------------------------
C_D2AF:                        ;          XREF: 0xD2F2 
    LD A,6                     ;0xd2af:   3e 06  ">."  
    JR C_D2B9                  ;0xd2b1:   18 06  ".." 
;--------------------------------------
C_D2B3:                        ;          XREF: 0xCED1 
    LD A,9                     ;0xd2b3:   3e 09  ">."  
    JR C_D2B9                  ;0xd2b5:   18 02  ".." 
;--------------------------------------
C_D2B7:                        ;          XREF: 0xCED9 
    LD A,12                    ;0xd2b7:   3e 0c  ">."  
;--------------------------------------
C_D2B9:                        ;          XREF: 0xD2A9 
    PUSH DE                    ;0xd2b9:   d5  "." 
    ADD A,0x99                 ;0xd2ba:   c6 99  ".." 
    LD E,A                     ;0xd2bc:   5f  "_" 
    ADC A,0xd2                 ;0xd2bd:   ce d2  ".." 
    SUB E                      ;0xd2bf:   93  "." 
    LD D,A                     ;0xd2c0:   57  "W" 
;--------------------------------------
C_D2C1:                        ;          XREF: 0xD29B 
    JR C_D2CA                  ;0xd2c1:   18 07  ".." 
;--------------------------------------
C_D2C3:                        ;          XREF: 0xD302 
    PUSH DE                    ;0xd2c3:   d5  "." 
    LD DE,0xa8                 ;0xd2c4:   11 a8 00  "..."  
    CALL C_CA98                ;0xd2c7:   cd 98 ca  "..." 
;--------------------------------------
C_D2CA:                        ;          XREF: 0xD2C1 
    PUSH HL                    ;0xd2ca:   e5  "." 
    PUSH BC                    ;0xd2cb:   c5  "." 
    LD HL,9                    ;0xd2cc:   21 09 00  "!.."  
    ADD HL,BC                  ;0xd2cf:   09  "." 
    LD BC,3                    ;0xd2d0:   01 03 00  "..."  
    EX DE,HL                   ;0xd2d3:   eb  "." 
    LDIR                       ;0xd2d4:   ed b0  ".." 
    POP BC                     ;0xd2d6:   c1  "." 
    POP HL                     ;0xd2d7:   e1  "." 
    POP DE                     ;0xd2d8:   d1  "." 
    RET                        ;0xd2d9:   c9  "." 
;--------------------------------------
C_D2DA:                        ;          XREF: 0xD22D 
    LD HL,12                   ;0xd2da:   21 0c 00  "!.."  
    ADD HL,BC                  ;0xd2dd:   09  "." 
    LD (HL),0xff               ;0xd2de:   36 ff  "6."  
    INC HL                     ;0xd2e0:   23  "#" 
    INC HL                     ;0xd2e1:   23  "#" 
    LD (HL),0xff               ;0xd2e2:   36 ff  "6."  
    CALL C_D683                ;0xd2e4:   cd 83 d6  "..." 
    PUSH HL                    ;0xd2e7:   e5  "." 
    LD HL,0                    ;0xd2e8:   21 00 00  "!.."  
;--------------------------------------
C_D2EB:                        ;          XREF: 0xD314 
    EX (SP),HL                 ;0xd2eb:   e3  "." 
    CALL C_D6A2                ;0xd2ec:   cd a2 d6  "..." 
    EX (SP),HL                 ;0xd2ef:   e3  "." 
    JR nc, C_D31A              ;0xd2f0:   30 28  "0(" 
    CALL C_D2AF                ;0xd2f2:   cd af d2  "..." 
    CALL C_D7D8                ;0xd2f5:   cd d8 d7  "..." 
    JR nc, C_D302              ;0xd2f8:   30 08  "0." 
    LD H,1                     ;0xd2fa:   26 01  "&."  
    CALL C_D9D9                ;0xd2fc:   cd d9 d9  "..." 
    JR c, C_D302               ;0xd2ff:   38 01  "8." 
    INC H                      ;0xd301:   24  "$" 
;--------------------------------------
C_D302:                        ;          XREF: 0xD2F8 
    CALL C_D2C3                ;0xd302:   cd c3 d2  "..." 
    CALL C_D7D8                ;0xd305:   cd d8 d7  "..." 
    JR nc, C_D312              ;0xd308:   30 08  "0." 
    LD L,1                     ;0xd30a:   2e 01  ".."  
    CALL C_D9D9                ;0xd30c:   cd d9 d9  "..." 
    JR c, C_D312               ;0xd30f:   38 01  "8." 
    INC L                      ;0xd311:   2c  "," 
;--------------------------------------
C_D312:                        ;          XREF: 0xD308 
    LD A,H                     ;0xd312:   7c  "|" 
    OR A                       ;0xd313:   b7  "." 
    JR z, C_D2EB               ;0xd314:   28 d5  "(." 
    LD A,L                     ;0xd316:   7d  "}" 
    OR A                       ;0xd317:   b7  "." 
    JR z, C_D2EB               ;0xd318:   28 d1  "(." 
;--------------------------------------
C_D31A:                        ;          XREF: 0xD2F0 
    POP AF                     ;0xd31a:   f1  "." 
    LD A,L                     ;0xd31b:   7d  "}" 
    OR A                       ;0xd31c:   b7  "." 
    JR z, C_D362               ;0xd31d:   28 43  "(C" 
    DEC A                      ;0xd31f:   3d  "=" 
    JR z, C_D388               ;0xd320:   28 66  "(f" 
    LD A,H                     ;0xd322:   7c  "|" 
    OR A                       ;0xd323:   b7  "." 
    JR z, C_D362               ;0xd324:   28 3c  "(<" 
    DEC A                      ;0xd326:   3d  "=" 
    JR z, C_D36E               ;0xd327:   28 45  "(E" 
    CALL C_D683                ;0xd329:   cd 83 d6  "..." 
;--------------------------------------
C_D32C:                        ;          XREF: 0xD333 
    CALL C_D6A2                ;0xd32c:   cd a2 d6  "..." 
    RET nc                     ;0xd32f:   d0  "." 
    CALL C_D335                ;0xd330:   cd 35 d3  ".5." 
    JR C_D32C                  ;0xd333:   18 f7  ".." 
;--------------------------------------
C_D335:                        ;          XREF: 0xD330 
    CALL C_D2AF                ;0xd335:   cd af d2  "..." 
    CALL C_D7D8                ;0xd338:   cd d8 d7  "..." 
    JP c, C_D4AA               ;0xd33b:   da aa d4  "..." 
;--------------------------------------
C_D33E:                        ;          XREF: 0xD369 
    CALL C_D351                ;0xd33e:   cd 51 d3  ".Q." 
    RET c                      ;0xd341:   d8  "." 
    CALL C_D2C3                ;0xd342:   cd c3 d2  "..." 
    CALL C_D7D8                ;0xd345:   cd d8 d7  "..." 
    RET nc                     ;0xd348:   d0  "." 
    PUSH BC                    ;0xd349:   c5  "." 
    LD B,D                     ;0xd34a:   42  "B" 
    LD C,E                     ;0xd34b:   4b  "K" 
    CALL C_D2AF                ;0xd34c:   cd af d2  "..." 
    JR C_D35E                  ;0xd34f:   18 0d  ".." 
;--------------------------------------
C_D351:                        ;          XREF: 0xD33E 
    CALL C_D2AB                ;0xd351:   cd ab d2  "..." 
    CALL C_D7D8                ;0xd354:   cd d8 d7  "..." 
    RET nc                     ;0xd357:   d0  "." 
    PUSH BC                    ;0xd358:   c5  "." 
    LD B,D                     ;0xd359:   42  "B" 
    LD C,E                     ;0xd35a:   4b  "K" 
    CALL C_D2C3                ;0xd35b:   cd c3 d2  "..." 
;--------------------------------------
C_D35E:                        ;          XREF: 0xD34F 
    POP BC                     ;0xd35e:   c1  "." 
    JP C_D97A                  ;0xd35f:   c3 7a d9  ".z." 
;--------------------------------------
C_D362:                        ;          XREF: 0xD31D 
    CALL C_D683                ;0xd362:   cd 83 d6  "..." 
;--------------------------------------
C_D365:                        ;          XREF: 0xD36C 
    CALL C_D6A2                ;0xd365:   cd a2 d6  "..." 
    RET nc                     ;0xd368:   d0  "." 
    CALL C_D33E                ;0xd369:   cd 3e d3  ".>." 
    JR C_D365                  ;0xd36c:   18 f7  ".." 
;--------------------------------------
C_D36E:                        ;          XREF: 0xD327 
    CALL C_D683                ;0xd36e:   cd 83 d6  "..." 
;--------------------------------------
C_D371:                        ;          XREF: 0xD378 
    CALL C_D6A2                ;0xd371:   cd a2 d6  "..." 
    RET nc                     ;0xd374:   d0  "." 
    CALL C_D37A                ;0xd375:   cd 7a d3  ".z." 
    JR C_D371                  ;0xd378:   18 f7  ".." 
;--------------------------------------
C_D37A:                        ;          XREF: 0xD375 
    CALL C_D351                ;0xd37a:   cd 51 d3  ".Q." 
    RET c                      ;0xd37d:   d8  "." 
    CALL C_D2C3                ;0xd37e:   cd c3 d2  "..." 
    CALL C_D7D8                ;0xd381:   cd d8 d7  "..." 
    JP c, C_D4AA               ;0xd384:   da aa d4  "..." 
    RET                        ;0xd387:   c9  "." 
;--------------------------------------
C_D388:                        ;          XREF: 0xD320 
    CALL C_D2C3                ;0xd388:   cd c3 d2  "..." 
    LD D,B                     ;0xd38b:   50  "P" 
    LD E,C                     ;0xd38c:   59  "Y" 
;--------------------------------------
C_D38D:                        ;          XREF: 0xD4F4 
    LD A,10                    ;0xd38d:   3e 0a  ">."  
    JP C_CDB1                  ;0xd38f:   c3 b1 cd  "..." 
;--------------------------------------
C_D392:                        ;          XREF: 0xCEFE 
    PUSH HL                    ;0xd392:   e5  "." 
    PUSH DE                    ;0xd393:   d5  "." 
    PUSH BC                    ;0xd394:   c5  "." 
    PUSH HL                    ;0xd395:   e5  "." 
    LD DE,8                    ;0xd396:   11 08 00  "..."  
    CALL C_CA98                ;0xd399:   cd 98 ca  "..." 
    CALL C_D410                ;0xd39c:   cd 10 d4  "..." 
    JR nc, C_D3A9              ;0xd39f:   30 08  "0." 
    EX DE,HL                   ;0xd3a1:   eb  "." 
    EX (SP),HL                 ;0xd3a2:   e3  "." 
    CALL C_D9E8                ;0xd3a3:   cd e8 d9  "..." 
    POP DE                     ;0xd3a6:   d1  "." 
    JR C_D3F1                  ;0xd3a7:   18 48  ".H" 
;--------------------------------------
C_D3A9:                        ;          XREF: 0xD39F 
    POP HL                     ;0xd3a9:   e1  "." 
    POP BC                     ;0xd3aa:   c1  "." 
    POP DE                     ;0xd3ab:   d1  "." 
    POP HL                     ;0xd3ac:   e1  "." 
    OR A                       ;0xd3ad:   b7  "." 
    RET                        ;0xd3ae:   c9  "." 
;--------------------------------------
C_D3AF:                        ;          XREF: 0xD1A8 
    PUSH HL                    ;0xd3af:   e5  "." 
    PUSH DE                    ;0xd3b0:   d5  "." 
    PUSH BC                    ;0xd3b1:   c5  "." 
    PUSH HL                    ;0xd3b2:   e5  "." 
    LD DE,0x2c                 ;0xd3b3:   11 2c 00  ".,."  
    CALL C_CA98                ;0xd3b6:   cd 98 ca  "..." 
    CALL C_D6C8                ;0xd3b9:   cd c8 d6  "..." 
    JR c, C_D3C9               ;0xd3bc:   38 0b  "8." 
    LD A,8                     ;0xd3be:   3e 08  ">."  
    JP nz, C_CDB1              ;0xd3c0:   c2 b1 cd  "..." 
    CALL C_D78C                ;0xd3c3:   cd 8c d7  "..." 
    CALL C_D6FA                ;0xd3c6:   cd fa d6  "..." 
;--------------------------------------
C_D3C9:                        ;          XREF: 0xD3BC 
    CALL C_D72F                ;0xd3c9:   cd 2f d7  "./." 
    LD C,0                     ;0xd3cc:   0e 00  ".."  
    JR c, C_D3E8               ;0xd3ce:   38 18  "8." 
    PUSH DE                    ;0xd3d0:   d5  "." 
    EX DE,HL                   ;0xd3d1:   eb  "." 
    CALL C_D893                ;0xd3d2:   cd 93 d8  "..." 
    EX DE,HL                   ;0xd3d5:   eb  "." 
    LD A,8                     ;0xd3d6:   3e 08  ">."  
    JP nc, C_CDB1              ;0xd3d8:   d2 b1 cd  "..." 
    LD (HL),E                  ;0xd3db:   73  "s" 
    LD A,B                     ;0xd3dc:   78  "x" 
    OR A                       ;0xd3dd:   b7  "." 
    JR z, C_D3E2               ;0xd3de:   28 02  "(." 
    INC HL                     ;0xd3e0:   23  "#" 
    LD (HL),D                  ;0xd3e1:   72  "r" 
;--------------------------------------
C_D3E2:                        ;          XREF: 0xD3DE 
    POP DE                     ;0xd3e2:   d1  "." 
    CALL C_D72F                ;0xd3e3:   cd 2f d7  "./." 
    LD C,2                     ;0xd3e6:   0e 02  ".."  
;--------------------------------------
C_D3E8:                        ;          XREF: 0xD3CE 
    EX DE,HL                   ;0xd3e8:   eb  "." 
    EX (SP),HL                 ;0xd3e9:   e3  "." 
    CALL C_D9F3                ;0xd3ea:   cd f3 d9  "..." 
    POP DE                     ;0xd3ed:   d1  "." 
    CALL C_D77D                ;0xd3ee:   cd 7d d7  ".}." 
;--------------------------------------
C_D3F1:                        ;          XREF: 0xD3A7 
    CALL C_D7A7                ;0xd3f1:   cd a7 d7  "..." 
    POP BC                     ;0xd3f4:   c1  "." 
    POP DE                     ;0xd3f5:   d1  "." 
    POP HL                     ;0xd3f6:   e1  "." 
    SCF                        ;0xd3f7:   37  "7" 
    RET                        ;0xd3f8:   c9  "." 
;--------------------------------------
C_D3F9:                        ;          XREF: 0xCEAC 
    PUSH HL                    ;0xd3f9:   e5  "." 
    LD DE,0x2c                 ;0xd3fa:   11 2c 00  ".,."  
    CALL C_CA98                ;0xd3fd:   cd 98 ca  "..." 
    CALL C_D79C                ;0xd400:   cd 9c d7  "..." 
    CALL C_D410                ;0xd403:   cd 10 d4  "..." 
    EX DE,HL                   ;0xd406:   eb  "." 
    POP HL                     ;0xd407:   e1  "." 
    LD C,0                     ;0xd408:   0e 00  ".."  
    JP c, C_D9F3               ;0xd40a:   da f3 d9  "..." 
    JP C_CDAF                  ;0xd40d:   c3 af cd  "..." 
;--------------------------------------
C_D410:                        ;          XREF: 0xD39C 
    CALL C_D6C8                ;0xd410:   cd c8 d6  "..." 
    JR c, C_D427               ;0xd413:   38 12  "8." 
    RET nz                     ;0xd415:   c0  "." 
    CALL C_D6FA                ;0xd416:   cd fa d6  "..." 
    PUSH DE                    ;0xd419:   d5  "." 
    LD B,D                     ;0xd41a:   42  "B" 
    LD C,E                     ;0xd41b:   4b  "K" 
    INC BC                     ;0xd41c:   03  "." 
    PUSH BC                    ;0xd41d:   c5  "." 
    CALL C_D7B3                ;0xd41e:   cd b3 d7  "..." 
    EX DE,HL                   ;0xd421:   eb  "." 
    POP DE                     ;0xd422:   d1  "." 
    CALL c, C_DBDF             ;0xd423:   dc df db  "..." 
    POP DE                     ;0xd426:   d1  "." 
;--------------------------------------
C_D427:                        ;          XREF: 0xD413 
    CALL c, C_D70C             ;0xd427:   dc 0c d7  "..." 
    JP c, C_D72F               ;0xd42a:   da 2f d7  "./." 
    RET                        ;0xd42d:   c9  "." 
;--------------------------------------
BAR_DIR:                       ;          XREF: 0xC02A 
    CALL C_CD73                ;0xd42e:   cd 73 cd  ".s." 
    LD B,0                     ;0xd431:   06 00  ".."  
    OR A                       ;0xd433:   b7  "." 
    JR z, C_D43C               ;0xd434:   28 06  "(." 
    CALL C_CDC2                ;0xd436:   cd c2 cd  "..." 
    CALL C_CDC7                ;0xd439:   cd c7 cd  "..." 
;--------------------------------------
C_D43C:                        ;          XREF: 0xD434 
    CALL C_DAA6                ;0xd43c:   cd a6 da  "..." 
    CALL C_CE14                ;0xd43f:   cd 14 ce  "..." 
    CALL C_DBD0                ;0xd442:   cd d0 db  "..." 
    LD A,12                    ;0xd445:   3e 0c  ">."  
    CALL C_D472                ;0xd447:   cd 72 d4  ".r." 
    LD H,L                     ;0xd44a:   65  "e" 
    PUSH HL                    ;0xd44b:   e5  "." 
    CALL C_D683                ;0xd44c:   cd 83 d6  "..." 
;--------------------------------------
C_D44F:                        ;          XREF: 0xD457 
    CALL C_D698                ;0xd44f:   cd 98 d6  "..." 
    JR nc, C_D46E              ;0xd452:   30 1a  "0." 
    CALL C_D9DF                ;0xd454:   cd df d9  "..." 
    JR c, C_D44F               ;0xd457:   38 f6  "8." 
    EX (SP),HL                 ;0xd459:   e3  "." 
    PUSH BC                    ;0xd45a:   c5  "." 
    LD A,H                     ;0xd45b:   7c  "|" 
    CP L                       ;0xd45c:   bd  "." 
    CALL nz, C_DBC4            ;0xd45d:   c4 c4 db  "..." 
    CALL z, C_CAE9             ;0xd460:   cc e9 ca  "..." 
    CALL C_DBC8                ;0xd463:   cd c8 db  "..." 
    DEC L                      ;0xd466:   2d  "-" 
    JR nz, C_D46A              ;0xd467:   20 01  " ." 
    LD L,H                     ;0xd469:   6c  "l" 
;--------------------------------------
C_D46A:                        ;          XREF: 0xD467 
    POP BC                     ;0xd46a:   c1  "." 
    EX (SP),HL                 ;0xd46b:   e3  "." 
    JR C_D44F                  ;0xd46c:   18 e1  ".." 
;--------------------------------------
C_D46E:                        ;          XREF: 0xD452 
    POP HL                     ;0xd46e:   e1  "." 
    JP C_D571                  ;0xd46f:   c3 71 d5  ".q." 
;--------------------------------------
C_D472:                        ;          XREF: 0xD447 
    ADD A,3                    ;0xd472:   c6 03  ".." 
    LD H,A                     ;0xd474:   67  "g" 
    PUSH DE                    ;0xd475:   d5  "." 
    PUSH HL                    ;0xd476:   e5  "." 
    CALL TXT_GET_WINDOW        ;0xd477:   cd 69 bb  ".i." 
    LD A,D                     ;0xd47a:   7a  "z" 
    POP HL                     ;0xd47b:   e1  "." 
    POP DE                     ;0xd47c:   d1  "." 
    ADD A,4                    ;0xd47d:   c6 04  ".." 
    LD L,0                     ;0xd47f:   2e 00  ".."  
;--------------------------------------
C_D481:                        ;          XREF: 0xD483 
    INC L                      ;0xd481:   2c  "," 
    SUB H                      ;0xd482:   94  "." 
    JR nc, C_D481              ;0xd483:   30 fc  "0." 
    DEC L                      ;0xd485:   2d  "-" 
    RET nz                     ;0xd486:   c0  "." 
    LD L,1                     ;0xd487:   2e 01  ".."  
    RET                        ;0xd489:   c9  "." 
;--------------------------------------
BAR_ERA:                       ;          XREF: 0xC02D 
    CALL C_CD73                ;0xd48a:   cd 73 cd  ".s." 
    CALL C_CDC2                ;0xd48d:   cd c2 cd  "..." 
    CALL C_CDC7                ;0xd490:   cd c7 cd  "..." 
    CALL C_DA8D                ;0xd493:   cd 8d da  "..." 
    CALL C_CE14                ;0xd496:   cd 14 ce  "..." 
    CALL C_D683                ;0xd499:   cd 83 d6  "..." 
    CALL C_D698                ;0xd49c:   cd 98 d6  "..." 
    JR nc, C_D50C              ;0xd49f:   30 6b  "0k" 
;--------------------------------------
C_D4A1:                        ;          XREF: 0xD4A7 
    CALL C_D4B1                ;0xd4a1:   cd b1 d4  "..." 
    CALL C_D698                ;0xd4a4:   cd 98 d6  "..." 
    JR c, C_D4A1               ;0xd4a7:   38 f8  "8." 
    RET                        ;0xd4a9:   c9  "." 
;--------------------------------------
C_D4AA:                        ;          XREF: 0xD33B 
    CALL C_D4B1                ;0xd4aa:   cd b1 d4  "..." 
    JP nc, C_CDB8              ;0xd4ad:   d2 b8 cd  "..." 
    RET                        ;0xd4b0:   c9  "." 
;--------------------------------------
C_D4B1:                        ;          XREF: 0xD4A1 
    CALL C_D9D9                ;0xd4b1:   cd d9 d9  "..." 
    CCF                        ;0xd4b4:   3f  "?" 
    LD A,10                    ;0xd4b5:   3e 0a  ">."  
    JP nc, C_DBCA              ;0xd4b7:   d2 ca db  "..." 
    XOR A                      ;0xd4ba:   af  "." 
    CALL C_D83C                ;0xd4bb:   cd 3c d8  ".<." 
    LD A,0xe5                  ;0xd4be:   3e e5  ">."  
    LD (DE),A                  ;0xd4c0:   12  "." 
    JP C_D97A                  ;0xd4c1:   c3 7a d9  ".z." 
;--------------------------------------
BAR_REN:                       ;          XREF: 0xC030 
    CALL C_CD73                ;0xd4c4:   cd 73 cd  ".s." 
    CALL C_CDC1                ;0xd4c7:   cd c1 cd  "..." 
    CALL C_CDC7                ;0xd4ca:   cd c7 cd  "..." 
    CALL C_DA5B                ;0xd4cd:   cd 5b da  ".[." 
    PUSH BC                    ;0xd4d0:   c5  "." 
    CALL C_CDC7                ;0xd4d1:   cd c7 cd  "..." 
    CALL C_DA60                ;0xd4d4:   cd 60 da  ".`." 
    POP HL                     ;0xd4d7:   e1  "." 
    LD A,(BC)                  ;0xd4d8:   0a  "." 
    CP (HL)                    ;0xd4d9:   be  "." 
    JP nz, C_CDAF              ;0xd4da:   c2 af cd  "..." 
    CALL C_CE14                ;0xd4dd:   cd 14 ce  "..." 
    INC HL                     ;0xd4e0:   23  "#" 
    PUSH HL                    ;0xd4e1:   e5  "." 
    CALL C_D644                ;0xd4e2:   cd 44 d6  ".D." 
    POP HL                     ;0xd4e5:   e1  "." 
    PUSH BC                    ;0xd4e6:   c5  "." 
    LD B,H                     ;0xd4e7:   44  "D" 
    LD C,L                     ;0xd4e8:   4d  "M" 
    CALL C_D683                ;0xd4e9:   cd 83 d6  "..." 
    CALL C_D698                ;0xd4ec:   cd 98 d6  "..." 
    JR nc, C_D50C              ;0xd4ef:   30 1b  "0." 
;--------------------------------------
C_D4F1:                        ;          XREF: 0xD508 
    CALL C_D9D9                ;0xd4f1:   cd d9 d9  "..." 
    JP c, C_D38D               ;0xd4f4:   da 8d d3  "..." 
    EX (SP),HL                 ;0xd4f7:   e3  "." 
    PUSH HL                    ;0xd4f8:   e5  "." 
    PUSH BC                    ;0xd4f9:   c5  "." 
    LD BC,12                   ;0xd4fa:   01 0c 00  "..."  
    LDIR                       ;0xd4fd:   ed b0  ".." 
    POP BC                     ;0xd4ff:   c1  "." 
    POP HL                     ;0xd500:   e1  "." 
    EX (SP),HL                 ;0xd501:   e3  "." 
    CALL C_D97A                ;0xd502:   cd 7a d9  ".z." 
    CALL C_D698                ;0xd505:   cd 98 d6  "..." 
    JR c, C_D4F1               ;0xd508:   38 e7  "8." 
    POP HL                     ;0xd50a:   e1  "." 
    RET                        ;0xd50b:   c9  "." 
;--------------------------------------
C_D50C:                        ;          XREF: 0xCEC4 
    LD D,B                     ;0xd50c:   50  "P" 
    LD E,C                     ;0xd50d:   59  "Y" 
    LD A,6                     ;0xd50e:   3e 06  ">."  
    JP C_CDB1                  ;0xd510:   c3 b1 cd  "..." 
;--------------------------------------
C_D513:                        ;          XREF: 0xCD70 
    CALL C_CD73                ;0xd513:   cd 73 cd  ".s." 
    PUSH DE                    ;0xd516:   d5  "." 
    POP IX                     ;0xd517:   dd e1  ".." 
    LD BC,0x800                ;0xd519:   01 00 08  "..."  
    CALL C_CAAF                ;0xd51c:   cd af ca  "..." 
    CALL C_DA86                ;0xd51f:   cd 86 da  "..." 
    CALL C_CE14                ;0xd522:   cd 14 ce  "..." 
    CALL C_DBD0                ;0xd525:   cd d0 db  "..." 
    XOR A                      ;0xd528:   af  "." 
    PUSH AF                    ;0xd529:   f5  "." 
    CALL C_D683                ;0xd52a:   cd 83 d6  "..." 
;--------------------------------------
C_D52D:                        ;          XREF: 0xD535 
    CALL C_D698                ;0xd52d:   cd 98 d6  "..." 
    JR nc, C_D53E              ;0xd530:   30 0c  "0." 
    CALL C_D9DF                ;0xd532:   cd df d9  "..." 
    JR c, C_D52D               ;0xd535:   38 f6  "8." 
    EX (SP),HL                 ;0xd537:   e3  "." 
    CALL C_D5AA                ;0xd538:   cd aa d5  "..." 
    EX (SP),HL                 ;0xd53b:   e3  "." 
    JR c, C_D52D               ;0xd53c:   38 ef  "8." 
;--------------------------------------
C_D53E:                        ;          XREF: 0xD530 
    LD A,0x11                  ;0xd53e:   3e 11  ">."  
    CALL C_D472                ;0xd540:   cd 72 d4  ".r." 
    LD D,L                     ;0xd543:   55  "U" 
    POP AF                     ;0xd544:   f1  "." 
    LD E,0                     ;0xd545:   1e 00  ".."  
;--------------------------------------
C_D547:                        ;          XREF: 0xD549 
    INC E                      ;0xd547:   1c  "." 
    SUB D                      ;0xd548:   92  "." 
    JR nc, C_D547              ;0xd549:   30 fc  "0." 
    ADD A,D                    ;0xd54b:   82  "." 
    JR nz, C_D54F              ;0xd54c:   20 01  " ." 
    DEC E                      ;0xd54e:   1d  "." 
;--------------------------------------
C_D54F:                        ;          XREF: 0xD54C 
    PUSH IX                    ;0xd54f:   dd e5  ".." 
    POP HL                     ;0xd551:   e1  "." 
    LD C,E                     ;0xd552:   4b  "K" 
;--------------------------------------
C_D553:                        ;          XREF: 0xD56F 
    LD B,D                     ;0xd553:   42  "B" 
    PUSH HL                    ;0xd554:   e5  "." 
;--------------------------------------
C_D555:                        ;          XREF: 0xD561 
    CALL C_D57A                ;0xd555:   cd 7a d5  ".z." 
    PUSH DE                    ;0xd558:   d5  "." 
    EX DE,HL                   ;0xd559:   eb  "." 
    LD H,0                     ;0xd55a:   26 00  "&."  
    CALL C_D63A                ;0xd55c:   cd 3a d6  ".:." 
    ADD HL,DE                  ;0xd55f:   19  "." 
    POP DE                     ;0xd560:   d1  "." 
    DJNZ C_D555                ;0xd561:   10 f2  ".." 
    POP HL                     ;0xd563:   e1  "." 
    PUSH DE                    ;0xd564:   d5  "." 
    LD DE,14                   ;0xd565:   11 0e 00  "..."  
    ADD HL,DE                  ;0xd568:   19  "." 
    POP DE                     ;0xd569:   d1  "." 
    DEC C                      ;0xd56a:   0d  "." 
    JR z, C_D571               ;0xd56b:   28 04  "(." 
    LD A,(HL)                  ;0xd56d:   7e  "~" 
    OR A                       ;0xd56e:   b7  "." 
    JR nz, C_D553              ;0xd56f:   20 e2  " ." 
;--------------------------------------
C_D571:                        ;          XREF: 0xD46F 
    CALL C_D8C2                ;0xd571:   cd c2 d8  "..." 
    LD A,3                     ;0xd574:   3e 03  ">."  
    OR A                       ;0xd576:   b7  "." 
    JP C_CAEB                  ;0xd577:   c3 eb ca  "..." 
;--------------------------------------
C_D57A:                        ;          XREF: 0xD555 
    RST 0x20                   ;0xd57a:   e7  "." 
    OR A                       ;0xd57b:   b7  "." 
    RET z                      ;0xd57c:   c8  "." 
    PUSH HL                    ;0xd57d:   e5  "." 
    PUSH DE                    ;0xd57e:   d5  "." 
    PUSH BC                    ;0xd57f:   c5  "." 
    LD A,B                     ;0xd580:   78  "x" 
    CP D                       ;0xd581:   ba  "." 
    CALL nz, C_DBC4            ;0xd582:   c4 c4 db  "..." 
    CALL z, C_CAE9             ;0xd585:   cc e9 ca  "..." 
    EX DE,HL                   ;0xd588:   eb  "." 
    CALL C_DBC8                ;0xd589:   cd c8 db  "..." 
    CALL C_D9D9                ;0xd58c:   cd d9 d9  "..." 
    LD A,0x2a                  ;0xd58f:   3e 2a  ">*"  
    JR c, C_D595               ;0xd591:   38 02  "8." 
    LD A,0x20                  ;0xd593:   3e 20  "> "  
;--------------------------------------
C_D595:                        ;          XREF: 0xD591 
    CALL TXT_OUTPUT            ;0xd595:   cd 5a bb  ".Z." 
    LD HL,12                   ;0xd598:   21 0c 00  "!.."  
    ADD HL,DE                  ;0xd59b:   19  "." 
    RST 0x20                   ;0xd59c:   e7  "." 
    LD E,A                     ;0xd59d:   5f  "_" 
    INC HL                     ;0xd59e:   23  "#" 
    RST 0x20                   ;0xd59f:   e7  "." 
    LD D,A                     ;0xd5a0:   57  "W" 
    LD A,2                     ;0xd5a1:   3e 02  ">."  
    CALL C_CAEB                ;0xd5a3:   cd eb ca  "..." 
    POP BC                     ;0xd5a6:   c1  "." 
    POP DE                     ;0xd5a7:   d1  "." 
    POP HL                     ;0xd5a8:   e1  "." 
    RET                        ;0xd5a9:   c9  "." 
;--------------------------------------
C_D5AA:                        ;          XREF: 0xD538 
    PUSH BC                    ;0xd5aa:   c5  "." 
    LD C,H                     ;0xd5ab:   4c  "L" 
    LD B,0                     ;0xd5ac:   06 00  ".."  
    PUSH IX                    ;0xd5ae:   dd e5  ".." 
    POP HL                     ;0xd5b0:   e1  "." 
;--------------------------------------
C_D5B1:                        ;          XREF: 0xD5C6 
    RST 0x20                   ;0xd5b1:   e7  "." 
    OR A                       ;0xd5b2:   b7  "." 
    JR z, C_D605               ;0xd5b3:   28 50  "(P" 
    INC B                      ;0xd5b5:   04  "." 
    CALL C_D623                ;0xd5b6:   cd 23 d6  ".#." 
    JR z, C_D5CA               ;0xd5b9:   28 0f  "(." 
    JR nc, C_D5E3              ;0xd5bb:   30 26  "0&" 
    PUSH DE                    ;0xd5bd:   d5  "." 
    LD DE,14                   ;0xd5be:   11 0e 00  "..."  
    ADD HL,DE                  ;0xd5c1:   19  "." 
    POP DE                     ;0xd5c2:   d1  "." 
    LD A,B                     ;0xd5c3:   78  "x" 
    CP 0x92                    ;0xd5c4:   fe 92  ".." 
    JR c, C_D5B1               ;0xd5c6:   38 e9  "8." 
    JR C_D620                  ;0xd5c8:   18 56  ".V" 
;--------------------------------------
C_D5CA:                        ;          XREF: 0xD5B9 
    PUSH HL                    ;0xd5ca:   e5  "." 
    CALL C_D8F2                ;0xd5cb:   cd f2 d8  "..." 
    EX (SP),HL                 ;0xd5ce:   e3  "." 
    LD DE,12                   ;0xd5cf:   11 0c 00  "..."  
    ADD HL,DE                  ;0xd5d2:   19  "." 
    RST 0x20                   ;0xd5d3:   e7  "." 
    LD E,A                     ;0xd5d4:   5f  "_" 
    INC HL                     ;0xd5d5:   23  "#" 
    RST 0x20                   ;0xd5d6:   e7  "." 
    LD D,A                     ;0xd5d7:   57  "W" 
    DEC HL                     ;0xd5d8:   2b  "+" 
    EX (SP),HL                 ;0xd5d9:   e3  "." 
    ADD HL,DE                  ;0xd5da:   19  "." 
    EX DE,HL                   ;0xd5db:   eb  "." 
    POP HL                     ;0xd5dc:   e1  "." 
    LD (HL),E                  ;0xd5dd:   73  "s" 
    INC HL                     ;0xd5de:   23  "#" 
    LD (HL),D                  ;0xd5df:   72  "r" 
    SCF                        ;0xd5e0:   37  "7" 
    JR C_D620                  ;0xd5e1:   18 3d  ".=" 
;--------------------------------------
C_D5E3:                        ;          XREF: 0xD5BB 
    LD A,C                     ;0xd5e3:   79  "y" 
    CP 0x92                    ;0xd5e4:   fe 92  ".." 
    JR z, C_D620               ;0xd5e6:   28 38  "(8" 
    PUSH HL                    ;0xd5e8:   e5  "." 
    PUSH DE                    ;0xd5e9:   d5  "." 
    PUSH BC                    ;0xd5ea:   c5  "." 
    EX DE,HL                   ;0xd5eb:   eb  "." 
    LD A,C                     ;0xd5ec:   79  "y" 
    SUB B                      ;0xd5ed:   90  "." 
    INC A                      ;0xd5ee:   3c  "<" 
    LD L,A                     ;0xd5ef:   6f  "o" 
    LD H,0                     ;0xd5f0:   26 00  "&."  
    CALL C_D63A                ;0xd5f2:   cd 3a d6  ".:." 
    LD B,H                     ;0xd5f5:   44  "D" 
    LD C,L                     ;0xd5f6:   4d  "M" 
    ADD HL,DE                  ;0xd5f7:   19  "." 
    DEC HL                     ;0xd5f8:   2b  "+" 
    EX DE,HL                   ;0xd5f9:   eb  "." 
    LD HL,14                   ;0xd5fa:   21 0e 00  "!.."  
    ADD HL,DE                  ;0xd5fd:   19  "." 
    EX DE,HL                   ;0xd5fe:   eb  "." 
    CALL 0xb91e                ;0xd5ff:   cd 1e b9  "..." 
    POP BC                     ;0xd602:   c1  "." 
    POP DE                     ;0xd603:   d1  "." 
    POP HL                     ;0xd604:   e1  "." 
;--------------------------------------
C_D605:                        ;          XREF: 0xD5B3 
    INC C                      ;0xd605:   0c  "." 
    PUSH BC                    ;0xd606:   c5  "." 
    PUSH DE                    ;0xd607:   d5  "." 
    LD (HL),0xff               ;0xd608:   36 ff  "6."  
    INC HL                     ;0xd60a:   23  "#" 
    INC DE                     ;0xd60b:   13  "." 
    EX DE,HL                   ;0xd60c:   eb  "." 
    LD BC,11                   ;0xd60d:   01 0b 00  "..."  
    CALL KL_LDIR               ;0xd610:   cd 1b b9  "..." 
    EX DE,HL                   ;0xd613:   eb  "." 
    EX (SP),HL                 ;0xd614:   e3  "." 
    EX DE,HL                   ;0xd615:   eb  "." 
    CALL C_D8F2                ;0xd616:   cd f2 d8  "..." 
    EX DE,HL                   ;0xd619:   eb  "." 
    POP HL                     ;0xd61a:   e1  "." 
    LD (HL),E                  ;0xd61b:   73  "s" 
    INC HL                     ;0xd61c:   23  "#" 
    LD (HL),D                  ;0xd61d:   72  "r" 
    POP BC                     ;0xd61e:   c1  "." 
    SCF                        ;0xd61f:   37  "7" 
;--------------------------------------
C_D620:                        ;          XREF: 0xD5C8 
    LD H,C                     ;0xd620:   61  "a" 
    POP BC                     ;0xd621:   c1  "." 
    RET                        ;0xd622:   c9  "." 
;--------------------------------------
C_D623:                        ;          XREF: 0xD5B6 
    PUSH HL                    ;0xd623:   e5  "." 
    PUSH DE                    ;0xd624:   d5  "." 
    PUSH BC                    ;0xd625:   c5  "." 
    LD B,11                    ;0xd626:   06 0b  ".."  
;--------------------------------------
C_D628:                        ;          XREF: 0xD634 
    INC DE                     ;0xd628:   13  "." 
    INC HL                     ;0xd629:   23  "#" 
    LD A,(DE)                  ;0xd62a:   1a  "." 
    AND 0x7f                   ;0xd62b:   e6 7f  ".." 
    LD C,A                     ;0xd62d:   4f  "O" 
    RST 0x20                   ;0xd62e:   e7  "." 
    AND 0x7f                   ;0xd62f:   e6 7f  ".." 
    CP C                       ;0xd631:   b9  "." 
    JR nz, C_D636              ;0xd632:   20 02  " ." 
    DJNZ C_D628                ;0xd634:   10 f2  ".." 
;--------------------------------------
C_D636:                        ;          XREF: 0xD632 
    POP BC                     ;0xd636:   c1  "." 
    POP DE                     ;0xd637:   d1  "." 
    POP HL                     ;0xd638:   e1  "." 
    RET                        ;0xd639:   c9  "." 
;--------------------------------------
C_D63A:                        ;          XREF: 0xD55C 
    PUSH DE                    ;0xd63a:   d5  "." 
    LD D,H                     ;0xd63b:   54  "T" 
    LD E,L                     ;0xd63c:   5d  "]" 
    ADD HL,HL                  ;0xd63d:   29  ")" 
    ADD HL,DE                  ;0xd63e:   19  "." 
    ADD HL,HL                  ;0xd63f:   29  ")" 
    ADD HL,DE                  ;0xd640:   19  "." 
    ADD HL,HL                  ;0xd641:   29  ")" 
    POP DE                     ;0xd642:   d1  "." 
    RET                        ;0xd643:   c9  "." 
;--------------------------------------
C_D644:                        ;          XREF: 0xD4E2 
    CALL C_D683                ;0xd644:   cd 83 d6  "..." 
    CALL C_D698                ;0xd647:   cd 98 d6  "..." 
    JR nc, C_D671              ;0xd64a:   30 25  "0%" 
    LD A,5                     ;0xd64c:   3e 05  ">."  
    JP C_CDB1                  ;0xd64e:   c3 b1 cd  "..." 
;--------------------------------------
C_D651:                        ;          XREF: 0xCEC1 
    CALL C_D683                ;0xd651:   cd 83 d6  "..." 
    CALL C_D698                ;0xd654:   cd 98 d6  "..." 
    JR nc, C_D671              ;0xd657:   30 18  "0." 
    PUSH HL                    ;0xd659:   e5  "." 
    LD HL,9                    ;0xd65a:   21 09 00  "!.."  
    CALL C_CA9F                ;0xd65d:   cd 9f ca  "..." 
    EX DE,HL                   ;0xd660:   eb  "." 
    CALL C_DBDF                ;0xd661:   cd df db  "..." 
    POP HL                     ;0xd664:   e1  "." 
    LD A,(IY+5)                ;0xd665:   fd 7e 05  ".~." 
    OR A                       ;0xd668:   b7  "." 
    SCF                        ;0xd669:   37  "7" 
    RET nz                     ;0xd66a:   c0  "." 
;--------------------------------------
C_D66B:                        ;          XREF: 0xD66E 
    CALL C_D6A2                ;0xd66b:   cd a2 d6  "..." 
    JR c, C_D66B               ;0xd66e:   38 fb  "8." 
    SCF                        ;0xd670:   37  "7" 
;--------------------------------------
C_D671:                        ;          XREF: 0xD64A 
    LD (IY+5),0xff             ;0xd671:   fd 36 05 ff  ".6.."  
    RET                        ;0xd675:   c9  "." 
;--------------------------------------
C_D676:                        ;          XREF: 0xCF49 
    CALL C_D683                ;0xd676:   cd 83 d6  "..." 
;--------------------------------------
C_D679:                        ;          XREF: 0xD681 
    CALL C_D698                ;0xd679:   cd 98 d6  "..." 
    JR nc, C_D671              ;0xd67c:   30 f3  "0." 
    CALL C_D4AA                ;0xd67e:   cd aa d4  "..." 
    JR C_D679                  ;0xd681:   18 f6  ".." 
;--------------------------------------
C_D683:                        ;          XREF: 0xD2E4 
    PUSH BC                    ;0xd683:   c5  "." 
    CALL C_C51F                ;0xd684:   cd 1f c5  "..." 
    POP BC                     ;0xd687:   c1  "." 
    LD HL,D_FFFF               ;0xd688:   21 ff ff  "!.."  
    LD A,(IY+5)                ;0xd68b:   fd 7e 05  ".~." 
    OR A                       ;0xd68e:   b7  "." 
    RET nz                     ;0xd68f:   c0  "." 
    PUSH HL                    ;0xd690:   e5  "." 
    CALL C_D814                ;0xd691:   cd 14 d8  "..." 
    POP HL                     ;0xd694:   e1  "." 
    JP C_D9A8                  ;0xd695:   c3 a8 d9  "..." 
;--------------------------------------
C_D698:                        ;          XREF: 0xD44F 
    CALL C_D6A2                ;0xd698:   cd a2 d6  "..." 
    RET nc                     ;0xd69b:   d0  "." 
    CALL C_D7D8                ;0xd69c:   cd d8 d7  "..." 
    JR nc, C_D698              ;0xd69f:   30 f7  "0." 
    RET                        ;0xd6a1:   c9  "." 
;--------------------------------------
C_D6A2:                        ;          XREF: 0xD2EC 
    INC HL                     ;0xd6a2:   23  "#" 
    LD A,(IY+5)                ;0xd6a3:   fd 7e 05  ".~." 
    OR A                       ;0xd6a6:   b7  "." 
    JR nz, C_D6BA              ;0xd6a7:   20 11  " ." 
    CALL C_D91C                ;0xd6a9:   cd 1c d9  "..." 
    RET nc                     ;0xd6ac:   d0  "." 
    LD A,(DE)                  ;0xd6ad:   1a  "." 
    CP 0xe5                    ;0xd6ae:   fe e5  ".." 
    SCF                        ;0xd6b0:   37  "7" 
    RET z                      ;0xd6b1:   c8  "." 
    CALL C_D9A8                ;0xd6b2:   cd a8 d9  "..." 
    LD A,0xff                  ;0xd6b5:   3e ff  ">."  
    JP C_D83C                  ;0xd6b7:   c3 3c d8  ".<." 
;--------------------------------------
C_D6BA:                        ;          XREF: 0xD6A7 
    CALL C_D9B8                ;0xd6ba:   cd b8 d9  "..." 
    RET nc                     ;0xd6bd:   d0  "." 
    JP C_D91C                  ;0xd6be:   c3 1c d9  "..." 
;--------------------------------------
C_D6C1:                        ;          XREF: 0xD6CF 
    LD HL,0x21                 ;0xd6c1:   21 21 00  "!!."  
    ADD HL,DE                  ;0xd6c4:   19  "." 
    JP C_DBF9                  ;0xd6c5:   c3 f9 db  "..." 
;--------------------------------------
C_D6C8:                        ;          XREF: 0xD3B9 
    LD HL,0x23                 ;0xd6c8:   21 23 00  "!#."  
    ADD HL,DE                  ;0xd6cb:   19  "." 
    LD A,(HL)                  ;0xd6cc:   7e  "~" 
    OR A                       ;0xd6cd:   b7  "." 
    RET nz                     ;0xd6ce:   c0  "." 
    CALL C_D6C1                ;0xd6cf:   cd c1 d6  "..." 
    LD A,H                     ;0xd6d2:   7c  "|" 
    RRA                        ;0xd6d3:   1f  "." 
    RRA                        ;0xd6d4:   1f  "." 
    RRA                        ;0xd6d5:   1f  "." 
    RRA                        ;0xd6d6:   1f  "." 
    AND 15                     ;0xd6d7:   e6 0f  ".." 
    LD B,A                     ;0xd6d9:   47  "G" 
    ADD HL,HL                  ;0xd6da:   29  ")" 
    LD A,H                     ;0xd6db:   7c  "|" 
    AND 0x1f                   ;0xd6dc:   e6 1f  ".." 
    LD C,A                     ;0xd6de:   4f  "O" 
    PUSH BC                    ;0xd6df:   c5  "." 
    LD HL,15                   ;0xd6e0:   21 0f 00  "!.."  
    ADD HL,DE                  ;0xd6e3:   19  "." 
    LD A,(HL)                  ;0xd6e4:   7e  "~" 
    XOR B                      ;0xd6e5:   a8  "." 
    JR nz, C_D6F7              ;0xd6e6:   20 0f  " ." 
    LD A,4                     ;0xd6e8:   3e 04  ">."  
    CALL C_DA54                ;0xd6ea:   cd 54 da  ".T." 
    CPL                        ;0xd6ed:   2f  "/" 
    LD B,A                     ;0xd6ee:   47  "G" 
    DEC HL                     ;0xd6ef:   2b  "+" 
    DEC HL                     ;0xd6f0:   2b  "+" 
    LD A,(HL)                  ;0xd6f1:   7e  "~" 
    XOR C                      ;0xd6f2:   a9  "." 
    AND B                      ;0xd6f3:   a0  "." 
    JR nz, C_D6F7              ;0xd6f4:   20 01  " ." 
    SCF                        ;0xd6f6:   37  "7" 
;--------------------------------------
C_D6F7:                        ;          XREF: 0xD6E6 
    POP BC                     ;0xd6f7:   c1  "." 
    SBC A,A                    ;0xd6f8:   9f  "." 
    RET                        ;0xd6f9:   c9  "." 
;--------------------------------------
C_D6FA:                        ;          XREF: 0xD3C6 
    LD HL,13                   ;0xd6fa:   21 0d 00  "!.."  
    ADD HL,DE                  ;0xd6fd:   19  "." 
    LD (HL),C                  ;0xd6fe:   71  "q" 
    INC HL                     ;0xd6ff:   23  "#" 
    INC HL                     ;0xd700:   23  "#" 
    LD (HL),B                  ;0xd701:   70  "p" 
    INC HL                     ;0xd702:   23  "#" 
    EX DE,HL                   ;0xd703:   eb  "." 
    LD BC,0x11                 ;0xd704:   01 11 00  "..."  
    CALL C_CAAF                ;0xd707:   cd af ca  "..." 
    EX DE,HL                   ;0xd70a:   eb  "." 
    RET                        ;0xd70b:   c9  "." 
;--------------------------------------
C_D70C:                        ;          XREF: 0xD427 
    PUSH DE                    ;0xd70c:   d5  "." 
    CALL C_D6C1                ;0xd70d:   cd c1 d6  "..." 
    LD A,H                     ;0xd710:   7c  "|" 
    AND 15                     ;0xd711:   e6 0f  ".." 
    LD H,A                     ;0xd713:   67  "g" 
    PUSH HL                    ;0xd714:   e5  "." 
    LD HL,0x10                 ;0xd715:   21 10 00  "!.."  
    ADD HL,DE                  ;0xd718:   19  "." 
    LD C,(HL)                  ;0xd719:   4e  "N" 
    LD B,0                     ;0xd71a:   06 00  ".."  
    DEC HL                     ;0xd71c:   2b  "+" 
    DEC HL                     ;0xd71d:   2b  "+" 
    DEC HL                     ;0xd71e:   2b  "+" 
    LD H,(HL)                  ;0xd71f:   66  "f" 
    LD L,B                     ;0xd720:   68  "h" 
    LD A,1                     ;0xd721:   3e 01  ">."  
    CALL C_DBEB                ;0xd723:   cd eb db  "..." 
    ADD HL,BC                  ;0xd726:   09  "." 
    POP DE                     ;0xd727:   d1  "." 
    INC DE                     ;0xd728:   13  "." 
    CALL C_DBF3                ;0xd729:   cd f3 db  "..." 
    CCF                        ;0xd72c:   3f  "?" 
    POP DE                     ;0xd72d:   d1  "." 
    RET                        ;0xd72e:   c9  "." 
;--------------------------------------
C_D72F:                        ;          XREF: 0xD3C9 
    CALL C_D6C1                ;0xd72f:   cd c1 d6  "..." 
    LD A,3                     ;0xd732:   3e 03  ">."  
    CALL C_DA54                ;0xd734:   cd 54 da  ".T." 
    AND L                      ;0xd737:   a5  "." 
    LD C,A                     ;0xd738:   4f  "O" 
    LD A,2                     ;0xd739:   3e 02  ">."  
    CALL C_DA54                ;0xd73b:   cd 54 da  ".T." 
    CALL C_DBEB                ;0xd73e:   cd eb db  "..." 
    LD A,6                     ;0xd741:   3e 06  ">."  
    CALL C_DA54                ;0xd743:   cd 54 da  ".T." 
    LD B,A                     ;0xd746:   47  "G" 
    OR A                       ;0xd747:   b7  "." 
    LD A,L                     ;0xd748:   7d  "}" 
    LD HL,0x11                 ;0xd749:   21 11 00  "!.."  
    ADD HL,DE                  ;0xd74c:   19  "." 
    JR z, C_D75D               ;0xd74d:   28 0e  "(." 
    AND 7                      ;0xd74f:   e6 07  ".." 
    ADD A,A                    ;0xd751:   87  "." 
    ADD A,L                    ;0xd752:   85  "." 
    LD L,A                     ;0xd753:   6f  "o" 
    ADC A,H                    ;0xd754:   8c  "." 
    SUB L                      ;0xd755:   95  "." 
    LD H,A                     ;0xd756:   67  "g" 
    PUSH HL                    ;0xd757:   e5  "." 
    CALL C_DBF9                ;0xd758:   cd f9 db  "..." 
    JR C_D768                  ;0xd75b:   18 0b  ".." 
;--------------------------------------
C_D75D:                        ;          XREF: 0xD74D 
    AND 15                     ;0xd75d:   e6 0f  ".." 
    ADD A,L                    ;0xd75f:   85  "." 
    LD L,A                     ;0xd760:   6f  "o" 
    ADC A,H                    ;0xd761:   8c  "." 
    SUB L                      ;0xd762:   95  "." 
    LD H,A                     ;0xd763:   67  "g" 
    PUSH HL                    ;0xd764:   e5  "." 
    LD L,(HL)                  ;0xd765:   6e  "n" 
    LD H,0                     ;0xd766:   26 00  "&."  
;--------------------------------------
C_D768:                        ;          XREF: 0xD75B 
    LD A,H                     ;0xd768:   7c  "|" 
    OR L                       ;0xd769:   b5  "." 
    JR z, C_D77B               ;0xd76a:   28 0f  "(." 
    POP AF                     ;0xd76c:   f1  "." 
    LD A,2                     ;0xd76d:   3e 02  ">."  
    CALL C_DA54                ;0xd76f:   cd 54 da  ".T." 
;--------------------------------------
C_D772:                        ;          XREF: 0xD774 
    ADD HL,HL                  ;0xd772:   29  ")" 
    DEC A                      ;0xd773:   3d  "=" 
    JR nz, C_D772              ;0xd774:   20 fc  " ." 
    LD A,C                     ;0xd776:   79  "y" 
    OR L                       ;0xd777:   b5  "." 
    LD L,A                     ;0xd778:   6f  "o" 
    SCF                        ;0xd779:   37  "7" 
    RET                        ;0xd77a:   c9  "." 
;--------------------------------------
C_D77B:                        ;          XREF: 0xD76A 
    POP HL                     ;0xd77b:   e1  "." 
    RET                        ;0xd77c:   c9  "." 
;--------------------------------------
C_D77D:                        ;          XREF: 0xD137 
    LD HL,0x10                 ;0xd77d:   21 10 00  "!.."  
    ADD HL,DE                  ;0xd780:   19  "." 
    LD A,(HL)                  ;0xd781:   7e  "~" 
    INC (HL)                   ;0xd782:   34  "4" 
    OR A                       ;0xd783:   b7  "." 
    RET p                      ;0xd784:   f0  "." 
    LD (HL),1                  ;0xd785:   36 01  "6."  
    DEC HL                     ;0xd787:   2b  "+" 
    DEC HL                     ;0xd788:   2b  "+" 
    DEC HL                     ;0xd789:   2b  "+" 
    INC (HL)                   ;0xd78a:   34  "4" 
    RET                        ;0xd78b:   c9  "." 
;--------------------------------------
C_D78C:                        ;          XREF: 0xD1F2 
    PUSH DE                    ;0xd78c:   d5  "." 
    PUSH DE                    ;0xd78d:   d5  "." 
    CALL C_D7BB                ;0xd78e:   cd bb d7  "..." 
    EX (SP),HL                 ;0xd791:   e3  "." 
    INC HL                     ;0xd792:   23  "#" 
    CALL C_DBDF                ;0xd793:   cd df db  "..." 
    POP HL                     ;0xd796:   e1  "." 
    CALL C_D97A                ;0xd797:   cd 7a d9  ".z." 
    POP DE                     ;0xd79a:   d1  "." 
    RET                        ;0xd79b:   c9  "." 
;--------------------------------------
C_D79C:                        ;          XREF: 0xCEF5 
    LD HL,0x21                 ;0xd79c:   21 21 00  "!!."  
    ADD HL,DE                  ;0xd79f:   19  "." 
    XOR A                      ;0xd7a0:   af  "." 
    LD (HL),A                  ;0xd7a1:   77  "w" 
    INC HL                     ;0xd7a2:   23  "#" 
    LD (HL),A                  ;0xd7a3:   77  "w" 
    INC HL                     ;0xd7a4:   23  "#" 
    LD (HL),A                  ;0xd7a5:   77  "w" 
    RET                        ;0xd7a6:   c9  "." 
;--------------------------------------
C_D7A7:                        ;          XREF: 0xD134 
    LD HL,0x21                 ;0xd7a7:   21 21 00  "!!."  
    ADD HL,DE                  ;0xd7aa:   19  "." 
;--------------------------------------
C_D7AB:                        ;          XREF: 0xD07F 
    INC (HL)                   ;0xd7ab:   34  "4" 
    RET nz                     ;0xd7ac:   c0  "." 
    INC HL                     ;0xd7ad:   23  "#" 
    INC (HL)                   ;0xd7ae:   34  "4" 
    RET nz                     ;0xd7af:   c0  "." 
    INC HL                     ;0xd7b0:   23  "#" 
    INC (HL)                   ;0xd7b1:   34  "4" 
    RET                        ;0xd7b2:   c9  "." 
;--------------------------------------
C_D7B3:                        ;          XREF: 0xD41E 
    CALL C_D683                ;0xd7b3:   cd 83 d6  "..." 
    CALL C_D698                ;0xd7b6:   cd 98 d6  "..." 
    JR C_D7CC                  ;0xd7b9:   18 11  ".." 
;--------------------------------------
C_D7BB:                        ;          XREF: 0xD78E 
    LD HL,D_FFFF               ;0xd7bb:   21 ff ff  "!.."  
;--------------------------------------
C_D7BE:                        ;          XREF: 0xD7CA 
    INC HL                     ;0xd7be:   23  "#" 
    CALL C_D91C                ;0xd7bf:   cd 1c d9  "..." 
    LD A,7                     ;0xd7c2:   3e 07  ">."  
    JP nc, C_CDB1              ;0xd7c4:   d2 b1 cd  "..." 
    LD A,(DE)                  ;0xd7c7:   1a  "." 
    CP 0xe5                    ;0xd7c8:   fe e5  ".." 
    JR nz, C_D7BE              ;0xd7ca:   20 f2  " ." 
;--------------------------------------
C_D7CC:                        ;          XREF: 0xD7B9 
    PUSH AF                    ;0xd7cc:   f5  "." 
    LD A,(IY+5)                ;0xd7cd:   fd 7e 05  ".~." 
    OR A                       ;0xd7d0:   b7  "." 
    LD A,9                     ;0xd7d1:   3e 09  ">."  
    JP z, C_CDB8               ;0xd7d3:   ca b8 cd  "..." 
    POP AF                     ;0xd7d6:   f1  "." 
    RET                        ;0xd7d7:   c9  "." 
;--------------------------------------
C_D7D8:                        ;          XREF: 0xD2F5 
    PUSH BC                    ;0xd7d8:   c5  "." 
    PUSH DE                    ;0xd7d9:   d5  "." 
    PUSH HL                    ;0xd7da:   e5  "." 
    LD H,B                     ;0xd7db:   60  "`" 
    LD L,C                     ;0xd7dc:   69  "i" 
    LD A,(DE)                  ;0xd7dd:   1a  "." 
    XOR (HL)                   ;0xd7de:   ae  "." 
    JR nz, C_D80E              ;0xd7df:   20 2d  " -" 
    INC HL                     ;0xd7e1:   23  "#" 
    INC DE                     ;0xd7e2:   13  "." 
    LD B,11                    ;0xd7e3:   06 0b  ".."  
;--------------------------------------
C_D7E5:                        ;          XREF: 0xD7F2 
    LD A,(HL)                  ;0xd7e5:   7e  "~" 
    CP 0x3f                    ;0xd7e6:   fe 3f  ".?" 
    JR z, C_D7F0               ;0xd7e8:   28 06  "(." 
    LD A,(DE)                  ;0xd7ea:   1a  "." 
    XOR (HL)                   ;0xd7eb:   ae  "." 
    AND 0x7f                   ;0xd7ec:   e6 7f  ".." 
    JR nz, C_D80E              ;0xd7ee:   20 1e  " ." 
;--------------------------------------
C_D7F0:                        ;          XREF: 0xD7E8 
    INC HL                     ;0xd7f0:   23  "#" 
    INC DE                     ;0xd7f1:   13  "." 
    DJNZ C_D7E5                ;0xd7f2:   10 f1  ".." 
    LD A,(HL)                  ;0xd7f4:   7e  "~" 
    INC A                      ;0xd7f5:   3c  "<" 
    JR z, C_D804               ;0xd7f6:   28 0c  "(." 
    LD A,4                     ;0xd7f8:   3e 04  ">."  
    CALL C_DA54                ;0xd7fa:   cd 54 da  ".T." 
    CPL                        ;0xd7fd:   2f  "/" 
    LD B,A                     ;0xd7fe:   47  "G" 
    LD A,(DE)                  ;0xd7ff:   1a  "." 
    XOR (HL)                   ;0xd800:   ae  "." 
    AND B                      ;0xd801:   a0  "." 
    JR nz, C_D80E              ;0xd802:   20 0a  " ." 
;--------------------------------------
C_D804:                        ;          XREF: 0xD7F6 
    INC HL                     ;0xd804:   23  "#" 
    INC DE                     ;0xd805:   13  "." 
    INC HL                     ;0xd806:   23  "#" 
    INC DE                     ;0xd807:   13  "." 
    LD A,(HL)                  ;0xd808:   7e  "~" 
    INC A                      ;0xd809:   3c  "<" 
    JR z, C_D80E               ;0xd80a:   28 02  "(." 
    LD A,(DE)                  ;0xd80c:   1a  "." 
    XOR (HL)                   ;0xd80d:   ae  "." 
;--------------------------------------
C_D80E:                        ;          XREF: 0xD7DF 
    POP HL                     ;0xd80e:   e1  "." 
    POP DE                     ;0xd80f:   d1  "." 
    POP BC                     ;0xd810:   c1  "." 
    RET nz                     ;0xd811:   c0  "." 
    SCF                        ;0xd812:   37  "7" 
    RET                        ;0xd813:   c9  "." 
;--------------------------------------
C_D814:                        ;          XREF: 0xD691 
    LD A,5                     ;0xd814:   3e 05  ">."  
    CALL C_DA45                ;0xd816:   cd 45 da  ".E." 
    LD A,3                     ;0xd819:   3e 03  ">."  
    CALL C_DBEB                ;0xd81b:   cd eb db  "..." 
    INC HL                     ;0xd81e:   23  "#" 
    EX DE,HL                   ;0xd81f:   eb  "." 
    LD A,14                    ;0xd820:   3e 0e  ">."  
    CALL C_DA3F                ;0xd822:   cd 3f da  ".?." 
;--------------------------------------
C_D825:                        ;          XREF: 0xD82B 
    LD (HL),0                  ;0xd825:   36 00  "6."  
    INC HL                     ;0xd827:   23  "#" 
    DEC DE                     ;0xd828:   1b  "." 
    LD A,D                     ;0xd829:   7a  "z" 
    OR E                       ;0xd82a:   b3  "." 
    JR nz, C_D825              ;0xd82b:   20 f8  " ." 
    LD A,9                     ;0xd82d:   3e 09  ">."  
    CALL C_DA45                ;0xd82f:   cd 45 da  ".E." 
    EX DE,HL                   ;0xd832:   eb  "." 
    LD A,14                    ;0xd833:   3e 0e  ">."  
    CALL C_DA3F                ;0xd835:   cd 3f da  ".?." 
    LD (HL),E                  ;0xd838:   73  "s" 
    INC HL                     ;0xd839:   23  "#" 
    LD (HL),D                  ;0xd83a:   72  "r" 
    RET                        ;0xd83b:   c9  "." 
;--------------------------------------
C_D83C:                        ;          XREF: 0xD1CC 
    PUSH HL                    ;0xd83c:   e5  "." 
    PUSH DE                    ;0xd83d:   d5  "." 
    PUSH BC                    ;0xd83e:   c5  "." 
    LD C,A                     ;0xd83f:   4f  "O" 
    LD HL,0x10                 ;0xd840:   21 10 00  "!.."  
    ADD HL,DE                  ;0xd843:   19  "." 
    LD B,0x10                  ;0xd844:   06 10  ".."  
;--------------------------------------
C_D846:                        ;          XREF: 0xD865 
    LD E,(HL)                  ;0xd846:   5e  "^" 
    INC HL                     ;0xd847:   23  "#" 
    LD A,6                     ;0xd848:   3e 06  ">."  
    CALL C_DA54                ;0xd84a:   cd 54 da  ".T." 
    OR A                       ;0xd84d:   b7  "." 
    JR z, C_D853               ;0xd84e:   28 03  "(." 
    DEC B                      ;0xd850:   05  "." 
    LD A,(HL)                  ;0xd851:   7e  "~" 
    INC HL                     ;0xd852:   23  "#" 
;--------------------------------------
C_D853:                        ;          XREF: 0xD84E 
    LD D,A                     ;0xd853:   57  "W" 
    OR E                       ;0xd854:   b3  "." 
    JR z, C_D865               ;0xd855:   28 0e  "(." 
    PUSH HL                    ;0xd857:   e5  "." 
    LD A,5                     ;0xd858:   3e 05  ">."  
    CALL C_DA45                ;0xd85a:   cd 45 da  ".E." 
    LD A,L                     ;0xd85d:   7d  "}" 
    SUB E                      ;0xd85e:   93  "." 
    LD A,H                     ;0xd85f:   7c  "|" 
    SBC A,D                    ;0xd860:   9a  "." 
    CALL nc, C_D86C            ;0xd861:   d4 6c d8  ".l." 
    POP HL                     ;0xd864:   e1  "." 
;--------------------------------------
C_D865:                        ;          XREF: 0xD855 
    DJNZ C_D846                ;0xd865:   10 df  ".." 
    POP BC                     ;0xd867:   c1  "." 
    POP DE                     ;0xd868:   d1  "." 
    POP HL                     ;0xd869:   e1  "." 
    SCF                        ;0xd86a:   37  "7" 
    RET                        ;0xd86b:   c9  "." 
;--------------------------------------
C_D86C:                        ;          XREF: 0xD861 
    PUSH BC                    ;0xd86c:   c5  "." 
    PUSH DE                    ;0xd86d:   d5  "." 
    PUSH DE                    ;0xd86e:   d5  "." 
    EX DE,HL                   ;0xd86f:   eb  "." 
    LD A,3                     ;0xd870:   3e 03  ">."  
    CALL C_DBEB                ;0xd872:   cd eb db  "..." 
    EX DE,HL                   ;0xd875:   eb  "." 
    LD A,14                    ;0xd876:   3e 0e  ">."  
    CALL C_DA3F                ;0xd878:   cd 3f da  ".?." 
    ADD HL,DE                  ;0xd87b:   19  "." 
    POP DE                     ;0xd87c:   d1  "." 
    LD A,E                     ;0xd87d:   7b  "{" 
    AND 7                      ;0xd87e:   e6 07  ".." 
    LD E,A                     ;0xd880:   5f  "_" 
    LD A,1                     ;0xd881:   3e 01  ">."  
    INC E                      ;0xd883:   1c  "." 
;--------------------------------------
C_D884:                        ;          XREF: 0xD886 
    RRCA                       ;0xd884:   0f  "." 
    DEC E                      ;0xd885:   1d  "." 
    JR nz, C_D884              ;0xd886:   20 fc  " ." 
    LD B,A                     ;0xd888:   47  "G" 
    AND C                      ;0xd889:   a1  "." 
    LD C,A                     ;0xd88a:   4f  "O" 
    LD A,B                     ;0xd88b:   78  "x" 
    CPL                        ;0xd88c:   2f  "/" 
    AND (HL)                   ;0xd88d:   a6  "." 
    OR C                       ;0xd88e:   b1  "." 
    LD (HL),A                  ;0xd88f:   77  "w" 
    POP DE                     ;0xd890:   d1  "." 
    POP BC                     ;0xd891:   c1  "." 
    RET                        ;0xd892:   c9  "." 
;--------------------------------------
C_D893:                        ;          XREF: 0xD3D2 
    PUSH BC                    ;0xd893:   c5  "." 
    PUSH DE                    ;0xd894:   d5  "." 
    LD A,5                     ;0xd895:   3e 05  ">."  
    CALL C_DA45                ;0xd897:   cd 45 da  ".E." 
    EX DE,HL                   ;0xd89a:   eb  "." 
    LD A,14                    ;0xd89b:   3e 0e  ">."  
    CALL C_DA3F                ;0xd89d:   cd 3f da  ".?." 
;--------------------------------------
C_D8A0:                        ;          XREF: 0xD8B1 
    LD BC,0x880                ;0xd8a0:   01 80 08  "..."  
;--------------------------------------
C_D8A3:                        ;          XREF: 0xD8AE 
    LD A,(HL)                  ;0xd8a3:   7e  "~" 
    AND C                      ;0xd8a4:   a1  "." 
    JR z, C_D8B3               ;0xd8a5:   28 0c  "(." 
    RRCA                       ;0xd8a7:   0f  "." 
    LD C,A                     ;0xd8a8:   4f  "O" 
    LD A,D                     ;0xd8a9:   7a  "z" 
    OR E                       ;0xd8aa:   b3  "." 
    JR z, C_D8BF               ;0xd8ab:   28 12  "(." 
    DEC DE                     ;0xd8ad:   1b  "." 
    DJNZ C_D8A3                ;0xd8ae:   10 f3  ".." 
    INC HL                     ;0xd8b0:   23  "#" 
    JR C_D8A0                  ;0xd8b1:   18 ed  ".." 
;--------------------------------------
C_D8B3:                        ;          XREF: 0xD8A5 
    LD A,(HL)                  ;0xd8b3:   7e  "~" 
    OR C                       ;0xd8b4:   b1  "." 
    LD (HL),A                  ;0xd8b5:   77  "w" 
    LD A,5                     ;0xd8b6:   3e 05  ">."  
    CALL C_DA45                ;0xd8b8:   cd 45 da  ".E." 
    OR A                       ;0xd8bb:   b7  "." 
    SBC HL,DE                  ;0xd8bc:   ed 52  ".R" 
    SCF                        ;0xd8be:   37  "7" 
;--------------------------------------
C_D8BF:                        ;          XREF: 0xD8AB 
    POP DE                     ;0xd8bf:   d1  "." 
    POP BC                     ;0xd8c0:   c1  "." 
    RET                        ;0xd8c1:   c9  "." 
;--------------------------------------
C_D8C2:                        ;          XREF: 0xD571 
    PUSH BC                    ;0xd8c2:   c5  "." 
    PUSH HL                    ;0xd8c3:   e5  "." 
    LD HL,0                    ;0xd8c4:   21 00 00  "!.."  
    PUSH HL                    ;0xd8c7:   e5  "." 
    LD A,5                     ;0xd8c8:   3e 05  ">."  
    CALL C_DA45                ;0xd8ca:   cd 45 da  ".E." 
    EX DE,HL                   ;0xd8cd:   eb  "." 
    LD A,14                    ;0xd8ce:   3e 0e  ">."  
    CALL C_DA3F                ;0xd8d0:   cd 3f da  ".?." 
;--------------------------------------
C_D8D3:                        ;          XREF: 0xD8E8 
    LD BC,0x880                ;0xd8d3:   01 80 08  "..."  
;--------------------------------------
C_D8D6:                        ;          XREF: 0xD8E5 
    LD A,(HL)                  ;0xd8d6:   7e  "~" 
    AND C                      ;0xd8d7:   a1  "." 
    JR nz, C_D8DD              ;0xd8d8:   20 03  " ." 
    EX (SP),HL                 ;0xd8da:   e3  "." 
    INC HL                     ;0xd8db:   23  "#" 
    EX (SP),HL                 ;0xd8dc:   e3  "." 
;--------------------------------------
C_D8DD:                        ;          XREF: 0xD8D8 
    LD A,C                     ;0xd8dd:   79  "y" 
    RRCA                       ;0xd8de:   0f  "." 
    LD C,A                     ;0xd8df:   4f  "O" 
    LD A,D                     ;0xd8e0:   7a  "z" 
    OR E                       ;0xd8e1:   b3  "." 
    JR z, C_D8EA               ;0xd8e2:   28 06  "(." 
    DEC DE                     ;0xd8e4:   1b  "." 
    DJNZ C_D8D6                ;0xd8e5:   10 ef  ".." 
    INC HL                     ;0xd8e7:   23  "#" 
    JR C_D8D3                  ;0xd8e8:   18 e9  ".." 
;--------------------------------------
C_D8EA:                        ;          XREF: 0xD8E2 
    POP HL                     ;0xd8ea:   e1  "." 
    CALL C_D910                ;0xd8eb:   cd 10 d9  "..." 
    EX DE,HL                   ;0xd8ee:   eb  "." 
    POP HL                     ;0xd8ef:   e1  "." 
    POP BC                     ;0xd8f0:   c1  "." 
    RET                        ;0xd8f1:   c9  "." 
;--------------------------------------
C_D8F2:                        ;          XREF: 0xD5CB 
    PUSH DE                    ;0xd8f2:   d5  "." 
    LD HL,0x10                 ;0xd8f3:   21 10 00  "!.."  
    ADD HL,DE                  ;0xd8f6:   19  "." 
    LD DE,0x1000               ;0xd8f7:   11 00 10  "..."  
;--------------------------------------
C_D8FA:                        ;          XREF: 0xD90C 
    LD A,6                     ;0xd8fa:   3e 06  ">."  
    CALL C_DA54                ;0xd8fc:   cd 54 da  ".T." 
    OR A                       ;0xd8ff:   b7  "." 
    LD A,(HL)                  ;0xd900:   7e  "~" 
    INC HL                     ;0xd901:   23  "#" 
    JR z, C_D907               ;0xd902:   28 03  "(." 
    OR (HL)                    ;0xd904:   b6  "." 
    DEC D                      ;0xd905:   15  "." 
    INC HL                     ;0xd906:   23  "#" 
;--------------------------------------
C_D907:                        ;          XREF: 0xD902 
    OR A                       ;0xd907:   b7  "." 
    JR z, C_D90B               ;0xd908:   28 01  "(." 
    INC E                      ;0xd90a:   1c  "." 
;--------------------------------------
C_D90B:                        ;          XREF: 0xD908 
    DEC D                      ;0xd90b:   15  "." 
    JR nz, C_D8FA              ;0xd90c:   20 ec  " ." 
    EX DE,HL                   ;0xd90e:   eb  "." 
    POP DE                     ;0xd90f:   d1  "." 
;--------------------------------------
C_D910:                        ;          XREF: 0xD8EB 
    LD A,2                     ;0xd910:   3e 02  ">."  
    CALL C_DA54                ;0xd912:   cd 54 da  ".T." 
    DEC A                      ;0xd915:   3d  "=" 
    DEC A                      ;0xd916:   3d  "=" 
;--------------------------------------
C_D917:                        ;          XREF: 0xD91A 
    DEC A                      ;0xd917:   3d  "=" 
    RET z                      ;0xd918:   c8  "." 
    ADD HL,HL                  ;0xd919:   29  ")" 
    JR C_D917                  ;0xd91a:   18 fb  ".." 
;--------------------------------------
C_D91C:                        ;          XREF: 0xD6A9 
    PUSH HL                    ;0xd91c:   e5  "." 
    PUSH BC                    ;0xd91d:   c5  "." 
    LD A,L                     ;0xd91e:   7d  "}" 
    AND 3                      ;0xd91f:   e6 03  ".." 
    JR nz, C_D934              ;0xd921:   20 11  " ." 
    EX DE,HL                   ;0xd923:   eb  "." 
    LD A,7                     ;0xd924:   3e 07  ">."  
    CALL C_DA45                ;0xd926:   cd 45 da  ".E." 
    CALL C_DBF3                ;0xd929:   cd f3 db  "..." 
    CCF                        ;0xd92c:   3f  "?" 
    EX DE,HL                   ;0xd92d:   eb  "." 
    JR nc, C_D945              ;0xd92e:   30 15  "0." 
    CALL C_D948                ;0xd930:   cd 48 d9  ".H." 
    XOR A                      ;0xd933:   af  "." 
;--------------------------------------
C_D934:                        ;          XREF: 0xD921 
    LD B,A                     ;0xd934:   47  "G" 
    LD A,8                     ;0xd935:   3e 08  ">."  
    CALL C_DA3F                ;0xd937:   cd 3f da  ".?." 
    LD DE,0x20                 ;0xd93a:   11 20 00  ". ."  
    INC B                      ;0xd93d:   04  "." 
    JR C_D941                  ;0xd93e:   18 01  ".." 
;--------------------------------------
C_D940:                        ;          XREF: 0xD941 
    ADD HL,DE                  ;0xd940:   19  "." 
;--------------------------------------
C_D941:                        ;          XREF: 0xD93E 
    DJNZ C_D940                ;0xd941:   10 fd  ".." 
    EX DE,HL                   ;0xd943:   eb  "." 
    SCF                        ;0xd944:   37  "7" 
;--------------------------------------
C_D945:                        ;          XREF: 0xD92E 
    POP BC                     ;0xd945:   c1  "." 
    POP HL                     ;0xd946:   e1  "." 
    RET                        ;0xd947:   c9  "." 
;--------------------------------------
C_D948:                        ;          XREF: 0xD930 
    LD A,2                     ;0xd948:   3e 02  ">."  
    CALL C_DBEB                ;0xd94a:   cd eb db  "..." 
    EX DE,HL                   ;0xd94d:   eb  "." 
    LD A,8                     ;0xd94e:   3e 08  ">."  
    CALL C_DA3F                ;0xd950:   cd 3f da  ".?." 
    CALL C_D9E8                ;0xd953:   cd e8 d9  "..." 
    LD A,11                    ;0xd956:   3e 0b  ">."  
    CALL C_DA45                ;0xd958:   cd 45 da  ".E." 
    EX DE,HL                   ;0xd95b:   eb  "." 
    CALL C_DBF3                ;0xd95c:   cd f3 db  "..." 
    EX DE,HL                   ;0xd95f:   eb  "." 
    RET nc                     ;0xd960:   d0  "." 
    LD A,12                    ;0xd961:   3e 0c  ">."  
    CALL C_DA3F                ;0xd963:   cd 3f da  ".?." 
    ADD HL,DE                  ;0xd966:   19  "." 
    CALL C_D9C8                ;0xd967:   cd c8 d9  "..." 
    CP (HL)                    ;0xd96a:   be  "." 
    RET z                      ;0xd96b:   c8  "." 
    PUSH AF                    ;0xd96c:   f5  "." 
    EX DE,HL                   ;0xd96d:   eb  "." 
    ADD HL,HL                  ;0xd96e:   29  ")" 
    ADD HL,HL                  ;0xd96f:   29  ")" 
    CALL C_D9B8                ;0xd970:   cd b8 d9  "..." 
    EX DE,HL                   ;0xd973:   eb  "." 
    POP DE                     ;0xd974:   d1  "." 
    JP c, C_D233               ;0xd975:   da 33 d2  ".3." 
    LD (HL),D                  ;0xd978:   72  "r" 
    RET                        ;0xd979:   c9  "." 
;--------------------------------------
C_D97A:                        ;          XREF: 0xD35F 
    PUSH HL                    ;0xd97a:   e5  "." 
    PUSH BC                    ;0xd97b:   c5  "." 
    LD A,2                     ;0xd97c:   3e 02  ">."  
    CALL C_DBEB                ;0xd97e:   cd eb db  "..." 
    EX DE,HL                   ;0xd981:   eb  "." 
    LD A,8                     ;0xd982:   3e 08  ">."  
    CALL C_DA3F                ;0xd984:   cd 3f da  ".?." 
    LD C,1                     ;0xd987:   0e 01  ".."  
    CALL C_D9F3                ;0xd989:   cd f3 d9  "..." 
    LD A,11                    ;0xd98c:   3e 0b  ">."  
    CALL C_DA45                ;0xd98e:   cd 45 da  ".E." 
    EX DE,HL                   ;0xd991:   eb  "." 
    CALL C_DBF3                ;0xd992:   cd f3 db  "..." 
    EX DE,HL                   ;0xd995:   eb  "." 
    JR nc, C_D9A2              ;0xd996:   30 0a  "0." 
    LD A,12                    ;0xd998:   3e 0c  ">."  
    CALL C_DA3F                ;0xd99a:   cd 3f da  ".?." 
    ADD HL,DE                  ;0xd99d:   19  "." 
    CALL C_D9C8                ;0xd99e:   cd c8 d9  "..." 
    LD (HL),A                  ;0xd9a1:   77  "w" 
;--------------------------------------
C_D9A2:                        ;          XREF: 0xD996 
    POP BC                     ;0xd9a2:   c1  "." 
    POP HL                     ;0xd9a3:   e1  "." 
    CALL C_D9B8                ;0xd9a4:   cd b8 d9  "..." 
    RET c                      ;0xd9a7:   d8  "." 
;--------------------------------------
C_D9A8:                        ;          XREF: 0xD695 
    PUSH DE                    ;0xd9a8:   d5  "." 
    PUSH HL                    ;0xd9a9:   e5  "." 
    EX DE,HL                   ;0xd9aa:   eb  "." 
    INC DE                     ;0xd9ab:   13  "." 
    LD A,2                     ;0xd9ac:   3e 02  ">."  
    CALL C_DA35                ;0xd9ae:   cd 35 da  ".5." 
    LD (HL),E                  ;0xd9b1:   73  "s" 
    INC HL                     ;0xd9b2:   23  "#" 
    LD (HL),D                  ;0xd9b3:   72  "r" 
    POP HL                     ;0xd9b4:   e1  "." 
    POP DE                     ;0xd9b5:   d1  "." 
    SCF                        ;0xd9b6:   37  "7" 
    RET                        ;0xd9b7:   c9  "." 
;--------------------------------------
C_D9B8:                        ;          XREF: 0xD6BA 
    PUSH DE                    ;0xd9b8:   d5  "." 
    PUSH HL                    ;0xd9b9:   e5  "." 
    LD A,2                     ;0xd9ba:   3e 02  ">."  
    CALL C_DA35                ;0xd9bc:   cd 35 da  ".5." 
    LD E,(HL)                  ;0xd9bf:   5e  "^" 
    INC HL                     ;0xd9c0:   23  "#" 
    LD D,(HL)                  ;0xd9c1:   56  "V" 
    POP HL                     ;0xd9c2:   e1  "." 
    CALL C_DBF3                ;0xd9c3:   cd f3 db  "..." 
    POP DE                     ;0xd9c6:   d1  "." 
    RET                        ;0xd9c7:   c9  "." 
;--------------------------------------
C_D9C8:                        ;          XREF: 0xD967 
    PUSH BC                    ;0xd9c8:   c5  "." 
    PUSH HL                    ;0xd9c9:   e5  "." 
    LD B,0x80                  ;0xd9ca:   06 80  ".."  
    LD A,8                     ;0xd9cc:   3e 08  ">."  
    CALL C_DA3F                ;0xd9ce:   cd 3f da  ".?." 
    XOR A                      ;0xd9d1:   af  "." 
;--------------------------------------
C_D9D2:                        ;          XREF: 0xD9D4 
    ADD A,(HL)                 ;0xd9d2:   86  "." 
    INC HL                     ;0xd9d3:   23  "#" 
    DJNZ C_D9D2                ;0xd9d4:   10 fc  ".." 
    POP HL                     ;0xd9d6:   e1  "." 
    POP BC                     ;0xd9d7:   c1  "." 
    RET                        ;0xd9d8:   c9  "." 
;--------------------------------------
C_D9D9:                        ;          XREF: 0xD2FC 
    PUSH HL                    ;0xd9d9:   e5  "." 
    LD HL,9                    ;0xd9da:   21 09 00  "!.."  
    JR C_D9E3                  ;0xd9dd:   18 04  ".." 
;--------------------------------------
C_D9DF:                        ;          XREF: 0xD454 
    PUSH HL                    ;0xd9df:   e5  "." 
    LD HL,10                   ;0xd9e0:   21 0a 00  "!.."  
;--------------------------------------
C_D9E3:                        ;          XREF: 0xD9DD 
    ADD HL,DE                  ;0xd9e3:   19  "." 
    LD A,(HL)                  ;0xd9e4:   7e  "~" 
    ADD A,A                    ;0xd9e5:   87  "." 
    POP HL                     ;0xd9e6:   e1  "." 
    RET                        ;0xd9e7:   c9  "." 
;--------------------------------------
C_D9E8:                        ;          XREF: 0xD3A3 
    PUSH BC                    ;0xd9e8:   c5  "." 
    PUSH DE                    ;0xd9e9:   d5  "." 
    PUSH HL                    ;0xd9ea:   e5  "." 
    CALL C_DA06                ;0xd9eb:   cd 06 da  "..." 
    CALL C_C54C                ;0xd9ee:   cd 4c c5  ".L." 
    JR C_D9FE                  ;0xd9f1:   18 0b  ".." 
;--------------------------------------
C_D9F3:                        ;          XREF: 0xD3EA 
    PUSH BC                    ;0xd9f3:   c5  "." 
    PUSH DE                    ;0xd9f4:   d5  "." 
    PUSH HL                    ;0xd9f5:   e5  "." 
    PUSH BC                    ;0xd9f6:   c5  "." 
    CALL C_DA06                ;0xd9f7:   cd 06 da  "..." 
    POP BC                     ;0xd9fa:   c1  "." 
    CALL C_C52E                ;0xd9fb:   cd 2e c5  "..." 
;--------------------------------------
C_D9FE:                        ;          XREF: 0xD9F1 
    OR A                       ;0xd9fe:   b7  "." 
    JP nz, C_CDB6              ;0xd9ff:   c2 b6 cd  "..." 
    POP HL                     ;0xda02:   e1  "." 
    POP DE                     ;0xda03:   d1  "." 
    POP BC                     ;0xda04:   c1  "." 
    RET                        ;0xda05:   c9  "." 
;--------------------------------------
C_DA06:                        ;          XREF: 0xD9EB 
    PUSH DE                    ;0xda06:   d5  "." 
    LD B,H                     ;0xda07:   44  "D" 
    LD C,L                     ;0xda08:   4d  "M" 
    CALL CPM_SETDMA            ;0xda09:   cd 1a c5  "..." 
    POP DE                     ;0xda0c:   d1  "." 
    LD A,13                    ;0xda0d:   3e 0d  ">."  
    CALL C_DA45                ;0xda0f:   cd 45 da  ".E." 
    LD B,H                     ;0xda12:   44  "D" 
    LD C,L                     ;0xda13:   4d  "M" 
    XOR A                      ;0xda14:   af  "." 
    CALL C_DA45                ;0xda15:   cd 45 da  ".E." 
    DEC BC                     ;0xda18:   0b  "." 
;--------------------------------------
C_DA19:                        ;          XREF: 0xDA20 
    INC BC                     ;0xda19:   03  "." 
    LD A,E                     ;0xda1a:   7b  "{" 
    SUB L                      ;0xda1b:   95  "." 
    LD E,A                     ;0xda1c:   5f  "_" 
    LD A,D                     ;0xda1d:   7a  "z" 
    SBC A,H                    ;0xda1e:   9c  "." 
    LD D,A                     ;0xda1f:   57  "W" 
    JR nc, C_DA19              ;0xda20:   30 f7  "0." 
    ADD HL,DE                  ;0xda22:   19  "." 
    PUSH HL                    ;0xda23:   e5  "." 
    CALL CPM_SETTRK            ;0xda24:   cd 24 c5  ".$." 
    POP BC                     ;0xda27:   c1  "." 
    XOR A                      ;0xda28:   af  "." 
    CALL C_DA3F                ;0xda29:   cd 3f da  ".?." 
    EX DE,HL                   ;0xda2c:   eb  "." 
    CALL CPM_SECTRAN           ;0xda2d:   cd 5a c5  ".Z." 
    LD C,L                     ;0xda30:   4d  "M" 
    LD B,H                     ;0xda31:   44  "D" 
    JP CPM_SETSEC              ;0xda32:   c3 29 c5  ".)." 
;--------------------------------------
C_DA35:                        ;          XREF: 0xD9AE 
    ADD A,(IY+3)               ;0xda35:   fd 86 03  "..." 
    LD L,A                     ;0xda38:   6f  "o" 
    ADC A,(IY+4)               ;0xda39:   fd 8e 04  "..." 
    SUB L                      ;0xda3c:   95  "." 
    LD H,A                     ;0xda3d:   67  "g" 
    RET                        ;0xda3e:   c9  "." 
;--------------------------------------
C_DA3F:                        ;          XREF: 0xD822 
    CALL C_DA35                ;0xda3f:   cd 35 da  ".5." 
    JP C_DBF9                  ;0xda42:   c3 f9 db  "..." 
;--------------------------------------
C_DA45:                        ;          XREF: 0xD816 
    PUSH AF                    ;0xda45:   f5  "." 
    LD A,10                    ;0xda46:   3e 0a  ">."  
    CALL C_DA3F                ;0xda48:   cd 3f da  ".?." 
    POP AF                     ;0xda4b:   f1  "." 
    ADD A,L                    ;0xda4c:   85  "." 
    LD L,A                     ;0xda4d:   6f  "o" 
    ADC A,H                    ;0xda4e:   8c  "." 
    SUB L                      ;0xda4f:   95  "." 
    LD H,A                     ;0xda50:   67  "g" 
    JP C_DBF9                  ;0xda51:   c3 f9 db  "..." 
;--------------------------------------
C_DA54:                        ;          XREF: 0xD6EA 
    PUSH HL                    ;0xda54:   e5  "." 
    CALL C_DA45                ;0xda55:   cd 45 da  ".E." 
    LD A,L                     ;0xda58:   7d  "}" 
    POP HL                     ;0xda59:   e1  "." 
    RET                        ;0xda5a:   c9  "." 
;--------------------------------------
C_DA5B:                        ;          XREF: 0xD4CD 
    LD DE,0xe4                 ;0xda5b:   11 e4 00  "..."  
    JR C_DA63                  ;0xda5e:   18 03  ".." 
;--------------------------------------
C_DA60:                        ;          XREF: 0xD4D4 
    LD DE,0xf4                 ;0xda60:   11 f4 00  "..."  
;--------------------------------------
C_DA63:                        ;          XREF: 0xDA5E 
    LD C,0x20                  ;0xda63:   0e 20  ". "  
    CALL C_DA74                ;0xda65:   cd 74 da  ".t." 
    JR C_DA95                  ;0xda68:   18 2b  ".+" 
;--------------------------------------
C_DA6A:                        ;          XREF: 0xCF3B 
    CALL C_DA6F                ;0xda6a:   cd 6f da  ".o." 
    JR C_DA95                  ;0xda6d:   18 26  ".&" 
;--------------------------------------
C_DA6F:                        ;          XREF: 0xCEB3 
    LD C,0xff                  ;0xda6f:   0e ff  ".."  
    LD DE,0xe4                 ;0xda71:   11 e4 00  "..."  
;--------------------------------------
C_DA74:                        ;          XREF: 0xDA65 
    CALL C_DAA0                ;0xda74:   cd a0 da  "..." 
    PUSH BC                    ;0xda77:   c5  "." 
    LD D,11                    ;0xda78:   16 0b  ".."  
    INC BC                     ;0xda7a:   03  "." 
;--------------------------------------
C_DA7B:                        ;          XREF: 0xDA82 
    INC BC                     ;0xda7b:   03  "." 
    LD A,(BC)                  ;0xda7c:   0a  "." 
    CP 0x3f                    ;0xda7d:   fe 3f  ".?" 
    JR z, C_DAEA               ;0xda7f:   28 69  "(i" 
    DEC D                      ;0xda81:   15  "." 
    JR nz, C_DA7B              ;0xda82:   20 f7  " ." 
    POP BC                     ;0xda84:   c1  "." 
    RET                        ;0xda85:   c9  "." 
;--------------------------------------
C_DA86:                        ;          XREF: 0xD51F 
    LD B,0                     ;0xda86:   06 00  ".."  
    CALL C_DAA6                ;0xda88:   cd a6 da  "..." 
    JR C_DA95                  ;0xda8b:   18 08  ".." 
;--------------------------------------
C_DA8D:                        ;          XREF: 0xD493 
    LD C,0x20                  ;0xda8d:   0e 20  ". "  
    LD DE,0xe4                 ;0xda8f:   11 e4 00  "..."  
    CALL C_DAA0                ;0xda92:   cd a0 da  "..." 
;--------------------------------------
C_DA95:                        ;          XREF: 0xDA68 
    LD HL,13                   ;0xda95:   21 0d 00  "!.."  
    ADD HL,BC                  ;0xda98:   09  "." 
    LD (HL),0xff               ;0xda99:   36 ff  "6."  
    INC HL                     ;0xda9b:   23  "#" 
    INC HL                     ;0xda9c:   23  "#" 
    LD (HL),0xff               ;0xda9d:   36 ff  "6."  
    RET                        ;0xda9f:   c9  "." 
;--------------------------------------
C_DAA0:                        ;          XREF: 0xDA74 
    CALL C_DAB6                ;0xdaa0:   cd b6 da  "..." 
    JR z, C_DAEA               ;0xdaa3:   28 45  "(E" 
    RET                        ;0xdaa5:   c9  "." 
;--------------------------------------
C_DAA6:                        ;          XREF: 0xD43C 
    LD C,0x20                  ;0xdaa6:   0e 20  ". "  
    LD DE,0xe4                 ;0xdaa8:   11 e4 00  "..."  
    CALL C_DAB6                ;0xdaab:   cd b6 da  "..." 
    PUSH BC                    ;0xdaae:   c5  "." 
    LD C,11                    ;0xdaaf:   0e 0b  ".."  
    CALL z, C_DB8E             ;0xdab1:   cc 8e db  "..." 
    POP BC                     ;0xdab4:   c1  "." 
    RET                        ;0xdab5:   c9  "." 
;--------------------------------------
C_DAB6:                        ;          XREF: 0xDAA0 
    PUSH HL                    ;0xdab6:   e5  "." 
    CALL C_CA98                ;0xdab7:   cd 98 ca  "..." 
    PUSH DE                    ;0xdaba:   d5  "." 
    LD A,(IY+0)                ;0xdabb:   fd 7e 00  ".~." 
    LD (DE),A                  ;0xdabe:   12  "." 
    INC DE                     ;0xdabf:   13  "." 
    LD A,(IY+1)                ;0xdac0:   fd 7e 01  ".~." 
    LD (DE),A                  ;0xdac3:   12  "." 
    INC DE                     ;0xdac4:   13  "." 
    PUSH BC                    ;0xdac5:   c5  "." 
    LD B,C                     ;0xdac6:   41  "A" 
    LD C,8                     ;0xdac7:   0e 08  ".."  
    CALL C_DB85                ;0xdac9:   cd 85 db  "..." 
    LD A,B                     ;0xdacc:   78  "x" 
    LD C,3                     ;0xdacd:   0e 03  ".."  
    CALL C_DB90                ;0xdacf:   cd 90 db  "..." 
    LD BC,3                    ;0xdad2:   01 03 00  "..."  
    CALL C_CAAF                ;0xdad5:   cd af ca  "..." 
    POP BC                     ;0xdad8:   c1  "." 
    POP DE                     ;0xdad9:   d1  "." 
    POP HL                     ;0xdada:   e1  "." 
    PUSH DE                    ;0xdadb:   d5  "." 
    CALL C_DAED                ;0xdadc:   cd ed da  "..." 
    POP DE                     ;0xdadf:   d1  "." 
    JR nc, C_DAEA              ;0xdae0:   30 08  "0." 
    LD B,D                     ;0xdae2:   42  "B" 
    LD C,E                     ;0xdae3:   4b  "K" 
    INC DE                     ;0xdae4:   13  "." 
    INC DE                     ;0xdae5:   13  "." 
    LD A,(DE)                  ;0xdae6:   1a  "." 
    CP 0x20                    ;0xdae7:   fe 20  ". " 
    RET                        ;0xdae9:   c9  "." 
;--------------------------------------
C_DAEA:                        ;          XREF: 0xDA7F 
    JP C_CDAF                  ;0xdaea:   c3 af cd  "..." 
;--------------------------------------
C_DAED:                        ;          XREF: 0xDADC 
    DEC HL                     ;0xdaed:   2b  "+" 
    CALL C_DB97                ;0xdaee:   cd 97 db  "..." 
    CCF                        ;0xdaf1:   3f  "?" 
    RET c                      ;0xdaf2:   d8  "." 
    LD C,A                     ;0xdaf3:   4f  "O" 
    PUSH HL                    ;0xdaf4:   e5  "." 
    PUSH BC                    ;0xdaf5:   c5  "." 
;--------------------------------------
C_DAF6:                        ;          XREF: 0xDAFD 
    CP 0x3a                    ;0xdaf6:   fe 3a  ".:" 
    JR z, C_DB00               ;0xdaf8:   28 06  "(." 
    CALL C_DBA5                ;0xdafa:   cd a5 db  "..." 
    JR c, C_DAF6               ;0xdafd:   38 f7  "8." 
    SCF                        ;0xdaff:   37  "7" 
;--------------------------------------
C_DB00:                        ;          XREF: 0xDAF8 
    POP BC                     ;0xdb00:   c1  "." 
    POP HL                     ;0xdb01:   e1  "." 
    LD A,C                     ;0xdb02:   79  "y" 
    JR c, C_DB43               ;0xdb03:   38 3e  "8>" 
    INC DE                     ;0xdb05:   13  "." 
    CP 0x30                    ;0xdb06:   fe 30  ".0" 
    JR c, C_DB29               ;0xdb08:   38 1f  "8." 
    CP 0x3a                    ;0xdb0a:   fe 3a  ".:" 
    JR nc, C_DB29              ;0xdb0c:   30 1b  "0." 
    SUB 0x30                   ;0xdb0e:   d6 30  ".0" 
    LD C,A                     ;0xdb10:   4f  "O" 
    LD (DE),A                  ;0xdb11:   12  "." 
    CALL C_DBA5                ;0xdb12:   cd a5 db  "..." 
    CP 0x30                    ;0xdb15:   fe 30  ".0" 
    JR c, C_DB29               ;0xdb17:   38 10  "8." 
    CP 0x3a                    ;0xdb19:   fe 3a  ".:" 
    JR nc, C_DB29              ;0xdb1b:   30 0c  "0." 
    OR A                       ;0xdb1d:   b7  "." 
    DEC C                      ;0xdb1e:   0d  "." 
    RET nz                     ;0xdb1f:   c0  "." 
    ADD A,0xda                 ;0xdb20:   c6 da  ".." 
    CP 0x10                    ;0xdb22:   fe 10  ".." 
    RET nc                     ;0xdb24:   d0  "." 
    LD (DE),A                  ;0xdb25:   12  "." 
    CALL C_DBA5                ;0xdb26:   cd a5 db  "..." 
;--------------------------------------
C_DB29:                        ;          XREF: 0xDB08 
    DEC DE                     ;0xdb29:   1b  "." 
    CP 0x51                    ;0xdb2a:   fe 51  ".Q" 
    JR nc, C_DB38              ;0xdb2c:   30 0a  "0." 
    CP 0x41                    ;0xdb2e:   fe 41  ".A" 
    JR c, C_DB38               ;0xdb30:   38 06  "8." 
    SUB 0x41                   ;0xdb32:   d6 41  ".A" 
    LD (DE),A                  ;0xdb34:   12  "." 
    CALL C_DBA5                ;0xdb35:   cd a5 db  "..." 
;--------------------------------------
C_DB38:                        ;          XREF: 0xDB2C 
    CALL C_DB9B                ;0xdb38:   cd 9b db  "..." 
    XOR 0x3a                   ;0xdb3b:   ee 3a  ".:" 
    RET nz                     ;0xdb3d:   c0  "." 
    CALL C_DB97                ;0xdb3e:   cd 97 db  "..." 
    CCF                        ;0xdb41:   3f  "?" 
    RET c                      ;0xdb42:   d8  "." 
;--------------------------------------
C_DB43:                        ;          XREF: 0xDB03 
    INC DE                     ;0xdb43:   13  "." 
    INC DE                     ;0xdb44:   13  "." 
    CP 0x2e                    ;0xdb45:   fe 2e  ".." 
    RET z                      ;0xdb47:   c8  "." 
    LD C,8                     ;0xdb48:   0e 08  ".."  
    CALL C_DB58                ;0xdb4a:   cd 58 db  ".X." 
    RET c                      ;0xdb4d:   d8  "." 
    XOR 0x2e                   ;0xdb4e:   ee 2e  ".." 
    RET nz                     ;0xdb50:   c0  "." 
    CALL C_DB97                ;0xdb51:   cd 97 db  "..." 
    LD C,3                     ;0xdb54:   0e 03  ".."  
    JR nc, C_DB85              ;0xdb56:   30 2d  "0-" 
;--------------------------------------
C_DB58:                        ;          XREF: 0xDB4A 
    CP 0x20                    ;0xdb58:   fe 20  ". " 
    JR c, C_DB85               ;0xdb5a:   38 29  "8)" 
    PUSH HL                    ;0xdb5c:   e5  "." 
    PUSH BC                    ;0xdb5d:   c5  "." 
    LD B,A                     ;0xdb5e:   47  "G" 
    LD HL,D_DBB2               ;0xdb5f:   21 b2 db  "!.."  
;--------------------------------------
C_DB62:                        ;          XREF: 0xDB68 
    LD A,(HL)                  ;0xdb62:   7e  "~" 
    INC HL                     ;0xdb63:   23  "#" 
    OR A                       ;0xdb64:   b7  "." 
    JR z, C_DB6B               ;0xdb65:   28 04  "(." 
    CP B                       ;0xdb67:   b8  "." 
    JR nz, C_DB62              ;0xdb68:   20 f8  " ." 
    SCF                        ;0xdb6a:   37  "7" 
;--------------------------------------
C_DB6B:                        ;          XREF: 0xDB65 
    LD A,B                     ;0xdb6b:   78  "x" 
    POP BC                     ;0xdb6c:   c1  "." 
    POP HL                     ;0xdb6d:   e1  "." 
    JR c, C_DB85               ;0xdb6e:   38 15  "8." 
    DEC C                      ;0xdb70:   0d  "." 
    RET m                      ;0xdb71:   f8  "." 
    CP 0x2a                    ;0xdb72:   fe 2a  ".*" 
    CALL z, C_DB8E             ;0xdb74:   cc 8e db  "..." 
    LD (DE),A                  ;0xdb77:   12  "." 
    INC DE                     ;0xdb78:   13  "." 
    CALL C_DBA5                ;0xdb79:   cd a5 db  "..." 
    JR nc, C_DB85              ;0xdb7c:   30 07  "0." 
    CP 0x20                    ;0xdb7e:   fe 20  ". " 
    JR nz, C_DB58              ;0xdb80:   20 d6  " ." 
    CALL C_DB9B                ;0xdb82:   cd 9b db  "..." 
;--------------------------------------
C_DB85:                        ;          XREF: 0xDAC9 
    PUSH AF                    ;0xdb85:   f5  "." 
    LD A,0x20                  ;0xdb86:   3e 20  "> "  
    CALL C_DB90                ;0xdb88:   cd 90 db  "..." 
    POP AF                     ;0xdb8b:   f1  "." 
    CCF                        ;0xdb8c:   3f  "?" 
    RET                        ;0xdb8d:   c9  "." 
;--------------------------------------
C_DB8E:                        ;          XREF: 0xDAB1 
    LD A,0x3f                  ;0xdb8e:   3e 3f  ">?"  
;--------------------------------------
C_DB90:                        ;          XREF: 0xDACF 
    INC C                      ;0xdb90:   0c  "." 
;--------------------------------------
C_DB91:                        ;          XREF: 0xDB95 
    DEC C                      ;0xdb91:   0d  "." 
    RET z                      ;0xdb92:   c8  "." 
    LD (DE),A                  ;0xdb93:   12  "." 
    INC DE                     ;0xdb94:   13  "." 
    JR C_DB91                  ;0xdb95:   18 fa  ".." 
;--------------------------------------
C_DB97:                        ;          XREF: 0xDAEE 
    CALL C_DBA5                ;0xdb97:   cd a5 db  "..." 
    RET nc                     ;0xdb9a:   d0  "." 
;--------------------------------------
C_DB9B:                        ;          XREF: 0xDB38 
    CP 0x20                    ;0xdb9b:   fe 20  ". " 
    SCF                        ;0xdb9d:   37  "7" 
    RET nz                     ;0xdb9e:   c0  "." 
    CALL C_DBA5                ;0xdb9f:   cd a5 db  "..." 
    JR c, C_DB9B               ;0xdba2:   38 f7  "8." 
    RET                        ;0xdba4:   c9  "." 
;--------------------------------------
C_DBA5:                        ;          XREF: 0xDAFA 
    LD A,B                     ;0xdba5:   78  "x" 
    OR A                       ;0xdba6:   b7  "." 
    RET z                      ;0xdba7:   c8  "." 
    INC HL                     ;0xdba8:   23  "#" 
    DEC B                      ;0xdba9:   05  "." 
    RST 0x20                   ;0xdbaa:   e7  "." 
    AND 0x7f                   ;0xdbab:   e6 7f  ".." 
    CALL C_CAA6                ;0xdbad:   cd a6 ca  "..." 
    SCF                        ;0xdbb0:   37  "7" 
    RET                        ;0xdbb1:   c9  "." 
;--------------------------------------
D_DBB2:                        ;          XREF: 0xDB5F 
    x9 DEFB 0x3c               ;0xdbb2:   "<"
    x9 DEFB 0x3e               ;0xdbb3:   ">"
    x9 DEFB 0x2e               ;0xdbb4:   "."
    x9 DEFB 0x2c               ;0xdbb5:   ","
    x9 DEFB 0x3b               ;0xdbb6:   ";"
    x9 DEFB 0x3a               ;0xdbb7:   ":"
    x9 DEFB 0x3d               ;0xdbb8:   "="
    x9 DEFB 0x5b               ;0xdbb9:   "["
    x9 DEFB 0x5d               ;0xdbba:   "]"
    x9 DEFB 0x5f               ;0xdbbb:   "_"
    x9 DEFB 0x25               ;0xdbbc:   "%"
    x9 DEFB 0x7c               ;0xdbbd:   "|"
    x9 DEFB 0x28               ;0xdbbe:   "("
    x9 DEFB 0x29               ;0xdbbf:   ")"
    x9 DEFB 0x2f               ;0xdbc0:   "/"
    x9 DEFB 0x5c               ;0xdbc1:   "\"
    x9 DEFB 0x7f               ;0xdbc2:   0x7f
    x9 DEFB 0x0                ;0xdbc3:   0x0
;--------------------------------------
C_DBC4:                        ;          XREF: 0xD45D 
    LD A,1                     ;0xdbc4:   3e 01  ">."  
    JR C_DBCA                  ;0xdbc6:   18 02  ".." 
;--------------------------------------
C_DBC8:                        ;          XREF: 0xD463 
    LD A,11                    ;0xdbc8:   3e 0b  ">."  
;--------------------------------------
C_DBCA:                        ;          XREF: 0xCDB1 
    PUSH BC                    ;0xdbca:   c5  "." 
    LD C,(IY+2)                ;0xdbcb:   fd 4e 02  ".N." 
    JR C_DBDA                  ;0xdbce:   18 0a  ".." 
;--------------------------------------
C_DBD0:                        ;          XREF: 0xD442 
    PUSH BC                    ;0xdbd0:   c5  "." 
    LD A,(BC)                  ;0xdbd1:   0a  "." 
    LD E,A                     ;0xdbd2:   5f  "_" 
    LD D,0                     ;0xdbd3:   16 00  ".."  
    DEC BC                     ;0xdbd5:   0b  "." 
    LD A,(BC)                  ;0xdbd6:   0a  "." 
    LD C,A                     ;0xdbd7:   4f  "O" 
    LD A,12                    ;0xdbd8:   3e 0c  ">."  
;--------------------------------------
C_DBDA:                        ;          XREF: 0xDBCE 
    CALL C_CAEB                ;0xdbda:   cd eb ca  "..." 
    POP BC                     ;0xdbdd:   c1  "." 
    RET                        ;0xdbde:   c9  "." 
;--------------------------------------
C_DBDF:                        ;          XREF: 0xD423 
    PUSH HL                    ;0xdbdf:   e5  "." 
    PUSH DE                    ;0xdbe0:   d5  "." 
    PUSH BC                    ;0xdbe1:   c5  "." 
    LD BC,0x20                 ;0xdbe2:   01 20 00  ". ."  
    LDIR                       ;0xdbe5:   ed b0  ".." 
    POP BC                     ;0xdbe7:   c1  "." 
    POP DE                     ;0xdbe8:   d1  "." 
;--------------------------------------
C_DBE9:                        ;          XREF: 0xDBBE 
    POP HL                     ;0xdbe9:   e1  "." 
    RET                        ;0xdbea:   c9  "." 
;--------------------------------------
C_DBEB:                        ;          XREF: 0xD014 
    SRL H                      ;0xdbeb:   cb 3c  ".<" 
    RR L                       ;0xdbed:   cb 1d  ".." 
    DEC A                      ;0xdbef:   3d  "=" 
    JR nz, C_DBEB              ;0xdbf0:   20 f9  " ." 
    RET                        ;0xdbf2:   c9  "." 
;--------------------------------------
C_DBF3:                        ;          XREF: 0xCE0A 
    PUSH HL                    ;0xdbf3:   e5  "." 
    OR A                       ;0xdbf4:   b7  "." 
    SBC HL,DE                  ;0xdbf5:   ed 52  ".R" 
    POP HL                     ;0xdbf7:   e1  "." 
    RET                        ;0xdbf8:   c9  "." 
;--------------------------------------
C_DBF9:                        ;          XREF: 0xCDCC 
    PUSH DE                    ;0xdbf9:   d5  "." 
    LD E,(HL)                  ;0xdbfa:   5e  "^" 
    INC HL                     ;0xdbfb:   23  "#" 
    LD D,(HL)                  ;0xdbfc:   56  "V" 
    EX DE,HL                   ;0xdbfd:   eb  "." 
    POP DE                     ;0xdbfe:   d1  "." 
    RET                        ;0xdbff:   c9  "." 
    RST 0x38                   ;0xdc00:   ff  "." 
    RST 0x38                   ;0xdc01:   ff  "." 
    RST 0x38                   ;0xdc02:   ff  "." 
    RST 0x38                   ;0xdc03:   ff  "." 
    RST 0x38                   ;0xdc04:   ff  "." 
    RST 0x38                   ;0xdc05:   ff  "." 
    RST 0x38                   ;0xdc06:   ff  "." 
    RST 0x38                   ;0xdc07:   ff  "." 
    RST 0x38                   ;0xdc08:   ff  "." 
    RST 0x38                   ;0xdc09:   ff  "." 
    RST 0x38                   ;0xdc0a:   ff  "." 
    RST 0x38                   ;0xdc0b:   ff  "." 
    RST 0x38                   ;0xdc0c:   ff  "." 
    RST 0x38                   ;0xdc0d:   ff  "." 
    RST 0x38                   ;0xdc0e:   ff  "." 
    RST 0x38                   ;0xdc0f:   ff  "." 
    RST 0x38                   ;0xdc10:   ff  "." 
    RST 0x38                   ;0xdc11:   ff  "." 
    RST 0x38                   ;0xdc12:   ff  "." 
    RST 0x38                   ;0xdc13:   ff  "." 
    RST 0x38                   ;0xdc14:   ff  "." 
    RST 0x38                   ;0xdc15:   ff  "." 
    RST 0x38                   ;0xdc16:   ff  "." 
    RST 0x38                   ;0xdc17:   ff  "." 
    RST 0x38                   ;0xdc18:   ff  "." 
    RST 0x38                   ;0xdc19:   ff  "." 
    RST 0x38                   ;0xdc1a:   ff  "." 
    RST 0x38                   ;0xdc1b:   ff  "." 
    RST 0x38                   ;0xdc1c:   ff  "." 
    RST 0x38                   ;0xdc1d:   ff  "." 
    RST 0x38                   ;0xdc1e:   ff  "." 
    RST 0x38                   ;0xdc1f:   ff  "." 
    RST 0x38                   ;0xdc20:   ff  "." 
    RST 0x38                   ;0xdc21:   ff  "." 
    RST 0x38                   ;0xdc22:   ff  "." 
    RST 0x38                   ;0xdc23:   ff  "." 
    RST 0x38                   ;0xdc24:   ff  "." 
    RST 0x38                   ;0xdc25:   ff  "." 
    RST 0x38                   ;0xdc26:   ff  "." 
    RST 0x38                   ;0xdc27:   ff  "." 
    RST 0x38                   ;0xdc28:   ff  "." 
    RST 0x38                   ;0xdc29:   ff  "." 
    RST 0x38                   ;0xdc2a:   ff  "." 
    RST 0x38                   ;0xdc2b:   ff  "." 
    RST 0x38                   ;0xdc2c:   ff  "." 
    RST 0x38                   ;0xdc2d:   ff  "." 
    RST 0x38                   ;0xdc2e:   ff  "." 
    RST 0x38                   ;0xdc2f:   ff  "." 
    RST 0x38                   ;0xdc30:   ff  "." 
    RST 0x38                   ;0xdc31:   ff  "." 
    RST 0x38                   ;0xdc32:   ff  "." 
    RST 0x38                   ;0xdc33:   ff  "." 
    RST 0x38                   ;0xdc34:   ff  "." 
    RST 0x38                   ;0xdc35:   ff  "." 
    RST 0x38                   ;0xdc36:   ff  "." 
    RST 0x38                   ;0xdc37:   ff  "." 
    RST 0x38                   ;0xdc38:   ff  "." 
    RST 0x38                   ;0xdc39:   ff  "." 
    RST 0x38                   ;0xdc3a:   ff  "." 
    RST 0x38                   ;0xdc3b:   ff  "." 
    RST 0x38                   ;0xdc3c:   ff  "." 
    RST 0x38                   ;0xdc3d:   ff  "." 
    RST 0x38                   ;0xdc3e:   ff  "." 
    RST 0x38                   ;0xdc3f:   ff  "." 
    RST 0x38                   ;0xdc40:   ff  "." 
    RST 0x38                   ;0xdc41:   ff  "." 
    RST 0x38                   ;0xdc42:   ff  "." 
    RST 0x38                   ;0xdc43:   ff  "." 
    RST 0x38                   ;0xdc44:   ff  "." 
    RST 0x38                   ;0xdc45:   ff  "." 
    RST 0x38                   ;0xdc46:   ff  "." 
    RST 0x38                   ;0xdc47:   ff  "." 
    RST 0x38                   ;0xdc48:   ff  "." 
    RST 0x38                   ;0xdc49:   ff  "." 
    RST 0x38                   ;0xdc4a:   ff  "." 
    RST 0x38                   ;0xdc4b:   ff  "." 
    RST 0x38                   ;0xdc4c:   ff  "." 
    RST 0x38                   ;0xdc4d:   ff  "." 
    RST 0x38                   ;0xdc4e:   ff  "." 
    RST 0x38                   ;0xdc4f:   ff  "." 
    RST 0x38                   ;0xdc50:   ff  "." 
    RST 0x38                   ;0xdc51:   ff  "." 
    RST 0x38                   ;0xdc52:   ff  "." 
    RST 0x38                   ;0xdc53:   ff  "." 
    RST 0x38                   ;0xdc54:   ff  "." 
    RST 0x38                   ;0xdc55:   ff  "." 
    RST 0x38                   ;0xdc56:   ff  "." 
    RST 0x38                   ;0xdc57:   ff  "." 
    RST 0x38                   ;0xdc58:   ff  "." 
    RST 0x38                   ;0xdc59:   ff  "." 
    RST 0x38                   ;0xdc5a:   ff  "." 
    RST 0x38                   ;0xdc5b:   ff  "." 
    RST 0x38                   ;0xdc5c:   ff  "." 
    RST 0x38                   ;0xdc5d:   ff  "." 
    RST 0x38                   ;0xdc5e:   ff  "." 
    RST 0x38                   ;0xdc5f:   ff  "." 
    RST 0x38                   ;0xdc60:   ff  "." 
    RST 0x38                   ;0xdc61:   ff  "." 
    RST 0x38                   ;0xdc62:   ff  "." 
    RST 0x38                   ;0xdc63:   ff  "." 
    RST 0x38                   ;0xdc64:   ff  "." 
    RST 0x38                   ;0xdc65:   ff  "." 
    RST 0x38                   ;0xdc66:   ff  "." 
    RST 0x38                   ;0xdc67:   ff  "." 
    RST 0x38                   ;0xdc68:   ff  "." 
    RST 0x38                   ;0xdc69:   ff  "." 
    RST 0x38                   ;0xdc6a:   ff  "." 
    RST 0x38                   ;0xdc6b:   ff  "." 
    RST 0x38                   ;0xdc6c:   ff  "." 
    RST 0x38                   ;0xdc6d:   ff  "." 
    RST 0x38                   ;0xdc6e:   ff  "." 
    RST 0x38                   ;0xdc6f:   ff  "." 
    RST 0x38                   ;0xdc70:   ff  "." 
    RST 0x38                   ;0xdc71:   ff  "." 
    RST 0x38                   ;0xdc72:   ff  "." 
    RST 0x38                   ;0xdc73:   ff  "." 
    RST 0x38                   ;0xdc74:   ff  "." 
    RST 0x38                   ;0xdc75:   ff  "." 
    RST 0x38                   ;0xdc76:   ff  "." 
    RST 0x38                   ;0xdc77:   ff  "." 
    RST 0x38                   ;0xdc78:   ff  "." 
    RST 0x38                   ;0xdc79:   ff  "." 
    RST 0x38                   ;0xdc7a:   ff  "." 
    RST 0x38                   ;0xdc7b:   ff  "." 
    RST 0x38                   ;0xdc7c:   ff  "." 
    RST 0x38                   ;0xdc7d:   ff  "." 
    RST 0x38                   ;0xdc7e:   ff  "." 
    RST 0x38                   ;0xdc7f:   ff  "." 
    RST 0x38                   ;0xdc80:   ff  "." 
    RST 0x38                   ;0xdc81:   ff  "." 
    RST 0x38                   ;0xdc82:   ff  "." 
    RST 0x38                   ;0xdc83:   ff  "." 
    RST 0x38                   ;0xdc84:   ff  "." 
    RST 0x38                   ;0xdc85:   ff  "." 
    RST 0x38                   ;0xdc86:   ff  "." 
    RST 0x38                   ;0xdc87:   ff  "." 
    RST 0x38                   ;0xdc88:   ff  "." 
    RST 0x38                   ;0xdc89:   ff  "." 
    RST 0x38                   ;0xdc8a:   ff  "." 
    RST 0x38                   ;0xdc8b:   ff  "." 
    RST 0x38                   ;0xdc8c:   ff  "." 
    RST 0x38                   ;0xdc8d:   ff  "." 
    RST 0x38                   ;0xdc8e:   ff  "." 
    RST 0x38                   ;0xdc8f:   ff  "." 
    RST 0x38                   ;0xdc90:   ff  "." 
    RST 0x38                   ;0xdc91:   ff  "." 
    RST 0x38                   ;0xdc92:   ff  "." 
    RST 0x38                   ;0xdc93:   ff  "." 
    RST 0x38                   ;0xdc94:   ff  "." 
    RST 0x38                   ;0xdc95:   ff  "." 
    RST 0x38                   ;0xdc96:   ff  "." 
    RST 0x38                   ;0xdc97:   ff  "." 
    RST 0x38                   ;0xdc98:   ff  "." 
    RST 0x38                   ;0xdc99:   ff  "." 
    RST 0x38                   ;0xdc9a:   ff  "." 
    RST 0x38                   ;0xdc9b:   ff  "." 
    RST 0x38                   ;0xdc9c:   ff  "." 
    RST 0x38                   ;0xdc9d:   ff  "." 
    RST 0x38                   ;0xdc9e:   ff  "." 
    RST 0x38                   ;0xdc9f:   ff  "." 
    RST 0x38                   ;0xdca0:   ff  "." 
    RST 0x38                   ;0xdca1:   ff  "." 
    RST 0x38                   ;0xdca2:   ff  "." 
    RST 0x38                   ;0xdca3:   ff  "." 
    RST 0x38                   ;0xdca4:   ff  "." 
    RST 0x38                   ;0xdca5:   ff  "." 
    RST 0x38                   ;0xdca6:   ff  "." 
    RST 0x38                   ;0xdca7:   ff  "." 
    RST 0x38                   ;0xdca8:   ff  "." 
    RST 0x38                   ;0xdca9:   ff  "." 
    RST 0x38                   ;0xdcaa:   ff  "." 
    RST 0x38                   ;0xdcab:   ff  "." 
    RST 0x38                   ;0xdcac:   ff  "." 
    RST 0x38                   ;0xdcad:   ff  "." 
    RST 0x38                   ;0xdcae:   ff  "." 
    RST 0x38                   ;0xdcaf:   ff  "." 
    RST 0x38                   ;0xdcb0:   ff  "." 
    RST 0x38                   ;0xdcb1:   ff  "." 
    RST 0x38                   ;0xdcb2:   ff  "." 
    RST 0x38                   ;0xdcb3:   ff  "." 
    RST 0x38                   ;0xdcb4:   ff  "." 
    RST 0x38                   ;0xdcb5:   ff  "." 
    RST 0x38                   ;0xdcb6:   ff  "." 
    RST 0x38                   ;0xdcb7:   ff  "." 
    RST 0x38                   ;0xdcb8:   ff  "." 
    RST 0x38                   ;0xdcb9:   ff  "." 
    RST 0x38                   ;0xdcba:   ff  "." 
    RST 0x38                   ;0xdcbb:   ff  "." 
    RST 0x38                   ;0xdcbc:   ff  "." 
    RST 0x38                   ;0xdcbd:   ff  "." 
    RST 0x38                   ;0xdcbe:   ff  "." 
    RST 0x38                   ;0xdcbf:   ff  "." 
    RST 0x38                   ;0xdcc0:   ff  "." 
    RST 0x38                   ;0xdcc1:   ff  "." 
    RST 0x38                   ;0xdcc2:   ff  "." 
    RST 0x38                   ;0xdcc3:   ff  "." 
    RST 0x38                   ;0xdcc4:   ff  "." 
    RST 0x38                   ;0xdcc5:   ff  "." 
    RST 0x38                   ;0xdcc6:   ff  "." 
    RST 0x38                   ;0xdcc7:   ff  "." 
    RST 0x38                   ;0xdcc8:   ff  "." 
    RST 0x38                   ;0xdcc9:   ff  "." 
    RST 0x38                   ;0xdcca:   ff  "." 
    RST 0x38                   ;0xdccb:   ff  "." 
    RST 0x38                   ;0xdccc:   ff  "." 
    RST 0x38                   ;0xdccd:   ff  "." 
    RST 0x38                   ;0xdcce:   ff  "." 
    RST 0x38                   ;0xdccf:   ff  "." 
    RST 0x38                   ;0xdcd0:   ff  "." 
    RST 0x38                   ;0xdcd1:   ff  "." 
    RST 0x38                   ;0xdcd2:   ff  "." 
    RST 0x38                   ;0xdcd3:   ff  "." 
    RST 0x38                   ;0xdcd4:   ff  "." 
    RST 0x38                   ;0xdcd5:   ff  "." 
    RST 0x38                   ;0xdcd6:   ff  "." 
    RST 0x38                   ;0xdcd7:   ff  "." 
    RST 0x38                   ;0xdcd8:   ff  "." 
    RST 0x38                   ;0xdcd9:   ff  "." 
    RST 0x38                   ;0xdcda:   ff  "." 
    RST 0x38                   ;0xdcdb:   ff  "." 
    RST 0x38                   ;0xdcdc:   ff  "." 
    RST 0x38                   ;0xdcdd:   ff  "." 
    RST 0x38                   ;0xdcde:   ff  "." 
    RST 0x38                   ;0xdcdf:   ff  "." 
    RST 0x38                   ;0xdce0:   ff  "." 
    RST 0x38                   ;0xdce1:   ff  "." 
    RST 0x38                   ;0xdce2:   ff  "." 
    RST 0x38                   ;0xdce3:   ff  "." 
    RST 0x38                   ;0xdce4:   ff  "." 
    RST 0x38                   ;0xdce5:   ff  "." 
    RST 0x38                   ;0xdce6:   ff  "." 
    RST 0x38                   ;0xdce7:   ff  "." 
    RST 0x38                   ;0xdce8:   ff  "." 
    RST 0x38                   ;0xdce9:   ff  "." 
    RST 0x38                   ;0xdcea:   ff  "." 
    RST 0x38                   ;0xdceb:   ff  "." 
    RST 0x38                   ;0xdcec:   ff  "." 
    RST 0x38                   ;0xdced:   ff  "." 
    RST 0x38                   ;0xdcee:   ff  "." 
    RST 0x38                   ;0xdcef:   ff  "." 
    RST 0x38                   ;0xdcf0:   ff  "." 
    RST 0x38                   ;0xdcf1:   ff  "." 
    RST 0x38                   ;0xdcf2:   ff  "." 
    RST 0x38                   ;0xdcf3:   ff  "." 
    RST 0x38                   ;0xdcf4:   ff  "." 
    RST 0x38                   ;0xdcf5:   ff  "." 
    RST 0x38                   ;0xdcf6:   ff  "." 
    RST 0x38                   ;0xdcf7:   ff  "." 
    RST 0x38                   ;0xdcf8:   ff  "." 
    RST 0x38                   ;0xdcf9:   ff  "." 
    RST 0x38                   ;0xdcfa:   ff  "." 
    RST 0x38                   ;0xdcfb:   ff  "." 
    RST 0x38                   ;0xdcfc:   ff  "." 
    RST 0x38                   ;0xdcfd:   ff  "." 
    RST 0x38                   ;0xdcfe:   ff  "." 
    RST 0x38                   ;0xdcff:   ff  "." 
    RST 0x38                   ;0xdd00:   ff  "." 
    RST 0x38                   ;0xdd01:   ff  "." 
    RST 0x38                   ;0xdd02:   ff  "." 
    RST 0x38                   ;0xdd03:   ff  "." 
    RST 0x38                   ;0xdd04:   ff  "." 
    RST 0x38                   ;0xdd05:   ff  "." 
    RST 0x38                   ;0xdd06:   ff  "." 
    RST 0x38                   ;0xdd07:   ff  "." 
    RST 0x38                   ;0xdd08:   ff  "." 
    RST 0x38                   ;0xdd09:   ff  "." 
    RST 0x38                   ;0xdd0a:   ff  "." 
    RST 0x38                   ;0xdd0b:   ff  "." 
    RST 0x38                   ;0xdd0c:   ff  "." 
    RST 0x38                   ;0xdd0d:   ff  "." 
    RST 0x38                   ;0xdd0e:   ff  "." 
    RST 0x38                   ;0xdd0f:   ff  "." 
    RST 0x38                   ;0xdd10:   ff  "." 
    RST 0x38                   ;0xdd11:   ff  "." 
    RST 0x38                   ;0xdd12:   ff  "." 
    RST 0x38                   ;0xdd13:   ff  "." 
    RST 0x38                   ;0xdd14:   ff  "." 
    RST 0x38                   ;0xdd15:   ff  "." 
    RST 0x38                   ;0xdd16:   ff  "." 
    RST 0x38                   ;0xdd17:   ff  "." 
    RST 0x38                   ;0xdd18:   ff  "." 
    RST 0x38                   ;0xdd19:   ff  "." 
    RST 0x38                   ;0xdd1a:   ff  "." 
    RST 0x38                   ;0xdd1b:   ff  "." 
    RST 0x38                   ;0xdd1c:   ff  "." 
    RST 0x38                   ;0xdd1d:   ff  "." 
    RST 0x38                   ;0xdd1e:   ff  "." 
    RST 0x38                   ;0xdd1f:   ff  "." 
    RST 0x38                   ;0xdd20:   ff  "." 
    RST 0x38                   ;0xdd21:   ff  "." 
    RST 0x38                   ;0xdd22:   ff  "." 
    RST 0x38                   ;0xdd23:   ff  "." 
    RST 0x38                   ;0xdd24:   ff  "." 
    RST 0x38                   ;0xdd25:   ff  "." 
    RST 0x38                   ;0xdd26:   ff  "." 
    RST 0x38                   ;0xdd27:   ff  "." 
    RST 0x38                   ;0xdd28:   ff  "." 
    RST 0x38                   ;0xdd29:   ff  "." 
    RST 0x38                   ;0xdd2a:   ff  "." 
    RST 0x38                   ;0xdd2b:   ff  "." 
    RST 0x38                   ;0xdd2c:   ff  "." 
    RST 0x38                   ;0xdd2d:   ff  "." 
    RST 0x38                   ;0xdd2e:   ff  "." 
    RST 0x38                   ;0xdd2f:   ff  "." 
    RST 0x38                   ;0xdd30:   ff  "." 
    RST 0x38                   ;0xdd31:   ff  "." 
    RST 0x38                   ;0xdd32:   ff  "." 
    RST 0x38                   ;0xdd33:   ff  "." 
    RST 0x38                   ;0xdd34:   ff  "." 
    RST 0x38                   ;0xdd35:   ff  "." 
    RST 0x38                   ;0xdd36:   ff  "." 
    RST 0x38                   ;0xdd37:   ff  "." 
    RST 0x38                   ;0xdd38:   ff  "." 
    RST 0x38                   ;0xdd39:   ff  "." 
    RST 0x38                   ;0xdd3a:   ff  "." 
    RST 0x38                   ;0xdd3b:   ff  "." 
    RST 0x38                   ;0xdd3c:   ff  "." 
    RST 0x38                   ;0xdd3d:   ff  "." 
    RST 0x38                   ;0xdd3e:   ff  "." 
    RST 0x38                   ;0xdd3f:   ff  "." 
    RST 0x38                   ;0xdd40:   ff  "." 
    RST 0x38                   ;0xdd41:   ff  "." 
    RST 0x38                   ;0xdd42:   ff  "." 
    RST 0x38                   ;0xdd43:   ff  "." 
    RST 0x38                   ;0xdd44:   ff  "." 
    RST 0x38                   ;0xdd45:   ff  "." 
    RST 0x38                   ;0xdd46:   ff  "." 
    RST 0x38                   ;0xdd47:   ff  "." 
    RST 0x38                   ;0xdd48:   ff  "." 
    RST 0x38                   ;0xdd49:   ff  "." 
    RST 0x38                   ;0xdd4a:   ff  "." 
    RST 0x38                   ;0xdd4b:   ff  "." 
    RST 0x38                   ;0xdd4c:   ff  "." 
    RST 0x38                   ;0xdd4d:   ff  "." 
    RST 0x38                   ;0xdd4e:   ff  "." 
    RST 0x38                   ;0xdd4f:   ff  "." 
    RST 0x38                   ;0xdd50:   ff  "." 
    RST 0x38                   ;0xdd51:   ff  "." 
    RST 0x38                   ;0xdd52:   ff  "." 
    RST 0x38                   ;0xdd53:   ff  "." 
    RST 0x38                   ;0xdd54:   ff  "." 
    RST 0x38                   ;0xdd55:   ff  "." 
    RST 0x38                   ;0xdd56:   ff  "." 
    RST 0x38                   ;0xdd57:   ff  "." 
    RST 0x38                   ;0xdd58:   ff  "." 
    RST 0x38                   ;0xdd59:   ff  "." 
    RST 0x38                   ;0xdd5a:   ff  "." 
    RST 0x38                   ;0xdd5b:   ff  "." 
    RST 0x38                   ;0xdd5c:   ff  "." 
    RST 0x38                   ;0xdd5d:   ff  "." 
    RST 0x38                   ;0xdd5e:   ff  "." 
    RST 0x38                   ;0xdd5f:   ff  "." 
    RST 0x38                   ;0xdd60:   ff  "." 
    RST 0x38                   ;0xdd61:   ff  "." 
    RST 0x38                   ;0xdd62:   ff  "." 
    RST 0x38                   ;0xdd63:   ff  "." 
    RST 0x38                   ;0xdd64:   ff  "." 
    RST 0x38                   ;0xdd65:   ff  "." 
    RST 0x38                   ;0xdd66:   ff  "." 
    RST 0x38                   ;0xdd67:   ff  "." 
    RST 0x38                   ;0xdd68:   ff  "." 
    RST 0x38                   ;0xdd69:   ff  "." 
    RST 0x38                   ;0xdd6a:   ff  "." 
    RST 0x38                   ;0xdd6b:   ff  "." 
    RST 0x38                   ;0xdd6c:   ff  "." 
    RST 0x38                   ;0xdd6d:   ff  "." 
    RST 0x38                   ;0xdd6e:   ff  "." 
    RST 0x38                   ;0xdd6f:   ff  "." 
    RST 0x38                   ;0xdd70:   ff  "." 
    RST 0x38                   ;0xdd71:   ff  "." 
    RST 0x38                   ;0xdd72:   ff  "." 
    RST 0x38                   ;0xdd73:   ff  "." 
    RST 0x38                   ;0xdd74:   ff  "." 
    RST 0x38                   ;0xdd75:   ff  "." 
    RST 0x38                   ;0xdd76:   ff  "." 
    RST 0x38                   ;0xdd77:   ff  "." 
    RST 0x38                   ;0xdd78:   ff  "." 
    RST 0x38                   ;0xdd79:   ff  "." 
    RST 0x38                   ;0xdd7a:   ff  "." 
    RST 0x38                   ;0xdd7b:   ff  "." 
    RST 0x38                   ;0xdd7c:   ff  "." 
    RST 0x38                   ;0xdd7d:   ff  "." 
    RST 0x38                   ;0xdd7e:   ff  "." 
    RST 0x38                   ;0xdd7f:   ff  "." 
    RST 0x38                   ;0xdd80:   ff  "." 
    RST 0x38                   ;0xdd81:   ff  "." 
    RST 0x38                   ;0xdd82:   ff  "." 
    RST 0x38                   ;0xdd83:   ff  "." 
    RST 0x38                   ;0xdd84:   ff  "." 
    RST 0x38                   ;0xdd85:   ff  "." 
    RST 0x38                   ;0xdd86:   ff  "." 
    RST 0x38                   ;0xdd87:   ff  "." 
    RST 0x38                   ;0xdd88:   ff  "." 
    RST 0x38                   ;0xdd89:   ff  "." 
    RST 0x38                   ;0xdd8a:   ff  "." 
    RST 0x38                   ;0xdd8b:   ff  "." 
    RST 0x38                   ;0xdd8c:   ff  "." 
    RST 0x38                   ;0xdd8d:   ff  "." 
    RST 0x38                   ;0xdd8e:   ff  "." 
    RST 0x38                   ;0xdd8f:   ff  "." 
    RST 0x38                   ;0xdd90:   ff  "." 
    RST 0x38                   ;0xdd91:   ff  "." 
    RST 0x38                   ;0xdd92:   ff  "." 
    RST 0x38                   ;0xdd93:   ff  "." 
    RST 0x38                   ;0xdd94:   ff  "." 
    RST 0x38                   ;0xdd95:   ff  "." 
    RST 0x38                   ;0xdd96:   ff  "." 
    RST 0x38                   ;0xdd97:   ff  "." 
    RST 0x38                   ;0xdd98:   ff  "." 
    RST 0x38                   ;0xdd99:   ff  "." 
    RST 0x38                   ;0xdd9a:   ff  "." 
    RST 0x38                   ;0xdd9b:   ff  "." 
    RST 0x38                   ;0xdd9c:   ff  "." 
    RST 0x38                   ;0xdd9d:   ff  "." 
    RST 0x38                   ;0xdd9e:   ff  "." 
    RST 0x38                   ;0xdd9f:   ff  "." 
    RST 0x38                   ;0xdda0:   ff  "." 
    RST 0x38                   ;0xdda1:   ff  "." 
    RST 0x38                   ;0xdda2:   ff  "." 
    RST 0x38                   ;0xdda3:   ff  "." 
    RST 0x38                   ;0xdda4:   ff  "." 
    RST 0x38                   ;0xdda5:   ff  "." 
    RST 0x38                   ;0xdda6:   ff  "." 
    RST 0x38                   ;0xdda7:   ff  "." 
    RST 0x38                   ;0xdda8:   ff  "." 
    RST 0x38                   ;0xdda9:   ff  "." 
    RST 0x38                   ;0xddaa:   ff  "." 
    RST 0x38                   ;0xddab:   ff  "." 
    RST 0x38                   ;0xddac:   ff  "." 
    RST 0x38                   ;0xddad:   ff  "." 
    RST 0x38                   ;0xddae:   ff  "." 
    RST 0x38                   ;0xddaf:   ff  "." 
    RST 0x38                   ;0xddb0:   ff  "." 
    RST 0x38                   ;0xddb1:   ff  "." 
    RST 0x38                   ;0xddb2:   ff  "." 
    RST 0x38                   ;0xddb3:   ff  "." 
    RST 0x38                   ;0xddb4:   ff  "." 
    RST 0x38                   ;0xddb5:   ff  "." 
    RST 0x38                   ;0xddb6:   ff  "." 
    RST 0x38                   ;0xddb7:   ff  "." 
    RST 0x38                   ;0xddb8:   ff  "." 
    RST 0x38                   ;0xddb9:   ff  "." 
    RST 0x38                   ;0xddba:   ff  "." 
    RST 0x38                   ;0xddbb:   ff  "." 
    RST 0x38                   ;0xddbc:   ff  "." 
    RST 0x38                   ;0xddbd:   ff  "." 
    RST 0x38                   ;0xddbe:   ff  "." 
    RST 0x38                   ;0xddbf:   ff  "." 
    RST 0x38                   ;0xddc0:   ff  "." 
    RST 0x38                   ;0xddc1:   ff  "." 
    RST 0x38                   ;0xddc2:   ff  "." 
    RST 0x38                   ;0xddc3:   ff  "." 
    RST 0x38                   ;0xddc4:   ff  "." 
    RST 0x38                   ;0xddc5:   ff  "." 
    RST 0x38                   ;0xddc6:   ff  "." 
    RST 0x38                   ;0xddc7:   ff  "." 
    RST 0x38                   ;0xddc8:   ff  "." 
    RST 0x38                   ;0xddc9:   ff  "." 
    RST 0x38                   ;0xddca:   ff  "." 
    RST 0x38                   ;0xddcb:   ff  "." 
    RST 0x38                   ;0xddcc:   ff  "." 
    RST 0x38                   ;0xddcd:   ff  "." 
    RST 0x38                   ;0xddce:   ff  "." 
    RST 0x38                   ;0xddcf:   ff  "." 
    RST 0x38                   ;0xddd0:   ff  "." 
    RST 0x38                   ;0xddd1:   ff  "." 
    RST 0x38                   ;0xddd2:   ff  "." 
    RST 0x38                   ;0xddd3:   ff  "." 
    RST 0x38                   ;0xddd4:   ff  "." 
    RST 0x38                   ;0xddd5:   ff  "." 
    RST 0x38                   ;0xddd6:   ff  "." 
    RST 0x38                   ;0xddd7:   ff  "." 
    RST 0x38                   ;0xddd8:   ff  "." 
    RST 0x38                   ;0xddd9:   ff  "." 
    RST 0x38                   ;0xddda:   ff  "." 
    RST 0x38                   ;0xdddb:   ff  "." 
    RST 0x38                   ;0xdddc:   ff  "." 
    RST 0x38                   ;0xdddd:   ff  "." 
    RST 0x38                   ;0xddde:   ff  "." 
    RST 0x38                   ;0xdddf:   ff  "." 
    RST 0x38                   ;0xdde0:   ff  "." 
    RST 0x38                   ;0xdde1:   ff  "." 
    RST 0x38                   ;0xdde2:   ff  "." 
    RST 0x38                   ;0xdde3:   ff  "." 
    RST 0x38                   ;0xdde4:   ff  "." 
    RST 0x38                   ;0xdde5:   ff  "." 
    RST 0x38                   ;0xdde6:   ff  "." 
    RST 0x38                   ;0xdde7:   ff  "." 
    RST 0x38                   ;0xdde8:   ff  "." 
    RST 0x38                   ;0xdde9:   ff  "." 
    RST 0x38                   ;0xddea:   ff  "." 
    RST 0x38                   ;0xddeb:   ff  "." 
    RST 0x38                   ;0xddec:   ff  "." 
    RST 0x38                   ;0xdded:   ff  "." 
    RST 0x38                   ;0xddee:   ff  "." 
    RST 0x38                   ;0xddef:   ff  "." 
    RST 0x38                   ;0xddf0:   ff  "." 
    RST 0x38                   ;0xddf1:   ff  "." 
    RST 0x38                   ;0xddf2:   ff  "." 
    RST 0x38                   ;0xddf3:   ff  "." 
    RST 0x38                   ;0xddf4:   ff  "." 
    RST 0x38                   ;0xddf5:   ff  "." 
    RST 0x38                   ;0xddf6:   ff  "." 
    RST 0x38                   ;0xddf7:   ff  "." 
    RST 0x38                   ;0xddf8:   ff  "." 
    RST 0x38                   ;0xddf9:   ff  "." 
    RST 0x38                   ;0xddfa:   ff  "." 
    RST 0x38                   ;0xddfb:   ff  "." 
    RST 0x38                   ;0xddfc:   ff  "." 
    RST 0x38                   ;0xddfd:   ff  "." 
    RST 0x38                   ;0xddfe:   ff  "." 
    RST 0x38                   ;0xddff:   ff  "." 
    RST 0x38                   ;0xde00:   ff  "." 
    RST 0x38                   ;0xde01:   ff  "." 
    RST 0x38                   ;0xde02:   ff  "." 
    RST 0x38                   ;0xde03:   ff  "." 
    RST 0x38                   ;0xde04:   ff  "." 
    RST 0x38                   ;0xde05:   ff  "." 
    RST 0x38                   ;0xde06:   ff  "." 
    RST 0x38                   ;0xde07:   ff  "." 
    RST 0x38                   ;0xde08:   ff  "." 
    RST 0x38                   ;0xde09:   ff  "." 
    RST 0x38                   ;0xde0a:   ff  "." 
    RST 0x38                   ;0xde0b:   ff  "." 
    RST 0x38                   ;0xde0c:   ff  "." 
    RST 0x38                   ;0xde0d:   ff  "." 
    RST 0x38                   ;0xde0e:   ff  "." 
    RST 0x38                   ;0xde0f:   ff  "." 
    RST 0x38                   ;0xde10:   ff  "." 
    RST 0x38                   ;0xde11:   ff  "." 
    RST 0x38                   ;0xde12:   ff  "." 
    RST 0x38                   ;0xde13:   ff  "." 
    RST 0x38                   ;0xde14:   ff  "." 
    RST 0x38                   ;0xde15:   ff  "." 
    RST 0x38                   ;0xde16:   ff  "." 
    RST 0x38                   ;0xde17:   ff  "." 
    RST 0x38                   ;0xde18:   ff  "." 
    RST 0x38                   ;0xde19:   ff  "." 
    RST 0x38                   ;0xde1a:   ff  "." 
    RST 0x38                   ;0xde1b:   ff  "." 
    RST 0x38                   ;0xde1c:   ff  "." 
    RST 0x38                   ;0xde1d:   ff  "." 
    RST 0x38                   ;0xde1e:   ff  "." 
    RST 0x38                   ;0xde1f:   ff  "." 
    RST 0x38                   ;0xde20:   ff  "." 
    RST 0x38                   ;0xde21:   ff  "." 
    RST 0x38                   ;0xde22:   ff  "." 
    RST 0x38                   ;0xde23:   ff  "." 
    RST 0x38                   ;0xde24:   ff  "." 
    RST 0x38                   ;0xde25:   ff  "." 
    RST 0x38                   ;0xde26:   ff  "." 
    RST 0x38                   ;0xde27:   ff  "." 
    RST 0x38                   ;0xde28:   ff  "." 
    RST 0x38                   ;0xde29:   ff  "." 
    RST 0x38                   ;0xde2a:   ff  "." 
    RST 0x38                   ;0xde2b:   ff  "." 
    RST 0x38                   ;0xde2c:   ff  "." 
    RST 0x38                   ;0xde2d:   ff  "." 
    RST 0x38                   ;0xde2e:   ff  "." 
    RST 0x38                   ;0xde2f:   ff  "." 
    RST 0x38                   ;0xde30:   ff  "." 
    RST 0x38                   ;0xde31:   ff  "." 
    RST 0x38                   ;0xde32:   ff  "." 
    RST 0x38                   ;0xde33:   ff  "." 
    RST 0x38                   ;0xde34:   ff  "." 
    RST 0x38                   ;0xde35:   ff  "." 
    RST 0x38                   ;0xde36:   ff  "." 
    RST 0x38                   ;0xde37:   ff  "." 
    RST 0x38                   ;0xde38:   ff  "." 
    RST 0x38                   ;0xde39:   ff  "." 
    RST 0x38                   ;0xde3a:   ff  "." 
    RST 0x38                   ;0xde3b:   ff  "." 
    RST 0x38                   ;0xde3c:   ff  "." 
    RST 0x38                   ;0xde3d:   ff  "." 
    RST 0x38                   ;0xde3e:   ff  "." 
    RST 0x38                   ;0xde3f:   ff  "." 
    RST 0x38                   ;0xde40:   ff  "." 
    RST 0x38                   ;0xde41:   ff  "." 
    RST 0x38                   ;0xde42:   ff  "." 
    RST 0x38                   ;0xde43:   ff  "." 
    RST 0x38                   ;0xde44:   ff  "." 
    RST 0x38                   ;0xde45:   ff  "." 
    RST 0x38                   ;0xde46:   ff  "." 
    RST 0x38                   ;0xde47:   ff  "." 
    RST 0x38                   ;0xde48:   ff  "." 
    RST 0x38                   ;0xde49:   ff  "." 
    RST 0x38                   ;0xde4a:   ff  "." 
    RST 0x38                   ;0xde4b:   ff  "." 
    RST 0x38                   ;0xde4c:   ff  "." 
    RST 0x38                   ;0xde4d:   ff  "." 
    RST 0x38                   ;0xde4e:   ff  "." 
    RST 0x38                   ;0xde4f:   ff  "." 
    RST 0x38                   ;0xde50:   ff  "." 
    RST 0x38                   ;0xde51:   ff  "." 
    RST 0x38                   ;0xde52:   ff  "." 
    RST 0x38                   ;0xde53:   ff  "." 
    RST 0x38                   ;0xde54:   ff  "." 
    RST 0x38                   ;0xde55:   ff  "." 
    RST 0x38                   ;0xde56:   ff  "." 
    RST 0x38                   ;0xde57:   ff  "." 
    RST 0x38                   ;0xde58:   ff  "." 
    RST 0x38                   ;0xde59:   ff  "." 
    RST 0x38                   ;0xde5a:   ff  "." 
    RST 0x38                   ;0xde5b:   ff  "." 
    RST 0x38                   ;0xde5c:   ff  "." 
    RST 0x38                   ;0xde5d:   ff  "." 
    RST 0x38                   ;0xde5e:   ff  "." 
    RST 0x38                   ;0xde5f:   ff  "." 
    RST 0x38                   ;0xde60:   ff  "." 
    RST 0x38                   ;0xde61:   ff  "." 
    RST 0x38                   ;0xde62:   ff  "." 
    RST 0x38                   ;0xde63:   ff  "." 
    RST 0x38                   ;0xde64:   ff  "." 
    RST 0x38                   ;0xde65:   ff  "." 
    RST 0x38                   ;0xde66:   ff  "." 
    RST 0x38                   ;0xde67:   ff  "." 
    RST 0x38                   ;0xde68:   ff  "." 
    RST 0x38                   ;0xde69:   ff  "." 
    RST 0x38                   ;0xde6a:   ff  "." 
    RST 0x38                   ;0xde6b:   ff  "." 
    RST 0x38                   ;0xde6c:   ff  "." 
    RST 0x38                   ;0xde6d:   ff  "." 
    RST 0x38                   ;0xde6e:   ff  "." 
    RST 0x38                   ;0xde6f:   ff  "." 
    RST 0x38                   ;0xde70:   ff  "." 
    RST 0x38                   ;0xde71:   ff  "." 
    RST 0x38                   ;0xde72:   ff  "." 
    RST 0x38                   ;0xde73:   ff  "." 
    RST 0x38                   ;0xde74:   ff  "." 
    RST 0x38                   ;0xde75:   ff  "." 
    RST 0x38                   ;0xde76:   ff  "." 
    RST 0x38                   ;0xde77:   ff  "." 
    RST 0x38                   ;0xde78:   ff  "." 
    RST 0x38                   ;0xde79:   ff  "." 
    RST 0x38                   ;0xde7a:   ff  "." 
    RST 0x38                   ;0xde7b:   ff  "." 
    RST 0x38                   ;0xde7c:   ff  "." 
    RST 0x38                   ;0xde7d:   ff  "." 
    RST 0x38                   ;0xde7e:   ff  "." 
    RST 0x38                   ;0xde7f:   ff  "." 
    RST 0x38                   ;0xde80:   ff  "." 
    RST 0x38                   ;0xde81:   ff  "." 
    RST 0x38                   ;0xde82:   ff  "." 
    RST 0x38                   ;0xde83:   ff  "." 
    RST 0x38                   ;0xde84:   ff  "." 
    RST 0x38                   ;0xde85:   ff  "." 
    RST 0x38                   ;0xde86:   ff  "." 
    RST 0x38                   ;0xde87:   ff  "." 
    RST 0x38                   ;0xde88:   ff  "." 
    RST 0x38                   ;0xde89:   ff  "." 
    RST 0x38                   ;0xde8a:   ff  "." 
    RST 0x38                   ;0xde8b:   ff  "." 
    RST 0x38                   ;0xde8c:   ff  "." 
    RST 0x38                   ;0xde8d:   ff  "." 
    RST 0x38                   ;0xde8e:   ff  "." 
    RST 0x38                   ;0xde8f:   ff  "." 
    RST 0x38                   ;0xde90:   ff  "." 
    RST 0x38                   ;0xde91:   ff  "." 
    RST 0x38                   ;0xde92:   ff  "." 
    RST 0x38                   ;0xde93:   ff  "." 
    RST 0x38                   ;0xde94:   ff  "." 
    RST 0x38                   ;0xde95:   ff  "." 
    RST 0x38                   ;0xde96:   ff  "." 
    RST 0x38                   ;0xde97:   ff  "." 
    RST 0x38                   ;0xde98:   ff  "." 
    RST 0x38                   ;0xde99:   ff  "." 
    RST 0x38                   ;0xde9a:   ff  "." 
    RST 0x38                   ;0xde9b:   ff  "." 
    RST 0x38                   ;0xde9c:   ff  "." 
    RST 0x38                   ;0xde9d:   ff  "." 
    RST 0x38                   ;0xde9e:   ff  "." 
    RST 0x38                   ;0xde9f:   ff  "." 
    RST 0x38                   ;0xdea0:   ff  "." 
    RST 0x38                   ;0xdea1:   ff  "." 
    RST 0x38                   ;0xdea2:   ff  "." 
    RST 0x38                   ;0xdea3:   ff  "." 
    RST 0x38                   ;0xdea4:   ff  "." 
    RST 0x38                   ;0xdea5:   ff  "." 
    RST 0x38                   ;0xdea6:   ff  "." 
    RST 0x38                   ;0xdea7:   ff  "." 
    RST 0x38                   ;0xdea8:   ff  "." 
    RST 0x38                   ;0xdea9:   ff  "." 
    RST 0x38                   ;0xdeaa:   ff  "." 
    RST 0x38                   ;0xdeab:   ff  "." 
    RST 0x38                   ;0xdeac:   ff  "." 
    RST 0x38                   ;0xdead:   ff  "." 
    RST 0x38                   ;0xdeae:   ff  "." 
    RST 0x38                   ;0xdeaf:   ff  "." 
    RST 0x38                   ;0xdeb0:   ff  "." 
    RST 0x38                   ;0xdeb1:   ff  "." 
    RST 0x38                   ;0xdeb2:   ff  "." 
    RST 0x38                   ;0xdeb3:   ff  "." 
    RST 0x38                   ;0xdeb4:   ff  "." 
    RST 0x38                   ;0xdeb5:   ff  "." 
    RST 0x38                   ;0xdeb6:   ff  "." 
    RST 0x38                   ;0xdeb7:   ff  "." 
    RST 0x38                   ;0xdeb8:   ff  "." 
    RST 0x38                   ;0xdeb9:   ff  "." 
    RST 0x38                   ;0xdeba:   ff  "." 
    RST 0x38                   ;0xdebb:   ff  "." 
    RST 0x38                   ;0xdebc:   ff  "." 
    RST 0x38                   ;0xdebd:   ff  "." 
    RST 0x38                   ;0xdebe:   ff  "." 
    RST 0x38                   ;0xdebf:   ff  "." 
    RST 0x38                   ;0xdec0:   ff  "." 
    RST 0x38                   ;0xdec1:   ff  "." 
    RST 0x38                   ;0xdec2:   ff  "." 
    RST 0x38                   ;0xdec3:   ff  "." 
    RST 0x38                   ;0xdec4:   ff  "." 
    RST 0x38                   ;0xdec5:   ff  "." 
    RST 0x38                   ;0xdec6:   ff  "." 
    RST 0x38                   ;0xdec7:   ff  "." 
    RST 0x38                   ;0xdec8:   ff  "." 
    RST 0x38                   ;0xdec9:   ff  "." 
    RST 0x38                   ;0xdeca:   ff  "." 
    RST 0x38                   ;0xdecb:   ff  "." 
    RST 0x38                   ;0xdecc:   ff  "." 
    RST 0x38                   ;0xdecd:   ff  "." 
    RST 0x38                   ;0xdece:   ff  "." 
    RST 0x38                   ;0xdecf:   ff  "." 
    RST 0x38                   ;0xded0:   ff  "." 
    RST 0x38                   ;0xded1:   ff  "." 
    RST 0x38                   ;0xded2:   ff  "." 
    RST 0x38                   ;0xded3:   ff  "." 
    RST 0x38                   ;0xded4:   ff  "." 
    RST 0x38                   ;0xded5:   ff  "." 
    RST 0x38                   ;0xded6:   ff  "." 
    RST 0x38                   ;0xded7:   ff  "." 
    RST 0x38                   ;0xded8:   ff  "." 
    RST 0x38                   ;0xded9:   ff  "." 
    RST 0x38                   ;0xdeda:   ff  "." 
    RST 0x38                   ;0xdedb:   ff  "." 
    RST 0x38                   ;0xdedc:   ff  "." 
    RST 0x38                   ;0xdedd:   ff  "." 
    RST 0x38                   ;0xdede:   ff  "." 
    RST 0x38                   ;0xdedf:   ff  "." 
    RST 0x38                   ;0xdee0:   ff  "." 
    RST 0x38                   ;0xdee1:   ff  "." 
    RST 0x38                   ;0xdee2:   ff  "." 
    RST 0x38                   ;0xdee3:   ff  "." 
    RST 0x38                   ;0xdee4:   ff  "." 
    RST 0x38                   ;0xdee5:   ff  "." 
    RST 0x38                   ;0xdee6:   ff  "." 
    RST 0x38                   ;0xdee7:   ff  "." 
    RST 0x38                   ;0xdee8:   ff  "." 
    RST 0x38                   ;0xdee9:   ff  "." 
    RST 0x38                   ;0xdeea:   ff  "." 
    RST 0x38                   ;0xdeeb:   ff  "." 
    RST 0x38                   ;0xdeec:   ff  "." 
    RST 0x38                   ;0xdeed:   ff  "." 
    RST 0x38                   ;0xdeee:   ff  "." 
    RST 0x38                   ;0xdeef:   ff  "." 
    RST 0x38                   ;0xdef0:   ff  "." 
    RST 0x38                   ;0xdef1:   ff  "." 
    RST 0x38                   ;0xdef2:   ff  "." 
    RST 0x38                   ;0xdef3:   ff  "." 
    RST 0x38                   ;0xdef4:   ff  "." 
    RST 0x38                   ;0xdef5:   ff  "." 
    RST 0x38                   ;0xdef6:   ff  "." 
    RST 0x38                   ;0xdef7:   ff  "." 
    RST 0x38                   ;0xdef8:   ff  "." 
    RST 0x38                   ;0xdef9:   ff  "." 
    RST 0x38                   ;0xdefa:   ff  "." 
    RST 0x38                   ;0xdefb:   ff  "." 
    RST 0x38                   ;0xdefc:   ff  "." 
    RST 0x38                   ;0xdefd:   ff  "." 
    RST 0x38                   ;0xdefe:   ff  "." 
    RST 0x38                   ;0xdeff:   ff  "." 
    RST 0x38                   ;0xdf00:   ff  "." 
    RST 0x38                   ;0xdf01:   ff  "." 
    RST 0x38                   ;0xdf02:   ff  "." 
    RST 0x38                   ;0xdf03:   ff  "." 
    RST 0x38                   ;0xdf04:   ff  "." 
    RST 0x38                   ;0xdf05:   ff  "." 
    RST 0x38                   ;0xdf06:   ff  "." 
    RST 0x38                   ;0xdf07:   ff  "." 
    RST 0x38                   ;0xdf08:   ff  "." 
    RST 0x38                   ;0xdf09:   ff  "." 
    RST 0x38                   ;0xdf0a:   ff  "." 
    RST 0x38                   ;0xdf0b:   ff  "." 
    RST 0x38                   ;0xdf0c:   ff  "." 
    RST 0x38                   ;0xdf0d:   ff  "." 
    RST 0x38                   ;0xdf0e:   ff  "." 
    RST 0x38                   ;0xdf0f:   ff  "." 
    RST 0x38                   ;0xdf10:   ff  "." 
    RST 0x38                   ;0xdf11:   ff  "." 
    RST 0x38                   ;0xdf12:   ff  "." 
    RST 0x38                   ;0xdf13:   ff  "." 
    RST 0x38                   ;0xdf14:   ff  "." 
    RST 0x38                   ;0xdf15:   ff  "." 
    RST 0x38                   ;0xdf16:   ff  "." 
    RST 0x38                   ;0xdf17:   ff  "." 
    RST 0x38                   ;0xdf18:   ff  "." 
    RST 0x38                   ;0xdf19:   ff  "." 
    RST 0x38                   ;0xdf1a:   ff  "." 
    RST 0x38                   ;0xdf1b:   ff  "." 
    RST 0x38                   ;0xdf1c:   ff  "." 
    RST 0x38                   ;0xdf1d:   ff  "." 
    RST 0x38                   ;0xdf1e:   ff  "." 
    RST 0x38                   ;0xdf1f:   ff  "." 
    RST 0x38                   ;0xdf20:   ff  "." 
    RST 0x38                   ;0xdf21:   ff  "." 
    RST 0x38                   ;0xdf22:   ff  "." 
    RST 0x38                   ;0xdf23:   ff  "." 
    RST 0x38                   ;0xdf24:   ff  "." 
    RST 0x38                   ;0xdf25:   ff  "." 
    RST 0x38                   ;0xdf26:   ff  "." 
    RST 0x38                   ;0xdf27:   ff  "." 
    RST 0x38                   ;0xdf28:   ff  "." 
    RST 0x38                   ;0xdf29:   ff  "." 
    RST 0x38                   ;0xdf2a:   ff  "." 
    RST 0x38                   ;0xdf2b:   ff  "." 
    RST 0x38                   ;0xdf2c:   ff  "." 
    RST 0x38                   ;0xdf2d:   ff  "." 
    RST 0x38                   ;0xdf2e:   ff  "." 
    RST 0x38                   ;0xdf2f:   ff  "." 
    RST 0x38                   ;0xdf30:   ff  "." 
    RST 0x38                   ;0xdf31:   ff  "." 
    RST 0x38                   ;0xdf32:   ff  "." 
    RST 0x38                   ;0xdf33:   ff  "." 
    RST 0x38                   ;0xdf34:   ff  "." 
    RST 0x38                   ;0xdf35:   ff  "." 
    RST 0x38                   ;0xdf36:   ff  "." 
    RST 0x38                   ;0xdf37:   ff  "." 
    RST 0x38                   ;0xdf38:   ff  "." 
    RST 0x38                   ;0xdf39:   ff  "." 
    RST 0x38                   ;0xdf3a:   ff  "." 
    RST 0x38                   ;0xdf3b:   ff  "." 
    RST 0x38                   ;0xdf3c:   ff  "." 
    RST 0x38                   ;0xdf3d:   ff  "." 
    RST 0x38                   ;0xdf3e:   ff  "." 
    RST 0x38                   ;0xdf3f:   ff  "." 
    RST 0x38                   ;0xdf40:   ff  "." 
    RST 0x38                   ;0xdf41:   ff  "." 
    RST 0x38                   ;0xdf42:   ff  "." 
    RST 0x38                   ;0xdf43:   ff  "." 
    RST 0x38                   ;0xdf44:   ff  "." 
    RST 0x38                   ;0xdf45:   ff  "." 
    RST 0x38                   ;0xdf46:   ff  "." 
    RST 0x38                   ;0xdf47:   ff  "." 
    RST 0x38                   ;0xdf48:   ff  "." 
    RST 0x38                   ;0xdf49:   ff  "." 
    RST 0x38                   ;0xdf4a:   ff  "." 
    RST 0x38                   ;0xdf4b:   ff  "." 
    RST 0x38                   ;0xdf4c:   ff  "." 
    RST 0x38                   ;0xdf4d:   ff  "." 
    RST 0x38                   ;0xdf4e:   ff  "." 
    RST 0x38                   ;0xdf4f:   ff  "." 
    RST 0x38                   ;0xdf50:   ff  "." 
    RST 0x38                   ;0xdf51:   ff  "." 
    RST 0x38                   ;0xdf52:   ff  "." 
    RST 0x38                   ;0xdf53:   ff  "." 
    RST 0x38                   ;0xdf54:   ff  "." 
    RST 0x38                   ;0xdf55:   ff  "." 
    RST 0x38                   ;0xdf56:   ff  "." 
    RST 0x38                   ;0xdf57:   ff  "." 
    RST 0x38                   ;0xdf58:   ff  "." 
    RST 0x38                   ;0xdf59:   ff  "." 
    RST 0x38                   ;0xdf5a:   ff  "." 
    RST 0x38                   ;0xdf5b:   ff  "." 
    RST 0x38                   ;0xdf5c:   ff  "." 
    RST 0x38                   ;0xdf5d:   ff  "." 
    RST 0x38                   ;0xdf5e:   ff  "." 
    RST 0x38                   ;0xdf5f:   ff  "." 
    RST 0x38                   ;0xdf60:   ff  "." 
    RST 0x38                   ;0xdf61:   ff  "." 
    RST 0x38                   ;0xdf62:   ff  "." 
    RST 0x38                   ;0xdf63:   ff  "." 
    RST 0x38                   ;0xdf64:   ff  "." 
    RST 0x38                   ;0xdf65:   ff  "." 
    RST 0x38                   ;0xdf66:   ff  "." 
    RST 0x38                   ;0xdf67:   ff  "." 
    RST 0x38                   ;0xdf68:   ff  "." 
    RST 0x38                   ;0xdf69:   ff  "." 
    RST 0x38                   ;0xdf6a:   ff  "." 
    RST 0x38                   ;0xdf6b:   ff  "." 
    RST 0x38                   ;0xdf6c:   ff  "." 
    RST 0x38                   ;0xdf6d:   ff  "." 
    RST 0x38                   ;0xdf6e:   ff  "." 
    RST 0x38                   ;0xdf6f:   ff  "." 
    RST 0x38                   ;0xdf70:   ff  "." 
    RST 0x38                   ;0xdf71:   ff  "." 
    RST 0x38                   ;0xdf72:   ff  "." 
    RST 0x38                   ;0xdf73:   ff  "." 
    RST 0x38                   ;0xdf74:   ff  "." 
    RST 0x38                   ;0xdf75:   ff  "." 
    RST 0x38                   ;0xdf76:   ff  "." 
    RST 0x38                   ;0xdf77:   ff  "." 
    RST 0x38                   ;0xdf78:   ff  "." 
    RST 0x38                   ;0xdf79:   ff  "." 
    RST 0x38                   ;0xdf7a:   ff  "." 
    RST 0x38                   ;0xdf7b:   ff  "." 
    RST 0x38                   ;0xdf7c:   ff  "." 
    RST 0x38                   ;0xdf7d:   ff  "." 
    RST 0x38                   ;0xdf7e:   ff  "." 
    RST 0x38                   ;0xdf7f:   ff  "." 
    RST 0x38                   ;0xdf80:   ff  "." 
    RST 0x38                   ;0xdf81:   ff  "." 
    RST 0x38                   ;0xdf82:   ff  "." 
    RST 0x38                   ;0xdf83:   ff  "." 
    RST 0x38                   ;0xdf84:   ff  "." 
    RST 0x38                   ;0xdf85:   ff  "." 
    RST 0x38                   ;0xdf86:   ff  "." 
    RST 0x38                   ;0xdf87:   ff  "." 
    RST 0x38                   ;0xdf88:   ff  "." 
    RST 0x38                   ;0xdf89:   ff  "." 
    RST 0x38                   ;0xdf8a:   ff  "." 
    RST 0x38                   ;0xdf8b:   ff  "." 
    RST 0x38                   ;0xdf8c:   ff  "." 
    RST 0x38                   ;0xdf8d:   ff  "." 
    RST 0x38                   ;0xdf8e:   ff  "." 
    RST 0x38                   ;0xdf8f:   ff  "." 
    RST 0x38                   ;0xdf90:   ff  "." 
    RST 0x38                   ;0xdf91:   ff  "." 
    RST 0x38                   ;0xdf92:   ff  "." 
    RST 0x38                   ;0xdf93:   ff  "." 
    RST 0x38                   ;0xdf94:   ff  "." 
    RST 0x38                   ;0xdf95:   ff  "." 
    RST 0x38                   ;0xdf96:   ff  "." 
    RST 0x38                   ;0xdf97:   ff  "." 
    RST 0x38                   ;0xdf98:   ff  "." 
    RST 0x38                   ;0xdf99:   ff  "." 
    RST 0x38                   ;0xdf9a:   ff  "." 
    RST 0x38                   ;0xdf9b:   ff  "." 
    RST 0x38                   ;0xdf9c:   ff  "." 
    RST 0x38                   ;0xdf9d:   ff  "." 
    RST 0x38                   ;0xdf9e:   ff  "." 
    RST 0x38                   ;0xdf9f:   ff  "." 
    RST 0x38                   ;0xdfa0:   ff  "." 
    RST 0x38                   ;0xdfa1:   ff  "." 
    RST 0x38                   ;0xdfa2:   ff  "." 
    RST 0x38                   ;0xdfa3:   ff  "." 
    RST 0x38                   ;0xdfa4:   ff  "." 
    RST 0x38                   ;0xdfa5:   ff  "." 
    RST 0x38                   ;0xdfa6:   ff  "." 
    RST 0x38                   ;0xdfa7:   ff  "." 
    RST 0x38                   ;0xdfa8:   ff  "." 
    RST 0x38                   ;0xdfa9:   ff  "." 
    RST 0x38                   ;0xdfaa:   ff  "." 
    RST 0x38                   ;0xdfab:   ff  "." 
    RST 0x38                   ;0xdfac:   ff  "." 
    RST 0x38                   ;0xdfad:   ff  "." 
    RST 0x38                   ;0xdfae:   ff  "." 
    RST 0x38                   ;0xdfaf:   ff  "." 
    RST 0x38                   ;0xdfb0:   ff  "." 
    RST 0x38                   ;0xdfb1:   ff  "." 
    RST 0x38                   ;0xdfb2:   ff  "." 
    RST 0x38                   ;0xdfb3:   ff  "." 
    RST 0x38                   ;0xdfb4:   ff  "." 
    RST 0x38                   ;0xdfb5:   ff  "." 
    RST 0x38                   ;0xdfb6:   ff  "." 
    RST 0x38                   ;0xdfb7:   ff  "." 
    RST 0x38                   ;0xdfb8:   ff  "." 
    RST 0x38                   ;0xdfb9:   ff  "." 
    RST 0x38                   ;0xdfba:   ff  "." 
    RST 0x38                   ;0xdfbb:   ff  "." 
    RST 0x38                   ;0xdfbc:   ff  "." 
    RST 0x38                   ;0xdfbd:   ff  "." 
    RST 0x38                   ;0xdfbe:   ff  "." 
    RST 0x38                   ;0xdfbf:   ff  "." 
    RST 0x38                   ;0xdfc0:   ff  "." 
    RST 0x38                   ;0xdfc1:   ff  "." 
    RST 0x38                   ;0xdfc2:   ff  "." 
    RST 0x38                   ;0xdfc3:   ff  "." 
    RST 0x38                   ;0xdfc4:   ff  "." 
    RST 0x38                   ;0xdfc5:   ff  "." 
    RST 0x38                   ;0xdfc6:   ff  "." 
    RST 0x38                   ;0xdfc7:   ff  "." 
    RST 0x38                   ;0xdfc8:   ff  "." 
    RST 0x38                   ;0xdfc9:   ff  "." 
    RST 0x38                   ;0xdfca:   ff  "." 
    RST 0x38                   ;0xdfcb:   ff  "." 
    RST 0x38                   ;0xdfcc:   ff  "." 
    RST 0x38                   ;0xdfcd:   ff  "." 
    RST 0x38                   ;0xdfce:   ff  "." 
    RST 0x38                   ;0xdfcf:   ff  "." 
    RST 0x38                   ;0xdfd0:   ff  "." 
    RST 0x38                   ;0xdfd1:   ff  "." 
    RST 0x38                   ;0xdfd2:   ff  "." 
    RST 0x38                   ;0xdfd3:   ff  "." 
    RST 0x38                   ;0xdfd4:   ff  "." 
    RST 0x38                   ;0xdfd5:   ff  "." 
    RST 0x38                   ;0xdfd6:   ff  "." 
    RST 0x38                   ;0xdfd7:   ff  "." 
    RST 0x38                   ;0xdfd8:   ff  "." 
    RST 0x38                   ;0xdfd9:   ff  "." 
    RST 0x38                   ;0xdfda:   ff  "." 
    RST 0x38                   ;0xdfdb:   ff  "." 
    RST 0x38                   ;0xdfdc:   ff  "." 
    RST 0x38                   ;0xdfdd:   ff  "." 
    RST 0x38                   ;0xdfde:   ff  "." 
    RST 0x38                   ;0xdfdf:   ff  "." 
    RST 0x38                   ;0xdfe0:   ff  "." 
    RST 0x38                   ;0xdfe1:   ff  "." 
    RST 0x38                   ;0xdfe2:   ff  "." 
    RST 0x38                   ;0xdfe3:   ff  "." 
    RST 0x38                   ;0xdfe4:   ff  "." 
    RST 0x38                   ;0xdfe5:   ff  "." 
    RST 0x38                   ;0xdfe6:   ff  "." 
    RST 0x38                   ;0xdfe7:   ff  "." 
    RST 0x38                   ;0xdfe8:   ff  "." 
    RST 0x38                   ;0xdfe9:   ff  "." 
    RST 0x38                   ;0xdfea:   ff  "." 
    RST 0x38                   ;0xdfeb:   ff  "." 
    RST 0x38                   ;0xdfec:   ff  "." 
    RST 0x38                   ;0xdfed:   ff  "." 
    RST 0x38                   ;0xdfee:   ff  "." 
    RST 0x38                   ;0xdfef:   ff  "." 
    RST 0x38                   ;0xdff0:   ff  "." 
    RST 0x38                   ;0xdff1:   ff  "." 
    RST 0x38                   ;0xdff2:   ff  "." 
    RST 0x38                   ;0xdff3:   ff  "." 
    RST 0x38                   ;0xdff4:   ff  "." 
    RST 0x38                   ;0xdff5:   ff  "." 
    RST 0x38                   ;0xdff6:   ff  "." 
    RST 0x38                   ;0xdff7:   ff  "." 
    RST 0x38                   ;0xdff8:   ff  "." 
    RST 0x38                   ;0xdff9:   ff  "." 
    RST 0x38                   ;0xdffa:   ff  "." 
    RST 0x38                   ;0xdffb:   ff  "." 
    RST 0x38                   ;0xdffc:   ff  "." 
    RST 0x38                   ;0xdffd:   ff  "." 
    RST 0x38                   ;0xdffe:   ff  "." 
    RST 0x38                   ;0xdfff:   ff  "." 
    JP C_ECFB                  ;0xe000:   c3 fb ec  "..." 
    JP C_ECEA                  ;0xe003:   c3 ea ec  "..." 
    JP C_ED26                  ;0xe006:   c3 26 ed  ".&." 
    JP C_ED15                  ;0xe009:   c3 15 ed  "..." 
    JP C_EFA9                  ;0xe00c:   c3 a9 ef  "..." 
    JP C_EFBB                  ;0xe00f:   c3 bb ef  "..." 
    JP C_EFB5                  ;0xe012:   c3 b5 ef  "..." 
    JP C_EDD3                  ;0xe015:   c3 d3 ed  "..." 
    JP C_EDB0                  ;0xe018:   c3 b0 ed  "..." 
    JP C_EE1D                  ;0xe01b:   c3 1d ee  "..." 
    JP C_EE66                  ;0xe01e:   c3 66 ee  ".f." 
    JP C_EE7D                  ;0xe021:   c3 7d ee  ".}." 
    JP C_EF45                  ;0xe024:   c3 45 ef  ".E." 
    JP C_EEA2                  ;0xe027:   c3 a2 ee  "..." 
    JP C_EFC6                  ;0xe02a:   c3 c6 ef  "..." 
    JP C_EFCE                  ;0xe02d:   c3 ce ef  "..." 
    JP C_EFD8                  ;0xe030:   c3 d8 ef  "..." 
    JP C_EFD2                  ;0xe033:   c3 d2 ef  "..." 
    JP C_EFF2                  ;0xe036:   c3 f2 ef  "..." 
    JP C_F016                  ;0xe039:   c3 16 f0  "..." 
    JP C_F032                  ;0xe03c:   c3 32 f0  ".2." 
    JP C_F05C                  ;0xe03f:   c3 5c f0  ".\." 
    JP C_F085                  ;0xe042:   c3 85 f0  "..." 
    JP C_F0AE                  ;0xe045:   c3 ae f0  "..." 
    JP C_EF13                  ;0xe048:   c3 13 ef  "..." 
    JP C_EF46                  ;0xe04b:   c3 46 ef  ".F." 
    JP C_EF76                  ;0xe04e:   c3 76 ef  ".v." 
    JP C_ECB0                  ;0xe051:   c3 b0 ec  "..." 
    JP C_E1B6                  ;0xe054:   c3 b6 e1  "..." 
    JP C_E1F1                  ;0xe057:   c3 f1 e1  "..." 
    JP C_E270                  ;0xe05a:   c3 70 e2  ".p." 
    JP C_E277                  ;0xe05d:   c3 77 e2  ".w." 
    JP C_E283                  ;0xe060:   c3 83 e2  "..." 
    JP C_E28F                  ;0xe063:   c3 8f e2  "..." 
    JP C_E298                  ;0xe066:   c3 98 e2  "..." 
    JP C_E29F                  ;0xe069:   c3 9f e2  "..." 
    JP C_E2AE                  ;0xe06c:   c3 ae e2  "..." 
    JP C_E2B5                  ;0xe06f:   c3 b5 e2  "..." 
    JP C_E2BC                  ;0xe072:   c3 bc e2  "..." 
    JP C_E2D5                  ;0xe075:   c3 d5 e2  "..." 
    JP C_E2E4                  ;0xe078:   c3 e4 e2  "..." 
    JP C_E2EC                  ;0xe07b:   c3 ec e2  "..." 
    JP C_E2FB                  ;0xe07e:   c3 fb e2  "..." 
    JP C_E30A                  ;0xe081:   c3 0a e3  "..." 
    JP C_E313                  ;0xe084:   c3 13 e3  "..." 
    JP C_E339                  ;0xe087:   c3 39 e3  ".9." 
    JP C_E340                  ;0xe08a:   c3 40 e3  ".@." 
    JP C_E397                  ;0xe08d:   c3 97 e3  "..." 
    JP C_E3B8                  ;0xe090:   c3 b8 e3  "..." 
    JP C_E3D6                  ;0xe093:   c3 d6 e3  "..." 
    JP C_E3FD                  ;0xe096:   c3 fd e3  "..." 
    JP C_E403                  ;0xe099:   c3 03 e4  "..." 
    JP C_E49A                  ;0xe09c:   c3 9a e4  "..." 
    JP C_E4CD                  ;0xe09f:   c3 cd e4  "..." 
    JP C_E4D3                  ;0xe0a2:   c3 d3 e4  "..." 
    JP C_E4D9                  ;0xe0a5:   c3 d9 e4  "..." 
    JP C_E53C                  ;0xe0a8:   c3 3c e5  ".<." 
    JP C_E564                  ;0xe0ab:   c3 64 e5  ".d." 
    JP C_E572                  ;0xe0ae:   c3 72 e5  ".r." 
    JP C_E580                  ;0xe0b1:   c3 80 e5  "..." 
    JP C_E587                  ;0xe0b4:   c3 87 e5  "..." 
    JP C_E58E                  ;0xe0b7:   c3 8e e5  "..." 
    JP C_E5A4                  ;0xe0ba:   c3 a4 e5  "..." 
    JP C_E5BD                  ;0xe0bd:   c3 bd e5  "..." 
    JP C_E773                  ;0xe0c0:   c3 73 e7  ".s." 
    JP C_E88D                  ;0xe0c3:   c3 8d e8  "..." 
    JP C_EC45                  ;0xe0c6:   c3 45 ec  ".E." 
    JP C_FF9A                  ;0xe0c9:   c3 9a ff  "..." 
    JP C_FFAA                  ;0xe0cc:   c3 aa ff  "..." 
    JP C_FFB2                  ;0xe0cf:   c3 b2 ff  "..." 
    JP C_FFC6                  ;0xe0d2:   c3 c6 ff  "..." 
    JP C_FFD0                  ;0xe0d5:   c3 d0 ff  "..." 
    JP C_FFA1                  ;0xe0d8:   c3 a1 ff  "..." 
    JP C_FFB2                  ;0xe0db:   c3 b2 ff  "..." 
    JP C_FFEB                  ;0xe0de:   c3 eb ff  "..." 
    JP C_FB24                  ;0xe0e1:   c3 24 fb  ".$." 
    JP C_FF90                  ;0xe0e4:   c3 90 ff  "..." 
    JP C_FC74                  ;0xe0e7:   c3 74 fc  ".t." 
    JP C_FC57                  ;0xe0ea:   c3 57 fc  ".W." 
    JP C_FADC                  ;0xe0ed:   c3 dc fa  "..." 
    JP C_FAEC                  ;0xe0f0:   c3 ec fa  "..." 
    JP C_F30F                  ;0xe0f3:   c3 0f f3  "..." 
    JP C_F3E4                  ;0xe0f6:   c3 e4 f3  "..." 
    JP C_F583                  ;0xe0f9:   c3 83 f5  "..." 
    JP C_F5B3                  ;0xe0fc:   c3 b3 f5  "..." 
    JP C_F209                  ;0xe0ff:   c3 09 f2  "..." 
    JP C_F1FB                  ;0xe102:   c3 fb f1  "..." 
    JP C_F1F4                  ;0xe105:   c3 f4 f1  "..." 
    JP C_F595                  ;0xe108:   c3 95 f5  "..." 
    JP C_F4E4                  ;0xe10b:   c3 e4 f4  "..." 
    JP C_F2B5                  ;0xe10e:   c3 b5 f2  "..." 
    JP C_F27B                  ;0xe111:   c3 7b f2  ".{." 
    JP C_F24A                  ;0xe114:   c3 4a f2  ".J." 
    JP C_F308                  ;0xe117:   c3 08 f3  "..." 
    JP C_F228                  ;0xe11a:   c3 28 f2  ".(." 
    JP C_F789                  ;0xe11d:   c3 89 f7  "..." 
    JP C_FB55                  ;0xe120:   c3 55 fb  ".U." 
    JP C_F5CB                  ;0xe123:   c3 cb f5  "..." 
    JP C_FB54                  ;0xe126:   c3 54 fb  ".T." 
    JP C_FBBC                  ;0xe129:   c3 bc fb  "..." 
    JP C_FAED                  ;0xe12c:   c3 ed fa  "..." 
    JP C_F783                  ;0xe12f:   c3 83 f7  "..." 
    JP C_FBDE                  ;0xe132:   c3 de fb  "..." 
    JP C_FC4E                  ;0xe135:   c3 4e fc  ".N." 
    JP C_F5AA                  ;0xe138:   c3 aa f5  "..." 
    JP C_F59E                  ;0xe13b:   c3 9e f5  "..." 
    JP C_F58C                  ;0xe13e:   c3 8c f5  "..." 
    JP C_FB30                  ;0xe141:   c3 30 fb  ".0." 
    JP C_FC18                  ;0xe144:   c3 18 fc  "..." 
    JP C_F5BF                  ;0xe147:   c3 bf f5  "..." 
    JP C_FB0A                  ;0xe14a:   c3 0a fb  "..." 
    JP C_FB3D                  ;0xe14d:   c3 3d fb  ".=." 
    JP C_FB3E                  ;0xe150:   c3 3e fb  ".>." 
    JP C_FC08                  ;0xe153:   c3 08 fc  "..." 
    JP C_FB6A                  ;0xe156:   c3 6a fb  ".j." 
    JP C_FC44                  ;0xe159:   c3 44 fc  ".D." 
    JP C_FC4F                  ;0xe15c:   c3 4f fc  ".O." 
    JP C_F2BD                  ;0xe15f:   c3 bd f2  "..." 
    JP C_FF61                  ;0xe162:   c3 61 ff  ".a." 
    JP C_FF74                  ;0xe165:   c3 74 ff  ".t." 
    JP C_FBD4                  ;0xe168:   c3 d4 fb  "..." 
    JP C_FC1D                  ;0xe16b:   c3 1d fc  "..." 
    JP C_FAE4                  ;0xe16e:   c3 e4 fa  "..." 
    JP C_FBE6                  ;0xe171:   c3 e6 fb  "..." 
    JP C_FC45                  ;0xe174:   c3 45 fc  ".E." 
    JP C_F202                  ;0xe177:   c3 02 f2  "..." 
    JP C_F2A6                  ;0xe17a:   c3 a6 f2  "..." 
    JP C_FBEE                  ;0xe17d:   c3 ee fb  "..." 
    JP C_FC6C                  ;0xe180:   c3 6c fc  ".l." 
    JP C_FB1D                  ;0xe183:   c3 1d fb  "..." 
    JP C_F1A4                  ;0xe186:   c3 a4 f1  "..." 
    JP C_F1B9                  ;0xe189:   c3 b9 f1  "..." 
    JP C_FF87                  ;0xe18c:   c3 87 ff  "..." 
    JP C_FC8E                  ;0xe18f:   c3 8e fc  "..." 
    JP C_FC8C                  ;0xe192:   c3 8c fc  "..." 
    JP C_F0F2                  ;0xe195:   c3 f2 f0  "..." 
    JP C_F17F                  ;0xe198:   c3 7f f1  "..." 
    JP C_F12B                  ;0xe19b:   c3 2b f1  ".+." 
    JP C_F150                  ;0xe19e:   c3 50 f1  ".P." 
    JP C_FAAC                  ;0xe1a1:   c3 ac fa  "..." 
    JP C_FA58                  ;0xe1a4:   c3 58 fa  ".X." 
    JP C_FA82                  ;0xe1a7:   c3 82 fa  "..." 
    JP C_FC94                  ;0xe1aa:   c3 94 fc  "..." 
    JP C_F866                  ;0xe1ad:   c3 66 f8  ".f." 
    JP C_FDB0                  ;0xe1b0:   c3 b0 fd  "..." 
    JP C_FDE2                  ;0xe1b3:   c3 e2 fd  "..." 
;--------------------------------------
C_E1B6:                        ;          XREF: 0xE054 
    LD HL,0                    ;0xe1b6:   21 00 00  "!.."  
    LD (0x464),HL              ;0xe1b9:   22 64 04  ""d."  
    LD (0x460),HL              ;0xe1bc:   22 60 04  ""`."  
    LD HL,(0x197)              ;0xe1bf:   2a 97 01  "*.."  
    DEC HL                     ;0xe1c2:   2b  "+" 
    LD (0x462),HL              ;0xe1c3:   22 62 04  ""b."  
    LD HL,(0x197)              ;0xe1c6:   2a 97 01  "*.."  
    LD (0x468),HL              ;0xe1c9:   22 68 04  ""h."  
    CALL C_FBD4                ;0xe1cc:   cd d4 fb  "..." 
    LD (0x46a),HL              ;0xe1cf:   22 6a 04  ""j."  
    LD HL,(0x197)              ;0xe1d2:   2a 97 01  "*.."  
    LD DE,1                    ;0xe1d5:   11 01 00  "..."  
    EX DE,HL                   ;0xe1d8:   eb  "." 
    CALL C_FBEE                ;0xe1d9:   cd ee fb  "..." 
    LD (0x470),HL              ;0xe1dc:   22 70 04  ""p."  
    LD HL,(0x199)              ;0xe1df:   2a 99 01  "*.."  
    LD (0x478),HL              ;0xe1e2:   22 78 04  ""x."  
    DEC HL                     ;0xe1e5:   2b  "+" 
    LD DE,1                    ;0xe1e6:   11 01 00  "..."  
    EX DE,HL                   ;0xe1e9:   eb  "." 
    CALL C_FBEE                ;0xe1ea:   cd ee fb  "..." 
    LD (0x472),HL              ;0xe1ed:   22 72 04  ""r."  
    RET                        ;0xe1f0:   c9  "." 
;--------------------------------------
C_E1F1:                        ;          XREF: 0xE057 
    CALL C_E298                ;0xe1f1:   cd 98 e2  "..." 
    LD DE,1                    ;0xe1f4:   11 01 00  "..."  
    CALL C_FB24                ;0xe1f7:   cd 24 fb  ".$." 
    JR z, C_E211               ;0xe1fa:   28 15  "(." 
    LD HL,(0x199)              ;0xe1fc:   2a 99 01  "*.."  
    EX DE,HL                   ;0xe1ff:   eb  "." 
    LD HL,(0x18d)              ;0xe200:   2a 8d 01  "*.."  
    CALL C_FB0A                ;0xe203:   cd 0a fb  "..." 
    PUSH HL                    ;0xe206:   e5  "." 
    CALL C_E2AE                ;0xe207:   cd ae e2  "..." 
    DEC HL                     ;0xe20a:   2b  "+" 
    POP DE                     ;0xe20b:   d1  "." 
    CALL C_FBBC                ;0xe20c:   cd bc fb  "..." 
    JR C_E214                  ;0xe20f:   18 03  ".." 
;--------------------------------------
C_E211:                        ;          XREF: 0xE1FA 
    LD HL,(0x199)              ;0xe211:   2a 99 01  "*.."  
;--------------------------------------
C_E214:                        ;          XREF: 0xE20F 
    LD (0x478),HL              ;0xe214:   22 78 04  ""x."  
    LD HL,(0x45e)              ;0xe217:   2a 5e 04  "*^."  
    LD DE,1                    ;0xe21a:   11 01 00  "..."  
    CALL C_FB24                ;0xe21d:   cd 24 fb  ".$." 
    JR z, C_E22F               ;0xe220:   28 0d  "(." 
    LD HL,(0x18d)              ;0xe222:   2a 8d 01  "*.."  
    PUSH HL                    ;0xe225:   e5  "." 
    CALL C_E2AE                ;0xe226:   cd ae e2  "..." 
    PUSH HL                    ;0xe229:   e5  "." 
    CALL C_EDB0                ;0xe22a:   cd b0 ed  "..." 
    POP DE                     ;0xe22d:   d1  "." 
    POP DE                     ;0xe22e:   d1  "." 
;--------------------------------------
C_E22F:                        ;          XREF: 0xE220 
    CALL C_E298                ;0xe22f:   cd 98 e2  "..." 
    LD DE,1                    ;0xe232:   11 01 00  "..."  
    CALL C_FB24                ;0xe235:   cd 24 fb  ".$." 
    JR z, C_E23F               ;0xe238:   28 05  "(." 
    CALL C_E2AE                ;0xe23a:   cd ae e2  "..." 
    JR C_E242                  ;0xe23d:   18 03  ".." 
;--------------------------------------
C_E23F:                        ;          XREF: 0xE238 
    LD HL,0                    ;0xe23f:   21 00 00  "!.."  
;--------------------------------------
C_E242:                        ;          XREF: 0xE23D 
    PUSH HL                    ;0xe242:   e5  "." 
    CALL C_ED26                ;0xe243:   cd 26 ed  ".&." 
    POP DE                     ;0xe246:   d1  "." 
    LD HL,(0x478)              ;0xe247:   2a 78 04  "*x."  
    DEC HL                     ;0xe24a:   2b  "+" 
    LD (0x466),HL              ;0xe24b:   22 66 04  ""f."  
    LD HL,(0x478)              ;0xe24e:   2a 78 04  "*x."  
    LD (0x46c),HL              ;0xe251:   22 6c 04  ""l."  
    CALL C_FBD4                ;0xe254:   cd d4 fb  "..." 
    LD (0x46e),HL              ;0xe257:   22 6e 04  ""n."  
    CALL C_EBFF                ;0xe25a:   cd ff eb  "..." 
    JR z, C_E262               ;0xe25d:   28 03  "(." 
    CALL C_E5C4                ;0xe25f:   cd c4 e5  "..." 
;--------------------------------------
C_E262:                        ;          XREF: 0xE25D 
    LD HL,(0x45e)              ;0xe262:   2a 5e 04  "*^."  
    LD DE,2                    ;0xe265:   11 02 00  "..."  
    CALL C_FB24                ;0xe268:   cd 24 fb  ".$." 
    RET z                      ;0xe26b:   c8  "." 
    CALL C_E403                ;0xe26c:   cd 03 e4  "..." 
    RET                        ;0xe26f:   c9  "." 
;--------------------------------------
C_E270:                        ;          XREF: 0xE05A 
    LD HL,(0x45c)              ;0xe270:   2a 5c 04  "*\."  
    LD (0x45e),HL              ;0xe273:   22 5e 04  ""^."  
    RET                        ;0xe276:   c9  "." 
;--------------------------------------
C_E277:                        ;          XREF: 0xE05D 
    CALL C_E270                ;0xe277:   cd 70 e2  ".p." 
    LD HL,0                    ;0xe27a:   21 00 00  "!.."  
    LD (0x45c),HL              ;0xe27d:   22 5c 04  ""\."  
    JP C_E1F1                  ;0xe280:   c3 f1 e1  "..." 
;--------------------------------------
C_E283:                        ;          XREF: 0xE060 
    CALL C_E270                ;0xe283:   cd 70 e2  ".p." 
    LD HL,1                    ;0xe286:   21 01 00  "!.."  
    LD (0x45c),HL              ;0xe289:   22 5c 04  ""\."  
    JP C_E1F1                  ;0xe28c:   c3 f1 e1  "..." 
;--------------------------------------
C_E28F:                        ;          XREF: 0xE063 
    LD HL,2                    ;0xe28f:   21 02 00  "!.."  
    LD (0x45c),HL              ;0xe292:   22 5c 04  ""\."  
    JP C_ED15                  ;0xe295:   c3 15 ed  "..." 
;--------------------------------------
C_E298:                        ;          XREF: 0xE066 
    CALL C_FF90                ;0xe298:   cd 90 ff  "..." 
    LD HL,(0x45c)              ;0xe29b:   2a 5c 04  "*\."  
    RET                        ;0xe29e:   c9  "." 
;--------------------------------------
C_E29F:                        ;          XREF: 0xE069 
    CALL C_FF90                ;0xe29f:   cd 90 ff  "..." 
    LD HL,8                    ;0xe2a2:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe2a5:   39  "9" 
    LD E,(HL)                  ;0xe2a6:   5e  "^" 
    INC HL                     ;0xe2a7:   23  "#" 
    LD D,(HL)                  ;0xe2a8:   56  "V" 
    EX DE,HL                   ;0xe2a9:   eb  "." 
    LD (0x45a),HL              ;0xe2aa:   22 5a 04  ""Z."  
    RET                        ;0xe2ad:   c9  "." 
;--------------------------------------
C_E2AE:                        ;          XREF: 0xE06C 
    CALL C_FF90                ;0xe2ae:   cd 90 ff  "..." 
    LD HL,(0x45a)              ;0xe2b1:   2a 5a 04  "*Z."  
    RET                        ;0xe2b4:   c9  "." 
;--------------------------------------
C_E2B5:                        ;          XREF: 0xE06F 
    CALL C_FF90                ;0xe2b5:   cd 90 ff  "..." 
    LD HL,(0x458)              ;0xe2b8:   2a 58 04  "*X."  
    RET                        ;0xe2bb:   c9  "." 
;--------------------------------------
C_E2BC:                        ;          XREF: 0xE072 
    CALL C_FF90                ;0xe2bc:   cd 90 ff  "..." 
    CALL C_E773                ;0xe2bf:   cd 73 e7  ".s." 
    LD HL,8                    ;0xe2c2:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe2c5:   39  "9" 
    LD E,(HL)                  ;0xe2c6:   5e  "^" 
    INC HL                     ;0xe2c7:   23  "#" 
    LD D,(HL)                  ;0xe2c8:   56  "V" 
    EX DE,HL                   ;0xe2c9:   eb  "." 
    LD (0x458),HL              ;0xe2ca:   22 58 04  ""X."  
    PUSH HL                    ;0xe2cd:   e5  "." 
    CALL C_EF45                ;0xe2ce:   cd 45 ef  ".E." 
    POP DE                     ;0xe2d1:   d1  "." 
    JP C_E773                  ;0xe2d2:   c3 73 e7  ".s." 
;--------------------------------------
C_E2D5:                        ;          XREF: 0xE075 
    LD HL,1                    ;0xe2d5:   21 01 00  "!.."  
    LD A,L                     ;0xe2d8:   7d  "}" 
    LD (0x455),A               ;0xe2d9:   32 55 04  "2U."  
    CALL C_E339                ;0xe2dc:   cd 39 e3  ".9." 
    LD A,L                     ;0xe2df:   7d  "}" 
    LD (0x454),A               ;0xe2e0:   32 54 04  "2T."  
    RET                        ;0xe2e3:   c9  "." 
;--------------------------------------
C_E2E4:                        ;          XREF: 0xE078 
    LD HL,0                    ;0xe2e4:   21 00 00  "!.."  
    LD A,L                     ;0xe2e7:   7d  "}" 
    LD (0x455),A               ;0xe2e8:   32 55 04  "2U."  
    RET                        ;0xe2eb:   c9  "." 
;--------------------------------------
C_E2EC:                        ;          XREF: 0xE07B 
    LD HL,3                    ;0xe2ec:   21 03 00  "!.."  
    LD A,L                     ;0xe2ef:   7d  "}" 
    LD (0x455),A               ;0xe2f0:   32 55 04  "2U."  
    CALL C_E2B5                ;0xe2f3:   cd b5 e2  "..." 
    LD A,L                     ;0xe2f6:   7d  "}" 
    LD (0x454),A               ;0xe2f7:   32 54 04  "2T."  
    RET                        ;0xe2fa:   c9  "." 
;--------------------------------------
C_E2FB:                        ;          XREF: 0xE07E 
    LD HL,2                    ;0xe2fb:   21 02 00  "!.."  
    LD A,L                     ;0xe2fe:   7d  "}" 
    LD (0x455),A               ;0xe2ff:   32 55 04  "2U."  
    CALL C_E339                ;0xe302:   cd 39 e3  ".9." 
    LD A,L                     ;0xe305:   7d  "}" 
    LD (0x454),A               ;0xe306:   32 54 04  "2T."  
    RET                        ;0xe309:   c9  "." 
;--------------------------------------
C_E30A:                        ;          XREF: 0xE081 
    CALL C_FF90                ;0xe30a:   cd 90 ff  "..." 
    LD HL,(0x455)              ;0xe30d:   2a 55 04  "*U."  
    LD H,0                     ;0xe310:   26 00  "&."  
    RET                        ;0xe312:   c9  "." 
;--------------------------------------
C_E313:                        ;          XREF: 0xE084 
    CALL C_FF90                ;0xe313:   cd 90 ff  "..." 
    CALL C_E773                ;0xe316:   cd 73 e7  ".s." 
    LD HL,8                    ;0xe319:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe31c:   39  "9" 
    LD E,(HL)                  ;0xe31d:   5e  "^" 
    INC HL                     ;0xe31e:   23  "#" 
    LD D,(HL)                  ;0xe31f:   56  "V" 
    EX DE,HL                   ;0xe320:   eb  "." 
    LD (0x456),HL              ;0xe321:   22 56 04  ""V."  
    CALL C_E773                ;0xe324:   cd 73 e7  ".s." 
    CALL C_E30A                ;0xe327:   cd 0a e3  "..." 
    LD DE,3                    ;0xe32a:   11 03 00  "..."  
    CALL C_FB24                ;0xe32d:   cd 24 fb  ".$." 
    RET nz                     ;0xe330:   c0  "." 
    LD HL,(0x456)              ;0xe331:   2a 56 04  "*V."  
    LD A,L                     ;0xe334:   7d  "}" 
    LD (0x454),A               ;0xe335:   32 54 04  "2T."  
    RET                        ;0xe338:   c9  "." 
;--------------------------------------
C_E339:                        ;          XREF: 0xE087 
    CALL C_FF90                ;0xe339:   cd 90 ff  "..." 
    LD HL,(0x456)              ;0xe33c:   2a 56 04  "*V."  
    RET                        ;0xe33f:   c9  "." 
;--------------------------------------
C_E340:                        ;          XREF: 0xE08A 
    CALL C_FF90                ;0xe340:   cd 90 ff  "..." 
    LD HL,0x1f3                ;0xe343:   21 f3 01  "!.."  
    CALL C_F209                ;0xe346:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe349:   cd 4a f2  ".J." 
    CALL C_FDB0                ;0xe34c:   cd b0 fd  "..." 
    CALL C_FF87                ;0xe34f:   cd 87 ff  "..." 
    LD HL,8                    ;0xe352:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe355:   39  "9" 
    CALL C_F1FB                ;0xe356:   cd fb f1  "..." 
    CALL C_F4E4                ;0xe359:   cd e4 f4  "..." 
    LD HL,0x1e7                ;0xe35c:   21 e7 01  "!.."  
    CALL C_F1FB                ;0xe35f:   cd fb f1  "..." 
    CALL C_F30F                ;0xe362:   cd 0f f3  "..." 
    CALL C_F24A                ;0xe365:   cd 4a f2  ".J." 
    LD HL,0x1f3                ;0xe368:   21 f3 01  "!.."  
    CALL C_F209                ;0xe36b:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe36e:   cd 4a f2  ".J." 
    CALL C_FDE2                ;0xe371:   cd e2 fd  "..." 
    CALL C_FF87                ;0xe374:   cd 87 ff  "..." 
    LD HL,0x10                 ;0xe377:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe37a:   39  "9" 
    CALL C_F1FB                ;0xe37b:   cd fb f1  "..." 
    CALL C_F4E4                ;0xe37e:   cd e4 f4  "..." 
    LD HL,0x1df                ;0xe381:   21 df 01  "!.."  
    CALL C_F1FB                ;0xe384:   cd fb f1  "..." 
    CALL C_F30F                ;0xe387:   cd 0f f3  "..." 
    CALL C_F24A                ;0xe38a:   cd 4a f2  ".J." 
    CALL C_E88D                ;0xe38d:   cd 8d e8  "..." 
    EX DE,HL                   ;0xe390:   eb  "." 
    LD HL,0x10                 ;0xe391:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe394:   39  "9" 
    LD SP,HL                   ;0xe395:   f9  "." 
    RET                        ;0xe396:   c9  "." 
;--------------------------------------
C_E397:                        ;          XREF: 0xE08D 
    CALL C_FF90                ;0xe397:   cd 90 ff  "..." 
    LD HL,0x10                 ;0xe39a:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe39d:   39  "9" 
    CALL C_F209                ;0xe39e:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe3a1:   cd 4a f2  ".J." 
    LD HL,0x10                 ;0xe3a4:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe3a7:   39  "9" 
    CALL C_F209                ;0xe3a8:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe3ab:   cd 4a f2  ".J." 
    CALL C_E88D                ;0xe3ae:   cd 8d e8  "..." 
    EX DE,HL                   ;0xe3b1:   eb  "." 
    LD HL,0x10                 ;0xe3b2:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe3b5:   39  "9" 
    LD SP,HL                   ;0xe3b6:   f9  "." 
    RET                        ;0xe3b7:   c9  "." 
;--------------------------------------
C_E3B8:                        ;          XREF: 0xE090 
    CALL C_FF90                ;0xe3b8:   cd 90 ff  "..." 
    LD HL,0x1f3                ;0xe3bb:   21 f3 01  "!.."  
    CALL C_F209                ;0xe3be:   cd 09 f2  "..." 
    LD HL,8                    ;0xe3c1:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe3c4:   39  "9" 
    CALL C_F1FB                ;0xe3c5:   cd fb f1  "..." 
    CALL C_F30F                ;0xe3c8:   cd 0f f3  "..." 
    CALL C_F24A                ;0xe3cb:   cd 4a f2  ".J." 
    CALL C_E3D6                ;0xe3ce:   cd d6 e3  "..." 
    EX DE,HL                   ;0xe3d1:   eb  "." 
    CALL C_FF87                ;0xe3d2:   cd 87 ff  "..." 
    RET                        ;0xe3d5:   c9  "." 
;--------------------------------------
C_E3D6:                        ;          XREF: 0xE093 
    CALL C_FF90                ;0xe3d6:   cd 90 ff  "..." 
    CALL C_E773                ;0xe3d9:   cd 73 e7  ".s." 
    LD HL,0x1f3                ;0xe3dc:   21 f3 01  "!.."  
    PUSH HL                    ;0xe3df:   e5  "." 
    LD HL,10                   ;0xe3e0:   21 0a 00  "!.."  
    ADD HL,SP                  ;0xe3e3:   39  "9" 
    CALL C_F209                ;0xe3e4:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe3e7:   cd 4a f2  ".J." 
    CALL C_EC45                ;0xe3ea:   cd 45 ec  ".E." 
    CALL C_FF87                ;0xe3ed:   cd 87 ff  "..." 
    POP HL                     ;0xe3f0:   e1  "." 
    CALL C_F228                ;0xe3f1:   cd 28 f2  ".(." 
    CALL C_F789                ;0xe3f4:   cd 89 f7  "..." 
    LD (0x1fb),HL              ;0xe3f7:   22 fb 01  "".."  
    JP C_E773                  ;0xe3fa:   c3 73 e7  ".s." 
;--------------------------------------
C_E3FD:                        ;          XREF: 0xE096 
    LD HL,0x1f3                ;0xe3fd:   21 f3 01  "!.."  
    JP C_F209                  ;0xe400:   c3 09 f2  "..." 
;--------------------------------------
C_E403:                        ;          XREF: 0xE099 
    LD HL,(0x466)              ;0xe403:   2a 66 04  "*f."  
    PUSH HL                    ;0xe406:   e5  "." 
    LD HL,(0x458)              ;0xe407:   2a 58 04  "*X."  
    PUSH HL                    ;0xe40a:   e5  "." 
    CALL C_EEA2                ;0xe40b:   cd a2 ee  "..." 
    POP DE                     ;0xe40e:   d1  "." 
    POP DE                     ;0xe40f:   d1  "." 
    JP C_E773                  ;0xe410:   c3 73 e7  ".s." 
;--------------------------------------
C_E413:                        ;          XREF: 0xE4B1 
    CALL C_FF90                ;0xe413:   cd 90 ff  "..." 
    LD HL,0x10                 ;0xe416:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe419:   39  "9" 
    CALL C_F209                ;0xe41a:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe41d:   cd 4a f2  ".J." 
    CALL C_E702                ;0xe420:   cd 02 e7  "..." 
    CALL C_FF87                ;0xe423:   cd 87 ff  "..." 
    CALL C_F24A                ;0xe426:   cd 4a f2  ".J." 
    LD HL,0x10                 ;0xe429:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe42c:   39  "9" 
    CALL C_F209                ;0xe42d:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe430:   cd 4a f2  ".J." 
    CALL C_E702                ;0xe433:   cd 02 e7  "..." 
    CALL C_FF87                ;0xe436:   cd 87 ff  "..." 
    CALL C_F24A                ;0xe439:   cd 4a f2  ".J." 
    CALL C_E4D9                ;0xe43c:   cd d9 e4  "..." 
    EX DE,HL                   ;0xe43f:   eb  "." 
    LD HL,0x10                 ;0xe440:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe443:   39  "9" 
    LD SP,HL                   ;0xe444:   f9  "." 
    LD HL,(0x476)              ;0xe445:   2a 76 04  "*v."  
    PUSH HL                    ;0xe448:   e5  "." 
    LD HL,(0x474)              ;0xe449:   2a 74 04  "*t."  
    PUSH HL                    ;0xe44c:   e5  "." 
    CALL C_EC1C                ;0xe44d:   cd 1c ec  "..." 
    POP DE                     ;0xe450:   d1  "." 
    POP DE                     ;0xe451:   d1  "." 
    CALL C_EBFF                ;0xe452:   cd ff eb  "..." 
    JR z, C_E499               ;0xe455:   28 42  "(B" 
    LD HL,(0x197)              ;0xe457:   2a 97 01  "*.."  
    LD DE,(0x474)              ;0xe45a:   ed 5b 74 04  ".[t."  
    CALL C_FB6A                ;0xe45e:   cd 6a fb  ".j." 
    LD (0x474),HL              ;0xe461:   22 74 04  ""t."  
    LD DE,0                    ;0xe464:   11 00 00  "..."  
    EX DE,HL                   ;0xe467:   eb  "." 
    CALL C_FB54                ;0xe468:   cd 54 fb  ".T." 
    JR z, C_E478               ;0xe46b:   28 0b  "(." 
    LD HL,(0x197)              ;0xe46d:   2a 97 01  "*.."  
    EX DE,HL                   ;0xe470:   eb  "." 
    LD HL,(0x474)              ;0xe471:   2a 74 04  "*t."  
    ADD HL,DE                  ;0xe474:   19  "." 
    LD (0x474),HL              ;0xe475:   22 74 04  ""t."  
;--------------------------------------
C_E478:                        ;          XREF: 0xE46B 
    LD HL,(0x478)              ;0xe478:   2a 78 04  "*x."  
    LD DE,(0x476)              ;0xe47b:   ed 5b 76 04  ".[v."  
    CALL C_FB6A                ;0xe47f:   cd 6a fb  ".j." 
    LD (0x476),HL              ;0xe482:   22 76 04  ""v."  
    LD DE,0                    ;0xe485:   11 00 00  "..."  
    EX DE,HL                   ;0xe488:   eb  "." 
    CALL C_FB54                ;0xe489:   cd 54 fb  ".T." 
    JR z, C_E499               ;0xe48c:   28 0b  "(." 
    LD HL,(0x478)              ;0xe48e:   2a 78 04  "*x."  
    EX DE,HL                   ;0xe491:   eb  "." 
    LD HL,(0x476)              ;0xe492:   2a 76 04  "*v."  
    ADD HL,DE                  ;0xe495:   19  "." 
    LD (0x476),HL              ;0xe496:   22 76 04  ""v."  
;--------------------------------------
C_E499:                        ;          XREF: 0xE455 
    RET                        ;0xe499:   c9  "." 
;--------------------------------------
C_E49A:                        ;          XREF: 0xE09C 
    CALL C_FF90                ;0xe49a:   cd 90 ff  "..." 
    LD HL,0x10                 ;0xe49d:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe4a0:   39  "9" 
    CALL C_F209                ;0xe4a1:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe4a4:   cd 4a f2  ".J." 
    LD HL,0x10                 ;0xe4a7:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe4aa:   39  "9" 
    CALL C_F209                ;0xe4ab:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe4ae:   cd 4a f2  ".J." 
    CALL C_E413                ;0xe4b1:   cd 13 e4  "..." 
    EX DE,HL                   ;0xe4b4:   eb  "." 
    LD HL,0x10                 ;0xe4b5:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe4b8:   39  "9" 
    LD SP,HL                   ;0xe4b9:   f9  "." 
    LD HL,(0x454)              ;0xe4ba:   2a 54 04  "*T."  
    PUSH HL                    ;0xe4bd:   e5  "." 
    LD HL,(0x476)              ;0xe4be:   2a 76 04  "*v."  
    PUSH HL                    ;0xe4c1:   e5  "." 
    LD HL,(0x474)              ;0xe4c2:   2a 74 04  "*t."  
    PUSH HL                    ;0xe4c5:   e5  "." 
    CALL C_ECDA                ;0xe4c6:   cd da ec  "..." 
    POP DE                     ;0xe4c9:   d1  "." 
    POP DE                     ;0xe4ca:   d1  "." 
    POP DE                     ;0xe4cb:   d1  "." 
    RET                        ;0xe4cc:   c9  "." 
;--------------------------------------
C_E4CD:                        ;          XREF: 0xE09F 
    LD HL,0x1df                ;0xe4cd:   21 df 01  "!.."  
    JP C_F209                  ;0xe4d0:   c3 09 f2  "..." 
;--------------------------------------
C_E4D3:                        ;          XREF: 0xE0A2 
    LD HL,0x1e7                ;0xe4d3:   21 e7 01  "!.."  
    JP C_F209                  ;0xe4d6:   c3 09 f2  "..." 
;--------------------------------------
C_E4D9:                        ;          XREF: 0xE0A5 
    CALL C_FAED                ;0xe4d9:   cd ed fa  "..." 
    RET p                      ;0xe4dc:   f0  "." 
    RST 0x38                   ;0xe4dd:   ff  "." 
    LD HL,0x18                 ;0xe4de:   21 18 00  "!.."  
    ADD HL,SP                  ;0xe4e1:   39  "9" 
    PUSH HL                    ;0xe4e2:   e5  "." 
    LD HL,(0x470)              ;0xe4e3:   2a 70 04  "*p."  
    CALL C_F5CB                ;0xe4e6:   cd cb f5  "..." 
    CALL C_F2A6                ;0xe4e9:   cd a6 f2  "..." 
    POP HL                     ;0xe4ec:   e1  "." 
    PUSH HL                    ;0xe4ed:   e5  "." 
    CALL C_F209                ;0xe4ee:   cd 09 f2  "..." 
    CALL C_F30F                ;0xe4f1:   cd 0f f3  "..." 
    POP HL                     ;0xe4f4:   e1  "." 
    CALL C_F228                ;0xe4f5:   cd 28 f2  ".(." 
    LD HL,0x20                 ;0xe4f8:   21 20 00  "! ."  
    ADD HL,SP                  ;0xe4fb:   39  "9" 
    PUSH HL                    ;0xe4fc:   e5  "." 
    LD HL,(0x472)              ;0xe4fd:   2a 72 04  "*r."  
    CALL C_F5CB                ;0xe500:   cd cb f5  "..." 
    LD HL,0x22                 ;0xe503:   21 22 00  "!"."  
    ADD HL,SP                  ;0xe506:   39  "9" 
    CALL C_F1FB                ;0xe507:   cd fb f1  "..." 
    CALL C_F308                ;0xe50a:   cd 08 f3  "..." 
    POP HL                     ;0xe50d:   e1  "." 
    CALL C_F228                ;0xe50e:   cd 28 f2  ".(." 
    LD HL,0x18                 ;0xe511:   21 18 00  "!.."  
    ADD HL,SP                  ;0xe514:   39  "9" 
    CALL C_F209                ;0xe515:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe518:   cd 4a f2  ".J." 
    CALL C_E6C8                ;0xe51b:   cd c8 e6  "..." 
    EX DE,HL                   ;0xe51e:   eb  "." 
    CALL C_FF87                ;0xe51f:   cd 87 ff  "..." 
    EX DE,HL                   ;0xe522:   eb  "." 
    LD (0x474),HL              ;0xe523:   22 74 04  ""t."  
    LD HL,0x20                 ;0xe526:   21 20 00  "! ."  
    ADD HL,SP                  ;0xe529:   39  "9" 
    CALL C_F209                ;0xe52a:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe52d:   cd 4a f2  ".J." 
    CALL C_E6C8                ;0xe530:   cd c8 e6  "..." 
    EX DE,HL                   ;0xe533:   eb  "." 
    CALL C_FF87                ;0xe534:   cd 87 ff  "..." 
    EX DE,HL                   ;0xe537:   eb  "." 
    LD (0x476),HL              ;0xe538:   22 76 04  ""v."  
    RET                        ;0xe53b:   c9  "." 
;--------------------------------------
C_E53C:                        ;          XREF: 0xE0A8 
    LD HL,0x1e7                ;0xe53c:   21 e7 01  "!.."  
    CALL C_F209                ;0xe53f:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe542:   cd 4a f2  ".J." 
    LD HL,0x1df                ;0xe545:   21 df 01  "!.."  
    CALL C_F209                ;0xe548:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe54b:   cd 4a f2  ".J." 
    CALL C_E4D9                ;0xe54e:   cd d9 e4  "..." 
    EX DE,HL                   ;0xe551:   eb  "." 
;--------------------------------------
D_E552:                        ;          XREF: 0xCA54 
    x9 DEFB 0x21               ;0xe552:   "!"
    x9 DEFB 0x10               ;0xe553:   0x10
    x9 DEFB 0x0                ;0xe554:   0x0
    x9 DEFB 0x39               ;0xe555:   "9"
    x9 DEFB 0xf9               ;0xe556:   ('y') + 0x80
    x9 DEFB 0x2a               ;0xe557:   "*"
    x9 DEFB 0x74               ;0xe558:   "t"
    x9 DEFB 0x4                ;0xe559:   0x4
    x9 DEFB 0x22               ;0xe55a:   """
    x9 DEFB 0xef               ;0xe55b:   ('o') + 0x80
    x9 DEFB 0x1                ;0xe55c:   0x1
    x9 DEFB 0x2a               ;0xe55d:   "*"
    x9 DEFB 0x76               ;0xe55e:   "v"
    x9 DEFB 0x4                ;0xe55f:   0x4
    x9 DEFB 0x22               ;0xe560:   """
    x9 DEFB 0xf1               ;0xe561:   ('q') + 0x80
    x9 DEFB 0x1                ;0xe562:   0x1
    x9 DEFB 0xc9               ;0xe563:   ('I') + 0x80
;--------------------------------------
C_E564:                        ;          XREF: 0xE0AB 
    CALL C_E580                ;0xe564:   cd 80 e5  "..." 
    RET z                      ;0xe567:   c8  "." 
    CALL C_E773                ;0xe568:   cd 73 e7  ".s." 
    LD HL,0                    ;0xe56b:   21 00 00  "!.."  
    LD (0x1fd),HL              ;0xe56e:   22 fd 01  "".."  
    RET                        ;0xe571:   c9  "." 
;--------------------------------------
C_E572:                        ;          XREF: 0xE0AE 
    CALL C_E580                ;0xe572:   cd 80 e5  "..." 
    RET nz                     ;0xe575:   c0  "." 
    LD HL,1                    ;0xe576:   21 01 00  "!.."  
    LD (0x1fd),HL              ;0xe579:   22 fd 01  "".."  
    CALL C_E773                ;0xe57c:   cd 73 e7  ".s." 
    RET                        ;0xe57f:   c9  "." 
;--------------------------------------
C_E580:                        ;          XREF: 0xE0B1 
    CALL C_FF90                ;0xe580:   cd 90 ff  "..." 
    LD HL,(0x1fd)              ;0xe583:   2a fd 01  "*.."  
    RET                        ;0xe586:   c9  "." 
;--------------------------------------
C_E587:                        ;          XREF: 0xE0B4 
    LD HL,0                    ;0xe587:   21 00 00  "!.."  
    LD (0x1ff),HL              ;0xe58a:   22 ff 01  "".."  
    RET                        ;0xe58d:   c9  "." 
;--------------------------------------
C_E58E:                        ;          XREF: 0xE0B7 
    CALL C_E773                ;0xe58e:   cd 73 e7  ".s." 
    LD HL,1                    ;0xe591:   21 01 00  "!.."  
    LD (0x1ff),HL              ;0xe594:   22 ff 01  "".."  
    LD HL,(0x478)              ;0xe597:   2a 78 04  "*x."  
    LD A,H                     ;0xe59a:   7c  "|" 
    OR L                       ;0xe59b:   b5  "." 
    JR z, C_E5A1               ;0xe59c:   28 03  "(." 
    CALL C_E5C4                ;0xe59e:   cd c4 e5  "..." 
;--------------------------------------
C_E5A1:                        ;          XREF: 0xE59C 
    JP C_E773                  ;0xe5a1:   c3 73 e7  ".s." 
;--------------------------------------
C_E5A4:                        ;          XREF: 0xE0BA 
    LD HL,(0x1f1)              ;0xe5a4:   2a f1 01  "*.."  
    PUSH HL                    ;0xe5a7:   e5  "." 
    LD HL,(0x1ef)              ;0xe5a8:   2a ef 01  "*.."  
    PUSH HL                    ;0xe5ab:   e5  "." 
    CALL C_ECB0                ;0xe5ac:   cd b0 ec  "..." 
    POP DE                     ;0xe5af:   d1  "." 
    POP DE                     ;0xe5b0:   d1  "." 
    JR z, C_E5B6               ;0xe5b1:   28 03  "(." 
    CALL 0x451                 ;0xe5b3:   cd 51 04  ".Q." 
;--------------------------------------
C_E5B6:                        ;          XREF: 0xE5B1 
    LD HL,2                    ;0xe5b6:   21 02 00  "!.."  
    LD (0x1ff),HL              ;0xe5b9:   22 ff 01  "".."  
    RET                        ;0xe5bc:   c9  "." 
;--------------------------------------
C_E5BD:                        ;          XREF: 0xE0BD 
    CALL C_FF90                ;0xe5bd:   cd 90 ff  "..." 
    LD HL,(0x1ff)              ;0xe5c0:   2a ff 01  "*.."  
    RET                        ;0xe5c3:   c9  "." 
;--------------------------------------
C_E5C4:                        ;          XREF: 0xE25F 
    JR C_E5C9                  ;0xe5c4:   18 03  ".." 
;--------------------------------------
C_E5C6:                        ;          XREF: 0xE603 
    CALL C_E53C                ;0xe5c6:   cd 3c e5  ".<." 
;--------------------------------------
C_E5C9:                        ;          XREF: 0xE5C4 
    LD HL,(0x1ef)              ;0xe5c9:   2a ef 01  "*.."  
    LD DE,0                    ;0xe5cc:   11 00 00  "..."  
    EX DE,HL                   ;0xe5cf:   eb  "." 
    CALL C_FB54                ;0xe5d0:   cd 54 fb  ".T." 
    JR z, C_E605               ;0xe5d3:   28 30  "(0" 
    LD HL,0x1e7                ;0xe5d5:   21 e7 01  "!.."  
    CALL C_F209                ;0xe5d8:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe5db:   cd 4a f2  ".J." 
    LD HL,0x1df                ;0xe5de:   21 df 01  "!.."  
    PUSH HL                    ;0xe5e1:   e5  "." 
    LD HL,(0x197)              ;0xe5e2:   2a 97 01  "*.."  
    CALL C_F5CB                ;0xe5e5:   cd cb f5  "..." 
    CALL C_F2A6                ;0xe5e8:   cd a6 f2  "..." 
    POP HL                     ;0xe5eb:   e1  "." 
    PUSH HL                    ;0xe5ec:   e5  "." 
    CALL C_F209                ;0xe5ed:   cd 09 f2  "..." 
    CALL C_F30F                ;0xe5f0:   cd 0f f3  "..." 
    POP HL                     ;0xe5f3:   e1  "." 
    CALL C_F228                ;0xe5f4:   cd 28 f2  ".(." 
    CALL C_F24A                ;0xe5f7:   cd 4a f2  ".J." 
    CALL C_E4D9                ;0xe5fa:   cd d9 e4  "..." 
    EX DE,HL                   ;0xe5fd:   eb  "." 
    LD HL,0x10                 ;0xe5fe:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe601:   39  "9" 
    LD SP,HL                   ;0xe602:   f9  "." 
    JR C_E5C6                  ;0xe603:   18 c1  ".." 
;--------------------------------------
C_E605:                        ;          XREF: 0xE5D3 
    JR C_E60A                  ;0xe605:   18 03  ".." 
;--------------------------------------
C_E607:                        ;          XREF: 0xE644 
    CALL C_E53C                ;0xe607:   cd 3c e5  ".<." 
;--------------------------------------
C_E60A:                        ;          XREF: 0xE605 
    LD HL,(0x1ef)              ;0xe60a:   2a ef 01  "*.."  
    EX DE,HL                   ;0xe60d:   eb  "." 
    LD HL,(0x197)              ;0xe60e:   2a 97 01  "*.."  
    CALL C_FB3D                ;0xe611:   cd 3d fb  ".=." 
    JR z, C_E646               ;0xe614:   28 30  "(0" 
    LD HL,0x1e7                ;0xe616:   21 e7 01  "!.."  
    CALL C_F209                ;0xe619:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe61c:   cd 4a f2  ".J." 
    LD HL,0x1df                ;0xe61f:   21 df 01  "!.."  
    PUSH HL                    ;0xe622:   e5  "." 
    LD HL,(0x197)              ;0xe623:   2a 97 01  "*.."  
    CALL C_F5CB                ;0xe626:   cd cb f5  "..." 
    CALL C_F2A6                ;0xe629:   cd a6 f2  "..." 
    POP HL                     ;0xe62c:   e1  "." 
    PUSH HL                    ;0xe62d:   e5  "." 
    CALL C_F209                ;0xe62e:   cd 09 f2  "..." 
    CALL C_F308                ;0xe631:   cd 08 f3  "..." 
    POP HL                     ;0xe634:   e1  "." 
    CALL C_F228                ;0xe635:   cd 28 f2  ".(." 
    CALL C_F24A                ;0xe638:   cd 4a f2  ".J." 
    CALL C_E4D9                ;0xe63b:   cd d9 e4  "..." 
    EX DE,HL                   ;0xe63e:   eb  "." 
    LD HL,0x10                 ;0xe63f:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe642:   39  "9" 
    LD SP,HL                   ;0xe643:   f9  "." 
    JR C_E607                  ;0xe644:   18 c1  ".." 
;--------------------------------------
C_E646:                        ;          XREF: 0xE614 
    JR C_E64B                  ;0xe646:   18 03  ".." 
;--------------------------------------
C_E648:                        ;          XREF: 0xE685 
    CALL C_E53C                ;0xe648:   cd 3c e5  ".<." 
;--------------------------------------
C_E64B:                        ;          XREF: 0xE646 
    LD HL,(0x1f1)              ;0xe64b:   2a f1 01  "*.."  
    LD DE,0                    ;0xe64e:   11 00 00  "..."  
    EX DE,HL                   ;0xe651:   eb  "." 
    CALL C_FB54                ;0xe652:   cd 54 fb  ".T." 
    JR z, C_E687               ;0xe655:   28 30  "(0" 
    LD HL,0x1e7                ;0xe657:   21 e7 01  "!.."  
    PUSH HL                    ;0xe65a:   e5  "." 
    LD HL,(0x478)              ;0xe65b:   2a 78 04  "*x."  
    CALL C_F5CB                ;0xe65e:   cd cb f5  "..." 
    CALL C_F2A6                ;0xe661:   cd a6 f2  "..." 
    POP HL                     ;0xe664:   e1  "." 
    PUSH HL                    ;0xe665:   e5  "." 
    CALL C_F209                ;0xe666:   cd 09 f2  "..." 
    CALL C_F308                ;0xe669:   cd 08 f3  "..." 
    POP HL                     ;0xe66c:   e1  "." 
    CALL C_F228                ;0xe66d:   cd 28 f2  ".(." 
    CALL C_F24A                ;0xe670:   cd 4a f2  ".J." 
    LD HL,0x1df                ;0xe673:   21 df 01  "!.."  
    CALL C_F209                ;0xe676:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe679:   cd 4a f2  ".J." 
    CALL C_E4D9                ;0xe67c:   cd d9 e4  "..." 
    EX DE,HL                   ;0xe67f:   eb  "." 
    LD HL,0x10                 ;0xe680:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe683:   39  "9" 
    LD SP,HL                   ;0xe684:   f9  "." 
    JR C_E648                  ;0xe685:   18 c1  ".." 
;--------------------------------------
C_E687:                        ;          XREF: 0xE655 
    JR C_E68C                  ;0xe687:   18 03  ".." 
;--------------------------------------
C_E689:                        ;          XREF: 0xE6C5 
    CALL C_E53C                ;0xe689:   cd 3c e5  ".<." 
;--------------------------------------
C_E68C:                        ;          XREF: 0xE687 
    LD HL,(0x1f1)              ;0xe68c:   2a f1 01  "*.."  
    EX DE,HL                   ;0xe68f:   eb  "." 
    LD HL,(0x478)              ;0xe690:   2a 78 04  "*x."  
    CALL C_FB3D                ;0xe693:   cd 3d fb  ".=." 
    RET z                      ;0xe696:   c8  "." 
    LD HL,0x1e7                ;0xe697:   21 e7 01  "!.."  
    PUSH HL                    ;0xe69a:   e5  "." 
    LD HL,(0x478)              ;0xe69b:   2a 78 04  "*x."  
    CALL C_F5CB                ;0xe69e:   cd cb f5  "..." 
    CALL C_F2A6                ;0xe6a1:   cd a6 f2  "..." 
    POP HL                     ;0xe6a4:   e1  "." 
    PUSH HL                    ;0xe6a5:   e5  "." 
    CALL C_F209                ;0xe6a6:   cd 09 f2  "..." 
    CALL C_F30F                ;0xe6a9:   cd 0f f3  "..." 
    POP HL                     ;0xe6ac:   e1  "." 
    CALL C_F228                ;0xe6ad:   cd 28 f2  ".(." 
    CALL C_F24A                ;0xe6b0:   cd 4a f2  ".J." 
    LD HL,0x1df                ;0xe6b3:   21 df 01  "!.."  
    CALL C_F209                ;0xe6b6:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe6b9:   cd 4a f2  ".J." 
    CALL C_E4D9                ;0xe6bc:   cd d9 e4  "..." 
    EX DE,HL                   ;0xe6bf:   eb  "." 
    LD HL,0x10                 ;0xe6c0:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe6c3:   39  "9" 
    LD SP,HL                   ;0xe6c4:   f9  "." 
    JR C_E689                  ;0xe6c5:   18 c2  ".." 
    RET                        ;0xe6c7:   c9  "." 
;--------------------------------------
C_E6C8:                        ;          XREF: 0xE51B 
    CALL C_FF90                ;0xe6c8:   cd 90 ff  "..." 
    LD HL,8                    ;0xe6cb:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe6ce:   39  "9" 
    CALL C_F209                ;0xe6cf:   cd 09 f2  "..." 
    LD HL,0x1cf                ;0xe6d2:   21 cf 01  "!.."  
    CALL C_F1FB                ;0xe6d5:   cd fb f1  "..." 
    CALL C_F5AA                ;0xe6d8:   cd aa f5  "..." 
    JR z, C_E6EA               ;0xe6db:   28 0d  "(." 
    CALL C_F202                ;0xe6dd:   cd 02 f2  "..." 
    LD B,B                     ;0xe6e0:   40  "@" 
    ADD A,B                    ;0xe6e1:   80  "." 
    NOP                        ;0xe6e2:   00  "." 
    NOP                        ;0xe6e3:   00  "." 
    NOP                        ;0xe6e4:   00  "." 
    NOP                        ;0xe6e5:   00  "." 
    NOP                        ;0xe6e6:   00  "." 
    NOP                        ;0xe6e7:   00  "." 
    JR C_E6F5                  ;0xe6e8:   18 0b  ".." 
;--------------------------------------
C_E6EA:                        ;          XREF: 0xE6DB 
    CALL C_F202                ;0xe6ea:   cd 02 f2  "..." 
    RET nz                     ;0xe6ed:   c0  "." 
    LD A,A                     ;0xe6ee:   7f  "." 
    RST 0x38                   ;0xe6ef:   ff  "." 
    RST 0x38                   ;0xe6f0:   ff  "." 
    RST 0x38                   ;0xe6f1:   ff  "." 
    RST 0x38                   ;0xe6f2:   ff  "." 
    RST 0x38                   ;0xe6f3:   ff  "." 
    CP B                       ;0xe6f4:   b8  "." 
;--------------------------------------
C_E6F5:                        ;          XREF: 0xE6E8 
    LD HL,8                    ;0xe6f5:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe6f8:   39  "9" 
    CALL C_F1FB                ;0xe6f9:   cd fb f1  "..." 
    CALL C_F30F                ;0xe6fc:   cd 0f f3  "..." 
    JP C_F789                  ;0xe6ff:   c3 89 f7  "..." 
;--------------------------------------
C_E702:                        ;          XREF: 0xE420 
    CALL C_FF90                ;0xe702:   cd 90 ff  "..." 
    LD HL,8                    ;0xe705:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe708:   39  "9" 
    CALL C_F209                ;0xe709:   cd 09 f2  "..." 
    CALL C_F1F4                ;0xe70c:   cd f4 f1  "..." 
    JP nz, 0x803e              ;0xe70f:   c2 3e 80  ".>." 
    NOP                        ;0xe712:   00  "." 
    NOP                        ;0xe713:   00  "." 
    NOP                        ;0xe714:   00  "." 
    NOP                        ;0xe715:   00  "." 
    NOP                        ;0xe716:   00  "." 
    CALL C_F5AA                ;0xe717:   cd aa f5  "..." 
    JR z, C_E73A               ;0xe71a:   28 1e  "(." 
    LD HL,8                    ;0xe71c:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe71f:   39  "9" 
    CALL C_F209                ;0xe720:   cd 09 f2  "..." 
    CALL C_F1F4                ;0xe723:   cd f4 f1  "..." 
    LD B,D                     ;0xe726:   42  "B" 
    LD A,0x80                  ;0xe727:   3e 80  ">."  
    NOP                        ;0xe729:   00  "." 
    NOP                        ;0xe72a:   00  "." 
    NOP                        ;0xe72b:   00  "." 
    NOP                        ;0xe72c:   00  "." 
    NOP                        ;0xe72d:   00  "." 
    CALL C_F59E                ;0xe72e:   cd 9e f5  "..." 
    JR z, C_E73A               ;0xe731:   28 07  "(." 
    LD HL,8                    ;0xe733:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe736:   39  "9" 
    JP C_F209                  ;0xe737:   c3 09 f2  "..." 
;--------------------------------------
C_E73A:                        ;          XREF: 0xE71A 
    JP 0x451                   ;0xe73a:   c3 51 04  ".Q." 
;--------------------------------------
C_E73D:                        ;          XREF: 0xE816 
    CALL C_FF90                ;0xe73d:   cd 90 ff  "..." 
    LD HL,8                    ;0xe740:   21 08 00  "!.."  
    ADD HL,SP                  ;0xe743:   39  "9" 
    LD C,(HL)                  ;0xe744:   4e  "N" 
    INC HL                     ;0xe745:   23  "#" 
    LD B,(HL)                  ;0xe746:   46  "F" 
    LD H,B                     ;0xe747:   60  "`" 
    LD L,C                     ;0xe748:   69  "i" 
    LD DE,0x80                 ;0xe749:   11 80 00  "..."  
    CALL C_FADC                ;0xe74c:   cd dc fa  "..." 
    JR z, C_E75B               ;0xe74f:   28 0a  "(." 
    LD HL,D_FF00               ;0xe751:   21 00 ff  "!.."  
    LD D,B                     ;0xe754:   50  "P" 
    LD E,C                     ;0xe755:   59  "Y" 
    CALL C_FBE6                ;0xe756:   cd e6 fb  "..." 
    LD B,H                     ;0xe759:   44  "D" 
    LD C,L                     ;0xe75a:   4d  "M" 
;--------------------------------------
C_E75B:                        ;          XREF: 0xE74F 
    LD HL,10                   ;0xe75b:   21 0a 00  "!.."  
    ADD HL,SP                  ;0xe75e:   39  "9" 
    LD E,(HL)                  ;0xe75f:   5e  "^" 
    INC HL                     ;0xe760:   23  "#" 
    LD D,(HL)                  ;0xe761:   56  "V" 
    LD HL,2                    ;0xe762:   21 02 00  "!.."  
    CALL C_FADC                ;0xe765:   cd dc fa  "..." 
    JR z, C_E770               ;0xe768:   28 06  "(." 
    LD H,B                     ;0xe76a:   60  "`" 
    LD L,C                     ;0xe76b:   69  "i" 
    CALL C_FBD4                ;0xe76c:   cd d4 fb  "..." 
    RET                        ;0xe76f:   c9  "." 
;--------------------------------------
C_E770:                        ;          XREF: 0xE768 
    LD H,B                     ;0xe770:   60  "`" 
    LD L,C                     ;0xe771:   69  "i" 
    RET                        ;0xe772:   c9  "." 
;--------------------------------------
C_E773:                        ;          XREF: 0xE0C0 
    CALL C_FF90                ;0xe773:   cd 90 ff  "..." 
    CALL C_E580                ;0xe776:   cd 80 e5  "..." 
    RET z                      ;0xe779:   c8  "." 
    CALL C_E339                ;0xe77a:   cd 39 e3  ".9." 
    LD A,L                     ;0xe77d:   7d  "}" 
    LD (0x201),A               ;0xe77e:   32 01 02  "2.."  
    LD HL,(0x1fb)              ;0xe781:   2a fb 01  "*.."  
    INC HL                     ;0xe784:   23  "#" 
    INC HL                     ;0xe785:   23  "#" 
    INC HL                     ;0xe786:   23  "#" 
    LD DE,6                    ;0xe787:   11 06 00  "..."  
    EX DE,HL                   ;0xe78a:   eb  "." 
    CALL C_FB0A                ;0xe78b:   cd 0a fb  "..." 
    LD DE,15                   ;0xe78e:   11 0f 00  "..."  
    EX DE,HL                   ;0xe791:   eb  "." 
    CALL C_FB6A                ;0xe792:   cd 6a fb  ".j." 
    LD (0x49c),HL              ;0xe795:   22 9c 04  "".."  
    LD HL,(0x1fb)              ;0xe798:   2a fb 01  "*.."  
    INC HL                     ;0xe79b:   23  "#" 
    INC HL                     ;0xe79c:   23  "#" 
    INC HL                     ;0xe79d:   23  "#" 
    LD DE,0x5a                 ;0xe79e:   11 5a 00  ".Z."  
    EX DE,HL                   ;0xe7a1:   eb  "." 
    CALL C_FB0A                ;0xe7a2:   cd 0a fb  "..." 
    LD (0x49a),HL              ;0xe7a5:   22 9a 04  "".."  
    LD DE,1                    ;0xe7a8:   11 01 00  "..."  
    CALL C_FADC                ;0xe7ab:   cd dc fa  "..." 
    JR z, C_E7BC               ;0xe7ae:   28 0c  "(." 
    LD HL,(0x49c)              ;0xe7b0:   2a 9c 04  "*.."  
    LD DE,15                   ;0xe7b3:   11 0f 00  "..."  
    CALL C_FC6C                ;0xe7b6:   cd 6c fc  ".l." 
    LD (0x49c),HL              ;0xe7b9:   22 9c 04  "".."  
;--------------------------------------
C_E7BC:                        ;          XREF: 0xE7AE 
    LD HL,(0x49c)              ;0xe7bc:   2a 9c 04  "*.."  
    LD DE,6                    ;0xe7bf:   11 06 00  "..."  
    CALL C_FBBC                ;0xe7c2:   cd bc fb  "..." 
    LD DE,0x128                ;0xe7c5:   11 28 01  ".(."  
    ADD HL,DE                  ;0xe7c8:   19  "." 
    LD (0x498),HL              ;0xe7c9:   22 98 04  "".."  
    LD HL,(0x1ef)              ;0xe7cc:   2a ef 01  "*.."  
    LD (0x488),HL              ;0xe7cf:   22 88 04  "".."  
    LD HL,(0x1f1)              ;0xe7d2:   2a f1 01  "*.."  
    LD (0x48a),HL              ;0xe7d5:   22 8a 04  "".."  
    LD HL,0x48c                ;0xe7d8:   21 8c 04  "!.."  
    LD B,H                     ;0xe7db:   44  "D" 
    LD C,L                     ;0xe7dc:   4d  "M" 
    JR C_E7E7                  ;0xe7dd:   18 08  ".." 
;--------------------------------------
C_E7DF:                        ;          XREF: 0xE869 
    LD HL,4                    ;0xe7df:   21 04 00  "!.."  
    LD D,B                     ;0xe7e2:   50  "P" 
    LD E,C                     ;0xe7e3:   59  "Y" 
    ADD HL,DE                  ;0xe7e4:   19  "." 
    x2 DEFB "DMPY!"            ;0xe7e5:   0xe7e5 to 0xe7ea
    x9 DEFB 0x4                ;0xe7eb:   0x4
    x7 DEFB 0xcd               ;0xe7ec:   
    x4 DEFB "N", '|' + 0x80    ;0xe7ed:   0xe7ed to 0xe7ef
    x4 DEFB "({!", '|' + 0x80  ;0xe7ef:   0xe7ef to 0xe7f3
    x6 DEFB  '' + 0x80        ;0xe7f3:   
    x9 DEFB 0x9                ;0xe7f4:   0x9
    x4 DEFB "^#V", 'k' + 0x80  ;0xe7f5:   0xe7f5 to 0xe7f9
    x4 DEFB "",34,"z", 0x04    ;0xe7f9:   0xe7f9 to 0xe7fc
    x4 DEFB "!", '~' + 0x80    ;0xe7fc:   0xe7fc to 0xe7fe
    x6 DEFB  '' + 0x80        ;0xe7fe:   
    x9 DEFB 0x9                ;0xe7ff:   0x9
    x4 DEFB "^#V", 'k' + 0x80  ;0xe800:   0xe800 to 0xe804
    x4 DEFB "",34,"|", 0x04    ;0xe804:   0xe804 to 0xe807
    x4 DEFB "*", 0x9a          ;0xe807:   0xe807 to 0xe809
    x9 DEFB 0x4                ;0xe809:   0x4
    x7 DEFB 0xe5               ;0xe80a:   
    x4 DEFB "*", 0x98          ;0xe80b:   0xe80b to 0xe80d
    x9 DEFB 0x4                ;0xe80d:   0x4
    x4 DEFB "#",34,"", 0x98    ;0xe80e:   0xe80e to 0xe811
    x9 DEFB 0x4                ;0xe811:   0x4
    x4 DEFB "^", 0x16          ;0xe812:   0xe812 to 0xe814
    x7 DEFB 0x0                ;0xe814:   
    x7 DEFB 0xd5               ;0xe815:   
    x7 DEFB 0xcd               ;0xe816:   
    x4 DEFB "=", 'g' + 0x80    ;0xe817:   0xe817 to 0xe819
    x7 DEFB 0xd1               ;0xe819:   
    x7 DEFB 0xd1               ;0xe81a:   
    x7 DEFB 0xeb               ;0xe81b:   
    x4 DEFB "*", 0x88          ;0xe81c:   0xe81c to 0xe81e
    x9 DEFB 0x4                ;0xe81e:   0x4
    x9 DEFB 0x19               ;0xe81f:   0x19
    x7 DEFB 0xeb               ;0xe820:   
    x4 DEFB "`is#r", 'k' + 0x80  ;0xe821:   0xe821 to 0xe827
    x4 DEFB "",34,"~", 0x04    ;0xe827:   0xe827 to 0xe82a
    x4 DEFB "*", 0x9a          ;0xe82a:   0xe82a to 0xe82c
    x9 DEFB 0x4                ;0xe82c:   0x4
    x4 DEFB "#", 'e' + 0x80    ;0xe82d:   0xe82d to 0xe82f
    x4 DEFB "*", 0x98          ;0xe82f:   0xe82f to 0xe831
    x9 DEFB 0x4                ;0xe831:   0x4
    x4 DEFB "#",34,"", 0x98    ;0xe832:   0xe832 to 0xe835
    x9 DEFB 0x4                ;0xe835:   0x4
    x4 DEFB "^", 0x16          ;0xe836:   0xe836 to 0xe838
    x7 DEFB 0x0                ;0xe838:   
    x7 DEFB 0xd5               ;0xe839:   
    x7 DEFB 0xcd               ;0xe83a:   
    x4 DEFB "=", 'g' + 0x80    ;0xe83b:   0xe83b to 0xe83d
    x7 DEFB 0xd1               ;0xe83d:   
    x7 DEFB 0xd1               ;0xe83e:   
    x7 DEFB 0xeb               ;0xe83f:   
    x4 DEFB "*", 0x8a          ;0xe840:   0xe840 to 0xe842
    x9 DEFB 0x4                ;0xe842:   0x4
    x9 DEFB 0x19               ;0xe843:   0x19
    x7 DEFB 0xeb               ;0xe844:   
    x4 DEFB "!", 0x02          ;0xe845:   0xe845 to 0xe847
    x7 DEFB 0x0                ;0xe847:   
    x9 DEFB 0x9                ;0xe848:   0x9
    x4 DEFB "s#r", 'k' + 0x80  ;0xe849:   0xe849 to 0xe84d
    x4 DEFB "",34,"", 0x80     ;0xe84d:   0xe84d to 0xe84f
    x9 DEFB 0x4                ;0xe84f:   0x4
    x4 DEFB "*", 0x01          ;0xe850:   0xe850 to 0xe852
    x9 DEFB 0x2                ;0xe852:   0x2
    x7 DEFB 0xe5               ;0xe853:   
    x4 DEFB "*", 0x80          ;0xe854:   0xe854 to 0xe856
    x9 DEFB 0x4                ;0xe856:   0x4
    x7 DEFB 0xe5               ;0xe857:   
    x4 DEFB "*~", 0x04         ;0xe858:   0xe858 to 0xe85b
    x7 DEFB 0xe5               ;0xe85b:   
    x7 DEFB 0xcd               ;0xe85c:   
    x7 DEFB 0xda               ;0xe85d:   
    x7 DEFB 0xec               ;0xe85e:   
    x7 DEFB 0xd1               ;0xe85f:   
    x7 DEFB 0xd1               ;0xe860:   
    x4 DEFB "*", 0x01          ;0xe861:   0xe861 to 0xe863
    x9 DEFB 0x2                ;0xe863:   0x2
    x7 DEFB 0xe3               ;0xe864:   
    x7 DEFB 0xcd               ;0xe865:   
    x7 DEFB 0xb0               ;0xe866:   
    x7 DEFB 0xe9               ;0xe867:   
    x7 DEFB 0xd1               ;0xe868:   
    x7 DEFB 0xc3               ;0xe869:   
    x7 DEFB 0xdf               ;0xe86a:   
    x7 DEFB 0xe7               ;0xe86b:   
;--------------------------------------
C_E86C:                        ;          XREF: 0xE7EF 
    LD HL,(0x494)              ;0xe86c:   2a 94 04  "*.."  
    LD (0x47a),HL              ;0xe86f:   22 7a 04  ""z."  
    LD HL,(0x496)              ;0xe872:   2a 96 04  "*.."  
    LD (0x47c),HL              ;0xe875:   22 7c 04  ""|."  
    LD HL,(0x488)              ;0xe878:   2a 88 04  "*.."  
    LD (0x47e),HL              ;0xe87b:   22 7e 04  ""~."  
    LD HL,(0x48a)              ;0xe87e:   2a 8a 04  "*.."  
    LD (0x480),HL              ;0xe881:   22 80 04  "".."  
    LD HL,(0x201)              ;0xe884:   2a 01 02  "*.."  
    PUSH HL                    ;0xe887:   e5  "." 
    CALL C_E9B0                ;0xe888:   cd b0 e9  "..." 
    POP DE                     ;0xe88b:   d1  "." 
    RET                        ;0xe88c:   c9  "." 
;--------------------------------------
C_E88D:                        ;          XREF: 0xE0C3 
    CALL C_FF90                ;0xe88d:   cd 90 ff  "..." 
    LD HL,0x10                 ;0xe890:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe893:   39  "9" 
    CALL C_F209                ;0xe894:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe897:   cd 4a f2  ".J." 
    CALL C_E702                ;0xe89a:   cd 02 e7  "..." 
    CALL C_FF87                ;0xe89d:   cd 87 ff  "..." 
    CALL C_F24A                ;0xe8a0:   cd 4a f2  ".J." 
    LD HL,0x10                 ;0xe8a3:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe8a6:   39  "9" 
    CALL C_F209                ;0xe8a7:   cd 09 f2  "..." 
    CALL C_F24A                ;0xe8aa:   cd 4a f2  ".J." 
    CALL C_E702                ;0xe8ad:   cd 02 e7  "..." 
    CALL C_FF87                ;0xe8b0:   cd 87 ff  "..." 
    CALL C_F24A                ;0xe8b3:   cd 4a f2  ".J." 
    CALL C_E4D9                ;0xe8b6:   cd d9 e4  "..." 
    EX DE,HL                   ;0xe8b9:   eb  "." 
    LD HL,0x10                 ;0xe8ba:   21 10 00  "!.."  
    ADD HL,SP                  ;0xe8bd:   39  "9" 
    LD SP,HL                   ;0xe8be:   f9  "." 
    LD HL,(0x476)              ;0xe8bf:   2a 76 04  "*v."  
    PUSH HL                    ;0xe8c2:   e5  "." 
    LD HL,(0x474)              ;0xe8c3:   2a 74 04  "*t."  
    PUSH HL                    ;0xe8c6:   e5  "." 
    CALL C_EC1C                ;0xe8c7:   cd 1c ec  "..." 
    POP DE                     ;0xe8ca:   d1  "." 
    POP DE                     ;0xe8cb:   d1  "." 
    CALL C_E773                ;0xe8cc:   cd 73 e7  ".s." 
    LD HL,(0x1ef)              ;0xe8cf:   2a ef 01  "*.."  
    LD (0x47a),HL              ;0xe8d2:   22 7a 04  ""z."  
    LD HL,(0x1f1)              ;0xe8d5:   2a f1 01  "*.."  
    LD (0x47c),HL              ;0xe8d8:   22 7c 04  ""|."  
    LD HL,(0x474)              ;0xe8db:   2a 74 04  "*t."  
    LD (0x1ef),HL              ;0xe8de:   22 ef 01  "".."  
    LD (0x47e),HL              ;0xe8e1:   22 7e 04  ""~."  
    LD HL,(0x476)              ;0xe8e4:   2a 76 04  "*v."  
    LD (0x1f1),HL              ;0xe8e7:   22 f1 01  "".."  
    LD (0x480),HL              ;0xe8ea:   22 80 04  "".."  
    LD HL,0x1df                ;0xe8ed:   21 df 01  "!.."  
    PUSH HL                    ;0xe8f0:   e5  "." 
    LD HL,10                   ;0xe8f1:   21 0a 00  "!.."  
    ADD HL,SP                  ;0xe8f4:   39  "9" 
    CALL C_F209                ;0xe8f5:   cd 09 f2  "..." 
    POP HL                     ;0xe8f8:   e1  "." 
    CALL C_F228                ;0xe8f9:   cd 28 f2  ".(." 
    LD HL,0x1e7                ;0xe8fc:   21 e7 01  "!.."  
    PUSH HL                    ;0xe8ff:   e5  "." 
    LD HL,0x12                 ;0xe900:   21 12 00  "!.."  
    ADD HL,SP                  ;0xe903:   39  "9" 
    CALL C_F209                ;0xe904:   cd 09 f2  "..." 
    POP HL                     ;0xe907:   e1  "." 
    CALL C_F228                ;0xe908:   cd 28 f2  ".(." 
    CALL C_EBFF                ;0xe90b:   cd ff eb  "..." 
    JP z, C_E9A0               ;0xe90e:   ca a0 e9  "..." 
    CALL C_E30A                ;0xe911:   cd 0a e3  "..." 
    JP z, C_E99B               ;0xe914:   ca 9b e9  "..." 
;--------------------------------------
C_E917:                        ;          XREF: 0xE998 
    LD HL,(0x454)              ;0xe917:   2a 54 04  "*T."  
    PUSH HL                    ;0xe91a:   e5  "." 
    CALL C_E9B0                ;0xe91b:   cd b0 e9  "..." 
    POP DE                     ;0xe91e:   d1  "." 
    LD (0x49e),HL              ;0xe91f:   22 9e 04  "".."  
    LD DE,1                    ;0xe922:   11 01 00  "..."  
    EX DE,HL                   ;0xe925:   eb  "." 
    CALL C_FBEE                ;0xe926:   cd ee fb  "..." 
    LD B,H                     ;0xe929:   44  "D" 
    LD C,L                     ;0xe92a:   4d  "M" 
    LD HL,(0x476)              ;0xe92b:   2a 76 04  "*v."  
    PUSH HL                    ;0xe92e:   e5  "." 
    LD HL,(0x474)              ;0xe92f:   2a 74 04  "*t."  
    PUSH HL                    ;0xe932:   e5  "." 
    CALL C_ECB0                ;0xe933:   cd b0 ec  "..." 
    POP DE                     ;0xe936:   d1  "." 
    POP DE                     ;0xe937:   d1  "." 
    JR z, C_E99B               ;0xe938:   28 61  "(a" 
    LD HL,(0x47e)              ;0xe93a:   2a 7e 04  "*~."  
    LD (0x47a),HL              ;0xe93d:   22 7a 04  ""z."  
    LD HL,(0x480)              ;0xe940:   2a 80 04  "*.."  
    LD (0x47c),HL              ;0xe943:   22 7c 04  ""|."  
    LD HL,(0x49e)              ;0xe946:   2a 9e 04  "*.."  
    ADD HL,HL                  ;0xe949:   29  ")" 
    LD DE,0x468                ;0xe94a:   11 68 04  ".h."  
    ADD HL,DE                  ;0xe94d:   19  "." 
    LD E,(HL)                  ;0xe94e:   5e  "^" 
    INC HL                     ;0xe94f:   23  "#" 
    LD D,(HL)                  ;0xe950:   56  "V" 
    PUSH DE                    ;0xe951:   d5  "." 
    LD HL,0x47a                ;0xe952:   21 7a 04  "!z."  
    ADD HL,BC                  ;0xe955:   09  "." 
    ADD HL,BC                  ;0xe956:   09  "." 
    POP DE                     ;0xe957:   d1  "." 
    PUSH HL                    ;0xe958:   e5  "." 
    LD A,(HL)                  ;0xe959:   7e  "~" 
    INC HL                     ;0xe95a:   23  "#" 
    LD H,(HL)                  ;0xe95b:   66  "f" 
    LD L,A                     ;0xe95c:   6f  "o" 
    ADD HL,DE                  ;0xe95d:   19  "." 
    EX DE,HL                   ;0xe95e:   eb  "." 
    POP HL                     ;0xe95f:   e1  "." 
    LD (HL),E                  ;0xe960:   73  "s" 
    INC HL                     ;0xe961:   23  "#" 
    LD (HL),D                  ;0xe962:   72  "r" 
    LD HL,(0x474)              ;0xe963:   2a 74 04  "*t."  
    LD (0x47e),HL              ;0xe966:   22 7e 04  ""~."  
    LD HL,(0x476)              ;0xe969:   2a 76 04  "*v."  
    LD (0x480),HL              ;0xe96c:   22 80 04  "".."  
    LD HL,(0x49e)              ;0xe96f:   2a 9e 04  "*.."  
    ADD HL,HL                  ;0xe972:   29  ")" 
    LD DE,0x468                ;0xe973:   11 68 04  ".h."  
    ADD HL,DE                  ;0xe976:   19  "." 
    LD E,(HL)                  ;0xe977:   5e  "^" 
    INC HL                     ;0xe978:   23  "#" 
    LD D,(HL)                  ;0xe979:   56  "V" 
    PUSH DE                    ;0xe97a:   d5  "." 
    LD HL,0x47e                ;0xe97b:   21 7e 04  "!~."  
    ADD HL,BC                  ;0xe97e:   09  "." 
    ADD HL,BC                  ;0xe97f:   09  "." 
    POP DE                     ;0xe980:   d1  "." 
    PUSH HL                    ;0xe981:   e5  "." 
    LD A,(HL)                  ;0xe982:   7e  "~" 
    INC HL                     ;0xe983:   23  "#" 
    LD H,(HL)                  ;0xe984:   66  "f" 
    LD L,A                     ;0xe985:   6f  "o" 
    ADD HL,DE                  ;0xe986:   19  "." 
    EX DE,HL                   ;0xe987:   eb  "." 
    POP HL                     ;0xe988:   e1  "." 
    LD (HL),E                  ;0xe989:   73  "s" 
    INC HL                     ;0xe98a:   23  "#" 
    LD (HL),D                  ;0xe98b:   72  "r" 
    LD HL,(0x47e)              ;0xe98c:   2a 7e 04  "*~."  
    LD (0x474),HL              ;0xe98f:   22 74 04  ""t."  
    LD HL,(0x480)              ;0xe992:   2a 80 04  "*.."  
    LD (0x476),HL              ;0xe995:   22 76 04  ""v."  
    JP C_E917                  ;0xe998:   c3 17 e9  "..." 
;--------------------------------------
C_E99B:                        ;          XREF: 0xE914 
    CALL C_E5C4                ;0xe99b:   cd c4 e5  "..." 
    JR C_E9AD                  ;0xe99e:   18 0d  ".." 
;--------------------------------------
C_E9A0:                        ;          XREF: 0xE90E 
    CALL C_E30A                ;0xe9a0:   cd 0a e3  "..." 
    JR z, C_E9AD               ;0xe9a3:   28 08  "(." 
    LD HL,(0x454)              ;0xe9a5:   2a 54 04  "*T."  
    PUSH HL                    ;0xe9a8:   e5  "." 
    CALL C_E9B0                ;0xe9a9:   cd b0 e9  "..." 
    POP DE                     ;0xe9ac:   d1  "." 
;--------------------------------------
C_E9AD:                        ;          XREF: 0xE99E 
    JP C_E773                  ;0xe9ad:   c3 73 e7  ".s." 
;--------------------------------------
C_E9B0:                        ;          XREF: 0xE865 
    CALL C_FF90                ;0xe9b0:   cd 90 ff  "..." 
    LD HL,D_FFFF               ;0xe9b3:   21 ff ff  "!.."  
    LD (0x486),HL              ;0xe9b6:   22 86 04  "".."  
    LD (0x484),HL              ;0xe9b9:   22 84 04  "".."  
    LD (0x4a2),HL              ;0xe9bc:   22 a2 04  "".."  
    LD HL,0                    ;0xe9bf:   21 00 00  "!.."  
    LD (0x482),HL              ;0xe9c2:   22 82 04  "".."  
    LD HL,D_FFFF               ;0xe9c5:   21 ff ff  "!.."  
    LD (0x4a0),HL              ;0xe9c8:   22 a0 04  "".."  
;--------------------------------------
C_E9CB:                        ;          XREF: 0xEA54 
    LD HL,(0x4a0)              ;0xe9cb:   2a a0 04  "*.."  
    INC HL                     ;0xe9ce:   23  "#" 
    LD (0x4a0),HL              ;0xe9cf:   22 a0 04  "".."  
    LD DE,2                    ;0xe9d2:   11 02 00  "..."  
    EX DE,HL                   ;0xe9d5:   eb  "." 
    CALL C_FB54                ;0xe9d6:   cd 54 fb  ".T." 
    JP z, C_EA57               ;0xe9d9:   ca 57 ea  ".W." 
    LD HL,D_FFFF               ;0xe9dc:   21 ff ff  "!.."  
    LD B,H                     ;0xe9df:   44  "D" 
    LD C,L                     ;0xe9e0:   4d  "M" 
;--------------------------------------
C_E9E1:                        ;          XREF: 0xEA52 
    INC BC                     ;0xe9e1:   03  "." 
    LD H,B                     ;0xe9e2:   60  "`" 
    LD L,C                     ;0xe9e3:   69  "i" 
    LD DE,2                    ;0xe9e4:   11 02 00  "..."  
    EX DE,HL                   ;0xe9e7:   eb  "." 
    CALL C_FB54                ;0xe9e8:   cd 54 fb  ".T." 
    JR z, C_EA54               ;0xe9eb:   28 67  "(g" 
    LD H,B                     ;0xe9ed:   60  "`" 
    LD L,C                     ;0xe9ee:   69  "i" 
    ADD HL,HL                  ;0xe9ef:   29  ")" 
    ADD HL,HL                  ;0xe9f0:   29  ")" 
    LD DE,0x460                ;0xe9f1:   11 60 04  ".`."  
    ADD HL,DE                  ;0xe9f4:   19  "." 
    LD E,(HL)                  ;0xe9f5:   5e  "^" 
    INC HL                     ;0xe9f6:   23  "#" 
    LD D,(HL)                  ;0xe9f7:   56  "V" 
    PUSH DE                    ;0xe9f8:   d5  "." 
    LD H,B                     ;0xe9f9:   60  "`" 
    LD L,C                     ;0xe9fa:   69  "i" 
    ADD HL,HL                  ;0xe9fb:   29  ")" 
    PUSH HL                    ;0xe9fc:   e5  "." 
    LD HL,(0x4a0)              ;0xe9fd:   2a a0 04  "*.."  
;--------------------------------------
D_EA00:                        ;          XREF: 0xC25E 
    x9 DEFB 0x29               ;0xea00:   ")"
    x9 DEFB 0x29               ;0xea01:   ")"
    x9 DEFB 0xd1               ;0xea02:   ('Q') + 0x80
    x9 DEFB 0x19               ;0xea03:   0x19
    x9 DEFB 0x11               ;0xea04:   0x11
    x9 DEFB 0x7a               ;0xea05:   "z"
    x9 DEFB 0x4                ;0xea06:   0x4
    x9 DEFB 0x19               ;0xea07:   0x19
    x9 DEFB 0x5e               ;0xea08:   "^"
    x9 DEFB 0x23               ;0xea09:   "#"
    x9 DEFB 0x56               ;0xea0a:   "V"
    x9 DEFB 0xeb               ;0xea0b:   ('k') + 0x80
    x9 DEFB 0x22               ;0xea0c:   """
    x9 DEFB 0xa4               ;0xea0d:   ('$') + 0x80
    x9 DEFB 0x4                ;0xea0e:   0x4
    x9 DEFB 0xd1               ;0xea0f:   ('Q') + 0x80
    x9 DEFB 0xeb               ;0xea10:   ('k') + 0x80
    x9 DEFB 0xcd               ;0xea11:   ('M') + 0x80
    x9 DEFB 0x54               ;0xea12:   "T"
    x9 DEFB 0xfb               ;0xea13:   ('{') + 0x80
    x9 DEFB 0x28               ;0xea14:   "("
    x9 DEFB 0x14               ;0xea15:   0x14
    x9 DEFB 0x21               ;0xea16:   "!"
    x9 DEFB 0x0                ;0xea17:   0x0
    x9 DEFB 0x0                ;0xea18:   0x0
    x9 DEFB 0xe5               ;0xea19:   ('e') + 0x80
    x9 DEFB 0xc5               ;0xea1a:   ('E') + 0x80
    x9 DEFB 0x2a               ;0xea1b:   "*"
    x9 DEFB 0xa0               ;0xea1c:   (' ') + 0x80
    x9 DEFB 0x4                ;0xea1d:   0x4
    x9 DEFB 0xe5               ;0xea1e:   ('e') + 0x80
    x9 DEFB 0xcd               ;0xea1f:   ('M') + 0x80
    x9 DEFB 0xa1               ;0xea20:   ('!') + 0x80
    x9 DEFB 0xea               ;0xea21:   ('j') + 0x80
    x9 DEFB 0xd1               ;0xea22:   ('Q') + 0x80
    x9 DEFB 0xd1               ;0xea23:   ('Q') + 0x80
    x9 DEFB 0xd1               ;0xea24:   ('Q') + 0x80
    x9 DEFB 0x22               ;0xea25:   """
    x9 DEFB 0xa2               ;0xea26:   ('"') + 0x80
    x9 DEFB 0x4                ;0xea27:   0x4
    x9 DEFB 0x18               ;0xea28:   0x18
    x9 DEFB 0x28               ;0xea29:   "("
;--------------------------------------
C_EA2A:                        ;          XREF: 0xEA14 
    LD H,B                     ;0xea2a:   60  "`" 
    LD L,C                     ;0xea2b:   69  "i" 
    ADD HL,HL                  ;0xea2c:   29  ")" 
    ADD HL,HL                  ;0xea2d:   29  ")" 
    LD DE,0x462                ;0xea2e:   11 62 04  ".b."  
    ADD HL,DE                  ;0xea31:   19  "." 
    LD E,(HL)                  ;0xea32:   5e  "^" 
    INC HL                     ;0xea33:   23  "#" 
    LD D,(HL)                  ;0xea34:   56  "V" 
    PUSH DE                    ;0xea35:   d5  "." 
    LD HL,(0x4a4)              ;0xea36:   2a a4 04  "*.."  
    POP DE                     ;0xea39:   d1  "." 
    EX DE,HL                   ;0xea3a:   eb  "." 
    CALL C_FB55                ;0xea3b:   cd 55 fb  ".U." 
    JR z, C_EA52               ;0xea3e:   28 12  "(." 
    LD HL,1                    ;0xea40:   21 01 00  "!.."  
    PUSH HL                    ;0xea43:   e5  "." 
    PUSH BC                    ;0xea44:   c5  "." 
    LD HL,(0x4a0)              ;0xea45:   2a a0 04  "*.."  
    PUSH HL                    ;0xea48:   e5  "." 
    CALL C_EAA1                ;0xea49:   cd a1 ea  "..." 
    POP DE                     ;0xea4c:   d1  "." 
    POP DE                     ;0xea4d:   d1  "." 
    POP DE                     ;0xea4e:   d1  "." 
    LD (0x4a2),HL              ;0xea4f:   22 a2 04  "".."  
;--------------------------------------
C_EA52:                        ;          XREF: 0xEA28 
    JR C_E9E1                  ;0xea52:   18 8d  ".." 
;--------------------------------------
C_EA54:                        ;          XREF: 0xE9EB 
    JP C_E9CB                  ;0xea54:   c3 cb e9  "..." 
;--------------------------------------
C_EA57:                        ;          XREF: 0xE9D9 
    LD HL,(0x482)              ;0xea57:   2a 82 04  "*.."  
    LD A,H                     ;0xea5a:   7c  "|" 
    OR L                       ;0xea5b:   b5  "." 
    JR nz, C_EA9D              ;0xea5c:   20 3f  " ?" 
    LD HL,(0x47c)              ;0xea5e:   2a 7c 04  "*|."  
    PUSH HL                    ;0xea61:   e5  "." 
    LD HL,(0x47a)              ;0xea62:   2a 7a 04  "*z."  
    PUSH HL                    ;0xea65:   e5  "." 
    CALL C_ECB0                ;0xea66:   cd b0 ec  "..." 
    POP DE                     ;0xea69:   d1  "." 
    POP DE                     ;0xea6a:   d1  "." 
    JR nz, C_EA9D              ;0xea6b:   20 30  " 0" 
    LD HL,(0x480)              ;0xea6d:   2a 80 04  "*.."  
    PUSH HL                    ;0xea70:   e5  "." 
    LD HL,(0x47e)              ;0xea71:   2a 7e 04  "*~."  
    PUSH HL                    ;0xea74:   e5  "." 
    CALL C_ECB0                ;0xea75:   cd b0 ec  "..." 
    POP DE                     ;0xea78:   d1  "." 
    POP DE                     ;0xea79:   d1  "." 
    JR nz, C_EA9D              ;0xea7a:   20 21  " !" 
    LD HL,8                    ;0xea7c:   21 08 00  "!.."  
    ADD HL,SP                  ;0xea7f:   39  "9" 
    LD E,(HL)                  ;0xea80:   5e  "^" 
    INC HL                     ;0xea81:   23  "#" 
    LD D,(HL)                  ;0xea82:   56  "V" 
    PUSH DE                    ;0xea83:   d5  "." 
    LD HL,(0x480)              ;0xea84:   2a 80 04  "*.."  
    PUSH HL                    ;0xea87:   e5  "." 
    LD HL,(0x47e)              ;0xea88:   2a 7e 04  "*~."  
    PUSH HL                    ;0xea8b:   e5  "." 
    LD HL,(0x47c)              ;0xea8c:   2a 7c 04  "*|."  
    PUSH HL                    ;0xea8f:   e5  "." 
    LD HL,(0x47a)              ;0xea90:   2a 7a 04  "*z."  
    PUSH HL                    ;0xea93:   e5  "." 
    CALL C_EE7D                ;0xea94:   cd 7d ee  ".}." 
    EX DE,HL                   ;0xea97:   eb  "." 
    LD HL,10                   ;0xea98:   21 0a 00  "!.."  
    ADD HL,SP                  ;0xea9b:   39  "9" 
    LD SP,HL                   ;0xea9c:   f9  "." 
;--------------------------------------
C_EA9D:                        ;          XREF: 0xEA5C 
    LD HL,(0x4a2)              ;0xea9d:   2a a2 04  "*.."  
    RET                        ;0xeaa0:   c9  "." 
;--------------------------------------
C_EAA1:                        ;          XREF: 0xEA1F 
    CALL C_FF90                ;0xeaa1:   cd 90 ff  "..." 
    LD HL,10                   ;0xeaa4:   21 0a 00  "!.."  
    ADD HL,SP                  ;0xeaa7:   39  "9" 
    LD C,(HL)                  ;0xeaa8:   4e  "N" 
    INC HL                     ;0xeaa9:   23  "#" 
    LD B,(HL)                  ;0xeaaa:   46  "F" 
    LD HL,8                    ;0xeaab:   21 08 00  "!.."  
    ADD HL,SP                  ;0xeaae:   39  "9" 
    LD E,(HL)                  ;0xeaaf:   5e  "^" 
    INC HL                     ;0xeab0:   23  "#" 
    LD D,(HL)                  ;0xeab1:   56  "V" 
    EX DE,HL                   ;0xeab2:   eb  "." 
    LD (0x4a8),HL              ;0xeab3:   22 a8 04  "".."  
    LD H,B                     ;0xeab6:   60  "`" 
    LD L,C                     ;0xeab7:   69  "i" 
    ADD HL,HL                  ;0xeab8:   29  ")" 
    PUSH HL                    ;0xeab9:   e5  "." 
    LD HL,(0x4a8)              ;0xeaba:   2a a8 04  "*.."  
    LD DE,1                    ;0xeabd:   11 01 00  "..."  
    CALL C_FC18                ;0xeac0:   cd 18 fc  "..." 
    ADD HL,HL                  ;0xeac3:   29  ")" 
    ADD HL,HL                  ;0xeac4:   29  ")" 
    POP DE                     ;0xeac5:   d1  "." 
    ADD HL,DE                  ;0xeac6:   19  "." 
    LD DE,0x47a                ;0xeac7:   11 7a 04  ".z."  
    ADD HL,DE                  ;0xeaca:   19  "." 
    LD E,(HL)                  ;0xeacb:   5e  "^" 
    INC HL                     ;0xeacc:   23  "#" 
    LD D,(HL)                  ;0xeacd:   56  "V" 
    PUSH DE                    ;0xeace:   d5  "." 
    LD H,B                     ;0xeacf:   60  "`" 
    LD L,C                     ;0xead0:   69  "i" 
    ADD HL,HL                  ;0xead1:   29  ")" 
    PUSH HL                    ;0xead2:   e5  "." 
    LD HL,(0x4a8)              ;0xead3:   2a a8 04  "*.."  
    ADD HL,HL                  ;0xead6:   29  ")" 
    ADD HL,HL                  ;0xead7:   29  ")" 
    POP DE                     ;0xead8:   d1  "." 
    ADD HL,DE                  ;0xead9:   19  "." 
    LD DE,0x47a                ;0xeada:   11 7a 04  ".z."  
    ADD HL,DE                  ;0xeadd:   19  "." 
    LD E,(HL)                  ;0xeade:   5e  "^" 
    INC HL                     ;0xeadf:   23  "#" 
    LD D,(HL)                  ;0xeae0:   56  "V" 
    POP HL                     ;0xeae1:   e1  "." 
    CALL C_FC18                ;0xeae2:   cd 18 fc  "..." 
    LD (0x4aa),HL              ;0xeae5:   22 aa 04  "".."  
    LD A,H                     ;0xeae8:   7c  "|" 
    OR L                       ;0xeae9:   b5  "." 
    JP z, C_EBA7               ;0xeaea:   ca a7 eb  "..." 
    LD HL,(0x4aa)              ;0xeaed:   2a aa 04  "*.."  
    CALL C_F5CB                ;0xeaf0:   cd cb f5  "..." 
    CALL C_F24A                ;0xeaf3:   cd 4a f2  ".J." 
    LD HL,1                    ;0xeaf6:   21 01 00  "!.."  
    LD D,B                     ;0xeaf9:   50  "P" 
    LD E,C                     ;0xeafa:   59  "Y" 
    EX DE,HL                   ;0xeafb:   eb  "." 
    CALL C_FC18                ;0xeafc:   cd 18 fc  "..." 
    ADD HL,HL                  ;0xeaff:   29  ")" 
    PUSH HL                    ;0xeb00:   e5  "." 
    LD HL,(0x4a8)              ;0xeb01:   2a a8 04  "*.."  
    ADD HL,HL                  ;0xeb04:   29  ")" 
    ADD HL,HL                  ;0xeb05:   29  ")" 
    POP DE                     ;0xeb06:   d1  "." 
    ADD HL,DE                  ;0xeb07:   19  "." 
    LD DE,0x47a                ;0xeb08:   11 7a 04  ".z."  
    ADD HL,DE                  ;0xeb0b:   19  "." 
    LD E,(HL)                  ;0xeb0c:   5e  "^" 
    INC HL                     ;0xeb0d:   23  "#" 
    LD D,(HL)                  ;0xeb0e:   56  "V" 
    PUSH DE                    ;0xeb0f:   d5  "." 
    LD HL,1                    ;0xeb10:   21 01 00  "!.."  
    LD D,B                     ;0xeb13:   50  "P" 
    LD E,C                     ;0xeb14:   59  "Y" 
    EX DE,HL                   ;0xeb15:   eb  "." 
    CALL C_FC18                ;0xeb16:   cd 18 fc  "..." 
    ADD HL,HL                  ;0xeb19:   29  ")" 
    PUSH HL                    ;0xeb1a:   e5  "." 
    LD HL,(0x4a8)              ;0xeb1b:   2a a8 04  "*.."  
    LD DE,1                    ;0xeb1e:   11 01 00  "..."  
    CALL C_FC18                ;0xeb21:   cd 18 fc  "..." 
    ADD HL,HL                  ;0xeb24:   29  ")" 
    ADD HL,HL                  ;0xeb25:   29  ")" 
    POP DE                     ;0xeb26:   d1  "." 
    ADD HL,DE                  ;0xeb27:   19  "." 
    LD DE,0x47a                ;0xeb28:   11 7a 04  ".z."  
    ADD HL,DE                  ;0xeb2b:   19  "." 
    LD E,(HL)                  ;0xeb2c:   5e  "^" 
    INC HL                     ;0xeb2d:   23  "#" 
    LD D,(HL)                  ;0xeb2e:   56  "V" 
    POP HL                     ;0xeb2f:   e1  "." 
    CALL C_FC18                ;0xeb30:   cd 18 fc  "..." 
    CALL C_F5CB                ;0xeb33:   cd cb f5  "..." 
    CALL C_F24A                ;0xeb36:   cd 4a f2  ".J." 
    LD HL,0x1c                 ;0xeb39:   21 1c 00  "!.."  
    ADD HL,SP                  ;0xeb3c:   39  "9" 
    LD E,(HL)                  ;0xeb3d:   5e  "^" 
    INC HL                     ;0xeb3e:   23  "#" 
    LD D,(HL)                  ;0xeb3f:   56  "V" 
    EX DE,HL                   ;0xeb40:   eb  "." 
    ADD HL,HL                  ;0xeb41:   29  ")" 
    PUSH HL                    ;0xeb42:   e5  "." 
    LD H,B                     ;0xeb43:   60  "`" 
    LD L,C                     ;0xeb44:   69  "i" 
    ADD HL,HL                  ;0xeb45:   29  ")" 
    ADD HL,HL                  ;0xeb46:   29  ")" 
    POP DE                     ;0xeb47:   d1  "." 
    ADD HL,DE                  ;0xeb48:   19  "." 
    LD DE,0x460                ;0xeb49:   11 60 04  ".`."  
    ADD HL,DE                  ;0xeb4c:   19  "." 
    LD E,(HL)                  ;0xeb4d:   5e  "^" 
    INC HL                     ;0xeb4e:   23  "#" 
    LD D,(HL)                  ;0xeb4f:   56  "V" 
    EX DE,HL                   ;0xeb50:   eb  "." 
    LD (0x4ac),HL              ;0xeb51:   22 ac 04  "".."  
    PUSH HL                    ;0xeb54:   e5  "." 
    LD H,B                     ;0xeb55:   60  "`" 
    LD L,C                     ;0xeb56:   69  "i" 
    ADD HL,HL                  ;0xeb57:   29  ")" 
    PUSH HL                    ;0xeb58:   e5  "." 
    LD HL,(0x4a8)              ;0xeb59:   2a a8 04  "*.."  
    ADD HL,HL                  ;0xeb5c:   29  ")" 
    ADD HL,HL                  ;0xeb5d:   29  ")" 
    POP DE                     ;0xeb5e:   d1  "." 
    ADD HL,DE                  ;0xeb5f:   19  "." 
    LD DE,0x47a                ;0xeb60:   11 7a 04  ".z."  
    ADD HL,DE                  ;0xeb63:   19  "." 
    LD E,(HL)                  ;0xeb64:   5e  "^" 
    INC HL                     ;0xeb65:   23  "#" 
    LD D,(HL)                  ;0xeb66:   56  "V" 
    POP HL                     ;0xeb67:   e1  "." 
    CALL C_FC18                ;0xeb68:   cd 18 fc  "..." 
    CALL C_F5CB                ;0xeb6b:   cd cb f5  "..." 
    CALL C_F27B                ;0xeb6e:   cd 7b f2  ".{." 
    CALL C_F4E4                ;0xeb71:   cd e4 f4  "..." 
    CALL C_F27B                ;0xeb74:   cd 7b f2  ".{." 
    CALL C_F3E4                ;0xeb77:   cd e4 f3  "..." 
    CALL C_F24A                ;0xeb7a:   cd 4a f2  ".J." 
    CALL C_E6C8                ;0xeb7d:   cd c8 e6  "..." 
    EX DE,HL                   ;0xeb80:   eb  "." 
    CALL C_FF87                ;0xeb81:   cd 87 ff  "..." 
    PUSH DE                    ;0xeb84:   d5  "." 
    LD HL,1                    ;0xeb85:   21 01 00  "!.."  
    LD D,B                     ;0xeb88:   50  "P" 
    LD E,C                     ;0xeb89:   59  "Y" 
    EX DE,HL                   ;0xeb8a:   eb  "." 
    CALL C_FC18                ;0xeb8b:   cd 18 fc  "..." 
    ADD HL,HL                  ;0xeb8e:   29  ")" 
    PUSH HL                    ;0xeb8f:   e5  "." 
    LD HL,(0x4a8)              ;0xeb90:   2a a8 04  "*.."  
    ADD HL,HL                  ;0xeb93:   29  ")" 
    ADD HL,HL                  ;0xeb94:   29  ")" 
    POP DE                     ;0xeb95:   d1  "." 
    ADD HL,DE                  ;0xeb96:   19  "." 
    LD DE,0x47a                ;0xeb97:   11 7a 04  ".z."  
    ADD HL,DE                  ;0xeb9a:   19  "." 
    POP DE                     ;0xeb9b:   d1  "." 
    PUSH HL                    ;0xeb9c:   e5  "." 
    LD A,(HL)                  ;0xeb9d:   7e  "~" 
    INC HL                     ;0xeb9e:   23  "#" 
    LD H,(HL)                  ;0xeb9f:   66  "f" 
    LD L,A                     ;0xeba0:   6f  "o" 
    ADD HL,DE                  ;0xeba1:   19  "." 
    EX DE,HL                   ;0xeba2:   eb  "." 
    POP HL                     ;0xeba3:   e1  "." 
    LD (HL),E                  ;0xeba4:   73  "s" 
    INC HL                     ;0xeba5:   23  "#" 
    LD (HL),D                  ;0xeba6:   72  "r" 
;--------------------------------------
C_EBA7:                        ;          XREF: 0xEAEA 
    LD HL,(0x4ac)              ;0xeba7:   2a ac 04  "*.."  
    PUSH HL                    ;0xebaa:   e5  "." 
    LD H,B                     ;0xebab:   60  "`" 
    LD L,C                     ;0xebac:   69  "i" 
    ADD HL,HL                  ;0xebad:   29  ")" 
    PUSH HL                    ;0xebae:   e5  "." 
    LD HL,(0x4a8)              ;0xebaf:   2a a8 04  "*.."  
    ADD HL,HL                  ;0xebb2:   29  ")" 
    ADD HL,HL                  ;0xebb3:   29  ")" 
    POP DE                     ;0xebb4:   d1  "." 
    ADD HL,DE                  ;0xebb5:   19  "." 
    LD DE,0x47a                ;0xebb6:   11 7a 04  ".z."  
    ADD HL,DE                  ;0xebb9:   19  "." 
    POP DE                     ;0xebba:   d1  "." 
    LD (HL),E                  ;0xebbb:   73  "s" 
    INC HL                     ;0xebbc:   23  "#" 
    LD (HL),D                  ;0xebbd:   72  "r" 
    LD H,B                     ;0xebbe:   60  "`" 
    LD L,C                     ;0xebbf:   69  "i" 
    ADD HL,HL                  ;0xebc0:   29  ")" 
    EX DE,HL                   ;0xebc1:   eb  "." 
    LD HL,12                   ;0xebc2:   21 0c 00  "!.."  
    ADD HL,SP                  ;0xebc5:   39  "9" 
    LD A,(HL)                  ;0xebc6:   7e  "~" 
    INC HL                     ;0xebc7:   23  "#" 
    LD H,(HL)                  ;0xebc8:   66  "f" 
    LD L,A                     ;0xebc9:   6f  "o" 
    ADD HL,DE                  ;0xebca:   19  "." 
    LD (0x4a6),HL              ;0xebcb:   22 a6 04  "".."  
    EX DE,HL                   ;0xebce:   eb  "." 
    LD HL,(0x484)              ;0xebcf:   2a 84 04  "*.."  
    CALL C_FB24                ;0xebd2:   cd 24 fb  ".$." 
    JR z, C_EBDD               ;0xebd5:   28 06  "(." 
    LD HL,1                    ;0xebd7:   21 01 00  "!.."  
    LD (0x482),HL              ;0xebda:   22 82 04  "".."  
;--------------------------------------
C_EBDD:                        ;          XREF: 0xEBD5 
    LD HL,(0x4a6)              ;0xebdd:   2a a6 04  "*.."  
    EX DE,HL                   ;0xebe0:   eb  "." 
    LD HL,(0x486)              ;0xebe1:   2a 86 04  "*.."  
    CALL C_FB24                ;0xebe4:   cd 24 fb  ".$." 
    JR z, C_EBEF               ;0xebe7:   28 06  "(." 
    LD HL,1                    ;0xebe9:   21 01 00  "!.."  
    LD (0x482),HL              ;0xebec:   22 82 04  "".."  
;--------------------------------------
C_EBEF:                        ;          XREF: 0xEBE7 
    LD HL,(0x484)              ;0xebef:   2a 84 04  "*.."  
    LD (0x486),HL              ;0xebf2:   22 86 04  "".."  
    LD HL,(0x4a6)              ;0xebf5:   2a a6 04  "*.."  
    LD (0x484),HL              ;0xebf8:   22 84 04  "".."  
    LD HL,(0x4a6)              ;0xebfb:   2a a6 04  "*.."  
    RET                        ;0xebfe:   c9  "." 
;--------------------------------------
C_EBFF:                        ;          XREF: 0xE25A 
    CALL C_FF90                ;0xebff:   cd 90 ff  "..." 
    LD HL,(0x1ff)              ;0xec02:   2a ff 01  "*.."  
    LD DE,1                    ;0xec05:   11 01 00  "..."  
    CALL C_FB24                ;0xec08:   cd 24 fb  ".$." 
    JR z, C_EC14               ;0xec0b:   28 07  "(." 
    LD HL,(0x478)              ;0xec0d:   2a 78 04  "*x."  
    LD A,H                     ;0xec10:   7c  "|" 
    OR L                       ;0xec11:   b5  "." 
    JR nz, C_EC18              ;0xec12:   20 04  " ." 
;--------------------------------------
C_EC14:                        ;          XREF: 0xEC0B 
    LD HL,0                    ;0xec14:   21 00 00  "!.."  
    RET                        ;0xec17:   c9  "." 
;--------------------------------------
C_EC18:                        ;          XREF: 0xEC12 
    LD HL,1                    ;0xec18:   21 01 00  "!.."  
    RET                        ;0xec1b:   c9  "." 
;--------------------------------------
C_EC1C:                        ;          XREF: 0xE44D 
    CALL C_FF90                ;0xec1c:   cd 90 ff  "..." 
    LD HL,(0x1ff)              ;0xec1f:   2a ff 01  "*.."  
    LD DE,2                    ;0xec22:   11 02 00  "..."  
    CALL C_FB24                ;0xec25:   cd 24 fb  ".$." 
    JR z, C_EC44               ;0xec28:   28 1a  "(." 
    LD HL,10                   ;0xec2a:   21 0a 00  "!.."  
    ADD HL,SP                  ;0xec2d:   39  "9" 
    LD E,(HL)                  ;0xec2e:   5e  "^" 
    INC HL                     ;0xec2f:   23  "#" 
    LD D,(HL)                  ;0xec30:   56  "V" 
    PUSH DE                    ;0xec31:   d5  "." 
    LD HL,10                   ;0xec32:   21 0a 00  "!.."  
    ADD HL,SP                  ;0xec35:   39  "9" 
    LD E,(HL)                  ;0xec36:   5e  "^" 
    INC HL                     ;0xec37:   23  "#" 
    LD D,(HL)                  ;0xec38:   56  "V" 
    PUSH DE                    ;0xec39:   d5  "." 
    CALL C_ECB0                ;0xec3a:   cd b0 ec  "..." 
    POP DE                     ;0xec3d:   d1  "." 
    POP DE                     ;0xec3e:   d1  "." 
    JR z, C_EC44               ;0xec3f:   28 03  "(." 
    CALL 0x451                 ;0xec41:   cd 51 04  ".Q." 
;--------------------------------------
C_EC44:                        ;          XREF: 0xEC28 
    RET                        ;0xec44:   c9  "." 
;--------------------------------------
C_EC45:                        ;          XREF: 0xE0C6 
    CALL C_FF90                ;0xec45:   cd 90 ff  "..." 
;--------------------------------------
C_EC48:                        ;          XREF: 0xEC74 
    LD HL,8                    ;0xec48:   21 08 00  "!.."  
    ADD HL,SP                  ;0xec4b:   39  "9" 
    CALL C_F209                ;0xec4c:   cd 09 f2  "..." 
    LD HL,0x1c7                ;0xec4f:   21 c7 01  "!.."  
    CALL C_F1FB                ;0xec52:   cd fb f1  "..." 
    CALL C_F5AA                ;0xec55:   cd aa f5  "..." 
    JR z, C_EC76               ;0xec58:   28 1c  "(." 
    LD HL,8                    ;0xec5a:   21 08 00  "!.."  
    ADD HL,SP                  ;0xec5d:   39  "9" 
    PUSH HL                    ;0xec5e:   e5  "." 
    LD HL,0x1c7                ;0xec5f:   21 c7 01  "!.."  
    CALL C_F209                ;0xec62:   cd 09 f2  "..." 
    CALL C_F2A6                ;0xec65:   cd a6 f2  "..." 
    POP HL                     ;0xec68:   e1  "." 
    PUSH HL                    ;0xec69:   e5  "." 
    CALL C_F209                ;0xec6a:   cd 09 f2  "..." 
    CALL C_F308                ;0xec6d:   cd 08 f3  "..." 
    POP HL                     ;0xec70:   e1  "." 
    CALL C_F228                ;0xec71:   cd 28 f2  ".(." 
    JR C_EC48                  ;0xec74:   18 d2  ".." 
;--------------------------------------
C_EC76:                        ;          XREF: 0xEC58 
    LD HL,8                    ;0xec76:   21 08 00  "!.."  
    ADD HL,SP                  ;0xec79:   39  "9" 
    CALL C_F209                ;0xec7a:   cd 09 f2  "..." 
    CALL C_F1F4                ;0xec7d:   cd f4 f1  "..." 
    NOP                        ;0xec80:   00  "." 
    NOP                        ;0xec81:   00  "." 
    NOP                        ;0xec82:   00  "." 
    NOP                        ;0xec83:   00  "." 
    NOP                        ;0xec84:   00  "." 
    NOP                        ;0xec85:   00  "." 
    NOP                        ;0xec86:   00  "." 
    NOP                        ;0xec87:   00  "." 
    CALL C_F595                ;0xec88:   cd 95 f5  "..." 
    JR z, C_ECA9               ;0xec8b:   28 1c  "(." 
    LD HL,8                    ;0xec8d:   21 08 00  "!.."  
    ADD HL,SP                  ;0xec90:   39  "9" 
    PUSH HL                    ;0xec91:   e5  "." 
    LD HL,0x1c7                ;0xec92:   21 c7 01  "!.."  
    CALL C_F209                ;0xec95:   cd 09 f2  "..." 
    CALL C_F2A6                ;0xec98:   cd a6 f2  "..." 
    POP HL                     ;0xec9b:   e1  "." 
    PUSH HL                    ;0xec9c:   e5  "." 
    CALL C_F209                ;0xec9d:   cd 09 f2  "..." 
    CALL C_F30F                ;0xeca0:   cd 0f f3  "..." 
    POP HL                     ;0xeca3:   e1  "." 
    CALL C_F228                ;0xeca4:   cd 28 f2  ".(." 
    JR C_EC76                  ;0xeca7:   18 cd  ".." 
;--------------------------------------
C_ECA9:                        ;          XREF: 0xEC8B 
    LD HL,8                    ;0xeca9:   21 08 00  "!.."  
    ADD HL,SP                  ;0xecac:   39  "9" 
    JP C_F209                  ;0xecad:   c3 09 f2  "..." 
;--------------------------------------
C_ECB0:                        ;          XREF: 0xE051 
    PUSH BC                    ;0xecb0:   c5  "." 
    LD HL,4                    ;0xecb1:   21 04 00  "!.."  
    ADD HL,SP                  ;0xecb4:   39  "9" 
    LD E,(HL)                  ;0xecb5:   5e  "^" 
    INC HL                     ;0xecb6:   23  "#" 
    LD D,(HL)                  ;0xecb7:   56  "V" 
    INC HL                     ;0xecb8:   23  "#" 
    LD C,(HL)                  ;0xecb9:   4e  "N" 
    INC HL                     ;0xecba:   23  "#" 
    LD B,(HL)                  ;0xecbb:   46  "F" 
    LD HL,(0x466)              ;0xecbc:   2a 66 04  "*f."  
    LD A,H                     ;0xecbf:   7c  "|" 
    RLA                        ;0xecc0:   17  "." 
    JR c, C_ECD4               ;0xecc1:   38 11  "8." 
    SBC HL,BC                  ;0xecc3:   ed 42  ".B" 
    JR c, C_ECD4               ;0xecc5:   38 0d  "8." 
    LD HL,(0x462)              ;0xecc7:   2a 62 04  "*b."  
    SBC HL,DE                  ;0xecca:   ed 52  ".R" 
    JR c, C_ECD4               ;0xeccc:   38 06  "8." 
    POP BC                     ;0xecce:   c1  "." 
    LD HL,0                    ;0xeccf:   21 00 00  "!.."  
    AND L                      ;0xecd2:   a5  "." 
    RET                        ;0xecd3:   c9  "." 
;--------------------------------------
C_ECD4:                        ;          XREF: 0xECC1 
    POP BC                     ;0xecd4:   c1  "." 
    LD HL,1                    ;0xecd5:   21 01 00  "!.."  
    OR L                       ;0xecd8:   b5  "." 
    RET                        ;0xecd9:   c9  "." 
;--------------------------------------
C_ECDA:                        ;          XREF: 0xE4C6 
    POP HL                     ;0xecda:   e1  "." 
    LD (0x4ae),HL              ;0xecdb:   22 ae 04  "".."  
    CALL C_ECB0                ;0xecde:   cd b0 ec  "..." 
    JR nz, C_ECE6              ;0xece1:   20 03  " ." 
    CALL C_EE66                ;0xece3:   cd 66 ee  ".f." 
;--------------------------------------
C_ECE6:                        ;          XREF: 0xECE1 
    LD HL,(0x4ae)              ;0xece6:   2a ae 04  "*.."  
    JP (HL)                    ;0xece9:   e9  "." 
;--------------------------------------
C_ECEA:                        ;          XREF: 0xE003 
    LD A,(0x49)                ;0xecea:   3a 49 00  ":I."  
    CALL 0xbe9b                ;0xeced:   cd 9b be  "..." 
    LD C,0xbc                  ;0xecf0:   0e bc  ".."  
    LD A,(0x4a)                ;0xecf2:   3a 4a 00  ":J."  
    CALL 0xbe9b                ;0xecf5:   cd 9b be  "..." 
    SBC A,(HL)                 ;0xecf8:   9e  "." 
    CP (HL)                    ;0xecf9:   be  "." 
    RST 0                      ;0xecfa:   c7  "." 
;--------------------------------------
C_ECFB:                        ;          XREF: 0xE000 
    XOR A                      ;0xecfb:   af  "." 
    LD (0x48),A                ;0xecfc:   32 48 00  "2H."  
    DEC A                      ;0xecff:   3d  "=" 
    LD (0x40),A                ;0xed00:   32 40 00  "2@."  
    CALL 0xbe9b                ;0xed03:   cd 9b be  "..." 
    LD DE,0x32bc               ;0xed06:   11 bc 32  "..2"  
    LD C,C                     ;0xed09:   49  "I" 
    NOP                        ;0xed0a:   00  "." 
    XOR A                      ;0xed0b:   af  "." 
    CALL 0xbe9b                ;0xed0c:   cd 9b be  "..." 
    SBC A,(HL)                 ;0xed0f:   9e  "." 
    CP (HL)                    ;0xed10:   be  "." 
    LD (0x4a),A                ;0xed11:   32 4a 00  "2J."  
    RET                        ;0xed14:   c9  "." 
;--------------------------------------
C_ED15:                        ;          XREF: 0xE009 
    PUSH BC                    ;0xed15:   c5  "." 
    LD A,(0x1b8)               ;0xed16:   3a b8 01  ":.."  
    CALL C_EE34                ;0xed19:   cd 34 ee  ".4." 
    LD A,0x81                  ;0xed1c:   3e 81  ">."  
    LD (0x40),A                ;0xed1e:   32 40 00  "2@."  
    CALL C_EE50                ;0xed21:   cd 50 ee  ".P." 
    POP BC                     ;0xed24:   c1  "." 
    RET                        ;0xed25:   c9  "." 
;--------------------------------------
C_ED26:                        ;          XREF: 0xE006 
    PUSH BC                    ;0xed26:   c5  "." 
    LD HL,4                    ;0xed27:   21 04 00  "!.."  
    ADD HL,SP                  ;0xed2a:   39  "9" 
    LD A,(0x40)                ;0xed2b:   3a 40 00  ":@."  
    CP (HL)                    ;0xed2e:   be  "." 
    JP z, C_EDAE               ;0xed2f:   ca ae ed  "..." 
    PUSH HL                    ;0xed32:   e5  "." 
    PUSH AF                    ;0xed33:   f5  "." 
    CALL C_EE43                ;0xed34:   cd 43 ee  ".C." 
    POP AF                     ;0xed37:   f1  "." 
    OR A                       ;0xed38:   b7  "." 
    LD A,(0x1b7)               ;0xed39:   3a b7 01  ":.."  
    CALL m, C_EE34             ;0xed3c:   fc 34 ee  ".4." 
    CALL 0xbe9b                ;0xed3f:   cd 9b be  "..." 
    LD A,B                     ;0xed42:   78  "x" 
    CP E                       ;0xed43:   bb  "." 
    LD A,(0x40)                ;0xed44:   3a 40 00  ":@."  
    AND 0x7f                   ;0xed47:   e6 7f  ".." 
    DEC A                      ;0xed49:   3d  "=" 
    ADD A,L                    ;0xed4a:   85  "." 
    LD L,A                     ;0xed4b:   6f  "o" 
    EX (SP),HL                 ;0xed4c:   e3  "." 
    LD A,(HL)                  ;0xed4d:   7e  "~" 
    LD (0x40),A                ;0xed4e:   32 40 00  "2@."  
    SUB 1                      ;0xed51:   d6 01  ".." 
    LD L,A                     ;0xed53:   6f  "o" 
    JP nc, C_ED59              ;0xed54:   d2 59 ed  ".Y." 
    LD L,0x18                  ;0xed57:   2e 18  ".."  
;--------------------------------------
C_ED59:                        ;          XREF: 0xED54 
    LD A,(0x47)                ;0xed59:   3a 47 00  ":G."  
    LD H,A                     ;0xed5c:   67  "g" 
    LD D,0                     ;0xed5d:   16 00  ".."  
    LD E,0x18                  ;0xed5f:   1e 18  ".."  
    CALL 0xbe9b                ;0xed61:   cd 9b be  "..." 
    LD H,(HL)                  ;0xed64:   66  "f" 
    CP E                       ;0xed65:   bb  "." 
    POP HL                     ;0xed66:   e1  "." 
    CALL C_EE24                ;0xed67:   cd 24 ee  ".$." 
    LD HL,0xc7                 ;0xed6a:   21 c7 00  "!.."  
    LD (0x4b),HL               ;0xed6d:   22 4b 00  ""K."  
    LD HL,0                    ;0xed70:   21 00 00  "!.."  
    LD DE,0x18f                ;0xed73:   11 8f 01  "..."  
    LD A,(0x40)                ;0xed76:   3a 40 00  ":@."  
    OR A                       ;0xed79:   b7  "." 
    JP z, C_ED8C               ;0xed7a:   ca 8c ed  "..." 
    LD L,A                     ;0xed7d:   6f  "o" 
    ADD HL,HL                  ;0xed7e:   29  ")" 
    ADD HL,HL                  ;0xed7f:   29  ")" 
    ADD HL,HL                  ;0xed80:   29  ")" 
    DEC HL                     ;0xed81:   2b  "+" 
    LD (0x4b),HL               ;0xed82:   22 4b 00  ""K."  
    INC HL                     ;0xed85:   23  "#" 
    ADD HL,HL                  ;0xed86:   29  ")" 
    DEC HL                     ;0xed87:   2b  "+" 
    CALL C_F0C5                ;0xed88:   cd c5 f0  "..." 
    ADD HL,DE                  ;0xed8b:   19  "." 
;--------------------------------------
C_ED8C:                        ;          XREF: 0xED7A 
    LD (0x4d),HL               ;0xed8c:   22 4d 00  ""M."  
    CALL 0xbe9b                ;0xed8f:   cd 9b be  "..." 
    JP nc, 0x2abb              ;0xed92:   d2 bb 2a  "..*" 
    LD C,E                     ;0xed95:   4b  "K" 
    NOP                        ;0xed96:   00  "." 
    INC HL                     ;0xed97:   23  "#" 
    CALL C_F0C5                ;0xed98:   cd c5 f0  "..." 
    LD DE,0x190                ;0xed9b:   11 90 01  "..."  
    ADD HL,DE                  ;0xed9e:   19  "." 
    LD DE,0x140                ;0xed9f:   11 40 01  ".@."  
    CALL 0xbe9b                ;0xeda2:   cd 9b be  "..." 
    RET                        ;0xeda5:   c9  "." 
    CP E                       ;0xeda6:   bb  "." 
    LD A,(0x40)                ;0xeda7:   3a 40 00  ":@."  
    OR A                       ;0xedaa:   b7  "." 
    CALL nz, C_EE50            ;0xedab:   c4 50 ee  ".P." 
;--------------------------------------
C_EDAE:                        ;          XREF: 0xED2F 
    POP BC                     ;0xedae:   c1  "." 
    RET                        ;0xedaf:   c9  "." 
;--------------------------------------
C_EDB0:                        ;          XREF: 0xE018 
    PUSH BC                    ;0xedb0:   c5  "." 
    CALL C_EE43                ;0xedb1:   cd 43 ee  ".C." 
    CALL C_EE5D                ;0xedb4:   cd 5d ee  ".]." 
    CALL C_EDFD                ;0xedb7:   cd fd ed  "..." 
    JP c, C_EDCE               ;0xedba:   da ce ed  "..." 
    JP nz, C_EDC8              ;0xedbd:   c2 c8 ed  "..." 
    CALL 0xbe9b                ;0xedc0:   cd 9b be  "..." 
    LD L,H                     ;0xedc3:   6c  "l" 
    CP E                       ;0xedc4:   bb  "." 
    JP C_EDCE                  ;0xedc5:   c3 ce ed  "..." 
;--------------------------------------
C_EDC8:                        ;          XREF: 0xEDBD 
    LD A,B                     ;0xedc8:   78  "x" 
    CALL 0xbe9b                ;0xedc9:   cd 9b be  "..." 
    LD B,H                     ;0xedcc:   44  "D" 
    CP H                       ;0xedcd:   bc  "." 
;--------------------------------------
C_EDCE:                        ;          XREF: 0xEDBA 
    CALL C_EE50                ;0xedce:   cd 50 ee  ".P." 
    POP BC                     ;0xedd1:   c1  "." 
    RET                        ;0xedd2:   c9  "." 
;--------------------------------------
C_EDD3:                        ;          XREF: 0xE015 
    LD A,(0x40)                ;0xedd3:   3a 40 00  ":@."  
    OR A                       ;0xedd6:   b7  "." 
    RET z                      ;0xedd7:   c8  "." 
    PUSH BC                    ;0xedd8:   c5  "." 
    CALL C_EE43                ;0xedd9:   cd 43 ee  ".C." 
    CALL C_EE5D                ;0xeddc:   cd 5d ee  ".]." 
    CALL C_EDFD                ;0xeddf:   cd fd ed  "..." 
    JP c, C_EDF8               ;0xede2:   da f8 ed  "..." 
    LD A,B                     ;0xede5:   78  "x" 
    LD B,0xff                  ;0xede6:   06 ff  ".."  
    JP nz, C_EDF3              ;0xede8:   c2 f3 ed  "..." 
    CALL 0xbe9b                ;0xedeb:   cd 9b be  "..." 
    LD C,L                     ;0xedee:   4d  "M" 
    CP H                       ;0xedef:   bc  "." 
    JP C_EDF8                  ;0xedf0:   c3 f8 ed  "..." 
;--------------------------------------
C_EDF3:                        ;          XREF: 0xEDE8 
    CALL 0xbe9b                ;0xedf3:   cd 9b be  "..." 
    LD D,B                     ;0xedf6:   50  "P" 
    CP H                       ;0xedf7:   bc  "." 
;--------------------------------------
C_EDF8:                        ;          XREF: 0xEDE2 
    CALL C_EE50                ;0xedf8:   cd 50 ee  ".P." 
    POP BC                     ;0xedfb:   c1  "." 
    RET                        ;0xedfc:   c9  "." 
;--------------------------------------
C_EDFD:                        ;          XREF: 0xEDB7 
    CALL 0xbe9b                ;0xedfd:   cd 9b be  "..." 
    SBC A,C                    ;0xee00:   99  "." 
    CP E                       ;0xee01:   bb  "." 
    CALL 0xbe9b                ;0xee02:   cd 9b be  "..." 
    INC L                      ;0xee05:   2c  "," 
    CP H                       ;0xee06:   bc  "." 
    LD B,A                     ;0xee07:   47  "G" 
    DEC E                      ;0xee08:   1d  "." 
    DEC L                      ;0xee09:   2d  "-" 
    LD H,0                     ;0xee0a:   26 00  "&."  
    LD A,(0x47)                ;0xee0c:   3a 47 00  ":G."  
    LD D,A                     ;0xee0f:   57  "W" 
    LD A,0x18                  ;0xee10:   3e 18  ">."  
    CP L                       ;0xee12:   bd  "." 
    RET c                      ;0xee13:   d8  "." 
    CP E                       ;0xee14:   bb  "." 
    RET c                      ;0xee15:   d8  "." 
    LD A,E                     ;0xee16:   7b  "{" 
    XOR 0x18                   ;0xee17:   ee 18  ".." 
    RET nz                     ;0xee19:   c0  "." 
    LD A,L                     ;0xee1a:   7d  "}" 
    OR A                       ;0xee1b:   b7  "." 
    RET                        ;0xee1c:   c9  "." 
;--------------------------------------
C_EE1D:                        ;          XREF: 0xE01B 
    PUSH BC                    ;0xee1d:   c5  "." 
    CALL C_EE5D                ;0xee1e:   cd 5d ee  ".]." 
    POP BC                     ;0xee21:   c1  "." 
    LD H,L                     ;0xee22:   65  "e" 
    LD L,E                     ;0xee23:   6b  "k" 
;--------------------------------------
C_EE24:                        ;          XREF: 0xED67 
    LD A,(0x40)                ;0xee24:   3a 40 00  ":@."  
    AND 0x7f                   ;0xee27:   e6 7f  ".." 
    DEC A                      ;0xee29:   3d  "=" 
    LD E,A                     ;0xee2a:   5f  "_" 
    LD A,L                     ;0xee2b:   7d  "}" 
    SUB E                      ;0xee2c:   93  "." 
    LD L,A                     ;0xee2d:   6f  "o" 
    CALL 0xbe9b                ;0xee2e:   cd 9b be  "..." 
    LD (HL),L                  ;0xee31:   75  "u" 
    CP E                       ;0xee32:   bb  "." 
    RET                        ;0xee33:   c9  "." 
;--------------------------------------
C_EE34:                        ;          XREF: 0xED19 
    CALL 0xbe9b                ;0xee34:   cd 9b be  "..." 
    LD C,0xbc                  ;0xee37:   0e bc  ".."  
    CALL 0xbe9b                ;0xee39:   cd 9b be  "..." 
    LD L,C                     ;0xee3c:   69  "i" 
    CP E                       ;0xee3d:   bb  "." 
    LD A,D                     ;0xee3e:   7a  "z" 
    LD (0x47),A                ;0xee3f:   32 47 00  "2G."  
    RET                        ;0xee42:   c9  "." 
;--------------------------------------
C_EE43:                        ;          XREF: 0xED34 
    LD HL,0x48                 ;0xee43:   21 48 00  "!H."  
    LD A,(HL)                  ;0xee46:   7e  "~" 
    OR A                       ;0xee47:   b7  "." 
    RET nz                     ;0xee48:   c0  "." 
    DEC (HL)                   ;0xee49:   35  "5" 
    CALL 0xbe9b                ;0xee4a:   cd 9b be  "..." 
    LD A,(HL)                  ;0xee4d:   7e  "~" 
    CP E                       ;0xee4e:   bb  "." 
    RET                        ;0xee4f:   c9  "." 
;--------------------------------------
C_EE50:                        ;          XREF: 0xED21 
    LD HL,0x48                 ;0xee50:   21 48 00  "!H."  
    LD A,(HL)                  ;0xee53:   7e  "~" 
    OR A                       ;0xee54:   b7  "." 
    RET z                      ;0xee55:   c8  "." 
    INC (HL)                   ;0xee56:   34  "4" 
    CALL 0xbe9b                ;0xee57:   cd 9b be  "..." 
    LD A,E                     ;0xee5a:   7b  "{" 
    CP E                       ;0xee5b:   bb  "." 
    RET                        ;0xee5c:   c9  "." 
;--------------------------------------
C_EE5D:                        ;          XREF: 0xEDB4 
    LD HL,8                    ;0xee5d:   21 08 00  "!.."  
    ADD HL,SP                  ;0xee60:   39  "9" 
    LD E,(HL)                  ;0xee61:   5e  "^" 
    DEC HL                     ;0xee62:   2b  "+" 
    DEC HL                     ;0xee63:   2b  "+" 
    LD L,(HL)                  ;0xee64:   6e  "n" 
    RET                        ;0xee65:   c9  "." 
;--------------------------------------
C_EE66:                        ;          XREF: 0xE01E 
    PUSH BC                    ;0xee66:   c5  "." 
    LD HL,9                    ;0xee67:   21 09 00  "!.."  
    ADD HL,SP                  ;0xee6a:   39  "9" 
    CALL C_EED6                ;0xee6b:   cd d6 ee  "..." 
    CALL C_EEF3                ;0xee6e:   cd f3 ee  "..." 
    PUSH DE                    ;0xee71:   d5  "." 
    CALL C_EF02                ;0xee72:   cd 02 ef  "..." 
    POP HL                     ;0xee75:   e1  "." 
    CALL 0xbe9b                ;0xee76:   cd 9b be  "..." 
    JP pe, 0xc1bb              ;0xee79:   ea bb c1  "..." 
    RET                        ;0xee7c:   c9  "." 
;--------------------------------------
C_EE7D:                        ;          XREF: 0xE021 
    PUSH BC                    ;0xee7d:   c5  "." 
    LD HL,13                   ;0xee7e:   21 0d 00  "!.."  
    ADD HL,SP                  ;0xee81:   39  "9" 
    CALL C_EED6                ;0xee82:   cd d6 ee  "..." 
    CALL C_EEF3                ;0xee85:   cd f3 ee  "..." 
    PUSH DE                    ;0xee88:   d5  "." 
    CALL C_EF02                ;0xee89:   cd 02 ef  "..." 
    EX (SP),HL                 ;0xee8c:   e3  "." 
    CALL 0xbe9b                ;0xee8d:   cd 9b be  "..." 
    RET nz                     ;0xee90:   c0  "." 
    CP E                       ;0xee91:   bb  "." 
    POP HL                     ;0xee92:   e1  "." 
    CALL C_EEF3                ;0xee93:   cd f3 ee  "..." 
    PUSH DE                    ;0xee96:   d5  "." 
    CALL C_EF02                ;0xee97:   cd 02 ef  "..." 
    POP HL                     ;0xee9a:   e1  "." 
    CALL 0xbe9b                ;0xee9b:   cd 9b be  "..." 
    OR 0xbb                    ;0xee9e:   f6 bb  ".." 
    POP BC                     ;0xeea0:   c1  "." 
    RET                        ;0xeea1:   c9  "." 
;--------------------------------------
C_EEA2:                        ;          XREF: 0xE027 
    PUSH BC                    ;0xeea2:   c5  "." 
    LD HL,7                    ;0xeea3:   21 07 00  "!.."  
    ADD HL,SP                  ;0xeea6:   39  "9" 
    CALL C_EF0D                ;0xeea7:   cd 0d ef  "..." 
    EX DE,HL                   ;0xeeaa:   eb  "." 
    CALL C_F0C5                ;0xeeab:   cd c5 f0  "..." 
    LD DE,0x18f                ;0xeeae:   11 8f 01  "..."  
    PUSH DE                    ;0xeeb1:   d5  "." 
    ADD HL,DE                  ;0xeeb2:   19  "." 
    EX DE,HL                   ;0xeeb3:   eb  "." 
    LD HL,(0x4d)               ;0xeeb4:   2a 4d 00  "*M."  
    EX DE,HL                   ;0xeeb7:   eb  "." 
    CALL C_F0B9                ;0xeeb8:   cd b9 f0  "..." 
    JP nc, C_EEBF              ;0xeebb:   d2 bf ee  "..." 
    EX DE,HL                   ;0xeebe:   eb  "." 
;--------------------------------------
C_EEBF:                        ;          XREF: 0xEEBB 
    POP DE                     ;0xeebf:   d1  "." 
    PUSH DE                    ;0xeec0:   d5  "." 
    CALL 0xbe9b                ;0xeec1:   cd 9b be  "..." 
    JP nc, 0xcdbb              ;0xeec4:   d2 bb cd  "..." 
    SBC A,E                    ;0xeec7:   9b  "." 
    CP (HL)                    ;0xeec8:   be  "." 
    IN A,(0x00bb)              ;0xeec9:   db bb  ".." 
    POP DE                     ;0xeecb:   d1  "." 
    LD HL,(0x4d)               ;0xeecc:   2a 4d 00  "*M."  
    CALL 0xbe9b                ;0xeecf:   cd 9b be  "..." 
    JP nc, 0xc1bb              ;0xeed2:   d2 bb c1  "..." 
    RET                        ;0xeed5:   c9  "." 
;--------------------------------------
C_EED6:                        ;          XREF: 0xEE6B 
    CALL C_EF0D                ;0xeed6:   cd 0d ef  "..." 
    LD A,D                     ;0xeed9:   7a  "z" 
    DEC A                      ;0xeeda:   3d  "=" 
    CP 1                       ;0xeedb:   fe 01  ".." 
    JP z, C_EEE1               ;0xeedd:   ca e1 ee  "..." 
    XOR A                      ;0xeee0:   af  "." 
;--------------------------------------
C_EEE1:                        ;          XREF: 0xEEDD 
    PUSH HL                    ;0xeee1:   e5  "." 
    CALL 0xbe9b                ;0xeee2:   cd 9b be  "..." 
    LD E,C                     ;0xeee5:   59  "Y" 
    CP H                       ;0xeee6:   bc  "." 
    POP HL                     ;0xeee7:   e1  "." 
    LD A,E                     ;0xeee8:   7b  "{" 
    CALL 0xbe9b                ;0xeee9:   cd 9b be  "..." 
    SBC A,0xbb                 ;0xeeec:   de bb  ".." 
    RET                        ;0xeeee:   c9  "." 
    LD HL,0                    ;0xeeef:   21 00 00  "!.."  
    RET                        ;0xeef2:   c9  "." 
;--------------------------------------
C_EEF3:                        ;          XREF: 0xEE6E 
    CALL C_EF0D                ;0xeef3:   cd 0d ef  "..." 
    PUSH HL                    ;0xeef6:   e5  "." 
    LD HL,(0x4b)               ;0xeef7:   2a 4b 00  "*K."  
    EX DE,HL                   ;0xeefa:   eb  "." 
    CALL C_F0C5                ;0xeefb:   cd c5 f0  "..." 
    ADD HL,DE                  ;0xeefe:   19  "." 
    EX DE,HL                   ;0xeeff:   eb  "." 
    POP HL                     ;0xef00:   e1  "." 
    RET                        ;0xef01:   c9  "." 
;--------------------------------------
C_EF02:                        ;          XREF: 0xEE72 
    CALL C_EF0D                ;0xef02:   cd 0d ef  "..." 
    PUSH HL                    ;0xef05:   e5  "." 
    LD HL,D_FEC0               ;0xef06:   21 c0 fe  "!.."  
    ADD HL,DE                  ;0xef09:   19  "." 
    EX DE,HL                   ;0xef0a:   eb  "." 
    POP HL                     ;0xef0b:   e1  "." 
    RET                        ;0xef0c:   c9  "." 
;--------------------------------------
C_EF0D:                        ;          XREF: 0xEEA7 
    LD D,(HL)                  ;0xef0d:   56  "V" 
    DEC HL                     ;0xef0e:   2b  "+" 
    LD E,(HL)                  ;0xef0f:   5e  "^" 
    DEC HL                     ;0xef10:   2b  "+" 
    LD A,E                     ;0xef11:   7b  "{" 
    RET                        ;0xef12:   c9  "." 
;--------------------------------------
C_EF13:                        ;          XREF: 0xE048 
    PUSH BC                    ;0xef13:   c5  "." 
    LD HL,11                   ;0xef14:   21 0b 00  "!.."  
    ADD HL,SP                  ;0xef17:   39  "9" 
    CALL C_EED6                ;0xef18:   cd d6 ee  "..." 
    CALL C_EF0D                ;0xef1b:   cd 0d ef  "..." 
    PUSH DE                    ;0xef1e:   d5  "." 
    CALL C_EEF3                ;0xef1f:   cd f3 ee  "..." 
    PUSH DE                    ;0xef22:   d5  "." 
    CALL C_EF02                ;0xef23:   cd 02 ef  "..." 
    POP HL                     ;0xef26:   e1  "." 
    CALL 0xbe9b                ;0xef27:   cd 9b be  "..." 
    RET nz                     ;0xef2a:   c0  "." 
    CP E                       ;0xef2b:   bb  "." 
    LD A,0xff                  ;0xef2c:   3e ff  ">."  
    CALL 0xbe9b                ;0xef2e:   cd 9b be  "..." 
    LD H,E                     ;0xef31:   63  "c" 
    CP E                       ;0xef32:   bb  "." 
    POP HL                     ;0xef33:   e1  "." 
;--------------------------------------
C_EF34:                        ;          XREF: 0xEF3A 
    LD A,(HL)                  ;0xef34:   7e  "~" 
    INC HL                     ;0xef35:   23  "#" 
    OR A                       ;0xef36:   b7  "." 
    CALL nz, TXT_OUTPUT        ;0xef37:   c4 5a bb  ".Z." 
    JP nz, C_EF34              ;0xef3a:   c2 34 ef  ".4." 
    XOR A                      ;0xef3d:   af  "." 
    CALL 0xbe9b                ;0xef3e:   cd 9b be  "..." 
    LD H,E                     ;0xef41:   63  "c" 
    CP E                       ;0xef42:   bb  "." 
    POP BC                     ;0xef43:   c1  "." 
    RET                        ;0xef44:   c9  "." 
;--------------------------------------
C_EF45:                        ;          XREF: 0xE024 
    RET                        ;0xef45:   c9  "." 
;--------------------------------------
C_EF46:                        ;          XREF: 0xE04B 
    PUSH BC                    ;0xef46:   c5  "." 
    LD HL,11                   ;0xef47:   21 0b 00  "!.."  
    ADD HL,SP                  ;0xef4a:   39  "9" 
    CALL C_EF6C                ;0xef4b:   cd 6c ef  ".l." 
    LD B,A                     ;0xef4e:   47  "G" 
    CALL C_EF6C                ;0xef4f:   cd 6c ef  ".l." 
    LD C,A                     ;0xef52:   4f  "O" 
    ADD A,A                    ;0xef53:   87  "." 
    ADD A,A                    ;0xef54:   87  "." 
    ADD A,A                    ;0xef55:   87  "." 
    ADD A,C                    ;0xef56:   81  "." 
    ADD A,B                    ;0xef57:   80  "." 
    LD B,A                     ;0xef58:   47  "G" 
    CALL C_EF6C                ;0xef59:   cd 6c ef  ".l." 
    LD C,A                     ;0xef5c:   4f  "O" 
    ADD A,A                    ;0xef5d:   87  "." 
    ADD A,C                    ;0xef5e:   81  "." 
    ADD A,B                    ;0xef5f:   80  "." 
    LD B,A                     ;0xef60:   47  "G" 
    LD C,A                     ;0xef61:   4f  "O" 
    CALL C_EF0D                ;0xef62:   cd 0d ef  "..." 
    CALL 0xbe9b                ;0xef65:   cd 9b be  "..." 
    LD (ROM_INIT),A            ;0xef68:   32 bc c1  "2.."  
    RET                        ;0xef6b:   c9  "." 
;--------------------------------------
C_EF6C:                        ;          XREF: 0xEF4B 
    CALL C_EF0D                ;0xef6c:   cd 0d ef  "..." 
    AND 3                      ;0xef6f:   e6 03  ".." 
    CP 3                       ;0xef71:   fe 03  ".." 
    RET c                      ;0xef73:   d8  "." 
    XOR A                      ;0xef74:   af  "." 
    RET                        ;0xef75:   c9  "." 
;--------------------------------------
C_EF76:                        ;          XREF: 0xE04E 
    PUSH BC                    ;0xef76:   c5  "." 
    LD HL,5                    ;0xef77:   21 05 00  "!.."  
    ADD HL,SP                  ;0xef7a:   39  "9" 
    CALL C_EF0D                ;0xef7b:   cd 0d ef  "..." 
    CALL 0xbe9b                ;0xef7e:   cd 9b be  "..." 
    DEC (HL)                   ;0xef81:   35  "5" 
    CP H                       ;0xef82:   bc  "." 
    LD HL,0x41                 ;0xef83:   21 41 00  "!A."  
    LD A,6                     ;0xef86:   3e 06  ">."  
;--------------------------------------
C_EF88:                        ;          XREF: 0xEF8C 
    LD (HL),0                  ;0xef88:   36 00  "6."  
    INC HL                     ;0xef8a:   23  "#" 
    DEC A                      ;0xef8b:   3d  "=" 
    JP nz, C_EF88              ;0xef8c:   c2 88 ef  "..." 
    LD L,B                     ;0xef8f:   68  "h" 
    LD H,9                     ;0xef90:   26 09  "&."  
    CALL C_F0CF                ;0xef92:   cd cf f0  "..." 
    LD (0x43),A                ;0xef95:   32 43 00  "2C."  
    LD H,3                     ;0xef98:   26 03  "&."  
    CALL C_F0CF                ;0xef9a:   cd cf f0  "..." 
    LD (0x41),A                ;0xef9d:   32 41 00  "2A."  
    LD A,L                     ;0xefa0:   7d  "}" 
    LD (0x45),A                ;0xefa1:   32 45 00  "2E."  
    LD HL,0x41                 ;0xefa4:   21 41 00  "!A."  
    POP BC                     ;0xefa7:   c1  "." 
    RET                        ;0xefa8:   c9  "." 
;--------------------------------------
C_EFA9:                        ;          XREF: 0xE00C 
    LD DE,7                    ;0xefa9:   11 07 00  "..."  
    LD HL,4                    ;0xefac:   21 04 00  "!.."  
    CALL C_EFDE                ;0xefaf:   cd de ef  "..." 
    LD H,0                     ;0xefb2:   26 00  "&."  
    RET                        ;0xefb4:   c9  "." 
;--------------------------------------
C_EFB5:                        ;          XREF: 0xE012 
    LD DE,4                    ;0xefb5:   11 04 00  "..."  
    JP C_EFDB                  ;0xefb8:   c3 db ef  "..." 
;--------------------------------------
C_EFBB:                        ;          XREF: 0xE00F 
    LD A,(0x40)                ;0xefbb:   3a 40 00  ":@."  
    OR A                       ;0xefbe:   b7  "." 
    RET z                      ;0xefbf:   c8  "." 
    LD DE,10                   ;0xefc0:   11 0a 00  "..."  
    JP C_EFDB                  ;0xefc3:   c3 db ef  "..." 
;--------------------------------------
C_EFC6:                        ;          XREF: 0xE02A 
    LD L,7                     ;0xefc6:   2e 07  ".."  
    PUSH HL                    ;0xefc8:   e5  "." 
    CALL C_EFBB                ;0xefc9:   cd bb ef  "..." 
    POP HL                     ;0xefcc:   e1  "." 
    RET                        ;0xefcd:   c9  "." 
;--------------------------------------
C_EFCE:                        ;          XREF: 0xE02D 
    LD HL,(0x6)                ;0xefce:   2a 06 00  "*.."  
    RET                        ;0xefd1:   c9  "." 
;--------------------------------------
C_EFD2:                        ;          XREF: 0xE033 
    LD DE,0x2b                 ;0xefd2:   11 2b 00  ".+."  
    JP C_EFDB                  ;0xefd5:   c3 db ef  "..." 
;--------------------------------------
C_EFD8:                        ;          XREF: 0xE030 
    LD DE,13                   ;0xefd8:   11 0d 00  "..."  
;--------------------------------------
C_EFDB:                        ;          XREF: 0xEFB8 
    LD HL,2                    ;0xefdb:   21 02 00  "!.."  
;--------------------------------------
C_EFDE:                        ;          XREF: 0xEFAF 
    ADD HL,SP                  ;0xefde:   39  "9" 
    PUSH BC                    ;0xefdf:   c5  "." 
    LD C,(HL)                  ;0xefe0:   4e  "N" 
    LD HL,(0x1)                ;0xefe1:   2a 01 00  "*.."  
    ADD HL,DE                  ;0xefe4:   19  "." 
    LD A,(HL)                  ;0xefe5:   7e  "~" 
    INC HL                     ;0xefe6:   23  "#" 
    LD H,(HL)                  ;0xefe7:   66  "f" 
    LD L,A                     ;0xefe8:   6f  "o" 
    CALL C_EFF1                ;0xefe9:   cd f1 ef  "..." 
    LD L,A                     ;0xefec:   6f  "o" 
    LD H,A                     ;0xefed:   67  "g" 
    OR A                       ;0xefee:   b7  "." 
    POP BC                     ;0xefef:   c1  "." 
    RET                        ;0xeff0:   c9  "." 
;--------------------------------------
C_EFF1:                        ;          XREF: 0xEFE9 
    JP (HL)                    ;0xeff1:   e9  "." 
;--------------------------------------
C_EFF2:                        ;          XREF: 0xE036 
    LD HL,2                    ;0xeff2:   21 02 00  "!.."  
    ADD HL,SP                  ;0xeff5:   39  "9" 
    CALL C_F025                ;0xeff6:   cd 25 f0  ".%." 
    LD HL,D_F006               ;0xeff9:   21 06 f0  "!.."  
    AND 15                     ;0xeffc:   e6 0f  ".." 
    LD E,A                     ;0xeffe:   5f  "_" 
    LD D,0                     ;0xefff:   16 00  ".."  
    ADD HL,DE                  ;0xf001:   19  "." 
    LD L,(HL)                  ;0xf002:   6e  "n" 
    LD H,0                     ;0xf003:   26 00  "&."  
    RET                        ;0xf005:   c9  "." 
;--------------------------------------
D_F006:                        ;          XREF: 0xEFF9 
    x9 DEFB 0xff               ;0xf006:   0xff
    x9 DEFB 0x0                ;0xf007:   0x0
    x9 DEFB 0x4                ;0xf008:   0x4
    x9 DEFB 0xff               ;0xf009:   0xff
    x9 DEFB 0x6                ;0xf00a:   0x6
    x9 DEFB 0x7                ;0xf00b:   0x7
    x9 DEFB 0x5                ;0xf00c:   0x5
    x9 DEFB 0x6                ;0xf00d:   0x6
    x9 DEFB 0x2                ;0xf00e:   0x2
    x9 DEFB 0x1                ;0xf00f:   0x1
    x9 DEFB 0x3                ;0xf010:   0x3
    x9 DEFB 0x2                ;0xf011:   0x2
    x9 DEFB 0xff               ;0xf012:   0xff
    x9 DEFB 0x0                ;0xf013:   0x0
    x9 DEFB 0x4                ;0xf014:   0x4
    x9 DEFB 0xff               ;0xf015:   0xff
;--------------------------------------
C_F016:                        ;          XREF: 0xE039 
    LD HL,2                    ;0xf016:   21 02 00  "!.."  
    ADD HL,SP                  ;0xf019:   39  "9" 
    CALL C_F025                ;0xf01a:   cd 25 f0  ".%." 
    LD HL,0                    ;0xf01d:   21 00 00  "!.."  
    AND 0x30                   ;0xf020:   e6 30  ".0" 
    RET z                      ;0xf022:   c8  "." 
    INC HL                     ;0xf023:   23  "#" 
    RET                        ;0xf024:   c9  "." 
;--------------------------------------
C_F025:                        ;          XREF: 0xEFF6 
    EX DE,HL                   ;0xf025:   eb  "." 
    CALL 0xbe9b                ;0xf026:   cd 9b be  "..." 
    INC H                      ;0xf029:   24  "$" 
    CP E                       ;0xf02a:   bb  "." 
    EX DE,HL                   ;0xf02b:   eb  "." 
    LD A,(HL)                  ;0xf02c:   7e  "~" 
    OR A                       ;0xf02d:   b7  "." 
    LD A,D                     ;0xf02e:   7a  "z" 
    RET z                      ;0xf02f:   c8  "." 
    LD A,E                     ;0xf030:   7b  "{" 
    RET                        ;0xf031:   c9  "." 
;--------------------------------------
C_F032:                        ;          XREF: 0xE03C 
    PUSH BC                    ;0xf032:   c5  "." 
    LD HL,5                    ;0xf033:   21 05 00  "!.."  
    ADD HL,SP                  ;0xf036:   39  "9" 
    CALL C_EF0D                ;0xf037:   cd 0d ef  "..." 
    LD HL,D_FFF6               ;0xf03a:   21 f6 ff  "!.."  
    ADD HL,SP                  ;0xf03d:   39  "9" 
    LD SP,HL                   ;0xf03e:   f9  "." 
    PUSH HL                    ;0xf03f:   e5  "." 
    LD B,9                     ;0xf040:   06 09  ".."  
;--------------------------------------
C_F042:                        ;          XREF: 0xF047 
    LD A,(DE)                  ;0xf042:   1a  "." 
    LD (HL),A                  ;0xf043:   77  "w" 
    INC DE                     ;0xf044:   13  "." 
    INC HL                     ;0xf045:   23  "#" 
    DEC B                      ;0xf046:   05  "." 
    JP nz, C_F042              ;0xf047:   c2 42 f0  ".B." 
    POP HL                     ;0xf04a:   e1  "." 
    PUSH HL                    ;0xf04b:   e5  "." 
;--------------------------------------
C_F04C:                        ;          XREF: 0xF051 
    CALL 0xbe9b                ;0xf04c:   cd 9b be  "..." 
    XOR D                      ;0xf04f:   aa  "." 
    CP H                       ;0xf050:   bc  "." 
    JP nc, C_F04C              ;0xf051:   d2 4c f0  ".L." 
    POP HL                     ;0xf054:   e1  "." 
    LD DE,10                   ;0xf055:   11 0a 00  "..."  
    ADD HL,DE                  ;0xf058:   19  "." 
    LD SP,HL                   ;0xf059:   f9  "." 
    POP BC                     ;0xf05a:   c1  "." 
    RET                        ;0xf05b:   c9  "." 
;--------------------------------------
C_F05C:                        ;          XREF: 0xE03F 
    PUSH BC                    ;0xf05c:   c5  "." 
    LD HL,5                    ;0xf05d:   21 05 00  "!.."  
    ADD HL,SP                  ;0xf060:   39  "9" 
    CALL C_EF0D                ;0xf061:   cd 0d ef  "..." 
    LD HL,D_FFEE               ;0xf064:   21 ee ff  "!.."  
    ADD HL,SP                  ;0xf067:   39  "9" 
    LD SP,HL                   ;0xf068:   f9  "." 
    PUSH HL                    ;0xf069:   e5  "." 
    LD B,0x11                  ;0xf06a:   06 11  ".."  
;--------------------------------------
C_F06C:                        ;          XREF: 0xF071 
    LD A,(DE)                  ;0xf06c:   1a  "." 
    LD (HL),A                  ;0xf06d:   77  "w" 
    INC DE                     ;0xf06e:   13  "." 
    INC HL                     ;0xf06f:   23  "#" 
    DEC B                      ;0xf070:   05  "." 
    JP nz, C_F06C              ;0xf071:   c2 6c f0  ".l." 
    POP HL                     ;0xf074:   e1  "." 
    PUSH HL                    ;0xf075:   e5  "." 
    LD A,(HL)                  ;0xf076:   7e  "~" 
    INC HL                     ;0xf077:   23  "#" 
    CALL 0xbe9b                ;0xf078:   cd 9b be  "..." 
    CP A                       ;0xf07b:   bf  "." 
    CP H                       ;0xf07c:   bc  "." 
    POP HL                     ;0xf07d:   e1  "." 
    LD DE,0x12                 ;0xf07e:   11 12 00  "..."  
    ADD HL,DE                  ;0xf081:   19  "." 
    LD SP,HL                   ;0xf082:   f9  "." 
    POP BC                     ;0xf083:   c1  "." 
    RET                        ;0xf084:   c9  "." 
;--------------------------------------
C_F085:                        ;          XREF: 0xE042 
    PUSH BC                    ;0xf085:   c5  "." 
    LD HL,5                    ;0xf086:   21 05 00  "!.."  
    ADD HL,SP                  ;0xf089:   39  "9" 
    CALL C_EF0D                ;0xf08a:   cd 0d ef  "..." 
    LD HL,D_FFEE               ;0xf08d:   21 ee ff  "!.."  
    ADD HL,SP                  ;0xf090:   39  "9" 
    LD SP,HL                   ;0xf091:   f9  "." 
    PUSH HL                    ;0xf092:   e5  "." 
    LD B,0x11                  ;0xf093:   06 11  ".."  
;--------------------------------------
C_F095:                        ;          XREF: 0xF09A 
    LD A,(DE)                  ;0xf095:   1a  "." 
    LD (HL),A                  ;0xf096:   77  "w" 
    INC DE                     ;0xf097:   13  "." 
    INC HL                     ;0xf098:   23  "#" 
    DEC B                      ;0xf099:   05  "." 
    JP nz, C_F095              ;0xf09a:   c2 95 f0  "..." 
    POP HL                     ;0xf09d:   e1  "." 
    PUSH HL                    ;0xf09e:   e5  "." 
    LD A,(HL)                  ;0xf09f:   7e  "~" 
    INC HL                     ;0xf0a0:   23  "#" 
    CALL 0xbe9b                ;0xf0a1:   cd 9b be  "..." 
    CP H                       ;0xf0a4:   bc  "." 
    CP H                       ;0xf0a5:   bc  "." 
    POP HL                     ;0xf0a6:   e1  "." 
    LD DE,0x12                 ;0xf0a7:   11 12 00  "..."  
    ADD HL,DE                  ;0xf0aa:   19  "." 
    LD SP,HL                   ;0xf0ab:   f9  "." 
    POP BC                     ;0xf0ac:   c1  "." 
    RET                        ;0xf0ad:   c9  "." 
;--------------------------------------
C_F0AE:                        ;          XREF: 0xE045 
    PUSH BC                    ;0xf0ae:   c5  "." 
    LD HL,4                    ;0xf0af:   21 04 00  "!.."  
    ADD HL,SP                  ;0xf0b2:   39  "9" 
    LD A,(HL)                  ;0xf0b3:   7e  "~" 
    CALL 0xbcb3                ;0xf0b4:   cd b3 bc  "..." 
    POP BC                     ;0xf0b7:   c1  "." 
    RET                        ;0xf0b8:   c9  "." 
;--------------------------------------
C_F0B9:                        ;          XREF: 0xEEB8 
    PUSH BC                    ;0xf0b9:   c5  "." 
    LD B,A                     ;0xf0ba:   47  "G" 
    LD A,H                     ;0xf0bb:   7c  "|" 
    CP D                       ;0xf0bc:   ba  "." 
    JP nz, C_F0C2              ;0xf0bd:   c2 c2 f0  "..." 
    LD A,L                     ;0xf0c0:   7d  "}" 
    CP E                       ;0xf0c1:   bb  "." 
;--------------------------------------
C_F0C2:                        ;          XREF: 0xF0BD 
    LD A,B                     ;0xf0c2:   78  "x" 
    POP BC                     ;0xf0c3:   c1  "." 
    RET                        ;0xf0c4:   c9  "." 
;--------------------------------------
C_F0C5:                        ;          XREF: 0xED88 
    PUSH AF                    ;0xf0c5:   f5  "." 
    LD A,H                     ;0xf0c6:   7c  "|" 
    CPL                        ;0xf0c7:   2f  "/" 
    LD H,A                     ;0xf0c8:   67  "g" 
    LD A,L                     ;0xf0c9:   7d  "}" 
    CPL                        ;0xf0ca:   2f  "/" 
    LD L,A                     ;0xf0cb:   6f  "o" 
    INC HL                     ;0xf0cc:   23  "#" 
    POP AF                     ;0xf0cd:   f1  "." 
    RET                        ;0xf0ce:   c9  "." 
;--------------------------------------
C_F0CF:                        ;          XREF: 0xEF92 
    LD A,H                     ;0xf0cf:   7c  "|" 
    OR A                       ;0xf0d0:   b7  "." 
    RET z                      ;0xf0d1:   c8  "." 
    PUSH BC                    ;0xf0d2:   c5  "." 
    LD B,8                     ;0xf0d3:   06 08  ".."  
    LD C,H                     ;0xf0d5:   4c  "L" 
    LD H,0                     ;0xf0d6:   26 00  "&."  
;--------------------------------------
C_F0D8:                        ;          XREF: 0xF0EA 
    OR A                       ;0xf0d8:   b7  "." 
    LD A,L                     ;0xf0d9:   7d  "}" 
    RLA                        ;0xf0da:   17  "." 
    LD L,A                     ;0xf0db:   6f  "o" 
    LD A,H                     ;0xf0dc:   7c  "|" 
    RLA                        ;0xf0dd:   17  "." 
    LD H,A                     ;0xf0de:   67  "g" 
    CP C                       ;0xf0df:   b9  "." 
    JP c, C_F0E9               ;0xf0e0:   da e9 f0  "..." 
    SUB C                      ;0xf0e3:   91  "." 
    LD H,A                     ;0xf0e4:   67  "g" 
    LD A,L                     ;0xf0e5:   7d  "}" 
    OR 1                       ;0xf0e6:   f6 01  ".." 
    LD L,A                     ;0xf0e8:   6f  "o" 
;--------------------------------------
C_F0E9:                        ;          XREF: 0xF0E0 
    DEC B                      ;0xf0e9:   05  "." 
    JP nz, C_F0D8              ;0xf0ea:   c2 d8 f0  "..." 
    LD A,L                     ;0xf0ed:   7d  "}" 
    LD L,H                     ;0xf0ee:   6c  "l" 
    POP BC                     ;0xf0ef:   c1  "." 
    SCF                        ;0xf0f0:   37  "7" 
    RET                        ;0xf0f1:   c9  "." 
;--------------------------------------
C_F0F2:                        ;          XREF: 0xE195 
    LD HL,2                    ;0xf0f2:   21 02 00  "!.."  
    ADD HL,SP                  ;0xf0f5:   39  "9" 
    PUSH BC                    ;0xf0f6:   c5  "." 
    LD BC,0x7fff               ;0xf0f7:   01 ff 7f  "..."  
    x3 DEFB "^#V#~#fox"        ;0xf0fa:   0xf0fa to 0xf103
    OR C                       ;0xf103:   b1  "." 
    JP z, C_F116               ;0xf104:   ca 16 f1  "..." 
    LD A,(DE)                  ;0xf107:   1a  "." 
    CP (HL)                    ;0xf108:   be  "." 
    JP nz, C_F11B              ;0xf109:   c2 1b f1  "..." 
    OR A                       ;0xf10c:   b7  "." 
    JP z, C_F116               ;0xf10d:   ca 16 f1  "..." 
    INC HL                     ;0xf110:   23  "#" 
    INC DE                     ;0xf111:   13  "." 
    DEC BC                     ;0xf112:   0b  "." 
    JP C_F102                  ;0xf113:   c3 02 f1  "..." 
;--------------------------------------
C_F116:                        ;          XREF: 0xF104 
    POP BC                     ;0xf116:   c1  "." 
    LD HL,0                    ;0xf117:   21 00 00  "!.."  
    RET                        ;0xf11a:   c9  "." 
;--------------------------------------
C_F11B:                        ;          XREF: 0xF109 
    POP BC                     ;0xf11b:   c1  "." 
    JP c, C_F125               ;0xf11c:   da 25 f1  ".%." 
    LD HL,1                    ;0xf11f:   21 01 00  "!.."  
    LD A,L                     ;0xf122:   7d  "}" 
    OR H                       ;0xf123:   b4  "." 
    RET                        ;0xf124:   c9  "." 
;--------------------------------------
C_F125:                        ;          XREF: 0xF11C 
    LD HL,D_FFFF               ;0xf125:   21 ff ff  "!.."  
    LD A,L                     ;0xf128:   7d  "}" 
    OR H                       ;0xf129:   b4  "." 
    RET                        ;0xf12a:   c9  "." 
;--------------------------------------
C_F12B:                        ;          XREF: 0xE19B 
    LD HL,2                    ;0xf12b:   21 02 00  "!.."  
    ADD HL,SP                  ;0xf12e:   39  "9" 
    PUSH BC                    ;0xf12f:   c5  "." 
    LD BC,0x7fff               ;0xf130:   01 ff 7f  "..."  
    LD E,(HL)                  ;0xf133:   5e  "^" 
    INC HL                     ;0xf134:   23  "#" 
    LD D,(HL)                  ;0xf135:   56  "V" 
    PUSH DE                    ;0xf136:   d5  "." 
    x3 DEFB "#~#fox"           ;0xf137:   0xf137 to 0xf13d
    OR C                       ;0xf13d:   b1  "." 
    JP z, C_F14D               ;0xf13e:   ca 4d f1  ".M." 
    LD A,(HL)                  ;0xf141:   7e  "~" 
    LD (DE),A                  ;0xf142:   12  "." 
    OR A                       ;0xf143:   b7  "." 
    JP z, C_F14D               ;0xf144:   ca 4d f1  ".M." 
    INC HL                     ;0xf147:   23  "#" 
    INC DE                     ;0xf148:   13  "." 
    DEC BC                     ;0xf149:   0b  "." 
    JP C_F13C                  ;0xf14a:   c3 3c f1  ".<." 
;--------------------------------------
C_F14D:                        ;          XREF: 0xF13E 
    POP HL                     ;0xf14d:   e1  "." 
    POP BC                     ;0xf14e:   c1  "." 
    RET                        ;0xf14f:   c9  "." 
;--------------------------------------
C_F150:                        ;          XREF: 0xE19E 
    LD HL,2                    ;0xf150:   21 02 00  "!.."  
    ADD HL,SP                  ;0xf153:   39  "9" 
    LD A,(HL)                  ;0xf154:   7e  "~" 
    INC HL                     ;0xf155:   23  "#" 
    LD H,(HL)                  ;0xf156:   66  "f" 
    LD L,A                     ;0xf157:   6f  "o" 
    LD DE,0                    ;0xf158:   11 00 00  "..."  
    XOR A                      ;0xf15b:   af  "." 
;--------------------------------------
C_F15C:                        ;          XREF: 0xF162 
    CP (HL)                    ;0xf15c:   be  "." 
    JP z, C_F165               ;0xf15d:   ca 65 f1  ".e." 
    INC DE                     ;0xf160:   13  "." 
    INC HL                     ;0xf161:   23  "#" 
    JP C_F15C                  ;0xf162:   c3 5c f1  ".\." 
;--------------------------------------
C_F165:                        ;          XREF: 0xF15D 
    EX DE,HL                   ;0xf165:   eb  "." 
    LD A,L                     ;0xf166:   7d  "}" 
    OR H                       ;0xf167:   b4  "." 
    RET                        ;0xf168:   c9  "." 
    LD HL,2                    ;0xf169:   21 02 00  "!.."  
    ADD HL,SP                  ;0xf16c:   39  "9" 
    PUSH BC                    ;0xf16d:   c5  "." 
    LD E,(HL)                  ;0xf16e:   5e  "^" 
    INC HL                     ;0xf16f:   23  "#" 
    LD D,(HL)                  ;0xf170:   56  "V" 
    PUSH DE                    ;0xf171:   d5  "." 
    INC HL                     ;0xf172:   23  "#" 
    LD E,(HL)                  ;0xf173:   5e  "^" 
    INC HL                     ;0xf174:   23  "#" 
    LD D,(HL)                  ;0xf175:   56  "V" 
    INC HL                     ;0xf176:   23  "#" 
    LD C,(HL)                  ;0xf177:   4e  "N" 
    INC HL                     ;0xf178:   23  "#" 
    LD B,(HL)                  ;0xf179:   46  "F" 
    EX DE,HL                   ;0xf17a:   eb  "." 
    POP DE                     ;0xf17b:   d1  "." 
    JP C_F102                  ;0xf17c:   c3 02 f1  "..." 
;--------------------------------------
C_F17F:                        ;          XREF: 0xE198 
    PUSH BC                    ;0xf17f:   c5  "." 
    LD BC,0x7fff               ;0xf180:   01 ff 7f  "..."  
    LD HL,4                    ;0xf183:   21 04 00  "!.."  
    ADD HL,SP                  ;0xf186:   39  "9" 
    LD E,(HL)                  ;0xf187:   5e  "^" 
    INC HL                     ;0xf188:   23  "#" 
    LD D,(HL)                  ;0xf189:   56  "V" 
    PUSH DE                    ;0xf18a:   d5  "." 
    INC HL                     ;0xf18b:   23  "#" 
    LD A,(HL)                  ;0xf18c:   7e  "~" 
    INC HL                     ;0xf18d:   23  "#" 
    LD H,(HL)                  ;0xf18e:   66  "f" 
    LD L,A                     ;0xf18f:   6f  "o" 
    EX DE,HL                   ;0xf190:   eb  "." 
;--------------------------------------
C_F191:                        ;          XREF: 0xF19D 
    LD A,B                     ;0xf191:   78  "x" 
    OR C                       ;0xf192:   b1  "." 
    JP z, C_F14D               ;0xf193:   ca 4d f1  ".M." 
    LD A,(HL)                  ;0xf196:   7e  "~" 
    OR A                       ;0xf197:   b7  "." 
    JP z, C_F1A0               ;0xf198:   ca a0 f1  "..." 
    INC HL                     ;0xf19b:   23  "#" 
    DEC BC                     ;0xf19c:   0b  "." 
    JP C_F191                  ;0xf19d:   c3 91 f1  "..." 
;--------------------------------------
C_F1A0:                        ;          XREF: 0xF198 
    EX DE,HL                   ;0xf1a0:   eb  "." 
    JP C_F13C                  ;0xf1a1:   c3 3c f1  ".<." 
;--------------------------------------
C_F1A4:                        ;          XREF: 0xE186 
    POP DE                     ;0xf1a4:   d1  "." 
    POP HL                     ;0xf1a5:   e1  "." 
    PUSH HL                    ;0xf1a6:   e5  "." 
    LD (HL),E                  ;0xf1a7:   73  "s" 
    INC HL                     ;0xf1a8:   23  "#" 
    LD (HL),D                  ;0xf1a9:   72  "r" 
    INC HL                     ;0xf1aa:   23  "#" 
    PUSH DE                    ;0xf1ab:   d5  "." 
    EX DE,HL                   ;0xf1ac:   eb  "." 
    LD HL,0                    ;0xf1ad:   21 00 00  "!.."  
    ADD HL,SP                  ;0xf1b0:   39  "9" 
    EX DE,HL                   ;0xf1b1:   eb  "." 
    LD (HL),E                  ;0xf1b2:   73  "s" 
    INC HL                     ;0xf1b3:   23  "#" 
    LD (HL),D                  ;0xf1b4:   72  "r" 
    XOR A                      ;0xf1b5:   af  "." 
    LD H,A                     ;0xf1b6:   67  "g" 
    LD L,A                     ;0xf1b7:   6f  "o" 
    RET                        ;0xf1b8:   c9  "." 
;--------------------------------------
C_F1B9:                        ;          XREF: 0xE189 
    POP HL                     ;0xf1b9:   e1  "." 
    POP HL                     ;0xf1ba:   e1  "." 
    LD E,(HL)                  ;0xf1bb:   5e  "^" 
    INC HL                     ;0xf1bc:   23  "#" 
    LD D,(HL)                  ;0xf1bd:   56  "V" 
    INC HL                     ;0xf1be:   23  "#" 
    PUSH DE                    ;0xf1bf:   d5  "." 
    LD E,(HL)                  ;0xf1c0:   5e  "^" 
    INC HL                     ;0xf1c1:   23  "#" 
    LD D,(HL)                  ;0xf1c2:   56  "V" 
    POP HL                     ;0xf1c3:   e1  "." 
    EX DE,HL                   ;0xf1c4:   eb  "." 
    LD (HL),E                  ;0xf1c5:   73  "s" 
    INC HL                     ;0xf1c6:   23  "#" 
    LD (HL),D                  ;0xf1c7:   72  "r" 
    DEC HL                     ;0xf1c8:   2b  "+" 
    POP DE                     ;0xf1c9:   d1  "." 
    LD SP,HL                   ;0xf1ca:   f9  "." 
    EX DE,HL                   ;0xf1cb:   eb  "." 
    LD A,H                     ;0xf1cc:   7c  "|" 
    OR L                       ;0xf1cd:   b5  "." 
    RET                        ;0xf1ce:   c9  "." 
    EX DE,HL                   ;0xf1cf:   eb  "." 
    LD HL,(0x107)              ;0xf1d0:   2a 07 01  "*.."  
    PUSH BC                    ;0xf1d3:   c5  "." 
    LD A,(DE)                  ;0xf1d4:   1a  "." 
    LD (HL),A                  ;0xf1d5:   77  "w" 
    INC HL                     ;0xf1d6:   23  "#" 
    AND 0x7f                   ;0xf1d7:   e6 7f  ".." 
    SUB 0x40                   ;0xf1d9:   d6 40  ".@" 
    LD (HL),A                  ;0xf1db:   77  "w" 
    INC HL                     ;0xf1dc:   23  "#" 
    LD (HL),0                  ;0xf1dd:   36 00  "6."  
    LD B,3                     ;0xf1df:   06 03  ".."  
;--------------------------------------
C_F1E1:                        ;          XREF: 0xF1E6 
    INC HL                     ;0xf1e1:   23  "#" 
    INC DE                     ;0xf1e2:   13  "." 
    LD A,(DE)                  ;0xf1e3:   1a  "." 
    LD (HL),A                  ;0xf1e4:   77  "w" 
    DEC B                      ;0xf1e5:   05  "." 
    JP nz, C_F1E1              ;0xf1e6:   c2 e1 f1  "..." 
    LD B,5                     ;0xf1e9:   06 05  ".."  
    XOR A                      ;0xf1eb:   af  "." 
;--------------------------------------
C_F1EC:                        ;          XREF: 0xF1EF 
    INC HL                     ;0xf1ec:   23  "#" 
    LD (HL),A                  ;0xf1ed:   77  "w" 
    DEC B                      ;0xf1ee:   05  "." 
    JP nz, C_F1EC              ;0xf1ef:   c2 ec f1  "..." 
    POP BC                     ;0xf1f2:   c1  "." 
    RET                        ;0xf1f3:   c9  "." 
;--------------------------------------
C_F1F4:                        ;          XREF: 0xE105 
    POP DE                     ;0xf1f4:   d1  "." 
    LD HL,8                    ;0xf1f5:   21 08 00  "!.."  
    ADD HL,DE                  ;0xf1f8:   19  "." 
    PUSH HL                    ;0xf1f9:   e5  "." 
    EX DE,HL                   ;0xf1fa:   eb  "." 
;--------------------------------------
C_F1FB:                        ;          XREF: 0xE102 
    EX DE,HL                   ;0xf1fb:   eb  "." 
    LD HL,(0x109)              ;0xf1fc:   2a 09 01  "*.."  
    JP C_F20D                  ;0xf1ff:   c3 0d f2  "..." 
;--------------------------------------
C_F202:                        ;          XREF: 0xE177 
    POP DE                     ;0xf202:   d1  "." 
    LD HL,8                    ;0xf203:   21 08 00  "!.."  
;--------------------------------------
D_F206:                        ;          XREF: 0xC263 
    x9 DEFB 0x19               ;0xf206:   0x19
    x9 DEFB 0xe5               ;0xf207:   ('e') + 0x80
    x9 DEFB 0xeb               ;0xf208:   ('k') + 0x80
;--------------------------------------
C_F209:                        ;          XREF: 0xE0FF 
    EX DE,HL                   ;0xf209:   eb  "." 
    LD HL,(0x107)              ;0xf20a:   2a 07 01  "*.."  
;--------------------------------------
C_F20D:                        ;          XREF: 0xF1FF 
    PUSH BC                    ;0xf20d:   c5  "." 
    LD A,(DE)                  ;0xf20e:   1a  "." 
    LD (HL),A                  ;0xf20f:   77  "w" 
    INC HL                     ;0xf210:   23  "#" 
    AND 0x7f                   ;0xf211:   e6 7f  ".." 
    SUB 0x40                   ;0xf213:   d6 40  ".@" 
    LD (HL),A                  ;0xf215:   77  "w" 
    INC HL                     ;0xf216:   23  "#" 
    LD (HL),0                  ;0xf217:   36 00  "6."  
    LD B,7                     ;0xf219:   06 07  ".."  
;--------------------------------------
C_F21B:                        ;          XREF: 0xF220 
    INC HL                     ;0xf21b:   23  "#" 
    INC DE                     ;0xf21c:   13  "." 
    LD A,(DE)                  ;0xf21d:   1a  "." 
    LD (HL),A                  ;0xf21e:   77  "w" 
    DEC B                      ;0xf21f:   05  "." 
    JP nz, C_F21B              ;0xf220:   c2 1b f2  "..." 
    INC HL                     ;0xf223:   23  "#" 
    LD (HL),0                  ;0xf224:   36 00  "6."  
    POP BC                     ;0xf226:   c1  "." 
    RET                        ;0xf227:   c9  "." 
;--------------------------------------
C_F228:                        ;          XREF: 0xE11A 
    PUSH BC                    ;0xf228:   c5  "." 
    PUSH HL                    ;0xf229:   e5  "." 
    CALL C_F60D                ;0xf22a:   cd 0d f6  "..." 
    POP DE                     ;0xf22d:   d1  "." 
    LD HL,(0x107)              ;0xf22e:   2a 07 01  "*.."  
    LD A,(HL)                  ;0xf231:   7e  "~" 
    AND 0x80                   ;0xf232:   e6 80  ".." 
    LD B,A                     ;0xf234:   47  "G" 
    INC HL                     ;0xf235:   23  "#" 
    LD A,(HL)                  ;0xf236:   7e  "~" 
    ADD A,0x40                 ;0xf237:   c6 40  ".@" 
    AND 0x7f                   ;0xf239:   e6 7f  ".." 
    OR B                       ;0xf23b:   b0  "." 
    LD (DE),A                  ;0xf23c:   12  "." 
    INC HL                     ;0xf23d:   23  "#" 
    LD B,7                     ;0xf23e:   06 07  ".."  
;--------------------------------------
C_F240:                        ;          XREF: 0xF245 
    INC DE                     ;0xf240:   13  "." 
    INC HL                     ;0xf241:   23  "#" 
    LD A,(HL)                  ;0xf242:   7e  "~" 
    LD (DE),A                  ;0xf243:   12  "." 
    DEC B                      ;0xf244:   05  "." 
    JP nz, C_F240              ;0xf245:   c2 40 f2  ".@." 
    POP BC                     ;0xf248:   c1  "." 
    RET                        ;0xf249:   c9  "." 
;--------------------------------------
C_F24A:                        ;          XREF: 0xE114 
    POP HL                     ;0xf24a:   e1  "." 
    LD (0x4b0),HL              ;0xf24b:   22 b0 04  "".."  
    CALL C_F60D                ;0xf24e:   cd 0d f6  "..." 
    LD HL,(0x107)              ;0xf251:   2a 07 01  "*.."  
    LD DE,9                    ;0xf254:   11 09 00  "..."  
    ADD HL,DE                  ;0xf257:   19  "." 
    LD D,(HL)                  ;0xf258:   56  "V" 
    DEC HL                     ;0xf259:   2b  "+" 
    LD E,(HL)                  ;0xf25a:   5e  "^" 
    DEC HL                     ;0xf25b:   2b  "+" 
    PUSH DE                    ;0xf25c:   d5  "." 
    LD D,(HL)                  ;0xf25d:   56  "V" 
    DEC HL                     ;0xf25e:   2b  "+" 
    LD E,(HL)                  ;0xf25f:   5e  "^" 
    DEC HL                     ;0xf260:   2b  "+" 
    PUSH DE                    ;0xf261:   d5  "." 
    LD D,(HL)                  ;0xf262:   56  "V" 
    DEC HL                     ;0xf263:   2b  "+" 
    LD E,(HL)                  ;0xf264:   5e  "^" 
    DEC HL                     ;0xf265:   2b  "+" 
    PUSH DE                    ;0xf266:   d5  "." 
    LD D,(HL)                  ;0xf267:   56  "V" 
    DEC HL                     ;0xf268:   2b  "+" 
    DEC HL                     ;0xf269:   2b  "+" 
    LD A,(HL)                  ;0xf26a:   7e  "~" 
    ADD A,0x40                 ;0xf26b:   c6 40  ".@" 
    AND 0x7f                   ;0xf26d:   e6 7f  ".." 
    LD E,A                     ;0xf26f:   5f  "_" 
    DEC HL                     ;0xf270:   2b  "+" 
    LD A,(HL)                  ;0xf271:   7e  "~" 
    AND 0x80                   ;0xf272:   e6 80  ".." 
    OR E                       ;0xf274:   b3  "." 
    LD E,A                     ;0xf275:   5f  "_" 
    PUSH DE                    ;0xf276:   d5  "." 
    LD HL,(0x4b0)              ;0xf277:   2a b0 04  "*.."  
    JP (HL)                    ;0xf27a:   e9  "." 
;--------------------------------------
C_F27B:                        ;          XREF: 0xE111 
    POP HL                     ;0xf27b:   e1  "." 
    LD (0x4b0),HL              ;0xf27c:   22 b0 04  "".."  
    LD HL,(0x109)              ;0xf27f:   2a 09 01  "*.."  
    POP DE                     ;0xf282:   d1  "." 
    LD (HL),E                  ;0xf283:   73  "s" 
    INC HL                     ;0xf284:   23  "#" 
    LD A,E                     ;0xf285:   7b  "{" 
    AND 0x7f                   ;0xf286:   e6 7f  ".." 
    SUB 0x40                   ;0xf288:   d6 40  ".@" 
    LD (HL),A                  ;0xf28a:   77  "w" 
    INC HL                     ;0xf28b:   23  "#" 
    LD (HL),0                  ;0xf28c:   36 00  "6."  
    INC HL                     ;0xf28e:   23  "#" 
    LD (HL),D                  ;0xf28f:   72  "r" 
    INC HL                     ;0xf290:   23  "#" 
    POP DE                     ;0xf291:   d1  "." 
    LD (HL),E                  ;0xf292:   73  "s" 
    INC HL                     ;0xf293:   23  "#" 
    LD (HL),D                  ;0xf294:   72  "r" 
    INC HL                     ;0xf295:   23  "#" 
    POP DE                     ;0xf296:   d1  "." 
    LD (HL),E                  ;0xf297:   73  "s" 
    INC HL                     ;0xf298:   23  "#" 
    LD (HL),D                  ;0xf299:   72  "r" 
    INC HL                     ;0xf29a:   23  "#" 
    POP DE                     ;0xf29b:   d1  "." 
    LD (HL),E                  ;0xf29c:   73  "s" 
    INC HL                     ;0xf29d:   23  "#" 
    LD (HL),D                  ;0xf29e:   72  "r" 
    INC HL                     ;0xf29f:   23  "#" 
    LD (HL),0                  ;0xf2a0:   36 00  "6."  
    LD HL,(0x4b0)              ;0xf2a2:   2a b0 04  "*.."  
    JP (HL)                    ;0xf2a5:   e9  "." 
;--------------------------------------
C_F2A6:                        ;          XREF: 0xE17A 
    LD HL,(0x109)              ;0xf2a6:   2a 09 01  "*.."  
    EX DE,HL                   ;0xf2a9:   eb  "." 
    LD HL,(0x107)              ;0xf2aa:   2a 07 01  "*.."  
    LD (0x109),HL              ;0xf2ad:   22 09 01  "".."  
    EX DE,HL                   ;0xf2b0:   eb  "." 
    LD (0x107),HL              ;0xf2b1:   22 07 01  "".."  
    RET                        ;0xf2b4:   c9  "." 
;--------------------------------------
C_F2B5:                        ;          XREF: 0xE10E 
    LD HL,(0x107)              ;0xf2b5:   2a 07 01  "*.."  
    LD A,(HL)                  ;0xf2b8:   7e  "~" 
    XOR 0x80                   ;0xf2b9:   ee 80  ".." 
    LD (HL),A                  ;0xf2bb:   77  "w" 
    RET                        ;0xf2bc:   c9  "." 
;--------------------------------------
C_F2BD:                        ;          XREF: 0xE15F 
    LD HL,(0x107)              ;0xf2bd:   2a 07 01  "*.."  
    INC HL                     ;0xf2c0:   23  "#" 
    LD A,(HL)                  ;0xf2c1:   7e  "~" 
    CP 0xc0                    ;0xf2c2:   fe c0  ".." 
    JP nz, C_FB35              ;0xf2c4:   c2 35 fb  ".5." 
    JP C_FB29                  ;0xf2c7:   c3 29 fb  ".)." 
;--------------------------------------
C_F2CA:                        ;          XREF: 0xF2E7 
    XOR A                      ;0xf2ca:   af  "." 
    DEC A                      ;0xf2cb:   3d  "=" 
    POP BC                     ;0xf2cc:   c1  "." 
    RET                        ;0xf2cd:   c9  "." 
;--------------------------------------
C_F2CE:                        ;          XREF: 0xF2E0 
    XOR A                      ;0xf2ce:   af  "." 
    INC A                      ;0xf2cf:   3c  "<" 
    POP BC                     ;0xf2d0:   c1  "." 
    RET                        ;0xf2d1:   c9  "." 
;--------------------------------------
C_F2D2:                        ;          XREF: 0xF583 
    PUSH BC                    ;0xf2d2:   c5  "." 
    LD HL,(0x107)              ;0xf2d3:   2a 07 01  "*.."  
    EX DE,HL                   ;0xf2d6:   eb  "." 
    LD HL,(0x109)              ;0xf2d7:   2a 09 01  "*.."  
    LD A,(DE)                  ;0xf2da:   1a  "." 
    OR A                       ;0xf2db:   b7  "." 
    JP m, C_F2E6               ;0xf2dc:   fa e6 f2  "..." 
    XOR (HL)                   ;0xf2df:   ae  "." 
    JP m, C_F2CE               ;0xf2e0:   fa ce f2  "..." 
    JP C_F2EB                  ;0xf2e3:   c3 eb f2  "..." 
;--------------------------------------
C_F2E6:                        ;          XREF: 0xF2DC 
    XOR (HL)                   ;0xf2e6:   ae  "." 
    JP m, C_F2CA               ;0xf2e7:   fa ca f2  "..." 
    EX DE,HL                   ;0xf2ea:   eb  "." 
;--------------------------------------
C_F2EB:                        ;          XREF: 0xF2E3 
    INC HL                     ;0xf2eb:   23  "#" 
    INC DE                     ;0xf2ec:   13  "." 
    LD A,(DE)                  ;0xf2ed:   1a  "." 
    CP (HL)                    ;0xf2ee:   be  "." 
    JP m, C_F2CA               ;0xf2ef:   fa ca f2  "..." 
    JP nz, C_F2CE              ;0xf2f2:   c2 ce f2  "..." 
    LD B,9                     ;0xf2f5:   06 09  ".."  
;--------------------------------------
C_F2F7:                        ;          XREF: 0xF302 
    INC HL                     ;0xf2f7:   23  "#" 
    INC DE                     ;0xf2f8:   13  "." 
    LD A,(DE)                  ;0xf2f9:   1a  "." 
    CP (HL)                    ;0xf2fa:   be  "." 
    JP c, C_F2CA               ;0xf2fb:   da ca f2  "..." 
    JP nz, C_F2CE              ;0xf2fe:   c2 ce f2  "..." 
    DEC B                      ;0xf301:   05  "." 
    JP nz, C_F2F7              ;0xf302:   c2 f7 f2  "..." 
    XOR A                      ;0xf305:   af  "." 
    POP BC                     ;0xf306:   c1  "." 
    RET                        ;0xf307:   c9  "." 
;--------------------------------------
C_F308:                        ;          XREF: 0xE117 
    LD HL,(0x109)              ;0xf308:   2a 09 01  "*.."  
    LD A,(HL)                  ;0xf30b:   7e  "~" 
    XOR 0x80                   ;0xf30c:   ee 80  ".." 
    LD (HL),A                  ;0xf30e:   77  "w" 
;--------------------------------------
C_F30F:                        ;          XREF: 0xE0F3 
    PUSH BC                    ;0xf30f:   c5  "." 
    LD HL,(0x107)              ;0xf310:   2a 07 01  "*.."  
    LD DE,11                   ;0xf313:   11 0b 00  "..."  
    ADD HL,DE                  ;0xf316:   19  "." 
    LD B,7                     ;0xf317:   06 07  ".."  
    XOR A                      ;0xf319:   af  "." 
;--------------------------------------
C_F31A:                        ;          XREF: 0xF31D 
    LD (HL),A                  ;0xf31a:   77  "w" 
    INC HL                     ;0xf31b:   23  "#" 
    DEC B                      ;0xf31c:   05  "." 
    JP nz, C_F31A              ;0xf31d:   c2 1a f3  "..." 
    LD HL,(0x109)              ;0xf320:   2a 09 01  "*.."  
    LD DE,11                   ;0xf323:   11 0b 00  "..."  
    ADD HL,DE                  ;0xf326:   19  "." 
    LD B,7                     ;0xf327:   06 07  ".."  
;--------------------------------------
C_F329:                        ;          XREF: 0xF32C 
    LD (HL),A                  ;0xf329:   77  "w" 
    INC HL                     ;0xf32a:   23  "#" 
    DEC B                      ;0xf32b:   05  "." 
    JP nz, C_F329              ;0xf32c:   c2 29 f3  ".)." 
    LD HL,(0x107)              ;0xf32f:   2a 07 01  "*.."  
    EX DE,HL                   ;0xf332:   eb  "." 
    LD HL,(0x109)              ;0xf333:   2a 09 01  "*.."  
    INC HL                     ;0xf336:   23  "#" 
    INC DE                     ;0xf337:   13  "." 
    LD A,(DE)                  ;0xf338:   1a  "." 
    SUB (HL)                   ;0xf339:   96  "." 
    JP p, C_F340               ;0xf33a:   f2 40 f3  ".@." 
    EX DE,HL                   ;0xf33d:   eb  "." 
    CPL                        ;0xf33e:   2f  "/" 
    INC A                      ;0xf33f:   3c  "<" 
;--------------------------------------
C_F340:                        ;          XREF: 0xF33A 
    DEC DE                     ;0xf340:   1b  "." 
    DEC HL                     ;0xf341:   2b  "+" 
    LD (0x109),HL              ;0xf342:   22 09 01  "".."  
    EX DE,HL                   ;0xf345:   eb  "." 
    LD (0x107),HL              ;0xf346:   22 07 01  "".."  
    CP 9                       ;0xf349:   fe 09  ".." 
    JP nc, C_F634              ;0xf34b:   d2 34 f6  ".4." 
    LD C,A                     ;0xf34e:   4f  "O" 
    PUSH HL                    ;0xf34f:   e5  "." 
    PUSH DE                    ;0xf350:   d5  "." 
    ADD A,9                    ;0xf351:   c6 09  ".." 
    LD E,A                     ;0xf353:   5f  "_" 
    LD D,0                     ;0xf354:   16 00  ".."  
    ADD HL,DE                  ;0xf356:   19  "." 
    LD (0x4b2),HL              ;0xf357:   22 b2 04  "".."  
    POP DE                     ;0xf35a:   d1  "." 
    LD HL,9                    ;0xf35b:   21 09 00  "!.."  
    ADD HL,DE                  ;0xf35e:   19  "." 
    LD (0x4b4),HL              ;0xf35f:   22 b4 04  "".."  
    POP HL                     ;0xf362:   e1  "." 
    EX DE,HL                   ;0xf363:   eb  "." 
    LD A,(DE)                  ;0xf364:   1a  "." 
    XOR (HL)                   ;0xf365:   ae  "." 
    JP p, C_F3C6               ;0xf366:   f2 c6 f3  "..." 
    LD A,(DE)                  ;0xf369:   1a  "." 
    OR A                       ;0xf36a:   b7  "." 
    JP m, C_F38D               ;0xf36b:   fa 8d f3  "..." 
    LD B,7                     ;0xf36e:   06 07  ".."  
    LD HL,(0x4b2)              ;0xf370:   2a b2 04  "*.."  
    EX DE,HL                   ;0xf373:   eb  "." 
    LD HL,(0x4b4)              ;0xf374:   2a b4 04  "*.."  
;--------------------------------------
C_F377:                        ;          XREF: 0xF37D 
    LD A,(DE)                  ;0xf377:   1a  "." 
    SBC A,(HL)                 ;0xf378:   9e  "." 
    LD (DE),A                  ;0xf379:   12  "." 
    DEC DE                     ;0xf37a:   1b  "." 
    DEC HL                     ;0xf37b:   2b  "+" 
    DEC B                      ;0xf37c:   05  "." 
    JP nz, C_F377              ;0xf37d:   c2 77 f3  ".w." 
;--------------------------------------
C_F380:                        ;          XREF: 0xF386 
    LD A,(DE)                  ;0xf380:   1a  "." 
    SBC A,0                    ;0xf381:   de 00  ".." 
    LD (DE),A                  ;0xf383:   12  "." 
    DEC DE                     ;0xf384:   1b  "." 
    DEC C                      ;0xf385:   0d  "." 
    JP p, C_F380               ;0xf386:   f2 80 f3  "..." 
    EX DE,HL                   ;0xf389:   eb  "." 
    JP C_F3A8                  ;0xf38a:   c3 a8 f3  "..." 
;--------------------------------------
C_F38D:                        ;          XREF: 0xF36B 
    LD B,7                     ;0xf38d:   06 07  ".."  
    LD HL,(0x4b4)              ;0xf38f:   2a b4 04  "*.."  
    EX DE,HL                   ;0xf392:   eb  "." 
    LD HL,(0x4b2)              ;0xf393:   2a b2 04  "*.."  
;--------------------------------------
C_F396:                        ;          XREF: 0xF39C 
    LD A,(DE)                  ;0xf396:   1a  "." 
    SBC A,(HL)                 ;0xf397:   9e  "." 
    LD (HL),A                  ;0xf398:   77  "w" 
    DEC DE                     ;0xf399:   1b  "." 
    DEC HL                     ;0xf39a:   2b  "+" 
    DEC B                      ;0xf39b:   05  "." 
    JP nz, C_F396              ;0xf39c:   c2 96 f3  "..." 
;--------------------------------------
C_F39F:                        ;          XREF: 0xF3A5 
    LD A,0                     ;0xf39f:   3e 00  ">."  
    SBC A,(HL)                 ;0xf3a1:   9e  "." 
    LD (HL),A                  ;0xf3a2:   77  "w" 
    DEC HL                     ;0xf3a3:   2b  "+" 
    DEC C                      ;0xf3a4:   0d  "." 
    JP p, C_F39F               ;0xf3a5:   f2 9f f3  "..." 
;--------------------------------------
C_F3A8:                        ;          XREF: 0xF38A 
    INC HL                     ;0xf3a8:   23  "#" 
    LD A,(HL)                  ;0xf3a9:   7e  "~" 
    OR A                       ;0xf3aa:   b7  "." 
    LD A,1                     ;0xf3ab:   3e 01  ">."  
    JP p, C_F3BF               ;0xf3ad:   f2 bf f3  "..." 
    LD DE,15                   ;0xf3b0:   11 0f 00  "..."  
    ADD HL,DE                  ;0xf3b3:   19  "." 
;--------------------------------------
C_F3B4:                        ;          XREF: 0xF3BA 
    LD A,0                     ;0xf3b4:   3e 00  ">."  
    SBC A,(HL)                 ;0xf3b6:   9e  "." 
    LD (HL),A                  ;0xf3b7:   77  "w" 
    DEC HL                     ;0xf3b8:   2b  "+" 
    DEC E                      ;0xf3b9:   1d  "." 
    JP p, C_F3B4               ;0xf3ba:   f2 b4 f3  "..." 
    LD A,0x81                  ;0xf3bd:   3e 81  ">."  
;--------------------------------------
C_F3BF:                        ;          XREF: 0xF3AD 
    LD HL,(0x107)              ;0xf3bf:   2a 07 01  "*.."  
    LD (HL),A                  ;0xf3c2:   77  "w" 
    JP C_F634                  ;0xf3c3:   c3 34 f6  ".4." 
;--------------------------------------
C_F3C6:                        ;          XREF: 0xF366 
    LD B,7                     ;0xf3c6:   06 07  ".."  
    LD HL,(0x4b2)              ;0xf3c8:   2a b2 04  "*.."  
    EX DE,HL                   ;0xf3cb:   eb  "." 
    LD HL,(0x4b4)              ;0xf3cc:   2a b4 04  "*.."  
;--------------------------------------
C_F3CF:                        ;          XREF: 0xF3D5 
    LD A,(DE)                  ;0xf3cf:   1a  "." 
    ADC A,(HL)                 ;0xf3d0:   8e  "." 
    LD (DE),A                  ;0xf3d1:   12  "." 
    DEC DE                     ;0xf3d2:   1b  "." 
    DEC HL                     ;0xf3d3:   2b  "+" 
    DEC B                      ;0xf3d4:   05  "." 
    JP nz, C_F3CF              ;0xf3d5:   c2 cf f3  "..." 
;--------------------------------------
C_F3D8:                        ;          XREF: 0xF3DE 
    LD A,(DE)                  ;0xf3d8:   1a  "." 
    ADC A,0                    ;0xf3d9:   ce 00  ".." 
    LD (DE),A                  ;0xf3db:   12  "." 
    DEC DE                     ;0xf3dc:   1b  "." 
    DEC C                      ;0xf3dd:   0d  "." 
    JP p, C_F3D8               ;0xf3de:   f2 d8 f3  "..." 
    JP C_F634                  ;0xf3e1:   c3 34 f6  ".4." 
;--------------------------------------
C_F3E4:                        ;          XREF: 0xE0F6 
    PUSH BC                    ;0xf3e4:   c5  "." 
    LD HL,(0x107)              ;0xf3e5:   2a 07 01  "*.."  
    EX DE,HL                   ;0xf3e8:   eb  "." 
    LD HL,(0x109)              ;0xf3e9:   2a 09 01  "*.."  
    LD A,(DE)                  ;0xf3ec:   1a  "." 
    XOR (HL)                   ;0xf3ed:   ae  "." 
    LD (DE),A                  ;0xf3ee:   12  "." 
    INC HL                     ;0xf3ef:   23  "#" 
    INC DE                     ;0xf3f0:   13  "." 
    LD A,(DE)                  ;0xf3f1:   1a  "." 
    SUB (HL)                   ;0xf3f2:   96  "." 
    LD C,A                     ;0xf3f3:   4f  "O" 
    PUSH DE                    ;0xf3f4:   d5  "." 
    PUSH HL                    ;0xf3f5:   e5  "." 
    LD A,(HL)                  ;0xf3f6:   7e  "~" 
    CP 0xc0                    ;0xf3f7:   fe c0  ".." 
    JP nz, C_F401              ;0xf3f9:   c2 01 f4  "..." 
    POP HL                     ;0xf3fc:   e1  "." 
    POP HL                     ;0xf3fd:   e1  "." 
    JP C_F6BF                  ;0xf3fe:   c3 bf f6  "..." 
;--------------------------------------
C_F401:                        ;          XREF: 0xF3F9 
    INC DE                     ;0xf401:   13  "." 
    INC HL                     ;0xf402:   23  "#" 
    LD B,8                     ;0xf403:   06 08  ".."  
;--------------------------------------
C_F405:                        ;          XREF: 0xF40D 
    INC DE                     ;0xf405:   13  "." 
    INC HL                     ;0xf406:   23  "#" 
    LD A,(DE)                  ;0xf407:   1a  "." 
    CP (HL)                    ;0xf408:   be  "." 
    JP nz, C_F420              ;0xf409:   c2 20 f4  ". ." 
    DEC B                      ;0xf40c:   05  "." 
    JP nz, C_F405              ;0xf40d:   c2 05 f4  "..." 
    POP HL                     ;0xf410:   e1  "." 
    POP HL                     ;0xf411:   e1  "." 
    INC C                      ;0xf412:   0c  "." 
    LD (HL),C                  ;0xf413:   71  "q" 
    INC HL                     ;0xf414:   23  "#" 
    LD (HL),0                  ;0xf415:   36 00  "6."  
    INC HL                     ;0xf417:   23  "#" 
    LD (HL),1                  ;0xf418:   36 01  "6."  
    LD B,8                     ;0xf41a:   06 08  ".."  
    XOR A                      ;0xf41c:   af  "." 
    JP C_F658                  ;0xf41d:   c3 58 f6  ".X." 
;--------------------------------------
C_F420:                        ;          XREF: 0xF409 
    POP DE                     ;0xf420:   d1  "." 
    POP HL                     ;0xf421:   e1  "." 
    LD (HL),C                  ;0xf422:   71  "q" 
    JP c, C_F429               ;0xf423:   da 29 f4  ".)." 
    INC C                      ;0xf426:   0c  "." 
    LD (HL),C                  ;0xf427:   71  "q" 
    DEC HL                     ;0xf428:   2b  "+" 
;--------------------------------------
C_F429:                        ;          XREF: 0xF423 
    PUSH DE                    ;0xf429:   d5  "." 
    LD DE,9                    ;0xf42a:   11 09 00  "..."  
    ADD HL,DE                  ;0xf42d:   19  "." 
    LD B,8                     ;0xf42e:   06 08  ".."  
    LD DE,0x4e4                ;0xf430:   11 e4 04  "..."  
;--------------------------------------
C_F433:                        ;          XREF: 0xF438 
    LD A,(HL)                  ;0xf433:   7e  "~" 
    LD (DE),A                  ;0xf434:   12  "." 
    DEC HL                     ;0xf435:   2b  "+" 
    INC DE                     ;0xf436:   13  "." 
    DEC B                      ;0xf437:   05  "." 
    JP nz, C_F433              ;0xf438:   c2 33 f4  ".3." 
    POP HL                     ;0xf43b:   e1  "." 
    LD DE,9                    ;0xf43c:   11 09 00  "..."  
    ADD HL,DE                  ;0xf43f:   19  "." 
    LD B,8                     ;0xf440:   06 08  ".."  
    LD DE,0x4ec                ;0xf442:   11 ec 04  "..."  
;--------------------------------------
C_F445:                        ;          XREF: 0xF44A 
    LD A,(HL)                  ;0xf445:   7e  "~" 
    LD (DE),A                  ;0xf446:   12  "." 
    DEC HL                     ;0xf447:   2b  "+" 
    INC DE                     ;0xf448:   13  "." 
    DEC B                      ;0xf449:   05  "." 
    JP nz, C_F445              ;0xf44a:   c2 45 f4  ".E." 
    LD B,8                     ;0xf44d:   06 08  ".."  
    LD HL,0x4dc                ;0xf44f:   21 dc 04  "!.."  
    XOR A                      ;0xf452:   af  "." 
;--------------------------------------
C_F453:                        ;          XREF: 0xF456 
    LD (HL),A                  ;0xf453:   77  "w" 
    INC HL                     ;0xf454:   23  "#" 
    DEC B                      ;0xf455:   05  "." 
    JP nz, C_F453              ;0xf456:   c2 53 f4  ".S." 
    LD A,0x40                  ;0xf459:   3e 40  ">@"  
    LD (0x4db),A               ;0xf45b:   32 db 04  "2.."  
;--------------------------------------
C_F45E:                        ;          XREF: 0xF490 
    LD HL,0x4dc                ;0xf45e:   21 dc 04  "!.."  
    LD B,0x10                  ;0xf461:   06 10  ".."  
    OR A                       ;0xf463:   b7  "." 
;--------------------------------------
C_F464:                        ;          XREF: 0xF469 
    LD A,(HL)                  ;0xf464:   7e  "~" 
    ADC A,A                    ;0xf465:   8f  "." 
    LD (HL),A                  ;0xf466:   77  "w" 
    INC HL                     ;0xf467:   23  "#" 
    DEC B                      ;0xf468:   05  "." 
    JP nz, C_F464              ;0xf469:   c2 64 f4  ".d." 
    SBC A,A                    ;0xf46c:   9f  "." 
    AND 1                      ;0xf46d:   e6 01  ".." 
    LD C,A                     ;0xf46f:   4f  "O" 
    LD B,8                     ;0xf470:   06 08  ".."  
    LD DE,0x4e4                ;0xf472:   11 e4 04  "..."  
    LD HL,0x4ec                ;0xf475:   21 ec 04  "!.."  
    OR A                       ;0xf478:   b7  "." 
;--------------------------------------
C_F479:                        ;          XREF: 0xF47F 
    LD A,(DE)                  ;0xf479:   1a  "." 
    SBC A,(HL)                 ;0xf47a:   9e  "." 
    LD (DE),A                  ;0xf47b:   12  "." 
    INC DE                     ;0xf47c:   13  "." 
    INC HL                     ;0xf47d:   23  "#" 
    DEC B                      ;0xf47e:   05  "." 
    JP nz, C_F479              ;0xf47f:   c2 79 f4  ".y." 
    LD A,C                     ;0xf482:   79  "y" 
    SBC A,0                    ;0xf483:   de 00  ".." 
    JP nz, C_F496              ;0xf485:   c2 96 f4  "..." 
;--------------------------------------
C_F488:                        ;          XREF: 0xF4C5 
    LD HL,0x4dc                ;0xf488:   21 dc 04  "!.."  
    INC (HL)                   ;0xf48b:   34  "4" 
    LD HL,0x4db                ;0xf48c:   21 db 04  "!.."  
    DEC (HL)                   ;0xf48f:   35  "5" 
    JP nz, C_F45E              ;0xf490:   c2 5e f4  ".^." 
    JP C_F4C8                  ;0xf493:   c3 c8 f4  "..." 
;--------------------------------------
C_F496:                        ;          XREF: 0xF485 
    LD HL,0x4db                ;0xf496:   21 db 04  "!.."  
    DEC (HL)                   ;0xf499:   35  "5" 
    JP z, C_F4C8               ;0xf49a:   ca c8 f4  "..." 
    LD HL,0x4dc                ;0xf49d:   21 dc 04  "!.."  
    LD B,0x10                  ;0xf4a0:   06 10  ".."  
    OR A                       ;0xf4a2:   b7  "." 
;--------------------------------------
C_F4A3:                        ;          XREF: 0xF4A8 
    LD A,(HL)                  ;0xf4a3:   7e  "~" 
    ADC A,A                    ;0xf4a4:   8f  "." 
    LD (HL),A                  ;0xf4a5:   77  "w" 
    INC HL                     ;0xf4a6:   23  "#" 
    DEC B                      ;0xf4a7:   05  "." 
    JP nz, C_F4A3              ;0xf4a8:   c2 a3 f4  "..." 
    SBC A,A                    ;0xf4ab:   9f  "." 
    LD C,A                     ;0xf4ac:   4f  "O" 
    LD B,8                     ;0xf4ad:   06 08  ".."  
    LD DE,0x4e4                ;0xf4af:   11 e4 04  "..."  
    LD HL,0x4ec                ;0xf4b2:   21 ec 04  "!.."  
    OR A                       ;0xf4b5:   b7  "." 
;--------------------------------------
C_F4B6:                        ;          XREF: 0xF4BC 
    LD A,(DE)                  ;0xf4b6:   1a  "." 
    ADC A,(HL)                 ;0xf4b7:   8e  "." 
    LD (DE),A                  ;0xf4b8:   12  "." 
    INC DE                     ;0xf4b9:   13  "." 
    INC HL                     ;0xf4ba:   23  "#" 
    DEC B                      ;0xf4bb:   05  "." 
    JP nz, C_F4B6              ;0xf4bc:   c2 b6 f4  "..." 
    LD A,C                     ;0xf4bf:   79  "y" 
    ADC A,0                    ;0xf4c0:   ce 00  ".." 
    JP nz, C_F496              ;0xf4c2:   c2 96 f4  "..." 
    JP C_F488                  ;0xf4c5:   c3 88 f4  "..." 
;--------------------------------------
C_F4C8:                        ;          XREF: 0xF493 
    LD HL,(0x107)              ;0xf4c8:   2a 07 01  "*.."  
    LD DE,12                   ;0xf4cb:   11 0c 00  "..."  
    ADD HL,DE                  ;0xf4ce:   19  "." 
    LD (HL),0                  ;0xf4cf:   36 00  "6."  
    DEC HL                     ;0xf4d1:   2b  "+" 
    LD (HL),0                  ;0xf4d2:   36 00  "6."  
    LD DE,0x4dc                ;0xf4d4:   11 dc 04  "..."  
    LD B,8                     ;0xf4d7:   06 08  ".."  
;--------------------------------------
C_F4D9:                        ;          XREF: 0xF4DE 
    DEC HL                     ;0xf4d9:   2b  "+" 
    LD A,(DE)                  ;0xf4da:   1a  "." 
    LD (HL),A                  ;0xf4db:   77  "w" 
    INC DE                     ;0xf4dc:   13  "." 
    DEC B                      ;0xf4dd:   05  "." 
    JP nz, C_F4D9              ;0xf4de:   c2 d9 f4  "..." 
    JP C_F634                  ;0xf4e1:   c3 34 f6  ".4." 
;--------------------------------------
C_F4E4:                        ;          XREF: 0xE10B 
    PUSH BC                    ;0xf4e4:   c5  "." 
    LD HL,(0x107)              ;0xf4e5:   2a 07 01  "*.."  
    EX DE,HL                   ;0xf4e8:   eb  "." 
    LD HL,(0x109)              ;0xf4e9:   2a 09 01  "*.."  
    LD A,(DE)                  ;0xf4ec:   1a  "." 
    XOR (HL)                   ;0xf4ed:   ae  "." 
    LD (DE),A                  ;0xf4ee:   12  "." 
    INC HL                     ;0xf4ef:   23  "#" 
    INC DE                     ;0xf4f0:   13  "." 
    LD A,(DE)                  ;0xf4f1:   1a  "." 
    CP 0xc0                    ;0xf4f2:   fe c0  ".." 
    JP z, C_F64E               ;0xf4f4:   ca 4e f6  ".N." 
    ADD A,(HL)                 ;0xf4f7:   86  "." 
    LD (DE),A                  ;0xf4f8:   12  "." 
    LD A,(HL)                  ;0xf4f9:   7e  "~" 
    CP 0xc0                    ;0xf4fa:   fe c0  ".." 
    JP z, C_F64E               ;0xf4fc:   ca 4e f6  ".N." 
    PUSH DE                    ;0xf4ff:   d5  "." 
    LD DE,9                    ;0xf500:   11 09 00  "..."  
    ADD HL,DE                  ;0xf503:   19  "." 
    LD B,8                     ;0xf504:   06 08  ".."  
    LD DE,0x4ec                ;0xf506:   11 ec 04  "..."  
;--------------------------------------
C_F509:                        ;          XREF: 0xF50E 
    LD A,(HL)                  ;0xf509:   7e  "~" 
    LD (DE),A                  ;0xf50a:   12  "." 
    DEC HL                     ;0xf50b:   2b  "+" 
    INC DE                     ;0xf50c:   13  "." 
    DEC B                      ;0xf50d:   05  "." 
    JP nz, C_F509              ;0xf50e:   c2 09 f5  "..." 
    POP HL                     ;0xf511:   e1  "." 
    LD DE,9                    ;0xf512:   11 09 00  "..."  
    ADD HL,DE                  ;0xf515:   19  "." 
    LD B,8                     ;0xf516:   06 08  ".."  
    LD DE,0x4e4                ;0xf518:   11 e4 04  "..."  
;--------------------------------------
C_F51B:                        ;          XREF: 0xF520 
    LD A,(HL)                  ;0xf51b:   7e  "~" 
    LD (DE),A                  ;0xf51c:   12  "." 
    DEC HL                     ;0xf51d:   2b  "+" 
    INC DE                     ;0xf51e:   13  "." 
    DEC B                      ;0xf51f:   05  "." 
    JP nz, C_F51B              ;0xf520:   c2 1b f5  "..." 
    LD B,8                     ;0xf523:   06 08  ".."  
    LD HL,0x4dc                ;0xf525:   21 dc 04  "!.."  
    XOR A                      ;0xf528:   af  "." 
;--------------------------------------
C_F529:                        ;          XREF: 0xF52C 
    LD (HL),A                  ;0xf529:   77  "w" 
    INC HL                     ;0xf52a:   23  "#" 
    DEC B                      ;0xf52b:   05  "." 
    JP nz, C_F529              ;0xf52c:   c2 29 f5  ".)." 
    LD A,0x40                  ;0xf52f:   3e 40  ">@"  
    LD (0x4db),A               ;0xf531:   32 db 04  "2.."  
;--------------------------------------
C_F534:                        ;          XREF: 0xF569 
    LD HL,0x4dc                ;0xf534:   21 dc 04  "!.."  
    LD B,0x10                  ;0xf537:   06 10  ".."  
    OR A                       ;0xf539:   b7  "." 
;--------------------------------------
C_F53A:                        ;          XREF: 0xF53F 
    LD A,(HL)                  ;0xf53a:   7e  "~" 
    ADC A,A                    ;0xf53b:   8f  "." 
    LD (HL),A                  ;0xf53c:   77  "w" 
    INC HL                     ;0xf53d:   23  "#" 
    DEC B                      ;0xf53e:   05  "." 
    JP nz, C_F53A              ;0xf53f:   c2 3a f5  ".:." 
    JP nc, C_F565              ;0xf542:   d2 65 f5  ".e." 
    LD B,8                     ;0xf545:   06 08  ".."  
    LD DE,0x4dc                ;0xf547:   11 dc 04  "..."  
    LD HL,0x4ec                ;0xf54a:   21 ec 04  "!.."  
    OR A                       ;0xf54d:   b7  "." 
;--------------------------------------
C_F54E:                        ;          XREF: 0xF554 
    LD A,(DE)                  ;0xf54e:   1a  "." 
    ADC A,(HL)                 ;0xf54f:   8e  "." 
    LD (DE),A                  ;0xf550:   12  "." 
    INC DE                     ;0xf551:   13  "." 
    INC HL                     ;0xf552:   23  "#" 
    DEC B                      ;0xf553:   05  "." 
    JP nz, C_F54E              ;0xf554:   c2 4e f5  ".N." 
    LD B,8                     ;0xf557:   06 08  ".."  
;--------------------------------------
C_F559:                        ;          XREF: 0xF562 
    LD A,(DE)                  ;0xf559:   1a  "." 
    ADC A,0                    ;0xf55a:   ce 00  ".." 
    LD (DE),A                  ;0xf55c:   12  "." 
    JP nc, C_F565              ;0xf55d:   d2 65 f5  ".e." 
    INC DE                     ;0xf560:   13  "." 
    DEC B                      ;0xf561:   05  "." 
    JP nz, C_F559              ;0xf562:   c2 59 f5  ".Y." 
;--------------------------------------
C_F565:                        ;          XREF: 0xF542 
    LD HL,0x4db                ;0xf565:   21 db 04  "!.."  
    DEC (HL)                   ;0xf568:   35  "5" 
    JP nz, C_F534              ;0xf569:   c2 34 f5  ".4." 
    LD HL,(0x107)              ;0xf56c:   2a 07 01  "*.."  
    LD DE,12                   ;0xf56f:   11 0c 00  "..."  
    ADD HL,DE                  ;0xf572:   19  "." 
    LD DE,0x4e2                ;0xf573:   11 e2 04  "..."  
    LD B,10                    ;0xf576:   06 0a  ".."  
;--------------------------------------
C_F578:                        ;          XREF: 0xF57D 
    LD A,(DE)                  ;0xf578:   1a  "." 
    LD (HL),A                  ;0xf579:   77  "w" 
    INC DE                     ;0xf57a:   13  "." 
    DEC HL                     ;0xf57b:   2b  "+" 
    DEC B                      ;0xf57c:   05  "." 
    JP nz, C_F578              ;0xf57d:   c2 78 f5  ".x." 
    JP C_F634                  ;0xf580:   c3 34 f6  ".4." 
;--------------------------------------
C_F583:                        ;          XREF: 0xE0F9 
    CALL C_F2D2                ;0xf583:   cd d2 f2  "..." 
    JP z, C_FB35               ;0xf586:   ca 35 fb  ".5." 
    JP C_FB29                  ;0xf589:   c3 29 fb  ".)." 
;--------------------------------------
C_F58C:                        ;          XREF: 0xE13E 
    CALL C_F2D2                ;0xf58c:   cd d2 f2  "..." 
    JP z, C_FB29               ;0xf58f:   ca 29 fb  ".)." 
    JP C_FB35                  ;0xf592:   c3 35 fb  ".5." 
;--------------------------------------
C_F595:                        ;          XREF: 0xE108 
    CALL C_F2D2                ;0xf595:   cd d2 f2  "..." 
    JP m, C_FB35               ;0xf598:   fa 35 fb  ".5." 
    JP C_FB29                  ;0xf59b:   c3 29 fb  ".)." 
;--------------------------------------
C_F59E:                        ;          XREF: 0xE13B 
    CALL C_F2D2                ;0xf59e:   cd d2 f2  "..." 
    JP m, C_FB35               ;0xf5a1:   fa 35 fb  ".5." 
    JP z, C_FB35               ;0xf5a4:   ca 35 fb  ".5." 
    JP C_FB29                  ;0xf5a7:   c3 29 fb  ".)." 
;--------------------------------------
C_F5AA:                        ;          XREF: 0xE138 
    CALL C_F2D2                ;0xf5aa:   cd d2 f2  "..." 
    JP m, C_FB29               ;0xf5ad:   fa 29 fb  ".)." 
    JP C_FB35                  ;0xf5b0:   c3 35 fb  ".5." 
;--------------------------------------
C_F5B3:                        ;          XREF: 0xE0FC 
    CALL C_F2D2                ;0xf5b3:   cd d2 f2  "..." 
    JP m, C_FB29               ;0xf5b6:   fa 29 fb  ".)." 
    JP z, C_FB29               ;0xf5b9:   ca 29 fb  ".)." 
    JP C_FB35                  ;0xf5bc:   c3 35 fb  ".5." 
;--------------------------------------
C_F5BF:                        ;          XREF: 0xE147 
    PUSH BC                    ;0xf5bf:   c5  "." 
    LD A,H                     ;0xf5c0:   7c  "|" 
    OR L                       ;0xf5c1:   b5  "." 
    JP z, C_F64E               ;0xf5c2:   ca 4e f6  ".N." 
    EX DE,HL                   ;0xf5c5:   eb  "." 
    LD B,0                     ;0xf5c6:   06 00  ".."  
    JP C_F5E1                  ;0xf5c8:   c3 e1 f5  "..." 
;--------------------------------------
C_F5CB:                        ;          XREF: 0xE123 
    PUSH BC                    ;0xf5cb:   c5  "." 
    LD A,H                     ;0xf5cc:   7c  "|" 
    OR L                       ;0xf5cd:   b5  "." 
    JP z, C_F64E               ;0xf5ce:   ca 4e f6  ".N." 
    EX DE,HL                   ;0xf5d1:   eb  "." 
    LD B,0                     ;0xf5d2:   06 00  ".."  
    LD A,D                     ;0xf5d4:   7a  "z" 
    OR A                       ;0xf5d5:   b7  "." 
    JP p, C_F5E1               ;0xf5d6:   f2 e1 f5  "..." 
    CPL                        ;0xf5d9:   2f  "/" 
    LD D,A                     ;0xf5da:   57  "W" 
    LD A,E                     ;0xf5db:   7b  "{" 
    CPL                        ;0xf5dc:   2f  "/" 
    LD E,A                     ;0xf5dd:   5f  "_" 
    INC DE                     ;0xf5de:   13  "." 
    LD B,0x80                  ;0xf5df:   06 80  ".."  
;--------------------------------------
C_F5E1:                        ;          XREF: 0xF5C8 
    LD HL,(0x107)              ;0xf5e1:   2a 07 01  "*.."  
    LD (HL),B                  ;0xf5e4:   70  "p" 
    INC HL                     ;0xf5e5:   23  "#" 
    LD A,D                     ;0xf5e6:   7a  "z" 
    OR A                       ;0xf5e7:   b7  "." 
    JP nz, C_F5F8              ;0xf5e8:   c2 f8 f5  "..." 
    LD (HL),1                  ;0xf5eb:   36 01  "6."  
    INC HL                     ;0xf5ed:   23  "#" 
    LD (HL),0                  ;0xf5ee:   36 00  "6."  
    INC HL                     ;0xf5f0:   23  "#" 
    LD (HL),E                  ;0xf5f1:   73  "s" 
    LD B,7                     ;0xf5f2:   06 07  ".."  
    XOR A                      ;0xf5f4:   af  "." 
    JP C_F604                  ;0xf5f5:   c3 04 f6  "..." 
;--------------------------------------
C_F5F8:                        ;          XREF: 0xF5E8 
    LD (HL),2                  ;0xf5f8:   36 02  "6."  
    INC HL                     ;0xf5fa:   23  "#" 
    LD (HL),0                  ;0xf5fb:   36 00  "6."  
    INC HL                     ;0xf5fd:   23  "#" 
    LD (HL),D                  ;0xf5fe:   72  "r" 
    INC HL                     ;0xf5ff:   23  "#" 
    LD (HL),E                  ;0xf600:   73  "s" 
    LD B,6                     ;0xf601:   06 06  ".."  
    XOR A                      ;0xf603:   af  "." 
;--------------------------------------
C_F604:                        ;          XREF: 0xF5F5 
    INC HL                     ;0xf604:   23  "#" 
    LD (HL),A                  ;0xf605:   77  "w" 
    DEC B                      ;0xf606:   05  "." 
    JP nz, C_F604              ;0xf607:   c2 04 f6  "..." 
    JP C_F692                  ;0xf60a:   c3 92 f6  "..." 
;--------------------------------------
C_F60D:                        ;          XREF: 0xF22A 
    LD HL,(0x107)              ;0xf60d:   2a 07 01  "*.."  
    LD DE,10                   ;0xf610:   11 0a 00  "..."  
    ADD HL,DE                  ;0xf613:   19  "." 
    LD A,(HL)                  ;0xf614:   7e  "~" 
    CP 0x80                    ;0xf615:   fe 80  ".." 
    RET c                      ;0xf617:   d8  "." 
    JP nz, C_F621              ;0xf618:   c2 21 f6  ".!." 
    DEC HL                     ;0xf61b:   2b  "+" 
    LD A,(HL)                  ;0xf61c:   7e  "~" 
    OR 1                       ;0xf61d:   f6 01  ".." 
    LD (HL),A                  ;0xf61f:   77  "w" 
    RET                        ;0xf620:   c9  "." 
;--------------------------------------
C_F621:                        ;          XREF: 0xF618 
    PUSH BC                    ;0xf621:   c5  "." 
    LD BC,0x800                ;0xf622:   01 00 08  "..."  
    SCF                        ;0xf625:   37  "7" 
;--------------------------------------
C_F626:                        ;          XREF: 0xF62B 
    DEC HL                     ;0xf626:   2b  "+" 
    LD A,(HL)                  ;0xf627:   7e  "~" 
    ADC A,C                    ;0xf628:   89  "." 
    LD (HL),A                  ;0xf629:   77  "w" 
    DEC B                      ;0xf62a:   05  "." 
    JP nz, C_F626              ;0xf62b:   c2 26 f6  ".&." 
    OR A                       ;0xf62e:   b7  "." 
    JP nz, C_F634              ;0xf62f:   c2 34 f6  ".4." 
    POP BC                     ;0xf632:   c1  "." 
    RET                        ;0xf633:   c9  "." 
;--------------------------------------
C_F634:                        ;          XREF: 0xF34B 
    LD HL,(0x107)              ;0xf634:   2a 07 01  "*.."  
    INC HL                     ;0xf637:   23  "#" 
    LD A,(HL)                  ;0xf638:   7e  "~" 
    LD D,H                     ;0xf639:   54  "T" 
    LD E,L                     ;0xf63a:   5d  "]" 
    INC HL                     ;0xf63b:   23  "#" 
    LD C,A                     ;0xf63c:   4f  "O" 
    XOR A                      ;0xf63d:   af  "." 
    CP (HL)                    ;0xf63e:   be  "." 
    JP nz, C_F694              ;0xf63f:   c2 94 f6  "..." 
    LD B,8                     ;0xf642:   06 08  ".."  
;--------------------------------------
C_F644:                        ;          XREF: 0xF64B 
    INC HL                     ;0xf644:   23  "#" 
    CP (HL)                    ;0xf645:   be  "." 
    JP nz, C_F660              ;0xf646:   c2 60 f6  ".`." 
    DEC C                      ;0xf649:   0d  "." 
    DEC B                      ;0xf64a:   05  "." 
    JP nz, C_F644              ;0xf64b:   c2 44 f6  ".D." 
;--------------------------------------
C_F64E:                        ;          XREF: 0xF4F4 
    XOR A                      ;0xf64e:   af  "." 
    LD HL,(0x107)              ;0xf64f:   2a 07 01  "*.."  
    LD B,10                    ;0xf652:   06 0a  ".."  
    LD (HL),A                  ;0xf654:   77  "w" 
    INC HL                     ;0xf655:   23  "#" 
    LD (HL),0xc0               ;0xf656:   36 c0  "6."  
;--------------------------------------
C_F658:                        ;          XREF: 0xF41D 
    INC HL                     ;0xf658:   23  "#" 
    LD (HL),A                  ;0xf659:   77  "w" 
    DEC B                      ;0xf65a:   05  "." 
    JP nz, C_F658              ;0xf65b:   c2 58 f6  ".X." 
    POP BC                     ;0xf65e:   c1  "." 
    RET                        ;0xf65f:   c9  "." 
;--------------------------------------
C_F660:                        ;          XREF: 0xF646 
    LD A,8                     ;0xf660:   3e 08  ">."  
    SUB B                      ;0xf662:   90  "." 
    LD B,A                     ;0xf663:   47  "G" 
    JP z, C_F680               ;0xf664:   ca 80 f6  "..." 
    DEC HL                     ;0xf667:   2b  "+" 
    LD A,C                     ;0xf668:   79  "y" 
    LD (DE),A                  ;0xf669:   12  "." 
    PUSH DE                    ;0xf66a:   d5  "." 
    INC DE                     ;0xf66b:   13  "." 
    LD A,15                    ;0xf66c:   3e 0f  ">."  
    SUB B                      ;0xf66e:   90  "." 
    LD C,A                     ;0xf66f:   4f  "O" 
;--------------------------------------
C_F670:                        ;          XREF: 0xF675 
    LD A,(HL)                  ;0xf670:   7e  "~" 
    LD (DE),A                  ;0xf671:   12  "." 
    INC DE                     ;0xf672:   13  "." 
    INC HL                     ;0xf673:   23  "#" 
    DEC C                      ;0xf674:   0d  "." 
    JP nz, C_F670              ;0xf675:   c2 70 f6  ".p." 
    XOR A                      ;0xf678:   af  "." 
;--------------------------------------
C_F679:                        ;          XREF: 0xF67C 
    LD (DE),A                  ;0xf679:   12  "." 
    INC DE                     ;0xf67a:   13  "." 
    DEC B                      ;0xf67b:   05  "." 
    JP nz, C_F679              ;0xf67c:   c2 79 f6  ".y." 
    POP DE                     ;0xf67f:   d1  "." 
;--------------------------------------
C_F680:                        ;          XREF: 0xF664 
    LD A,(DE)                  ;0xf680:   1a  "." 
    OR A                       ;0xf681:   b7  "." 
    JP m, C_F68D               ;0xf682:   fa 8d f6  "..." 
    CP 0x40                    ;0xf685:   fe 40  ".@" 
    JP c, C_F692               ;0xf687:   da 92 f6  "..." 
    JP C_F6BF                  ;0xf68a:   c3 bf f6  "..." 
;--------------------------------------
C_F68D:                        ;          XREF: 0xF682 
    CP 0xc1                    ;0xf68d:   fe c1  ".." 
    JP c, C_F6AE               ;0xf68f:   da ae f6  "..." 
;--------------------------------------
C_F692:                        ;          XREF: 0xF60A 
    POP BC                     ;0xf692:   c1  "." 
    RET                        ;0xf693:   c9  "." 
;--------------------------------------
C_F694:                        ;          XREF: 0xF63F 
    INC C                      ;0xf694:   0c  "." 
    LD A,C                     ;0xf695:   79  "y" 
    LD (DE),A                  ;0xf696:   12  "." 
    LD B,15                    ;0xf697:   06 0f  ".."  
    PUSH DE                    ;0xf699:   d5  "." 
    LD HL,0x10                 ;0xf69a:   21 10 00  "!.."  
    ADD HL,DE                  ;0xf69d:   19  "." 
    LD D,H                     ;0xf69e:   54  "T" 
    LD E,L                     ;0xf69f:   5d  "]" 
;--------------------------------------
C_F6A0:                        ;          XREF: 0xF6A5 
    DEC DE                     ;0xf6a0:   1b  "." 
    LD A,(DE)                  ;0xf6a1:   1a  "." 
    LD (HL),A                  ;0xf6a2:   77  "w" 
    DEC HL                     ;0xf6a3:   2b  "+" 
    DEC B                      ;0xf6a4:   05  "." 
    JP nz, C_F6A0              ;0xf6a5:   c2 a0 f6  "..." 
    LD (HL),0                  ;0xf6a8:   36 00  "6."  
    POP DE                     ;0xf6aa:   d1  "." 
    JP C_F680                  ;0xf6ab:   c3 80 f6  "..." 
;--------------------------------------
C_F6AE:                        ;          XREF: 0xF68F 
    XOR A                      ;0xf6ae:   af  "." 
    LD HL,(0x107)              ;0xf6af:   2a 07 01  "*.."  
    INC HL                     ;0xf6b2:   23  "#" 
    LD (HL),0xc1               ;0xf6b3:   36 c1  "6."  
    INC HL                     ;0xf6b5:   23  "#" 
    LD (HL),A                  ;0xf6b6:   77  "w" 
    INC HL                     ;0xf6b7:   23  "#" 
    LD (HL),1                  ;0xf6b8:   36 01  "6."  
    LD B,8                     ;0xf6ba:   06 08  ".."  
    JP C_F658                  ;0xf6bc:   c3 58 f6  ".X." 
;--------------------------------------
C_F6BF:                        ;          XREF: 0xF3FE 
    LD HL,(0x107)              ;0xf6bf:   2a 07 01  "*.."  
    INC HL                     ;0xf6c2:   23  "#" 
    LD (HL),0x3f               ;0xf6c3:   36 3f  "6?"  
    INC HL                     ;0xf6c5:   23  "#" 
    LD (HL),0                  ;0xf6c6:   36 00  "6."  
    LD A,0xff                  ;0xf6c8:   3e ff  ">."  
    LD B,7                     ;0xf6ca:   06 07  ".."  
;--------------------------------------
C_F6CC:                        ;          XREF: 0xF6CF 
    INC HL                     ;0xf6cc:   23  "#" 
    LD (HL),A                  ;0xf6cd:   77  "w" 
    DEC B                      ;0xf6ce:   05  "." 
    JP nz, C_F6CC              ;0xf6cf:   c2 cc f6  "..." 
    INC HL                     ;0xf6d2:   23  "#" 
    LD (HL),0                  ;0xf6d3:   36 00  "6."  
    POP BC                     ;0xf6d5:   c1  "." 
    RET                        ;0xf6d6:   c9  "." 
    PUSH BC                    ;0xf6d7:   c5  "." 
    LD HL,(0x107)              ;0xf6d8:   2a 07 01  "*.."  
    LD (HL),0                  ;0xf6db:   36 00  "6."  
    INC HL                     ;0xf6dd:   23  "#" 
    LD (HL),3                  ;0xf6de:   36 03  "6."  
    LD DE,4                    ;0xf6e0:   11 04 00  "..."  
    ADD HL,DE                  ;0xf6e3:   19  "." 
    LD E,L                     ;0xf6e4:   5d  "]" 
    LD D,H                     ;0xf6e5:   54  "T" 
    LD B,5                     ;0xf6e6:   06 05  ".."  
    XOR A                      ;0xf6e8:   af  "." 
;--------------------------------------
C_F6E9:                        ;          XREF: 0xF6EC 
    INC HL                     ;0xf6e9:   23  "#" 
    LD (HL),A                  ;0xf6ea:   77  "w" 
    DEC B                      ;0xf6eb:   05  "." 
    JP nz, C_F6E9              ;0xf6ec:   c2 e9 f6  "..." 
    LD B,4                     ;0xf6ef:   06 04  ".."  
    LD HL,(0x103)              ;0xf6f1:   2a 03 01  "*.."  
    INC HL                     ;0xf6f4:   23  "#" 
    INC HL                     ;0xf6f5:   23  "#" 
    INC HL                     ;0xf6f6:   23  "#" 
    LD A,(HL)                  ;0xf6f7:   7e  "~" 
    LD HL,(0x103)              ;0xf6f8:   2a 03 01  "*.."  
    OR A                       ;0xf6fb:   b7  "." 
    JP p, C_F710               ;0xf6fc:   f2 10 f7  "..." 
;--------------------------------------
C_F6FF:                        ;          XREF: 0xF706 
    LD A,0                     ;0xf6ff:   3e 00  ">."  
    SBC A,(HL)                 ;0xf701:   9e  "." 
    LD (DE),A                  ;0xf702:   12  "." 
    INC HL                     ;0xf703:   23  "#" 
    DEC DE                     ;0xf704:   1b  "." 
    DEC B                      ;0xf705:   05  "." 
    JP nz, C_F6FF              ;0xf706:   c2 ff f6  "..." 
    DEC DE                     ;0xf709:   1b  "." 
    LD A,0x80                  ;0xf70a:   3e 80  ">."  
    LD (DE),A                  ;0xf70c:   12  "." 
    JP C_F634                  ;0xf70d:   c3 34 f6  ".4." 
;--------------------------------------
C_F710:                        ;          XREF: 0xF6FC 
    LD A,(HL)                  ;0xf710:   7e  "~" 
    LD (DE),A                  ;0xf711:   12  "." 
    INC HL                     ;0xf712:   23  "#" 
    DEC DE                     ;0xf713:   1b  "." 
    DEC B                      ;0xf714:   05  "." 
    JP nz, C_F710              ;0xf715:   c2 10 f7  "..." 
    JP C_F634                  ;0xf718:   c3 34 f6  ".4." 
    PUSH BC                    ;0xf71b:   c5  "." 
    LD HL,(0x103)              ;0xf71c:   2a 03 01  "*.."  
    LD D,H                     ;0xf71f:   54  "T" 
    LD E,L                     ;0xf720:   5d  "]" 
    XOR A                      ;0xf721:   af  "." 
    LD (HL),A                  ;0xf722:   77  "w" 
    INC HL                     ;0xf723:   23  "#" 
    LD (HL),A                  ;0xf724:   77  "w" 
    INC HL                     ;0xf725:   23  "#" 
    LD (HL),A                  ;0xf726:   77  "w" 
    INC HL                     ;0xf727:   23  "#" 
    LD (HL),A                  ;0xf728:   77  "w" 
    LD HL,(0x107)              ;0xf729:   2a 07 01  "*.."  
    LD C,(HL)                  ;0xf72c:   4e  "N" 
    INC HL                     ;0xf72d:   23  "#" 
    LD A,(HL)                  ;0xf72e:   7e  "~" 
    OR A                       ;0xf72f:   b7  "." 
    JP z, C_F692               ;0xf730:   ca 92 f6  "..." 
    JP m, C_F692               ;0xf733:   fa 92 f6  "..." 
    CP 5                       ;0xf736:   fe 05  ".." 
    JP nc, C_F761              ;0xf738:   d2 61 f7  ".a." 
    LD B,A                     ;0xf73b:   47  "G" 
    INC HL                     ;0xf73c:   23  "#" 
    ADD A,L                    ;0xf73d:   85  "." 
    LD L,A                     ;0xf73e:   6f  "o" 
    JP nc, C_F743              ;0xf73f:   d2 43 f7  ".C." 
    INC H                      ;0xf742:   24  "$" 
;--------------------------------------
C_F743:                        ;          XREF: 0xF73F 
    LD A,(HL)                  ;0xf743:   7e  "~" 
    LD (DE),A                  ;0xf744:   12  "." 
    INC DE                     ;0xf745:   13  "." 
    DEC HL                     ;0xf746:   2b  "+" 
    DEC B                      ;0xf747:   05  "." 
    JP nz, C_F743              ;0xf748:   c2 43 f7  ".C." 
    LD A,C                     ;0xf74b:   79  "y" 
    OR A                       ;0xf74c:   b7  "." 
    JP p, C_F692               ;0xf74d:   f2 92 f6  "..." 
    LD B,4                     ;0xf750:   06 04  ".."  
    LD HL,(0x103)              ;0xf752:   2a 03 01  "*.."  
;--------------------------------------
C_F755:                        ;          XREF: 0xF75B 
    LD A,0                     ;0xf755:   3e 00  ">."  
    SBC A,(HL)                 ;0xf757:   9e  "." 
    LD (HL),A                  ;0xf758:   77  "w" 
    INC HL                     ;0xf759:   23  "#" 
    DEC B                      ;0xf75a:   05  "." 
    JP nz, C_F755              ;0xf75b:   c2 55 f7  ".U." 
    JP C_F692                  ;0xf75e:   c3 92 f6  "..." 
;--------------------------------------
C_F761:                        ;          XREF: 0xF738 
    EX DE,HL                   ;0xf761:   eb  "." 
    LD A,C                     ;0xf762:   79  "y" 
    OR A                       ;0xf763:   b7  "." 
    JP m, C_F775               ;0xf764:   fa 75 f7  ".u." 
    LD (HL),0x7f               ;0xf767:   36 7f  "6."  
    INC HL                     ;0xf769:   23  "#" 
    LD (HL),0xff               ;0xf76a:   36 ff  "6."  
    INC HL                     ;0xf76c:   23  "#" 
    LD (HL),0xff               ;0xf76d:   36 ff  "6."  
    INC HL                     ;0xf76f:   23  "#" 
    LD (HL),0xff               ;0xf770:   36 ff  "6."  
    JP C_F7DC                  ;0xf772:   c3 dc f7  "..." 
;--------------------------------------
C_F775:                        ;          XREF: 0xF764 
    LD (HL),0x80               ;0xf775:   36 80  "6."  
    INC HL                     ;0xf777:   23  "#" 
    LD (HL),0                  ;0xf778:   36 00  "6."  
    INC HL                     ;0xf77a:   23  "#" 
    LD (HL),0                  ;0xf77b:   36 00  "6."  
    INC HL                     ;0xf77d:   23  "#" 
    LD (HL),0                  ;0xf77e:   36 00  "6."  
    JP C_F7DC                  ;0xf780:   c3 dc f7  "..." 
;--------------------------------------
C_F783:                        ;          XREF: 0xE12F 
    PUSH BC                    ;0xf783:   c5  "." 
    LD C,0                     ;0xf784:   0e 00  ".."  
    JP C_F78C                  ;0xf786:   c3 8c f7  "..." 
;--------------------------------------
C_F789:                        ;          XREF: 0xE11D 
    PUSH BC                    ;0xf789:   c5  "." 
    LD C,1                     ;0xf78a:   0e 01  ".."  
;--------------------------------------
C_F78C:                        ;          XREF: 0xF786 
    LD HL,(0x107)              ;0xf78c:   2a 07 01  "*.."  
    LD B,(HL)                  ;0xf78f:   46  "F" 
    INC HL                     ;0xf790:   23  "#" 
    LD A,(HL)                  ;0xf791:   7e  "~" 
    OR A                       ;0xf792:   b7  "." 
    JP z, C_F799               ;0xf793:   ca 99 f7  "..." 
    JP p, C_F79F               ;0xf796:   f2 9f f7  "..." 
;--------------------------------------
C_F799:                        ;          XREF: 0xF793 
    LD HL,0                    ;0xf799:   21 00 00  "!.."  
    JP C_F692                  ;0xf79c:   c3 92 f6  "..." 
;--------------------------------------
C_F79F:                        ;          XREF: 0xF796 
    CP 3                       ;0xf79f:   fe 03  ".." 
    JP nc, C_F7C3              ;0xf7a1:   d2 c3 f7  "..." 
    INC HL                     ;0xf7a4:   23  "#" 
    ADD A,L                    ;0xf7a5:   85  "." 
    LD L,A                     ;0xf7a6:   6f  "o" 
    JP nc, C_F7AB              ;0xf7a7:   d2 ab f7  "..." 
    INC H                      ;0xf7aa:   24  "$" 
;--------------------------------------
C_F7AB:                        ;          XREF: 0xF7A7 
    LD E,(HL)                  ;0xf7ab:   5e  "^" 
    DEC HL                     ;0xf7ac:   2b  "+" 
    LD D,(HL)                  ;0xf7ad:   56  "V" 
    EX DE,HL                   ;0xf7ae:   eb  "." 
    LD A,C                     ;0xf7af:   79  "y" 
    OR A                       ;0xf7b0:   b7  "." 
    JP z, C_F692               ;0xf7b1:   ca 92 f6  "..." 
    LD A,B                     ;0xf7b4:   78  "x" 
    OR A                       ;0xf7b5:   b7  "." 
    JP p, C_F692               ;0xf7b6:   f2 92 f6  "..." 
    LD A,H                     ;0xf7b9:   7c  "|" 
    CPL                        ;0xf7ba:   2f  "/" 
    LD H,A                     ;0xf7bb:   67  "g" 
    LD A,L                     ;0xf7bc:   7d  "}" 
;--------------------------------------
C_F7BD:                        ;          XREF: 0xF7F7 
    CPL                        ;0xf7bd:   2f  "/" 
    LD L,A                     ;0xf7be:   6f  "o" 
    INC HL                     ;0xf7bf:   23  "#" 
    JP C_F692                  ;0xf7c0:   c3 92 f6  "..." 
;--------------------------------------
C_F7C3:                        ;          XREF: 0xF7A1 
    LD A,C                     ;0xf7c3:   79  "y" 
    OR A                       ;0xf7c4:   b7  "." 
    JP nz, C_F7CE              ;0xf7c5:   c2 ce f7  "..." 
    LD HL,D_FFFF               ;0xf7c8:   21 ff ff  "!.."  
    JP C_F7DC                  ;0xf7cb:   c3 dc f7  "..." 
;--------------------------------------
C_F7CE:                        ;          XREF: 0xF7C5 
    LD A,B                     ;0xf7ce:   78  "x" 
    OR A                       ;0xf7cf:   b7  "." 
    JP m, C_F7D9               ;0xf7d0:   fa d9 f7  "..." 
    LD HL,0x7fff               ;0xf7d3:   21 ff 7f  "!.."  
    JP C_F7DC                  ;0xf7d6:   c3 dc f7  "..." 
;--------------------------------------
C_F7D9:                        ;          XREF: 0xF7D0 
    LD HL,0x8000               ;0xf7d9:   21 00 80  "!.."  
;--------------------------------------
C_F7DC:                        ;          XREF: 0xF772 
    POP BC                     ;0xf7dc:   c1  "." 
    RET                        ;0xf7dd:   c9  "." 
;--------------------------------------
D_F7DE:                        ;          XREF: 0xF920 
    x9 DEFB 0x40               ;0xf7de:   "@"
    x9 DEFB 0x80               ;0xf7df:   0x80
    x9 DEFB 0x0                ;0xf7e0:   0x0
    x9 DEFB 0x0                ;0xf7e1:   0x0
    x9 DEFB 0x0                ;0xf7e2:   0x0
    x9 DEFB 0x0                ;0xf7e3:   0x0
    x9 DEFB 0x0                ;0xf7e4:   0x0
    x9 DEFB 0x0                ;0xf7e5:   0x0
    x9 DEFB 0x40               ;0xf7e6:   "@"
    x9 DEFB 0xc                ;0xf7e7:   0xc
    x9 DEFB 0xcc               ;0xf7e8:   ('L') + 0x80
    x9 DEFB 0xcc               ;0xf7e9:   ('L') + 0x80
    x9 DEFB 0xcc               ;0xf7ea:   ('L') + 0x80
    x9 DEFB 0xcc               ;0xf7eb:   ('L') + 0x80
    x9 DEFB 0xcc               ;0xf7ec:   ('L') + 0x80
    x9 DEFB 0xcd               ;0xf7ed:   ('M') + 0x80
    x9 DEFB 0x40               ;0xf7ee:   "@"
    x9 DEFB 0x1                ;0xf7ef:   0x1
    x9 DEFB 0x47               ;0xf7f0:   "G"
    x9 DEFB 0xae               ;0xf7f1:   ('.') + 0x80
    x9 DEFB 0x14               ;0xf7f2:   0x14
    x9 DEFB 0x7a               ;0xf7f3:   "z"
    x9 DEFB 0xe1               ;0xf7f4:   ('a') + 0x80
    x9 DEFB 0x48               ;0xf7f5:   "H"
    x9 DEFB 0x3f               ;0xf7f6:   "?"
    x9 DEFB 0x20               ;0xf7f7:   " "
    x9 DEFB 0xc4               ;0xf7f8:   ('D') + 0x80
    x9 DEFB 0x9b               ;0xf7f9:   0x9b
    x9 DEFB 0xa5               ;0xf7fa:   ('%') + 0x80
    x9 DEFB 0xe3               ;0xf7fb:   ('c') + 0x80
    x9 DEFB 0x54               ;0xf7fc:   "T"
    x9 DEFB 0x0                ;0xf7fd:   0x0
    x9 DEFB 0x3f               ;0xf7fe:   "?"
    x9 DEFB 0x3                ;0xf7ff:   0x3
;--------------------------------------
D_F800:                        ;          XREF: 0xD0AD 
    x9 DEFB 0x46               ;0xf800:   "F"
    x9 DEFB 0xdc               ;0xf801:   ('\') + 0x80
    x9 DEFB 0x5d               ;0xf802:   "]"
    x9 DEFB 0x63               ;0xf803:   "c"
    x9 DEFB 0x88               ;0xf804:   0x88
    x9 DEFB 0x66               ;0xf805:   "f"
    x9 DEFB 0x3e               ;0xf806:   ">"
    x9 DEFB 0x53               ;0xf807:   "S"
    x9 DEFB 0xe2               ;0xf808:   ('b') + 0x80
    x9 DEFB 0xd6               ;0xf809:   ('V') + 0x80
    x9 DEFB 0x23               ;0xf80a:   "#"
    x9 DEFB 0x8d               ;0xf80b:   0x8d
    x9 DEFB 0xa3               ;0xf80c:   ('#') + 0x80
    x9 DEFB 0xcd               ;0xf80d:   ('M') + 0x80
    x9 DEFB 0x3e               ;0xf80e:   ">"
    x9 DEFB 0x8                ;0xf80f:   0x8
    x9 DEFB 0x63               ;0xf810:   "c"
    x9 DEFB 0x7b               ;0xf811:   "{"
    x9 DEFB 0xd0               ;0xf812:   ('P') + 0x80
    x9 DEFB 0x5a               ;0xf813:   "Z"
    x9 DEFB 0xf6               ;0xf814:   ('v') + 0x80
    x9 DEFB 0xc8               ;0xf815:   ('H') + 0x80
    x9 DEFB 0x3d               ;0xf816:   "="
    x9 DEFB 0xd6               ;0xf817:   ('V') + 0x80
    x9 DEFB 0xbf               ;0xf818:   ('?') + 0x80
    x9 DEFB 0x94               ;0xf819:   0x94
    x9 DEFB 0xd5               ;0xf81a:   ('U') + 0x80
    x9 DEFB 0xe5               ;0xf81b:   ('e') + 0x80
    x9 DEFB 0x7a               ;0xf81c:   "z"
    x9 DEFB 0x66               ;0xf81d:   "f"
    x9 DEFB 0x3d               ;0xf81e:   "="
    x9 DEFB 0x15               ;0xf81f:   0x15
    x9 DEFB 0x79               ;0xf820:   "y"
    x9 DEFB 0x8e               ;0xf821:   0x8e
    x9 DEFB 0xe2               ;0xf822:   ('b') + 0x80
    x9 DEFB 0x30               ;0xf823:   "0"
    x9 DEFB 0x8c               ;0xf824:   0x8c
    x9 DEFB 0x3d               ;0xf825:   "="
    x9 DEFB 0x3d               ;0xf826:   "="
    x9 DEFB 0x2                ;0xf827:   0x2
    x9 DEFB 0x25               ;0xf828:   "%"
    x9 DEFB 0xc1               ;0xf829:   ('A') + 0x80
    x9 DEFB 0x7d               ;0xf82a:   "}"
    x9 DEFB 0x4                ;0xf82b:   0x4
    x9 DEFB 0xda               ;0xf82c:   ('Z') + 0x80
    x9 DEFB 0xd3               ;0xf82d:   ('S') + 0x80
    x9 DEFB 0x3c               ;0xf82e:   "<"
    x9 DEFB 0x36               ;0xf82f:   "6"
    x9 DEFB 0xf9               ;0xf830:   ('y') + 0x80
    x9 DEFB 0xbf               ;0xf831:   ('?') + 0x80
    x9 DEFB 0xb3               ;0xf832:   ('3') + 0x80
    x9 DEFB 0xaf               ;0xf833:   ('/') + 0x80
    x9 DEFB 0x7b               ;0xf834:   "{"
    x9 DEFB 0x80               ;0xf835:   0x80
    x9 DEFB 0x3c               ;0xf836:   "<"
    x9 DEFB 0x5                ;0xf837:   0x5
    x9 DEFB 0x7f               ;0xf838:   0x7f
    x9 DEFB 0x5f               ;0xf839:   "_"
    x9 DEFB 0xf8               ;0xf83a:   ('x') + 0x80
    x9 DEFB 0x5e               ;0xf83b:   "^"
    x9 DEFB 0x59               ;0xf83c:   "Y"
    x9 DEFB 0x26               ;0xf83d:   "&"
    x9 DEFB 0x3b               ;0xf83e:   ";"
    x9 DEFB 0x8c               ;0xf83f:   0x8c
    x9 DEFB 0xbc               ;0xf840:   ('<') + 0x80
    x9 DEFB 0xcc               ;0xf841:   ('L') + 0x80
    x9 DEFB 0x9                ;0xf842:   0x9
    x9 DEFB 0x6f               ;0xf843:   "o"
    x9 DEFB 0x50               ;0xf844:   "P"
    x9 DEFB 0x9a               ;0xf845:   0x9a
    x9 DEFB 0x3b               ;0xf846:   ";"
    x9 DEFB 0xe                ;0xf847:   0xe
    x9 DEFB 0x12               ;0xf848:   0x12
    x9 DEFB 0xe1               ;0xf849:   ('a') + 0x80
    x9 DEFB 0x34               ;0xf84a:   "4"
    x9 DEFB 0x24               ;0xf84b:   "$"
    x9 DEFB 0xbb               ;0xf84c:   (';') + 0x80
    x9 DEFB 0x43               ;0xf84d:   "C"
    x9 DEFB 0x3b               ;0xf84e:   ";"
    x9 DEFB 0x1                ;0xf84f:   0x1
    x9 DEFB 0x68               ;0xf850:   "h"
    x9 DEFB 0x49               ;0xf851:   "I"
    x9 DEFB 0xb8               ;0xf852:   ('8') + 0x80
    x9 DEFB 0x6a               ;0xf853:   "j"
    x9 DEFB 0x12               ;0xf854:   0x12
    x9 DEFB 0xba               ;0xf855:   (':') + 0x80
    x9 DEFB 0x3a               ;0xf856:   ":"
    x9 DEFB 0x24               ;0xf857:   "$"
    x9 DEFB 0x7                ;0xf858:   0x7
    x9 DEFB 0x5f               ;0xf859:   "_"
    x9 DEFB 0x3d               ;0xf85a:   "="
    x9 DEFB 0xce               ;0xf85b:   ('N') + 0x80
    x9 DEFB 0xac               ;0xf85c:   (',') + 0x80
    x9 DEFB 0x33               ;0xf85d:   "3"
    x9 DEFB 0x3a               ;0xf85e:   ":"
    x9 DEFB 0x3                ;0xf85f:   0x3
    x9 DEFB 0x9a               ;0xf860:   0x9a
    x9 DEFB 0x56               ;0xf861:   "V"
    x9 DEFB 0x52               ;0xf862:   "R"
    x9 DEFB 0xfb               ;0xf863:   ('{') + 0x80
    x9 DEFB 0x11               ;0xf864:   0x11
    x9 DEFB 0x38               ;0xf865:   "8"
;--------------------------------------
C_F866:                        ;          XREF: 0xE1AD 
    PUSH BC                    ;0xf866:   c5  "." 
    LD HL,12                   ;0xf867:   21 0c 00  "!.."  
    ADD HL,SP                  ;0xf86a:   39  "9" 
    LD E,(HL)                  ;0xf86b:   5e  "^" 
    INC HL                     ;0xf86c:   23  "#" 
    LD D,(HL)                  ;0xf86d:   56  "V" 
    EX DE,HL                   ;0xf86e:   eb  "." 
    LD (0x4f4),HL              ;0xf86f:   22 f4 04  "".."  
    LD HL,4                    ;0xf872:   21 04 00  "!.."  
    ADD HL,SP                  ;0xf875:   39  "9" 
    CALL C_F209                ;0xf876:   cd 09 f2  "..." 
    LD HL,15                   ;0xf879:   21 0f 00  "!.."  
    LD (0x4f6),HL              ;0xf87c:   22 f6 04  "".."  
    LD HL,(0x107)              ;0xf87f:   2a 07 01  "*.."  
    LD A,(HL)                  ;0xf882:   7e  "~" 
    OR A                       ;0xf883:   b7  "." 
    JP p, C_F893               ;0xf884:   f2 93 f8  "..." 
    CALL C_F2B5                ;0xf887:   cd b5 f2  "..." 
    LD HL,(0x4f4)              ;0xf88a:   2a f4 04  "*.."  
    LD (HL),0x2d               ;0xf88d:   36 2d  "6-"  
    INC HL                     ;0xf88f:   23  "#" 
    LD (0x4f4),HL              ;0xf890:   22 f4 04  "".."  
;--------------------------------------
C_F893:                        ;          XREF: 0xF884 
    LD BC,0                    ;0xf893:   01 00 00  "..."  
    CALL C_F2BD                ;0xf896:   cd bd f2  "..." 
    JP z, C_F919               ;0xf899:   ca 19 f9  "..." 
    CALL C_F1F4                ;0xf89c:   cd f4 f1  "..." 
    LD B,C                     ;0xf89f:   41  "A" 
    LD A,(BC)                  ;0xf8a0:   0a  "." 
    NOP                        ;0xf8a1:   00  "." 
    NOP                        ;0xf8a2:   00  "." 
    NOP                        ;0xf8a3:   00  "." 
    NOP                        ;0xf8a4:   00  "." 
    NOP                        ;0xf8a5:   00  "." 
    NOP                        ;0xf8a6:   00  "." 
    LD HL,(0x107)              ;0xf8a7:   2a 07 01  "*.."  
    INC HL                     ;0xf8aa:   23  "#" 
    LD A,(HL)                  ;0xf8ab:   7e  "~" 
    CP 1                       ;0xf8ac:   fe 01  ".." 
    JP m, C_F912               ;0xf8ae:   fa 12 f9  "..." 
    JP z, C_F8F9               ;0xf8b1:   ca f9 f8  "..." 
    CP 2                       ;0xf8b4:   fe 02  ".." 
    JP nz, C_F8C1              ;0xf8b6:   c2 c1 f8  "..." 
    INC HL                     ;0xf8b9:   23  "#" 
    INC HL                     ;0xf8ba:   23  "#" 
    LD A,(HL)                  ;0xf8bb:   7e  "~" 
    CP 0x27                    ;0xf8bc:   fe 27  ".'" 
    JP c, C_F901               ;0xf8be:   da 01 f9  "..." 
;--------------------------------------
C_F8C1:                        ;          XREF: 0xF8B6 
    CALL C_FA12                ;0xf8c1:   cd 12 fa  "..." 
    CALL C_F1F4                ;0xf8c4:   cd f4 f1  "..." 
    LD B,B                     ;0xf8c7:   40  "@" 
    ADD HL,DE                  ;0xf8c8:   19  "." 
    SBC A,C                    ;0xf8c9:   99  "." 
    SBC A,C                    ;0xf8ca:   99  "." 
    SBC A,C                    ;0xf8cb:   99  "." 
    SBC A,C                    ;0xf8cc:   99  "." 
    SBC A,C                    ;0xf8cd:   99  "." 
    SBC A,D                    ;0xf8ce:   9a  "." 
;--------------------------------------
C_F8CF:                        ;          XREF: 0xF8D6 
    CALL C_FA1E                ;0xf8cf:   cd 1e fa  "..." 
    INC BC                     ;0xf8d2:   03  "." 
    CALL C_F595                ;0xf8d3:   cd 95 f5  "..." 
    JP nz, C_F8CF              ;0xf8d6:   c2 cf f8  "..." 
    CALL C_FA12                ;0xf8d9:   cd 12 fa  "..." 
    LD HL,(0x107)              ;0xf8dc:   2a 07 01  "*.."  
    INC HL                     ;0xf8df:   23  "#" 
    INC HL                     ;0xf8e0:   23  "#" 
    INC HL                     ;0xf8e1:   23  "#" 
    LD A,(HL)                  ;0xf8e2:   7e  "~" 
    CP 10                      ;0xf8e3:   fe 0a  ".." 
    JP c, C_F919               ;0xf8e5:   da 19 f9  "..." 
    DEC BC                     ;0xf8e8:   0b  "." 
    CALL C_FA1E                ;0xf8e9:   cd 1e fa  "..." 
    JP C_F919                  ;0xf8ec:   c3 19 f9  "..." 
;--------------------------------------
C_F8EF:                        ;          XREF: 0xF905 
    LD HL,(0x107)              ;0xf8ef:   2a 07 01  "*.."  
    INC HL                     ;0xf8f2:   23  "#" 
    LD A,(HL)                  ;0xf8f3:   7e  "~" 
    CP 1                       ;0xf8f4:   fe 01  ".." 
    JP nz, C_F901              ;0xf8f6:   c2 01 f9  "..." 
;--------------------------------------
C_F8F9:                        ;          XREF: 0xF8B1 
    INC HL                     ;0xf8f9:   23  "#" 
    INC HL                     ;0xf8fa:   23  "#" 
    LD A,(HL)                  ;0xf8fb:   7e  "~" 
    CP 10                      ;0xf8fc:   fe 0a  ".." 
    JP c, C_F919               ;0xf8fe:   da 19 f9  "..." 
;--------------------------------------
C_F901:                        ;          XREF: 0xF8BE 
    CALL C_F3E4                ;0xf901:   cd e4 f3  "..." 
    INC BC                     ;0xf904:   03  "." 
    JP C_F8EF                  ;0xf905:   c3 ef f8  "..." 
;--------------------------------------
C_F908:                        ;          XREF: 0xF916 
    LD HL,(0x107)              ;0xf908:   2a 07 01  "*.."  
    INC HL                     ;0xf90b:   23  "#" 
    LD A,(HL)                  ;0xf90c:   7e  "~" 
    CP 1                       ;0xf90d:   fe 01  ".." 
    JP p, C_F919               ;0xf90f:   f2 19 f9  "..." 
;--------------------------------------
C_F912:                        ;          XREF: 0xF8AE 
    CALL C_FA1E                ;0xf912:   cd 1e fa  "..." 
    DEC BC                     ;0xf915:   0b  "." 
    JP C_F908                  ;0xf916:   c3 08 f9  "..." 
;--------------------------------------
C_F919:                        ;          XREF: 0xF899 
    LD HL,(0x4f6)              ;0xf919:   2a f6 04  "*.."  
    DEC HL                     ;0xf91c:   2b  "+" 
    ADD HL,HL                  ;0xf91d:   29  ")" 
    ADD HL,HL                  ;0xf91e:   29  ")" 
    ADD HL,HL                  ;0xf91f:   29  ")" 
    LD DE,D_F7DE               ;0xf920:   11 de f7  "..."  
    ADD HL,DE                  ;0xf923:   19  "." 
    CALL C_F1FB                ;0xf924:   cd fb f1  "..." 
    CALL C_F30F                ;0xf927:   cd 0f f3  "..." 
    CALL C_F1F4                ;0xf92a:   cd f4 f1  "..." 
    LD B,C                     ;0xf92d:   41  "A" 
    LD A,(BC)                  ;0xf92e:   0a  "." 
    NOP                        ;0xf92f:   00  "." 
    NOP                        ;0xf930:   00  "." 
    NOP                        ;0xf931:   00  "." 
    NOP                        ;0xf932:   00  "." 
    NOP                        ;0xf933:   00  "." 
    NOP                        ;0xf934:   00  "." 
    CALL C_F5AA                ;0xf935:   cd aa f5  "..." 
    JP z, C_F949               ;0xf938:   ca 49 f9  ".I." 
    LD HL,1                    ;0xf93b:   21 01 00  "!.."  
    CALL C_F5BF                ;0xf93e:   cd bf f5  "..." 
    INC BC                     ;0xf941:   03  "." 
    LD HL,(0x4f6)              ;0xf942:   2a f6 04  "*.."  
    INC HL                     ;0xf945:   23  "#" 
    LD (0x4f6),HL              ;0xf946:   22 f6 04  "".."  
;--------------------------------------
C_F949:                        ;          XREF: 0xF938 
    LD H,B                     ;0xf949:   60  "`" 
    LD L,C                     ;0xf94a:   69  "i" 
    LD (0x4f8),HL              ;0xf94b:   22 f8 04  "".."  
    LD A,0xff                  ;0xf94e:   3e ff  ">."  
    LD (0x4fa),A               ;0xf950:   32 fa 04  "2.."  
    LD A,B                     ;0xf953:   78  "x" 
    OR A                       ;0xf954:   b7  "." 
    JP m, C_F961               ;0xf955:   fa 61 f9  ".a." 
    LD A,C                     ;0xf958:   79  "y" 
    CP 15                      ;0xf959:   fe 0f  ".." 
    JP nc, C_F968              ;0xf95b:   d2 68 f9  ".h." 
    JP C_F988                  ;0xf95e:   c3 88 f9  "..." 
;--------------------------------------
C_F961:                        ;          XREF: 0xF955 
    LD A,C                     ;0xf961:   79  "y" 
    CPL                        ;0xf962:   2f  "/" 
    CP 1                       ;0xf963:   fe 01  ".." 
    JP c, C_F96F               ;0xf965:   da 6f f9  ".o." 
;--------------------------------------
C_F968:                        ;          XREF: 0xF95B 
    XOR A                      ;0xf968:   af  "." 
    LD (0x4fa),A               ;0xf969:   32 fa 04  "2.."  
    JP C_F988                  ;0xf96c:   c3 88 f9  "..." 
;--------------------------------------
C_F96F:                        ;          XREF: 0xF965 
    LD HL,(0x4f4)              ;0xf96f:   2a f4 04  "*.."  
    LD (HL),0x30               ;0xf972:   36 30  "60"  
    INC HL                     ;0xf974:   23  "#" 
    LD (HL),0x2e               ;0xf975:   36 2e  "6."  
    INC HL                     ;0xf977:   23  "#" 
    OR A                       ;0xf978:   b7  "." 
    JP z, C_F983               ;0xf979:   ca 83 f9  "..." 
;--------------------------------------
C_F97C:                        ;          XREF: 0xF980 
    LD (HL),0x30               ;0xf97c:   36 30  "60"  
    INC HL                     ;0xf97e:   23  "#" 
    DEC A                      ;0xf97f:   3d  "=" 
    JP nz, C_F97C              ;0xf980:   c2 7c f9  ".|." 
;--------------------------------------
C_F983:                        ;          XREF: 0xF979 
    LD (0x4f4),HL              ;0xf983:   22 f4 04  "".."  
    LD A,0xff                  ;0xf986:   3e ff  ">."  
;--------------------------------------
C_F988:                        ;          XREF: 0xF95E 
    LD C,A                     ;0xf988:   4f  "O" 
    LD B,0xff                  ;0xf989:   06 ff  ".."  
;--------------------------------------
C_F98B:                        ;          XREF: 0xF9BA 
    INC B                      ;0xf98b:   04  "." 
    LD A,(0x4f6)               ;0xf98c:   3a f6 04  ":.."  
    CP B                       ;0xf98f:   b8  "." 
    JP c, C_F9BD               ;0xf990:   da bd f9  "..." 
    JP z, C_F9BD               ;0xf993:   ca bd f9  "..." 
    LD HL,(0x107)              ;0xf996:   2a 07 01  "*.."  
    INC HL                     ;0xf999:   23  "#" 
    LD A,(HL)                  ;0xf99a:   7e  "~" 
    CP 1                       ;0xf99b:   fe 01  ".." 
    LD A,0x30                  ;0xf99d:   3e 30  ">0"  
    JP nz, C_F9A7              ;0xf99f:   c2 a7 f9  "..." 
    INC HL                     ;0xf9a2:   23  "#" 
    INC HL                     ;0xf9a3:   23  "#" 
    ADD A,(HL)                 ;0xf9a4:   86  "." 
    LD (HL),0                  ;0xf9a5:   36 00  "6."  
;--------------------------------------
C_F9A7:                        ;          XREF: 0xF99F 
    LD HL,(0x4f4)              ;0xf9a7:   2a f4 04  "*.."  
    LD (HL),A                  ;0xf9aa:   77  "w" 
    INC HL                     ;0xf9ab:   23  "#" 
    LD A,B                     ;0xf9ac:   78  "x" 
    CP C                       ;0xf9ad:   b9  "." 
    JP nz, C_F9B4              ;0xf9ae:   c2 b4 f9  "..." 
    LD (HL),0x2e               ;0xf9b1:   36 2e  "6."  
    INC HL                     ;0xf9b3:   23  "#" 
;--------------------------------------
C_F9B4:                        ;          XREF: 0xF9AE 
    LD (0x4f4),HL              ;0xf9b4:   22 f4 04  "".."  
    CALL C_FA1E                ;0xf9b7:   cd 1e fa  "..." 
    JP C_F98B                  ;0xf9ba:   c3 8b f9  "..." 
;--------------------------------------
C_F9BD:                        ;          XREF: 0xF990 
    LD HL,(0x4f4)              ;0xf9bd:   2a f4 04  "*.."  
;--------------------------------------
C_F9C0:                        ;          XREF: 0xF9C4 
    DEC HL                     ;0xf9c0:   2b  "+" 
    LD A,(HL)                  ;0xf9c1:   7e  "~" 
    CP 0x30                    ;0xf9c2:   fe 30  ".0" 
    JP z, C_F9C0               ;0xf9c4:   ca c0 f9  "..." 
    LD A,(0x4fa)               ;0xf9c7:   3a fa 04  ":.."  
    OR A                       ;0xf9ca:   b7  "." 
    JP z, C_F9D8               ;0xf9cb:   ca d8 f9  "..." 
    LD A,(HL)                  ;0xf9ce:   7e  "~" 
    CP 0x2e                    ;0xf9cf:   fe 2e  ".." 
    JP z, C_FA0E               ;0xf9d1:   ca 0e fa  "..." 
    INC HL                     ;0xf9d4:   23  "#" 
    JP C_FA0E                  ;0xf9d5:   c3 0e fa  "..." 
;--------------------------------------
C_F9D8:                        ;          XREF: 0xF9CB 
    INC HL                     ;0xf9d8:   23  "#" 
    LD (HL),0x65               ;0xf9d9:   36 65  "6e"  
    INC HL                     ;0xf9db:   23  "#" 
    LD (HL),0x2b               ;0xf9dc:   36 2b  "6+"  
    LD A,(0x4f9)               ;0xf9de:   3a f9 04  ":.."  
    OR A                       ;0xf9e1:   b7  "." 
    LD A,(0x4f8)               ;0xf9e2:   3a f8 04  ":.."  
    JP p, C_F9EC               ;0xf9e5:   f2 ec f9  "..." 
    LD (HL),0x2d               ;0xf9e8:   36 2d  "6-"  
    CPL                        ;0xf9ea:   2f  "/" 
    INC A                      ;0xf9eb:   3c  "<" 
;--------------------------------------
C_F9EC:                        ;          XREF: 0xF9E5 
    INC HL                     ;0xf9ec:   23  "#" 
    CP 0x64                    ;0xf9ed:   fe 64  ".d" 
    JP c, C_F9F7               ;0xf9ef:   da f7 f9  "..." 
    LD (HL),0x31               ;0xf9f2:   36 31  "61"  
    INC HL                     ;0xf9f4:   23  "#" 
    SUB 0x64                   ;0xf9f5:   d6 64  ".d" 
;--------------------------------------
C_F9F7:                        ;          XREF: 0xF9EF 
    LD B,0                     ;0xf9f7:   06 00  ".."  
;--------------------------------------
C_F9F9:                        ;          XREF: 0xFA01 
    CP 10                      ;0xf9f9:   fe 0a  ".." 
    JP c, C_FA04               ;0xf9fb:   da 04 fa  "..." 
    INC B                      ;0xf9fe:   04  "." 
    SUB 10                     ;0xf9ff:   d6 0a  ".." 
    JP C_F9F9                  ;0xfa01:   c3 f9 f9  "..." 
;--------------------------------------
C_FA04:                        ;          XREF: 0xF9FB 
    ADD A,0x30                 ;0xfa04:   c6 30  ".0" 
    LD E,A                     ;0xfa06:   5f  "_" 
    LD A,0x30                  ;0xfa07:   3e 30  ">0"  
    ADD A,B                    ;0xfa09:   80  "." 
    LD (HL),A                  ;0xfa0a:   77  "w" 
    INC HL                     ;0xfa0b:   23  "#" 
    LD (HL),E                  ;0xfa0c:   73  "s" 
    INC HL                     ;0xfa0d:   23  "#" 
;--------------------------------------
C_FA0E:                        ;          XREF: 0xF9D1 
    LD (HL),0                  ;0xfa0e:   36 00  "6."  
    POP BC                     ;0xfa10:   c1  "." 
    RET                        ;0xfa11:   c9  "." 
;--------------------------------------
C_FA12:                        ;          XREF: 0xF8C1 
    CALL C_F2A6                ;0xfa12:   cd a6 f2  "..." 
    LD HL,1                    ;0xfa15:   21 01 00  "!.."  
    CALL C_F5BF                ;0xfa18:   cd bf f5  "..." 
    JP C_F3E4                  ;0xfa1b:   c3 e4 f3  "..." 
;--------------------------------------
C_FA1E:                        ;          XREF: 0xF8CF 
    PUSH BC                    ;0xfa1e:   c5  "." 
    LD HL,(0x107)              ;0xfa1f:   2a 07 01  "*.."  
    INC HL                     ;0xfa22:   23  "#" 
    INC (HL)                   ;0xfa23:   34  "4" 
    LD DE,9                    ;0xfa24:   11 09 00  "..."  
    ADD HL,DE                  ;0xfa27:   19  "." 
    XOR A                      ;0xfa28:   af  "." 
    LD B,8                     ;0xfa29:   06 08  ".."  
;--------------------------------------
C_FA2B:                        ;          XREF: 0xFA41 
    PUSH BC                    ;0xfa2b:   c5  "." 
    LD E,(HL)                  ;0xfa2c:   5e  "^" 
    EX DE,HL                   ;0xfa2d:   eb  "." 
    LD H,0                     ;0xfa2e:   26 00  "&."  
    ADD HL,HL                  ;0xfa30:   29  ")" 
    LD B,H                     ;0xfa31:   44  "D" 
    LD C,L                     ;0xfa32:   4d  "M" 
    ADD HL,HL                  ;0xfa33:   29  ")" 
    ADD HL,HL                  ;0xfa34:   29  ")" 
    ADD HL,BC                  ;0xfa35:   09  "." 
    EX DE,HL                   ;0xfa36:   eb  "." 
    ADD A,E                    ;0xfa37:   83  "." 
    INC HL                     ;0xfa38:   23  "#" 
    LD (HL),A                  ;0xfa39:   77  "w" 
    LD A,D                     ;0xfa3a:   7a  "z" 
    ADC A,0                    ;0xfa3b:   ce 00  ".." 
    DEC HL                     ;0xfa3d:   2b  "+" 
    DEC HL                     ;0xfa3e:   2b  "+" 
    POP BC                     ;0xfa3f:   c1  "." 
    DEC B                      ;0xfa40:   05  "." 
    JP nz, C_FA2B              ;0xfa41:   c2 2b fa  ".+." 
    INC HL                     ;0xfa44:   23  "#" 
    LD (HL),A                  ;0xfa45:   77  "w" 
    OR A                       ;0xfa46:   b7  "." 
    JP z, C_F634               ;0xfa47:   ca 34 f6  ".4." 
    DEC HL                     ;0xfa4a:   2b  "+" 
    DEC HL                     ;0xfa4b:   2b  "+" 
    LD A,(HL)                  ;0xfa4c:   7e  "~" 
    OR A                       ;0xfa4d:   b7  "." 
    JP m, C_FA56               ;0xfa4e:   fa 56 fa  ".V." 
    CP 0x40                    ;0xfa51:   fe 40  ".@" 
    JP nc, C_F6BF              ;0xfa53:   d2 bf f6  "..." 
;--------------------------------------
C_FA56:                        ;          XREF: 0xFA4E 
    POP BC                     ;0xfa56:   c1  "." 
    RET                        ;0xfa57:   c9  "." 
;--------------------------------------
C_FA58:                        ;          XREF: 0xE1A4 
    CALL C_FF90                ;0xfa58:   cd 90 ff  "..." 
    LD HL,8                    ;0xfa5b:   21 08 00  "!.."  
    x1 DEFB "9N#FPY!a", 0x00   ;0xfa5e:   0xfa5e to 0xfa69
    x7 DEFB 0xcd               ;0xfa67:   
    x4 DEFB "=", '{' + 0x80    ;0xfa68:   0xfa68 to 0xfa6a
    x4 DEFB "(", 0x13          ;0xfa6a:   0xfa6a to 0xfa6c
    x4 DEFB "PY!z", 0x00       ;0xfa6c:   0xfa6c to 0xfa71
    x7 DEFB 0xcd               ;0xfa71:   
    x4 DEFB ">", '{' + 0x80    ;0xfa72:   0xfa72 to 0xfa74
    x4 DEFB "(", 0x09          ;0xfa74:   0xfa74 to 0xfa76
    x4 DEFB "`i", 0x11         ;0xfa76:   0xfa76 to 0xfa79
    x4 DEFB " ", 0x00          ;0xfa79:   0xfa79 to 0xfa7b
    x7 DEFB 0xcd               ;0xfa7b:   
    x4 DEFB "l", '|' + 0x80    ;0xfa7c:   0xfa7c to 0xfa7e
;--------------------------------------
D_FA7E:                        ;          XREF: 0xC992 0xC9EA 
    x9 DEFB 0xc9               ;0xfa7e:   ('I') + 0x80
;--------------------------------------
C_FA7F:                        ;          XREF: 0xFA6A 
    LD H,B                     ;0xfa7f:   60  "`" 
    LD L,C                     ;0xfa80:   69  "i" 
    RET                        ;0xfa81:   c9  "." 
;--------------------------------------
C_FA82:                        ;          XREF: 0xE1A7 
    CALL C_FF90                ;0xfa82:   cd 90 ff  "..." 
    LD HL,8                    ;0xfa85:   21 08 00  "!.."  
    x1 DEFB "9N#FPY!A", 0x00   ;0xfa88:   0xfa88 to 0xfa93
    x7 DEFB 0xcd               ;0xfa91:   
    x4 DEFB "=", '{' + 0x80    ;0xfa92:   0xfa92 to 0xfa94
    x4 DEFB "(", 0x13          ;0xfa94:   0xfa94 to 0xfa96
    x4 DEFB "PY!Z", 0x00       ;0xfa96:   0xfa96 to 0xfa9b
    x7 DEFB 0xcd               ;0xfa9b:   
    x4 DEFB ">", '{' + 0x80    ;0xfa9c:   0xfa9c to 0xfa9e
    x4 DEFB "(", 0x09          ;0xfa9e:   0xfa9e to 0xfaa0
    x4 DEFB "`i", 0x11         ;0xfaa0:   0xfaa0 to 0xfaa3
    x4 DEFB " ", 0x00          ;0xfaa3:   0xfaa3 to 0xfaa5
    x7 DEFB 0xcd               ;0xfaa5:   
    x4 DEFB "l", '|' + 0x80    ;0xfaa6:   0xfaa6 to 0xfaa8
    x7 DEFB 0xc9               ;0xfaa8:   
;--------------------------------------
C_FAA9:                        ;          XREF: 0xFA94 
    LD H,B                     ;0xfaa9:   60  "`" 
    LD L,C                     ;0xfaaa:   69  "i" 
    RET                        ;0xfaab:   c9  "." 
;--------------------------------------
C_FAAC:                        ;          XREF: 0xE1A1 
    CALL C_FF90                ;0xfaac:   cd 90 ff  "..." 
    LD HL,8                    ;0xfaaf:   21 08 00  "!.."  
    ADD HL,SP                  ;0xfab2:   39  "9" 
    LD C,(HL)                  ;0xfab3:   4e  "N" 
    INC HL                     ;0xfab4:   23  "#" 
    LD B,(HL)                  ;0xfab5:   46  "F" 
    LD H,B                     ;0xfab6:   60  "`" 
    LD L,C                     ;0xfab7:   69  "i" 
    LD DE,0x20                 ;0xfab8:   11 20 00  ". ."  
    CALL C_FB24                ;0xfabb:   cd 24 fb  ".$." 
    JR nz, C_FAD8              ;0xfabe:   20 18  " ." 
    LD H,B                     ;0xfac0:   60  "`" 
    LD L,C                     ;0xfac1:   69  "i" 
    LD DE,9                    ;0xfac2:   11 09 00  "..."  
    CALL C_FB24                ;0xfac5:   cd 24 fb  ".$." 
    JR nz, C_FAD8              ;0xfac8:   20 0e  " ." 
    LD H,B                     ;0xfaca:   60  "`" 
    LD L,C                     ;0xfacb:   69  "i" 
    LD DE,10                   ;0xfacc:   11 0a 00  "..."  
    CALL C_FB24                ;0xfacf:   cd 24 fb  ".$." 
    JR nz, C_FAD8              ;0xfad2:   20 04  " ." 
    LD HL,0                    ;0xfad4:   21 00 00  "!.."  
    RET                        ;0xfad7:   c9  "." 
;--------------------------------------
C_FAD8:                        ;          XREF: 0xFABE 
    LD HL,1                    ;0xfad8:   21 01 00  "!.."  
    RET                        ;0xfadb:   c9  "." 
;--------------------------------------
C_FADC:                        ;          XREF: 0xE0ED 
    LD A,H                     ;0xfadc:   7c  "|" 
;--------------------------------------
D_FADD:                        ;          XREF: 0xC446 0xC38A 0xC435 0xC3F7 0xC3DB 
    AND D                      ;0xfadd:   a2  "." 
    x9 DEFB 0x67               ;0xfade:   "g"
;--------------------------------------
D_FADF:                        ;          XREF: 0xC43A 0xC3E3 0xC44C 0xC3FF 
    x9 DEFB 0x7d               ;0xfadf:   "}"
    x9 DEFB 0xa3               ;0xfae0:   ('#') + 0x80
    x9 DEFB 0x6f               ;0xfae1:   "o"
    x9 DEFB 0xb4               ;0xfae2:   ('4') + 0x80
    x9 DEFB 0xc9               ;0xfae3:   ('I') + 0x80
;--------------------------------------
C_FAE4:                        ;          XREF: 0xE16E 
    LD A,H                     ;0xfae4:   7c  "|" 
    CPL                        ;0xfae5:   2f  "/" 
    LD H,A                     ;0xfae6:   67  "g" 
    LD A,L                     ;0xfae7:   7d  "}" 
    CPL                        ;0xfae8:   2f  "/" 
    LD L,A                     ;0xfae9:   6f  "o" 
    OR H                       ;0xfaea:   b4  "." 
    RET                        ;0xfaeb:   c9  "." 
;--------------------------------------
C_FAEC:                        ;          XREF: 0xE0F0 
    JP (HL)                    ;0xfaec:   e9  "." 
;--------------------------------------
C_FAED:                        ;          XREF: 0xE12C 
    POP HL                     ;0xfaed:   e1  "." 
    PUSH BC                    ;0xfaee:   c5  "." 
    LD E,(HL)                  ;0xfaef:   5e  "^" 
    INC HL                     ;0xfaf0:   23  "#" 
    LD D,(HL)                  ;0xfaf1:   56  "V" 
    INC HL                     ;0xfaf2:   23  "#" 
    LD B,H                     ;0xfaf3:   44  "D" 
    LD C,L                     ;0xfaf4:   4d  "M" 
    LD HL,0                    ;0xfaf5:   21 00 00  "!.."  
    ADD HL,SP                  ;0xfaf8:   39  "9" 
    EX DE,HL                   ;0xfaf9:   eb  "." 
    ADD HL,SP                  ;0xfafa:   39  "9" 
    LD SP,HL                   ;0xfafb:   f9  "." 
    PUSH DE                    ;0xfafc:   d5  "." 
    LD H,B                     ;0xfafd:   60  "`" 
    LD L,C                     ;0xfafe:   69  "i" 
    CALL C_FAEC                ;0xfaff:   cd ec fa  "..." 
    x9 DEFB 0xeb               ;0xfb02:   ('k') + 0x80
    x9 DEFB 0xe1               ;0xfb03:   ('a') + 0x80
    x9 DEFB 0xf9               ;0xfb04:   ('y') + 0x80
    x9 DEFB 0xc1               ;0xfb05:   ('A') + 0x80
    x9 DEFB 0xeb               ;0xfb06:   ('k') + 0x80
    x9 DEFB 0x7c               ;0xfb07:   "|"
    x9 DEFB 0xb5               ;0xfb08:   ('5') + 0x80
    x9 DEFB 0xc9               ;0xfb09:   ('I') + 0x80
;--------------------------------------
C_FB0A:                        ;          XREF: 0xE14A 
    LD A,D                     ;0xfb0a:   7a  "z" 
    XOR H                      ;0xfb0b:   ac  "." 
    LD (0x4fc),A               ;0xfb0c:   32 fc 04  "2.."  
    CALL C_FB7B                ;0xfb0f:   cd 7b fb  ".{." 
    EX DE,HL                   ;0xfb12:   eb  "." 
    LD A,(0x4fc)               ;0xfb13:   3a fc 04  ":.."  
    OR A                       ;0xfb16:   b7  "." 
    JP m, C_FBD4               ;0xfb17:   fa d4 fb  "..." 
    LD A,L                     ;0xfb1a:   7d  "}" 
    OR H                       ;0xfb1b:   b4  "." 
    RET                        ;0xfb1c:   c9  "." 
;--------------------------------------
C_FB1D:                        ;          XREF: 0xE183 
    CALL C_FB94                ;0xfb1d:   cd 94 fb  "..." 
    EX DE,HL                   ;0xfb20:   eb  "." 
    LD A,L                     ;0xfb21:   7d  "}" 
    OR H                       ;0xfb22:   b4  "." 
    RET                        ;0xfb23:   c9  "." 
;--------------------------------------
C_FB24:                        ;          XREF: 0xE0E1 
    AND A                      ;0xfb24:   a7  "." 
    SBC HL,DE                  ;0xfb25:   ed 52  ".R" 
    JR z, C_FB35               ;0xfb27:   28 0c  "(." 
;--------------------------------------
C_FB29:                        ;          XREF: 0xF2C7 
    LD HL,0                    ;0xfb29:   21 00 00  "!.."  
    XOR A                      ;0xfb2c:   af  "." 
    LD D,H                     ;0xfb2d:   54  "T" 
    LD E,L                     ;0xfb2e:   5d  "]" 
    RET                        ;0xfb2f:   c9  "." 
;--------------------------------------
C_FB30:                        ;          XREF: 0xE141 
    AND A                      ;0xfb30:   a7  "." 
    SBC HL,DE                  ;0xfb31:   ed 52  ".R" 
    JR z, C_FB29               ;0xfb33:   28 f4  "(." 
;--------------------------------------
C_FB35:                        ;          XREF: 0xF2C4 
    LD HL,1                    ;0xfb35:   21 01 00  "!.."  
    LD A,L                     ;0xfb38:   7d  "}" 
    OR H                       ;0xfb39:   b4  "." 
    LD D,H                     ;0xfb3a:   54  "T" 
    LD E,L                     ;0xfb3b:   5d  "]" 
    RET                        ;0xfb3c:   c9  "." 
;--------------------------------------
C_FB3D:                        ;          XREF: 0xE14D 
    EX DE,HL                   ;0xfb3d:   eb  "." 
;--------------------------------------
C_FB3E:                        ;          XREF: 0xE150 
    LD A,H                     ;0xfb3e:   7c  "|" 
    XOR D                      ;0xfb3f:   aa  "." 
    JP m, C_FB4C               ;0xfb40:   fa 4c fb  ".L." 
    XOR A                      ;0xfb43:   af  "." 
    SBC HL,DE                  ;0xfb44:   ed 52  ".R" 
    LD H,A                     ;0xfb46:   67  "g" 
    CCF                        ;0xfb47:   3f  "?" 
    ADC A,0                    ;0xfb48:   ce 00  ".." 
    LD L,A                     ;0xfb4a:   6f  "o" 
    RET                        ;0xfb4b:   c9  "." 
;--------------------------------------
C_FB4C:                        ;          XREF: 0xFB40 
    LD A,D                     ;0xfb4c:   7a  "z" 
    RLCA                       ;0xfb4d:   07  "." 
    AND 1                      ;0xfb4e:   e6 01  ".." 
    LD L,A                     ;0xfb50:   6f  "o" 
    LD H,0                     ;0xfb51:   26 00  "&."  
    RET                        ;0xfb53:   c9  "." 
;--------------------------------------
C_FB54:                        ;          XREF: 0xE126 
    EX DE,HL                   ;0xfb54:   eb  "." 
;--------------------------------------
C_FB55:                        ;          XREF: 0xE120 
    LD A,H                     ;0xfb55:   7c  "|" 
    XOR D                      ;0xfb56:   aa  "." 
    JP m, C_FB62               ;0xfb57:   fa 62 fb  ".b." 
    XOR A                      ;0xfb5a:   af  "." 
    SBC HL,DE                  ;0xfb5b:   ed 52  ".R" 
    LD H,A                     ;0xfb5d:   67  "g" 
    ADC A,0                    ;0xfb5e:   ce 00  ".." 
    LD L,A                     ;0xfb60:   6f  "o" 
    RET                        ;0xfb61:   c9  "." 
;--------------------------------------
C_FB62:                        ;          XREF: 0xFB57 
    LD A,H                     ;0xfb62:   7c  "|" 
    RLCA                       ;0xfb63:   07  "." 
    AND 1                      ;0xfb64:   e6 01  ".." 
    LD L,A                     ;0xfb66:   6f  "o" 
    LD H,0                     ;0xfb67:   26 00  "&."  
    RET                        ;0xfb69:   c9  "." 
;--------------------------------------
C_FB6A:                        ;          XREF: 0xE156 
    LD A,D                     ;0xfb6a:   7a  "z" 
    LD (0x4fc),A               ;0xfb6b:   32 fc 04  "2.."  
    CALL C_FB7B                ;0xfb6e:   cd 7b fb  ".{." 
    LD A,(0x4fc)               ;0xfb71:   3a fc 04  ":.."  
    OR A                       ;0xfb74:   b7  "." 
    JP m, C_FBD4               ;0xfb75:   fa d4 fb  "..." 
    LD A,H                     ;0xfb78:   7c  "|" 
    OR L                       ;0xfb79:   b5  "." 
    RET                        ;0xfb7a:   c9  "." 
;--------------------------------------
C_FB7B:                        ;          XREF: 0xFB0F 
    LD A,H                     ;0xfb7b:   7c  "|" 
    OR A                       ;0xfb7c:   b7  "." 
    JP p, C_FB86               ;0xfb7d:   f2 86 fb  "..." 
    x9 DEFB 0x2f               ;0xfb80:   "/"
    x9 DEFB 0x67               ;0xfb81:   "g"
    x9 DEFB 0x7d               ;0xfb82:   "}"
    x9 DEFB 0x2f               ;0xfb83:   "/"
    x9 DEFB 0x6f               ;0xfb84:   "o"
    x9 DEFB 0x23               ;0xfb85:   "#"
;--------------------------------------
C_FB86:                        ;          XREF: 0xFB7D 
    LD A,D                     ;0xfb86:   7a  "z" 
    OR A                       ;0xfb87:   b7  "." 
    JP p, C_FB94               ;0xfb88:   f2 94 fb  "..." 
    CPL                        ;0xfb8b:   2f  "/" 
    LD D,A                     ;0xfb8c:   57  "W" 
    LD A,E                     ;0xfb8d:   7b  "{" 
    CPL                        ;0xfb8e:   2f  "/" 
    LD E,A                     ;0xfb8f:   5f  "_" 
    INC DE                     ;0xfb90:   13  "." 
    JP C_FB94                  ;0xfb91:   c3 94 fb  "..." 
;--------------------------------------
C_FB94:                        ;          XREF: 0xFB1D 
    PUSH BC                    ;0xfb94:   c5  "." 
    LD B,H                     ;0xfb95:   44  "D" 
    LD C,L                     ;0xfb96:   4d  "M" 
    LD HL,0                    ;0xfb97:   21 00 00  "!.."  
    LD A,0x10                  ;0xfb9a:   3e 10  ">."  
;--------------------------------------
C_FB9C:                        ;          XREF: 0xFBAC 
    ADD HL,HL                  ;0xfb9c:   29  ")" 
    EX DE,HL                   ;0xfb9d:   eb  "." 
    ADD HL,HL                  ;0xfb9e:   29  ")" 
    EX DE,HL                   ;0xfb9f:   eb  "." 
    JP nc, C_FBA4              ;0xfba0:   d2 a4 fb  "..." 
    INC HL                     ;0xfba3:   23  "#" 
;--------------------------------------
C_FBA4:                        ;          XREF: 0xFBA0 
    AND A                      ;0xfba4:   a7  "." 
    SBC HL,BC                  ;0xfba5:   ed 42  ".B" 
    JP nc, C_FBB3              ;0xfba7:   d2 b3 fb  "..." 
    ADD HL,BC                  ;0xfbaa:   09  "." 
    DEC A                      ;0xfbab:   3d  "=" 
    JP nz, C_FB9C              ;0xfbac:   c2 9c fb  "..." 
    POP BC                     ;0xfbaf:   c1  "." 
    LD A,L                     ;0xfbb0:   7d  "}" 
    OR H                       ;0xfbb1:   b4  "." 
    RET                        ;0xfbb2:   c9  "." 
;--------------------------------------
C_FBB3:                        ;          XREF: 0xFBA7 
    INC DE                     ;0xfbb3:   13  "." 
    DEC A                      ;0xfbb4:   3d  "=" 
    JP nz, C_FB9C              ;0xfbb5:   c2 9c fb  "..." 
    POP BC                     ;0xfbb8:   c1  "." 
    LD A,L                     ;0xfbb9:   7d  "}" 
    OR H                       ;0xfbba:   b4  "." 
    RET                        ;0xfbbb:   c9  "." 
;--------------------------------------
C_FBBC:                        ;          XREF: 0xE129 
    PUSH BC                    ;0xfbbc:   c5  "." 
    LD B,H                     ;0xfbbd:   44  "D" 
    LD C,L                     ;0xfbbe:   4d  "M" 
    LD HL,0                    ;0xfbbf:   21 00 00  "!.."  
    LD A,0x10                  ;0xfbc2:   3e 10  ">."  
;--------------------------------------
C_FBC4:                        ;          XREF: 0xFBCD 
    ADD HL,HL                  ;0xfbc4:   29  ")" 
    EX DE,HL                   ;0xfbc5:   eb  "." 
    ADD HL,HL                  ;0xfbc6:   29  ")" 
    EX DE,HL                   ;0xfbc7:   eb  "." 
    JP nc, C_FBCC              ;0xfbc8:   d2 cc fb  "..." 
    ADD HL,BC                  ;0xfbcb:   09  "." 
;--------------------------------------
C_FBCC:                        ;          XREF: 0xFBC8 
    DEC A                      ;0xfbcc:   3d  "=" 
    JP nz, C_FBC4              ;0xfbcd:   c2 c4 fb  "..." 
    POP BC                     ;0xfbd0:   c1  "." 
    LD A,L                     ;0xfbd1:   7d  "}" 
    OR H                       ;0xfbd2:   b4  "." 
    RET                        ;0xfbd3:   c9  "." 
;--------------------------------------
C_FBD4:                        ;          XREF: 0xE168 
    LD A,L                     ;0xfbd4:   7d  "}" 
    CPL                        ;0xfbd5:   2f  "/" 
    LD L,A                     ;0xfbd6:   6f  "o" 
    LD A,H                     ;0xfbd7:   7c  "|" 
    CPL                        ;0xfbd8:   2f  "/" 
    LD H,A                     ;0xfbd9:   67  "g" 
    INC HL                     ;0xfbda:   23  "#" 
    LD A,L                     ;0xfbdb:   7d  "}" 
    OR H                       ;0xfbdc:   b4  "." 
    RET                        ;0xfbdd:   c9  "." 
;--------------------------------------
C_FBDE:                        ;          XREF: 0xE132 
    LD A,H                     ;0xfbde:   7c  "|" 
;--------------------------------------
D_FBDF:                        ;          XREF: 0xC3AE 
    OR L                       ;0xfbdf:   b5  "." 
    x9 DEFB 0xca               ;0xfbe0:   ('J') + 0x80
    x9 DEFB 0x35               ;0xfbe1:   "5"
    x9 DEFB 0xfb               ;0xfbe2:   ('{') + 0x80
    x9 DEFB 0xc3               ;0xfbe3:   ('C') + 0x80
    x9 DEFB 0x29               ;0xfbe4:   ")"
    x9 DEFB 0xfb               ;0xfbe5:   ('{') + 0x80
;--------------------------------------
C_FBE6:                        ;          XREF: 0xE171 
    LD A,H                     ;0xfbe6:   7c  "|" 
    OR D                       ;0xfbe7:   b2  "." 
    LD H,A                     ;0xfbe8:   67  "g" 
    LD A,L                     ;0xfbe9:   7d  "}" 
    OR E                       ;0xfbea:   b3  "." 
    LD L,A                     ;0xfbeb:   6f  "o" 
    OR H                       ;0xfbec:   b4  "." 
    RET                        ;0xfbed:   c9  "." 
;--------------------------------------
C_FBEE:                        ;          XREF: 0xE17D 
    EX DE,HL                   ;0xfbee:   eb  "." 
    LD A,E                     ;0xfbef:   7b  "{" 
    AND 0x1f                   ;0xfbf0:   e6 1f  ".." 
    LD E,A                     ;0xfbf2:   5f  "_" 
    JP z, C_FC15               ;0xfbf3:   ca 15 fc  "..." 
    LD A,H                     ;0xfbf6:   7c  "|" 
    OR H                       ;0xfbf7:   b4  "." 
    JP p, C_FC5F               ;0xfbf8:   f2 5f fc  "._." 
;--------------------------------------
C_FBFB:                        ;          XREF: 0xFC03 
    LD A,H                     ;0xfbfb:   7c  "|" 
    SCF                        ;0xfbfc:   37  "7" 
    RRA                        ;0xfbfd:   1f  "." 
    LD H,A                     ;0xfbfe:   67  "g" 
    LD A,L                     ;0xfbff:   7d  "}" 
    RRA                        ;0xfc00:   1f  "." 
    LD L,A                     ;0xfc01:   6f  "o" 
    DEC E                      ;0xfc02:   1d  "." 
    JP nz, C_FBFB              ;0xfc03:   c2 fb fb  "..." 
    OR H                       ;0xfc06:   b4  "." 
    RET                        ;0xfc07:   c9  "." 
;--------------------------------------
C_FC08:                        ;          XREF: 0xE153 
    EX DE,HL                   ;0xfc08:   eb  "." 
    LD A,E                     ;0xfc09:   7b  "{" 
    AND 0x1f                   ;0xfc0a:   e6 1f  ".." 
    LD E,A                     ;0xfc0c:   5f  "_" 
    JP z, C_FC15               ;0xfc0d:   ca 15 fc  "..." 
;--------------------------------------
C_FC10:                        ;          XREF: 0xFC12 
    ADD HL,HL                  ;0xfc10:   29  ")" 
    DEC E                      ;0xfc11:   1d  "." 
    JP nz, C_FC10              ;0xfc12:   c2 10 fc  "..." 
;--------------------------------------
C_FC15:                        ;          XREF: 0xFBF3 
    LD A,L                     ;0xfc15:   7d  "}" 
    OR H                       ;0xfc16:   b4  "." 
    RET                        ;0xfc17:   c9  "." 
;--------------------------------------
C_FC18:                        ;          XREF: 0xE144 
    EX DE,HL                   ;0xfc18:   eb  "." 
    AND A                      ;0xfc19:   a7  "." 
    SBC HL,DE                  ;0xfc1a:   ed 52  ".R" 
    RET                        ;0xfc1c:   c9  "." 
;--------------------------------------
C_FC1D:                        ;          XREF: 0xE16B 
    EX DE,HL                   ;0xfc1d:   eb  "." 
    POP HL                     ;0xfc1e:   e1  "." 
    PUSH BC                    ;0xfc1f:   c5  "." 
    LD B,D                     ;0xfc20:   42  "B" 
    LD C,E                     ;0xfc21:   4b  "K" 
    LD E,(HL)                  ;0xfc22:   5e  "^" 
    INC HL                     ;0xfc23:   23  "#" 
    LD D,(HL)                  ;0xfc24:   56  "V" 
;--------------------------------------
C_FC25:                        ;          XREF: 0xFC34 
    DEC DE                     ;0xfc25:   1b  "." 
    LD A,D                     ;0xfc26:   7a  "z" 
    OR A                       ;0xfc27:   b7  "." 
    JP m, C_FC3D               ;0xfc28:   fa 3d fc  ".=." 
    INC HL                     ;0xfc2b:   23  "#" 
    LD A,C                     ;0xfc2c:   79  "y" 
    CP (HL)                    ;0xfc2d:   be  "." 
    JP z, C_FC37               ;0xfc2e:   ca 37 fc  ".7." 
    INC HL                     ;0xfc31:   23  "#" 
;--------------------------------------
C_FC32:                        ;          XREF: 0xFC3A 
    INC HL                     ;0xfc32:   23  "#" 
    INC HL                     ;0xfc33:   23  "#" 
    JP C_FC25                  ;0xfc34:   c3 25 fc  ".%." 
;--------------------------------------
C_FC37:                        ;          XREF: 0xFC2E 
    INC HL                     ;0xfc37:   23  "#" 
    LD A,B                     ;0xfc38:   78  "x" 
    CP (HL)                    ;0xfc39:   be  "." 
    JP nz, C_FC32              ;0xfc3a:   c2 32 fc  ".2." 
;--------------------------------------
C_FC3D:                        ;          XREF: 0xFC28 
    INC HL                     ;0xfc3d:   23  "#" 
    LD A,(HL)                  ;0xfc3e:   7e  "~" 
    INC HL                     ;0xfc3f:   23  "#" 
    LD H,(HL)                  ;0xfc40:   66  "f" 
    LD L,A                     ;0xfc41:   6f  "o" 
    POP BC                     ;0xfc42:   c1  "." 
    JP (HL)                    ;0xfc43:   e9  "." 
;--------------------------------------
C_FC44:                        ;          XREF: 0xE159 
    EX DE,HL                   ;0xfc44:   eb  "." 
;--------------------------------------
C_FC45:                        ;          XREF: 0xE174 
    XOR A                      ;0xfc45:   af  "." 
    SBC HL,DE                  ;0xfc46:   ed 52  ".R" 
    LD H,A                     ;0xfc48:   67  "g" 
    CCF                        ;0xfc49:   3f  "?" 
    ADC A,0                    ;0xfc4a:   ce 00  ".." 
    LD L,A                     ;0xfc4c:   6f  "o" 
    RET                        ;0xfc4d:   c9  "." 
;--------------------------------------
C_FC4E:                        ;          XREF: 0xE135 
    EX DE,HL                   ;0xfc4e:   eb  "." 
;--------------------------------------
C_FC4F:                        ;          XREF: 0xE15C 
    XOR A                      ;0xfc4f:   af  "." 
    SBC HL,DE                  ;0xfc50:   ed 52  ".R" 
    LD H,A                     ;0xfc52:   67  "g" 
    ADC A,0                    ;0xfc53:   ce 00  ".." 
    LD L,A                     ;0xfc55:   6f  "o" 
    RET                        ;0xfc56:   c9  "." 
;--------------------------------------
C_FC57:                        ;          XREF: 0xE0EA 
    EX DE,HL                   ;0xfc57:   eb  "." 
    LD A,E                     ;0xfc58:   7b  "{" 
    AND 0x1f                   ;0xfc59:   e6 1f  ".." 
    LD E,A                     ;0xfc5b:   5f  "_" 
    JP z, C_FC15               ;0xfc5c:   ca 15 fc  "..." 
;--------------------------------------
C_FC5F:                        ;          XREF: 0xFBF8 
    LD A,H                     ;0xfc5f:   7c  "|" 
    OR A                       ;0xfc60:   b7  "." 
    RRA                        ;0xfc61:   1f  "." 
    LD H,A                     ;0xfc62:   67  "g" 
    LD A,L                     ;0xfc63:   7d  "}" 
    RRA                        ;0xfc64:   1f  "." 
    LD L,A                     ;0xfc65:   6f  "o" 
    DEC E                      ;0xfc66:   1d  "." 
    JP nz, C_FC5F              ;0xfc67:   c2 5f fc  "._." 
    OR H                       ;0xfc6a:   b4  "." 
    RET                        ;0xfc6b:   c9  "." 
;--------------------------------------
C_FC6C:                        ;          XREF: 0xE180 
    LD A,H                     ;0xfc6c:   7c  "|" 
    XOR D                      ;0xfc6d:   aa  "." 
    LD H,A                     ;0xfc6e:   67  "g" 
    LD A,L                     ;0xfc6f:   7d  "}" 
    XOR E                      ;0xfc70:   ab  "." 
    LD L,A                     ;0xfc71:   6f  "o" 
    OR H                       ;0xfc72:   b4  "." 
    RET                        ;0xfc73:   c9  "." 
;--------------------------------------
C_FC74:                        ;          XREF: 0xE0E7 
    POP DE                     ;0xfc74:   d1  "." 
    LD HL,2                    ;0xfc75:   21 02 00  "!.."  
    ADD HL,SP                  ;0xfc78:   39  "9" 
    PUSH BC                    ;0xfc79:   c5  "." 
    PUSH DE                    ;0xfc7a:   d5  "." 
    LD DE,0x4fd                ;0xfc7b:   11 fd 04  "..."  
    LD BC,6                    ;0xfc7e:   01 06 00  "..."  
    LDIR                       ;0xfc81:   ed b0  ".." 
    LD HL,D_FC88               ;0xfc83:   21 88 fc  "!.."  
    EX (SP),HL                 ;0xfc86:   e3  "." 
    JP (HL)                    ;0xfc87:   e9  "." 
;--------------------------------------
D_FC88:                        ;          XREF: 0xFC83 
    x9 DEFB 0xc1               ;0xfc88:   ('A') + 0x80
    x9 DEFB 0x7c               ;0xfc89:   "|"
    x9 DEFB 0xb5               ;0xfc8a:   ('5') + 0x80
    x9 DEFB 0xc9               ;0xfc8b:   ('I') + 0x80
;--------------------------------------
C_FC8C:                        ;          XREF: 0xE192 
    INC HL                     ;0xfc8c:   23  "#" 
    INC HL                     ;0xfc8d:   23  "#" 
;--------------------------------------
C_FC8E:                        ;          XREF: 0xE18F 
    LD A,(HL)                  ;0xfc8e:   7e  "~" 
    INC HL                     ;0xfc8f:   23  "#" 
    LD H,(HL)                  ;0xfc90:   66  "f" 
    LD L,A                     ;0xfc91:   6f  "o" 
    OR H                       ;0xfc92:   b4  "." 
    RET                        ;0xfc93:   c9  "." 
;--------------------------------------
C_FC94:                        ;          XREF: 0xE1AA 
    PUSH BC                    ;0xfc94:   c5  "." 
    XOR A                      ;0xfc95:   af  "." 
    LD (0x503),A               ;0xfc96:   32 03 05  "2.."  
    LD (0x504),A               ;0xfc99:   32 04 05  "2.."  
    LD (0x505),A               ;0xfc9c:   32 05 05  "2.."  
    LD L,A                     ;0xfc9f:   6f  "o" 
    LD H,A                     ;0xfca0:   67  "g" 
    LD (0x506),HL              ;0xfca1:   22 06 05  "".."  
;--------------------------------------
D_FCA4:                        ;          XREF: 0xC246 
    x9 DEFB 0xcd               ;0xfca4:   ('M') + 0x80
    x9 DEFB 0xbf               ;0xfca5:   ('?') + 0x80
    x9 DEFB 0xf5               ;0xfca6:   ('u') + 0x80
    x9 DEFB 0x21               ;0xfca7:   "!"
    x9 DEFB 0x4                ;0xfca8:   0x4
    x9 DEFB 0x0                ;0xfca9:   0x0
    x9 DEFB 0x39               ;0xfcaa:   "9"
    x9 DEFB 0x4e               ;0xfcab:   "N"
    x9 DEFB 0x23               ;0xfcac:   "#"
    x9 DEFB 0x46               ;0xfcad:   "F"
    x9 DEFB 0xa                ;0xfcae:   0xa
    x9 DEFB 0xfe               ;0xfcaf:   ('~') + 0x80
    x9 DEFB 0x2d               ;0xfcb0:   "-"
    x9 DEFB 0xc2               ;0xfcb1:   ('B') + 0x80
    x9 DEFB 0xba               ;0xfcb2:   (':') + 0x80
    x9 DEFB 0xfc               ;0xfcb3:   ('|') + 0x80
    x9 DEFB 0x32               ;0xfcb4:   "2"
    x9 DEFB 0x3                ;0xfcb5:   0x3
    x9 DEFB 0x5                ;0xfcb6:   0x5
    x9 DEFB 0xc3               ;0xfcb7:   ('C') + 0x80
    x9 DEFB 0xbf               ;0xfcb8:   ('?') + 0x80
    x9 DEFB 0xfc               ;0xfcb9:   ('|') + 0x80
;--------------------------------------
C_FCBA:                        ;          XREF: 0xFCB1 
    CP 0x2b                    ;0xfcba:   fe 2b  ".+" 
    JP nz, C_FCC0              ;0xfcbc:   c2 c0 fc  "..." 
;--------------------------------------
C_FCBF:                        ;          XREF: 0xFCB7 
    INC BC                     ;0xfcbf:   03  "." 
;--------------------------------------
C_FCC0:                        ;          XREF: 0xFCBC 
    LD A,(BC)                  ;0xfcc0:   0a  "." 
    CP 0x30                    ;0xfcc1:   fe 30  ".0" 
    JP c, C_FCEF               ;0xfcc3:   da ef fc  "..." 
    CP 0x3a                    ;0xfcc6:   fe 3a  ".:" 
    JP nc, C_FCEF              ;0xfcc8:   d2 ef fc  "..." 
    PUSH AF                    ;0xfccb:   f5  "." 
    CALL C_FA1E                ;0xfccc:   cd 1e fa  "..." 
    CALL C_F2A6                ;0xfccf:   cd a6 f2  "..." 
    POP AF                     ;0xfcd2:   f1  "." 
    SUB 0x30                   ;0xfcd3:   d6 30  ".0" 
    LD L,A                     ;0xfcd5:   6f  "o" 
    LD H,0                     ;0xfcd6:   26 00  "&."  
    CALL C_F5BF                ;0xfcd8:   cd bf f5  "..." 
    CALL C_F30F                ;0xfcdb:   cd 0f f3  "..." 
    LD A,(0x505)               ;0xfcde:   3a 05 05  ":.."  
    OR A                       ;0xfce1:   b7  "." 
    JP z, C_FCBF               ;0xfce2:   ca bf fc  "..." 
    LD HL,(0x506)              ;0xfce5:   2a 06 05  "*.."  
    DEC HL                     ;0xfce8:   2b  "+" 
    LD (0x506),HL              ;0xfce9:   22 06 05  "".."  
    JP C_FCBF                  ;0xfcec:   c3 bf fc  "..." 
;--------------------------------------
C_FCEF:                        ;          XREF: 0xFCC3 
    CP 0x2e                    ;0xfcef:   fe 2e  ".." 
    JP nz, C_FD01              ;0xfcf1:   c2 01 fd  "..." 
    LD HL,0x505                ;0xfcf4:   21 05 05  "!.."  
    LD A,(HL)                  ;0xfcf7:   7e  "~" 
    OR A                       ;0xfcf8:   b7  "." 
    JP nz, C_FD01              ;0xfcf9:   c2 01 fd  "..." 
    LD (HL),1                  ;0xfcfc:   36 01  "6."  
    JP C_FCBF                  ;0xfcfe:   c3 bf fc  "..." 
;--------------------------------------
C_FD01:                        ;          XREF: 0xFCF1 
    LD HL,0                    ;0xfd01:   21 00 00  "!.."  
    OR 0x20                    ;0xfd04:   f6 20  ". " 
    CP 0x65                    ;0xfd06:   fe 65  ".e" 
    JP nz, C_FD4E              ;0xfd08:   c2 4e fd  ".N." 
    INC BC                     ;0xfd0b:   03  "." 
    LD A,(BC)                  ;0xfd0c:   0a  "." 
    CP 0x2d                    ;0xfd0d:   fe 2d  ".-" 
    JP nz, C_FD18              ;0xfd0f:   c2 18 fd  "..." 
    LD (0x504),A               ;0xfd12:   32 04 05  "2.."  
    JP C_FD1D                  ;0xfd15:   c3 1d fd  "..." 
;--------------------------------------
C_FD18:                        ;          XREF: 0xFD0F 
    CP 0x2b                    ;0xfd18:   fe 2b  ".+" 
    JP nz, C_FD1E              ;0xfd1a:   c2 1e fd  "..." 
;--------------------------------------
C_FD1D:                        ;          XREF: 0xFD15 
    INC BC                     ;0xfd1d:   03  "." 
;--------------------------------------
C_FD1E:                        ;          XREF: 0xFD1A 
    LD A,(BC)                  ;0xfd1e:   0a  "." 
    CP 0x30                    ;0xfd1f:   fe 30  ".0" 
    JP c, C_FD38               ;0xfd21:   da 38 fd  ".8." 
    CP 0x3a                    ;0xfd24:   fe 3a  ".:" 
    JP nc, C_FD38              ;0xfd26:   d2 38 fd  ".8." 
    SUB 0x30                   ;0xfd29:   d6 30  ".0" 
    ADD HL,HL                  ;0xfd2b:   29  ")" 
    LD D,H                     ;0xfd2c:   54  "T" 
    LD E,L                     ;0xfd2d:   5d  "]" 
    ADD HL,HL                  ;0xfd2e:   29  ")" 
    ADD HL,HL                  ;0xfd2f:   29  ")" 
    ADD HL,DE                  ;0xfd30:   19  "." 
    LD E,A                     ;0xfd31:   5f  "_" 
    LD D,0                     ;0xfd32:   16 00  ".."  
    ADD HL,DE                  ;0xfd34:   19  "." 
    JP C_FD1D                  ;0xfd35:   c3 1d fd  "..." 
;--------------------------------------
C_FD38:                        ;          XREF: 0xFD21 
    LD A,(0x504)               ;0xfd38:   3a 04 05  ":.."  
    OR A                       ;0xfd3b:   b7  "." 
    JP z, C_FD46               ;0xfd3c:   ca 46 fd  ".F." 
    LD A,H                     ;0xfd3f:   7c  "|" 
    CPL                        ;0xfd40:   2f  "/" 
    LD H,A                     ;0xfd41:   67  "g" 
    LD A,L                     ;0xfd42:   7d  "}" 
    CPL                        ;0xfd43:   2f  "/" 
    LD L,A                     ;0xfd44:   6f  "o" 
    INC HL                     ;0xfd45:   23  "#" 
;--------------------------------------
C_FD46:                        ;          XREF: 0xFD3C 
    EX DE,HL                   ;0xfd46:   eb  "." 
    LD HL,(0x506)              ;0xfd47:   2a 06 05  "*.."  
    ADD HL,DE                  ;0xfd4a:   19  "." 
    LD (0x506),HL              ;0xfd4b:   22 06 05  "".."  
;--------------------------------------
C_FD4E:                        ;          XREF: 0xFD08 
    LD HL,(0x506)              ;0xfd4e:   2a 06 05  "*.."  
    LD A,H                     ;0xfd51:   7c  "|" 
    OR A                       ;0xfd52:   b7  "." 
    JP p, C_FD94               ;0xfd53:   f2 94 fd  "..." 
    CP 0xff                    ;0xfd56:   fe ff  ".." 
    JP nz, C_FDAE              ;0xfd58:   c2 ae fd  "..." 
    LD A,L                     ;0xfd5b:   7d  "}" 
    CPL                        ;0xfd5c:   2f  "/" 
    INC A                      ;0xfd5d:   3c  "<" 
    LD C,A                     ;0xfd5e:   4f  "O" 
    CP 0xa6                    ;0xfd5f:   fe a6  ".." 
    JP nc, C_FDAE              ;0xfd61:   d2 ae fd  "..." 
    CP 0x96                    ;0xfd64:   fe 96  ".." 
    JP c, C_FD7B               ;0xfd66:   da 7b fd  ".{." 
    CALL C_F1F4                ;0xfd69:   cd f4 f1  "..." 
    LD B,A                     ;0xfd6c:   47  "G" 
    INC HL                     ;0xfd6d:   23  "#" 
    ADD A,(HL)                 ;0xfd6e:   86  "." 
    JP p, C_C16F               ;0xfd6f:   f2 6f c1  ".o." 
    NOP                        ;0xfd72:   00  "." 
    NOP                        ;0xfd73:   00  "." 
    CALL C_F3E4                ;0xfd74:   cd e4 f3  "..." 
    LD A,C                     ;0xfd77:   79  "y" 
    SUB 0x10                   ;0xfd78:   d6 10  ".." 
    LD C,A                     ;0xfd7a:   4f  "O" 
;--------------------------------------
C_FD7B:                        ;          XREF: 0xFD66 
    CALL C_F2A6                ;0xfd7b:   cd a6 f2  "..." 
    LD HL,1                    ;0xfd7e:   21 01 00  "!.."  
    CALL C_F5BF                ;0xfd81:   cd bf f5  "..." 
;--------------------------------------
C_FD84:                        ;          XREF: 0xFD88 
    CALL C_FA1E                ;0xfd84:   cd 1e fa  "..." 
    DEC C                      ;0xfd87:   0d  "." 
    JP nz, C_FD84              ;0xfd88:   c2 84 fd  "..." 
    CALL C_F2A6                ;0xfd8b:   cd a6 f2  "..." 
    CALL C_F3E4                ;0xfd8e:   cd e4 f3  "..." 
    JP C_FDA4                  ;0xfd91:   c3 a4 fd  "..." 
;--------------------------------------
C_FD94:                        ;          XREF: 0xFD53 
    JP nz, C_FDAE              ;0xfd94:   c2 ae fd  "..." 
    LD A,L                     ;0xfd97:   7d  "}" 
    OR A                       ;0xfd98:   b7  "." 
    JP z, C_FDA4               ;0xfd99:   ca a4 fd  "..." 
    LD C,A                     ;0xfd9c:   4f  "O" 
;--------------------------------------
C_FD9D:                        ;          XREF: 0xFDA1 
    CALL C_FA1E                ;0xfd9d:   cd 1e fa  "..." 
    DEC C                      ;0xfda0:   0d  "." 
    JP nz, C_FD9D              ;0xfda1:   c2 9d fd  "..." 
;--------------------------------------
C_FDA4:                        ;          XREF: 0xFD91 
    LD A,(0x503)               ;0xfda4:   3a 03 05  ":.."  
    OR A                       ;0xfda7:   b7  "." 
    JP z, C_FDAE               ;0xfda8:   ca ae fd  "..." 
    CALL C_F2B5                ;0xfdab:   cd b5 f2  "..." 
;--------------------------------------
C_FDAE:                        ;          XREF: 0xFD58 
    POP BC                     ;0xfdae:   c1  "." 
    RET                        ;0xfdaf:   c9  "." 
;--------------------------------------
C_FDB0:                        ;          XREF: 0xE1B0 
    CALL C_FF90                ;0xfdb0:   cd 90 ff  "..." 
    LD HL,8                    ;0xfdb3:   21 08 00  "!.."  
    ADD HL,SP                  ;0xfdb6:   39  "9" 
    PUSH HL                    ;0xfdb7:   e5  "." 
    LD HL,10                   ;0xfdb8:   21 0a 00  "!.."  
    ADD HL,SP                  ;0xfdbb:   39  "9" 
    CALL C_F209                ;0xfdbc:   cd 09 f2  "..." 
    CALL C_F1F4                ;0xfdbf:   cd f4 f1  "..." 
    LD B,C                     ;0xfdc2:   41  "A" 
    LD E,D                     ;0xfdc3:   5a  "Z" 
    NOP                        ;0xfdc4:   00  "." 
    NOP                        ;0xfdc5:   00  "." 
    NOP                        ;0xfdc6:   00  "." 
    NOP                        ;0xfdc7:   00  "." 
    NOP                        ;0xfdc8:   00  "." 
    NOP                        ;0xfdc9:   00  "." 
    CALL C_F30F                ;0xfdca:   cd 0f f3  "..." 
    POP HL                     ;0xfdcd:   e1  "." 
    CALL C_F228                ;0xfdce:   cd 28 f2  ".(." 
    LD HL,8                    ;0xfdd1:   21 08 00  "!.."  
    ADD HL,SP                  ;0xfdd4:   39  "9" 
    CALL C_F209                ;0xfdd5:   cd 09 f2  "..." 
    CALL C_F24A                ;0xfdd8:   cd 4a f2  ".J." 
    CALL C_FDE2                ;0xfddb:   cd e2 fd  "..." 
    CALL C_FF87                ;0xfdde:   cd 87 ff  "..." 
    RET                        ;0xfde1:   c9  "." 
;--------------------------------------
C_FDE2:                        ;          XREF: 0xE1B3 
    CALL C_FAED                ;0xfde2:   cd ed fa  "..." 
    RET m                      ;0xfde5:   f8  "." 
    RST 0x38                   ;0xfde6:   ff  "." 
    LD HL,0x10                 ;0xfde7:   21 10 00  "!.."  
    ADD HL,SP                  ;0xfdea:   39  "9" 
    CALL C_F209                ;0xfdeb:   cd 09 f2  "..." 
    LD HL,0x1cf                ;0xfdee:   21 cf 01  "!.."  
    CALL C_F1FB                ;0xfdf1:   cd fb f1  "..." 
    CALL C_F595                ;0xfdf4:   cd 95 f5  "..." 
    JR z, C_FE17               ;0xfdf7:   28 1e  "(." 
    LD HL,0x10                 ;0xfdf9:   21 10 00  "!.."  
    ADD HL,SP                  ;0xfdfc:   39  "9" 
    PUSH HL                    ;0xfdfd:   e5  "." 
    CALL C_F202                ;0xfdfe:   cd 02 f2  "..." 
    LD B,C                     ;0xfe01:   41  "A" 
    OR H                       ;0xfe02:   b4  "." 
    NOP                        ;0xfe03:   00  "." 
    NOP                        ;0xfe04:   00  "." 
    NOP                        ;0xfe05:   00  "." 
    NOP                        ;0xfe06:   00  "." 
    NOP                        ;0xfe07:   00  "." 
    NOP                        ;0xfe08:   00  "." 
    LD HL,0x12                 ;0xfe09:   21 12 00  "!.."  
    ADD HL,SP                  ;0xfe0c:   39  "9" 
    CALL C_F1FB                ;0xfe0d:   cd fb f1  "..." 
    CALL C_F308                ;0xfe10:   cd 08 f3  "..." 
    POP HL                     ;0xfe13:   e1  "." 
    CALL C_F228                ;0xfe14:   cd 28 f2  ".(." 
;--------------------------------------
C_FE17:                        ;          XREF: 0xFDF7 
    LD HL,0x10                 ;0xfe17:   21 10 00  "!.."  
    ADD HL,SP                  ;0xfe1a:   39  "9" 
    CALL C_F209                ;0xfe1b:   cd 09 f2  "..." 
    CALL C_F1F4                ;0xfe1e:   cd f4 f1  "..." 
    LD B,H                     ;0xfe21:   44  "D" 
    DEC SP                     ;0xfe22:   3b  ";" 
    SBC A,D                    ;0xfe23:   9a  "." 
    JP z, 0x0                  ;0xfe24:   ca 00 00  "..." 
    NOP                        ;0xfe27:   00  "." 
    NOP                        ;0xfe28:   00  "." 
    CALL C_F5B3                ;0xfe29:   cd b3 f5  "..." 
    JR z, C_FE3A               ;0xfe2c:   28 0c  "(." 
    CALL C_F202                ;0xfe2e:   cd 02 f2  "..." 
    NOP                        ;0xfe31:   00  "." 
    NOP                        ;0xfe32:   00  "." 
    NOP                        ;0xfe33:   00  "." 
    NOP                        ;0xfe34:   00  "." 
    NOP                        ;0xfe35:   00  "." 
    NOP                        ;0xfe36:   00  "." 
    NOP                        ;0xfe37:   00  "." 
    NOP                        ;0xfe38:   00  "." 
    RET                        ;0xfe39:   c9  "." 
;--------------------------------------
C_FE3A:                        ;          XREF: 0xFE2C 
    LD HL,0x10                 ;0xfe3a:   21 10 00  "!.."  
    ADD HL,SP                  ;0xfe3d:   39  "9" 
    PUSH HL                    ;0xfe3e:   e5  "." 
    LD HL,0x12                 ;0xfe3f:   21 12 00  "!.."  
    ADD HL,SP                  ;0xfe42:   39  "9" 
    CALL C_F209                ;0xfe43:   cd 09 f2  "..." 
    CALL C_F24A                ;0xfe46:   cd 4a f2  ".J." 
    CALL C_EC45                ;0xfe49:   cd 45 ec  ".E." 
    CALL C_FF87                ;0xfe4c:   cd 87 ff  "..." 
    POP HL                     ;0xfe4f:   e1  "." 
    CALL C_F228                ;0xfe50:   cd 28 f2  ".(." 
    LD HL,0x10                 ;0xfe53:   21 10 00  "!.."  
    ADD HL,SP                  ;0xfe56:   39  "9" 
    CALL C_F209                ;0xfe57:   cd 09 f2  "..." 
    CALL C_F1F4                ;0xfe5a:   cd f4 f1  "..." 
    LD B,D                     ;0xfe5d:   42  "B" 
    LD BC,14                   ;0xfe5e:   01 0e 00  "..."  
    NOP                        ;0xfe61:   00  "." 
    NOP                        ;0xfe62:   00  "." 
    NOP                        ;0xfe63:   00  "." 
    NOP                        ;0xfe64:   00  "." 
    CALL C_F5B3                ;0xfe65:   cd b3 f5  "..." 
    JR z, C_FE88               ;0xfe68:   28 1e  "(." 
    LD HL,0x10                 ;0xfe6a:   21 10 00  "!.."  
    ADD HL,SP                  ;0xfe6d:   39  "9" 
    PUSH HL                    ;0xfe6e:   e5  "." 
    CALL C_F202                ;0xfe6f:   cd 02 f2  "..." 
    LD B,D                     ;0xfe72:   42  "B" 
    LD (BC),A                  ;0xfe73:   02  "." 
    INC E                      ;0xfe74:   1c  "." 
    NOP                        ;0xfe75:   00  "." 
    NOP                        ;0xfe76:   00  "." 
    NOP                        ;0xfe77:   00  "." 
    NOP                        ;0xfe78:   00  "." 
    NOP                        ;0xfe79:   00  "." 
    LD HL,0x12                 ;0xfe7a:   21 12 00  "!.."  
    ADD HL,SP                  ;0xfe7d:   39  "9" 
    CALL C_F1FB                ;0xfe7e:   cd fb f1  "..." 
    CALL C_F308                ;0xfe81:   cd 08 f3  "..." 
    POP HL                     ;0xfe84:   e1  "." 
    CALL C_F228                ;0xfe85:   cd 28 f2  ".(." 
;--------------------------------------
C_FE88:                        ;          XREF: 0xFE68 
    LD HL,0x10                 ;0xfe88:   21 10 00  "!.."  
    ADD HL,SP                  ;0xfe8b:   39  "9" 
    CALL C_F209                ;0xfe8c:   cd 09 f2  "..." 
    CALL C_F1F4                ;0xfe8f:   cd f4 f1  "..." 
    LD B,C                     ;0xfe92:   41  "A" 
    LD E,D                     ;0xfe93:   5a  "Z" 
    NOP                        ;0xfe94:   00  "." 
    NOP                        ;0xfe95:   00  "." 
    NOP                        ;0xfe96:   00  "." 
    NOP                        ;0xfe97:   00  "." 
    NOP                        ;0xfe98:   00  "." 
    NOP                        ;0xfe99:   00  "." 
    CALL C_F5B3                ;0xfe9a:   cd b3 f5  "..." 
    JR z, C_FEBD               ;0xfe9d:   28 1e  "(." 
    LD HL,0x10                 ;0xfe9f:   21 10 00  "!.."  
    ADD HL,SP                  ;0xfea2:   39  "9" 
    PUSH HL                    ;0xfea3:   e5  "." 
    CALL C_F202                ;0xfea4:   cd 02 f2  "..." 
    LD B,C                     ;0xfea7:   41  "A" 
    OR H                       ;0xfea8:   b4  "." 
    NOP                        ;0xfea9:   00  "." 
    NOP                        ;0xfeaa:   00  "." 
    NOP                        ;0xfeab:   00  "." 
    NOP                        ;0xfeac:   00  "." 
    NOP                        ;0xfead:   00  "." 
    NOP                        ;0xfeae:   00  "." 
    LD HL,0x12                 ;0xfeaf:   21 12 00  "!.."  
    ADD HL,SP                  ;0xfeb2:   39  "9" 
    CALL C_F1FB                ;0xfeb3:   cd fb f1  "..." 
    CALL C_F308                ;0xfeb6:   cd 08 f3  "..." 
    POP HL                     ;0xfeb9:   e1  "." 
    CALL C_F228                ;0xfeba:   cd 28 f2  ".(." 
;--------------------------------------
C_FEBD:                        ;          XREF: 0xFE9D 
    LD HL,0x10                 ;0xfebd:   21 10 00  "!.."  
;--------------------------------------
D_FEC0:                        ;          XREF: 0xEF06 
    x9 DEFB 0x39               ;0xfec0:   "9"
    x9 DEFB 0xe5               ;0xfec1:   ('e') + 0x80
    x9 DEFB 0x21               ;0xfec2:   "!"
    x9 DEFB 0xd7               ;0xfec3:   ('W') + 0x80
    x9 DEFB 0x1                ;0xfec4:   0x1
    x9 DEFB 0xcd               ;0xfec5:   ('M') + 0x80
    x9 DEFB 0x9                ;0xfec6:   0x9
    x9 DEFB 0xf2               ;0xfec7:   ('r') + 0x80
    x9 DEFB 0xcd               ;0xfec8:   ('M') + 0x80
    x9 DEFB 0xa6               ;0xfec9:   ('&') + 0x80
    x9 DEFB 0xf2               ;0xfeca:   ('r') + 0x80
    x9 DEFB 0xe1               ;0xfecb:   ('a') + 0x80
    x9 DEFB 0xe5               ;0xfecc:   ('e') + 0x80
    x9 DEFB 0xcd               ;0xfecd:   ('M') + 0x80
    x9 DEFB 0x9                ;0xfece:   0x9
    x9 DEFB 0xf2               ;0xfecf:   ('r') + 0x80
    x9 DEFB 0xcd               ;0xfed0:   ('M') + 0x80
    x9 DEFB 0xe4               ;0xfed1:   ('d') + 0x80
    x9 DEFB 0xf3               ;0xfed2:   ('s') + 0x80
    x9 DEFB 0xe1               ;0xfed3:   ('a') + 0x80
    x9 DEFB 0xcd               ;0xfed4:   ('M') + 0x80
    x9 DEFB 0x28               ;0xfed5:   "("
    x9 DEFB 0xf2               ;0xfed6:   ('r') + 0x80
    x9 DEFB 0x21               ;0xfed7:   "!"
    x9 DEFB 0x4                ;0xfed8:   0x4
    x9 DEFB 0x0                ;0xfed9:   0x0
    x9 DEFB 0x39               ;0xfeda:   "9"
    x9 DEFB 0xe5               ;0xfedb:   ('e') + 0x80
    x9 DEFB 0x21               ;0xfedc:   "!"
    x9 DEFB 0x12               ;0xfedd:   0x12
    x9 DEFB 0x0                ;0xfede:   0x0
    x9 DEFB 0x39               ;0xfedf:   "9"
    x9 DEFB 0xcd               ;0xfee0:   ('M') + 0x80
    x9 DEFB 0x9                ;0xfee1:   0x9
    x9 DEFB 0xf2               ;0xfee2:   ('r') + 0x80
    x9 DEFB 0x21               ;0xfee3:   "!"
    x9 DEFB 0x12               ;0xfee4:   0x12
    x9 DEFB 0x0                ;0xfee5:   0x0
    x9 DEFB 0x39               ;0xfee6:   "9"
    x9 DEFB 0xcd               ;0xfee7:   ('M') + 0x80
    x9 DEFB 0xfb               ;0xfee8:   ('{') + 0x80
    x9 DEFB 0xf1               ;0xfee9:   ('q') + 0x80
    x9 DEFB 0xcd               ;0xfeea:   ('M') + 0x80
    x9 DEFB 0xe4               ;0xfeeb:   ('d') + 0x80
    x9 DEFB 0xf4               ;0xfeec:   ('t') + 0x80
    x9 DEFB 0xe1               ;0xfeed:   ('a') + 0x80
    x9 DEFB 0xcd               ;0xfeee:   ('M') + 0x80
    x9 DEFB 0x28               ;0xfeef:   "("
    x9 DEFB 0xf2               ;0xfef0:   ('r') + 0x80
    x9 DEFB 0x21               ;0xfef1:   "!"
    x9 DEFB 0x4                ;0xfef2:   0x4
    x9 DEFB 0x0                ;0xfef3:   0x0
    x9 DEFB 0x39               ;0xfef4:   "9"
    x9 DEFB 0xcd               ;0xfef5:   ('M') + 0x80
    x9 DEFB 0x9                ;0xfef6:   0x9
    x9 DEFB 0xf2               ;0xfef7:   ('r') + 0x80
    x9 DEFB 0xcd               ;0xfef8:   ('M') + 0x80
    x9 DEFB 0xf4               ;0xfef9:   ('t') + 0x80
    x9 DEFB 0xf1               ;0xfefa:   ('q') + 0x80
    x9 DEFB 0x3e               ;0xfefb:   ">"
    x9 DEFB 0x2e               ;0xfefc:   "."
    x9 DEFB 0x2e               ;0xfefd:   "."
    x9 DEFB 0x53               ;0xfefe:   "S"
    x9 DEFB 0xb4               ;0xfeff:   ('4') + 0x80
;--------------------------------------
D_FF00:                        ;          XREF: 0xE751 
    x9 DEFB 0xe4               ;0xff00:   ('d') + 0x80
    x9 DEFB 0xcc               ;0xff01:   ('L') + 0x80
    x9 DEFB 0xe9               ;0xff02:   ('i') + 0x80
    x9 DEFB 0xcd               ;0xff03:   ('M') + 0x80
    x9 DEFB 0xe4               ;0xff04:   ('d') + 0x80
    x9 DEFB 0xf4               ;0xff05:   ('t') + 0x80
    x9 DEFB 0xcd               ;0xff06:   ('M') + 0x80
    x9 DEFB 0xf4               ;0xff07:   ('t') + 0x80
    x9 DEFB 0xf1               ;0xff08:   ('q') + 0x80
    x9 DEFB 0xbf               ;0xff09:   ('?') + 0x80
    x9 DEFB 0xd                ;0xff0a:   0xd
    x9 DEFB 0x0                ;0xff0b:   0x0
    x9 DEFB 0xc0               ;0xff0c:   ('@') + 0x80
    x9 DEFB 0x2a               ;0xff0d:   "*"
    x9 DEFB 0x8e               ;0xff0e:   0x8e
    x9 DEFB 0x2f               ;0xff0f:   "/"
    x9 DEFB 0x3e               ;0xff10:   ">"
    x9 DEFB 0xcd               ;0xff11:   ('M') + 0x80
    x9 DEFB 0xf                ;0xff12:   0xf
    x9 DEFB 0xf3               ;0xff13:   ('s') + 0x80
    x9 DEFB 0x21               ;0xff14:   "!"
    x9 DEFB 0x4                ;0xff15:   0x4
    x9 DEFB 0x0                ;0xff16:   0x0
    x9 DEFB 0x39               ;0xff17:   "9"
    x9 DEFB 0xcd               ;0xff18:   ('M') + 0x80
    x9 DEFB 0xfb               ;0xff19:   ('{') + 0x80
    x9 DEFB 0xf1               ;0xff1a:   ('q') + 0x80
    x9 DEFB 0xcd               ;0xff1b:   ('M') + 0x80
    x9 DEFB 0xe4               ;0xff1c:   ('d') + 0x80
    x9 DEFB 0xf4               ;0xff1d:   ('t') + 0x80
    x9 DEFB 0xcd               ;0xff1e:   ('M') + 0x80
    x9 DEFB 0xf4               ;0xff1f:   ('t') + 0x80
;--------------------------------------
D_FF20:                        ;          XREF: 0xCC60 
    x9 DEFB 0xf1               ;0xff20:   ('q') + 0x80
    x9 DEFB 0x40               ;0xff21:   "@"
    x9 DEFB 0x2                ;0xff22:   0x2
    x9 DEFB 0x22               ;0xff23:   """
    x9 DEFB 0x22               ;0xff24:   """
    x9 DEFB 0x1a               ;0xff25:   0x1a
    x9 DEFB 0x42               ;0xff26:   "B"
    x9 DEFB 0x5c               ;0xff27:   "\"
    x9 DEFB 0xad               ;0xff28:   ('-') + 0x80
    x9 DEFB 0xcd               ;0xff29:   ('M') + 0x80
    x9 DEFB 0xf                ;0xff2a:   0xf
    x9 DEFB 0xf3               ;0xff2b:   ('s') + 0x80
    x9 DEFB 0x21               ;0xff2c:   "!"
    x9 DEFB 0x4                ;0xff2d:   0x4
    x9 DEFB 0x0                ;0xff2e:   0x0
    x9 DEFB 0x39               ;0xff2f:   "9"
    x9 DEFB 0xcd               ;0xff30:   ('M') + 0x80
    x9 DEFB 0xfb               ;0xff31:   ('{') + 0x80
    x9 DEFB 0xf1               ;0xff32:   ('q') + 0x80
    x9 DEFB 0xcd               ;0xff33:   ('M') + 0x80
    x9 DEFB 0xe4               ;0xff34:   ('d') + 0x80
    x9 DEFB 0xf4               ;0xff35:   ('t') + 0x80
    x9 DEFB 0xcd               ;0xff36:   ('M') + 0x80
    x9 DEFB 0xf4               ;0xff37:   ('t') + 0x80
    x9 DEFB 0xf1               ;0xff38:   ('q') + 0x80
    x9 DEFB 0xc0               ;0xff39:   ('@') + 0x80
    x9 DEFB 0x2a               ;0xff3a:   "*"
    x9 DEFB 0xaa               ;0xff3b:   ('*') + 0x80
    x9 DEFB 0xaa               ;0xff3c:   ('*') + 0x80
    x9 DEFB 0xa9               ;0xff3d:   (')') + 0x80
    x9 DEFB 0x85               ;0xff3e:   0x85
    x9 DEFB 0x76               ;0xff3f:   "v"
    x9 DEFB 0xac               ;0xff40:   (',') + 0x80
    x9 DEFB 0xcd               ;0xff41:   ('M') + 0x80
    x9 DEFB 0xf                ;0xff42:   0xf
    x9 DEFB 0xf3               ;0xff43:   ('s') + 0x80
    x9 DEFB 0x21               ;0xff44:   "!"
    x9 DEFB 0x4                ;0xff45:   0x4
    x9 DEFB 0x0                ;0xff46:   0x0
    x9 DEFB 0x39               ;0xff47:   "9"
    x9 DEFB 0xcd               ;0xff48:   ('M') + 0x80
    x9 DEFB 0xfb               ;0xff49:   ('{') + 0x80
    x9 DEFB 0xf1               ;0xff4a:   ('q') + 0x80
;--------------------------------------
C_FF4B:                        ;          XREF: 0xCB8D 
    CALL C_F4E4                ;0xff4b:   cd e4 f4  "..." 
    LD HL,0x1bf                ;0xff4e:   21 bf 01  "!.."  
    CALL C_F1FB                ;0xff51:   cd fb f1  "..." 
    CALL C_F30F                ;0xff54:   cd 0f f3  "..." 
    LD HL,0x10                 ;0xff57:   21 10 00  "!.."  
    ADD HL,SP                  ;0xff5a:   39  "9" 
    CALL C_F1FB                ;0xff5b:   cd fb f1  "..." 
    JP C_F4E4                  ;0xff5e:   c3 e4 f4  "..." 
;--------------------------------------
C_FF61:                        ;          XREF: 0xE162 
    EX DE,HL                   ;0xff61:   eb  "." 
    LD HL,(0x103)              ;0xff62:   2a 03 01  "*.."  
    LD A,(DE)                  ;0xff65:   1a  "." 
    LD (HL),A                  ;0xff66:   77  "w" 
    INC HL                     ;0xff67:   23  "#" 
    INC DE                     ;0xff68:   13  "." 
    LD A,(DE)                  ;0xff69:   1a  "." 
    LD (HL),A                  ;0xff6a:   77  "w" 
    INC HL                     ;0xff6b:   23  "#" 
    INC DE                     ;0xff6c:   13  "." 
    LD A,(DE)                  ;0xff6d:   1a  "." 
    LD (HL),A                  ;0xff6e:   77  "w" 
    INC HL                     ;0xff6f:   23  "#" 
    INC DE                     ;0xff70:   13  "." 
    LD A,(DE)                  ;0xff71:   1a  "." 
    LD (HL),A                  ;0xff72:   77  "w" 
    RET                        ;0xff73:   c9  "." 
;--------------------------------------
C_FF74:                        ;          XREF: 0xE165 
    EX DE,HL                   ;0xff74:   eb  "." 
    LD HL,(0x103)              ;0xff75:   2a 03 01  "*.."  
    LD A,(HL)                  ;0xff78:   7e  "~" 
    LD (DE),A                  ;0xff79:   12  "." 
    INC DE                     ;0xff7a:   13  "." 
    INC HL                     ;0xff7b:   23  "#" 
    LD A,(HL)                  ;0xff7c:   7e  "~" 
    LD (DE),A                  ;0xff7d:   12  "." 
    INC DE                     ;0xff7e:   13  "." 
    INC HL                     ;0xff7f:   23  "#" 
;--------------------------------------
C_FF80:                        ;          XREF: 0xCBFC 
    LD A,(HL)                  ;0xff80:   7e  "~" 
    LD (DE),A                  ;0xff81:   12  "." 
    INC DE                     ;0xff82:   13  "." 
    INC HL                     ;0xff83:   23  "#" 
    LD A,(HL)                  ;0xff84:   7e  "~" 
    LD (DE),A                  ;0xff85:   12  "." 
    RET                        ;0xff86:   c9  "." 
;--------------------------------------
C_FF87:                        ;          XREF: 0xE18C 
    POP HL                     ;0xff87:   e1  "." 
    EXX                        ;0xff88:   d9  "." 
    LD HL,8                    ;0xff89:   21 08 00  "!.."  
    ADD HL,SP                  ;0xff8c:   39  "9" 
    LD SP,HL                   ;0xff8d:   f9  "." 
    EXX                        ;0xff8e:   d9  "." 
    JP (HL)                    ;0xff8f:   e9  "." 
;--------------------------------------
C_FF90:                        ;          XREF: 0xE0E4 
    EX (SP),HL                 ;0xff90:   e3  "." 
    PUSH BC                    ;0xff91:   c5  "." 
    CALL C_FAEC                ;0xff92:   cd ec fa  "..." 
    POP BC                     ;0xff95:   c1  "." 
    POP DE                     ;0xff96:   d1  "." 
    LD A,H                     ;0xff97:   7c  "|" 
    OR L                       ;0xff98:   b5  "." 
    RET                        ;0xff99:   c9  "." 
;--------------------------------------
C_FF9A:                        ;          XREF: 0xE0C9 
    LD HL,(0x6)                ;0xff9a:   2a 06 00  "*.."  
    x9 DEFB 0xf9               ;0xff9d:   ('y') + 0x80
    x9 DEFB 0xcd               ;0xff9e:   ('M') + 0x80
    x9 DEFB 0xeb               ;0xff9f:   ('k') + 0x80
    x9 DEFB 0xff               ;0xffa0:   0xff
;--------------------------------------
C_FFA1:                        ;          XREF: 0xE0D8 
    LD BC,0                    ;0xffa1:   01 00 00  "..."  
    CALL 0x5                   ;0xffa4:   cd 05 00  "..." 
    JP C_FFA1                  ;0xffa7:   c3 a1 ff  "..." 
;--------------------------------------
C_FFAA:                        ;          XREF: 0xE0CC 
    CALL C_FC74                ;0xffaa:   cd 74 fc  ".t." 
    CALL C_FFB5                ;0xffad:   cd b5 ff  "..." 
    EX DE,HL                   ;0xffb0:   eb  "." 
    RET                        ;0xffb1:   c9  "." 
;--------------------------------------
C_FFB2:                        ;          XREF: 0xE0CF 
    CALL C_FC74                ;0xffb2:   cd 74 fc  ".t." 
;--------------------------------------
C_FFB5:                        ;          XREF: 0xFFAD 
    LD HL,(0x4fd)              ;0xffb5:   2a fd 04  "*.."  
    LD B,H                     ;0xffb8:   44  "D" 
    LD C,L                     ;0xffb9:   4d  "M" 
    LD HL,(0x4ff)              ;0xffba:   2a ff 04  "*.."  
    EX DE,HL                   ;0xffbd:   eb  "." 
    CALL 0x5                   ;0xffbe:   cd 05 00  "..." 
    EX DE,HL                   ;0xffc1:   eb  "." 
    LD L,A                     ;0xffc2:   6f  "o" 
    LD H,0                     ;0xffc3:   26 00  "&."  
    RET                        ;0xffc5:   c9  "." 
;--------------------------------------
C_FFC6:                        ;          XREF: 0xE0D2 
    CALL C_FC74                ;0xffc6:   cd 74 fc  ".t." 
    CALL D_FFD3                ;0xffc9:   cd d3 ff  "..." 
    LD L,A                     ;0xffcc:   6f  "o" 
    LD H,0                     ;0xffcd:   26 00  "&."  
    RET                        ;0xffcf:   c9  "." 
;--------------------------------------
C_FFD0:                        ;          XREF: 0xE0D5 
    CALL C_FC74                ;0xffd0:   cd 74 fc  ".t." 
;--------------------------------------
D_FFD3:                        ;          XREF: 0xD0FF 
    x9 DEFB 0x2a               ;0xffd3:   "*"
    x9 DEFB 0xfd               ;0xffd4:   ('}') + 0x80
    x9 DEFB 0x4                ;0xffd5:   0x4
    x9 DEFB 0xeb               ;0xffd6:   ('k') + 0x80
    x9 DEFB 0x2a               ;0xffd7:   "*"
    x9 DEFB 0x1                ;0xffd8:   0x1
    x9 DEFB 0x0                ;0xffd9:   0x0
    x9 DEFB 0x2b               ;0xffda:   "+"
    x9 DEFB 0x2b               ;0xffdb:   "+"
    x9 DEFB 0x2b               ;0xffdc:   "+"
    x9 DEFB 0x19               ;0xffdd:   0x19
    x9 DEFB 0x19               ;0xffde:   0x19
    x9 DEFB 0x19               ;0xffdf:   0x19
    x9 DEFB 0xeb               ;0xffe0:   ('k') + 0x80
    x9 DEFB 0x2a               ;0xffe1:   "*"
    x9 DEFB 0xff               ;0xffe2:   0xff
    x9 DEFB 0x4                ;0xffe3:   0x4
    x9 DEFB 0x44               ;0xffe4:   "D"
    x9 DEFB 0x4d               ;0xffe5:   "M"
;--------------------------------------
D_FFE6:                        ;          XREF: 0xD10B 
    x9 DEFB 0x2a               ;0xffe6:   "*"
;--------------------------------------
D_FFE7:                        ;          XREF: 0xD15A 
    x9 DEFB 0x1                ;0xffe7:   0x1
;--------------------------------------
D_FFE8:                        ;          XREF: 0xD143 
    x9 DEFB 0x5                ;0xffe8:   0x5
    x9 DEFB 0xeb               ;0xffe9:   ('k') + 0x80
;--------------------------------------
D_FFEA:                        ;          XREF: 0xCFEB 
    x9 DEFB 0xe9               ;0xffea:   ('i') + 0x80
;--------------------------------------
C_FFEB:                        ;          XREF: 0xE0DE 
    JP 0x44e                   ;0xffeb:   c3 4e 04  ".N." 
;--------------------------------------
D_FFEE:                        ;          XREF: 0xF064 0xF08D 
    x9 DEFB 0x1a               ;0xffee:   0x1a
    x9 DEFB 0x1a               ;0xffef:   0x1a
    x9 DEFB 0x1a               ;0xfff0:   0x1a
    x9 DEFB 0x1a               ;0xfff1:   0x1a
    x9 DEFB 0x1a               ;0xfff2:   0x1a
    x9 DEFB 0x1a               ;0xfff3:   0x1a
    x9 DEFB 0x1a               ;0xfff4:   0x1a
    x9 DEFB 0x1a               ;0xfff5:   0x1a
;--------------------------------------
D_FFF6:                        ;          XREF: 0xCB42 0xF03A 
    x9 DEFB 0x1a               ;0xfff6:   0x1a
    x9 DEFB 0x1a               ;0xfff7:   0x1a
    x9 DEFB 0x1a               ;0xfff8:   0x1a
    x9 DEFB 0x1a               ;0xfff9:   0x1a
    x9 DEFB 0x1a               ;0xfffa:   0x1a
    x9 DEFB 0x1a               ;0xfffb:   0x1a
;--------------------------------------
D_FFFC:                        ;          XREF: 0xE7F1 
    x9 DEFB 0x1a               ;0xfffc:   0x1a
    x9 DEFB 0x1a               ;0xfffd:   0x1a
;--------------------------------------
D_FFFE:                        ;          XREF: 0xE7FC 
    x9 DEFB 0x1a               ;0xfffe:   0x1a
;--------------------------------------
D_FFFF:                        ;          XREF: 0xE9C5 0xF125 0xD688 0xF7C8 0xE9B3 0xD7BB 0xE9DC 
    x9 DEFB 0x1a               ;0xffff:   0x1a
