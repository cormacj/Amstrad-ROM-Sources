;-----------------------------------
; Produced using: z80-disassembler.py v0.87 - A Smart Z80 reverse assembler
; Visit https://github.com/cormacj/z80-smart-disassembler for updates and to report issues
;
; Command line used: z80-disassembler.py -o cpm1.asm --labels amstrad-labels.txt -t CPM1-rom-template.txt -l 0xc000 CPM1.rom 
;-----------------------------------

; Define labels for external calls
KL_ROM_SELECT         equ 0xb90f
KL_CURR_SELECTION     equ 0xb912
KL_PROBE_ROM          equ 0xb915
KM_WAIT_CHAR          equ 0xbb06
KM_READ_CHAR          equ 0xbb09
KM_SET_EXPAND         equ 0xbb0f
KM_WAIT_KEY           equ 0xbb18
KM_SET_SHIFT          equ 0xbb2d
TXT_OUTPUT            equ 0xbb5a
TXT_RD_CHAR           equ 0xbb60
TXT_SET_CURSOR        equ 0xbb75
TXT_GET_CURSOR        equ 0xbb78
SCR_GET_MODE          equ 0xbc11
KL_INIT_BACK          equ 0xbcce
KL_FIND_COMMAND       equ 0xbcd4
KL_ADD_FRAME_FLY      equ 0xbcda
KL_DEL_TICKER         equ 0xbcec
KL_INIT_EVENT         equ 0xbcef
MC_START_PROGRAM      equ 0xbd16
MC_BUSY_PRINTER       equ 0xbd2e
MC_SEND_PRINTER       equ 0xbd31
TXT_INITIALIZE        equ 0xbb4e
TXT_WR_CHAR           equ 0xbb5d
TXT_SET_WINDOW        equ 0xbb66
TXT_CLEAR_WINDOW      equ 0xbb6c
TXT_SET_PEN           equ 0xbb90
TXT_SET_PAPER         equ 0xbb96
TXT_GET_PAPER         equ 0xbb99
TXT_INVERSE           equ 0xbb9c
TXT_SET_M_TABLE       equ 0xbbab
SCR_RESET             equ 0xbc02
SCR_SET_OFFSET        equ 0xbc05
SCR_SET_BASE          equ 0xbc08
SCR_SET_MODE          equ 0xbc0e
SCR_CHAR_LIMITS       equ 0xbc17
SCR_CHAR_POSITION     equ 0xbc1a
SCR_NEXT_LINE         equ 0xbc26
SCR_INK_ENCODE        equ 0xbc2c
SCR_SET_INK           equ 0xbc32
SCR_SET_BORDER        equ 0xbc38
SCR_SET_FLASHING      equ 0xbc3e
SCR_FILL_BOX          equ 0xbc44
SCR_HARDWARE_ROLL     equ 0xbc4d
SCR_SOFTWARE_ROLL     equ 0xbc50
KL_ADD_TICKER         equ 0xbce9
MC_WAIT_FLYBACK       equ 0xbd19
HOOK_KM_SCAN_KEYS_664 equ 0xbdf4



    org 0xc000

;--------------------------------------
ROM_TYPE:                             ; XREF: 0xDF02 0xED82 0xDDA6 0xED5F 0xF5A8 0xE03B 0xF9A9 0xCBAD 0xCC8D 0xDDD3 0xDE37 0xD2DB 0xC37C 0xDEBB 0xCAFF 
    DEFB 0x1                          ;0xc000:   0x1
;--------------------------------------
ROM_MAJOR:                            ; XREF: 0xC40D 
    DEFB 0x2                          ;0xc001:   0x2
;--------------------------------------
ROM_MARK:                             ; XREF: 
    DEFB 0x3                          ;0xc002:   0x3
;--------------------------------------
ROM_MOD:                              ; XREF: 
    DEFB 0x4                          ;0xc003:   0x4
;--------------------------------------
CMD_TABLE_PTR:                        ; XREF: 
    DEFB COMMANDS_AREA                ;0xc004:   Pointer to COMMANDS_AREA (0xc02a)
;--------------------------------------
JUMP_TABLE:                           ; XREF: 0xD1D0 
    JP ROM_INIT                       ;0xc006:   c3 64 c0  ".d." 
    JP EMS                            ;0xc009:   c3 f4 c1  "..." 
;--------------------------------------
C_C00C:                               ; XREF: 0xCC90 
    JP EMS                            ;0xc00c:   c3 f4 c1  "..." 
    JP CPMVER                         ;0xc00f:   c3 07 c4  "..." 
    JP CPMVER                         ;0xc012:   c3 07 c4  "..." 
;--------------------------------------
C_C015:                               ; XREF: 0xC23C 
    JP OP                             ;0xc015:   c3 4d c5  ".M." 
    JP MYNAME                         ;0xc018:   c3 07 c5  "..." 
    JP PASSWORD                       ;0xc01b:   c3 c4 c9  "..." 
    JP PW                             ;0xc01e:   c3 78 ca  ".x." 
    JP EMSHELP                        ;0xc021:   c3 da ca  "..." 
    JP EMSHELP                        ;0xc024:   c3 da ca  "..." 
    JP NOCPM                          ;0xc027:   c3 35 cc  ".5." 
;--------------------------------------
COMMANDS_AREA:                        ; XREF: 
    DEFB "CP/M PLU", 'S' + 0x80       ;0xc02a:   0xc02a to 0xc035
;--------------------------------------
RSX_EMS:                              ; XREF: 0xC399 
    DEFB 0x45                         ;0xc033:   
    DEFB 0x4d                         ;0xc034:   
    DEFB 0xd3                         ;0xc035:   
;--------------------------------------
RSX_O:                                ; XREF: 
    DEFB 0xcf                         ;0xc036:   
;--------------------------------------
RSX_CPMVER:                           ; XREF: 
    DEFB "CPMVE", 'R' + 0x80          ;0xc037:   0xc037 to 0xc03f
;--------------------------------------
RSX_VER:                              ; XREF: 
    DEFB 0x56                         ;0xc03d:   
    DEFB 0x45                         ;0xc03e:   
    DEFB 0xd2                         ;0xc03f:   
;--------------------------------------
RSX_OP:                               ; XREF: 
    DEFB 0x4f                         ;0xc040:   
    DEFB 0xd0                         ;0xc041:   
;--------------------------------------
RSX_MYNAME:                           ; XREF: 
    DEFB "MYNAM", 'E' + 0x80          ;0xc042:   0xc042 to 0xc04a
;--------------------------------------
RSX_PASSWORD:                         ; XREF: 
    DEFB "PASSWOR", 'D' + 0x80        ;0xc048:   0xc048 to 0xc052
;--------------------------------------
RSX_PW:                               ; XREF: 
    DEFB 0x50                         ;0xc050:   
    DEFB 0xd7                         ;0xc051:   
;--------------------------------------
RSX_OHELP:                            ; XREF: 
    DEFB "OHEL", 'P' + 0x80           ;0xc052:   0xc052 to 0xc059
;--------------------------------------
RSX_EMSHELP:                          ; XREF: 
    DEFB "EMSHEL", 'P' + 0x80         ;0xc057:   0xc057 to 0xc060
;--------------------------------------
RSX_NOCPM:                            ; XREF: 
    DEFB "NOCP", 'M' + 0x80           ;0xc05e:   0xc05e to 0xc065
    DEFB 0x0                          ;0xc063:   
;--------------------------------------
ROM_INIT:                             ; XREF: 
    PUSH HL                           ;0xc064:   e5  "." 
    PUSH DE                           ;0xc065:   d5  "." 
    PUSH AF                           ;0xc066:   f5  "." 
    CALL TXT_GET_CURSOR               ;0xc067:   cd 78 bb  ".x." 
    PUSH HL                           ;0xc06a:   e5  "." 
    LD HL,0x202                       ;0xc06b:   21 02 02  "!.."  
    CALL TXT_SET_CURSOR               ;0xc06e:   cd 75 bb  ".u." 
    CALL TXT_RD_CHAR                  ;0xc071:   cd 60 bb  ".`." 
    JR nc, C_C09A                     ;0xc074:   30 24  "0$" 
    CP 0x41                           ;0xc076:   fe 41  ".A" 
    JR z, C_C09A                      ;0xc078:   28 20  "( " 
    POP HL                            ;0xc07a:   e1  "." 
    INC L                             ;0xc07b:   2c  "," 
    INC L                             ;0xc07c:   2c  "," 
    INC L                             ;0xc07d:   2c  "," 
    INC L                             ;0xc07e:   2c  "," 
    INC L                             ;0xc07f:   2c  "," 
;--------------------------------------
C_C080:                               ; XREF: 0xC02E 
    INC L                             ;0xc080:   2c  "," 
    PUSH HL                           ;0xc081:   e5  "." 
    LD HL,0x101                       ;0xc082:   21 01 01  "!.."  
    CALL TXT_SET_CURSOR               ;0xc085:   cd 75 bb  ".u." 
    LD HL,S_MOVE_CURSOR_TO_TOP        ;0xc088:   21 1f c1  "!.."  
    CALL PRINT_STRING                 ;0xc08b:   cd ea c1  "..." 
    LD HL,S_MOVE_CURSOR_TO_TOP        ;0xc08e:   21 1f c1  "!.."  
    CALL PRINT_STRING                 ;0xc091:   cd ea c1  "..." 
    LD HL,S_MOVE_CURSOR_TO_TOP        ;0xc094:   21 1f c1  "!.."  
    CALL PRINT_STRING                 ;0xc097:   cd ea c1  "..." 
;--------------------------------------
C_C09A:                               ; XREF: 0xC074 
    LD H,0                            ;0xc09a:   26 00  "&."  
    LD D,0x27                         ;0xc09c:   16 27  ".'"  
    LD L,5                            ;0xc09e:   2e 05  ".."  
    LD E,0x18                         ;0xc0a0:   1e 18  ".."  
    CALL TXT_SET_WINDOW               ;0xc0a2:   cd 66 bb  ".f." 
    LD HL,S_MOVE_CURSOR_TO_TOP        ;0xc0a5:   21 1f c1  "!.."  
    CALL PRINT_STRING                 ;0xc0a8:   cd ea c1  "..." 
    LD H,0                            ;0xc0ab:   26 00  "&."  
    LD D,0x27                         ;0xc0ad:   16 27  ".'"  
    LD L,0                            ;0xc0af:   2e 00  ".."  
    LD E,6                            ;0xc0b1:   1e 06  ".."  
    CALL TXT_SET_WINDOW               ;0xc0b3:   cd 66 bb  ".f." 
    CALL SCR_GET_MODE                 ;0xc0b6:   cd 11 bc  "..." 
    CP 2                              ;0xc0b9:   fe 02  ".." 
    JR z, C_C0C2                      ;0xc0bb:   28 05  "(." 
    LD A,3                            ;0xc0bd:   3e 03  ">."  
    CALL TXT_SET_PAPER                ;0xc0bf:   cd 96 bb  "..." 
;--------------------------------------
C_C0C2:                               ; XREF: 0xC0BB 
    CALL TXT_CLEAR_WINDOW             ;0xc0c2:   cd 6c bb  ".l." 
    LD HL,FAKE_AMSTRAD_BOOT_MESSAGE   ;0xc0c5:   21 24 c1  "!$."  
    CALL PRINT_STRING                 ;0xc0c8:   cd ea c1  "..." 
    LD HL,ENCRYPTED_USER_NAME         ;0xc0cb:   21 00 ff  "!.."  
    CALL C_C1DF                       ;0xc0ce:   cd df c1  "..." 
    LD A,0x2e                         ;0xc0d1:   3e 2e  ">."  
    CALL TXT_OUTPUT                   ;0xc0d3:   cd 5a bb  ".Z." 
    LD A,13                           ;0xc0d6:   3e 0d  ">."  
    CALL TXT_OUTPUT                   ;0xc0d8:   cd 5a bb  ".Z." 
    LD A,10                           ;0xc0db:   3e 0a  ">."  
    CALL TXT_OUTPUT                   ;0xc0dd:   cd 5a bb  ".Z." 
    CALL TXT_GET_CURSOR               ;0xc0e0:   cd 78 bb  ".x." 
    PUSH HL                           ;0xc0e3:   e5  "." 
    LD H,0                            ;0xc0e4:   26 00  "&."  
    LD D,0x27                         ;0xc0e6:   16 27  ".'"  
    LD L,0                            ;0xc0e8:   2e 00  ".."  
    LD E,0x18                         ;0xc0ea:   1e 18  ".."  
    CALL TXT_SET_WINDOW               ;0xc0ec:   cd 66 bb  ".f." 
    POP HL                            ;0xc0ef:   e1  "." 
;--------------------------------------
C_C0F0:                               ; XREF: 0xC14A 
    CALL TXT_SET_CURSOR               ;0xc0f0:   cd 75 bb  ".u." 
    LD A,0                            ;0xc0f3:   3e 00  ">."  
    CALL TXT_SET_PEN                  ;0xc0f5:   cd 90 bb  "..." 
    LD B,0x28                         ;0xc0f8:   06 28  ".("  
;--------------------------------------
C_C0FA:                               ; XREF: 0xC0FF 
    LD A,0x8c                         ;0xc0fa:   3e 8c  ">."  
    CALL TXT_OUTPUT                   ;0xc0fc:   cd 5a bb  ".Z." 
    DJNZ C_C0FA                       ;0xc0ff:   10 f9  ".." 
    LD A,1                            ;0xc101:   3e 01  ">."  
    CALL TXT_SET_PEN                  ;0xc103:   cd 90 bb  "..." 
    LD A,0                            ;0xc106:   3e 00  ">."  
    CALL TXT_SET_PAPER                ;0xc108:   cd 96 bb  "..." 
    LD H,0                            ;0xc10b:   26 00  "&."  
    LD D,0x27                         ;0xc10d:   16 27  ".'"  
    LD L,0                            ;0xc10f:   2e 00  ".."  
    LD E,0x18                         ;0xc111:   1e 18  ".."  
    CALL TXT_SET_WINDOW               ;0xc113:   cd 66 bb  ".f." 
    POP HL                            ;0xc116:   e1  "." 
    INC L                             ;0xc117:   2c  "," 
    INC L                             ;0xc118:   2c  "," 
    CALL TXT_SET_CURSOR               ;0xc119:   cd 75 bb  ".u." 
    JP C_C1D3                         ;0xc11c:   c3 d3 c1  "..." 
;--------------------------------------
S_MOVE_CURSOR_TO_TOP:                 ; XREF: 0xC088 0xC094 0xC0A5 0xC08E 
    DEFB 0x1e                         ;0xc11f:   0x1e
    DEFB 0xb                          ;0xc120:   0xb
    DEFB 0xb                          ;0xc121:   0xb
    DEFB 0xb                          ;0xc122:   0xb
    DEFB 0xc9                         ;0xc123:   ('I') + 0x80
;--------------------------------------
FAKE_AMSTRAD_BOOT_MESSAGE:            ; XREF: 0xC0C5 
    DEFB 0xd                          ;0xc124:   
    DEFB 0xa                          ;0xc125:   0xa
    DEFB " Amstrad 128K Microcomputer  (v3)", 0x0d  ;0xc126:   0xc126 to 0xc14a
    DEFB 0xa                          ;0xc148:   0xa
    DEFB 0xa                          ;0xc149:   0xa
    DEFB 0x20                         ;0xc14a:   
    DEFB 0xa4                         ;0xc14b:   
;--------------------------------------
AMSTRAD_COPYRIGHT:                    ; XREF: 
    DEFB "1985 Amstrad Consumer Electronics plc            and Locomotive Software Ltd.  "  ;0xc14c:   0xc14c to 0xc19b
;--------------------------------------
C_C19B:                               ; XREF: 0xC179 
    AND H                             ;0xc19b:   a4  "." 
;--------------------------------------
GRADUATE_COPYRIGHT:                   ; XREF: 0xC1D1 
    DEFB "1988 Graduate Software - CP/M+ loader", 0x0d  ;0xc19c:   0xc19c to 0xc1c4
    LD A,(BC)                         ;0xc1c2:   0a  "." 
;--------------------------------------
FOR_MESSAGE:                          ; XREF: 
    DEFB "           for ", 'I' + 0x80  ;0xc1c3:   0xc1c3 to 0xc1d5
;--------------------------------------
C_C1D3:                               ; XREF: 0xC11C 
    POP AF                            ;0xc1d3:   f1  "." 
    POP DE                            ;0xc1d4:   d1  "." 
    POP HL                            ;0xc1d5:   e1  "." 
    PUSH DE                           ;0xc1d6:   d5  "." 
    LD DE,0x3c                        ;0xc1d7:   11 3c 00  ".<."  
    SBC HL,DE                         ;0xc1da:   ed 52  ".R" 
    POP DE                            ;0xc1dc:   d1  "." 
    SCF                               ;0xc1dd:   37  "7" 
    RET                               ;0xc1de:   c9  "." 
;--------------------------------------
C_C1DF:                               ; XREF: 0xC0CE 
    LD A,(HL)                         ;0xc1df:   7e  "~" 
;--------------------------------------
C_C1E0:                               ; XREF: 0xC18B 
    XOR 0x4e                          ;0xc1e0:   ee 4e  ".N" 
;--------------------------------------
C_C1E2:                               ; XREF: 0xC194 
    OR A                              ;0xc1e2:   b7  "." 
    RET z                             ;0xc1e3:   c8  "." 
    CALL TXT_OUTPUT                   ;0xc1e4:   cd 5a bb  ".Z." 
;--------------------------------------
C_C1E7:                               ; XREF: 0xC1C5 
    INC HL                            ;0xc1e7:   23  "#" 
    JR C_C1DF                         ;0xc1e8:   18 f5  ".." 
;--------------------------------------
PRINT_STRING:                         ; XREF: 0xC08B 
    LD A,(HL)                         ;0xc1ea:   7e  "~" 
;--------------------------------------
C_C1EB:                               ; XREF: 0xC1C9 
    CP 0xc9                           ;0xc1eb:   fe c9  ".." 
;--------------------------------------
C_C1ED:                               ; XREF: 0xC1CB 
    RET z                             ;0xc1ed:   c8  "." 
    CALL TXT_OUTPUT                   ;0xc1ee:   cd 5a bb  ".Z." 
    INC HL                            ;0xc1f1:   23  "#" 
    JR PRINT_STRING                   ;0xc1f2:   18 f6  ".." 
;--------------------------------------
EMS:                                  ; XREF: 0xC009 
    CP 1                              ;0xc1f4:   fe 01  ".." 
    JP z, C_CC9D                      ;0xc1f6:   ca 9d cc  "..." 
;--------------------------------------
C_C1F9:                               ; XREF: 0xC1B4 
    CALL C_C1FF                       ;0xc1f9:   cd ff c1  "..." 
    JP C_C369                         ;0xc1fc:   c3 69 c3  ".i." 
;--------------------------------------
C_C1FF:                               ; XREF: 0xC1F9 
    DI                                ;0xc1ff:   f3  "." 
    LD HL,D_FEFF                      ;0xc200:   21 ff fe  "!.."  
    LD DE,0x2bd4                      ;0xc203:   11 d4 2b  "..+"  
;--------------------------------------
C_C206:                               ; XREF: 0xC217 
    LD A,(HL)                         ;0xc206:   7e  "~" 
    OR A                              ;0xc207:   b7  "." 
    JR z, C_C219                      ;0xc208:   28 0f  "(." 
    LD (DE),A                         ;0xc20a:   12  "." 
    LD A,H                            ;0xc20b:   7c  "|" 
    CP 0xe0                           ;0xc20c:   fe e0  ".." 
    JR nz, C_C215                     ;0xc20e:   20 05  " ." 
    LD A,L                            ;0xc210:   7d  "}" 
    CP 0x3a                           ;0xc211:   fe 3a  ".:" 
    JR z, CHECK_FOR_2ND_ROM           ;0xc213:   28 0f  "(." 
;--------------------------------------
C_C215:                               ; XREF: 0xC20E 
    DEC HL                            ;0xc215:   2b  "+" 
    DEC DE                            ;0xc216:   1b  "." 
    JR C_C206                         ;0xc217:   18 ed  ".." 
;--------------------------------------
C_C219:                               ; XREF: 0xC208 
    DEC HL                            ;0xc219:   2b  "+" 
    LD A,(HL)                         ;0xc21a:   7e  "~" 
    LD B,A                            ;0xc21b:   47  "G" 
    XOR A                             ;0xc21c:   af  "." 
;--------------------------------------
C_C21D:                               ; XREF: 0xC21F 
    LD (DE),A                         ;0xc21d:   12  "." 
    DEC DE                            ;0xc21e:   1b  "." 
    DJNZ C_C21D                       ;0xc21f:   10 fc  ".." 
    INC DE                            ;0xc221:   13  "." 
    JR C_C215                         ;0xc222:   18 f1  ".." 
;--------------------------------------
CHECK_FOR_2ND_ROM:                    ; XREF: 0xC213 
    LD HL,CPM_PLUS_STRING             ;0xc224:   21 ca c3  "!.."   - References: "CP/M PLUS"
    LD DE,0x9000                      ;0xc227:   11 00 90  "..."  
    LD BC,0x20                        ;0xc22a:   01 20 00  ". ."  
    LDIR                              ;0xc22d:   ed b0  ".." 
    LD HL,0x9000                      ;0xc22f:   21 00 90  "!.."  
    CALL KL_FIND_COMMAND              ;0xc232:   cd d4 bc  "..." 
;--------------------------------------
C_C235:                               ; XREF: 0xC1CD 
    JP nc, PRINT_2ND_ROM_NOT_FOUND           ;0xc235:   d2 d4 c3  "..." 
    LD A,C                            ;0xc238:   79  "y" 
    LD (0xa102),A                     ;0xc239:   32 02 a1  "2.."  
    LD HL,C_C015                      ;0xc23c:   21 15 c0  "!.."  
    LD (0xa100),HL                    ;0xc23f:   22 00 a1  "".."  
    RST 0x18                          ;0xc242:   df  "." 
    NOP                               ;0xc243:   00  "." 
    AND C                             ;0xc244:   a1  "." 
    LD HL,0x710e                      ;0xc245:   21 0e 71  "!.q"  
    LD DE,0x100                       ;0xc248:   11 00 01  "..."  
    LD BC,0x1e6                       ;0xc24b:   01 e6 01  "..."  
    LDIR                              ;0xc24e:   ed b0  ".." 
    LD HL,D_CCEE                      ;0xc250:   21 ee cc  "!.."  
    LD DE,0x6e00                      ;0xc253:   11 00 6e  "..n"  
    LD BC,0xd9                        ;0xc256:   01 d9 00  "..."  
    LDIR                              ;0xc259:   ed b0  ".." 
    LD HL,0x1059                      ;0xc25b:   21 59 10  "!Y."  
    LD (0x643a),HL                    ;0xc25e:   22 3a 64  "":d"  
    LD HL,0x1136                      ;0xc261:   21 36 11  "!6."  
    LD (0x6456),HL                    ;0xc264:   22 56 64  ""Vd"  
    LD A,(D_FFFF)                     ;0xc267:   3a ff ff  ":.."  
    CP 0xff                           ;0xc26a:   fe ff  ".." 
    JR z, C_C282                      ;0xc26c:   28 14  "(." 
    LD HL,0x165                       ;0xc26e:   21 65 01  "!e."  
    LD (0xc07),HL                     ;0xc271:   22 07 0c  "".."  
    LD HL,D_FEC0                      ;0xc274:   21 c0 fe  "!.."  
    LD (0x2c3),HL                     ;0xc277:   22 c3 02  "".."  
    LD HL,D_FE80                      ;0xc27a:   21 80 fe  "!.."  
    LD (0xe58),HL                     ;0xc27d:   22 58 0e  ""X."  
    JR C_C28E                         ;0xc280:   18 0c  ".." 
;--------------------------------------
C_C282:                               ; XREF: 0xC26C 
    LD HL,MC_WAIT_FLYBACK             ;0xc282:   21 19 bd  "!.."  
    LD (0xc07),HL                     ;0xc285:   22 07 0c  "".."  
    LD HL,D_FEC0                      ;0xc288:   21 c0 fe  "!.."  
    LD (0xe58),HL                     ;0xc28b:   22 58 0e  ""X."  
;--------------------------------------
C_C28E:                               ; XREF: 0xC280 
    LD HL,0x131d                      ;0xc28e:   21 1d 13  "!.."  
    LD (0x68d0),HL                    ;0xc291:   22 d0 68  "".h"  
    LD A,0xc3                         ;0xc294:   3e c3  ">."  
    LD (0x68cf),A                     ;0xc296:   32 cf 68  "2.h"  
    LD HL,0x1761                      ;0xc299:   21 61 17  "!a."  
    LD (0x6376),A                     ;0xc29c:   32 76 63  "2vc"  
    LD (0x6377),HL                    ;0xc29f:   22 77 63  ""wc"  
    LD A,0xcd                         ;0xc2a2:   3e cd  ">."  
    LD (0xc06),A                      ;0xc2a4:   32 06 0c  "2.."  
    LD BC,0x7fc7                      ;0xc2a7:   01 c7 7f  "..."  
    OUT (C),C                         ;0xc2aa:   ed 49  ".I" 
;--------------------------------------
RELOCATE_THINGS:                      ; XREF: 0xC3B2 
    LD HL,C_C352                      ;0xc2ac:   21 52 c3  "!R."  
    LD DE,0x7ec0                      ;0xc2af:   11 c0 7e  "..~"  
    LD BC,0x26                        ;0xc2b2:   01 26 00  ".&."  
    LDIR                              ;0xc2b5:   ed b0  ".." 
    LD HL,ENCRYPTED_USER_NAME         ;0xc2b7:   21 00 ff  "!.."  
    LD DE,0x52a0                      ;0xc2ba:   11 a0 52  "..R"  
    LD BC,0x100                       ;0xc2bd:   01 00 01  "..."  
    LDIR                              ;0xc2c0:   ed b0  ".." 
    LD BC,0x7fc0                      ;0xc2c2:   01 c0 7f  "..."  
    OUT (C),C                         ;0xc2c5:   ed 49  ".I" 
    LD A,0xc3                         ;0xc2c7:   3e c3  ">."  
    LD HL,0x740                       ;0xc2c9:   21 40 07  "!@."  
    LD (0x629a),A                     ;0xc2cc:   32 9a 62  "2.b"  
    LD (0x629b),HL                    ;0xc2cf:   22 9b 62  "".b"  
    LD HL,RELOCATE_BUILTIN_MSG        ;0xc2d2:   21 00 c3  "!.."  
    LD DE,0x6595                      ;0xc2d5:   11 95 65  "..e"  
    LD BC,0x2e                        ;0xc2d8:   01 2e 00  "..."  
    LDIR                              ;0xc2db:   ed b0  ".." 
    LD HL,D_C32B                      ;0xc2dd:   21 2b c3  "!+."  
    LD DE,0x65c3                      ;0xc2e0:   11 c3 65  "..e"  
    LD BC,0x27                        ;0xc2e3:   01 27 00  ".'."  
    LDIR                              ;0xc2e6:   ed b0  ".." 
    CALL KL_CURR_SELECTION            ;0xc2e8:   cd 12 b9  "..." 
    LD (0x65a1),A                     ;0xc2eb:   32 a1 65  "2.e"  
    LD HL,0x1783                      ;0xc2ee:   21 83 17  "!.."  
    LD (0x64de),HL                    ;0xc2f1:   22 de 64  "".d"  
    LD HL,0x17b2                      ;0xc2f4:   21 b2 17  "!.."  
    LD (0x64e0),HL                    ;0xc2f7:   22 e0 64  "".d"  
    LD A,5                            ;0xc2fa:   3e 05  ">."  
    LD (0x645c),A                     ;0xc2fc:   32 5c 64  "2\d"  
    RET                               ;0xc2ff:   c9  "." 
;--------------------------------------
RELOCATE_BUILTIN_MSG:                 ; XREF: 0xC2D2 
    LD HL,BUILTIN_COMMANDS            ;0xc300:   21 c7 cd  "!.."   - References: "DIR TYPE ERASE RENAME SHOW DIRSYS USER 24LINE 25LINE AMSDOS BUILTIN BORDER CAT CKEY CLS DATE DETAILS EXPAND HOME INK INVERSE KDS LANGUAGE LPRINT MODE NKEY NORMAL PALETTE PAPER PEN ROMCAT SETLST SET24X80 SIGNON SKEY WAIT "
    LD DE,0x1059                      ;0xc303:   11 59 10  ".Y."  
    LD BC,0x1208                      ;0xc306:   01 08 12  "..."  
;--------------------------------------
C_C309:                               ; XREF: 0xC326 
    DI                                ;0xc309:   f3  "." 
    PUSH BC                           ;0xc30a:   c5  "." 
    LD C,0                            ;0xc30b:   0e 00  ".."  
    EXX                               ;0xc30d:   d9  "." 
    RES 3,C                           ;0xc30e:   cb 99  ".." 
    OUT (C),C                         ;0xc310:   ed 49  ".I" 
    EXX                               ;0xc312:   d9  "." 
    LD B,0xdf                         ;0xc313:   06 df  ".."  
    OUT (C),C                         ;0xc315:   ed 49  ".I" 
    LD A,(HL)                         ;0xc317:   7e  "~" 
    EXX                               ;0xc318:   d9  "." 
    SET 3,C                           ;0xc319:   cb d9  ".." 
    OUT (C),C                         ;0xc31b:   ed 49  ".I" 
    EXX                               ;0xc31d:   d9  "." 
    EI                                ;0xc31e:   fb  "." 
    LD (DE),A                         ;0xc31f:   12  "." 
    INC DE                            ;0xc320:   13  "." 
    INC HL                            ;0xc321:   23  "#" 
    POP BC                            ;0xc322:   c1  "." 
    DEC BC                            ;0xc323:   0b  "." 
    LD A,C                            ;0xc324:   79  "y" 
    OR B                              ;0xc325:   b0  "." 
    JR nz, C_C309                     ;0xc326:   20 e1  " ." 
    JP 0x17d0                         ;0xc328:   c3 d0 17  "..." 
;--------------------------------------
D_C32B:                               ; XREF: 0xC2DD 
    DI                                ;0xc32b:   f3  "." 
    EXX                               ;0xc32c:   d9  "." 
    LD HL,0xb8bf                      ;0xc32d:   21 bf b8  "!.."  
    LD DE,0x1170                      ;0xc330:   11 70 11  ".p."  
    LD BC,0x7f8e                      ;0xc333:   01 8e 7f  "..."  
    EXX                               ;0xc336:   d9  "." 
    EI                                ;0xc337:   fb  "." 
    LD HL,(0x1)                       ;0xc338:   2a 01 00  "*.."  
    LD DE,0x57                        ;0xc33b:   11 57 00  ".W."  
    ADD HL,DE                         ;0xc33e:   19  "." 
    LD (0x75b),HL                     ;0xc33f:   22 5b 07  ""[."  
    CALL 0x0                          ;0xc342:   cd 00 00  "..." 
    LD DE,D_D9BC                      ;0xc345:   11 bc d9  "..."  
    LD C,0x8c                         ;0xc348:   0e 8c  ".."  
    OR C                              ;0xc34a:   b1  "." 
    LD C,A                            ;0xc34b:   4f  "O" 
    OUT (C),C                         ;0xc34c:   ed 49  ".I" 
    EXX                               ;0xc34e:   d9  "." 
    JP 0x715                          ;0xc34f:   c3 15 07  "..." 
;--------------------------------------
C_C352:                               ; XREF: 0xC2AC 
    CALL 0x572                        ;0xc352:   cd 72 05  ".r." 
    LD HL,C_D2A0                      ;0xc355:   21 a0 d2  "!.."  
;--------------------------------------
C_C358:                               ; XREF: 0xC366 
    LD A,(HL)                         ;0xc358:   7e  "~" 
    CP 0xff                           ;0xc359:   fe ff  ".." 
    JR z, C_C368                      ;0xc35b:   28 0b  "(." 
    XOR 0x4e                          ;0xc35d:   ee 4e  ".N" 
    LD C,A                            ;0xc35f:   4f  "O" 
    PUSH HL                           ;0xc360:   e5  "." 
    CALL 0x3d03                       ;0xc361:   cd 03 3d  "..=" 
    POP HL                            ;0xc364:   e1  "." 
    INC HL                            ;0xc365:   23  "#" 
    JR C_C358                         ;0xc366:   18 f0  ".." 
;--------------------------------------
C_C368:                               ; XREF: 0xC35B 
    RET                               ;0xc368:   c9  "." 
;--------------------------------------
C_C369:                               ; XREF: 0xC1FC 
    LD HL,D_C377                      ;0xc369:   21 77 c3  "!w."  
    LD DE,0x9000                      ;0xc36c:   11 00 90  "..."  
    LD BC,0x52                        ;0xc36f:   01 52 00  ".R."  
    LDIR                              ;0xc372:   ed b0  ".." 
    JP 0x9000                         ;0xc374:   c3 00 90  "..." 
;--------------------------------------
D_C377:                               ; XREF: 0xC369 
    LD C,7                            ;0xc377:   0e 07  ".."  
    CALL KL_ROM_SELECT                ;0xc379:   cd 0f b9  "..." 
    LD SP,ROM_TYPE                    ;0xc37c:   31 00 c0  "1.."  
    LD IY,0xac48                      ;0xc37f:   fd 21 48 ac  ".!H."  
    LD DE,0xad33                      ;0xc383:   11 33 ad  ".3."  
    LD BC,0xa5                        ;0xc386:   01 a5 00  "..."  
    CALL S_CAAF                       ;0xc389:   cd af ca  "..." 
    LD HL,0xad41                      ;0xc38c:   21 41 ad  "!A."  
    DEC (HL)                          ;0xc38f:   35  "5" 
    LD A,0x81                         ;0xc390:   3e 81  ">."  
    LD (0x3),A                        ;0xc392:   32 03 00  "2.."  
    XOR A                             ;0xc395:   af  "." 
    LD (0x4),A                        ;0xc396:   32 04 00  "2.."  
    LD HL,RSX_EMS                     ;0xc399:   21 33 c0  "!3."  
    LD DE,0xbe80                      ;0xc39c:   11 80 be  "..."  
    LD BC,0x3f                        ;0xc39f:   01 3f 00  ".?."  
    LDIR                              ;0xc3a2:   ed b0  ".." 
    CALL 0xc0c0                       ;0xc3a4:   cd c0 c0  "..." 
    CALL 0xc5dd                       ;0xc3a7:   cd dd c5  "..." 
    LD C,0x41                         ;0xc3aa:   0e 41  ".A"  
    LD HL,0x100                       ;0xc3ac:   21 00 01  "!.."  
    LD DE,0                           ;0xc3af:   11 00 00  "..."  
    CALL RELOCATE_THINGS              ;0xc3b2:   cd ac c2  "..." 
    EX DE,HL                          ;0xc3b5:   eb  "." 
    LD BC,S_C17F                      ;0xc3b6:   01 7f c1  "..."  
    LD SP,0xad33                      ;0xc3b9:   31 33 ad  "13."  
    LD HL,0xc00                       ;0xc3bc:   21 00 0c  "!.."  
    LD C,0xff                         ;0xc3bf:   0e ff  ".."  
    CALL 0xbe9b                       ;0xc3c1:   cd 9b be  "..." 
    LD D,0xbd                         ;0xc3c4:   16 bd  ".."  
    RST 8                             ;0xc3c6:   cf  "." 
    NOP                               ;0xc3c7:   00  "." 
    NOP                               ;0xc3c8:   00  "." 
    RET                               ;0xc3c9:   c9  "." 
;--------------------------------------
CPM_PLUS_STRING:                      ; XREF: 0xC224 
    DEFB "CP/M PLUS", '2' + 0x80      ;0xc3ca:   0xc3ca to 0xc3d6
;--------------------------------------
PRINT_2ND_ROM_NOT_FOUND:              ; XREF: 0xC235 
    LD HL,SECOND_ROM_NOT_FOUND_ERROR_MESSAGE  ;0xc3d4:   21 dc c3  "!.."  
    CALL PRINT_STRING                 ;0xc3d7:   cd ea c1  "..." 
    POP BC                            ;0xc3da:   c1  "." 
    RET                               ;0xc3db:   c9  "." 
;--------------------------------------
SECOND_ROM_NOT_FOUND_ERROR_MESSAGE:   ; XREF: 0xC3D4 
    DEFB 0xd                          ;0xc3dc:   
    DEFB 0xa                          ;0xc3dd:   0xa
    DEFB "# Second CP/M PLUS rom not present. #"  ;0xc3de:   0xc3de to 0xc403
    DEFB 0xa                          ;0xc403:   0xa
    DEFB 0xa                          ;0xc404:   0xa
    DEFB 0xd                          ;0xc405:   
    DEFB 0xc9                         ;0xc406:   
;--------------------------------------
CPMVER:                               ; XREF: 0xC00F 
    LD HL,D_C44A                      ;0xc407:   21 4a c4  "!J."  
    CALL PRINT_STRING                 ;0xc40a:   cd ea c1  "..." 
    LD HL,ROM_MAJOR                   ;0xc40d:   21 01 c0  "!.."  
    CALL C_C443                       ;0xc410:   cd 43 c4  ".C." 
    LD A,0x2e                         ;0xc413:   3e 2e  ">."  
    CALL TXT_OUTPUT                   ;0xc415:   cd 5a bb  ".Z." 
    INC HL                            ;0xc418:   23  "#" 
    CALL C_C443                       ;0xc419:   cd 43 c4  ".C." 
    INC HL                            ;0xc41c:   23  "#" 
    CALL C_C443                       ;0xc41d:   cd 43 c4  ".C." 
;--------------------------------------
C_C420:                               ; XREF: 0xC3CE 
    LD HL,SERIAL_NUMBER_MSG           ;0xc420:   21 d8 c4  "!.."  
    CALL PRINT_STRING                 ;0xc423:   cd ea c1  "..." 
    LD B,0x12                         ;0xc426:   06 12  ".."  
    LD HL,ENCRYPTED_SERIAL            ;0xc428:   21 71 ff  "!q."  
;--------------------------------------
C_C42B:                               ; XREF: 0xC3E6 
    CALL C_C53F                       ;0xc42b:   cd 3f c5  ".?." 
    LD HL,OWNER_MSG                   ;0xc42e:   21 f0 c4  "!.."  
    CALL PRINT_STRING                 ;0xc431:   cd ea c1  "..." 
;--------------------------------------
C_C434:                               ; XREF: 0xC3DF 
    LD HL,ENCRYPTED_USER_NAME         ;0xc434:   21 00 ff  "!.."  
    LD B,0x18                         ;0xc437:   06 18  ".."  
    CALL C_C53F                       ;0xc439:   cd 3f c5  ".?." 
    LD HL,D_C503                      ;0xc43c:   21 03 c5  "!.."  
    CALL PRINT_STRING                 ;0xc43f:   cd ea c1  "..." 
    RET                               ;0xc442:   c9  "." 
;--------------------------------------
C_C443:                               ; XREF: 0xC410 
    LD A,(HL)                         ;0xc443:   7e  "~" 
    ADD A,0x30                        ;0xc444:   c6 30  ".0" 
    CALL TXT_OUTPUT                   ;0xc446:   cd 5a bb  ".Z." 
    RET                               ;0xc449:   c9  "." 
;--------------------------------------
D_C44A:                               ; XREF: 0xC407 
    DEFB 0xd                          ;0xc44a:   0xd
    DEFB 0xa                          ;0xc44b:   0xa
;--------------------------------------
COPYRIGHT_MESSAGE:                    ; XREF: 
    DEFB "CPM PLUS is copyright : -"  ;0xc44c:   0xc44c to 0xc465
    DEC C                             ;0xc465:   0d  "." 
    LD A,(BC)                         ;0xc466:   0a  "." 
    LD A,(BC)                         ;0xc467:   0a  "." 
;--------------------------------------
ACE_MESSAGE:                          ; XREF: 
    DEFB "AMSTRAD CONSUMER ELECTRONICS PLC. & ", 0x0d  ;0xc468:   0xc468 to 0xc48f
    DEFB 0xa                          ;0xc48d:   0xa
    DEFB 0xa                          ;0xc48e:   0xa
;--------------------------------------
DR_MESSAGE:                           ; XREF: 
    DEFB "DIGITAL RESEARCH.", 0x0d    ;0xc48f:   0xc48f to 0xc4a3
;--------------------------------------
C_C4A1:                               ; XREF: 0xC44F 
    LD A,(BC)                         ;0xc4a1:   0a  "." 
    LD A,(BC)                         ;0xc4a2:   0a  "." 
;--------------------------------------
CPM_ROM_BY_GRADUATE_MSG:              ; XREF: 
    DEFB "CPM ROM by Graduate software."  ;0xc4a3:   0xc4a3 to 0xc4c0
    DEC C                             ;0xc4c0:   0d  "." 
    LD A,(BC)                         ;0xc4c1:   0a  "." 
    LD A,(BC)                         ;0xc4c2:   0a  "." 
;--------------------------------------
ROM_VERSION_MSG:                      ; XREF: 
    DEFB "This rom is version "       ;0xc4c3:   0xc4c3 to 0xc4d7
    RET                               ;0xc4d7:   c9  "." 
;--------------------------------------
SERIAL_NUMBER_MSG:                    ; XREF: 0xC420 
    DEFB 0x20                         ;0xc4d8:   
    DEFB ": -", 0x20                  ;0xc4d9:   0xc4d9 to 0xc4da
    DEFB 0xa                          ;0xc4dd:   0xa
    DEFB 0xa                          ;0xc4de:   0xa
    DEFB "SERIAL NUMBER : ", 'I' + 0x80  ;0xc4df:   0xc4df to 0xc4f2
;--------------------------------------
OWNER_MSG:                            ; XREF: 0xC42E 
    DEFB 0xa                          ;0xc4f0:   0xa
    DEFB 0xd                          ;0xc4f1:   
    DEFB "OWNER         : ", 'I' + 0x80  ;0xc4f2:   0xc4f2 to 0xc505
;--------------------------------------
D_C503:                               ; XREF: 0xC43C 
    DEFB 0xd                          ;0xc503:   0xd
    DEFB 0xa                          ;0xc504:   0xa
    DEFB 0xa                          ;0xc505:   0xa
    DEFB 0xc9                         ;0xc506:   ('I') + 0x80
;--------------------------------------
MYNAME:                               ; XREF: 0xC018 
    CP 1                              ;0xc507:   fe 01  ".." 
;--------------------------------------
C_C509:                               ; XREF: 0xC4DA 
    JR nz, C_C514                     ;0xc509:   20 09  " ." 
    LD A,(IX+0)                       ;0xc50b:   dd 7e 00  ".~." 
;--------------------------------------
C_C50E:                               ; XREF: 0xC4AA 
    CP 2                              ;0xc50e:   fe 02  ".." 
    JR z, C_C530                      ;0xc510:   28 1e  "(." 
    LD A,1                            ;0xc512:   3e 01  ">."  
;--------------------------------------
C_C514:                               ; XREF: 0xC4D8 
    PUSH AF                           ;0xc514:   f5  "." 
    LD HL,ENCRYPTED_USER_NAME         ;0xc515:   21 00 ff  "!.."  
    LD B,0x18                         ;0xc518:   06 18  ".."  
    CALL C_C53F                       ;0xc51a:   cd 3f c5  ".?." 
;--------------------------------------
C_C51D:                               ; XREF: 0xC4FB 
    POP AF                            ;0xc51d:   f1  "." 
    CP 1                              ;0xc51e:   fe 01  ".." 
    RET nz                            ;0xc520:   c0  "." 
    LD HL,D_C549                      ;0xc521:   21 49 c5  "!I."  
    CALL PRINT_STRING                 ;0xc524:   cd ea c1  "..." 
    LD HL,ENCRYPTED_SERIAL            ;0xc527:   21 71 ff  "!q."  
    LD B,0x12                         ;0xc52a:   06 12  ".."  
    CALL C_C53F                       ;0xc52c:   cd 3f c5  ".?." 
    RET                               ;0xc52f:   c9  "." 
;--------------------------------------
C_C530:                               ; XREF: 0xC510 
    LD HL,ENCRYPTED_USER_NAME         ;0xc530:   21 00 ff  "!.."  
;--------------------------------------
C_C533:                               ; XREF: 0xC53D 
    LD A,(HL)                         ;0xc533:   7e  "~" 
    CP 0xff                           ;0xc534:   fe ff  ".." 
;--------------------------------------
C_C536:                               ; XREF: 0xC4CB 
    RET z                             ;0xc536:   c8  "." 
    XOR 0x4e                          ;0xc537:   ee 4e  ".N" 
    CALL TXT_OUTPUT                   ;0xc539:   cd 5a bb  ".Z." 
    INC HL                            ;0xc53c:   23  "#" 
    JR C_C533                         ;0xc53d:   18 f4  ".." 
;--------------------------------------
C_C53F:                               ; XREF: 0xC42B 
    LD A,(HL)                         ;0xc53f:   7e  "~" 
    XOR 0x4e                          ;0xc540:   ee 4e  ".N" 
    CALL TXT_OUTPUT                   ;0xc542:   cd 5a bb  ".Z." 
    INC HL                            ;0xc545:   23  "#" 
;--------------------------------------
C_C546:                               ; XREF: 0xC4CE 
    DJNZ C_C53F                       ;0xc546:   10 f7  ".." 
    RET                               ;0xc548:   c9  "." 
;--------------------------------------
D_C549:                               ; XREF: 0xC521 
    DEFB 0x20                         ;0xc549:   " "
    DEFB 0x3a                         ;0xc54a:   ":"
    DEFB 0x20                         ;0xc54b:   " "
    DEFB 0xc9                         ;0xc54c:   ('I') + 0x80
;--------------------------------------
OP:                                   ; XREF: 0xC015 
    LD BC,0x7fc7                      ;0xc54d:   01 c7 7f  "..."  
    OUT (C),C                         ;0xc550:   ed 49  ".I" 
    LD (0x6f90),A                     ;0xc552:   32 90 6f  "2.o"  
    LD HL,S_c56c                      ;0xc555:   21 6c c5  "!l."   - References: "CP/M PLUS"
    LD DE,0x6f10                      ;0xc558:   11 10 6f  "..o"  
    LD BC,0x30                        ;0xc55b:   01 30 00  ".0."  
    LDIR                              ;0xc55e:   ed b0  ".." 
    LD HL,0x6f10                      ;0xc560:   21 10 6f  "!.o"  
    CALL KL_FIND_COMMAND              ;0xc563:   cd d4 bc  "..." 
    JP c, C_C7CD                      ;0xc566:   da cd c7  "..." 
    JP C_C58F                         ;0xc569:   c3 8f c5  "..." 
;--------------------------------------
S_c56c:                               ; XREF: 0xC555 
    DEFB "CP/M PLUS", '2' + 0x80      ;0xc56c:   0xc56c to 0xc578
    DEFB 0x44                         ;0xc576:   
    DEFB 0x49                         ;0xc577:   
    DEFB 0xd2                         ;0xc578:   
    DEFB 0x1f                         ;0xc579:   0x1f
    DEFB 0x6f                         ;0xc57a:   
    DEFB 0x5                          ;0xc57b:   0x5
    DEFB ""o*.COM"                    ;0xc57c:   0xc57c to 0xc583
    DEFB 0x81                         ;0xc584:   
;--------------------------------------
S_C585:                               ; XREF: 0xC549 
    DEFB 0x2b                         ;0xc585:   
    DEFB 0x6f                         ;0xc586:   
    DEFB 0x5                          ;0xc587:   0x5
    DEFB ".o*.SUB"                    ;0xc588:   0xc588 to 0xc58f
;--------------------------------------
C_C58F:                               ; XREF: 0xC569 
    CALL TXT_INITIALIZE               ;0xc58f:   cd 4e bb  ".N." 
    CALL SCR_RESET                    ;0xc592:   cd 02 bc  "..." 
    LD A,2                            ;0xc595:   3e 02  ">."  
    CALL SCR_SET_MODE                 ;0xc597:   cd 0e bc  "..." 
    LD HL,SECOND_ROM_NOT_INSTALLED_MSG  ;0xc59a:   21 21 c6  "!!."   - References: "Second CPM PLUS ROM not installed"
    CALL PRINT_STRING                 ;0xc59d:   cd ea c1  "..." 
    CALL C_C9BE                       ;0xc5a0:   cd be c9  "..." 
    RET                               ;0xc5a3:   c9  "." 
;--------------------------------------
C_C5A4:                               ; XREF: 0xC5E6 
    CALL C_C5B1                       ;0xc5a4:   cd b1 c5  "..." 
    LD HL,NO_DISC_ROM_MSG             ;0xc5a7:   21 5e c6  "!^."   - References: "The Disc ROM is not installed"
    CALL PRINT_STRING                 ;0xc5aa:   cd ea c1  "..." 
    CALL C_C9BE                       ;0xc5ad:   cd be c9  "..." 
    RET                               ;0xc5b0:   c9  "." 
;--------------------------------------
C_C5B1:                               ; XREF: 0xC5A4 
    LD HL,0x6f28                      ;0xc5b1:   21 28 6f  "!(o"  
    CALL KL_FIND_COMMAND              ;0xc5b4:   cd d4 bc  "..." 
    XOR A                             ;0xc5b7:   af  "." 
    CALL 0x1b                         ;0xc5b8:   cd 1b 00  "..." 
    LD A,(0x7000)                     ;0xc5bb:   3a 00 70  ":.p"  
    LD (TXT_OUTPUT),A                 ;0xc5be:   32 5a bb  "2Z."  
    LD HL,(0x7001)                    ;0xc5c1:   2a 01 70  "*.p"  
    LD (0xbb5b),HL                    ;0xc5c4:   22 5b bb  ""[."  
    RET                               ;0xc5c7:   c9  "." 
;--------------------------------------
C_C5C8:                               ; XREF: 0xC814 
    LD A,(TXT_OUTPUT)                 ;0xc5c8:   3a 5a bb  ":Z."  
    LD (0x7000),A                     ;0xc5cb:   32 00 70  "2.p"  
    LD HL,(0xbb5b)                    ;0xc5ce:   2a 5b bb  "*[."  
    LD (0x7001),HL                    ;0xc5d1:   22 01 70  "".p"  
    LD A,0xc3                         ;0xc5d4:   3e c3  ">."  
    LD HL,0x6f60                      ;0xc5d6:   21 60 6f  "!`o"  
    LD (TXT_OUTPUT),A                 ;0xc5d9:   32 5a bb  "2Z."  
    LD (0xbb5b),HL                    ;0xc5dc:   22 5b bb  ""[."  
    RET                               ;0xc5df:   c9  "." 
;--------------------------------------
C_C5E0:                               ; XREF: 0xC811 
    LD HL,0x6f28                      ;0xc5e0:   21 28 6f  "!(o"  
    CALL KL_FIND_COMMAND              ;0xc5e3:   cd d4 bc  "..." 
    JP nc, C_C5A4                     ;0xc5e6:   d2 a4 c5  "..." 
    LD A,0xff                         ;0xc5e9:   3e ff  ">."  
    CALL 0x1b                         ;0xc5eb:   cd 1b 00  "..." 
    LD HL,0x6f27                      ;0xc5ee:   21 27 6f  "!'o"  
    CALL KL_FIND_COMMAND              ;0xc5f1:   cd d4 bc  "..." 
    JP nc, C_C5A4                     ;0xc5f4:   d2 a4 c5  "..." 
    LD D,0x27                         ;0xc5f7:   16 27  ".'"  
    LD E,0                            ;0xc5f9:   1e 00  ".."  
    CALL 0x1b                         ;0xc5fb:   cd 1b 00  "..." 
    JP c, C_C60B                      ;0xc5fe:   da 0b c6  "..." 
;--------------------------------------
C_C601:                               ; XREF: 0xC61B 
    LD HL,DISC_READ_ERROR             ;0xc601:   21 bb c6  "!.."   - References: "Disc READ error."
    CALL PRINT_STRING                 ;0xc604:   cd ea c1  "..." 
    CALL C_C9BE                       ;0xc607:   cd be c9  "..." 
    RET                               ;0xc60a:   c9  "." 
;--------------------------------------
C_C60B:                               ; XREF: 0xC5FE 
    LD HL,0x6f27                      ;0xc60b:   21 27 6f  "!'o"  
    CALL KL_FIND_COMMAND              ;0xc60e:   cd d4 bc  "..." 
    JP nc, C_C5A4                     ;0xc611:   d2 a4 c5  "..." 
    LD D,9                            ;0xc614:   16 09  ".."  
    LD E,0                            ;0xc616:   1e 00  ".."  
    CALL 0x1b                         ;0xc618:   cd 1b 00  "..." 
    JP nc, C_C601                     ;0xc61b:   d2 01 c6  "..." 
    JP C_C814                         ;0xc61e:   c3 14 c8  "..." 
;--------------------------------------
SECOND_ROM_NOT_INSTALLED_MSG:         ; XREF: 0xC59A 
    DEFB "Second CPM PLUS ROM not installed", 0x0d  ;0xc621:   0xc621 to 0xc645
    DEFB 0xa                          ;0xc643:   0xa
    DEFB 0xa                          ;0xc644:   0xa
;--------------------------------------
S_c645:                               ; XREF: 
    DEFB "Cannot enter CPM PLUS.", 0x0d  ;0xc645:   0xc645 to 0xc65e
    DEFB 0xa                          ;0xc65c:   0xa
    DEFB 0xc9                         ;0xc65d:   
;--------------------------------------
NO_DISC_ROM_MSG:                      ; XREF: 0xC5A7 
    DEFB "The Disc ROM is not installed", 0x0d  ;0xc65e:   0xc65e to 0xc67e
    DEFB 0xa                          ;0xc67c:   0xa
;--------------------------------------
C_C67D:                               ; XREF: 0xC62B 
    LD A,(BC)                         ;0xc67d:   0a  "." 
;--------------------------------------
CANT_READ_DISC_MSG:                   ; XREF: 
    DEFB "Cannot read disc !", 0x0d   ;0xc67e:   0xc67e to 0xc693
    DEFB 0xa                          ;0xc691:   0xa
    DEFB 0xc9                         ;0xc692:   
;--------------------------------------
NO_COM_SUB_FILES:                     ; XREF: 0xC943 
    DEFB "No .COM or .SUB files on this disc !"  ;0xc693:   0xc693 to 0xc6b7
    DEFB 0xa                          ;0xc6b7:   0xa
    DEFB 0xd                          ;0xc6b8:   
    DEFB 0xa                          ;0xc6b9:   0xa
;--------------------------------------
C_C6BA:                               ; XREF: 0xC666 
    RET                               ;0xc6ba:   c9  "." 
;--------------------------------------
DISC_READ_ERROR:                      ; XREF: 0xC601 
    DEFB "Disc READ error."           ;0xc6bb:   0xc6bb to 0xc6cb
    DEFB 0xa                          ;0xc6cb:   0xa
    DEFB 0xa                          ;0xc6cc:   0xa
;--------------------------------------
C_C6CD:                               ; XREF: 0xC69D 
    DEC C                             ;0xc6cd:   0d  "." 
    RET                               ;0xc6ce:   c9  "." 
;--------------------------------------
D_C6CF:                               ; XREF: 0xC7F0 0xC99A 
    DEFB 0x18                         ;0xc6cf:   0x18
;--------------------------------------
CPM_MENU_HEADER:                      ; XREF: 
    DEFB 0x20                         ;0xc6d0:   
    DEFB "C P ", 0x20                 ;0xc6d1:   0xc6d1 to 0xc6d2
    DEFB 0x20                         ;0xc6d6:   
    DEFB 0x20                         ;0xc6d7:   
;--------------------------------------
S_C6D8:                               ; XREF: 0xC6B5 
    DEFB 0x20                         ;0xc6d8:   
    DEFB "M E", 0x20                  ;0xc6d9:   0xc6d9 to 0xc6da
;--------------------------------------
S_C6DD:                               ; XREF: 0xC66D 
    DEFB 0x4e                         ;0xc6dd:   
    DEFB " U ", 0x55                  ;0xc6de:   0xc6de to 0xc6df
;--------------------------------------
BY_GRADUATE_MSG:                      ; XREF: 
    DEFB "  by Graduate Software. Copyright 1988."  ;0xc6e2:   0xc6e2 to 0xc709
    DEFB 0xa                          ;0xc709:   0xa
;--------------------------------------
C_C70A:                               ; XREF: 0xC6A2 
    DEC C                             ;0xc70a:   0d  "." 
;--------------------------------------
C_C70B:                               ; XREF: 0xC69A 
    LD A,(BC)                         ;0xc70b:   0a  "." 
    RET                               ;0xc70c:   c9  "." 
;--------------------------------------
MENU_HELP_MSG:                        ; XREF: 0xC8BF 
    DEFB "Press SPACE to move the highlighter, and press RETURN to run the .COM or .SUB   file under the highlighter.", 'I' + 0x80  ;0xc70d:   0xc70d to 0xc77b
;--------------------------------------
S_c779:                               ; XREF: 0xC883 
    DEFB 0x20                         ;0xc779:   
    DEFB 0x20                         ;0xc77a:   
    DEFB 0x20                         ;0xc77b:   
;--------------------------------------
C_C77C:                               ; XREF: 0xC75A 
    DEFB 0x20                         ;0xc77c:   
;--------------------------------------
C_C77D:                               ; XREF: 0xC74D 
    RET                               ;0xc77d:   c9  "." 
;--------------------------------------
PRESS_ESC_MSG:                        ; XREF: 0xC9A0 
    DEFB "Press ESC to return to Basic or any other key to try another disc."  ;0xc77e:   0xc77e to 0xc7c0
    RET                               ;0xc7c0:   c9  "." 
;--------------------------------------
D_C7C1:                               ; XREF: 0xC806 
    DEFB 0xe5                         ;0xc7c1:   ('e') + 0x80
    DEFB 0x2a                         ;0xc7c2:   "*"
;--------------------------------------
C_C7C3:                               ; XREF: 0xC752 
    NOP                               ;0xc7c3:   00  "." 
;--------------------------------------
C_C7C4:                               ; XREF: 0xC75C 
    LD L,A                            ;0xc7c4:   6f  "o" 
    LD (HL),A                         ;0xc7c5:   77  "w" 
    INC HL                            ;0xc7c6:   23  "#" 
    LD (0x6f00),HL                    ;0xc7c7:   22 00 6f  "".o"  
;--------------------------------------
C_C7CA:                               ; XREF: 0xC783 
    POP HL                            ;0xc7ca:   e1  "." 
    RET                               ;0xc7cb:   c9  "." 
    NOP                               ;0xc7cc:   00  "." 
;--------------------------------------
C_C7CD:                               ; XREF: 0xC566 
    CALL TXT_INITIALIZE               ;0xc7cd:   cd 4e bb  ".N." 
    LD A,2                            ;0xc7d0:   3e 02  ">."  
    CALL SCR_SET_MODE                 ;0xc7d2:   cd 0e bc  "..." 
;--------------------------------------
C_C7D5:                               ; XREF: 0xC76B 
    LD A,(0x6f90)                     ;0xc7d5:   3a 90 6f  ":.o"  
;--------------------------------------
C_C7D8:                               ; XREF: 0xC761 
    CP 0                              ;0xc7d8:   fe 00  ".." 
    JR nz, C_C7F0                     ;0xc7da:   20 14  " ." 
    LD BC,0xd0d                       ;0xc7dc:   01 0d 0d  "..."  
    PUSH BC                           ;0xc7df:   c5  "." 
    CALL SCR_SET_BORDER               ;0xc7e0:   cd 38 bc  ".8." 
    POP BC                            ;0xc7e3:   c1  "." 
    XOR A                             ;0xc7e4:   af  "." 
    CALL SCR_SET_INK                  ;0xc7e5:   cd 32 bc  ".2." 
    LD A,1                            ;0xc7e8:   3e 01  ">."  
    LD BC,0                           ;0xc7ea:   01 00 00  "..."  
    CALL SCR_SET_INK                  ;0xc7ed:   cd 32 bc  ".2." 
;--------------------------------------
C_C7F0:                               ; XREF: 0xC7DA 
    LD HL,D_C6CF                      ;0xc7f0:   21 cf c6  "!.."  
    CALL PRINT_STRING                 ;0xc7f3:   cd ea c1  "..." 
    LD HL,0x6f1a                      ;0xc7f6:   21 1a 6f  "!.o"  
    CALL KL_FIND_COMMAND              ;0xc7f9:   cd d4 bc  "..." 
    JP nc, C_C5A4                     ;0xc7fc:   d2 a4 c5  "..." 
    LD A,C                            ;0xc7ff:   79  "y" 
;--------------------------------------
C_C800:                               ; XREF: 0xC79D 
    LD (0x6f10),HL                    ;0xc800:   22 10 6f  "".o"  
    LD (0x6f12),A                     ;0xc803:   32 12 6f  "2.o"  
    LD HL,D_C7C1                      ;0xc806:   21 c1 c7  "!.."  
    LD DE,0x6f60                      ;0xc809:   11 60 6f  ".`o"  
    LD BC,11                          ;0xc80c:   01 0b 00  "..."  
    LDIR                              ;0xc80f:   ed b0  ".." 
    JP C_C5E0                         ;0xc811:   c3 e0 c5  "..." 
;--------------------------------------
C_C814:                               ; XREF: 0xC61E 
    CALL C_C5C8                       ;0xc814:   cd c8 c5  "..." 
    LD HL,0x4000                      ;0xc817:   21 00 40  "!.@"  
    LD (0x6f00),HL                    ;0xc81a:   22 00 6f  "".o"  
    LD A,1                            ;0xc81d:   3e 01  ">."  
    LD IX,0x6f1d                      ;0xc81f:   dd 21 1d 6f  ".!.o"  
    RST 0x18                          ;0xc823:   df  "." 
;--------------------------------------
C_C824:                               ; XREF: 0xC7AE 
    DJNZ C_C895                       ;0xc824:   10 6f  ".o" 
    CALL C_C5B1                       ;0xc826:   cd b1 c5  "..." 
    LD A,1                            ;0xc829:   3e 01  ">."  
    LD (0x6f70),A                     ;0xc82b:   32 70 6f  "2po"  
    LD (0x6f72),A                     ;0xc82e:   32 72 6f  "2ro"  
    LD HL,0x104                       ;0xc831:   21 04 01  "!.."  
    CALL TXT_SET_CURSOR               ;0xc834:   cd 75 bb  ".u." 
    LD DE,0x3000                      ;0xc837:   11 00 30  "..0"  
    CALL C_C865                       ;0xc83a:   cd 65 c8  ".e." 
    PUSH DE                           ;0xc83d:   d5  "." 
    CALL TXT_GET_CURSOR               ;0xc83e:   cd 78 bb  ".x." 
    PUSH HL                           ;0xc841:   e5  "." 
    LD HL,0x4000                      ;0xc842:   21 00 40  "!.@"  
    LD (0x6f00),HL                    ;0xc845:   22 00 6f  "".o"  
    CALL C_C5C8                       ;0xc848:   cd c8 c5  "..." 
    LD A,1                            ;0xc84b:   3e 01  ">."  
    LD IX,0x6f29                      ;0xc84d:   dd 21 29 6f  ".!)o"  
    RST 0x18                          ;0xc851:   df  "." 
    DJNZ $+113                        ;0xc852:   10 6f  ".o" 
    CALL C_C5B1                       ;0xc854:   cd b1 c5  "..." 
    POP HL                            ;0xc857:   e1  "." 
    CALL TXT_SET_CURSOR               ;0xc858:   cd 75 bb  ".u." 
    POP DE                            ;0xc85b:   d1  "." 
    CALL C_C865                       ;0xc85c:   cd 65 c8  ".e." 
    JP c, C_C8A6                      ;0xc85f:   da a6 c8  "..." 
    JP C_C8AD                         ;0xc862:   c3 ad c8  "..." 
;--------------------------------------
C_C865:                               ; XREF: 0xC83A 
    LD HL,0x4002                      ;0xc865:   21 02 40  "!.@"  
;--------------------------------------
C_C868:                               ; XREF: 0xC86C 
    LD A,(HL)                         ;0xc868:   7e  "~" 
    INC HL                            ;0xc869:   23  "#" 
    CP 10                             ;0xc86a:   fe 0a  ".." 
    JR nz, C_C868                     ;0xc86c:   20 fa  " ." 
    INC HL                            ;0xc86e:   23  "#" 
    INC HL                            ;0xc86f:   23  "#" 
    LD (0x6f73),HL                    ;0xc870:   22 73 6f  ""so"  
;--------------------------------------
C_C873:                               ; XREF: 0xC8A3 
    LD A,(HL)                         ;0xc873:   7e  "~" 
    CP 13                             ;0xc874:   fe 0d  ".." 
    RET z                             ;0xc876:   c8  "." 
    LD B,12                           ;0xc877:   06 0c  ".."  
;--------------------------------------
C_C879:                               ; XREF: 0xC880 
    LD A,(HL)                         ;0xc879:   7e  "~" 
    LD (DE),A                         ;0xc87a:   12  "." 
    INC DE                            ;0xc87b:   13  "." 
    INC HL                            ;0xc87c:   23  "#" 
    CALL TXT_OUTPUT                   ;0xc87d:   cd 5a bb  ".Z." 
    DJNZ C_C879                       ;0xc880:   10 f7  ".." 
    PUSH HL                           ;0xc882:   e5  "." 
    LD HL,S_c779                      ;0xc883:   21 79 c7  "!y."  
    CALL PRINT_STRING                 ;0xc886:   cd ea c1  "..." 
    POP HL                            ;0xc889:   e1  "." 
    INC HL                            ;0xc88a:   23  "#" 
    LD A,(HL)                         ;0xc88b:   7e  "~" 
    CP 10                             ;0xc88c:   fe 0a  ".." 
    JR z, C_C894                      ;0xc88e:   28 04  "(." 
    INC HL                            ;0xc890:   23  "#" 
    INC HL                            ;0xc891:   23  "#" 
    JR C_C89C                         ;0xc892:   18 08  ".." 
;--------------------------------------
C_C894:                               ; XREF: 0xC88E 
    INC HL                            ;0xc894:   23  "#" 
;--------------------------------------
C_C895:                               ; XREF: 0xC824 
    LD A,(HL)                         ;0xc895:   7e  "~" 
    CP 13                             ;0xc896:   fe 0d  ".." 
    SCF                               ;0xc898:   37  "7" 
    RET z                             ;0xc899:   c8  "." 
    JR C_C89C                         ;0xc89a:   18 00  ".." 
;--------------------------------------
C_C89C:                               ; XREF: 0xC892 
    LD A,(0x6f70)                     ;0xc89c:   3a 70 6f  ":po"  
    INC A                             ;0xc89f:   3c  "<" 
    LD (0x6f70),A                     ;0xc8a0:   32 70 6f  "2po"  
    JP C_C873                         ;0xc8a3:   c3 73 c8  ".s." 
;--------------------------------------
C_C8A6:                               ; XREF: 0xC85F 
    LD A,(0x6f70)                     ;0xc8a6:   3a 70 6f  ":po"  
    INC A                             ;0xc8a9:   3c  "<" 
    LD (0x6f70),A                     ;0xc8aa:   32 70 6f  "2po"  
;--------------------------------------
C_C8AD:                               ; XREF: 0xC862 
    LD A,(0x6f70)                     ;0xc8ad:   3a 70 6f  ":po"  
    CP 1                              ;0xc8b0:   fe 01  ".." 
    JP z, C_C93D                      ;0xc8b2:   ca 3d c9  ".=." 
    DEC A                             ;0xc8b5:   3d  "=" 
    LD (0x6f70),A                     ;0xc8b6:   32 70 6f  "2po"  
    LD HL,0x118                       ;0xc8b9:   21 18 01  "!.."  
    CALL TXT_SET_CURSOR               ;0xc8bc:   cd 75 bb  ".u." 
    LD HL,MENU_HELP_MSG               ;0xc8bf:   21 0d c7  "!.."   - References: "Press SPACE to move the highlighter, and press RETURN to run the .COM or .SUB   file under the highlighter."
    CALL PRINT_STRING                 ;0xc8c2:   cd ea c1  "..." 
    LD A,(0x6f70)                     ;0xc8c5:   3a 70 6f  ":po"  
    INC A                             ;0xc8c8:   3c  "<" 
    LD (0x6f71),A                     ;0xc8c9:   32 71 6f  "2qo"  
;--------------------------------------
C_C8CC:                               ; XREF: 0xC900 
    LD A,1                            ;0xc8cc:   3e 01  ">."  
    LD (0x6f70),A                     ;0xc8ce:   32 70 6f  "2po"  
    LD HL,0x104                       ;0xc8d1:   21 04 01  "!.."  
    LD (0x7e00),HL                    ;0xc8d4:   22 00 7e  "".~"  
    CALL TXT_SET_CURSOR               ;0xc8d7:   cd 75 bb  ".u." 
    CALL C_C921                       ;0xc8da:   cd 21 c9  ".!." 
;--------------------------------------
C_C8DD:                               ; XREF: 0xC8ED 
    CALL KM_WAIT_KEY                  ;0xc8dd:   cd 18 bb  "..." 
    CP 0xfc                           ;0xc8e0:   fe fc  ".." 
    JP z, C_C992                      ;0xc8e2:   ca 92 c9  "..." 
    CP 13                             ;0xc8e5:   fe 0d  ".." 
    JR z, C_C94D                      ;0xc8e7:   28 64  "(d" 
    CP 0x20                           ;0xc8e9:   fe 20  ". " 
    JR z, C_C8EF                      ;0xc8eb:   28 02  "(." 
    JR C_C8DD                         ;0xc8ed:   18 ee  ".." 
;--------------------------------------
C_C8EF:                               ; XREF: 0xC8EB 
    LD HL,(0x7e00)                    ;0xc8ef:   2a 00 7e  "*.~"  
    LD A,H                            ;0xc8f2:   7c  "|" 
    CP 0x3f                           ;0xc8f3:   fe 3f  ".?" 
    CALL C_C921                       ;0xc8f5:   cd 21 c9  ".!." 
    LD A,(0x6f70)                     ;0xc8f8:   3a 70 6f  ":po"  
    LD B,A                            ;0xc8fb:   47  "G" 
    LD A,(0x6f71)                     ;0xc8fc:   3a 71 6f  ":qo"  
    CP B                              ;0xc8ff:   b8  "." 
    JR z, C_C8CC                      ;0xc900:   28 ca  "(." 
    LD A,(0x6f70)                     ;0xc902:   3a 70 6f  ":po"  
    INC A                             ;0xc905:   3c  "<" 
    LD (0x6f70),A                     ;0xc906:   32 70 6f  "2po"  
    LD HL,(0x7e00)                    ;0xc909:   2a 00 7e  "*.~"  
    LD A,H                            ;0xc90c:   7c  "|" 
    ADD A,0x10                        ;0xc90d:   c6 10  ".." 
    CP 0x50                           ;0xc90f:   fe 50  ".P" 
    JR nc, C_C91C                     ;0xc911:   30 09  "0." 
;--------------------------------------
C_C913:                               ; XREF: 0xC91F 
    LD H,A                            ;0xc913:   67  "g" 
    LD (0x7e00),HL                    ;0xc914:   22 00 7e  "".~"  
    CALL C_C921                       ;0xc917:   cd 21 c9  ".!." 
    JR C_C8DD                         ;0xc91a:   18 c1  ".." 
;--------------------------------------
C_C91C:                               ; XREF: 0xC911 
    INC L                             ;0xc91c:   2c  "," 
    LD A,1                            ;0xc91d:   3e 01  ">."  
    JR C_C913                         ;0xc91f:   18 f2  ".." 
;--------------------------------------
C_C921:                               ; XREF: 0xC8DA 
    LD HL,(0x7e00)                    ;0xc921:   2a 00 7e  "*.~"  
    DEC L                             ;0xc924:   2d  "-" 
    DEC H                             ;0xc925:   25  "%" 
    CALL SCR_CHAR_POSITION            ;0xc926:   cd 1a bc  "..." 
    LD B,8                            ;0xc929:   06 08  ".."  
;--------------------------------------
C_C92B:                               ; XREF: 0xC93A 
    PUSH BC                           ;0xc92b:   c5  "." 
    PUSH HL                           ;0xc92c:   e5  "." 
    LD B,12                           ;0xc92d:   06 0c  ".."  
;--------------------------------------
C_C92F:                               ; XREF: 0xC933 
    RST 0x20                          ;0xc92f:   e7  "." 
    CPL                               ;0xc930:   2f  "/" 
    LD (HL),A                         ;0xc931:   77  "w" 
    INC HL                            ;0xc932:   23  "#" 
    DJNZ C_C92F                       ;0xc933:   10 fa  ".." 
    POP HL                            ;0xc935:   e1  "." 
    CALL SCR_NEXT_LINE                ;0xc936:   cd 26 bc  ".&." 
    POP BC                            ;0xc939:   c1  "." 
    DJNZ C_C92B                       ;0xc93a:   10 ef  ".." 
    RET                               ;0xc93c:   c9  "." 
;--------------------------------------
C_C93D:                               ; XREF: 0xC8B2 
    LD HL,0x103                       ;0xc93d:   21 03 01  "!.."  
    CALL TXT_SET_CURSOR               ;0xc940:   cd 75 bb  ".u." 
    LD HL,NO_COM_SUB_FILES            ;0xc943:   21 93 c6  "!.."   - References: "No .COM or .SUB files on this disc !"
    CALL PRINT_STRING                 ;0xc946:   cd ea c1  "..." 
    CALL C_C9BE                       ;0xc949:   cd be c9  "..." 
    RET                               ;0xc94c:   c9  "." 
;--------------------------------------
C_C94D:                               ; XREF: 0xC8E7 
    LD A,(0x6f70)                     ;0xc94d:   3a 70 6f  ":po"  
    DEC A                             ;0xc950:   3d  "=" 
    LD (0x6f70),A                     ;0xc951:   32 70 6f  "2po"  
    LD HL,0x3000                      ;0xc954:   21 00 30  "!.0"  
    CP 0                              ;0xc957:   fe 00  ".." 
    JR z, C_C962                      ;0xc959:   28 07  "(." 
    LD B,A                            ;0xc95b:   47  "G" 
    LD DE,12                          ;0xc95c:   11 0c 00  "..."  
;--------------------------------------
C_C95F:                               ; XREF: 0xC960 
    ADD HL,DE                         ;0xc95f:   19  "." 
    DJNZ C_C95F                       ;0xc960:   10 fd  ".." 
;--------------------------------------
C_C962:                               ; XREF: 0xC959 
    LD DE,0xbf00                      ;0xc962:   11 00 bf  "..."  
    LD BC,12                          ;0xc965:   01 0c 00  "..."  
    LDIR                              ;0xc968:   ed b0  ".." 
    CALL C_C9BE                       ;0xc96a:   cd be c9  "..." 
    CALL C_C1FF                       ;0xc96d:   cd ff c1  "..." 
    LD HL,0xbf00                      ;0xc970:   21 00 bf  "!.."  
    LD DE,0x6e58                      ;0xc973:   11 58 6e  ".Xn"  
    LD B,12                           ;0xc976:   06 0c  ".."  
;--------------------------------------
C_C978:                               ; XREF: 0xC980 
    LD A,(HL)                         ;0xc978:   7e  "~" 
    CP 0x20                           ;0xc979:   fe 20  ". " 
    JR z, C_C97F                      ;0xc97b:   28 02  "(." 
    LD (DE),A                         ;0xc97d:   12  "." 
    INC DE                            ;0xc97e:   13  "." 
;--------------------------------------
C_C97F:                               ; XREF: 0xC97B 
    INC HL                            ;0xc97f:   23  "#" 
    DJNZ C_C978                       ;0xc980:   10 f6  ".." 
    XOR A                             ;0xc982:   af  "." 
    LD (DE),A                         ;0xc983:   12  "." 
    LD A,0x21                         ;0xc984:   3e 21  ">!"  
    LD HL,0xfd8                       ;0xc986:   21 d8 0f  "!.."  
    LD (0x6377),HL                    ;0xc989:   22 77 63  ""wc"  
    LD (0x6376),A                     ;0xc98c:   32 76 63  "2vc"  
    JP C_C369                         ;0xc98f:   c3 69 c3  ".i." 
;--------------------------------------
C_C992:                               ; XREF: 0xC8E2 
    CALL TXT_INITIALIZE               ;0xc992:   cd 4e bb  ".N." 
    LD A,2                            ;0xc995:   3e 02  ">."  
    CALL SCR_SET_MODE                 ;0xc997:   cd 0e bc  "..." 
    LD HL,D_C6CF                      ;0xc99a:   21 cf c6  "!.."  
    CALL PRINT_STRING                 ;0xc99d:   cd ea c1  "..." 
    LD HL,PRESS_ESC_MSG               ;0xc9a0:   21 7e c7  "!~."   - References: "Press ESC to return to Basic or any other key to try another disc."
    CALL PRINT_STRING                 ;0xc9a3:   cd ea c1  "..." 
;--------------------------------------
C_C9A6:                               ; XREF: 0xC9A9 
    CALL KM_READ_CHAR                 ;0xc9a6:   cd 09 bb  "..." 
    JR c, C_C9A6                      ;0xc9a9:   38 fb  "8." 
    CALL KM_WAIT_KEY                  ;0xc9ab:   cd 18 bb  "..." 
    CP 0xfc                           ;0xc9ae:   fe fc  ".." 
    JP nz, OP                         ;0xc9b0:   c2 4d c5  ".M." 
    CALL SCR_RESET                    ;0xc9b3:   cd 02 bc  "..." 
    CALL TXT_INITIALIZE               ;0xc9b6:   cd 4e bb  ".N." 
    LD A,1                            ;0xc9b9:   3e 01  ">."  
    CALL SCR_SET_MODE                 ;0xc9bb:   cd 0e bc  "..." 
;--------------------------------------
C_C9BE:                               ; XREF: 0xC5A0 
    DEFB 0x1                          ;0xc9be:   0x1
    RET nz                            ;0xc9bf:   c0  "." 
    LD A,A                            ;0xc9c0:   7f  "." 
    OUT (C),C                         ;0xc9c1:   ed 49  ".I" 
    RET                               ;0xc9c3:   c9  "." 
;--------------------------------------
PASSWORD:                             ; XREF: 0xC01B 
    XOR A                             ;0xc9c4:   af  "." 
    LD (IY+3),A                       ;0xc9c5:   fd 77 03  ".w." 
;--------------------------------------
C_C9C8:                               ; XREF: 0xCA69 
    LD A,0x3f                         ;0xc9c8:   3e 3f  ">?"  
    CALL TXT_OUTPUT                   ;0xc9ca:   cd 5a bb  ".Z." 
    CALL PASSWORD_INPUT               ;0xc9cd:   cd e3 c9  "..." 
    LD A,B                            ;0xc9d0:   78  "x" 
    LD (IY+0),A                       ;0xc9d1:   fd 77 00  ".w." 
    LD A,0x20                         ;0xc9d4:   3e 20  "> "  
    CALL TXT_OUTPUT                   ;0xc9d6:   cd 5a bb  ".Z." 
    CALL VALIDATE_PASSWORD            ;0xc9d9:   cd 2e ca  "..." 
    LD HL,PASSWORD_ACCEPTED_MSG       ;0xc9dc:   21 9f ca  "!.."  
    CALL PRINT_STRING                 ;0xc9df:   cd ea c1  "..." 
    RET                               ;0xc9e2:   c9  "." 
;--------------------------------------
PASSWORD_INPUT:                       ; XREF: 0xC9CD 
    XOR A                             ;0xc9e3:   af  "." 
    LD (IY+1),A                       ;0xc9e4:   fd 77 01  ".w." 
    LD B,0                            ;0xc9e7:   06 00  ".."  
    CALL C_CA70                       ;0xc9e9:   cd 70 ca  ".p." 
;--------------------------------------
C_C9EC:                               ; XREF: 0xCA05 
    LD A,0x8f                         ;0xc9ec:   3e 8f  ">."  
    CALL TXT_OUTPUT                   ;0xc9ee:   cd 5a bb  ".Z." 
    LD A,8                            ;0xc9f1:   3e 08  ">."  
    CALL TXT_OUTPUT                   ;0xc9f3:   cd 5a bb  ".Z." 
    CALL KM_WAIT_KEY                  ;0xc9f6:   cd 18 bb  "..." 
    CP 13                             ;0xc9f9:   fe 0d  ".." 
    RET z                             ;0xc9fb:   c8  "." 
    CP 0x7f                           ;0xc9fc:   fe 7f  ".." 
    JP z, PASSWORD_DELETE_INPUT           ;0xc9fe:   ca 12 ca  "..." 
    LD C,A                            ;0xca01:   4f  "O" 
    LD A,B                            ;0xca02:   78  "x" 
    CP 0x40                           ;0xca03:   fe 40  ".@" 
    JP nc, C_C9EC                     ;0xca05:   d2 ec c9  "..." 
    LD A,C                            ;0xca08:   79  "y" 
    LD (HL),A                         ;0xca09:   77  "w" 
    INC HL                            ;0xca0a:   23  "#" 
    INC B                             ;0xca0b:   04  "." 
    CALL C_CA23                       ;0xca0c:   cd 23 ca  ".#." 
    JP C_C9EC                         ;0xca0f:   c3 ec c9  "..." 
;--------------------------------------
PASSWORD_DELETE_INPUT:                ; XREF: 0xC9FE 
    LD A,B                            ;0xca12:   78  "x" 
    CP 0                              ;0xca13:   fe 00  ".." 
    JP z, PASSWORD_INPUT              ;0xca15:   ca e3 c9  "..." 
    CALL C_CA1E                       ;0xca18:   cd 1e ca  "..." 
    JP C_C9EC                         ;0xca1b:   c3 ec c9  "..." 
;--------------------------------------
C_CA1E:                               ; XREF: 0xCA18 
    DEC B                             ;0xca1e:   05  "." 
    DEC HL                            ;0xca1f:   2b  "+" 
    JP C_CA23                         ;0xca20:   c3 23 ca  ".#." 
;--------------------------------------
C_CA23:                               ; XREF: 0xCA0C 
    LD A,0x20                         ;0xca23:   3e 20  "> "  
    CALL TXT_OUTPUT                   ;0xca25:   cd 5a bb  ".Z." 
    LD A,8                            ;0xca28:   3e 08  ">."  
    CALL TXT_OUTPUT                   ;0xca2a:   cd 5a bb  ".Z." 
    RET                               ;0xca2d:   c9  "." 
;--------------------------------------
VALIDATE_PASSWORD:                    ; XREF: 0xC9D9 
    LD IX,ENCRYPTED_PASSWORD_LENGTH   ;0xca2e:   dd 21 87 ff  ".!.."  
    LD A,(IX+0)                       ;0xca32:   dd 7e 00  ".~." 
    XOR 0xaa                          ;0xca35:   ee aa  ".." 
    LD B,A                            ;0xca37:   47  "G" 
    LD A,(IY+0)                       ;0xca38:   fd 7e 00  ".~." 
    CP B                              ;0xca3b:   b8  "." 
    JP nz, BAD_PASSWORD               ;0xca3c:   c2 56 ca  ".V." 
    LD A,(IY+0)                       ;0xca3f:   fd 7e 00  ".~." 
    LD B,A                            ;0xca42:   47  "G" 
    CALL C_CA70                       ;0xca43:   cd 70 ca  ".p." 
;--------------------------------------
CHECK_PASSWORD_LOOP:                  ; XREF: 0xCA53 
    INC IX                            ;0xca46:   dd 23  ".#" 
    LD A,(IX+0)                       ;0xca48:   dd 7e 00  ".~." 
    XOR 0xaa                          ;0xca4b:   ee aa  ".." 
    LD C,A                            ;0xca4d:   4f  "O" 
    LD A,(HL)                         ;0xca4e:   7e  "~" 
    INC HL                            ;0xca4f:   23  "#" 
    CP C                              ;0xca50:   b9  "." 
    JR nz, BAD_PASSWORD               ;0xca51:   20 03  " ." 
    DJNZ CHECK_PASSWORD_LOOP           ;0xca53:   10 f1  ".." 
    RET                               ;0xca55:   c9  "." 
;--------------------------------------
BAD_PASSWORD:                         ; XREF: 0xCA3C 
    POP BC                            ;0xca56:   c1  "." 
    LD HL,WRONG_PASSWORD_MSG          ;0xca57:   21 bc ca  "!.."  
    CALL PRINT_STRING                 ;0xca5a:   cd ea c1  "..." 
    LD A,(IY+3)                       ;0xca5d:   fd 7e 03  ".~." 
    INC A                             ;0xca60:   3c  "<" 
    CP 3                              ;0xca61:   fe 03  ".." 
    JP z, C_CA6C                      ;0xca63:   ca 6c ca  ".l." 
    LD (IY+3),A                       ;0xca66:   fd 77 03  ".w." 
    JP C_C9C8                         ;0xca69:   c3 c8 c9  "..." 
;--------------------------------------
C_CA6C:                               ; XREF: 0xCA63 
    XOR A                             ;0xca6c:   af  "." 
    JP C_C1F9                         ;0xca6d:   c3 f9 c1  "..." 
;--------------------------------------
C_CA70:                               ; XREF: 0xC9E9 
    PUSH IY                           ;0xca70:   fd e5  ".." 
    POP HL                            ;0xca72:   e1  "." 
    INC HL                            ;0xca73:   23  "#" 
    INC HL                            ;0xca74:   23  "#" 
    INC HL                            ;0xca75:   23  "#" 
    INC HL                            ;0xca76:   23  "#" 
    RET                               ;0xca77:   c9  "." 
;--------------------------------------
PW:                                   ; XREF: 0xC01E 
    CALL C_CA70                       ;0xca78:   cd 70 ca  ".p." 
    LD IX,ENCRYPTED_PASSWORD_LENGTH   ;0xca7b:   dd 21 87 ff  ".!.."  
    LD A,(IY+0)                       ;0xca7f:   fd 7e 00  ".~." 
    LD B,A                            ;0xca82:   47  "G" 
    LD A,(IX+0)                       ;0xca83:   dd 7e 00  ".~." 
    XOR 0xaa                          ;0xca86:   ee aa  ".." 
    CP B                              ;0xca88:   b8  "." 
    JP nz, C_CA6C                     ;0xca89:   c2 6c ca  ".l." 
    INC IX                            ;0xca8c:   dd 23  ".#" 
;--------------------------------------
C_CA8E:                               ; XREF: 0xCA9C 
    LD A,(IX+0)                       ;0xca8e:   dd 7e 00  ".~." 
    XOR 0xaa                          ;0xca91:   ee aa  ".." 
    LD C,A                            ;0xca93:   4f  "O" 
    LD A,(HL)                         ;0xca94:   7e  "~" 
    CP C                              ;0xca95:   b9  "." 
    JP nz, C_CA6C                     ;0xca96:   c2 6c ca  ".l." 
    INC HL                            ;0xca99:   23  "#" 
    INC IX                            ;0xca9a:   dd 23  ".#" 
    DJNZ C_CA8E                       ;0xca9c:   10 f0  ".." 
    RET                               ;0xca9e:   c9  "." 
;--------------------------------------
PASSWORD_ACCEPTED_MSG:                ; XREF: 0xC9DC 
    DEFB 0xa                          ;0xca9f:   0xa
    DEFB 0xd                          ;0xcaa0:   
    DEFB 0xa                          ;0xcaa1:   0xa
    DEFB "** Password Accepted **"    ;0xcaa2:   0xcaa2 to 0xcab9
    DEFB 0xa                          ;0xcab9:   0xa
    DEFB 0xd                          ;0xcaba:   
    DEFB 0xc9                         ;0xcabb:   
;--------------------------------------
WRONG_PASSWORD_MSG:                   ; XREF: 0xCA57 
    DEFB 0xa                          ;0xcabc:   0xa
    DEFB 0xd                          ;0xcabd:   
    DEFB 0xa                          ;0xcabe:   0xa
    DEFB "** Incorrect Password **"   ;0xcabf:   0xcabf to 0xcad7
    DEFB 0xa                          ;0xcad7:   0xa
    DEFB 0xd                          ;0xcad8:   
    DEFB 0xc9                         ;0xcad9:   
;--------------------------------------
EMSHELP:                              ; XREF: 0xC021 
    PUSH IY                           ;0xcada:   fd e5  ".." 
    POP HL                            ;0xcadc:   e1  "." 
    LD DE,0x22                        ;0xcadd:   11 22 00  "."."  
    ADD HL,DE                         ;0xcae0:   19  "." 
    PUSH HL                           ;0xcae1:   e5  "." 
;--------------------------------------
C_CAE2:                               ; XREF: 0xCAB6 
    POP IY                            ;0xcae2:   fd e1  ".." 
    LD DE,D_CC1C                      ;0xcae4:   11 1c cc  "..."  
    EX DE,HL                          ;0xcae7:   eb  "." 
    LD BC,0x1a                        ;0xcae8:   01 1a 00  "..."  
    LDIR                              ;0xcaeb:   ed b0  ".." 
    CP 1                              ;0xcaed:   fe 01  ".." 
    JP z, C_CB9C                      ;0xcaef:   ca 9c cb  "..." 
;--------------------------------------
C_CAF2:                               ; XREF: 0xCBA4 
    LD HL,ACC_ROMS_MSG                ;0xcaf2:   21 3e cb  "!>."   - References: "CPM PLUS : Accessory Roms attached"
    CALL C_CB34                       ;0xcaf5:   cd 34 cb  ".4." 
    LD C,1                            ;0xcaf8:   0e 01  ".."  
;--------------------------------------
C_CAFA:                               ; XREF: 0xCB0F 
    PUSH BC                           ;0xcafa:   c5  "." 
    LD A,C                            ;0xcafb:   79  "y" 
    LD (IY+0x19),A                    ;0xcafc:   fd 77 19  ".w." 
    LD HL,ROM_TYPE                    ;0xcaff:   21 00 c0  "!.."  
    CALL C_CC1A                       ;0xcb02:   cd 1a cc  "..." 
    CP 0x47                           ;0xcb05:   fe 47  ".G" 
    CALL z, C_CB12                    ;0xcb07:   cc 12 cb  "..." 
    POP BC                            ;0xcb0a:   c1  "." 
    INC C                             ;0xcb0b:   0c  "." 
    LD A,C                            ;0xcb0c:   79  "y" 
    CP 0x10                           ;0xcb0d:   fe 10  ".." 
    JR nz, C_CAFA                     ;0xcb0f:   20 e9  " ." 
    RET                               ;0xcb11:   c9  "." 
;--------------------------------------
C_CB12:                               ; XREF: 0xCB07 
    LD HL,S_CB64                      ;0xcb12:   21 64 cb  "!d."  
    CALL C_CB34                       ;0xcb15:   cd 34 cb  ".4." 
    LD A,(IY+0x19)                    ;0xcb18:   fd 7e 19  ".~." 
    CALL C_CB6C                       ;0xcb1b:   cd 6c cb  ".l." 
    LD HL,S_CB69                      ;0xcb1e:   21 69 cb  "!i."  
    CALL C_CB34                       ;0xcb21:   cd 34 cb  ".4." 
    LD HL,0xc010                      ;0xcb24:   21 10 c0  "!.."  
;--------------------------------------
C_CB27:                               ; XREF: 0xCB32 
    NOP                               ;0xcb27:   00  "." 
    CALL C_CC1A                       ;0xcb28:   cd 1a cc  "..." 
    CP 0x24                           ;0xcb2b:   fe 24  ".$" 
    RET z                             ;0xcb2d:   c8  "." 
    CALL TXT_OUTPUT                   ;0xcb2e:   cd 5a bb  ".Z." 
    INC HL                            ;0xcb31:   23  "#" 
    JR C_CB27                         ;0xcb32:   18 f3  ".." 
;--------------------------------------
C_CB34:                               ; XREF: 0xCAF5 
    LD A,(HL)                         ;0xcb34:   7e  "~" 
    CP 0x24                           ;0xcb35:   fe 24  ".$" 
    RET z                             ;0xcb37:   c8  "." 
    CALL TXT_OUTPUT                   ;0xcb38:   cd 5a bb  ".Z." 
    INC HL                            ;0xcb3b:   23  "#" 
    JR C_CB34                         ;0xcb3c:   18 f6  ".." 
;--------------------------------------
ACC_ROMS_MSG:                         ; XREF: 0xCAF2 
    DEFB "CPM PLUS : Accessory Roms attached", 0x0d  ;0xcb3e:   0xcb3e to 0xcb63
    DEFB 0xa                          ;0xcb61:   0xa
    DEFB 0xa                          ;0xcb62:   0xa
;--------------------------------------
S_cb63:                               ; XREF: 
    DEFB "$ROM $: $"                  ;0xcb63:   0xcb63 to 0xcb6c
;--------------------------------------
C_CB6C:                               ; XREF: 0xCB1B 
    LD D,10                           ;0xcb6c:   16 0a  ".."  
    LD H,0                            ;0xcb6e:   26 00  "&."  
    CALL C_CB77                       ;0xcb70:   cd 77 cb  ".w." 
    LD H,1                            ;0xcb73:   26 01  "&."  
    LD D,1                            ;0xcb75:   16 01  ".."  
;--------------------------------------
C_CB77:                               ; XREF: 0xCB70 
    LD C,0                            ;0xcb77:   0e 00  ".."  
;--------------------------------------
C_CB79:                               ; XREF: 0xCB7D 
    SUB D                             ;0xcb79:   92  "." 
    JR c, C_CB7F                      ;0xcb7a:   38 03  "8." 
    INC C                             ;0xcb7c:   0c  "." 
    JR C_CB79                         ;0xcb7d:   18 fa  ".." 
;--------------------------------------
C_CB7F:                               ; XREF: 0xCB7A 
    ADD A,D                           ;0xcb7f:   82  "." 
    PUSH AF                           ;0xcb80:   f5  "." 
    LD A,C                            ;0xcb81:   79  "y" 
;--------------------------------------
C_CB82:                               ; XREF: 0xCB46 
    ADD A,0x30                        ;0xcb82:   c6 30  ".0" 
    PUSH AF                           ;0xcb84:   f5  "." 
    CP 0x30                           ;0xcb85:   fe 30  ".0" 
    JR nz, C_CB8E                     ;0xcb87:   20 05  " ." 
    LD A,H                            ;0xcb89:   7c  "|" 
    CP 0                              ;0xcb8a:   fe 00  ".." 
    JR z, C_CB94                      ;0xcb8c:   28 06  "(." 
;--------------------------------------
C_CB8E:                               ; XREF: 0xCB87 
    POP AF                            ;0xcb8e:   f1  "." 
    CALL TXT_OUTPUT                   ;0xcb8f:   cd 5a bb  ".Z." 
    POP AF                            ;0xcb92:   f1  "." 
;--------------------------------------
C_CB93:                               ; XREF: 0xCB41 
    RET                               ;0xcb93:   c9  "." 
;--------------------------------------
C_CB94:                               ; XREF: 0xCB8C 
    LD A,0x20                         ;0xcb94:   3e 20  "> "  
    CALL TXT_OUTPUT                   ;0xcb96:   cd 5a bb  ".Z." 
    POP AF                            ;0xcb99:   f1  "." 
    POP AF                            ;0xcb9a:   f1  "." 
    RET                               ;0xcb9b:   c9  "." 
;--------------------------------------
C_CB9C:                               ; XREF: 0xCAEF 
    LD A,(IX+0)                       ;0xcb9c:   dd 7e 00  ".~." 
    LD (IY+0x19),A                    ;0xcb9f:   fd 77 19  ".w." 
    CP 0x10                           ;0xcba2:   fe 10  ".." 
    JP nc, C_CAF2                     ;0xcba4:   d2 f2 ca  "..." 
    LD C,(IX+0)                       ;0xcba7:   dd 4e 00  ".N." 
    LD (IY+0x19),A                    ;0xcbaa:   fd 77 19  ".w." 
    LD HL,ROM_TYPE                    ;0xcbad:   21 00 c0  "!.."  
    CALL C_CC1A                       ;0xcbb0:   cd 1a cc  "..." 
    CP 0x47                           ;0xcbb3:   fe 47  ".G" 
    CALL z, C_CBBC                    ;0xcbb5:   cc bc cb  "..." 
    CALL C_CBF7                       ;0xcbb8:   cd f7 cb  "..." 
    RET                               ;0xcbbb:   c9  "." 
;--------------------------------------
C_CBBC:                               ; XREF: 0xCBB5 
    CALL C_CB12                       ;0xcbbc:   cd 12 cb  "..." 
    LD HL,0xc100                      ;0xcbbf:   21 00 c1  "!.."  
;--------------------------------------
C_CBC2:                               ; XREF: 0xCBF5 
    LD A,0x20                         ;0xcbc2:   3e 20  "> "  
    CALL TXT_OUTPUT                   ;0xcbc4:   cd 5a bb  ".Z." 
    LD A,0x20                         ;0xcbc7:   3e 20  "> "  
    CALL TXT_OUTPUT                   ;0xcbc9:   cd 5a bb  ".Z." 
    CALL C_CBFE                       ;0xcbcc:   cd fe cb  "..." 
    PUSH HL                           ;0xcbcf:   e5  "." 
    LD HL,S_cc0c                      ;0xcbd0:   21 0c cc  "!.."  
    CALL C_CB34                       ;0xcbd3:   cd 34 cb  ".4." 
    POP HL                            ;0xcbd6:   e1  "." 
    LD DE,8                           ;0xcbd7:   11 08 00  "..."  
    ADD HL,DE                         ;0xcbda:   19  "." 
    CALL C_CC1A                       ;0xcbdb:   cd 1a cc  "..." 
    CP 0xff                           ;0xcbde:   fe ff  ".." 
    RET z                             ;0xcbe0:   c8  "." 
    CALL C_CBFE                       ;0xcbe1:   cd fe cb  "..." 
    PUSH HL                           ;0xcbe4:   e5  "." 
    POP HL                            ;0xcbe5:   e1  "." 
    LD DE,8                           ;0xcbe6:   11 08 00  "..."  
    ADD HL,DE                         ;0xcbe9:   19  "." 
    CALL C_CC1A                       ;0xcbea:   cd 1a cc  "..." 
    CP 0xff                           ;0xcbed:   fe ff  ".." 
    RET z                             ;0xcbef:   c8  "." 
    PUSH HL                           ;0xcbf0:   e5  "." 
    CALL C_CBF7                       ;0xcbf1:   cd f7 cb  "..." 
    POP HL                            ;0xcbf4:   e1  "." 
    JR C_CBC2                         ;0xcbf5:   18 cb  ".." 
;--------------------------------------
C_CBF7:                               ; XREF: 0xCBB8 
    LD HL,D_CC17                      ;0xcbf7:   21 17 cc  "!.."  
    CALL C_CB34                       ;0xcbfa:   cd 34 cb  ".4." 
    RET                               ;0xcbfd:   c9  "." 
;--------------------------------------
C_CBFE:                               ; XREF: 0xCBCC 
    LD B,8                            ;0xcbfe:   06 08  ".."  
;--------------------------------------
C_CC00:                               ; XREF: 0xCC09 
    PUSH BC                           ;0xcc00:   c5  "." 
    CALL C_CC1A                       ;0xcc01:   cd 1a cc  "..." 
    POP BC                            ;0xcc04:   c1  "." 
    CALL TXT_OUTPUT                   ;0xcc05:   cd 5a bb  ".Z." 
    INC HL                            ;0xcc08:   23  "#" 
    DJNZ C_CC00                       ;0xcc09:   10 f5  ".." 
    RET                               ;0xcc0b:   c9  "." 
;--------------------------------------
S_cc0c:                               ; XREF: 0xCBD0 
    DEFB 0x20                         ;0xcc0c:   
    DEFB "         $", 0x20           ;0xcc0d:   0xcc0d to 0xcc0e
    DEFB 0xa                          ;0xcc18:   0xa
    DEFB 0x24                         ;0xcc19:   "$"
;--------------------------------------
C_CC1A:                               ; XREF: 0xCB02 
;--------------------------------------
D_CC1C:                               ; XREF: 0xCAE4 
    PUSH BC                           ;0xcc1c:   c5  "." 
    CALL KL_CURR_SELECTION            ;0xcc1d:   cd 12 b9  "..." 
    LD C,A                            ;0xcc20:   4f  "O" 
    PUSH BC                           ;0xcc21:   c5  "." 
    LD A,(IY+0x19)                    ;0xcc22:   fd 7e 19  ".~." 
    LD C,A                            ;0xcc25:   4f  "O" 
    CALL KL_ROM_SELECT                ;0xcc26:   cd 0f b9  "..." 
    NOP                               ;0xcc29:   00  "." 
    LD A,(HL)                         ;0xcc2a:   7e  "~" 
    POP BC                            ;0xcc2b:   c1  "." 
    PUSH AF                           ;0xcc2c:   f5  "." 
    CALL KL_ROM_SELECT                ;0xcc2d:   cd 0f b9  "..." 
;--------------------------------------
C_CC30:                               ; XREF: 0xCC0E 
    POP AF                            ;0xcc30:   f1  "." 
    POP BC                            ;0xcc31:   c1  "." 
;--------------------------------------
C_CC32:                               ; XREF: 0xCC10 
    NOP                               ;0xcc32:   00  "." 
    NOP                               ;0xcc33:   00  "." 
;--------------------------------------
C_CC34:                               ; XREF: 0xCC12 
    RET                               ;0xcc34:   c9  "." 
;--------------------------------------
NOCPM:                                ; XREF: 0xC027 
    XOR A                             ;0xcc35:   af  "." 
;--------------------------------------
C_CC36:                               ; XREF: 0xCC14 
    LD (0x5000),A                     ;0xcc36:   32 00 50  "2.P"  
    LD (0x5001),A                     ;0xcc39:   32 01 50  "2.P"  
    CALL KL_CURR_SELECTION            ;0xcc3c:   cd 12 b9  "..." 
    LD (0x5000),A                     ;0xcc3f:   32 00 50  "2.P"  
    LD HL,CPM_PLUS_MSG                ;0xcc42:   21 93 cc  "!.."   - References: "CP/M PLUS"
    LD DE,0x5001                      ;0xcc45:   11 01 50  "..P"  
    LD BC,0x10                        ;0xcc48:   01 10 00  "..."  
    LDIR                              ;0xcc4b:   ed b0  ".." 
    LD HL,0x5001                      ;0xcc4d:   21 01 50  "!.P"  
    CALL KL_FIND_COMMAND              ;0xcc50:   cd d4 bc  "..." 
    JR nc, C_CC59                     ;0xcc53:   30 04  "0." 
    LD A,C                            ;0xcc55:   79  "y" 
    LD (0x5001),A                     ;0xcc56:   32 01 50  "2.P"  
;--------------------------------------
C_CC59:                               ; XREF: 0xCC53 
    LD HL,D_CC77                      ;0xcc59:   21 77 cc  "!w."  
    LD DE,0x5002                      ;0xcc5c:   11 02 50  "..P"  
    LD BC,0x1c                        ;0xcc5f:   01 1c 00  "..."  
    LDIR                              ;0xcc62:   ed b0  ".." 
    LD C,0                            ;0xcc64:   0e 00  ".."  
;--------------------------------------
C_CC66:                               ; XREF: 0xCC6E 
    CALL KL_PROBE_ROM                 ;0xcc66:   cd 15 b9  "..." 
    CP 0x80                           ;0xcc69:   fe 80  ".." 
    JR z, C_CC70                      ;0xcc6b:   28 03  "(." 
    INC C                             ;0xcc6d:   0c  "." 
    JR C_CC66                         ;0xcc6e:   18 f6  ".." 
;--------------------------------------
C_CC70:                               ; XREF: 0xCC6B 
    LD HL,0x5002                      ;0xcc70:   21 02 50  "!.P"  
    CALL MC_START_PROGRAM             ;0xcc73:   cd 16 bd  "..." 
    RST 0                             ;0xcc76:   c7  "." 
;--------------------------------------
D_CC77:                               ; XREF: 0xCC59 
    DEFB 0xe                          ;0xcc77:   0xe
    DEFB 0xf                          ;0xcc78:   0xf
;--------------------------------------
C_CC79:                               ; XREF: 0xCC8B 
    PUSH BC                           ;0xcc79:   c5  "." 
    LD A,(0x5000)                     ;0xcc7a:   3a 00 50  ":.P"  
    CP C                              ;0xcc7d:   b9  "." 
    JR z, C_CC89                      ;0xcc7e:   28 09  "(." 
    LD A,(0x5001)                     ;0xcc80:   3a 01 50  ":.P"  
    CP C                              ;0xcc83:   b9  "." 
    JR z, C_CC89                      ;0xcc84:   28 03  "(." 
    CALL KL_INIT_BACK                 ;0xcc86:   cd ce bc  "..." 
;--------------------------------------
C_CC89:                               ; XREF: 0xCC7E 
    POP BC                            ;0xcc89:   c1  "." 
    DEC C                             ;0xcc8a:   0d  "." 
    JR nz, C_CC79                     ;0xcc8b:   20 ec  " ." 
    LD SP,ROM_TYPE                    ;0xcc8d:   31 00 c0  "1.."  
    JP C_C00C                         ;0xcc90:   c3 0c c0  "..." 
;--------------------------------------
CPM_PLUS_MSG:                         ; XREF: 0xCC42 
    DEFB "CP/M PLUS", '2' + 0x80      ;0xcc93:   0xcc93 to 0xcc9f
;--------------------------------------
C_CC9D:                               ; XREF: 0xC1F6 
    LD L,(IX+0)                       ;0xcc9d:   dd 6e 00  ".n." 
    LD H,(IX+1)                       ;0xcca0:   dd 66 01  ".f." 
    LD A,(HL)                         ;0xcca3:   7e  "~" 
    CP 0x81                           ;0xcca4:   fe 81  ".." 
    JP nc, C_C1F9                     ;0xcca6:   d2 f9 c1  "..." 
    CP 0                              ;0xcca9:   fe 00  ".." 
    JP z, C_C1F9                      ;0xccab:   ca f9 c1  "..." 
    LD (0x4f),A                       ;0xccae:   32 4f 00  "2O."  
    INC HL                            ;0xccb1:   23  "#" 
    LD E,(HL)                         ;0xccb2:   5e  "^" 
    INC HL                            ;0xccb3:   23  "#" 
    LD D,(HL)                         ;0xccb4:   56  "V" 
    EX DE,HL                          ;0xccb5:   eb  "." 
    LD DE,0xbf00                      ;0xccb6:   11 00 bf  "..."  
    LD BC,0x80                        ;0xccb9:   01 80 00  "..."  
    LDIR                              ;0xccbc:   ed b0  ".." 
    CALL C_C1FF                       ;0xccbe:   cd ff c1  "..." 
    LD A,0xc3                         ;0xccc1:   3e c3  ">."  
    LD HL,0xf80                       ;0xccc3:   21 80 0f  "!.."  
    LD (0x6379),A                     ;0xccc6:   32 79 63  "2yc"  
    LD (0x637a),HL                    ;0xccc9:   22 7a 63  ""zc"  
;--------------------------------------
C_CCCC:                               ; XREF: 0xF5E5 
    LD A,(0x4f)                       ;0xcccc:   3a 4f 00  ":O."  
    LD (0x6e57),A                     ;0xcccf:   32 57 6e  "2Wn"  
    LD HL,0xbf00                      ;0xccd2:   21 00 bf  "!.."  
    LD DE,0x6e58                      ;0xccd5:   11 58 6e  ".Xn"  
    LD B,0                            ;0xccd8:   06 00  ".."  
    LD A,(0x4f)                       ;0xccda:   3a 4f 00  ":O."  
    LD C,A                            ;0xccdd:   4f  "O" 
    LDIR                              ;0xccde:   ed b0  ".." 
    LD A,0x21                         ;0xcce0:   3e 21  ">!"  
    LD HL,0x4fc                       ;0xcce2:   21 fc 04  "!.."  
    LD (0x6376),A                     ;0xcce5:   32 76 63  "2vc"  
    LD (0x6377),HL                    ;0xcce8:   22 77 63  ""wc"  
    JP C_C369                         ;0xcceb:   c3 69 c3  ".i." 
;--------------------------------------
D_CCEE:                               ; XREF: 0xC250 
    LD A,0xcd                         ;0xccee:   3e cd  ">."  
    LD HL,0x94e                       ;0xccf0:   21 4e 09  "!N."  
    LD (0x581),A                      ;0xccf3:   32 81 05  "2.."  
    LD (0x582),HL                     ;0xccf6:   22 82 05  "".."  
    LD HL,0xdf4                       ;0xccf9:   21 f4 0d  "!.."  
    LD (HL),0xe7                      ;0xccfc:   36 e7  "6."  
    LD DE,0xdf6                       ;0xccfe:   11 f6 0d  "..."  
    LD HL,0xfd8                       ;0xcd01:   21 d8 0f  "!.."  
    LD B,0                            ;0xcd04:   06 00  ".."  
    LD A,(0xfd7)                      ;0xcd06:   3a d7 0f  ":.."  
    LD C,A                            ;0xcd09:   4f  "O" 
    LDIR                              ;0xcd0a:   ed b0  ".." 
    LD HL,0x506                       ;0xcd0c:   21 06 05  "!.."  
    LD (0x4ed),HL                     ;0xcd0f:   22 ed 04  "".."  
    LD A,(0xfd7)                      ;0xcd12:   3a d7 0f  ":.."  
    LD (0xdf5),A                      ;0xcd15:   32 f5 0d  "2.."  
    LD HL,0xdf7                       ;0xcd18:   21 f7 0d  "!.."  
    CALL 0xcb0                        ;0xcd1b:   cd b0 0c  "..." 
    LD A,0x24                         ;0xcd1e:   3e 24  ">$"  
    DEC HL                            ;0xcd20:   2b  "+" 
    LD (HL),A                         ;0xcd21:   77  "w" 
    LD A,0x41                         ;0xcd22:   3e 41  ">A"  
    CALL 0xca6                        ;0xcd24:   cd a6 0c  "..." 
    LD A,0x3e                         ;0xcd27:   3e 3e  ">>"  
    CALL 0xca6                        ;0xcd29:   cd a6 0c  "..." 
    LD DE,0xdf6                       ;0xcd2c:   11 f6 0d  "..."  
    LD C,9                            ;0xcd2f:   0e 09  ".."  
    CALL 0x5                          ;0xcd31:   cd 05 00  "..." 
    CALL 0xc09                        ;0xcd34:   cd 09 0c  "..." 
    LD A,(0xfd7)                      ;0xcd37:   3a d7 0f  ":.."  
    LD HL,0xdf6                       ;0xcd3a:   21 f6 0d  "!.."  
    CALL 0xcb0                        ;0xcd3d:   cd b0 0c  "..." 
    XOR A                             ;0xcd40:   af  "." 
    LD (HL),A                         ;0xcd41:   77  "w" 
    JP 0x58b                          ;0xcd42:   c3 8b 05  "..." 
    NOP                               ;0xcd45:   00  "." 
    NOP                               ;0xcd46:   00  "." 
    NOP                               ;0xcd47:   00  "." 
    NOP                               ;0xcd48:   00  "." 
    NOP                               ;0xcd49:   00  "." 
    NOP                               ;0xcd4a:   00  "." 
    NOP                               ;0xcd4b:   00  "." 
    NOP                               ;0xcd4c:   00  "." 
    NOP                               ;0xcd4d:   00  "." 
    NOP                               ;0xcd4e:   00  "." 
    NOP                               ;0xcd4f:   00  "." 
    NOP                               ;0xcd50:   00  "." 
    NOP                               ;0xcd51:   00  "." 
    NOP                               ;0xcd52:   00  "." 
    NOP                               ;0xcd53:   00  "." 
    NOP                               ;0xcd54:   00  "." 
    NOP                               ;0xcd55:   00  "." 
    NOP                               ;0xcd56:   00  "." 
    NOP                               ;0xcd57:   00  "." 
    NOP                               ;0xcd58:   00  "." 
    NOP                               ;0xcd59:   00  "." 
    NOP                               ;0xcd5a:   00  "." 
    NOP                               ;0xcd5b:   00  "." 
    NOP                               ;0xcd5c:   00  "." 
    NOP                               ;0xcd5d:   00  "." 
    NOP                               ;0xcd5e:   00  "." 
    NOP                               ;0xcd5f:   00  "." 
    NOP                               ;0xcd60:   00  "." 
    NOP                               ;0xcd61:   00  "." 
    NOP                               ;0xcd62:   00  "." 
    NOP                               ;0xcd63:   00  "." 
    NOP                               ;0xcd64:   00  "." 
    NOP                               ;0xcd65:   00  "." 
    NOP                               ;0xcd66:   00  "." 
    NOP                               ;0xcd67:   00  "." 
    NOP                               ;0xcd68:   00  "." 
    NOP                               ;0xcd69:   00  "." 
    NOP                               ;0xcd6a:   00  "." 
    NOP                               ;0xcd6b:   00  "." 
    NOP                               ;0xcd6c:   00  "." 
    NOP                               ;0xcd6d:   00  "." 
    NOP                               ;0xcd6e:   00  "." 
    NOP                               ;0xcd6f:   00  "." 
    NOP                               ;0xcd70:   00  "." 
    NOP                               ;0xcd71:   00  "." 
    NOP                               ;0xcd72:   00  "." 
    NOP                               ;0xcd73:   00  "." 
    NOP                               ;0xcd74:   00  "." 
    NOP                               ;0xcd75:   00  "." 
    NOP                               ;0xcd76:   00  "." 
    NOP                               ;0xcd77:   00  "." 
    NOP                               ;0xcd78:   00  "." 
    NOP                               ;0xcd79:   00  "." 
    NOP                               ;0xcd7a:   00  "." 
    NOP                               ;0xcd7b:   00  "." 
    NOP                               ;0xcd7c:   00  "." 
    NOP                               ;0xcd7d:   00  "." 
    NOP                               ;0xcd7e:   00  "." 
    NOP                               ;0xcd7f:   00  "." 
    NOP                               ;0xcd80:   00  "." 
    NOP                               ;0xcd81:   00  "." 
    NOP                               ;0xcd82:   00  "." 
    NOP                               ;0xcd83:   00  "." 
    NOP                               ;0xcd84:   00  "." 
    NOP                               ;0xcd85:   00  "." 
    NOP                               ;0xcd86:   00  "." 
    NOP                               ;0xcd87:   00  "." 
    NOP                               ;0xcd88:   00  "." 
    NOP                               ;0xcd89:   00  "." 
    NOP                               ;0xcd8a:   00  "." 
    NOP                               ;0xcd8b:   00  "." 
    NOP                               ;0xcd8c:   00  "." 
    NOP                               ;0xcd8d:   00  "." 
    NOP                               ;0xcd8e:   00  "." 
    NOP                               ;0xcd8f:   00  "." 
    NOP                               ;0xcd90:   00  "." 
    NOP                               ;0xcd91:   00  "." 
    NOP                               ;0xcd92:   00  "." 
    NOP                               ;0xcd93:   00  "." 
    NOP                               ;0xcd94:   00  "." 
    NOP                               ;0xcd95:   00  "." 
    NOP                               ;0xcd96:   00  "." 
    NOP                               ;0xcd97:   00  "." 
    NOP                               ;0xcd98:   00  "." 
    NOP                               ;0xcd99:   00  "." 
    NOP                               ;0xcd9a:   00  "." 
    NOP                               ;0xcd9b:   00  "." 
    NOP                               ;0xcd9c:   00  "." 
    NOP                               ;0xcd9d:   00  "." 
    NOP                               ;0xcd9e:   00  "." 
    NOP                               ;0xcd9f:   00  "." 
    NOP                               ;0xcda0:   00  "." 
    NOP                               ;0xcda1:   00  "." 
    NOP                               ;0xcda2:   00  "." 
    NOP                               ;0xcda3:   00  "." 
    NOP                               ;0xcda4:   00  "." 
    NOP                               ;0xcda5:   00  "." 
    NOP                               ;0xcda6:   00  "." 
    NOP                               ;0xcda7:   00  "." 
    NOP                               ;0xcda8:   00  "." 
    NOP                               ;0xcda9:   00  "." 
    NOP                               ;0xcdaa:   00  "." 
    NOP                               ;0xcdab:   00  "." 
    NOP                               ;0xcdac:   00  "." 
    NOP                               ;0xcdad:   00  "." 
    NOP                               ;0xcdae:   00  "." 
    NOP                               ;0xcdaf:   00  "." 
    NOP                               ;0xcdb0:   00  "." 
    NOP                               ;0xcdb1:   00  "." 
    NOP                               ;0xcdb2:   00  "." 
    NOP                               ;0xcdb3:   00  "." 
    NOP                               ;0xcdb4:   00  "." 
    NOP                               ;0xcdb5:   00  "." 
    NOP                               ;0xcdb6:   00  "." 
    NOP                               ;0xcdb7:   00  "." 
    NOP                               ;0xcdb8:   00  "." 
    NOP                               ;0xcdb9:   00  "." 
    NOP                               ;0xcdba:   00  "." 
    NOP                               ;0xcdbb:   00  "." 
    NOP                               ;0xcdbc:   00  "." 
    NOP                               ;0xcdbd:   00  "." 
    NOP                               ;0xcdbe:   00  "." 
    NOP                               ;0xcdbf:   00  "." 
    NOP                               ;0xcdc0:   00  "." 
    NOP                               ;0xcdc1:   00  "." 
    NOP                               ;0xcdc2:   00  "." 
    NOP                               ;0xcdc3:   00  "." 
    NOP                               ;0xcdc4:   00  "." 
    NOP                               ;0xcdc5:   00  "." 
    NOP                               ;0xcdc6:   00  "." 
;--------------------------------------
BUILTIN_COMMANDS:                     ; XREF: 0xC300 
    DEFB "DIR TYPE ERASE RENAME SHOW DIRSYS USER 24LINE 25LINE AMSDOS BUILTIN BORDER CAT CKEY CLS DATE DETAILS EXPAND HOME INK INVERSE KDS LANGUAGE LPRINT MODE NKEY NORMAL PALETTE PAPER PEN ROMCAT SETLST SET24X80 SIGNON SKEY WAIT ", 0x00  ;0xcdc7:   0xcdc7 to 0xcea6
;--------------------------------------
C_CEA4:                               ; XREF: 0xCEA2 
    LD (HL),L                         ;0xcea4:   75  "u" 
    LD B,0xf4                         ;0xcea5:   06 f4  ".."  
    LD B,0x83                         ;0xcea7:   06 83  ".."  
    RLA                               ;0xcea9:   17  "." 
    OR D                              ;0xceaa:   b2  "." 
    RLA                               ;0xceab:   17  "." 
;--------------------------------------
C_CEAC:                               ; XREF: 0xCE5C 
    LD C,0x16                         ;0xceac:   0e 16  ".."  
    LD A,L                            ;0xceae:   7d  "}" 
    LD B,0x7e                         ;0xceaf:   06 7e  ".~"  
;--------------------------------------
C_CEB1:                               ; XREF: 0xCE61 
    LD DE,0x1281                      ;0xceb1:   11 81 12  "..."  
    LD (HL),D                         ;0xceb4:   72  "r" 
    LD (DE),A                         ;0xceb5:   12  "." 
;--------------------------------------
C_CEB6:                               ; XREF: 0xCEBD 
    LD C,(HL)                         ;0xceb6:   4e  "N" 
    INC D                             ;0xceb7:   14  "." 
    CP A                              ;0xceb8:   bf  "." 
    LD DE,0x1434                      ;0xceb9:   11 34 14  ".4."  
    DEC C                             ;0xcebc:   0d  "." 
    JR C_CEB6                         ;0xcebd:   18 f7  ".." 
    LD DE,0x1300                      ;0xcebf:   11 00 13  "..."  
;--------------------------------------
C_CEC2:                               ; XREF: 0xCE70 
    AND (HL)                          ;0xcec2:   a6  "." 
    DEC DE                            ;0xcec3:   1b  "." 
    RET nc                            ;0xcec4:   d0  "." 
    ADD HL,DE                         ;0xcec5:   19  "." 
    SUB D                             ;0xcec6:   92  "." 
    INC D                             ;0xcec7:   14  "." 
;--------------------------------------
C_CEC8:                               ; XREF: 0xCE76 
    RST 0x30                          ;0xcec8:   f7  "." 
    LD (DE),A                         ;0xcec9:   12  "." 
    ADD A,H                           ;0xceca:   84  "." 
    INC DE                            ;0xcecb:   13  "." 
    DEC BC                            ;0xcecc:   0b  "." 
    INC DE                            ;0xcecd:   13  "." 
;--------------------------------------
C_CECE:                               ; XREF: 0xCE7A 
    LD (d_d315),A                     ;0xcece:   32 15 d3  "2.."  
    LD (DE),A                         ;0xced1:   12  "." 
    SBC A,C                           ;0xced2:   99  "." 
    DEC D                             ;0xced3:   15  "." 
    ADD A,A                           ;0xced4:   87  "." 
    LD (DE),A                         ;0xced5:   12  "." 
;--------------------------------------
C_CED6:                               ; XREF: 0xCE81 
    JP p, 0x1411                      ;0xced6:   f2 11 14  "..." 
    INC DE                            ;0xced9:   13  "." 
    JR z, $+21                        ;0xceda:   28 13  "(." 
    RST 0x30                          ;0xcedc:   f7  "." 
;--------------------------------------
C_CEDD:                               ; XREF: 0xCE88 
    INC DE                            ;0xcedd:   13  "." 
    RST 8                             ;0xcede:   cf  "." 
    INC DE                            ;0xcedf:   13  "." 
    CALL nz, 0x6a20                   ;0xcee0:   c4 20 6a  ". j" 
    INC D                             ;0xcee3:   14  "." 
    LD D,H                            ;0xcee4:   54  "T" 
;--------------------------------------
C_CEE5:                               ; XREF: 0xCEE7 
    LD (DE),A                         ;0xcee5:   12  "." 
;--------------------------------------
C_CEE6:                               ; XREF: 0xCE91 
    DEC HL                            ;0xcee6:   2b  "+" 
    JR nz, C_CEE5                     ;0xcee7:   20 fc  " ." 
    LD DE,0x11e9                      ;0xcee9:   11 e9 11  "..."  
    LD A,0x10                         ;0xceec:   3e 10  ">."  
    LD (0xc86),A                      ;0xceee:   32 86 0c  "2.."  
    LD DE,0x1190                      ;0xcef1:   11 90 11  "..."  
    CALL 0x7ab                        ;0xcef4:   cd ab 07  "..." 
    CALL 0xc52                        ;0xcef7:   cd 52 0c  ".R." 
    RET z                             ;0xcefa:   c8  "." 
    JP 0x61a                          ;0xcefb:   c3 1a 06  "..." 
;--------------------------------------
USER_MSG_BUILTIN_MSG:                 ; XREF: 
    DEFB "User No.(0-15) :$   Built in Commands are :-", 0x0d  ;0xcefe:   0xcefe to 0xcf2d
    DEFB 0xa                          ;0xcf2b:   0xa
    DEFB 0x24                         ;0xcf2c:   
    DEFB 0x11                         ;0xcf2d:   0x11
    DEFB 0xa1                         ;0xcf2e:   
    DEFB 0x11                         ;0xcf2f:   0x11
    DEFB 0xcd                         ;0xcf30:   
;--------------------------------------
C_CF31:                               ; XREF: 0xCF0F 
    LD (HL),L                         ;0xcf31:   75  "u" 
    LD (DE),A                         ;0xcf32:   12  "." 
    LD HL,0x1059                      ;0xcf33:   21 59 10  "!Y."  
;--------------------------------------
C_CF36:                               ; XREF: 0xCF07 
    LD B,9                            ;0xcf36:   06 09  ".."  
;--------------------------------------
C_CF38:                               ; XREF: 0xCF42 
    LD A,(HL)                         ;0xcf38:   7e  "~" 
    CP 0x20                           ;0xcf39:   fe 20  ". " 
    JR z, C_CF44                      ;0xcf3b:   28 07  "(." 
    DEC B                             ;0xcf3d:   05  "." 
    INC HL                            ;0xcf3e:   23  "#" 
    CALL 0xca6                        ;0xcf3f:   cd a6 0c  "..." 
    JR C_CF38                         ;0xcf42:   18 f4  ".." 
;--------------------------------------
C_CF44:                               ; XREF: 0xCF3B 
    INC HL                            ;0xcf44:   23  "#" 
    LD A,(HL)                         ;0xcf45:   7e  "~" 
    CP 0                              ;0xcf46:   fe 00  ".." 
;--------------------------------------
C_CF48:                               ; XREF: 0xCF0C 
    JP z, 0xc09                       ;0xcf48:   ca 09 0c  "..." 
    LD A,0x2c                         ;0xcf4b:   3e 2c  ">,"  
    CALL 0xca6                        ;0xcf4d:   cd a6 0c  "..." 
;--------------------------------------
C_CF50:                               ; XREF: 0xCF53 
    CALL 0xca4                        ;0xcf50:   cd a4 0c  "..." 
    DJNZ C_CF50                       ;0xcf53:   10 fb  ".." 
;--------------------------------------
C_CF55:                               ; XREF: 0xCF11 
    JR C_CF36                         ;0xcf55:   18 df  ".." 
    LD DE,0xd26                       ;0xcf57:   11 26 0d  ".&."  
    CALL 0x941                        ;0xcf5a:   cd 41 09  ".A." 
    JP 0xc09                          ;0xcf5d:   c3 09 0c  "..." 
    LD HL,0xbb27                      ;0xcf60:   21 27 bb  "!'."  
;--------------------------------------
C_CF63:                               ; XREF: 0xCF27 
    JR C_CF6D                         ;0xcf63:   18 08  ".." 
    LD HL,0xbb33                      ;0xcf65:   21 33 bb  "!3."  
    JR C_CF6D                         ;0xcf68:   18 03  ".." 
    LD HL,KM_SET_SHIFT                ;0xcf6a:   21 2d bb  "!-."  
;--------------------------------------
C_CF6D:                               ; XREF: 0xCF63 
    LD (0x1251),HL                    ;0xcf6d:   22 51 12  ""Q."  
    LD A,0x50                         ;0xcf70:   3e 50  ">P"  
    LD (0xc86),A                      ;0xcf72:   32 86 0c  "2.."  
    LD DE,0x1224                      ;0xcf75:   11 24 12  ".$."  
    CALL 0x7ab                        ;0xcf78:   cd ab 07  "..." 
    CALL 0xc52                        ;0xcf7b:   cd 52 0c  ".R." 
    RET z                             ;0xcf7e:   c8  "." 
    LD (0x13ad),A                     ;0xcf7f:   32 ad 13  "2.."  
;--------------------------------------
C_CF82:                               ; XREF: 0xCF17 
    LD A,0xff                         ;0xcf82:   3e ff  ">."  
    LD (0xc86),A                      ;0xcf84:   32 86 0c  "2.."  
    CALL 0xc52                        ;0xcf87:   cd 52 0c  ".R." 
    RET z                             ;0xcf8a:   c8  "." 
    LD B,A                            ;0xcf8b:   47  "G" 
    LD A,(0x13ad)                     ;0xcf8c:   3a ad 13  ":.."  
    JP 0x1240                         ;0xcf8f:   c3 40 12  ".@." 
;--------------------------------------
S_cf92:                               ; XREF: 
    DEFB "Key No.(0-79),Char(0-254) :$", 'e' + 0x80  ;0xcf92:   0xcf92 to 0xcfb1
    DEFB 0xd5                         ;0xcfaf:   
    DEFB 0x2a                         ;0xcfb0:   
    DEFB 0x1                          ;0xcfb1:   0x1
    DEFB 0x0                          ;0xcfb2:   
    DEFB 0x11                         ;0xcfb3:   0x11
    DEFB 0x57                         ;0xcfb4:   
    DEFB 0x0                          ;0xcfb5:   
    DEFB 0x19                         ;0xcfb6:   0x19
    DEFB 0x22                         ;0xcfb7:   
    DEFB 0x4f                         ;0xcfb8:   
    DEFB 0x12                         ;0xcfb9:   0x12
    DEFB 0xd1                         ;0xcfba:   
    DEFB 0xe1                         ;0xcfbb:   
    DEFB 0xcd                         ;0xcfbc:   
    DEFB 0x0                          ;0xcfbd:   
    DEFB 0x0                          ;0xcfbe:   
    DEFB 0x0                          ;0xcfbf:   
    DEFB 0x0                          ;0xcfc0:   
    DEFB 0xc9                         ;0xcfc1:   
    DEFB 0xcd                         ;0xcfc2:   
    DEFB 0xe9                         ;0xcfc3:   
    DEFB 0x15                         ;0xcfc4:   0x15
    DEFB 0x79                         ;0xcfc5:   
    DEFB 0xfe                         ;0xcfc6:   
    DEFB 0x1                          ;0xcfc7:   0x1
    DEFB 0xc2                         ;0xcfc8:   
;--------------------------------------
C_CFC9:                               ; XREF: 0xCF9A 
    LD H,D                            ;0xcfc9:   62  "b" 
    LD (DE),A                         ;0xcfca:   12  "." 
    CALL 0x1281                       ;0xcfcb:   cd 81 12  "..." 
    JR C_CFD3                         ;0xcfce:   18 03  ".." 
    CALL 0x1272                       ;0xcfd0:   cd 72 12  ".r." 
;--------------------------------------
C_CFD3:                               ; XREF: 0xCFCE 
    LD DE,0x126e                      ;0xcfd3:   11 6e 12  ".n."  
;--------------------------------------
C_CFD6:                               ; XREF: 0xCFA4 
    CALL 0x1275                       ;0xcfd6:   cd 75 12  ".u." 
    JP 0x12bb                         ;0xcfd9:   c3 bb 12  "..." 
    DEC DE                            ;0xcfdc:   1b  "." 
    INC SP                            ;0xcfdd:   33  "3" 
    LD (0x1124),HL                    ;0xcfde:   22 24 11  ""$."  
    LD A,E                            ;0xcfe1:   7b  "{" 
    LD (DE),A                         ;0xcfe2:   12  "." 
    LD C,9                            ;0xcfe3:   0e 09  ".."  
;--------------------------------------
C_CFE5:                               ; XREF: 0xCF95 
    CALL 0x5                          ;0xcfe5:   cd 05 00  "..." 
    RET                               ;0xcfe8:   c9  "." 
    DEC DE                            ;0xcfe9:   1b  "." 
    JR nc, $+38                       ;0xcfea:   30 24  "0$" 
    DEC DE                            ;0xcfec:   1b  "." 
    LD SP,0x1124                      ;0xcfed:   31 24 11  "1$."  
    LD A,(HL)                         ;0xcff0:   7e  "~" 
    LD (DE),A                         ;0xcff1:   12  "." 
    JP 0x1275                         ;0xcff2:   c3 75 12  ".u." 
    LD A,3                            ;0xcff5:   3e 03  ">."  
    LD (0xc86),A                      ;0xcff7:   32 86 0c  "2.."  
    LD DE,0x12ab                      ;0xcffa:   11 ab 12  "..."  
    LD A,0x33                         ;0xcffd:   3e 33  ">3"  
    LD (0x12a8),A                     ;0xcfff:   32 a8 12  "2.."  
    CALL 0x7ab                        ;0xd002:   cd ab 07  "..." 
    CALL 0xc52                        ;0xd005:   cd 52 0c  ".R." 
    RET z                             ;0xd008:   c8  "." 
    LD (0x12a9),A                     ;0xd009:   32 a9 12  "2.."  
    LD DE,0x12a7                      ;0xd00c:   11 a7 12  "..."  
    CALL 0x1275                       ;0xd00f:   cd 75 12  ".u." 
    JP 0x12bb                         ;0xd012:   c3 bb 12  "..." 
    DEC DE                            ;0xd015:   1b  "." 
    INC SP                            ;0xd016:   33  "3" 
    NOP                               ;0xd017:   00  "." 
;--------------------------------------
S_d018:                               ; XREF: 
    DEFB "$Mode No.(0-2) :$*"         ;0xd018:   0xd018 to 0xd02a
    DEFB 0x1                          ;0xd02a:   0x1
    DEFB 0x0                          ;0xd02b:   
    DEFB 0x11                         ;0xd02c:   0x11
    DEFB 0x57                         ;0xd02d:   
    DEFB 0x0                          ;0xd02e:   
    DEFB 0x19                         ;0xd02f:   0x19
    DEFB 0x22                         ;0xd030:   
    DEFB 0xc6                         ;0xd031:   
    DEFB 0x12                         ;0xd032:   0x12
    DEFB 0xcd                         ;0xd033:   
    DEFB 0x0                          ;0xd034:   
    DEFB 0x0                          ;0xd035:   
    DEFB 0x11                         ;0xd036:   0x11
    DEFB 0xbc                         ;0xd037:   
    DEFB 0xd9                         ;0xd038:   
    DEFB 0xe                          ;0xd039:   0xe
    DEFB 0x8c                         ;0xd03a:   
    DEFB 0xb1                         ;0xd03b:   
    DEFB 0x4f                         ;0xd03c:   
    DEFB 0xed                         ;0xd03d:   
    DEFB 0x49                         ;0xd03e:   
    DEFB 0xd9                         ;0xd03f:   
    DEFB 0xc9                         ;0xd040:   
    DEFB 0x3e                         ;0xd041:   
    DEFB 0x8                          ;0xd042:   0x8
    DEFB 0x32                         ;0xd043:   
    DEFB 0x86                         ;0xd044:   
    DEFB 0xc                          ;0xd045:   0xc
    DEFB 0x11                         ;0xd046:   0x11
    DEFB 0xe3                         ;0xd047:   
    DEFB 0x12                         ;0xd048:   0x12
    DEFB ">22", 0x32                  ;0xd049:   0xd049 to 0xd04a
    DEFB 0x12                         ;0xd04d:   0x12
    DEFB 0xc3                         ;0xd04e:   
;--------------------------------------
C_D04F:                               ; XREF: 0xC03F 
    SUB H                             ;0xd04f:   94  "." 
    LD (DE),A                         ;0xd050:   12  "." 
;--------------------------------------
S_d051:                               ; XREF: 0xD022 
    DEFB "Language No.(0-7) :$"       ;0xd051:   0xd051 to 0xd065
    DEFB 0x11                         ;0xd065:   0x11
    DEFB 0xfd                         ;0xd066:   
    DEFB 0x12                         ;0xd067:   0x12
    DEFB 0xc3                         ;0xd068:   
    DEFB 0x75                         ;0xd069:   
    DEFB 0x12                         ;0xd06a:   0x12
    DEFB 0x1b                         ;0xd06b:   0x1b
    DEFB 0x48                         ;0xd06c:   
;--------------------------------------
C_D06D:                               ; XREF: 0xD01D 
    INC H                             ;0xd06d:   24  "$" 
    LD DE,0x1306                      ;0xd06e:   11 06 13  "..."  
    JP 0x1275                         ;0xd071:   c3 75 12  ".u." 
    DEC DE                            ;0xd074:   1b  "." 
    LD B,L                            ;0xd075:   45  "E" 
    DEC DE                            ;0xd076:   1b  "." 
    LD C,B                            ;0xd077:   48  "H" 
    INC H                             ;0xd078:   24  "$" 
    LD DE,0x1311                      ;0xd079:   11 11 13  "..."  
    JP 0x1275                         ;0xd07c:   c3 75 12  ".u." 
    DEC DE                            ;0xd07f:   1b  "." 
    LD (HL),B                         ;0xd080:   70  "p" 
    INC H                             ;0xd081:   24  "$" 
    LD DE,0x131a                      ;0xd082:   11 1a 13  "..."  
    JP 0x1275                         ;0xd085:   c3 75 12  ".u." 
    DEC DE                            ;0xd088:   1b  "." 
    LD (HL),C                         ;0xd089:   71  "q" 
    INC H                             ;0xd08a:   24  "$" 
    JP z, 0xa55                       ;0xd08b:   ca 55 0a  ".U." 
    CP 0x2c                           ;0xd08e:   fe 2c  ".," 
    JP z, 0xa55                       ;0xd090:   ca 55 0a  ".U." 
    JP 0xa52                          ;0xd093:   c3 52 0a  ".R." 
    LD A,0x40                         ;0xd096:   3e 40  ">@"  
    LD (0xc86),A                      ;0xd098:   32 86 0c  "2.."  
    LD DE,0x1351                      ;0xd09b:   11 51 13  ".Q."  
;--------------------------------------
C_D09E:                               ; XREF: 0xD062 
    CALL 0x7ab                        ;0xd09e:   cd ab 07  "..." 
    CALL 0xc52                        ;0xd0a1:   cd 52 0c  ".R." 
    RET z                             ;0xd0a4:   c8  "." 
    ADD A,0x20                        ;0xd0a5:   c6 20  ". " 
    LD (0x137e),A                     ;0xd0a7:   32 7e 13  "2~."  
    LD DE,0x137c                      ;0xd0aa:   11 7c 13  ".|."  
    CALL 0x1275                       ;0xd0ad:   cd 75 12  ".u." 
    CALL 0xc52                        ;0xd0b0:   cd 52 0c  ".R." 
    RET z                             ;0xd0b3:   c8  "." 
    ADD A,0x20                        ;0xd0b4:   c6 20  ". " 
    LD (0x1382),A                     ;0xd0b6:   32 82 13  "2.."  
    LD DE,0x1380                      ;0xd0b9:   11 80 13  "..."  
    JP 0x1275                         ;0xd0bc:   c3 75 12  ".u." 
;--------------------------------------
S_d0bf:                               ; XREF: 
    DEFB "First ink No.(0-63),Second ink No.(0-63) :$"  ;0xd0bf:   0xd0bf to 0xd0ea
    DEFB 0x1b                         ;0xd0ea:   0x1b
    DEFB 0x63                         ;0xd0eb:   
    DEFB 0x0                          ;0xd0ec:   
    DEFB 0x24                         ;0xd0ed:   
    DEFB 0x1b                         ;0xd0ee:   0x1b
    DEFB 0x62                         ;0xd0ef:   
    DEFB 0x0                          ;0xd0f0:   
    DEFB "$!2", 0x21                  ;0xd0f1:   0xd0f1 to 0xd0f2
    DEFB 0x22                         ;0xd0f5:   
    DEFB 0x51                         ;0xd0f6:   
    DEFB 0x12                         ;0xd0f7:   0x12
    DEFB 0x3e                         ;0xd0f8:   
    DEFB 0x10                         ;0xd0f9:   0x10
    DEFB 0x32                         ;0xd0fa:   
    DEFB 0x86                         ;0xd0fb:   
;--------------------------------------
C_D0FC:                               ; XREF: 0xD0CD 
    INC C                             ;0xd0fc:   0c  "." 
    LD DE,0x13ae                      ;0xd0fd:   11 ae 13  "..."  
    CALL 0x7ab                        ;0xd100:   cd ab 07  "..." 
    CALL 0xc52                        ;0xd103:   cd 52 0c  ".R." 
    RET z                             ;0xd106:   c8  "." 
    LD (0x13ad),A                     ;0xd107:   32 ad 13  "2.."  
    LD A,0x1b                         ;0xd10a:   3e 1b  ">."  
    LD (0xc86),A                      ;0xd10c:   32 86 0c  "2.."  
    CALL 0xc52                        ;0xd10f:   cd 52 0c  ".R." 
    RET z                             ;0xd112:   c8  "." 
    LD B,A                            ;0xd113:   47  "G" 
    LD C,B                            ;0xd114:   48  "H" 
    LD A,(0x13ad)                     ;0xd115:   3a ad 13  ":.."  
;--------------------------------------
C_D118:                               ; XREF: 0xD0C8 
    JP 0x1240                         ;0xd118:   c3 40 12  ".@." 
    NOP                               ;0xd11b:   00  "." 
;--------------------------------------
S_d11c:                               ; XREF: 
    DEFB "Ink No.(0-15),Colour No.(0-26) :$!"  ;0xd11c:   0xd11c to 0xd13e
    DEFB 0xbb                         ;0xd13f:   
    DEFB 0x22                         ;0xd140:   
    DEFB 0x51                         ;0xd141:   
    DEFB 0x12                         ;0xd142:   0x12
    DEFB 0x3e                         ;0xd143:   
;--------------------------------------
C_D144:                               ; XREF: 0xD0D9 
    DJNZ $+52                         ;0xd144:   10 32  ".2" 
    ADD A,(HL)                        ;0xd146:   86  "." 
    INC C                             ;0xd147:   0c  "." 
    LD DE,0x13e7                      ;0xd148:   11 e7 13  "..."  
    CALL 0x7ab                        ;0xd14b:   cd ab 07  "..." 
    CALL 0xc52                        ;0xd14e:   cd 52 0c  ".R." 
    RET z                             ;0xd151:   c8  "." 
    JP 0x1240                         ;0xd152:   c3 40 12  ".@." 
;--------------------------------------
S_d155:                               ; XREF: 
    DEFB "Pen No.(0-15) :$!"          ;0xd155:   0xd155 to 0xd166
    DEFB 0xbb                         ;0xd167:   
    DEFB 0x22                         ;0xd168:   
    DEFB 0x51                         ;0xd169:   
    DEFB 0x12                         ;0xd16a:   0x12
    DEFB 0x3e                         ;0xd16b:   
    DEFB 0x10                         ;0xd16c:   0x10
    DEFB 0x32                         ;0xd16d:   
    DEFB 0x86                         ;0xd16e:   
;--------------------------------------
C_D16F:                               ; XREF: 0xD11F 
    INC C                             ;0xd16f:   0c  "." 
    LD DE,0x140f                      ;0xd170:   11 0f 14  "..."  
    CALL 0x7ab                        ;0xd173:   cd ab 07  "..." 
;--------------------------------------
C_D176:                               ; XREF: 0xD13A 
    CALL 0xc52                        ;0xd176:   cd 52 0c  ".R." 
    RET z                             ;0xd179:   c8  "." 
    JP 0x1240                         ;0xd17a:   c3 40 12  ".@." 
;--------------------------------------
S_d17d:                               ; XREF: 
    DEFB "Paper No.(0-15) :$Colour No.(0-26) :$>"  ;0xd17d:   0xd17d to 0xd1a3
    DEFB 0x1b                         ;0xd1a3:   0x1b
    DEFB 0x32                         ;0xd1a4:   
    DEFB 0x86                         ;0xd1a5:   
    DEFB 0xc                          ;0xd1a6:   0xc
    DEFB 0x11                         ;0xd1a7:   0x11
;--------------------------------------
C_D1A8:                               ; XREF: 0xD158 
    LD HL,0xcd14                      ;0xd1a8:   21 14 cd  "!.."  
    XOR E                             ;0xd1ab:   ab  "." 
    RLCA                              ;0xd1ac:   07  "." 
    CALL 0xc52                        ;0xd1ad:   cd 52 0c  ".R." 
    RET z                             ;0xd1b0:   c8  "." 
    LD HL,SCR_SET_BORDER              ;0xd1b1:   21 38 bc  "!8."  
    LD (0x1251),HL                    ;0xd1b4:   22 51 12  ""Q."  
    LD B,A                            ;0xd1b7:   47  "G" 
    LD C,B                            ;0xd1b8:   48  "H" 
    JP 0x1240                         ;0xd1b9:   c3 40 12  ".@." 
    DI                                ;0xd1bc:   f3  "." 
    LD HL,0x145d                      ;0xd1bd:   21 5d 14  "!]."  
    LD DE,0xc100                      ;0xd1c0:   11 00 c1  "..."  
    LD BC,0x100                       ;0xd1c3:   01 00 01  "..."  
    LDIR                              ;0xd1c6:   ed b0  ".." 
;--------------------------------------
C_D1C8:                               ; XREF: 0xD18C 
    JP 0xc100                         ;0xd1c8:   c3 00 c1  "..." 
    LD BC,0x7f89                      ;0xd1cb:   01 89 7f  "..."  
    OUT (C),C                         ;0xd1ce:   ed 49  ".I" 
    LD HL,JUMP_TABLE                  ;0xd1d0:   21 06 c0  "!.."  
    LD C,0                            ;0xd1d3:   0e 00  ".."  
    JP 0x61c                          ;0xd1d5:   c3 1c 06  "..." 
    LD A,0xff                         ;0xd1d8:   3e ff  ">."  
    LD (0xc86),A                      ;0xd1da:   32 86 0c  "2.."  
    LD DE,0x1481                      ;0xd1dd:   11 81 14  "..."  
    CALL 0x7ab                        ;0xd1e0:   cd ab 07  "..." 
;--------------------------------------
C_D1E3:                               ; XREF: 0xD1ED 
    CALL 0xc52                        ;0xd1e3:   cd 52 0c  ".R." 
    RET z                             ;0xd1e6:   c8  "." 
    LD E,A                            ;0xd1e7:   5f  "_" 
    LD C,5                            ;0xd1e8:   0e 05  ".."  
    CALL 0x5                          ;0xd1ea:   cd 05 00  "..." 
    JR C_D1E3                         ;0xd1ed:   18 f4  ".." 
;--------------------------------------
S_d1ef:                               ; XREF: 
    DEFB "Printer string :$!"         ;0xd1ef:   0xd1ef to 0xd201
;--------------------------------------
C_d201:                               ; XREF: 
    RRCA                              ;0xd201:   0f  "." 
    CP E                              ;0xd202:   bb  "." 
    LD (0x1251),HL                    ;0xd203:   22 51 12  ""Q."  
    LD A,0xff                         ;0xd206:   3e ff  ">."  
    LD (0xc86),A                      ;0xd208:   32 86 0c  "2.."  
    LD DE,0x150b                      ;0xd20b:   11 0b 15  "..."  
    CALL 0x7ab                        ;0xd20e:   cd ab 07  "..." 
    CALL 0xc52                        ;0xd211:   cd 52 0c  ".R." 
    RET z                             ;0xd214:   c8  "." 
    LD (0x13ad),A                     ;0xd215:   32 ad 13  "2.."  
    CALL 0x14f1                       ;0xd218:   cd f1 14  "..." 
    RET z                             ;0xd21b:   c8  "." 
    LD C,0                            ;0xd21c:   0e 00  ".."  
    PUSH HL                           ;0xd21e:   e5  "." 
;--------------------------------------
C_D21F:                               ; XREF: 0xD225 
    LD A,(HL)                         ;0xd21f:   7e  "~" 
    OR A                              ;0xd220:   b7  "." 
    JR z, C_D227                      ;0xd221:   28 04  "(." 
    INC C                             ;0xd223:   0c  "." 
    INC HL                            ;0xd224:   23  "#" 
    JR C_D21F                         ;0xd225:   18 f8  ".." 
;--------------------------------------
C_D227:                               ; XREF: 0xD221 
    POP HL                            ;0xd227:   e1  "." 
    LD DE,0xc100                      ;0xd228:   11 00 c1  "..."  
    LD B,C                            ;0xd22b:   41  "A" 
    LD C,0                            ;0xd22c:   0e 00  ".."  
;--------------------------------------
C_D22E:                               ; XREF: 0xD251 
    LD A,(HL)                         ;0xd22e:   7e  "~" 
    CP 0x25                           ;0xd22f:   fe 25  ".%" 
    JR nz, C_D240                     ;0xd231:   20 0d  " ." 
    INC HL                            ;0xd233:   23  "#" 
    DEC B                             ;0xd234:   05  "." 
    LD A,(HL)                         ;0xd235:   7e  "~" 
    AND 0x5f                          ;0xd236:   e6 5f  "._" 
    SUB 0x40                          ;0xd238:   d6 40  ".@" 
    LD (DE),A                         ;0xd23a:   12  "." 
    INC C                             ;0xd23b:   0c  "." 
    INC DE                            ;0xd23c:   13  "." 
    INC HL                            ;0xd23d:   23  "#" 
    JR C_D251                         ;0xd23e:   18 11  ".." 
;--------------------------------------
C_D240:                               ; XREF: 0xD231 
    CP 0x7c                           ;0xd240:   fe 7c  ".|" 
    JR nz, C_D24C                     ;0xd242:   20 08  " ." 
    LD A,0x21                         ;0xd244:   3e 21  ">!"  
    LD (DE),A                         ;0xd246:   12  "." 
    INC C                             ;0xd247:   0c  "." 
    INC DE                            ;0xd248:   13  "." 
    INC HL                            ;0xd249:   23  "#" 
    JR C_D251                         ;0xd24a:   18 05  ".." 
;--------------------------------------
C_D24C:                               ; XREF: 0xD242 
    LD A,(HL)                         ;0xd24c:   7e  "~" 
    LD (DE),A                         ;0xd24d:   12  "." 
    INC C                             ;0xd24e:   0c  "." 
    INC DE                            ;0xd24f:   13  "." 
    INC HL                            ;0xd250:   23  "#" 
;--------------------------------------
C_D251:                               ; XREF: 0xD23E 
    DJNZ C_D22E                       ;0xd251:   10 db  ".." 
    XOR A                             ;0xd253:   af  "." 
    LD (DE),A                         ;0xd254:   12  "." 
    LD HL,0xc100                      ;0xd255:   21 00 c1  "!.."  
    LD A,(0x13ad)                     ;0xd258:   3a ad 13  ":.."  
    LD B,A                            ;0xd25b:   47  "G" 
    JP 0x1240                         ;0xd25c:   c3 40 12  ".@." 
    LD HL,(0xd6c)                     ;0xd25f:   2a 6c 0d  "*l."  
;--------------------------------------
C_D262:                               ; XREF: 0xD277 
    LD (0xd6c),HL                     ;0xd262:   22 6c 0d  ""l."  
    LD (0xd9b),HL                     ;0xd265:   22 9b 0d  "".."  
    LD A,(HL)                         ;0xd268:   7e  "~" 
    OR A                              ;0xd269:   b7  "." 
    RET z                             ;0xd26a:   c8  "." 
;--------------------------------------
C_D26B:                               ; XREF: 0xD1F6 
    CP 0x20                           ;0xd26b:   fe 20  ". " 
    JR z, C_D276                      ;0xd26d:   28 07  "(." 
    CP 0x2c                           ;0xd26f:   fe 2c  ".," 
    JR z, C_D276                      ;0xd271:   28 03  "(." 
    CP 0x80                           ;0xd273:   fe 80  ".." 
    RET nz                            ;0xd275:   c0  "." 
;--------------------------------------
C_D276:                               ; XREF: 0xD26D 
    INC HL                            ;0xd276:   23  "#" 
    JR C_D262                         ;0xd277:   18 e9  ".." 
;--------------------------------------
S_d279:                               ; XREF: 
    DEFB "Exp No.(128-159),String :$", 'U' + 0x80  ;0xd279:   0xd279 to 0xd296
;--------------------------------------
D_D294:                               ; XREF: 
    PUSH BC                           ;0xd294:   c5  "." 
    LD DE,0x80                        ;0xd295:   11 80 00  "..."  
    LD C,0x1a                         ;0xd298:   0e 1a  ".."  
    CALL 0x5                          ;0xd29a:   cd 05 00  "..." 
    POP BC                            ;0xd29d:   c1  "." 
    POP DE                            ;0xd29e:   d1  "." 
    RET                               ;0xd29f:   c9  "." 
;--------------------------------------
C_D2A0:                               ; XREF: 0xC355 
    CALL 0x15e9                       ;0xd2a0:   cd e9 15  "..." 
    LD A,C                            ;0xd2a3:   79  "y" 
    CP 1                              ;0xd2a4:   fe 01  ".." 
    JR nz, C_D2D0                     ;0xd2a6:   20 28  " (" 
    LD HL,0x1547                      ;0xd2a8:   21 47 15  "!G."  
;--------------------------------------
C_D2AB:                               ; XREF: 0xD2D3 
    LD DE,0xc100                      ;0xd2ab:   11 00 c1  "..."  
    LD BC,0x28                        ;0xd2ae:   01 28 00  ".(."  
    LDIR                              ;0xd2b1:   ed b0  ".." 
    JR C_D2D8                         ;0xd2b3:   18 23  ".#" 
    LD H,B                            ;0xd2b5:   60  "`" 
    ADC A,C                           ;0xd2b6:   89  "." 
    PUSH AF                           ;0xd2b7:   f5  "." 
    RLCA                              ;0xd2b8:   07  "." 
    JR nc, C_D2CC                     ;0xd2b9:   30 11  "0." 
    LD B,0xef                         ;0xd2bb:   06 ef  ".."  
    XOR A                             ;0xd2bd:   af  "." 
    OUT (C),A                         ;0xd2be:   ed 79  ".y" 
    SET 0,A                           ;0xd2c0:   cb c7  ".." 
    OUT (C),A                         ;0xd2c2:   ed 79  ".y" 
    RES 0,A                           ;0xd2c4:   cb 87  ".." 
    OUT (C),A                         ;0xd2c6:   ed 79  ".y" 
    SET 0,A                           ;0xd2c8:   cb c7  ".." 
    OUT (C),A                         ;0xd2ca:   ed 79  ".y" 
;--------------------------------------
C_D2CC:                               ; XREF: 0xD27C 
    POP AF                            ;0xd2cc:   f1  "." 
    JP MC_SEND_PRINTER                ;0xd2cd:   c3 31 bd  ".1." 
;--------------------------------------
C_D2D0:                               ; XREF: 0xD2A6 
    LD HL,0x1567                      ;0xd2d0:   21 67 15  "!g."  
    JR C_D2AB                         ;0xd2d3:   18 d6  ".." 
    LD SP,0xc9bd                      ;0xd2d5:   31 bd c9  "1.."  
;--------------------------------------
C_D2D8:                               ; XREF: 0xD2B3 
    LD HL,0x1578                      ;0xd2d8:   21 78 15  "!x."  
    LD DE,ROM_TYPE                    ;0xd2db:   11 00 c0  "..."  
    LD BC,0x21                        ;0xd2de:   01 21 00  ".!."  
    LDIR                              ;0xd2e1:   ed b0  ".." 
    JP ROM_TYPE                       ;0xd2e3:   c3 00 c0  "..." 
    DI                                ;0xd2e6:   f3  "." 
    LD BC,0x7fc1                      ;0xd2e7:   01 c1 7f  "..."  
    OUT (C),C                         ;0xd2ea:   ed 49  ".I" 
    LD HL,0xc100                      ;0xd2ec:   21 00 c1  "!.."  
    LD DE,0x214                       ;0xd2ef:   11 14 02  "..."  
    LD BC,2                           ;0xd2f2:   01 02 00  "..."  
    LDIR                              ;0xd2f5:   ed b0  ".." 
    LD DE,0x8960                      ;0xd2f7:   11 60 89  ".`."  
    LD BC,0x19                        ;0xd2fa:   01 19 00  "..."  
    LDIR                              ;0xd2fd:   ed b0  ".." 
    LD BC,0x7fc2                      ;0xd2ff:   01 c2 7f  "..."  
    OUT (C),C                         ;0xd302:   ed 49  ".I" 
    EI                                ;0xd304:   fb  "." 
    RET                               ;0xd305:   c9  "." 
    NOP                               ;0xd306:   00  "." 
    LD HL,0x506                       ;0xd307:   21 06 05  "!.."  
    PUSH HL                           ;0xd30a:   e5  "." 
    CALL 0xad8                        ;0xd30b:   cd d8 0a  "..." 
    JR z, C_D32E                      ;0xd30e:   28 1e  "(." 
;--------------------------------------
C_D310:                               ; XREF: 0xD342 
    LD A,0x7f                         ;0xd310:   3e 7f  ">."  
    LD (0xd9f),A                      ;0xd312:   32 9f 0d  "2.."  
;--------------------------------------
d_d315:                               ; XREF: 0xCECE 
    LD C,15                           ;0xd315:   0e 0f  ".."  
    CALL 0x76c                        ;0xd317:   cd 6c 07  ".l." 
;--------------------------------------
C_D31A:                               ; XREF: 0xD32C 
    CALL 0x966                        ;0xd31a:   cd 66 09  ".f." 
    CALL 0xbc4                        ;0xd31d:   cd c4 0b  "..." 
    RET nz                            ;0xd320:   c0  "." 
    CP 0x1a                           ;0xd321:   fe 1a  ".." 
    RET z                             ;0xd323:   c8  "." 
    PUSH DE                           ;0xd324:   d5  "." 
    LD E,A                            ;0xd325:   5f  "_" 
    LD C,5                            ;0xd326:   0e 05  ".."  
    CALL 0x5                          ;0xd328:   cd 05 00  "..." 
    POP DE                            ;0xd32b:   d1  "." 
    JR C_D31A                         ;0xd32c:   18 ec  ".." 
;--------------------------------------
C_D32E:                               ; XREF: 0xD30E 
    LD DE,0x15d6                      ;0xd32e:   11 d6 15  "..."  
    CALL 0x949                        ;0xd331:   cd 49 09  ".I." 
    CALL 0x94e                        ;0xd334:   cd 4e 09  ".N." 
    CALL 0x9f6                        ;0xd337:   cd f6 09  "..." 
    LD A,(HL)                         ;0xd33a:   7e  "~" 
    CP 0                              ;0xd33b:   fe 00  ".." 
    RET z                             ;0xd33d:   c8  "." 
    CALL 0xad8                        ;0xd33e:   cd d8 0a  "..." 
    RET z                             ;0xd341:   c8  "." 
    JR C_D310                         ;0xd342:   18 cc  ".." 
;--------------------------------------
S_d344:                               ; XREF: 
    DEFB "Lprint filename : $", 'M' + 0x80  ;0xd344:   0xd344 to 0xd35a
;--------------------------------------
C_d358:                               ; XREF: 
    LD B,C                            ;0xd358:   41  "A" 
    LD A,(BC)                         ;0xd359:   0a  "." 
    LD C,1                            ;0xd35a:   0e 01  ".."  
    RET z                             ;0xd35c:   c8  "." 
    LD HL,(0xd9b)                     ;0xd35d:   2a 9b 0d  "*.."  
    LD A,(HL)                         ;0xd360:   7e  "~" 
    AND 0x5f                          ;0xd361:   e6 5f  "._" 
    CP 0x4f                           ;0xd363:   fe 4f  ".O" 
    RET nz                            ;0xd365:   c0  "." 
    INC HL                            ;0xd366:   23  "#" 
    LD A,(HL)                         ;0xd367:   7e  "~" 
    AND 0x5f                          ;0xd368:   e6 5f  "._" 
    CP 0x46                           ;0xd36a:   fe 46  ".F" 
    RET nz                            ;0xd36c:   c0  "." 
    INC HL                            ;0xd36d:   23  "#" 
    LD A,(HL)                         ;0xd36e:   7e  "~" 
    AND 0x5f                          ;0xd36f:   e6 5f  "._" 
    CP 0x46                           ;0xd371:   fe 46  ".F" 
    RET nz                            ;0xd373:   c0  "." 
    LD C,0                            ;0xd374:   0e 00  ".."  
    RET                               ;0xd376:   c9  "." 
    LD C,9                            ;0xd377:   0e 09  ".."  
    JP 0x5                            ;0xd379:   c3 05 00  "..." 
    CALL 0xa41                        ;0xd37c:   cd 41 0a  ".A." 
    JR nz, C_D3B0                     ;0xd37f:   20 2f  " /" 
;--------------------------------------
C_D381:                               ; XREF: 0xD3B7 
    CALL 0x1629                       ;0xd381:   cd 29 16  ".)." 
    LD C,0x18                         ;0xd384:   0e 18  ".."  
    CALL 0x5                          ;0xd386:   cd 05 00  "..." 
    LD C,0                            ;0xd389:   0e 00  ".."  
    LD A,L                            ;0xd38b:   7d  "}" 
    CALL 0x165a                       ;0xd38c:   cd 5a 16  ".Z." 
;--------------------------------------
C_D38F:                               ; XREF: 0xD353 
    LD A,H                            ;0xd38f:   7c  "|" 
    CALL 0x165a                       ;0xd390:   cd 5a 16  ".Z." 
    JP 0x1634                         ;0xd393:   c3 34 16  ".4." 
    NOP                               ;0xd396:   00  "." 
    PUSH BC                           ;0xd397:   c5  "." 
    LD C,0x19                         ;0xd398:   0e 19  ".."  
    CALL 0x5                          ;0xd39a:   cd 05 00  "..." 
    LD (0x1628),A                     ;0xd39d:   32 28 16  "2(."  
    POP BC                            ;0xd3a0:   c1  "." 
    RET                               ;0xd3a1:   c9  "." 
    PUSH DE                           ;0xd3a2:   d5  "." 
    PUSH BC                           ;0xd3a3:   c5  "." 
    LD A,(0x1628)                     ;0xd3a4:   3a 28 16  ":(."  
    LD E,A                            ;0xd3a7:   5f  "_" 
    LD C,14                           ;0xd3a8:   0e 0e  ".."  
    CALL 0x5                          ;0xd3aa:   cd 05 00  "..." 
    POP BC                            ;0xd3ad:   c1  "." 
    POP DE                            ;0xd3ae:   d1  "." 
    RET                               ;0xd3af:   c9  "." 
;--------------------------------------
C_D3B0:                               ; XREF: 0xD37F 
    LD HL,(0xd6c)                     ;0xd3b0:   2a 6c 0d  "*l."  
    INC HL                            ;0xd3b3:   23  "#" 
    LD A,(HL)                         ;0xd3b4:   7e  "~" 
    CP 0x3a                           ;0xd3b5:   fe 3a  ".:" 
    JR nz, C_D381                     ;0xd3b7:   20 c8  " ." 
    DEC HL                            ;0xd3b9:   2b  "+" 
    LD A,(HL)                         ;0xd3ba:   7e  "~" 
    AND 15                            ;0xd3bb:   e6 0f  ".." 
    DEC A                             ;0xd3bd:   3d  "=" 
    LD C,A                            ;0xd3be:   4f  "O" 
    CALL 0x1629                       ;0xd3bf:   cd 29 16  ".)." 
    CALL 0x166d                       ;0xd3c2:   cd 6d 16  ".m." 
    JP 0x1634                         ;0xd3c5:   c3 34 16  ".4." 
    PUSH HL                           ;0xd3c8:   e5  "." 
    LD B,8                            ;0xd3c9:   06 08  ".."  
;--------------------------------------
C_D3CB:                               ; XREF: 0xD3D7 
    PUSH BC                           ;0xd3cb:   c5  "." 
    BIT 0,A                           ;0xd3cc:   cb 47  ".G" 
    PUSH AF                           ;0xd3ce:   f5  "." 
    CALL nz, 0x166d                   ;0xd3cf:   c4 6d 16  ".m." 
    POP AF                            ;0xd3d2:   f1  "." 
    RRC A                             ;0xd3d3:   cb 0f  ".." 
    POP BC                            ;0xd3d5:   c1  "." 
    INC C                             ;0xd3d6:   0c  "." 
    DJNZ C_D3CB                       ;0xd3d7:   10 f2  ".." 
    POP HL                            ;0xd3d9:   e1  "." 
    RET                               ;0xd3da:   c9  "." 
    LD A,C                            ;0xd3db:   79  "y" 
    LD (0x16eb),A                     ;0xd3dc:   32 eb 16  "2.."  
    CALL 0x1525                       ;0xd3df:   cd 25 15  ".%." 
    LD A,(0x16eb)                     ;0xd3e2:   3a eb 16  ":.."  
    LD (0x16ec),A                     ;0xd3e5:   32 ec 16  "2.."  
    LD E,A                            ;0xd3e8:   5f  "_" 
    LD C,14                           ;0xd3e9:   0e 0e  ".."  
    CALL 0x5                          ;0xd3eb:   cd 05 00  "..." 
    LD C,0x11                         ;0xd3ee:   0e 11  ".."  
    LD DE,0x16ec                      ;0xd3f0:   11 ec 16  "..."  
    CALL 0x5                          ;0xd3f3:   cd 05 00  "..." 
    LD A,(0x16eb)                     ;0xd3f6:   3a eb 16  ":.."  
    LD E,A                            ;0xd3f9:   5f  "_" 
    LD C,0x2e                         ;0xd3fa:   0e 2e  ".."  
    CALL 0x5                          ;0xd3fc:   cd 05 00  "..." 
    LD B,3                            ;0xd3ff:   06 03  ".."  
;--------------------------------------
C_D401:                               ; XREF: 0xD411 
    LD IX,0x80                        ;0xd401:   dd 21 80 00  ".!.."  
    SRL (IX+2)                        ;0xd405:   dd cb 02 3e  "...>" 
    RR (IX+1)                         ;0xd409:   dd cb 01 1e  "...." 
    RR (IX+0)                         ;0xd40d:   dd cb 00 1e  "...." 
    DJNZ C_D401                       ;0xd411:   10 ee  ".." 
    LD A,(0x16eb)                     ;0xd413:   3a eb 16  ":.."  
    ADD A,0x41                        ;0xd416:   c6 41  ".A" 
    LD E,A                            ;0xd418:   5f  "_" 
    LD C,2                            ;0xd419:   0e 02  ".."  
    CALL 0x5                          ;0xd41b:   cd 05 00  "..." 
    LD C,0x1d                         ;0xd41e:   0e 1d  ".."  
    CALL 0x5                          ;0xd420:   cd 05 00  "..." 
    LD A,(0x175e)                     ;0xd423:   3a 5e 17  ":^."  
    LD B,A                            ;0xd426:   47  "G" 
    OR A                              ;0xd427:   b7  "." 
    JR z, C_D431                      ;0xd428:   28 07  "(." 
;--------------------------------------
C_D42A:                               ; XREF: 0xD42F 
    AND A                             ;0xd42a:   a7  "." 
    RR H                              ;0xd42b:   cb 1c  ".." 
    RR L                              ;0xd42d:   cb 1d  ".." 
    DJNZ C_D42A                       ;0xd42f:   10 f9  ".." 
;--------------------------------------
C_D431:                               ; XREF: 0xD428 
    BIT 0,L                           ;0xd431:   cb 45  ".E" 
    JR z, C_D43A                      ;0xd433:   28 05  "(." 
    LD DE,0x174a                      ;0xd435:   11 4a 17  ".J."  
    JR C_D43D                         ;0xd438:   18 03  ".." 
;--------------------------------------
C_D43A:                               ; XREF: 0xD433 
    LD DE,0x1745                      ;0xd43a:   11 45 17  ".E."  
;--------------------------------------
C_D43D:                               ; XREF: 0xD438 
    LD C,9                            ;0xd43d:   0e 09  ".."  
    CALL 0x5                          ;0xd43f:   cd 05 00  "..." 
    LD DE,0x174f                      ;0xd442:   11 4f 17  ".O."  
    LD C,9                            ;0xd445:   0e 09  ".."  
    CALL 0x5                          ;0xd447:   cd 05 00  "..." 
    LD H,(IX+1)                       ;0xd44a:   dd 66 01  ".f." 
    LD L,(IX+0)                       ;0xd44d:   dd 6e 00  ".n." 
    CALL 0x16fb                       ;0xd450:   cd fb 16  "..." 
    LD DE,0x175b                      ;0xd453:   11 5b 17  ".[."  
    JP 0x1609                         ;0xd456:   c3 09 16  "..." 
    NOP                               ;0xd459:   00  "." 
    NOP                               ;0xd45a:   00  "." 
;--------------------------------------
S_d45b:                               ; XREF: 
    DEFB 0x3f                         ;0xd45b:   
    DEFB "???????????", 0x3f          ;0xd45c:   0xd45c to 0xd45d
    NOP                               ;0xd468:   00  "." 
    LD A,L                            ;0xd469:   7d  "}" 
    OR H                              ;0xd46a:   b4  "." 
    JR z, C_D4AB                      ;0xd46b:   28 3e  "(>" 
    LD B,0                            ;0xd46d:   06 00  ".."  
    LD DE,0x3e8                       ;0xd46f:   11 e8 03  "..."  
    CALL 0x1716                       ;0xd472:   cd 16 17  "..." 
    LD DE,0x64                        ;0xd475:   11 64 00  ".d."  
    CALL 0x1716                       ;0xd478:   cd 16 17  "..." 
    LD DE,10                          ;0xd47b:   11 0a 00  "..."  
    CALL 0x1716                       ;0xd47e:   cd 16 17  "..." 
    LD DE,1                           ;0xd481:   11 01 00  "..."  
    XOR A                             ;0xd484:   af  "." 
;--------------------------------------
C_D485:                               ; XREF: 0xD48C 
    SCF                               ;0xd485:   37  "7" 
    CCF                               ;0xd486:   3f  "?" 
    SBC HL,DE                         ;0xd487:   ed 52  ".R" 
    JR c, C_D48E                      ;0xd489:   38 03  "8." 
    INC A                             ;0xd48b:   3c  "<" 
    JR C_D485                         ;0xd48c:   18 f7  ".." 
;--------------------------------------
C_D48E:                               ; XREF: 0xD489 
    ADD HL,DE                         ;0xd48e:   19  "." 
    ADD A,0x30                        ;0xd48f:   c6 30  ".0" 
    LD E,A                            ;0xd491:   5f  "_" 
    CP 0x30                           ;0xd492:   fe 30  ".0" 
    CALL z, 0x1737                    ;0xd494:   cc 37 17  ".7." 
    LD B,1                            ;0xd497:   06 01  ".."  
    PUSH HL                           ;0xd499:   e5  "." 
    PUSH AF                           ;0xd49a:   f5  "." 
    PUSH BC                           ;0xd49b:   c5  "." 
    LD C,2                            ;0xd49c:   0e 02  ".."  
    CALL 0x5                          ;0xd49e:   cd 05 00  "..." 
    POP BC                            ;0xd4a1:   c1  "." 
    POP AF                            ;0xd4a2:   f1  "." 
    POP HL                            ;0xd4a3:   e1  "." 
    RET                               ;0xd4a4:   c9  "." 
    LD A,1                            ;0xd4a5:   3e 01  ">."  
    CP B                              ;0xd4a7:   b8  "." 
    RET z                             ;0xd4a8:   c8  "." 
    POP DE                            ;0xd4a9:   d1  "." 
    RET                               ;0xd4aa:   c9  "." 
;--------------------------------------
C_D4AB:                               ; XREF: 0xD46B 
    LD A,0x30                         ;0xd4ab:   3e 30  ">0"  
    LD E,A                            ;0xd4ad:   5f  "_" 
    LD C,2                            ;0xd4ae:   0e 02  ".."  
    JP 0x5                            ;0xd4b0:   c3 05 00  "..." 
;--------------------------------------
S_d4b3:                               ; XREF: 
    DEFB ": RW$: RO$, Space:   $", 0x0d  ;0xd4b3:   0xd4b3 to 0xd4cc
    DEFB 0xa                          ;0xd4ca:   0xa
    DEFB 0x24                         ;0xd4cb:   
    DEFB 0x0                          ;0xd4cc:   
    DEFB 0x35                         ;0xd4cd:   
    DEFB 0x0                          ;0xd4ce:   
    DEFB 0xe                          ;0xd4cf:   0xe
    DEFB 0x2d                         ;0xd4d0:   
    DEFB 0x1e                         ;0xd4d1:   0x1e
    DEFB 0xff                         ;0xd4d2:   
    DEFB 0xcd                         ;0xd4d3:   
    DEFB 0x5                          ;0xd4d4:   0x5
    DEFB 0x0                          ;0xd4d5:   
    DEFB 0xe                          ;0xd4d6:   0xe
    DEFB 0xe                          ;0xd4d7:   0xe
    DEFB 0x1e                         ;0xd4d8:   0x1e
    DEFB 0x0                          ;0xd4d9:   
    DEFB 0xcd                         ;0xd4da:   
    DEFB 0x5                          ;0xd4db:   0x5
    DEFB 0x0                          ;0xd4dc:   
    DEFB 0xf5                         ;0xd4dd:   
    DEFB 0xe                          ;0xd4de:   0xe
    DEFB 0x2d                         ;0xd4df:   
    DEFB 0x1e                         ;0xd4e0:   0x1e
    DEFB 0x0                          ;0xd4e1:   
    DEFB 0xcd                         ;0xd4e2:   
    DEFB 0x5                          ;0xd4e3:   0x5
    DEFB 0x0                          ;0xd4e4:   
    DEFB 0xf1                         ;0xd4e5:   
    DEFB 0xfe                         ;0xd4e6:   
    DEFB 0xff                         ;0xd4e7:   
    DEFB 0xca                         ;0xd4e8:   
    DEFB 0x6                          ;0xd4e9:   0x6
    DEFB 0x5                          ;0xd4ea:   0x5
    DEFB 0x21                         ;0xd4eb:   
    DEFB 0xfc                         ;0xd4ec:   
;--------------------------------------
C_D4ED:                               ; XREF: 0xD4C7 
    INC B                             ;0xd4ed:   04  "." 
    JP 0x4d9                          ;0xd4ee:   c3 d9 04  "..." 
    CALL 0xad8                        ;0xd4f1:   cd d8 0a  "..." 
    JP z, 0x17ad                      ;0xd4f4:   ca ad 17  "..." 
    CALL 0x79e                        ;0xd4f7:   cd 9e 07  "..." 
    JP nz, 0x17ad                     ;0xd4fa:   c2 ad 17  "..." 
    LD DE,0xd14                       ;0xd4fd:   11 14 0d  "..."  
    CALL 0x949                        ;0xd500:   cd 49 09  ".I." 
    LD HL,(0xd9b)                     ;0xd503:   2a 9b 0d  "*.."  
    LD C,0x20                         ;0xd506:   0e 20  ". "  
    CALL 0xc2a                        ;0xd508:   cd 2a 0c  ".*." 
    LD DE,0xd1b                       ;0xd50b:   11 1b 0d  "..."  
    CALL 0x941                        ;0xd50e:   cd 41 09  ".A." 
    CALL 0xc09                        ;0xd511:   cd 09 0c  "..." 
    LD A,L                            ;0xd514:   7d  "}" 
    AND 0x5f                          ;0xd515:   e6 5f  "._" 
    CP 0x59                           ;0xd517:   fe 59  ".Y" 
    RET nz                            ;0xd519:   c0  "." 
    OR A                              ;0xd51a:   b7  "." 
    LD C,0x13                         ;0xd51b:   0e 13  ".."  
    JP 0x76c                          ;0xd51d:   c3 6c 07  ".l." 
    CALL 0xad8                        ;0xd520:   cd d8 0a  "..." 
    PUSH AF                           ;0xd523:   f5  "." 
    LD HL,0x10                        ;0xd524:   21 10 00  "!.."  
    ADD HL,DE                         ;0xd527:   19  "." 
    EX DE,HL                          ;0xd528:   eb  "." 
    PUSH DE                           ;0xd529:   d5  "." 
    PUSH HL                           ;0xd52a:   e5  "." 
    LD C,0x10                         ;0xd52b:   0e 10  ".."  
    CALL 0xbae                        ;0xd52d:   cd ae 0b  "..." 
    CALL 0xad8                        ;0xd530:   cd d8 0a  "..." 
    POP HL                            ;0xd533:   e1  "." 
    POP DE                            ;0xd534:   d1  "." 
    CALL 0x792                        ;0xd535:   cd 92 07  "..." 
    LD C,0x17                         ;0xd538:   0e 17  ".."  
    POP AF                            ;0xd53a:   f1  "." 
    JP 0x76c                          ;0xd53b:   c3 6c 07  ".l." 
    LD C,0x31                         ;0xd53e:   0e 31  ".1"  
    LD DE,0x17e7                      ;0xd540:   11 e7 17  "..."  
    CALL 0x5                          ;0xd543:   cd 05 00  "..." 
    AND 2                             ;0xd546:   e6 02  ".." 
    CALL z, 0x2060                    ;0xd548:   cc 60 20  ".` " 
    CALL 0x214b                       ;0xd54b:   cd 4b 21  ".K!" 
    EI                                ;0xd54e:   fb  "." 
    LD SP,0xf2d                       ;0xd54f:   31 2d 0f  "1-."  
    JP 0x41d                          ;0xd552:   c3 1d 04  "..." 
    ADD HL,DE                         ;0xd555:   19  "." 
    NOP                               ;0xd556:   00  "." 
;--------------------------------------
C_D557:                               ; XREF: 0xD57E 
    LD HL,(0xd6c)                     ;0xd557:   2a 6c 0d  "*l."  
    INC HL                            ;0xd55a:   23  "#" 
    LD A,(HL)                         ;0xd55b:   7e  "~" 
    CP 0x3a                           ;0xd55c:   fe 3a  ".:" 
    JR nz, C_D580                     ;0xd55e:   20 20  "  " 
    DEC HL                            ;0xd560:   2b  "+" 
    LD A,(HL)                         ;0xd561:   7e  "~" 
    AND 15                            ;0xd562:   e6 0f  ".." 
    DEC A                             ;0xd564:   3d  "=" 
    LD E,A                            ;0xd565:   5f  "_" 
    LD C,0x19                         ;0xd566:   0e 19  ".."  
    CALL 0x5                          ;0xd568:   cd 05 00  "..." 
    PUSH AF                           ;0xd56b:   f5  "." 
    LD C,14                           ;0xd56c:   0e 0e  ".."  
    CALL 0x5                          ;0xd56e:   cd 05 00  "..." 
    CALL 0x1812                       ;0xd571:   cd 12 18  "..." 
    POP AF                            ;0xd574:   f1  "." 
    LD E,A                            ;0xd575:   5f  "_" 
    LD C,14                           ;0xd576:   0e 0e  ".."  
    JP 0x5                            ;0xd578:   c3 05 00  "..." 
    CALL 0xa41                        ;0xd57b:   cd 41 0a  ".A." 
    JR nz, C_D557                     ;0xd57e:   20 d7  " ." 
;--------------------------------------
C_D580:                               ; XREF: 0xD55E 
    CALL 0x1525                       ;0xd580:   cd 25 15  ".%." 
    CALL 0x18eb                       ;0xd583:   cd eb 18  "..." 
    LD HL,0x9000                      ;0xd586:   21 00 90  "!.."  
    LD (0x18d1),HL                    ;0xd589:   22 d1 18  "".."  
    XOR A                             ;0xd58c:   af  "." 
    LD (0x18d3),A                     ;0xd58d:   32 d3 18  "2.."  
    LD DE,0x18dc                      ;0xd590:   11 dc 18  "..."  
    LD C,0x11                         ;0xd593:   0e 11  ".."  
    CALL 0x5                          ;0xd595:   cd 05 00  "..." 
    CP 0xff                           ;0xd598:   fe ff  ".." 
    JP z, 0x188e                      ;0xd59a:   ca 8e 18  "..." 
;--------------------------------------
C_D59D:                               ; XREF: 0xD5D9 
    LD HL,0x80                        ;0xd59d:   21 80 00  "!.."  
    OR A                              ;0xd5a0:   b7  "." 
    JR z, C_D5AA                      ;0xd5a1:   28 07  "(." 
    LD B,A                            ;0xd5a3:   47  "G" 
;--------------------------------------
C_D5A4:                               ; XREF: 0xD5A8 
    LD DE,0x20                        ;0xd5a4:   11 20 00  ". ."  
    ADD HL,DE                         ;0xd5a7:   19  "." 
    DJNZ C_D5A4                       ;0xd5a8:   10 fa  ".." 
;--------------------------------------
C_D5AA:                               ; XREF: 0xD5A1 
    LD DE,12                          ;0xd5aa:   11 0c 00  "..."  
    ADD HL,DE                         ;0xd5ad:   19  "." 
    LD A,(HL)                         ;0xd5ae:   7e  "~" 
    CP 0                              ;0xd5af:   fe 00  ".." 
    JR nz, C_D5CD                     ;0xd5b1:   20 1a  " ." 
    LD DE,12                          ;0xd5b3:   11 0c 00  "..."  
    SBC HL,DE                         ;0xd5b6:   ed 52  ".R" 
    INC HL                            ;0xd5b8:   23  "#" 
    LD DE,(0x18d1)                    ;0xd5b9:   ed 5b d1 18  ".[.."  
    LD BC,11                          ;0xd5bd:   01 0b 00  "..."  
    LDIR                              ;0xd5c0:   ed b0  ".." 
    LD (0x18d1),DE                    ;0xd5c2:   ed 53 d1 18  ".S.."  
    LD A,(0x18d3)                     ;0xd5c6:   3a d3 18  ":.."  
    INC A                             ;0xd5c9:   3c  "<" 
    LD (0x18d3),A                     ;0xd5ca:   32 d3 18  "2.."  
;--------------------------------------
C_D5CD:                               ; XREF: 0xD5B1 
    LD C,0x12                         ;0xd5cd:   0e 12  ".."  
    LD DE,0x18dc                      ;0xd5cf:   11 dc 18  "..."  
    CALL 0x5                          ;0xd5d2:   cd 05 00  "..." 
    CP 0xff                           ;0xd5d5:   fe ff  ".." 
    JR z, C_D5DB                      ;0xd5d7:   28 02  "(." 
    JR C_D59D                         ;0xd5d9:   18 c2  ".." 
;--------------------------------------
C_D5DB:                               ; XREF: 0xD5D7 
    CALL 0x196a                       ;0xd5db:   cd 6a 19  ".j." 
    LD DE,0x9000                      ;0xd5de:   11 00 90  "..."  
    LD A,(0x18d3)                     ;0xd5e1:   3a d3 18  ":.."  
    LD B,A                            ;0xd5e4:   47  "G" 
;--------------------------------------
C_D5E5:                               ; XREF: 0xD5FA 
    PUSH BC                           ;0xd5e5:   c5  "." 
    CALL 0x189f                       ;0xd5e6:   cd 9f 18  "..." 
    PUSH DE                           ;0xd5e9:   d5  "." 
    LD DE,0x18d4                      ;0xd5ea:   11 d4 18  "..."  
    LD C,9                            ;0xd5ed:   0e 09  ".."  
    CALL 0x5                          ;0xd5ef:   cd 05 00  "..." 
    POP DE                            ;0xd5f2:   d1  "." 
    LD HL,11                          ;0xd5f3:   21 0b 00  "!.."  
    ADD HL,DE                         ;0xd5f6:   19  "." 
    LD E,L                            ;0xd5f7:   5d  "]" 
    LD D,H                            ;0xd5f8:   54  "T" 
    POP BC                            ;0xd5f9:   c1  "." 
    DJNZ C_D5E5                       ;0xd5fa:   10 e9  ".." 
    LD DE,0x1924                      ;0xd5fc:   11 24 19  ".$."  
    LD C,9                            ;0xd5ff:   0e 09  ".."  
    CALL 0x5                          ;0xd601:   cd 05 00  "..." 
    CALL 0x193b                       ;0xd604:   cd 3b 19  ".;." 
    LD DE,0x192c                      ;0xd607:   11 2c 19  ".,."  
    JP 0x1609                         ;0xd60a:   c3 09 16  "..." 
    PUSH HL                           ;0xd60d:   e5  "." 
    PUSH DE                           ;0xd60e:   d5  "." 
    PUSH BC                           ;0xd60f:   c5  "." 
    LD B,8                            ;0xd610:   06 08  ".."  
    CALL 0x18c0                       ;0xd612:   cd c0 18  "..." 
    PUSH DE                           ;0xd615:   d5  "." 
    LD E,0x20                         ;0xd616:   1e 20  ". "  
    LD C,2                            ;0xd618:   0e 02  ".."  
    CALL 0x5                          ;0xd61a:   cd 05 00  "..." 
    LD E,0x2e                         ;0xd61d:   1e 2e  ".."  
    LD C,2                            ;0xd61f:   0e 02  ".."  
    CALL 0x5                          ;0xd621:   cd 05 00  "..." 
    POP DE                            ;0xd624:   d1  "." 
    LD B,3                            ;0xd625:   06 03  ".."  
    CALL 0x18c0                       ;0xd627:   cd c0 18  "..." 
    POP BC                            ;0xd62a:   c1  "." 
    POP DE                            ;0xd62b:   d1  "." 
    POP HL                            ;0xd62c:   e1  "." 
    RET                               ;0xd62d:   c9  "." 
;--------------------------------------
C_D62E:                               ; XREF: 0xD63C 
    PUSH BC                           ;0xd62e:   c5  "." 
    PUSH DE                           ;0xd62f:   d5  "." 
    LD A,(DE)                         ;0xd630:   1a  "." 
    RES 7,A                           ;0xd631:   cb bf  ".." 
    LD E,A                            ;0xd633:   5f  "_" 
    LD C,2                            ;0xd634:   0e 02  ".."  
    CALL 0x5                          ;0xd636:   cd 05 00  "..." 
    POP DE                            ;0xd639:   d1  "." 
    INC DE                            ;0xd63a:   13  "." 
    POP BC                            ;0xd63b:   c1  "." 
    DJNZ C_D62E                       ;0xd63c:   10 f0  ".." 
    RET                               ;0xd63e:   c9  "." 
    NOP                               ;0xd63f:   00  "." 
    NOP                               ;0xd640:   00  "." 
    NOP                               ;0xd641:   00  "." 
;--------------------------------------
S_d642:                               ; XREF: 
    DEFB 0x20                         ;0xd642:   
    DEFB "  :   $", 0x20              ;0xd643:   0xd643 to 0xd644
;--------------------------------------
S_d64b:                               ; XREF: 
    DEFB 0x3f                         ;0xd64b:   
    DEFB "???????????", 0x3f          ;0xd64c:   0xd64c to 0xd64d
    NOP                               ;0xd658:   00  "." 
    LD DE,0x1916                      ;0xd659:   11 16 19  "..."  
    CALL 0x1609                       ;0xd65c:   cd 09 16  "..." 
    LD DE,0x1937                      ;0xd65f:   11 37 19  ".7."  
    LD A,0x3e                         ;0xd662:   3e 3e  ">>"  
;--------------------------------------
C_D664:                               ; XREF: 0xD642 
    LD (DE),A                         ;0xd664:   12  "." 
    LD C,0x31                         ;0xd665:   0e 31  ".1"  
    CALL 0x5                          ;0xd667:   cd 05 00  "..." 
    CALL 0x1b77                       ;0xd66a:   cd 77 1b  ".w." 
    CALL 0x1b9f                       ;0xd66d:   cd 9f 1b  "..." 
    LD DE,0x191d                      ;0xd670:   11 1d 19  "..."  
    LD C,9                            ;0xd673:   0e 09  ".."  
    CALL 0x5                          ;0xd675:   cd 05 00  "..." 
    LD A,(0xd70)                      ;0xd678:   3a 70 0d  ":p."  
    CALL 0xc13                        ;0xd67b:   cd 13 0c  "..." 
    LD DE,0x1933                      ;0xd67e:   11 33 19  ".3."  
    JP 0x1609                         ;0xd681:   c3 09 16  "..." 
;--------------------------------------
S_d684:                               ; XREF: 
    DEFB "Drive $ user $", 0x0d       ;0xd684:   0xd684 to 0xd695
    DEFB 0xa                          ;0xd693:   0xa
    DEFB 0xa                          ;0xd694:   0xa
;--------------------------------------
S_d695:                               ; XREF: 
    DEFB "    $k free.", 0x0d         ;0xd695:   0xd695 to 0xd6a4
    DEFB 0xa                          ;0xd6a2:   0xa
    DEFB 0xa                          ;0xd6a3:   0xa
    DEFB 0x24                         ;0xd6a4:   
    DEFB 0x0                          ;0xd6a5:   
    DEFB 0x0                          ;0xd6a6:   
    DEFB 0x0                          ;0xd6a7:   
    DEFB 0x0                          ;0xd6a8:   
    DEFB 0xe                          ;0xd6a9:   0xe
    DEFB 0x19                         ;0xd6aa:   0x19
    DEFB 0xcd                         ;0xd6ab:   
    DEFB 0x5                          ;0xd6ac:   0x5
    DEFB 0x0                          ;0xd6ad:   
    DEFB 0xe                          ;0xd6ae:   0xe
;--------------------------------------
C_D6AF:                               ; XREF: 0xD689 
    LD C,0x5f                         ;0xd6af:   0e 5f  "._"  
    PUSH DE                           ;0xd6b1:   d5  "." 
    CALL 0x5                          ;0xd6b2:   cd 05 00  "..." 
    LD C,0x2e                         ;0xd6b5:   0e 2e  ".."  
;--------------------------------------
C_D6B7:                               ; XREF: 0xD695 
    POP DE                            ;0xd6b7:   d1  "." 
    CALL 0x5                          ;0xd6b8:   cd 05 00  "..." 
    LD B,3                            ;0xd6bb:   06 03  ".."  
;--------------------------------------
C_D6BD:                               ; XREF: 0xD6CD 
    LD IX,0x80                        ;0xd6bd:   dd 21 80 00  ".!.."  
    SRL (IX+2)                        ;0xd6c1:   dd cb 02 3e  "...>" 
    RR (IX+1)                         ;0xd6c5:   dd cb 01 1e  "...." 
    RR (IX+0)                         ;0xd6c9:   dd cb 00 1e  "...." 
    DJNZ C_D6BD                       ;0xd6cd:   10 ee  ".." 
    LD H,(IX+1)                       ;0xd6cf:   dd 66 01  ".f." 
    LD L,(IX+0)                       ;0xd6d2:   dd 6e 00  ".n." 
    JP 0x16fb                         ;0xd6d5:   c3 fb 16  "..." 
    LD HL,0x9000                      ;0xd6d8:   21 00 90  "!.."  
    LD C,0                            ;0xd6db:   0e 00  ".."  
    LD A,(0x18d3)                     ;0xd6dd:   3a d3 18  ":.."  
    DEC A                             ;0xd6e0:   3d  "=" 
    OR A                              ;0xd6e1:   b7  "." 
    RET z                             ;0xd6e2:   c8  "." 
    LD B,A                            ;0xd6e3:   47  "G" 
;--------------------------------------
C_D6E4:                               ; XREF: 0xD6FA 
    PUSH BC                           ;0xd6e4:   c5  "." 
    PUSH HL                           ;0xd6e5:   e5  "." 
    CALL 0x1994                       ;0xd6e6:   cd 94 19  "..." 
    LD E,L                            ;0xd6e9:   5d  "]" 
    LD D,H                            ;0xd6ea:   54  "T" 
    POP HL                            ;0xd6eb:   e1  "." 
    PUSH HL                           ;0xd6ec:   e5  "." 
    CALL 0x19c7                       ;0xd6ed:   cd c7 19  "..." 
    POP HL                            ;0xd6f0:   e1  "." 
    CALL c, 0x199b                    ;0xd6f1:   dc 9b 19  "..." 
    CALL 0x1994                       ;0xd6f4:   cd 94 19  "..." 
    LD A,C                            ;0xd6f7:   79  "y" 
    POP BC                            ;0xd6f8:   c1  "." 
    LD C,A                            ;0xd6f9:   4f  "O" 
    DJNZ C_D6E4                       ;0xd6fa:   10 e8  ".." 
    LD A,C                            ;0xd6fc:   79  "y" 
    OR A                              ;0xd6fd:   b7  "." 
    RET z                             ;0xd6fe:   c8  "." 
    JP 0x196a                         ;0xd6ff:   c3 6a 19  ".j." 
;--------------------------------------
C_D702:                               ; XREF: 0xD68B 
    PUSH DE                           ;0xd702:   d5  "." 
;--------------------------------------
C_D703:                               ; XREF: 0xD69B 
    LD DE,11                          ;0xd703:   11 0b 00  "..."  
    ADD HL,DE                         ;0xd706:   19  "." 
    POP DE                            ;0xd707:   d1  "." 
    RET                               ;0xd708:   c9  "." 
    PUSH BC                           ;0xd709:   c5  "." 
    PUSH DE                           ;0xd70a:   d5  "." 
    PUSH HL                           ;0xd70b:   e5  "." 
    PUSH HL                           ;0xd70c:   e5  "." 
    LD DE,0x19bb                      ;0xd70d:   11 bb 19  "..."  
    LD BC,11                          ;0xd710:   01 0b 00  "..."  
    LDIR                              ;0xd713:   ed b0  ".." 
    POP DE                            ;0xd715:   d1  "." 
    LD BC,11                          ;0xd716:   01 0b 00  "..."  
    LDIR                              ;0xd719:   ed b0  ".." 
    LD HL,0x19bb                      ;0xd71b:   21 bb 19  "!.."  
    LD BC,11                          ;0xd71e:   01 0b 00  "..."  
    LDIR                              ;0xd721:   ed b0  ".." 
    POP HL                            ;0xd723:   e1  "." 
    POP DE                            ;0xd724:   d1  "." 
    POP BC                            ;0xd725:   c1  "." 
    LD C,1                            ;0xd726:   0e 01  ".."  
    RET                               ;0xd728:   c9  "." 
    NOP                               ;0xd729:   00  "." 
    NOP                               ;0xd72a:   00  "." 
    NOP                               ;0xd72b:   00  "." 
    NOP                               ;0xd72c:   00  "." 
    NOP                               ;0xd72d:   00  "." 
    NOP                               ;0xd72e:   00  "." 
    NOP                               ;0xd72f:   00  "." 
    NOP                               ;0xd730:   00  "." 
    NOP                               ;0xd731:   00  "." 
    NOP                               ;0xd732:   00  "." 
    NOP                               ;0xd733:   00  "." 
    NOP                               ;0xd734:   00  "." 
;--------------------------------------
C_D735:                               ; XREF: 0xD73C 
    LD A,(DE)                         ;0xd735:   1a  "." 
    CP (HL)                           ;0xd736:   be  "." 
    JR z, C_D73A                      ;0xd737:   28 01  "(." 
    RET                               ;0xd739:   c9  "." 
;--------------------------------------
C_D73A:                               ; XREF: 0xD737 
    INC HL                            ;0xd73a:   23  "#" 
    INC DE                            ;0xd73b:   13  "." 
    JR C_D735                         ;0xd73c:   18 f7  ".." 
    LD DE,0x1a97                      ;0xd73e:   11 97 1a  "..."  
    LD C,9                            ;0xd741:   0e 09  ".."  
    CALL 0x5                          ;0xd743:   cd 05 00  "..." 
    LD B,4                            ;0xd746:   06 04  ".."  
    LD C,0x4c                         ;0xd748:   0e 4c  ".L"  
;--------------------------------------
C_D74A:                               ; XREF: 0xD77C 
    PUSH BC                           ;0xd74a:   c5  "." 
    LD DE,0x1b73                      ;0xd74b:   11 73 1b  ".s."  
    LD A,C                            ;0xd74e:   79  "y" 
    LD (DE),A                         ;0xd74f:   12  "." 
;--------------------------------------
C_D750:                               ; XREF: 0xC04F 
    LD C,0x31                         ;0xd750:   0e 31  ".1"  
    CALL 0x5                          ;0xd752:   cd 05 00  "..." 
    POP BC                            ;0xd755:   c1  "." 
    CP 0xff                           ;0xd756:   fe ff  ".." 
    JR z, C_D77E                      ;0xd758:   28 24  "($" 
    PUSH BC                           ;0xd75a:   c5  "." 
    PUSH AF                           ;0xd75b:   f5  "." 
    LD HL,0x1b32                      ;0xd75c:   21 32 1b  "!2."  
    LD A,C                            ;0xd75f:   79  "y" 
    SUB 0x4c                          ;0xd760:   d6 4c  ".L" 
    ADD A,A                           ;0xd762:   87  "." 
    ADD A,A                           ;0xd763:   87  "." 
    LD E,A                            ;0xd764:   5f  "_" 
    LD D,0                            ;0xd765:   16 00  ".."  
    ADD HL,DE                         ;0xd767:   19  "." 
    EX DE,HL                          ;0xd768:   eb  "." 
    CALL 0x1609                       ;0xd769:   cd 09 16  "..." 
    LD DE,0x1b42                      ;0xd76c:   11 42 1b  ".B."  
    CALL 0x1609                       ;0xd76f:   cd 09 16  "..." 
    POP AF                            ;0xd772:   f1  "." 
    CALL 0x1b82                       ;0xd773:   cd 82 1b  "..." 
    POP BC                            ;0xd776:   c1  "." 
    CP 0                              ;0xd777:   fe 00  ".." 
    JR z, C_D77E                      ;0xd779:   28 03  "(." 
    INC C                             ;0xd77b:   0c  "." 
    DJNZ C_D74A                       ;0xd77c:   10 cc  ".." 
;--------------------------------------
C_D77E:                               ; XREF: 0xD758 
    LD DE,0x1ad2                      ;0xd77e:   11 d2 1a  "..."  
    CALL 0x1609                       ;0xd781:   cd 09 16  "..." 
    LD DE,0x1b73                      ;0xd784:   11 73 1b  ".s."  
    LD A,0x18                         ;0xd787:   3e 18  ">."  
    LD (DE),A                         ;0xd789:   12  "." 
    LD C,0x31                         ;0xd78a:   0e 31  ".1"  
    CALL 0x5                          ;0xd78c:   cd 05 00  "..." 
    AND 0x18                          ;0xd78f:   e6 18  ".." 
    RRC A                             ;0xd791:   cb 0f  ".." 
    RRC A                             ;0xd793:   cb 0f  ".." 
    RRC A                             ;0xd795:   cb 0f  ".." 
    ADD A,A                           ;0xd797:   87  "." 
    ADD A,A                           ;0xd798:   87  "." 
    ADD A,A                           ;0xd799:   87  "." 
    LD E,A                            ;0xd79a:   5f  "_" 
    LD D,0                            ;0xd79b:   16 00  ".."  
    LD HL,0x1ab2                      ;0xd79d:   21 b2 1a  "!.."  
    ADD HL,DE                         ;0xd7a0:   19  "." 
    EX DE,HL                          ;0xd7a1:   eb  "." 
    CALL 0x1609                       ;0xd7a2:   cd 09 16  "..." 
    LD DE,0x1aed                      ;0xd7a5:   11 ed 1a  "..."  
    CALL 0x1609                       ;0xd7a8:   cd 09 16  "..." 
    LD DE,0x1b73                      ;0xd7ab:   11 73 1b  ".s."  
    LD A,0x50                         ;0xd7ae:   3e 50  ">P"  
    LD (DE),A                         ;0xd7b0:   12  "." 
    LD C,0x31                         ;0xd7b1:   0e 31  ".1"  
    CALL 0x5                          ;0xd7b3:   cd 05 00  "..." 
    CALL 0x1b82                       ;0xd7b6:   cd 82 1b  "..." 
    LD DE,0x1b12                      ;0xd7b9:   11 12 1b  "..."  
    CALL 0x1609                       ;0xd7bc:   cd 09 16  "..." 
    LD DE,0x1b73                      ;0xd7bf:   11 73 1b  ".s."  
    LD A,0x2c                         ;0xd7c2:   3e 2c  ">,"  
    LD (DE),A                         ;0xd7c4:   12  "." 
    LD C,0x31                         ;0xd7c5:   0e 31  ".1"  
    CALL 0x5                          ;0xd7c7:   cd 05 00  "..." 
    OR A                              ;0xd7ca:   b7  "." 
    JR nz, C_D7D5                     ;0xd7cb:   20 08  " ." 
    LD DE,0x1b2b                      ;0xd7cd:   11 2b 1b  ".+."  
    CALL 0x1609                       ;0xd7d0:   cd 09 16  "..." 
    JR C_D7DB                         ;0xd7d3:   18 06  ".." 
;--------------------------------------
C_D7D5:                               ; XREF: 0xD7CB 
    LD DE,0x1b2e                      ;0xd7d5:   11 2e 1b  "..."  
    CALL 0x1609                       ;0xd7d8:   cd 09 16  "..." 
;--------------------------------------
C_D7DB:                               ; XREF: 0xD7D3 
    LD DE,0x1b58                      ;0xd7db:   11 58 1b  ".X."  
    CALL 0x1609                       ;0xd7de:   cd 09 16  "..." 
    LD DE,0x1b73                      ;0xd7e1:   11 73 1b  ".s."  
    LD A,0x18                         ;0xd7e4:   3e 18  ">."  
    LD (DE),A                         ;0xd7e6:   12  "." 
    LD C,0x31                         ;0xd7e7:   0e 31  ".1"  
    CALL 0x5                          ;0xd7e9:   cd 05 00  "..." 
    AND 3                             ;0xd7ec:   e6 03  ".." 
    OR A                              ;0xd7ee:   b7  "." 
    JR nz, C_D7F9                     ;0xd7ef:   20 08  " ." 
    LD DE,0x1b2e                      ;0xd7f1:   11 2e 1b  "..."  
    CALL 0x1609                       ;0xd7f4:   cd 09 16  "..." 
    JR C_D7FF                         ;0xd7f7:   18 06  ".." 
;--------------------------------------
C_D7F9:                               ; XREF: 0xD7EF 
    LD DE,0x1b2b                      ;0xd7f9:   11 2b 1b  ".+."  
    CALL 0x1609                       ;0xd7fc:   cd 09 16  "..." 
;--------------------------------------
C_D7FF:                               ; XREF: 0xD7F7 
    LD DE,0x20b7                      ;0xd7ff:   11 b7 20  ".. "  
    JP 0x1609                         ;0xd802:   c3 09 16  "..." 
;--------------------------------------
S_d805:                               ; XREF: 
    DEFB "Drive Search Path: ", 0x0d  ;0xd805:   0xd805 to 0xd81b
    DEFB 0xa                          ;0xd819:   0xa
    DEFB 0xa                          ;0xd81a:   0xa
    DEFB 0x24                         ;0xd81b:   
    DEFB 0x3a                         ;0xd81c:   
    DEFB 0xd                          ;0xd81d:   
    DEFB 0xa                          ;0xd81e:   0xa
;--------------------------------------
S_d81f:                               ; XREF: 
    DEFB "$COM    $COM,SUB$SUB,COM$PRL,COM$", 0x0d  ;0xd81f:   0xd81f to 0xd843
    DEFB 0xa                          ;0xd841:   0xa
;--------------------------------------
S_d842:                               ; XREF: 
    DEFB "Search Order          - $", 0x0d  ;0xd842:   0xd842 to 0xd85e
    DEFB 0xa                          ;0xd85c:   0xa
;--------------------------------------
S_d85d:                               ; XREF: 
    DEFB "Temporary Drive       - $Default", 0x0d  ;0xd85d:   0xd85d to 0xd880
    DEFB 0xa                          ;0xd87e:   0xa
;--------------------------------------
S_d87f:                               ; XREF: 0xD859 
    DEFB "$Console Page Mode     - $On$Off$1st$2nd$3rd$4th$ Drive             - $", 0x0d  ;0xd87f:   0xd87f to 0xd8c9
    DEFB 0xa                          ;0xd8c7:   0xa
;--------------------------------------
S_d8c8:                               ; XREF: 
    DEFB "Program Name Display  - $"  ;0xd8c8:   0xd8c8 to 0xd8e1
    NOP                               ;0xd8e1:   00  "." 
;--------------------------------------
C_D8E2:                               ; XREF: 0xD8C0 
    NOP                               ;0xd8e2:   00  "." 
    NOP                               ;0xd8e3:   00  "." 
    NOP                               ;0xd8e4:   00  "." 
    PUSH AF                           ;0xd8e5:   f5  "." 
    ADD A,0x41                        ;0xd8e6:   c6 41  ".A" 
    LD E,A                            ;0xd8e8:   5f  "_" 
    LD C,2                            ;0xd8e9:   0e 02  ".."  
    CALL 0x5                          ;0xd8eb:   cd 05 00  "..." 
    POP AF                            ;0xd8ee:   f1  "." 
    RET                               ;0xd8ef:   c9  "." 
;--------------------------------------
D_D8F0:                               ; XREF: 0xE6F1 
    DEFB 0xf5                         ;0xd8f0:   ('u') + 0x80
;--------------------------------------
C_D8F1:                               ; XREF: 0xD8C2 
    DEFB 0xc6                         ;0xd8f1:   ('F') + 0x80
    LD B,B                            ;0xd8f2:   40  "@" 
    CP 0x40                           ;0xd8f3:   fe 40  ".@" 
    JR z, C_D905                      ;0xd8f5:   28 0e  "(." 
    LD E,A                            ;0xd8f7:   5f  "_" 
    LD C,2                            ;0xd8f8:   0e 02  ".."  
    CALL 0x5                          ;0xd8fa:   cd 05 00  "..." 
    LD DE,0x1aae                      ;0xd8fd:   11 ae 1a  "..."  
    CALL 0x1609                       ;0xd900:   cd 09 16  "..." 
    POP AF                            ;0xd903:   f1  "." 
    RET                               ;0xd904:   c9  "." 
;--------------------------------------
C_D905:                               ; XREF: 0xD8DF 
    LD DE,0x1b08                      ;0xd905:   11 08 1b  "..."  
    CALL 0x1609                       ;0xd908:   cd 09 16  "..." 
    POP AF                            ;0xd90b:   f1  "." 
    RET                               ;0xd90c:   c9  "." 
    LD E,0x3a                         ;0xd90d:   1e 3a  ".:"  
    LD C,2                            ;0xd90f:   0e 02  ".."  
    JP 0x5                            ;0xd911:   c3 05 00  "..." 
    CALL 0xa41                        ;0xd914:   cd 41 0a  ".A." 
    JP z, 0x1e94                      ;0xd917:   ca 94 1e  "..." 
;--------------------------------------
C_D91A:                               ; XREF: 0xD8D4 
    LD C,0x69                         ;0xd91a:   0e 69  ".i"  
    LD DE,0x1d28                      ;0xd91c:   11 28 1d  ".(."  
;--------------------------------------
C_D91F:                               ; XREF: 0xD8CF 
    CALL 0x5                          ;0xd91f:   cd 05 00  "..." 
    LD (0x1fa2),A                     ;0xd922:   32 a2 1f  "2.."  
    LD HL,(0xd9b)                     ;0xd925:   2a 9b 0d  "*.."  
    LD A,(HL)                         ;0xd928:   7e  "~" 
    AND 0x5f                          ;0xd929:   e6 5f  "._" 
    CP 0x53                           ;0xd92b:   fe 53  ".S" 
    JR nz, C_D944                     ;0xd92d:   20 15  " ." 
    INC HL                            ;0xd92f:   23  "#" 
    LD A,(HL)                         ;0xd930:   7e  "~" 
    AND 0x5f                          ;0xd931:   e6 5f  "._" 
    CP 0x45                           ;0xd933:   fe 45  ".E" 
    JP nz, 0x1bd6                     ;0xd935:   c2 d6 1b  "..." 
    INC HL                            ;0xd938:   23  "#" 
    LD A,(HL)                         ;0xd939:   7e  "~" 
    AND 0x5f                          ;0xd93a:   e6 5f  "._" 
    CP 0x54                           ;0xd93c:   fe 54  ".T" 
    JP nz, 0x1bd6                     ;0xd93e:   c2 d6 1b  "..." 
    JP 0x1c48                         ;0xd941:   c3 48 1c  ".H." 
;--------------------------------------
C_D944:                               ; XREF: 0xD92D 
    LD DE,0x1bea                      ;0xd944:   11 ea 1b  "..."  
;--------------------------------------
C_D947:                               ; XREF: 0xD951 
    CALL 0x1609                       ;0xd947:   cd 09 16  "..." 
    JP 0x506                          ;0xd94a:   c3 06 05  "..." 
    POP BC                            ;0xd94d:   c1  "." 
    LD DE,0x1c2c                      ;0xd94e:   11 2c 1c  ".,."  
    JR C_D947                         ;0xd951:   18 f4  ".." 
    LD DE,0x1c3a                      ;0xd953:   11 3a 1c  ".:."  
    JR C_D947                         ;0xd956:   18 ef  ".." 
;--------------------------------------
S_d958:                               ; XREF: 
    DEFB "Use DATE to read date and time, or DATE SET to set date and time.$Illegal date.$Illegal time.$", 'M' + 0x80  ;0xd958:   0xd958 to 0xd9b9
    DEFB 0x62                         ;0xd9b7:   
    DEFB 0x1d                         ;0xd9b8:   0x1d
    DEFB 0xcd                         ;0xd9b9:   
    DEFB 0xdb                         ;0xd9ba:   
    DEFB 0x1d                         ;0xd9bb:   0x1d
;--------------------------------------
D_D9BC:                               ; XREF: 0xC345 0xD036 
    DEFB 0x3a                         ;0xd9bc:   ":"
    DEFB 0x27                         ;0xd9bd:   "'"
    DEFB 0x1d                         ;0xd9be:   0x1d
    DEFB 0xfe                         ;0xd9bf:   ('~') + 0x80
;--------------------------------------
C_D9C0:                               ; XREF: 0xD97A 
    NOP                               ;0xd9c0:   00  "." 
    JP z, 0x1cc8                      ;0xd9c1:   ca c8 1c  "..." 
    LD HL,0                           ;0xd9c4:   21 00 00  "!.."  
    LD C,0                            ;0xd9c7:   0e 00  ".."  
    LD A,(0x1f9b)                     ;0xd9c9:   3a 9b 1f  ":.."  
    SUB 0x4d                          ;0xd9cc:   d6 4d  ".M" 
;--------------------------------------
C_D9CE:                               ; XREF: 0xD968 
    LD B,A                            ;0xd9ce:   47  "G" 
;--------------------------------------
C_D9CF:                               ; XREF: 0xD9EF 
    LD DE,0x16d                       ;0xd9cf:   11 6d 01  ".m."  
    ADD HL,DE                         ;0xd9d2:   19  "." 
    DEC B                             ;0xd9d3:   05  "." 
;--------------------------------------
C_D9D4:                               ; XREF: 0xD97F 
    JR z, C_D9F1                      ;0xd9d4:   28 1b  "(." 
;--------------------------------------
C_D9D6:                               ; XREF: 0xD960 
    LD DE,0x16d                       ;0xd9d6:   11 6d 01  ".m."  
    ADD HL,DE                         ;0xd9d9:   19  "." 
    DEC B                             ;0xd9da:   05  "." 
    JR z, C_D9F1                      ;0xd9db:   28 14  "(." 
    LD C,1                            ;0xd9dd:   0e 01  ".."  
    LD DE,0x16e                       ;0xd9df:   11 6e 01  ".n."  
    ADD HL,DE                         ;0xd9e2:   19  "." 
    DEC B                             ;0xd9e3:   05  "." 
    JR z, C_D9F1                      ;0xd9e4:   28 0b  "(." 
    LD C,0                            ;0xd9e6:   0e 00  ".."  
;--------------------------------------
C_D9E8:                               ; XREF: 0xD977 
    LD DE,0x16d                       ;0xd9e8:   11 6d 01  ".m."  
    ADD HL,DE                         ;0xd9eb:   19  "." 
    DEC B                             ;0xd9ec:   05  "." 
    JR z, C_D9F1                      ;0xd9ed:   28 02  "(." 
    JR C_D9CF                         ;0xd9ef:   18 de  ".." 
;--------------------------------------
C_D9F1:                               ; XREF: 0xD9D4 
    LD DE,0x16d                       ;0xd9f1:   11 6d 01  ".m."  
    LD A,C                            ;0xd9f4:   79  "y" 
    CP 1                              ;0xd9f5:   fe 01  ".." 
    CALL z, 0x1cbc                    ;0xd9f7:   cc bc 1c  "..." 
    SBC HL,DE                         ;0xd9fa:   ed 52  ".R" 
    LD IX,0x1f0d                      ;0xd9fc:   dd 21 0d 1f  ".!.."  
    LD A,(0x1f9c)                     ;0xda00:   3a 9c 1f  ":.."  
    DEC A                             ;0xda03:   3d  "=" 
    JR z, C_DA2C                      ;0xda04:   28 26  "(&" 
    LD B,1                            ;0xda06:   06 01  ".."  
;--------------------------------------
C_DA08:                               ; XREF: 0xDA1B 
    LD A,B                            ;0xda08:   78  "x" 
;--------------------------------------
C_DA09:                               ; XREF: 0xD993 
    CP 2                              ;0xda09:   fe 02  ".." 
    JR z, C_DA1F                      ;0xda0b:   28 12  "(." 
;--------------------------------------
C_DA0D:                               ; XREF: 0xDA22 
    LD A,(IX+0)                       ;0xda0d:   dd 7e 00  ".~." 
;--------------------------------------
C_DA10:                               ; XREF: 0xDA28 
    LD E,A                            ;0xda10:   5f  "_" 
    LD D,0                            ;0xda11:   16 00  ".."  
    ADD HL,DE                         ;0xda13:   19  "." 
    INC IX                            ;0xda14:   dd 23  ".#" 
    INC B                             ;0xda16:   04  "." 
    LD A,(0x1f9c)                     ;0xda17:   3a 9c 1f  ":.."  
    CP B                              ;0xda1a:   b8  "." 
    JR nz, C_DA08                     ;0xda1b:   20 eb  " ." 
    JR C_DA2C                         ;0xda1d:   18 0d  ".." 
;--------------------------------------
C_DA1F:                               ; XREF: 0xDA0B 
    LD A,C                            ;0xda1f:   79  "y" 
    CP 0                              ;0xda20:   fe 00  ".." 
    JR z, C_DA0D                      ;0xda22:   28 e9  "(." 
    LD A,(IX+0)                       ;0xda24:   dd 7e 00  ".~." 
    INC A                             ;0xda27:   3c  "<" 
    JR C_DA10                         ;0xda28:   18 e6  ".." 
    INC DE                            ;0xda2a:   13  "." 
    RET                               ;0xda2b:   c9  "." 
;--------------------------------------
C_DA2C:                               ; XREF: 0xDA04 
    LD A,(0x1f9d)                     ;0xda2c:   3a 9d 1f  ":.."  
    LD E,A                            ;0xda2f:   5f  "_" 
    LD D,0                            ;0xda30:   16 00  ".."  
    ADD HL,DE                         ;0xda32:   19  "." 
    LD (0x1d28),HL                    ;0xda33:   22 28 1d  ""(."  
    LD A,(0x1e55)                     ;0xda36:   3a 55 1e  ":U."  
    CP 0                              ;0xda39:   fe 00  ".." 
    JR z, C_DA4A                      ;0xda3b:   28 0d  "(." 
    LD DE,0x1d09                      ;0xda3d:   11 09 1d  "..."  
    LD C,9                            ;0xda40:   0e 09  ".."  
    CALL 0x5                          ;0xda42:   cd 05 00  "..." 
    LD C,1                            ;0xda45:   0e 01  ".."  
    CALL 0x5                          ;0xda47:   cd 05 00  "..." 
;--------------------------------------
C_DA4A:                               ; XREF: 0xDA3B 
    LD DE,0x1d28                      ;0xda4a:   11 28 1d  ".(."  
    LD C,0x68                         ;0xda4d:   0e 68  ".h"  
    CALL 0x5                          ;0xda4f:   cd 05 00  "..." 
    LD A,(0x1e55)                     ;0xda52:   3a 55 1e  ":U."  
    CP 0                              ;0xda55:   fe 00  ".." 
    JR z, C_DA69                      ;0xda57:   28 10  "(." 
    LD DE,0x1fa0                      ;0xda59:   11 a0 1f  "..."  
    LD C,0x31                         ;0xda5c:   0e 31  ".1"  
    CALL 0x5                          ;0xda5e:   cd 05 00  "..." 
    LD DE,0x1d01                      ;0xda61:   11 01 1d  "..."  
    LD C,0x32                         ;0xda64:   0e 32  ".2"  
    CALL 0x5                          ;0xda66:   cd 05 00  "..." 
;--------------------------------------
C_DA69:                               ; XREF: 0xDA57 
    LD DE,0x1d24                      ;0xda69:   11 24 1d  ".$."  
    JP 0x1609                         ;0xda6c:   c3 09 16  "..." 
    LD A,(DE)                         ;0xda6f:   1a  "." 
    NOP                               ;0xda70:   00  "." 
    RST 0x38                          ;0xda71:   ff  "." 
    NOP                               ;0xda72:   00  "." 
    NOP                               ;0xda73:   00  "." 
    NOP                               ;0xda74:   00  "." 
    NOP                               ;0xda75:   00  "." 
    NOP                               ;0xda76:   00  "." 
;--------------------------------------
S_da77:                               ; XREF: 
    DEFB "Press any key to set time $", 0x0d  ;0xda77:   0xda77 to 0xda95
    DEFB 0xa                          ;0xda93:   0xa
    DEFB 0x24                         ;0xda94:   
    DEFB 0x0                          ;0xda95:   
    DEFB 0x0                          ;0xda96:   
    DEFB 0x0                          ;0xda97:   
    DEFB 0x0                          ;0xda98:   
    DEFB 0x0                          ;0xda99:   
;--------------------------------------
S_da9a:                               ; XREF: 
    DEFB "Enter date as mm/dd/yy : $Enter time as hh:mm:ss : $", 0x00  ;0xda9a:   0xda9a to 0xdad1
    DEFB 0x0                          ;0xdacf:   
    DEFB 0x3e                         ;0xdad0:   
    DEFB 0x0                          ;0xdad1:   
    DEFB 0x32                         ;0xdad2:   
    DEFB 0x27                         ;0xdad3:   
    DEFB 0x1d                         ;0xdad4:   0x1d
    DEFB 0x11                         ;0xdad5:   0x11
    DEFB 0x2c                         ;0xdad6:   
    DEFB 0x1d                         ;0xdad7:   0x1d
;--------------------------------------
C_DAD8:                               ; XREF: 0xDAB2 
    CALL 0x949                        ;0xdad8:   cd 49 09  ".I." 
    CALL 0x94e                        ;0xdadb:   cd 4e 09  ".N." 
    CALL 0x9f6                        ;0xdade:   cd f6 09  "..." 
    LD A,(HL)                         ;0xdae1:   7e  "~" 
    OR A                              ;0xdae2:   b7  "." 
    RET z                             ;0xdae3:   c8  "." 
    CALL 0x1dca                       ;0xdae4:   cd ca 1d  "..." 
    INC C                             ;0xdae7:   0c  "." 
    DEC C                             ;0xdae8:   0d  "." 
    JP z, 0x1bdf                      ;0xdae9:   ca df 1b  "..." 
;--------------------------------------
C_DAEC:                               ; XREF: 0xDAB0 
    LD (0x1f9c),A                     ;0xdaec:   32 9c 1f  "2.."  
    INC HL                            ;0xdaef:   23  "#" 
    LD A,(HL)                         ;0xdaf0:   7e  "~" 
    CP 0x2f                           ;0xdaf1:   fe 2f  "./" 
    JP nz, 0x1bdf                     ;0xdaf3:   c2 df 1b  "..." 
    INC HL                            ;0xdaf6:   23  "#" 
    CALL 0x1dca                       ;0xdaf7:   cd ca 1d  "..." 
;--------------------------------------
C_DAFA:                               ; XREF: 0xDA84 
    INC C                             ;0xdafa:   0c  "." 
    DEC C                             ;0xdafb:   0d  "." 
;--------------------------------------
C_DAFC:                               ; XREF: 0xDA87 
    JP z, 0x1bdf                      ;0xdafc:   ca df 1b  "..." 
    LD (0x1f9d),A                     ;0xdaff:   32 9d 1f  "2.."  
    INC HL                            ;0xdb02:   23  "#" 
    LD A,(HL)                         ;0xdb03:   7e  "~" 
    CP 0x2f                           ;0xdb04:   fe 2f  "./" 
;--------------------------------------
C_DB06:                               ; XREF: 0xDACA 
    JP nz, 0x1bdf                     ;0xdb06:   c2 df 1b  "..." 
    INC HL                            ;0xdb09:   23  "#" 
    CALL 0x1dca                       ;0xdb0a:   cd ca 1d  "..." 
    INC C                             ;0xdb0d:   0c  "." 
    DEC C                             ;0xdb0e:   0d  "." 
    JP z, 0x1bdf                      ;0xdb0f:   ca df 1b  "..." 
    LD (0x1f9b),A                     ;0xdb12:   32 9b 1f  "2.."  
    CP 0x4e                           ;0xdb15:   fe 4e  ".N" 
    JP c, 0x1bdf                      ;0xdb17:   da df 1b  "..." 
    LD A,(0x1f9c)                     ;0xdb1a:   3a 9c 1f  ":.."  
    OR A                              ;0xdb1d:   b7  "." 
    JP z, 0x1bdf                      ;0xdb1e:   ca df 1b  "..." 
;--------------------------------------
C_DB21:                               ; XREF: 0xDABE 
    CP 13                             ;0xdb21:   fe 0d  ".." 
    JP nc, 0x1bdf                     ;0xdb23:   d2 df 1b  "..." 
    LD A,(0x1f9d)                     ;0xdb26:   3a 9d 1f  ":.."  
    OR A                              ;0xdb29:   b7  "." 
    JP z, 0x1bdf                      ;0xdb2a:   ca df 1b  "..." 
    CP 0x20                           ;0xdb2d:   fe 20  ". " 
;--------------------------------------
C_DB2F:                               ; XREF: 0xDAB9 
    JP nc, 0x1bdf                     ;0xdb2f:   d2 df 1b  "..." 
    LD A,1                            ;0xdb32:   3e 01  ">."  
    LD (0x1d27),A                     ;0xdb34:   32 27 1d  "2'."  
    RET                               ;0xdb37:   c9  "." 
    CALL 0x1e7c                       ;0xdb38:   cd 7c 1e  ".|." 
    DEC C                             ;0xdb3b:   0d  "." 
    RET z                             ;0xdb3c:   c8  "." 
    CALL 0x1e8a                       ;0xdb3d:   cd 8a 1e  "..." 
    LD D,A                            ;0xdb40:   57  "W" 
    INC HL                            ;0xdb41:   23  "#" 
    CALL 0x1e7c                       ;0xdb42:   cd 7c 1e  ".|." 
    DEC C                             ;0xdb45:   0d  "." 
    RET z                             ;0xdb46:   c8  "." 
    ADD A,D                           ;0xdb47:   82  "." 
    RET                               ;0xdb48:   c9  "." 
    XOR A                             ;0xdb49:   af  "." 
    LD (0x1e55),A                     ;0xdb4a:   32 55 1e  "2U."  
    LD DE,0x1d46                      ;0xdb4d:   11 46 1d  ".F."  
    CALL 0x949                        ;0xdb50:   cd 49 09  ".I." 
    CALL 0x94e                        ;0xdb53:   cd 4e 09  ".N." 
    CALL 0x9f6                        ;0xdb56:   cd f6 09  "..." 
    LD A,(HL)                         ;0xdb59:   7e  "~" 
    OR A                              ;0xdb5a:   b7  "." 
    RET z                             ;0xdb5b:   c8  "." 
    CALL 0x1dca                       ;0xdb5c:   cd ca 1d  "..." 
    INC C                             ;0xdb5f:   0c  "." 
    DEC C                             ;0xdb60:   0d  "." 
    JP z, 0x1be5                      ;0xdb61:   ca e5 1b  "..." 
    LD (0x1f9e),A                     ;0xdb64:   32 9e 1f  "2.."  
    INC HL                            ;0xdb67:   23  "#" 
    LD A,(HL)                         ;0xdb68:   7e  "~" 
    CP 0x3a                           ;0xdb69:   fe 3a  ".:" 
    JP nz, 0x1be5                     ;0xdb6b:   c2 e5 1b  "..." 
    INC HL                            ;0xdb6e:   23  "#" 
    CALL 0x1dca                       ;0xdb6f:   cd ca 1d  "..." 
    INC C                             ;0xdb72:   0c  "." 
    DEC C                             ;0xdb73:   0d  "." 
    JP z, 0x1be5                      ;0xdb74:   ca e5 1b  "..." 
    LD (0x1f9f),A                     ;0xdb77:   32 9f 1f  "2.."  
    INC HL                            ;0xdb7a:   23  "#" 
    LD A,(HL)                         ;0xdb7b:   7e  "~" 
    CP 0x3a                           ;0xdb7c:   fe 3a  ".:" 
    JP nz, 0x1be5                     ;0xdb7e:   c2 e5 1b  "..." 
    INC HL                            ;0xdb81:   23  "#" 
    CALL 0x1dca                       ;0xdb82:   cd ca 1d  "..." 
    INC C                             ;0xdb85:   0c  "." 
    DEC C                             ;0xdb86:   0d  "." 
    JP z, 0x1be5                      ;0xdb87:   ca e5 1b  "..." 
    LD (0x1fa2),A                     ;0xdb8a:   32 a2 1f  "2.."  
    LD A,(0x1f9e)                     ;0xdb8d:   3a 9e 1f  ":.."  
    CALL 0x1e56                       ;0xdb90:   cd 56 1e  ".V." 
    LD (0x1d2a),A                     ;0xdb93:   32 2a 1d  "2*."  
    LD A,(0x1f9f)                     ;0xdb96:   3a 9f 1f  ":.."  
    CALL 0x1e56                       ;0xdb99:   cd 56 1e  ".V." 
    LD (0x1d2b),A                     ;0xdb9c:   32 2b 1d  "2+."  
    LD A,(0x1fa2)                     ;0xdb9f:   3a a2 1f  ":.."  
    CALL 0x1e56                       ;0xdba2:   cd 56 1e  ".V." 
    LD (0x1fa2),A                     ;0xdba5:   32 a2 1f  "2.."  
    LD A,1                            ;0xdba8:   3e 01  ">."  
    LD (0x1e55),A                     ;0xdbaa:   32 55 1e  "2U."  
    LD A,(0x1f9e)                     ;0xdbad:   3a 9e 1f  ":.."  
    CP 0x19                           ;0xdbb0:   fe 19  ".." 
    JP nc, 0x1be5                     ;0xdbb2:   d2 e5 1b  "..." 
    LD A,(0x1f9f)                     ;0xdbb5:   3a 9f 1f  ":.."  
    CP 0x3c                           ;0xdbb8:   fe 3c  ".<" 
    JP nc, 0x1be5                     ;0xdbba:   d2 e5 1b  "..." 
    CP 0x3c                           ;0xdbbd:   fe 3c  ".<" 
    JP nc, 0x1be5                     ;0xdbbf:   d2 e5 1b  "..." 
    RET                               ;0xdbc2:   c9  "." 
    NOP                               ;0xdbc3:   00  "." 
    PUSH HL                           ;0xdbc4:   e5  "." 
    LD D,10                           ;0xdbc5:   16 0a  ".."  
    CALL 0x1e6e                       ;0xdbc7:   cd 6e 1e  ".n." 
    LD L,C                            ;0xdbca:   69  "i" 
    LD D,1                            ;0xdbcb:   16 01  ".."  
    CALL 0x1e6e                       ;0xdbcd:   cd 6e 1e  ".n." 
    LD A,L                            ;0xdbd0:   7d  "}" 
    RLC A                             ;0xdbd1:   cb 07  ".." 
    RLC A                             ;0xdbd3:   cb 07  ".." 
    RLC A                             ;0xdbd5:   cb 07  ".." 
    RLC A                             ;0xdbd7:   cb 07  ".." 
    OR C                              ;0xdbd9:   b1  "." 
    POP HL                            ;0xdbda:   e1  "." 
;--------------------------------------
C_DBDB:                               ; XREF: 0xF3B1 
    RET                               ;0xdbdb:   c9  "." 
    LD E,0                            ;0xdbdc:   1e 00  ".."  
    LD C,0                            ;0xdbde:   0e 00  ".."  
;--------------------------------------
C_DBE0:                               ; XREF: 0xDBE4 
    SUB D                             ;0xdbe0:   92  "." 
    JR c, C_DBE6                      ;0xdbe1:   38 03  "8." 
    INC C                             ;0xdbe3:   0c  "." 
    JR C_DBE0                         ;0xdbe4:   18 fa  ".." 
;--------------------------------------
C_DBE6:                               ; XREF: 0xDBE1 
    ADD A,D                           ;0xdbe6:   82  "." 
    PUSH AF                           ;0xdbe7:   f5  "." 
    POP AF                            ;0xdbe8:   f1  "." 
    RET                               ;0xdbe9:   c9  "." 
    LD C,1                            ;0xdbea:   0e 01  ".."  
    LD A,(HL)                         ;0xdbec:   7e  "~" 
    CP 0x30                           ;0xdbed:   fe 30  ".0" 
    RET c                             ;0xdbef:   d8  "." 
    CP 0x3a                           ;0xdbf0:   fe 3a  ".:" 
    RET nc                            ;0xdbf2:   d0  "." 
    LD C,0                            ;0xdbf3:   0e 00  ".."  
    SUB 0x30                          ;0xdbf5:   d6 30  ".0" 
    RET                               ;0xdbf7:   c9  "." 
    LD B,A                            ;0xdbf8:   47  "G" 
    LD A,0                            ;0xdbf9:   3e 00  ">."  
    CP B                              ;0xdbfb:   b8  "." 
    RET z                             ;0xdbfc:   c8  "." 
;--------------------------------------
C_DBFD:                               ; XREF: 0xDBFF 
    ADD A,10                          ;0xdbfd:   c6 0a  ".." 
    DJNZ C_DBFD                       ;0xdbff:   10 fc  ".." 
    DEFB 0xc9                         ;0xdc01:   ('I') + 0x80
    DEFB 0xe                          ;0xdc02:   0xe
    DEFB 0x69                         ;0xdc03:   "i"
    DEFB 0x11                         ;0xdc04:   0x11
    DEFB 0xc7                         ;0xdc05:   ('G') + 0x80
    DEFB 0x1f                         ;0xdc06:   0x1f
    DEFB 0xcd                         ;0xdc07:   ('M') + 0x80
    DEFB 0x5                          ;0xdc08:   0x5
    DEFB 0x0                          ;0xdc09:   0x0
    DEFB 0xf5                         ;0xdc0a:   ('u') + 0x80
    DEFB 0x11                         ;0xdc0b:   0x11
    DEFB 0xcb                         ;0xdc0c:   ('K') + 0x80
    DEFB 0x1f                         ;0xdc0d:   0x1f
    DEFB 0xcd                         ;0xdc0e:   ('M') + 0x80
    DEFB 0x9                          ;0xdc0f:   0x9
    DEFB 0x16                         ;0xdc10:   0x16
    DEFB 0x2a                         ;0xdc11:   "*"
    DEFB 0xc7                         ;0xdc12:   ('G') + 0x80
    DEFB 0x1f                         ;0xdc13:   0x1f
    DEFB 0xe                          ;0xdc14:   0xe
    DEFB 0x0                          ;0xdc15:   0x0
    DEFB 0x6                          ;0xdc16:   0x6
    DEFB 0x0                          ;0xdc17:   0x0
;--------------------------------------
C_DC18:                               ; XREF: 0xDC4B 
    LD (0x1f99),HL                    ;0xdc18:   22 99 1f  "".."  
    LD DE,0x16d                       ;0xdc1b:   11 6d 01  ".m."  
    SBC HL,DE                         ;0xdc1e:   ed 52  ".R" 
    JR c, C_DC4D                      ;0xdc20:   38 2b  "8+" 
    INC B                             ;0xdc22:   04  "." 
    LD (0x1f99),HL                    ;0xdc23:   22 99 1f  "".."  
    LD DE,0x16d                       ;0xdc26:   11 6d 01  ".m."  
    SBC HL,DE                         ;0xdc29:   ed 52  ".R" 
    JR c, C_DC4D                      ;0xdc2b:   38 20  "8 " 
    LD C,1                            ;0xdc2d:   0e 01  ".."  
    INC B                             ;0xdc2f:   04  "." 
    LD (0x1f99),HL                    ;0xdc30:   22 99 1f  "".."  
    LD DE,0x16e                       ;0xdc33:   11 6e 01  ".n."  
    SBC HL,DE                         ;0xdc36:   ed 52  ".R" 
    JR c, C_DC4D                      ;0xdc38:   38 13  "8." 
    LD C,0                            ;0xdc3a:   0e 00  ".."  
    INC B                             ;0xdc3c:   04  "." 
    LD (0x1f99),HL                    ;0xdc3d:   22 99 1f  "".."  
    LD DE,0x16d                       ;0xdc40:   11 6d 01  ".m."  
    SBC HL,DE                         ;0xdc43:   ed 52  ".R" 
    JR c, C_DC4D                      ;0xdc45:   38 06  "8." 
    LD (0x1f99),HL                    ;0xdc47:   22 99 1f  "".."  
    INC B                             ;0xdc4a:   04  "." 
    JR C_DC18                         ;0xdc4b:   18 cb  ".." 
;--------------------------------------
C_DC4D:                               ; XREF: 0xDC20 
    LD A,B                            ;0xdc4d:   78  "x" 
    LD (0x1f9b),A                     ;0xdc4e:   32 9b 1f  "2.."  
    LD HL,(0x1f99)                    ;0xdc51:   2a 99 1f  "*.."  
    LD IX,0x1f0d                      ;0xdc54:   dd 21 0d 1f  ".!.."  
    LD B,1                            ;0xdc58:   06 01  ".."  
;--------------------------------------
C_DC5A:                               ; XREF: 0xDC6F 
    LD A,B                            ;0xdc5a:   78  "x" 
    CP 2                              ;0xdc5b:   fe 02  ".." 
    JR z, C_DC71                      ;0xdc5d:   28 12  "(." 
;--------------------------------------
C_DC5F:                               ; XREF: 0xDC73 
    LD A,(IX+0)                       ;0xdc5f:   dd 7e 00  ".~." 
;--------------------------------------
C_DC62:                               ; XREF: 0xDC79 
    LD (0x1f99),HL                    ;0xdc62:   22 99 1f  "".."  
    LD E,A                            ;0xdc65:   5f  "_" 
    LD D,0                            ;0xdc66:   16 00  ".."  
    SBC HL,DE                         ;0xdc68:   ed 52  ".R" 
    JR c, C_DC87                      ;0xdc6a:   38 1b  "8." 
    INC B                             ;0xdc6c:   04  "." 
    INC IX                            ;0xdc6d:   dd 23  ".#" 
    JR C_DC5A                         ;0xdc6f:   18 e9  ".." 
;--------------------------------------
C_DC71:                               ; XREF: 0xDC5D 
    LD A,C                            ;0xdc71:   79  "y" 
    OR A                              ;0xdc72:   b7  "." 
    JR z, C_DC5F                      ;0xdc73:   28 ea  "(." 
    LD A,(IX+0)                       ;0xdc75:   dd 7e 00  ".~." 
    INC A                             ;0xdc78:   3c  "<" 
    JR C_DC62                         ;0xdc79:   18 e7  ".." 
    RRA                               ;0xdc7b:   1f  "." 
    INC E                             ;0xdc7c:   1c  "." 
    RRA                               ;0xdc7d:   1f  "." 
    LD E,0x1f                         ;0xdc7e:   1e 1f  ".."  
    LD E,0x1f                         ;0xdc80:   1e 1f  ".."  
    RRA                               ;0xdc82:   1f  "." 
    LD E,0x1f                         ;0xdc83:   1e 1f  ".."  
    LD E,0x1f                         ;0xdc85:   1e 1f  ".."  
;--------------------------------------
C_DC87:                               ; XREF: 0xDC6A 
    LD HL,(0x1f99)                    ;0xdc87:   2a 99 1f  "*.."  
    LD A,B                            ;0xdc8a:   78  "x" 
    LD (0x1f9c),A                     ;0xdc8b:   32 9c 1f  "2.."  
    INC L                             ;0xdc8e:   2c  "," 
    LD A,L                            ;0xdc8f:   7d  "}" 
    LD (0x1f9d),A                     ;0xdc90:   32 9d 1f  "2.."  
    LD A,(0x1f9d)                     ;0xdc93:   3a 9d 1f  ":.."  
    CALL 0x1ff6                       ;0xdc96:   cd f6 1f  "..." 
    LD E,0x20                         ;0xdc99:   1e 20  ". "  
    LD C,2                            ;0xdc9b:   0e 02  ".."  
    CALL 0x5                          ;0xdc9d:   cd 05 00  "..." 
    CALL 0x1f52                       ;0xdca0:   cd 52 1f  ".R." 
    LD E,0x20                         ;0xdca3:   1e 20  ". "  
    LD C,2                            ;0xdca5:   0e 02  ".."  
    CALL 0x5                          ;0xdca7:   cd 05 00  "..." 
    LD A,(0x1f9b)                     ;0xdcaa:   3a 9b 1f  ":.."  
    LD L,A                            ;0xdcad:   6f  "o" 
    LD H,0                            ;0xdcae:   26 00  "&."  
    LD DE,0x7ba                       ;0xdcb0:   11 ba 07  "..."  
    ADD HL,DE                         ;0xdcb3:   19  "." 
    CALL 0x16fb                       ;0xdcb4:   cd fb 16  "..." 
    LD DE,0x1fd2                      ;0xdcb7:   11 d2 1f  "..."  
    CALL 0x1609                       ;0xdcba:   cd 09 16  "..." 
    JP 0x1fa3                         ;0xdcbd:   c3 a3 1f  "..." 
    LD HL,0x1f69                      ;0xdcc0:   21 69 1f  "!i."  
    LD A,(0x1f9c)                     ;0xdcc3:   3a 9c 1f  ":.."  
    DEC A                             ;0xdcc6:   3d  "=" 
    LD B,A                            ;0xdcc7:   47  "G" 
    JR z, C_DCD2                      ;0xdcc8:   28 08  "(." 
;--------------------------------------
C_DCCA:                               ; XREF: 0xDCCE 
    LD A,(HL)                         ;0xdcca:   7e  "~" 
    CP 0x24                           ;0xdccb:   fe 24  ".$" 
    INC HL                            ;0xdccd:   23  "#" 
    JR nz, C_DCCA                     ;0xdcce:   20 fa  " ." 
    DJNZ C_DCCA                       ;0xdcd0:   10 f8  ".." 
;--------------------------------------
C_DCD2:                               ; XREF: 0xDCC8 
    PUSH HL                           ;0xdcd2:   e5  "." 
    POP DE                            ;0xdcd3:   d1  "." 
    JP 0x1609                         ;0xdcd4:   c3 09 16  "..." 
;--------------------------------------
S_dcd7:                               ; XREF: 
    DEFB "Jan$Feb$Mar$Apr$May$Jun$Jul$Aug$Sep$Oct$Nov$Dec$", 0x00  ;0xdcd7:   0xdcd7 to 0xdd0a
    DEFB 0x0                          ;0xdd08:   
    DEFB 0x0                          ;0xdd09:   
    DEFB 0x0                          ;0xdd0a:   
    DEFB 0x0                          ;0xdd0b:   
    DEFB 0x0                          ;0xdd0c:   
    DEFB 0x0                          ;0xdd0d:   
    DEFB 0x5c                         ;0xdd0e:   
    DEFB 0xff                         ;0xdd0f:   
    DEFB 0x0                          ;0xdd10:   
    DEFB 0x3a                         ;0xdd11:   
    DEFB 0xc9                         ;0xdd12:   
    DEFB 0x1f                         ;0xdd13:   0x1f
    DEFB 0xcd                         ;0xdd14:   
    DEFB 0xd7                         ;0xdd15:   
    DEFB 0x1f                         ;0xdd16:   0x1f
    DEFB 0x1e                         ;0xdd17:   0x1e
    DEFB 0x3a                         ;0xdd18:   
    DEFB 0xe                          ;0xdd19:   0xe
    DEFB 0x2                          ;0xdd1a:   0x2
    DEFB 0xcd                         ;0xdd1b:   
    DEFB 0x5                          ;0xdd1c:   0x5
    DEFB 0x0                          ;0xdd1d:   
    DEFB 0x3a                         ;0xdd1e:   
    DEFB 0xca                         ;0xdd1f:   
    DEFB 0x1f                         ;0xdd20:   0x1f
    DEFB 0xcd                         ;0xdd21:   
    DEFB 0xd7                         ;0xdd22:   
    DEFB 0x1f                         ;0xdd23:   0x1f
    DEFB 0x1e                         ;0xdd24:   0x1e
    DEFB 0x3a                         ;0xdd25:   
    DEFB 0xe                          ;0xdd26:   0xe
    DEFB 0x2                          ;0xdd27:   0x2
    DEFB 0xcd                         ;0xdd28:   
    DEFB 0x5                          ;0xdd29:   0x5
    DEFB 0x0                          ;0xdd2a:   
    DEFB 0xf1                         ;0xdd2b:   
    DEFB 0xcd                         ;0xdd2c:   
    DEFB 0xd7                         ;0xdd2d:   
    DEFB 0x1f                         ;0xdd2e:   0x1f
    DEFB 0x11                         ;0xdd2f:   0x11
    DEFB 0xb7                         ;0xdd30:   
    DEFB 0x20                         ;0xdd31:   
    DEFB 0xc3                         ;0xdd32:   
    DEFB 0x9                          ;0xdd33:   0x9
    DEFB 0x16                         ;0xdd34:   0x16
    DEFB 0x0                          ;0xdd35:   
    DEFB 0x0                          ;0xdd36:   
    DEFB 0x0                          ;0xdd37:   
    DEFB 0x0                          ;0xdd38:   
;--------------------------------------
S_dd39:                               ; XREF: 
    DEFB 0x49                         ;0xdd39:   
    DEFB "t is $ at $", 0x20          ;0xdd3a:   0xdd3a to 0xdd3b
    DEFB 0xe6                         ;0xdd46:   
    DEFB 0xf0                         ;0xdd47:   
    DEFB 0xcb                         ;0xdd48:   
    DEFB 0xf                          ;0xdd49:   0xf
    DEFB 0xcb                         ;0xdd4a:   
    DEFB 0xf                          ;0xdd4b:   0xf
    DEFB 0xcb                         ;0xdd4c:   
    DEFB 0xf                          ;0xdd4d:   0xf
    DEFB 0xcb                         ;0xdd4e:   
    DEFB 0xf                          ;0xdd4f:   0xf
    DEFB 0xc6                         ;0xdd50:   
    DEFB 0x30                         ;0xdd51:   
    DEFB 0x5f                         ;0xdd52:   
    DEFB 0xe                          ;0xdd53:   0xe
    DEFB 0x2                          ;0xdd54:   0x2
    DEFB 0xcd                         ;0xdd55:   
    DEFB 0x5                          ;0xdd56:   0x5
    DEFB 0x0                          ;0xdd57:   
    DEFB 0xf1                         ;0xdd58:   
    DEFB 0xe6                         ;0xdd59:   
    DEFB 0xf                          ;0xdd5a:   0xf
    DEFB 0xc6                         ;0xdd5b:   
    DEFB 0x30                         ;0xdd5c:   
    DEFB 0x5f                         ;0xdd5d:   
    DEFB 0xe                          ;0xdd5e:   0xe
    DEFB 0x2                          ;0xdd5f:   0x2
    DEFB 0xcd                         ;0xdd60:   
    DEFB 0x5                          ;0xdd61:   0x5
    DEFB 0x0                          ;0xdd62:   
    DEFB 0xc9                         ;0xdd63:   
;--------------------------------------
C_DD64:                               ; XREF: 0xDD3E 
    LD D,10                           ;0xdd64:   16 0a  ".."  
    LD H,0                            ;0xdd66:   26 00  "&."  
    CALL 0x2001                       ;0xdd68:   cd 01 20  ".. " 
    LD H,1                            ;0xdd6b:   26 01  "&."  
    LD D,1                            ;0xdd6d:   16 01  ".."  
    LD C,0                            ;0xdd6f:   0e 00  ".."  
;--------------------------------------
C_DD71:                               ; XREF: 0xDD75 
    SUB D                             ;0xdd71:   92  "." 
    JR c, C_DD77                      ;0xdd72:   38 03  "8." 
    INC C                             ;0xdd74:   0c  "." 
    JR C_DD71                         ;0xdd75:   18 fa  ".." 
;--------------------------------------
C_DD77:                               ; XREF: 0xDD72 
    ADD A,D                           ;0xdd77:   82  "." 
    PUSH AF                           ;0xdd78:   f5  "." 
    LD A,C                            ;0xdd79:   79  "y" 
    ADD A,0x30                        ;0xdd7a:   c6 30  ".0" 
    PUSH AF                           ;0xdd7c:   f5  "." 
    CP 0x30                           ;0xdd7d:   fe 30  ".0" 
    JR nz, C_DD85                     ;0xdd7f:   20 04  " ." 
    LD A,H                            ;0xdd81:   7c  "|" 
    OR A                              ;0xdd82:   b7  "." 
    JR z, C_DD8E                      ;0xdd83:   28 09  "(." 
;--------------------------------------
C_DD85:                               ; XREF: 0xDD7F 
    POP AF                            ;0xdd85:   f1  "." 
    LD E,A                            ;0xdd86:   5f  "_" 
    LD C,2                            ;0xdd87:   0e 02  ".."  
    CALL 0x5                          ;0xdd89:   cd 05 00  "..." 
    POP AF                            ;0xdd8c:   f1  "." 
    RET                               ;0xdd8d:   c9  "." 
;--------------------------------------
C_DD8E:                               ; XREF: 0xDD83 
    LD A,0x20                         ;0xdd8e:   3e 20  "> "  
    LD E,A                            ;0xdd90:   5f  "_" 
    LD C,2                            ;0xdd91:   0e 02  ".."  
    CALL 0x5                          ;0xdd93:   cd 05 00  "..." 
    POP AF                            ;0xdd96:   f1  "." 
    POP AF                            ;0xdd97:   f1  "." 
    RET                               ;0xdd98:   c9  "." 
    LD DE,0x20b4                      ;0xdd99:   11 b4 20  ".. "  
    LD C,9                            ;0xdd9c:   0e 09  ".."  
    CALL 0x5                          ;0xdd9e:   cd 05 00  "..." 
    LD C,15                           ;0xdda1:   0e 0f  ".."  
;--------------------------------------
C_DDA3:                               ; XREF: 0xDD40 
    LD B,0                            ;0xdda3:   06 00  ".."  
;--------------------------------------
C_DDA5:                               ; XREF: 0xDDB9 
    PUSH BC                           ;0xdda5:   c5  "." 
;--------------------------------------
C_DDA6:                               ; XREF: 0xDD3B 
    LD HL,ROM_TYPE                    ;0xdda6:   21 00 c0  "!.."  
    CALL 0x2172                       ;0xdda9:   cd 72 21  ".r!" 
    CP 0x47                           ;0xddac:   fe 47  ".G" 
    JR nz, C_DDB7                     ;0xddae:   20 07  " ." 
    CALL 0x209d                       ;0xddb0:   cd 9d 20  ".. " 
    POP BC                            ;0xddb3:   c1  "." 
    LD B,1                            ;0xddb4:   06 01  ".."  
    PUSH BC                           ;0xddb6:   c5  "." 
;--------------------------------------
C_DDB7:                               ; XREF: 0xDDAE 
    POP BC                            ;0xddb7:   c1  "." 
    DEC C                             ;0xddb8:   0d  "." 
    JR nz, C_DDA5                     ;0xddb9:   20 ea  " ." 
    LD A,B                            ;0xddbb:   78  "x" 
    CP 0                              ;0xddbc:   fe 00  ".." 
    JR nz, C_DDC6                     ;0xddbe:   20 06  " ." 
    LD DE,0x20f6                      ;0xddc0:   11 f6 20  ".. "  
    JP 0x1609                         ;0xddc3:   c3 09 16  "..." 
;--------------------------------------
C_DDC6:                               ; XREF: 0xDDBE 
    LD DE,0x20b4                      ;0xddc6:   11 b4 20  ".. "  
    LD C,9                            ;0xddc9:   0e 09  ".."  
    JP 0x1609                         ;0xddcb:   c3 09 16  "..." 
    LD C,15                           ;0xddce:   0e 0f  ".."  
    LD B,0                            ;0xddd0:   06 00  ".."  
;--------------------------------------
C_DDD2:                               ; XREF: 0xDDE6 
    PUSH BC                           ;0xddd2:   c5  "." 
    LD HL,ROM_TYPE                    ;0xddd3:   21 00 c0  "!.."  
    CALL 0x2172                       ;0xddd6:   cd 72 21  ".r!" 
    CP 0x47                           ;0xddd9:   fe 47  ".G" 
    JR nz, C_DDE4                     ;0xdddb:   20 07  " ." 
    CALL 0x2083                       ;0xdddd:   cd 83 20  ".. " 
    POP BC                            ;0xdde0:   c1  "." 
    LD B,1                            ;0xdde1:   06 01  ".."  
    PUSH BC                           ;0xdde3:   c5  "." 
;--------------------------------------
C_DDE4:                               ; XREF: 0xDDDB 
    POP BC                            ;0xdde4:   c1  "." 
    DEC C                             ;0xdde5:   0d  "." 
    JR nz, C_DDD2                     ;0xdde6:   20 ea  " ." 
    LD A,B                            ;0xdde8:   78  "x" 
    OR A                              ;0xdde9:   b7  "." 
    RET z                             ;0xddea:   c8  "." 
    LD DE,0x20b4                      ;0xddeb:   11 b4 20  ".. "  
    JP 0x1609                         ;0xddee:   c3 09 16  "..." 
    PUSH BC                           ;0xddf1:   c5  "." 
    CALL 0x209d                       ;0xddf2:   cd 9d 20  ".. " 
    POP BC                            ;0xddf5:   c1  "." 
    LD HL,S_C038                      ;0xddf6:   21 38 c0  "!8."  
    LD DE,0x4038                      ;0xddf9:   11 38 40  ".8@"  
    LD B,0x3c                         ;0xddfc:   06 3c  ".<"  
;--------------------------------------
C_DDFE:                               ; XREF: 0xDE06 
    PUSH BC                           ;0xddfe:   c5  "." 
    CALL 0x2172                       ;0xddff:   cd 72 21  ".r!" 
    LD (DE),A                         ;0xde02:   12  "." 
    INC HL                            ;0xde03:   23  "#" 
    INC DE                            ;0xde04:   13  "." 
    POP BC                            ;0xde05:   c1  "." 
    DJNZ C_DDFE                       ;0xde06:   10 f6  ".." 
    JP 0x4038                         ;0xde08:   c3 38 40  ".8@" 
    LD HL,0xc010                      ;0xde0b:   21 10 c0  "!.."  
;--------------------------------------
C_DE0E:                               ; XREF: 0xDE20 
    PUSH HL                           ;0xde0e:   e5  "." 
    PUSH BC                           ;0xde0f:   c5  "." 
    CALL 0x2172                       ;0xde10:   cd 72 21  ".r!" 
    CP 0x24                           ;0xde13:   fe 24  ".$" 
    JR z, C_DE2F                      ;0xde15:   28 18  "(." 
    LD C,2                            ;0xde17:   0e 02  ".."  
    LD E,A                            ;0xde19:   5f  "_" 
    CALL 0x5                          ;0xde1a:   cd 05 00  "..." 
    POP BC                            ;0xde1d:   c1  "." 
    POP HL                            ;0xde1e:   e1  "." 
    INC HL                            ;0xde1f:   23  "#" 
    JR C_DE0E                         ;0xde20:   18 ec  ".." 
    DEC C                             ;0xde22:   0d  "." 
    LD A,(BC)                         ;0xde23:   0a  "." 
    INC H                             ;0xde24:   24  "$" 
    DEC C                             ;0xde25:   0d  "." 
    LD A,(BC)                         ;0xde26:   0a  "." 
    LD A,(BC)                         ;0xde27:   0a  "." 
;--------------------------------------
S_de28:                               ; XREF: 
    DEFB 0x24                         ;0xde28:   
    DEFB "  :  $", 0x20               ;0xde29:   0xde29 to 0xde2a
    POP HL                            ;0xde30:   e1  "." 
    RET                               ;0xde31:   c9  "." 
    LD C,15                           ;0xde32:   0e 0f  ".."  
    LD B,0                            ;0xde34:   06 00  ".."  
;--------------------------------------
C_DE36:                               ; XREF: 0xDE50 
    PUSH BC                           ;0xde36:   c5  "." 
    LD HL,ROM_TYPE                    ;0xde37:   21 00 c0  "!.."  
    LD A,C                            ;0xde3a:   79  "y" 
    LD (0x2167),A                     ;0xde3b:   32 67 21  "2g!"  
    CALL 0x2172                       ;0xde3e:   cd 72 21  ".r!" 
    CP 0x47                           ;0xde41:   fe 47  ".G" 
    JP nz, 0x20e0                     ;0xde43:   c2 e0 20  ".. " 
    CALL 0x2114                       ;0xde46:   cd 14 21  "..!" 
    POP BC                            ;0xde49:   c1  "." 
    LD B,1                            ;0xde4a:   06 01  ".."  
    JR C_DE4F                         ;0xde4c:   18 01  ".." 
    POP BC                            ;0xde4e:   c1  "." 
;--------------------------------------
C_DE4F:                               ; XREF: 0xDE4C 
    DEC C                             ;0xde4f:   0d  "." 
    JR nz, C_DE36                     ;0xde50:   20 e4  " ." 
    PUSH BC                           ;0xde52:   c5  "." 
    LD DE,0x20b4                      ;0xde53:   11 b4 20  ".. "  
    CALL 0x1609                       ;0xde56:   cd 09 16  "..." 
    POP BC                            ;0xde59:   c1  "." 
    LD A,B                            ;0xde5a:   78  "x" 
    CP 0                              ;0xde5b:   fe 00  ".." 
    RET nz                            ;0xde5d:   c0  "." 
    LD DE,0x20f6                      ;0xde5e:   11 f6 20  ".. "  
    JP 0x1609                         ;0xde61:   c3 09 16  "..." 
;--------------------------------------
S_de64:                               ; XREF: 
    DEFB "No Accessory Roms attached.", 0x0d  ;0xde64:   0xde64 to 0xde82
    DEFB 0xa                          ;0xde80:   0xa
    DEFB 0x24                         ;0xde81:   
    DEFB 0x21                         ;0xde82:   
    DEFB 0x0                          ;0xde83:   
    DEFB 0xc1                         ;0xde84:   
;--------------------------------------
C_DE85:                               ; XREF: 0xDEAE 
    CALL 0x2168                       ;0xde85:   cd 68 21  ".h!" 
    CP 0xff                           ;0xde88:   fe ff  ".." 
    RET z                             ;0xde8a:   c8  "." 
    PUSH HL                           ;0xde8b:   e5  "." 
    LD B,8                            ;0xde8c:   06 08  ".."  
;--------------------------------------
C_DE8E:                               ; XREF: 0xDE9F 
    PUSH HL                           ;0xde8e:   e5  "." 
    PUSH BC                           ;0xde8f:   c5  "." 
    NOP                               ;0xde90:   00  "." 
    CALL 0x2168                       ;0xde91:   cd 68 21  ".h!" 
    NOP                               ;0xde94:   00  "." 
    NOP                               ;0xde95:   00  "." 
    LD C,2                            ;0xde96:   0e 02  ".."  
    LD E,A                            ;0xde98:   5f  "_" 
    CALL 0x5                          ;0xde99:   cd 05 00  "..." 
    POP BC                            ;0xde9c:   c1  "." 
    POP HL                            ;0xde9d:   e1  "." 
    INC HL                            ;0xde9e:   23  "#" 
    DJNZ C_DE8E                       ;0xde9f:   10 ed  ".." 
    POP HL                            ;0xdea1:   e1  "." 
    LD DE,0x10                        ;0xdea2:   11 10 00  "..."  
    ADD HL,DE                         ;0xdea5:   19  "." 
    PUSH HL                           ;0xdea6:   e5  "." 
    LD DE,0x2142                      ;0xdea7:   11 42 21  ".B!"  
    CALL 0x1609                       ;0xdeaa:   cd 09 16  "..." 
    POP HL                            ;0xdead:   e1  "." 
    JR C_DE85                         ;0xdeae:   18 d5  ".." 
    JR nz, $+34                       ;0xdeb0:   20 20  "  " 
    JR nz, C_DED4                     ;0xdeb2:   20 20  "  " 
    LD A,(0x2020)                     ;0xdeb4:   3a 20 20  ":  "  
    JR nz, $+38                       ;0xdeb7:   20 24  " $" 
    LD C,15                           ;0xdeb9:   0e 0f  ".."  
    LD HL,ROM_TYPE                    ;0xdebb:   21 00 c0  "!.."  
;--------------------------------------
C_DEBE:                               ; XREF: 0xDEC6 
    CALL 0x2172                       ;0xdebe:   cd 72 21  ".r!" 
    CP 0x47                           ;0xdec1:   fe 47  ".G" 
    JR z, C_DEC9                      ;0xdec3:   28 04  "(." 
    DEC C                             ;0xdec5:   0d  "." 
    JR nz, C_DEBE                     ;0xdec6:   20 f6  " ." 
    RET                               ;0xdec8:   c9  "." 
;--------------------------------------
C_DEC9:                               ; XREF: 0xDEC3 
    LD A,0xc3                         ;0xdec9:   3e c3  ">."  
    LD HL,0x218e                      ;0xdecb:   21 8e 21  "!.!"  
    LD (0x5bc),A                      ;0xdece:   32 bc 05  "2.."  
    LD (0x5bd),HL                     ;0xded1:   22 bd 05  "".."  
;--------------------------------------
C_DED4:                               ; XREF: 0xDEB2 
    RET                               ;0xded4:   c9  "." 
    NOP                               ;0xded5:   00  "." 
    PUSH BC                           ;0xded6:   c5  "." 
    LD A,(0x2167)                     ;0xded7:   3a 67 21  ":g!"  
    LD C,A                            ;0xdeda:   4f  "O" 
    CALL 0x2172                       ;0xdedb:   cd 72 21  ".r!" 
    POP BC                            ;0xdede:   c1  "." 
    RET                               ;0xdedf:   c9  "." 
    DI                                ;0xdee0:   f3  "." 
    PUSH BC                           ;0xdee1:   c5  "." 
    EX AF,AF'                         ;0xdee2:   08  "." 
    EXX                               ;0xdee3:   d9  "." 
    LD A,C                            ;0xdee4:   79  "y" 
    RES 3,C                           ;0xdee5:   cb 99  ".." 
    OUT (C),C                         ;0xdee7:   ed 49  ".I" 
    EXX                               ;0xdee9:   d9  "." 
    EX AF,AF'                         ;0xdeea:   08  "." 
    LD B,0xdf                         ;0xdeeb:   06 df  ".."  
    OUT (C),C                         ;0xdeed:   ed 49  ".I" 
    LD A,(HL)                         ;0xdeef:   7e  "~" 
    EX AF,AF'                         ;0xdef0:   08  "." 
    EXX                               ;0xdef1:   d9  "." 
    LD A,C                            ;0xdef2:   79  "y" 
    SET 3,C                           ;0xdef3:   cb d9  ".." 
    OUT (C),C                         ;0xdef5:   ed 49  ".I" 
    EXX                               ;0xdef7:   d9  "." 
    EX AF,AF'                         ;0xdef8:   08  "." 
    EI                                ;0xdef9:   fb  "." 
    POP BC                            ;0xdefa:   c1  "." 
    RET                               ;0xdefb:   c9  "." 
;--------------------------------------
ACCESSORY_ROMS_SCAN:                  ; XREF: 
    PUSH HL                           ;0xdefc:   e5  "." 
    LD A,15                           ;0xdefd:   3e 0f  ">."  
    LD (0x2167),A                     ;0xdeff:   32 67 21  "2g!"  
;--------------------------------------
C_DF02:                               ; XREF: 0xDF17 
    LD HL,ROM_TYPE                    ;0xdf02:   21 00 c0  "!.."  
    CALL 0x2168                       ;0xdf05:   cd 68 21  ".h!" 
    CP 0x47                           ;0xdf08:   fe 47  ".G" 
    JR nz, ACCESSORY_ROM_INIT           ;0xdf0a:   20 03  " ." 
    CALL 0x21b2                       ;0xdf0c:   cd b2 21  "..!" 
;--------------------------------------
ACCESSORY_ROM_INIT:                   ; XREF: 0xDF0A 
    LD A,(0x2167)                     ;0xdf0f:   3a 67 21  ":g!"  
    DEC A                             ;0xdf12:   3d  "=" 
    LD (0x2167),A                     ;0xdf13:   32 67 21  "2g!"  
    OR A                              ;0xdf16:   b7  "." 
    JR nz, C_DF02                     ;0xdf17:   20 e9  " ." 
    LD DE,0xdae                       ;0xdf19:   11 ae 0d  "..."  
    POP HL                            ;0xdf1c:   e1  "." 
    JP 0x5bf                          ;0xdf1d:   c3 bf 05  "..." 
    LD HL,0xc070                      ;0xdf20:   21 70 c0  "!p."  
    LD DE,0x3f70                      ;0xdf23:   11 70 3f  ".p?"  
    LD BC,0x200                       ;0xdf26:   01 00 02  "..."  
;--------------------------------------
C_DF29:                               ; XREF: 0xDF32 
    CALL 0x2168                       ;0xdf29:   cd 68 21  ".h!" 
    LD (DE),A                         ;0xdf2c:   12  "." 
    INC DE                            ;0xdf2d:   13  "." 
    INC HL                            ;0xdf2e:   23  "#" 
    DEC BC                            ;0xdf2f:   0b  "." 
    LD A,C                            ;0xdf30:   79  "y" 
    OR B                              ;0xdf31:   b0  "." 
    JR nz, C_DF29                     ;0xdf32:   20 f5  " ." 
    LD HL,0x4000                      ;0xdf34:   21 00 40  "!.@"  
    LD DE,0xdae                       ;0xdf37:   11 ae 0d  "..."  
    LD B,0                            ;0xdf3a:   06 00  ".."  
    CALL 0x222e                       ;0xdf3c:   cd 2e 22  ".."" 
    CP 0xfe                           ;0xdf3f:   fe fe  ".." 
    RET z                             ;0xdf41:   c8  "." 
    PUSH AF                           ;0xdf42:   f5  "." 
    LD C,0                            ;0xdf43:   0e 00  ".."  
    LD HL,0xdae                       ;0xdf45:   21 ae 0d  "!.."  
    CALL 0x21ec                       ;0xdf48:   cd ec 21  "..!" 
    POP AF                            ;0xdf4b:   f1  "." 
    PUSH AF                           ;0xdf4c:   f5  "." 
    PUSH BC                           ;0xdf4d:   c5  "." 
    CALL 0x21f7                       ;0xdf4e:   cd f7 21  "..!" 
    LD A,(HL)                         ;0xdf51:   7e  "~" 
    POP BC                            ;0xdf52:   c1  "." 
    CP C                              ;0xdf53:   b9  "." 
    JR z, C_DF73                      ;0xdf54:   28 1d  "(." 
    POP AF                            ;0xdf56:   f1  "." 
    LD A,0xfe                         ;0xdf57:   3e fe  ">."  
    RET                               ;0xdf59:   c9  "." 
;--------------------------------------
C_DF5A:                               ; XREF: 0xDF63 
    LD A,(HL)                         ;0xdf5a:   7e  "~" 
    CP 0x20                           ;0xdf5b:   fe 20  ". " 
    RET z                             ;0xdf5d:   c8  "." 
    CP 0                              ;0xdf5e:   fe 00  ".." 
    RET z                             ;0xdf60:   c8  "." 
    INC HL                            ;0xdf61:   23  "#" 
    INC C                             ;0xdf62:   0c  "." 
    JR C_DF5A                         ;0xdf63:   18 f5  ".." 
    LD HL,0x400d                      ;0xdf65:   21 0d 40  "!.@"  
    LD DE,0x10                        ;0xdf68:   11 10 00  "..."  
    LD B,A                            ;0xdf6b:   47  "G" 
    CP 0                              ;0xdf6c:   fe 00  ".." 
    RET z                             ;0xdf6e:   c8  "." 
;--------------------------------------
C_DF6F:                               ; XREF: 0xDF70 
    ADD HL,DE                         ;0xdf6f:   19  "." 
    DJNZ C_DF6F                       ;0xdf70:   10 fd  ".." 
    RET                               ;0xdf72:   c9  "." 
;--------------------------------------
C_DF73:                               ; XREF: 0xDF54 
    POP AF                            ;0xdf73:   f1  "." 
    LD (0x5000),A                     ;0xdf74:   32 00 50  "2.P"  
    LD A,0xc3                         ;0xdf77:   3e c3  ">."  
    LD HL,0x2217                      ;0xdf79:   21 17 22  "!.""  
    LD (0x913),A                      ;0xdf7c:   32 13 09  "2.."  
    LD (0x914),HL                     ;0xdf7f:   22 14 09  "".."  
    JP 0x889                          ;0xdf82:   c3 89 08  "..." 
    LD A,(0x5000)                     ;0xdf85:   3a 00 50  ":.P"  
    LD HL,0x4009                      ;0xdf88:   21 09 40  "!.@"  
    LD DE,0x10                        ;0xdf8b:   11 10 00  "..."  
    LD B,A                            ;0xdf8e:   47  "G" 
    CP 0                              ;0xdf8f:   fe 00  ".." 
    JR z, C_DF96                      ;0xdf91:   28 03  "(." 
;--------------------------------------
C_DF93:                               ; XREF: 0xDF94 
    ADD HL,DE                         ;0xdf93:   19  "." 
    DJNZ C_DF93                       ;0xdf94:   10 fd  ".." 
;--------------------------------------
C_DF96:                               ; XREF: 0xDF91 
    LD A,(0x2167)                     ;0xdf96:   3a 67 21  ":g!"  
    JP 0x3f70                         ;0xdf99:   c3 70 3f  ".p?" 
;--------------------------------------
C_DF9C:                               ; XREF: 0xDFB9 
    PUSH DE                           ;0xdf9c:   d5  "." 
    LD C,0                            ;0xdf9d:   0e 00  ".."  
    LD A,(DE)                         ;0xdf9f:   1a  "." 
    CP (HL)                           ;0xdfa0:   be  "." 
    JR z, C_DFBB                      ;0xdfa1:   28 18  "(." 
    INC HL                            ;0xdfa3:   23  "#" 
;--------------------------------------
C_DFA4:                               ; XREF: 0xDFA8 
    LD A,0x20                         ;0xdfa4:   3e 20  "> "  
    CP (HL)                           ;0xdfa6:   be  "." 
    INC HL                            ;0xdfa7:   23  "#" 
    JR nz, C_DFA4                     ;0xdfa8:   20 fa  " ." 
;--------------------------------------
C_DFAA:                               ; XREF: 0xDFAE 
    LD A,0xfe                         ;0xdfaa:   3e fe  ">."  
    CP (HL)                           ;0xdfac:   be  "." 
    INC HL                            ;0xdfad:   23  "#" 
    JR nz, C_DFAA                     ;0xdfae:   20 fa  " ." 
    LD C,0                            ;0xdfb0:   0e 00  ".."  
    INC B                             ;0xdfb2:   04  "." 
    POP DE                            ;0xdfb3:   d1  "." 
    LD A,(HL)                         ;0xdfb4:   7e  "~" 
    CP 0xff                           ;0xdfb5:   fe ff  ".." 
    JR z, C_DFCC                      ;0xdfb7:   28 13  "(." 
    JR C_DF9C                         ;0xdfb9:   18 e1  ".." 
;--------------------------------------
C_DFBB:                               ; XREF: 0xDFA1 
    INC C                             ;0xdfbb:   0c  "." 
    INC DE                            ;0xdfbc:   13  "." 
    INC HL                            ;0xdfbd:   23  "#" 
    LD A,(HL)                         ;0xdfbe:   7e  "~" 
    CP 0x20                           ;0xdfbf:   fe 20  ". " 
    JR z, C_DFC9                      ;0xdfc1:   28 06  "(." 
    LD A,(DE)                         ;0xdfc3:   1a  "." 
    CP (HL)                           ;0xdfc4:   be  "." 
    JR nz, C_DFA4                     ;0xdfc5:   20 dd  " ." 
    JR C_DFBB                         ;0xdfc7:   18 f2  ".." 
;--------------------------------------
C_DFC9:                               ; XREF: 0xDFC1 
    POP DE                            ;0xdfc9:   d1  "." 
    LD A,B                            ;0xdfca:   78  "x" 
    RET                               ;0xdfcb:   c9  "." 
;--------------------------------------
C_DFCC:                               ; XREF: 0xDFB7 
    LD A,0xfe                         ;0xdfcc:   3e fe  ">."  
    RET                               ;0xdfce:   c9  "." 
    NOP                               ;0xdfcf:   00  "." 
;--------------------------------------
BUILD_VERSION_MSG:                    ; XREF: 
    DEFB "[N.W.M. V 2.34 ]                (C)1988 GRADUATE SOFTWARE.                                                1"  ;0xdfd0:   0xdfd0 to 0xe03b
;--------------------------------------
C_E03B:                               ; XREF: 0xE019 
    LD BC,ROM_TYPE                    ;0xe03b:   01 00 c0  "..."  
    CALL 0xcd5                        ;0xe03e:   cd d5 0c  "..." 
;--------------------------------------
C_E041:                               ; XREF: 0xE01F 
    CALL MC_WAIT_FLYBACK              ;0xe041:   cd 19 bd  "..." 
    LD A,0x10                         ;0xe044:   3e 10  ">."  
;--------------------------------------
C_E046:                               ; XREF: 0xE04F 
    DEC A                             ;0xe046:   3d  "=" 
;--------------------------------------
C_E047:                               ; XREF: 0xE025 
    PUSH AF                           ;0xe047:   f5  "." 
    LD BC,0x101                       ;0xe048:   01 01 01  "..."  
;--------------------------------------
C_E04B:                               ; XREF: 0xE029 
    CALL SCR_SET_INK                  ;0xe04b:   cd 32 bc  ".2." 
    POP AF                            ;0xe04e:   f1  "." 
;--------------------------------------
C_E04F:                               ; XREF: 0xE02D 
    JR nz, C_E046                     ;0xe04f:   20 f5  " ." 
;--------------------------------------
C_E051:                               ; XREF: 0xE02F 
    CALL MC_WAIT_FLYBACK              ;0xe051:   cd 19 bd  "..." 
    LD HL,0x5f80                      ;0xe054:   21 80 5f  "!._"  
;--------------------------------------
C_E057:                               ; XREF: 0xE035 
    LD DE,1                           ;0xe057:   11 01 00  "..."  
    RET nz                            ;0xe05a:   c0  "." 
    LD BC,0x14e2                      ;0xe05b:   01 e2 14  "..."  
    LDIR                              ;0xe05e:   ed b0  ".." 
    LD BC,0x7fc1                      ;0xe060:   01 c1 7f  "..."  
    OUT (C),C                         ;0xe063:   ed 49  ".I" 
    LD DE,1                           ;0xe065:   11 01 00  "..."  
    RET nz                            ;0xe068:   c0  "." 
    PUSH DE                           ;0xe069:   d5  "." 
    LD HL,0xc36                       ;0xe06a:   21 36 0c  "!6."  
    LD BC,0x19f                       ;0xe06d:   01 9f 01  "..."  
    NOP                               ;0xe070:   00  "." 
    LDIR                              ;0xe071:   ed b0  ".." 
    RET                               ;0xe073:   c9  "." 
    LD HL,0xd40                       ;0xe074:   21 40 0d  "!@."  
    LD DE,0x180                       ;0xe077:   11 80 01  "..."  
    NOP                               ;0xe07a:   00  "." 
    LD BC,0xe80                       ;0xe07b:   01 80 0e  "..."  
    LDIR                              ;0xe07e:   ed b0  ".." 
    LD HL,0x1bc0                      ;0xe080:   21 c0 1b  "!.."  
    LD DE,D_FFA0                      ;0xe083:   11 a0 ff  "..."  
    LD BC,0x140                       ;0xe086:   01 40 01  ".@."  
    NOP                               ;0xe089:   00  "." 
    LDIR                              ;0xe08a:   ed b0  ".." 
    LD HL,1                           ;0xe08c:   21 01 00  "!.."  
    INC E                             ;0xe08f:   1c  "." 
    LD DE,1                           ;0xe090:   11 01 00  "..."  
    ADC A,B                           ;0xe093:   88  "." 
    LD BC,1                           ;0xe094:   01 01 00  "..."  
    LD (BC),A                         ;0xe097:   02  "." 
    LDIR                              ;0xe098:   ed b0  ".." 
    LD DE,2                           ;0xe09a:   11 02 00  "..."  
    LD HL,1                           ;0xe09d:   21 01 00  "!.."  
    ADD A,B                           ;0xe0a0:   80  "." 
    CALL TXT_SET_M_TABLE              ;0xe0a1:   cd ab bb  "..." 
    LD HL,1                           ;0xe0a4:   21 01 00  "!.."  
    LD E,0x11                         ;0xe0a7:   1e 11  ".."  
    LD BC,0x8000                      ;0xe0a9:   01 00 80  "..."  
    LD BC,1                           ;0xe0ac:   01 01 00  "..."  
    EX AF,AF'                         ;0xe0af:   08  "." 
    LDIR                              ;0xe0b0:   ed b0  ".." 
    LD HL,1                           ;0xe0b2:   21 01 00  "!.."  
    ADD HL,HL                         ;0xe0b5:   29  ")" 
    LD DE,1                           ;0xe0b6:   11 01 00  "..."  
    CALL m, 0x53e                     ;0xe0b9:   fc 3e 05  ".>." 
    CALL 0xc095                       ;0xe0bc:   cd 95 c0  "..." 
    LD HL,1                           ;0xe0bf:   21 01 00  "!.."  
    CPL                               ;0xe0c2:   2f  "/" 
    LD DE,1                           ;0xe0c3:   11 01 00  "..."  
    OR 0x3e                           ;0xe0c6:   f6 3e  ".>" 
    INC C                             ;0xe0c8:   0c  "." 
    CALL 0xc095                       ;0xe0c9:   cd 95 c0  "..." 
    LD HL,0x5f7f                      ;0xe0cc:   21 7f 5f  "!._"  
    LD DE,0x7fff                      ;0xe0cf:   11 ff 7f  "..."  
    LD BC,1                           ;0xe0d2:   01 01 00  "..."  
    LD SP,0xb8ed                      ;0xe0d5:   31 ed b8  "1.."  
    LD HL,0x5280                      ;0xe0d8:   21 80 52  "!.R"  
    LD DE,1                           ;0xe0db:   11 01 00  "..."  
    DEC A                             ;0xe0de:   3d  "=" 
    LD A,6                            ;0xe0df:   3e 06  ">."  
    CALL 0xc095                       ;0xe0e1:   cd 95 c0  "..." 
    LD HL,0x8080                      ;0xe0e4:   21 80 80  "!.."  
    LD DE,1                           ;0xe0e7:   11 01 00  "..."  
    RRCA                              ;0xe0ea:   0f  "." 
    LD A,0x5c                         ;0xe0eb:   3e 5c  ">\"  
    CALL 0xc095                       ;0xe0ed:   cd 95 c0  "..." 
    XOR A                             ;0xe0f0:   af  "." 
    LD HL,0xb0d0                      ;0xe0f1:   21 d0 b0  "!.."  
    LD DE,0xb0d1                      ;0xe0f4:   11 d1 b0  "..."  
    LD BC,0x12f                       ;0xe0f7:   01 2f 01  "./."  
    NOP                               ;0xe0fa:   00  "." 
    LD (HL),A                         ;0xe0fb:   77  "w" 
    LDIR                              ;0xe0fc:   ed b0  ".." 
    LD HL,0xbe40                      ;0xe0fe:   21 40 be  "!@."  
    LD DE,0xbe41                      ;0xe101:   11 41 be  ".A."  
    LD BC,0x1bf                       ;0xe104:   01 bf 01  "..."  
    LD (HL),A                         ;0xe107:   77  "w" 
    LDIR                              ;0xe108:   ed b0  ".." 
    LD HL,D_FE58                      ;0xe10a:   21 58 fe  "!X."  
    LD DE,D_FE59                      ;0xe10d:   11 59 fe  ".Y."  
    LD BC,0x147                       ;0xe110:   01 47 01  ".G."  
    LD (HL),A                         ;0xe113:   77  "w" 
    LD (BC),A                         ;0xe114:   02  "." 
    NOP                               ;0xe115:   00  "." 
    DI                                ;0xe116:   f3  "." 
    JP 0x1                            ;0xe117:   c3 01 00  "..." 
    CALL m, 0x125                     ;0xe11a:   fc 25 01  ".%." 
    ADD A,B                           ;0xe11d:   80  "." 
    LD BC,0xed00                      ;0xe11e:   01 00 ed  "..."  
    OR B                              ;0xe121:   b0  "." 
    DEC A                             ;0xe122:   3d  "=" 
    JR nz, $-7                        ;0xe123:   20 f7  " ." 
    RET                               ;0xe125:   c9  "." 
    RET                               ;0xe126:   c9  "." 
    RST 0x38                          ;0xe127:   ff  "." 
    CALL KL_PROBE_ROM                 ;0xe128:   cd 15 b9  "..." 
    LD DE,D_FDFF                      ;0xe12b:   11 ff fd  "..."  
    ADD HL,DE                         ;0xe12e:   19  "." 
    LD A,H                            ;0xe12f:   7c  "|" 
    OR L                              ;0xe130:   b5  "." 
    RET z                             ;0xe131:   c8  "." 
    LD HL,0xcf6                       ;0xe132:   21 f6 0c  "!.."  
;--------------------------------------
C_E135:                               ; XREF: 0xE13C 
    LD A,(HL)                         ;0xe135:   7e  "~" 
    INC HL                            ;0xe136:   23  "#" 
    CP 0xff                           ;0xe137:   fe ff  ".." 
    CALL nz, TXT_OUTPUT               ;0xe139:   c4 5a bb  ".Z." 
    JR nz, C_E135                     ;0xe13c:   20 f7  " ." 
;--------------------------------------
C_E13E:                               ; XREF: 0xE141 
    CALL KM_READ_CHAR                 ;0xe13e:   cd 09 bb  "..." 
    JR c, C_E13E                      ;0xe141:   38 fb  "8." 
    CALL KM_WAIT_CHAR                 ;0xe143:   cd 06 bb  "..." 
    RST 0                             ;0xe146:   c7  "." 
    DEC C                             ;0xe147:   0d  "." 
    LD A,(BC)                         ;0xe148:   0a  "." 
;--------------------------------------
S_e149:                               ; XREF: 
    DEFB "This program will not run in this", 0x0d  ;0xe149:   0xe149 to 0xe16d
    DEFB 0xa                          ;0xe16b:   0xa
;--------------------------------------
S_e16c:                               ; XREF: 
    DEFB "environment.  Press any key "  ;0xe16c:   0xe16c to 0xe188
;--------------------------------------
C_E188:                               ; XREF: 0xE187 
    RST 0x38                          ;0xe188:   ff  "." 
    RST 0x38                          ;0xe189:   ff  "." 
    RST 0x38                          ;0xe18a:   ff  "." 
    RST 0x38                          ;0xe18b:   ff  "." 
    RST 0x38                          ;0xe18c:   ff  "." 
    RST 0x38                          ;0xe18d:   ff  "." 
    RST 0x38                          ;0xe18e:   ff  "." 
    RST 0x38                          ;0xe18f:   ff  "." 
    RST 0x38                          ;0xe190:   ff  "." 
    JP 0xad7                          ;0xe191:   c3 d7 0a  "..." 
    JP 0xae7                          ;0xe194:   c3 e7 0a  "..." 
    JP 0xba3                          ;0xe197:   c3 a3 0b  "..." 
    JP 0xbb1                          ;0xe19a:   c3 b1 0b  "..." 
    JP 0xbb6                          ;0xe19d:   c3 b6 0b  "..." 
    JP 0xbc4                          ;0xe1a0:   c3 c4 0b  "..." 
    JP 0xc3f                          ;0xe1a3:   c3 3f 0c  ".?." 
    JP 0xc5a                          ;0xe1a6:   c3 5a 0c  ".Z." 
    JP 0xdc6                          ;0xe1a9:   c3 c6 0d  "..." 
    JP 0xbd2                          ;0xe1ac:   c3 d2 0b  "..." 
    JP 0xc7f                          ;0xe1af:   c3 7f 0c  "..." 
    JP 0xc7f                          ;0xe1b2:   c3 7f 0c  "..." 
    JP 0xe6d                          ;0xe1b5:   c3 6d 0e  ".m." 
    JP 0xe8f                          ;0xe1b8:   c3 8f 0e  "..." 
    JP 0xeb0                          ;0xe1bb:   c3 b0 0e  "..." 
    JP 0xe09                          ;0xe1be:   c3 09 0e  "..." 
    JP 0xe12                          ;0xe1c1:   c3 12 0e  "..." 
    JP 0xcda                          ;0xe1c4:   c3 da 0c  "..." 
    JP 0x2ae                          ;0xe1c7:   c3 ae 02  "..." 
;--------------------------------------
C_E1CA:                               ; XREF: 0xE15A 
    JP 0x3a0                          ;0xe1ca:   c3 a0 03  "..." 
;--------------------------------------
C_E1CD:                               ; XREF: 0xE162 
    JP 0x31a                          ;0xe1cd:   c3 1a 03  "..." 
    JP 0x745                          ;0xe1d0:   c3 45 07  ".E." 
    JP 0x409                          ;0xe1d3:   c3 09 04  "..." 
    JP 0x691                          ;0xe1d6:   c3 91 06  "..." 
    JP 0x79f                          ;0xe1d9:   c3 9f 07  "..." 
    JP 0x90c                          ;0xe1dc:   c3 0c 09  "..." 
    JP 0x91a                          ;0xe1df:   c3 1a 09  "..." 
;--------------------------------------
C_E1E2:                               ; XREF: 0xE17F 
    JP 0x94b                          ;0xe1e2:   c3 4b 09  ".K." 
    JP KM_SET_EXPAND                  ;0xe1e5:   c3 0f bb  "..." 
    JP 0x290                          ;0xe1e8:   c3 90 02  "..." 
    JP 0x2a6                          ;0xe1eb:   c3 a6 02  "..." 
    JP 0x2ad                          ;0xe1ee:   c3 ad 02  "..." 
    JP 0x2a3                          ;0xe1f1:   c3 a3 02  "..." 
    JP 0x170                          ;0xe1f4:   c3 70 01  ".p." 
    JP 0x163                          ;0xe1f7:   c3 63 01  ".c." 
    JP 0x104                          ;0xe1fa:   c3 04 01  "..." 
    JP 0x219                          ;0xe1fd:   c3 19 02  "..." 
    JP 0x1                            ;0xe200:   c3 01 00  "..." 
    LD (BC),A                         ;0xe203:   02  "." 
    JP 0x22f                          ;0xe204:   c3 2f 02  "./." 
    JP 0x20c                          ;0xe207:   c3 0c 02  "..." 
    JP 0x39a                          ;0xe20a:   c3 9a 03  "..." 
    JP 0x242                          ;0xe20d:   c3 42 02  ".B." 
    JP 0x267                          ;0xe210:   c3 67 02  ".g." 
    JP 0x572                          ;0xe213:   c3 72 05  ".r." 
    PUSH HL                           ;0xe216:   e5  "." 
    PUSH DE                           ;0xe217:   d5  "." 
    LD DE,0xbe4f                      ;0xe218:   11 4f be  ".O."  
    PUSH DE                           ;0xe21b:   d5  "." 
    LD HL,0x15e                       ;0xe21c:   21 5e 01  "!^."  
    LD BC,0x105                       ;0xe21f:   01 05 01  "..."  
    NOP                               ;0xe222:   00  "." 
    LDIR                              ;0xe223:   ed b0  ".." 
    LD C,3                            ;0xe225:   0e 03  ".."  
    LD HL,HOOK_KM_SCAN_KEYS_664       ;0xe227:   21 f4 bd  "!.."  
    LDIR                              ;0xe22a:   ed b0  ".." 
    POP HL                            ;0xe22c:   e1  "." 
    LD (0xbdf5),HL                    ;0xe22d:   22 f5 bd  "".."  
    EI                                ;0xe230:   fb  "." 
    POP DE                            ;0xe231:   d1  "." 
    LD BC,0x80ff                      ;0xe232:   01 ff 80  "..."  
    LD HL,0xbe48                      ;0xe235:   21 48 be  "!H."  
    CALL KL_INIT_EVENT                ;0xe238:   cd ef bc  "..." 
    LD BC,0x132                       ;0xe23b:   01 32 01  ".2."  
    NOP                               ;0xe23e:   00  "." 
    LD D,B                            ;0xe23f:   50  "P" 
    LD E,C                            ;0xe240:   59  "Y" 
    LD HL,0xbe42                      ;0xe241:   21 42 be  "!B."  
    CALL KL_ADD_TICKER                ;0xe244:   cd e9 bc  "..." 
    LD A,0xff                         ;0xe247:   3e ff  ">."  
    LD DE,2                           ;0xe249:   11 02 00  "..."  
    LD HL,0x808                       ;0xe24c:   21 08 08  "!.."  
    CALL 0x2ae                        ;0xe24f:   cd ae 02  "..." 
    SBC A,A                           ;0xe252:   9f  "." 
    LD (0xbe41),A                     ;0xe253:   32 41 be  "2A."  
    POP HL                            ;0xe256:   e1  "." 
    JR c, C_E25B                      ;0xe257:   38 02  "8." 
    LD (HL),1                         ;0xe259:   36 01  "6."  
;--------------------------------------
C_E25B:                               ; XREF: 0xE257 
    NOP                               ;0xe25b:   00  "." 
    CALL 0xad7                        ;0xe25c:   cd d7 0a  "..." 
    CALL 0xdba                        ;0xe25f:   cd ba 0d  "..." 
    SBC A,A                           ;0xe262:   9f  "." 
    LD (0xbe40),A                     ;0xe263:   32 40 be  "2@."  
    CALL 0x1                          ;0xe266:   cd 01 00  "..." 
    INC B                             ;0xe269:   04  "." 
    CALL 0x178                        ;0xe26a:   cd 78 01  ".x." 
    CALL 0x19a                        ;0xe26d:   cd 9a 01  "..." 
    LD A,(0xbe41)                     ;0xe270:   3a 41 be  ":A."  
    RET                               ;0xe273:   c9  "." 
    LD A,0xff                         ;0xe274:   3e ff  ">."  
    LD (D_FFF3),A                     ;0xe276:   32 f3 ff  "2.."  
    LD B,8                            ;0xe279:   06 08  ".."  
    LD A,(0xbe41)                     ;0xe27b:   3a 41 be  ":A."  
    LD C,A                            ;0xe27e:   4f  "O" 
    LD A,(0xbe40)                     ;0xe27f:   3a 40 be  ":@."  
    LD HL,D_FFE8                      ;0xe282:   21 e8 ff  "!.."  
    RET                               ;0xe285:   c9  "." 
    XOR A                             ;0xe286:   af  "." 
    LD HL,0x201                       ;0xe287:   21 01 02  "!.."  
    LD BC,1                           ;0xe28a:   01 01 00  "..."  
    LD BC,0x11c9                      ;0xe28d:   01 c9 11  "..."  
    LD BC,0x100                       ;0xe290:   01 00 01  "..."  
    LD A,8                            ;0xe293:   3e 08  ">."  
    CALL 0x572                        ;0xe295:   cd 72 05  ".r." 
    LD A,(0xbe40)                     ;0xe298:   3a 40 be  ":@."  
    OR A                              ;0xe29b:   b7  "." 
    LD A,9                            ;0xe29c:   3e 09  ">."  
    JR z, C_E2A1                      ;0xe29e:   28 01  "(." 
    INC A                             ;0xe2a0:   3c  "<" 
;--------------------------------------
C_E2A1:                               ; XREF: 0xE29E 
    CALL 0x572                        ;0xe2a1:   cd 72 05  ".r." 
    LD A,(0xbe41)                     ;0xe2a4:   3a 41 be  ":A."  
    OR A                              ;0xe2a7:   b7  "." 
    LD A,11                           ;0xe2a8:   3e 0b  ">."  
    CALL nz, 0x572                    ;0xe2aa:   c4 72 05  ".r." 
    LD A,13                           ;0xe2ad:   3e 0d  ">."  
    JP D_FEC0                         ;0xe2af:   c3 c0 fe  "..." 
    LD BC,1                           ;0xe2b2:   01 01 00  "..."  
    EX AF,AF'                         ;0xe2b5:   08  "." 
    LD DE,0x8c67                      ;0xe2b6:   11 67 8c  ".g."  
    LD HL,1                           ;0xe2b9:   21 01 00  "!.."  
    ADC A,D                           ;0xe2bc:   8a  "." 
    PUSH HL                           ;0xe2bd:   e5  "." 
    CALL 0x1d9                        ;0xe2be:   cd d9 01  "..." 
    DEC HL                            ;0xe2c1:   2b  "+" 
    LD (HL),B                         ;0xe2c2:   70  "p" 
    DEC HL                            ;0xe2c3:   2b  "+" 
    LD (HL),B                         ;0xe2c4:   70  "p" 
    INC HL                            ;0xe2c5:   23  "#" 
    INC HL                            ;0xe2c6:   23  "#" 
    PUSH HL                           ;0xe2c7:   e5  "." 
    LD B,10                           ;0xe2c8:   06 0a  ".."  
    CALL 0x1d9                        ;0xe2ca:   cd d9 01  "..." 
    LD BC,0x1702                      ;0xe2cd:   01 02 17  "..."  
    LD DE,0x5080                      ;0xe2d0:   11 80 50  "..P"  
    CALL 0x1d9                        ;0xe2d3:   cd d9 01  "..." 
    DEC HL                            ;0xe2d6:   2b  "+" 
    LD (HL),B                         ;0xe2d7:   70  "p" 
    DEC HL                            ;0xe2d8:   2b  "+" 
    LD (HL),B                         ;0xe2d9:   70  "p" 
    LD HL,0x1ce                       ;0xe2da:   21 ce 01  "!.."  
    LD DE,D_FFE8                      ;0xe2dd:   11 e8 ff  "..."  
    LD BC,0x10b                       ;0xe2e0:   01 0b 01  "..."  
    NOP                               ;0xe2e3:   00  "." 
    LDIR                              ;0xe2e4:   ed b0  ".." 
    POP HL                            ;0xe2e6:   e1  "." 
    POP DE                            ;0xe2e7:   d1  "." 
    RET                               ;0xe2e8:   c9  "." 
    LD BC,0x6700                      ;0xe2e9:   01 00 67  "..g"  
    ADC A,H                           ;0xe2ec:   8c  "." 
    LD L,C                            ;0xe2ed:   69  "i" 
    INC H                             ;0xe2ee:   24  "$" 
    LD (BC),A                         ;0xe2ef:   02  "." 
    ADD A,B                           ;0xe2f0:   80  "." 
    LD D,B                            ;0xe2f1:   50  "P" 
    ADD A,B                           ;0xe2f2:   80  "." 
    CPL                               ;0xe2f3:   2f  "/" 
    RST 0x38                          ;0xe2f4:   ff  "." 
    LD A,B                            ;0xe2f5:   78  "x" 
    OR A                              ;0xe2f6:   b7  "." 
    RET z                             ;0xe2f7:   c8  "." 
    LD (HL),0xff                      ;0xe2f8:   36 ff  "6."  
    PUSH DE                           ;0xe2fa:   d5  "." 
    LD DE,0x10f                       ;0xe2fb:   11 0f 01  "..."  
    NOP                               ;0xe2fe:   00  "." 
    ADD HL,DE                         ;0xe2ff:   19  "." 
    LD D,H                            ;0xe300:   54  "T" 
    LD E,L                            ;0xe301:   5d  "]" 
    DEC HL                            ;0xe302:   2b  "+" 
    LD (HL),D                         ;0xe303:   72  "r" 
    DEC HL                            ;0xe304:   2b  "+" 
    LD (HL),E                         ;0xe305:   73  "s" 
    DEC HL                            ;0xe306:   2b  "+" 
    LD (HL),C                         ;0xe307:   71  "q" 
    EX DE,HL                          ;0xe308:   eb  "." 
    EX (SP),HL                        ;0xe309:   e3  "." 
    EX DE,HL                          ;0xe30a:   eb  "." 
    DEC HL                            ;0xe30b:   2b  "+" 
    LD (HL),D                         ;0xe30c:   72  "r" 
    DEC HL                            ;0xe30d:   2b  "+" 
    LD (HL),E                         ;0xe30e:   73  "s" 
    POP HL                            ;0xe30f:   e1  "." 
    INC D                             ;0xe310:   14  "." 
    INC D                             ;0xe311:   14  "." 
    DJNZ $-25                         ;0xe312:   10 e5  ".." 
    RET                               ;0xe314:   c9  "." 
    RST 0x38                          ;0xe315:   ff  "." 
    RST 0x38                          ;0xe316:   ff  "." 
    RST 0x38                          ;0xe317:   ff  "." 
    RST 0x38                          ;0xe318:   ff  "." 
    RST 0x38                          ;0xe319:   ff  "." 
    RST 0x38                          ;0xe31a:   ff  "." 
    RST 0x38                          ;0xe31b:   ff  "." 
    RST 0x38                          ;0xe31c:   ff  "." 
    LD A,B                            ;0xe31d:   78  "x" 
    OR A                              ;0xe31e:   b7  "." 
    JP z, KM_WAIT_CHAR                ;0xe31f:   ca 06 bb  "..." 
    CP 2                              ;0xe322:   fe 02  ".." 
    JP z, 0x329                       ;0xe324:   ca 29 03  ".)." 
    XOR A                             ;0xe327:   af  "." 
    RET                               ;0xe328:   c9  "." 
    INC B                             ;0xe329:   04  "." 
    DEC B                             ;0xe32a:   05  "." 
    JP z, 0x411                       ;0xe32b:   ca 11 04  "..." 
    DEC B                             ;0xe32e:   05  "." 
    LD A,C                            ;0xe32f:   79  "y" 
    JP z, MC_SEND_PRINTER             ;0xe330:   ca 31 bd  ".1." 
    JP 0x35c                          ;0xe333:   c3 5c 03  ".\." 
    INC B                             ;0xe336:   04  "." 
    DJNZ C_E344                       ;0xe337:   10 0b  ".." 
    CALL KM_READ_CHAR                 ;0xe339:   cd 09 bb  "..." 
    CALL c, 0xbb0c                    ;0xe33c:   dc 0c bb  "..." 
    SBC A,A                           ;0xe33f:   9f  "." 
    LD (D_FFF3),A                     ;0xe340:   32 f3 ff  "2.."  
    RET                               ;0xe343:   c9  "." 
;--------------------------------------
C_E344:                               ; XREF: 0xE337 
    LD A,B                            ;0xe344:   78  "x" 
    XOR 1                             ;0xe345:   ee 01  ".." 
    CALL nz, 0x348                    ;0xe347:   c4 48 03  ".H." 
    SBC A,A                           ;0xe34a:   9f  "." 
    RET                               ;0xe34b:   c9  "." 
    CALL 0x234                        ;0xe34c:   cd 34 02  ".4." 
    SBC A,A                           ;0xe34f:   9f  "." 
    RET                               ;0xe350:   c9  "." 
    INC B                             ;0xe351:   04  "." 
    DEC B                             ;0xe352:   05  "." 
    SCF                               ;0xe353:   37  "7" 
    RET z                             ;0xe354:   c8  "." 
    DJNZ C_E35C                       ;0xe355:   10 05  ".." 
    CALL MC_BUSY_PRINTER              ;0xe357:   cd 2e bd  "..." 
    CCF                               ;0xe35a:   3f  "?" 
    RET                               ;0xe35b:   c9  "." 
;--------------------------------------
C_E35C:                               ; XREF: 0xE355 
    JP 0x366                          ;0xe35c:   c3 66 03  ".f." 
    CALL 0x277                        ;0xe35f:   cd 77 02  ".w." 
    CALL 0x1                          ;0xe362:   cd 01 00  "..." 
    DEC A                             ;0xe365:   3d  "=" 
    CALL 0x287                        ;0xe366:   cd 87 02  "..." 
    CP 0x43                           ;0xe369:   fe 43  ".C" 
    JR z, C_E37F                      ;0xe36b:   28 12  "(." 
    CP 0x49                           ;0xe36d:   fe 49  ".I" 
    SCF                               ;0xe36f:   37  "7" 
    JR z, C_E37F                      ;0xe370:   28 0d  "(." 
    CP 0x52                           ;0xe372:   fe 52  ".R" 
    JR z, C_E37E                      ;0xe374:   28 08  "(." 
    CALL 0x645                        ;0xe376:   cd 45 06  ".E." 
    CALL 0x27d                        ;0xe379:   cd 7d 02  ".}." 
    JR $-25                           ;0xe37c:   18 e5  ".." 
;--------------------------------------
C_E37E:                               ; XREF: 0xE374 
    OR A                              ;0xe37e:   b7  "." 
;--------------------------------------
C_E37F:                               ; XREF: 0xE36B 
    PUSH AF                           ;0xe37f:   f5  "." 
    CALL 0x272                        ;0xe380:   cd 72 02  ".r." 
    POP AF                            ;0xe383:   f1  "." 
    RET                               ;0xe384:   c9  "." 
    CALL 0x68c                        ;0xe385:   cd 8c 06  "..." 
    LD B,14                           ;0xe388:   06 0e  ".."  
    CALL 0x277                        ;0xe38a:   cd 77 02  ".w." 
    CALL 0x1                          ;0xe38d:   cd 01 00  "..." 
    DEC A                             ;0xe390:   3d  "=" 
    CALL 0x65a                        ;0xe391:   cd 5a 06  ".Z." 
    JR C_E39C                         ;0xe394:   18 06  ".." 
    CALL 0x62e                        ;0xe396:   cd 2e 06  "..." 
    CALL 0xeb0                        ;0xe399:   cd b0 0e  "..." 
;--------------------------------------
C_E39C:                               ; XREF: 0xE394 
    CALL 0x3d06                       ;0xe39c:   cd 06 3d  "..=" 
    INC A                             ;0xe39f:   3c  "<" 
    RET nz                            ;0xe3a0:   c0  "." 
    CALL 0x1                          ;0xe3a1:   cd 01 00  "..." 
    DEC A                             ;0xe3a4:   3d  "=" 
    JR $-8                            ;0xe3a5:   18 f6  ".." 
    CP 0x61                           ;0xe3a7:   fe 61  ".a" 
    RET c                             ;0xe3a9:   d8  "." 
    CP 0x7b                           ;0xe3aa:   fe 7b  ".{" 
    RET nc                            ;0xe3ac:   d0  "." 
    ADD A,0xe0                        ;0xe3ad:   c6 e0  ".." 
    RET                               ;0xe3af:   c9  "." 
    BIT 0,D                           ;0xe3b0:   cb 42  ".B" 
    LD A,C                            ;0xe3b2:   79  "y" 
    CALL nz, 0xbb27                   ;0xe3b3:   c4 27 bb  ".'." 
    BIT 1,D                           ;0xe3b6:   cb 4a  ".J" 
    LD A,C                            ;0xe3b8:   79  "y" 
    CALL nz, KM_SET_SHIFT             ;0xe3b9:   c4 2d bb  ".-." 
    BIT 4,D                           ;0xe3bc:   cb 62  ".b" 
    LD A,C                            ;0xe3be:   79  "y" 
    CALL nz, 0xbb33                   ;0xe3bf:   c4 33 bb  ".3." 
    RET                               ;0xe3c2:   c9  "." 
    JP 0xbb3f                         ;0xe3c3:   c3 3f bb  ".?." 
    CALL 0xbb1b                       ;0xe3c6:   cd 1b bb  "..." 
    LD C,A                            ;0xe3c9:   4f  "O" 
    LD B,1                            ;0xe3ca:   06 01  ".."  
    NOP                               ;0xe3cc:   00  "." 
    RET                               ;0xe3cd:   c9  "." 
    RET                               ;0xe3ce:   c9  "." 
    LD BC,0xfadd                      ;0xe3cf:   01 dd fa  "..."  
    LD (0xbe5c),HL                    ;0xe3d2:   22 5c be  ""\."  
    LD (0xbe5a),DE                    ;0xe3d5:   ed 53 5a be  ".SZ."  
    LD (0xbe58),A                     ;0xe3d9:   32 58 be  "2X."  
    LD A,0x18                         ;0xe3dc:   3e 18  ">."  
    OUT (C),A                         ;0xe3de:   ed 79  ".y" 
    LD A,4                            ;0xe3e0:   3e 04  ">."  
    OUT (C),A                         ;0xe3e2:   ed 79  ".y" 
    LD A,E                            ;0xe3e4:   7b  "{" 
    CP 2                              ;0xe3e5:   fe 02  ".." 
    JR c, C_E3EA                      ;0xe3e7:   38 01  "8." 
    INC E                             ;0xe3e9:   1c  "." 
;--------------------------------------
C_E3EA:                               ; XREF: 0xE3E7 
    LD A,D                            ;0xe3ea:   7a  "z" 
    INC A                             ;0xe3eb:   3c  "<" 
    ADD A,A                           ;0xe3ec:   87  "." 
    ADD A,A                           ;0xe3ed:   87  "." 
    OR E                              ;0xe3ee:   b3  "." 
    OR 0x40                           ;0xe3ef:   f6 40  ".@" 
    OUT (C),A                         ;0xe3f1:   ed 79  ".y" 
    LD A,5                            ;0xe3f3:   3e 05  ">."  
    OUT (C),A                         ;0xe3f5:   ed 79  ".y" 
    LD A,L                            ;0xe3f7:   7d  "}" 
    CALL 0x30f                        ;0xe3f8:   cd 0f 03  "..." 
    RRCA                              ;0xe3fb:   0f  "." 
    LD E,A                            ;0xe3fc:   5f  "_" 
    LD A,(0xbe58)                     ;0xe3fd:   3a 58 be  ":X."  
    CPL                               ;0xe400:   2f  "/" 
    AND 0x80                          ;0xe401:   e6 80  ".." 
    OR 10                             ;0xe403:   f6 0a  ".." 
    OR E                              ;0xe405:   b3  "." 
    LD (0xbe59),A                     ;0xe406:   32 59 be  "2Y."  
    OUT (C),A                         ;0xe409:   ed 79  ".y" 
    LD A,3                            ;0xe40b:   3e 03  ">."  
    OUT (C),A                         ;0xe40d:   ed 79  ".y" 
    LD A,H                            ;0xe40f:   7c  "|" 
    CALL 0x30f                        ;0xe410:   cd 0f 03  "..." 
    OR 1                              ;0xe413:   f6 01  ".." 
    OUT (C),A                         ;0xe415:   ed 79  ".y" 
    INC C                             ;0xe417:   0c  "." 
    INC C                             ;0xe418:   0c  "." 
    LD HL,0x2a5                       ;0xe419:   21 a5 02  "!.."  
    CALL 0x301                        ;0xe41c:   cd 01 03  "..." 
    RET nc                            ;0xe41f:   d0  "." 
    LD L,0x5a                         ;0xe420:   2e 5a  ".Z"  
    OUT (C),H                         ;0xe422:   ed 61  ".a" 
    OUT (C),L                         ;0xe424:   ed 69  ".i" 
    OUT (C),H                         ;0xe426:   ed 61  ".a" 
    IN A,(C)                          ;0xe428:   ed 78  ".x" 
    XOR L                             ;0xe42a:   ad  "." 
    AND 0xf8                          ;0xe42b:   e6 f8  ".." 
    RET nz                            ;0xe42d:   c0  "." 
    SCF                               ;0xe42e:   37  "7" 
    RET                               ;0xe42f:   c9  "." 
    SUB 5                             ;0xe430:   d6 05  ".." 
    RET z                             ;0xe432:   c8  "." 
    RRCA                              ;0xe433:   0f  "." 
    RRCA                              ;0xe434:   0f  "." 
    XOR 0xc0                          ;0xe435:   ee c0  ".." 
    RET nz                            ;0xe437:   c0  "." 
    LD A,0xc0                         ;0xe438:   3e c0  ">."  
    RET                               ;0xe43a:   c9  "." 
    LD BC,(0xbe5e)                    ;0xe43b:   ed 4b 5e be  ".K^."  
    LD DE,(0xbe5a)                    ;0xe43f:   ed 5b 5a be  ".[Z."  
    LD HL,(0xbe5c)                    ;0xe443:   2a 5c be  "*\."  
    LD A,(0xbe58)                     ;0xe446:   3a 58 be  ":X."  
    RET                               ;0xe449:   c9  "." 
    LD BC,0xfadd                      ;0xe44a:   01 dd fa  "..."  
    LD A,(0xbe58)                     ;0xe44d:   3a 58 be  ":X."  
    OR A                              ;0xe450:   b7  "." 
    JR z, C_E45B                      ;0xe451:   28 08  "(." 
    IN A,(C)                          ;0xe453:   ed 78  ".x" 
    RRA                               ;0xe455:   1f  "." 
    JR c, C_E460                      ;0xe456:   38 08  "8." 
    CALL 0x38b                        ;0xe458:   cd 8b 03  "..." 
;--------------------------------------
C_E45B:                               ; XREF: 0xE451 
    IN A,(C)                          ;0xe45b:   ed 78  ".x" 
    RRA                               ;0xe45d:   1f  "." 
    JR nc, C_E45B                     ;0xe45e:   30 fb  "0." 
;--------------------------------------
C_E460:                               ; XREF: 0xE456 
    LD A,D                            ;0xe460:   7a  "z" 
    OR A                              ;0xe461:   b7  "." 
    CALL nz, 0x387                    ;0xe462:   c4 87 03  "..." 
    DEC C                             ;0xe465:   0d  "." 
    IN A,(C)                          ;0xe466:   ed 78  ".x" 
    RET                               ;0xe468:   c9  "." 
    LD BC,0xfadd                      ;0xe469:   01 dd fa  "..."  
    LD A,(0xbe58)                     ;0xe46c:   3a 58 be  ":X."  
    OR A                              ;0xe46f:   b7  "." 
    JR z, C_E479                      ;0xe470:   28 07  "(." 
    IN A,(C)                          ;0xe472:   ed 78  ".x" 
    RRA                               ;0xe474:   1f  "." 
    RET c                             ;0xe475:   d8  "." 
    CALL 0x38b                        ;0xe476:   cd 8b 03  "..." 
;--------------------------------------
C_E479:                               ; XREF: 0xE470 
    IN A,(C)                          ;0xe479:   ed 78  ".x" 
    RRA                               ;0xe47b:   1f  "." 
    RET                               ;0xe47c:   c9  "." 
    LD E,A                            ;0xe47d:   5f  "_" 
;--------------------------------------
C_E47E:                               ; XREF: 0xE481 
    CALL 0x366                        ;0xe47e:   cd 66 03  ".f." 
    JR nc, C_E47E                     ;0xe481:   30 fb  "0." 
    DEC C                             ;0xe483:   0d  "." 
    OUT (C),E                         ;0xe484:   ed 59  ".Y" 
    RET                               ;0xe486:   c9  "." 
    LD BC,0xfadd                      ;0xe487:   01 dd fa  "..."  
    LD A,0x10                         ;0xe48a:   3e 10  ">."  
    OUT (C),A                         ;0xe48c:   ed 79  ".y" 
    LD A,(0xbe58)                     ;0xe48e:   3a 58 be  ":X."  
    OR A                              ;0xe491:   b7  "." 
    JR nz, C_E49B                     ;0xe492:   20 07  " ." 
    IN A,(C)                          ;0xe494:   ed 78  ".x" 
    AND 4                             ;0xe496:   e6 04  ".." 
    RET z                             ;0xe498:   c8  "." 
    SCF                               ;0xe499:   37  "7" 
    RET                               ;0xe49a:   c9  "." 
;--------------------------------------
C_E49B:                               ; XREF: 0xE492 
    IN A,(C)                          ;0xe49b:   ed 78  ".x" 
    AND 0x20                          ;0xe49d:   e6 20  ". " 
    RET z                             ;0xe49f:   c8  "." 
    LD A,1                            ;0xe4a0:   3e 01  ">."  
    OUT (C),A                         ;0xe4a2:   ed 79  ".y" 
    IN A,(C)                          ;0xe4a4:   ed 78  ".x" 
    RRA                               ;0xe4a6:   1f  "." 
    RET                               ;0xe4a7:   c9  "." 
    LD E,1                            ;0xe4a8:   1e 01  ".."  
    NOP                               ;0xe4aa:   00  "." 
    JR C_E4AF                         ;0xe4ab:   18 02  ".." 
    LD E,0x80                         ;0xe4ad:   1e 80  ".."  
;--------------------------------------
C_E4AF:                               ; XREF: 0xE4AB 
    LD A,5                            ;0xe4af:   3e 05  ">."  
    OUT (C),A                         ;0xe4b1:   ed 79  ".y" 
    LD A,(0xbe59)                     ;0xe4b3:   3a 59 be  ":Y."  
    AND 0x7f                          ;0xe4b6:   e6 7f  ".." 
    OR E                              ;0xe4b8:   b3  "." 
    OUT (C),A                         ;0xe4b9:   ed 79  ".y" 
    RET                               ;0xe4bb:   c9  "." 
    LD A,C                            ;0xe4bc:   79  "y" 
    SUB 2                             ;0xe4bd:   d6 02  ".." 
    RET nz                            ;0xe4bf:   c0  "." 
    LD H,B                            ;0xe4c0:   60  "`" 
    LD L,B                            ;0xe4c1:   68  "h" 
    LD (0xbe5e),HL                    ;0xe4c2:   22 5e be  ""^."  
    PUSH HL                           ;0xe4c5:   e5  "." 
    LD A,L                            ;0xe4c6:   7d  "}" 
    LD DE,0x36dc                      ;0xe4c7:   11 dc 36  "..6"  
    CALL 0x3af                        ;0xe4ca:   cd af 03  "..." 
    POP AF                            ;0xe4cd:   f1  "." 
    LD DE,0x76dd                      ;0xe4ce:   11 dd 76  "..v"  
    ADD A,A                           ;0xe4d1:   87  "." 
    ADD A,0xc4                        ;0xe4d2:   c6 c4  ".." 
    LD L,A                            ;0xe4d4:   6f  "o" 
    ADC A,3                           ;0xe4d5:   ce 03  ".." 
    SUB L                             ;0xe4d7:   95  "." 
    LD H,A                            ;0xe4d8:   67  "g" 
    LD BC,D_FBDF                      ;0xe4d9:   01 df fb  "..."  
    OUT (C),D                         ;0xe4dc:   ed 51  ".Q" 
    LD C,E                            ;0xe4de:   4b  "K" 
    INC B                             ;0xe4df:   04  "." 
    OUTI                              ;0xe4e0:   ed a3  ".." 
    LD A,(HL)                         ;0xe4e2:   7e  "~" 
    OUT (C),A                         ;0xe4e3:   ed 79  ".y" 
    RET                               ;0xe4e5:   c9  "." 
    RST 0x38                          ;0xe4e6:   ff  "." 
    RST 0x38                          ;0xe4e7:   ff  "." 
    CALL nz, 0x8309                   ;0xe4e8:   c4 09 83  "..." 
    LD B,0x70                         ;0xe4eb:   06 70  ".p"  
    INC B                             ;0xe4ed:   04  "." 
    AND C                             ;0xe4ee:   a1  "." 
    INC BC                            ;0xe4ef:   03  "." 
    LD B,C                            ;0xe4f0:   41  "A" 
    INC BC                            ;0xe4f1:   03  "." 
    AND C                             ;0xe4f2:   a1  "." 
    LD BC,0x1d0                       ;0xe4f3:   01 d0 01  "..."  
    NOP                               ;0xe4f6:   00  "." 
    LD L,B                            ;0xe4f7:   68  "h" 
    LD BC,0x4500                      ;0xe4f8:   01 00 45  "..E"  
    LD BC,0x3400                      ;0xe4fb:   01 00 34  "..4"  
    LD BC,0x2300                      ;0xe4fe:   01 00 23  "..#"  
    LD BC,0x1a00                      ;0xe501:   01 00 1a  "..."  
    LD BC,0x1100                      ;0xe504:   01 00 11  "..."  
    LD BC,0xd00                       ;0xe507:   01 00 0d  "..."  
    LD BC,0x700                       ;0xe50a:   01 00 07  "..."  
    LD BC,ENCRYPTED_USER_NAME         ;0xe50d:   01 00 ff  "..."  
    RST 0x38                          ;0xe510:   ff  "." 
    RST 0x38                          ;0xe511:   ff  "." 
    RST 0x38                          ;0xe512:   ff  "." 
    RST 0x38                          ;0xe513:   ff  "." 
    LD BC,0x7fc3                      ;0xe514:   01 c3 7f  "..."  
    OUT (C),C                         ;0xe517:   ed 49  ".I" 
    LD HL,0x8080                      ;0xe519:   21 80 80  "!.."  
    LD DE,1                           ;0xe51c:   11 01 00  "..."  
    LD A,B                            ;0xe51f:   78  "x" 
    LD BC,0x180                       ;0xe520:   01 80 01  "..."  
    NOP                               ;0xe523:   00  "." 
    LDIR                              ;0xe524:   ed b0  ".." 
    LD BC,0x7fc1                      ;0xe526:   01 c1 7f  "..."  
    OUT (C),C                         ;0xe529:   ed 49  ".I" 
    RET                               ;0xe52b:   c9  "." 
    RST 0x38                          ;0xe52c:   ff  "." 
    LD (0xbe68),A                     ;0xe52d:   32 68 be  "2h."  
    CALL 0x52d                        ;0xe530:   cd 2d 05  ".-." 
    CALL 0x617                        ;0xe533:   cd 17 06  "..." 
    CALL 0x74d                        ;0xe536:   cd 4d 07  ".M." 
    CALL 0x56c                        ;0xe539:   cd 6c 05  ".l." 
    JR C_E57B                         ;0xe53c:   18 3d  ".=" 
    LD A,C                            ;0xe53e:   79  "y" 
    LD HL,(0xbe69)                    ;0xe53f:   2a 69 be  "*i."  
    JP (HL)                           ;0xe542:   e9  "." 
    CALL 0x54b                        ;0xe543:   cd 4b 05  ".K." 
    LD A,C                            ;0xe546:   79  "y" 
    CP 0x20                           ;0xe547:   fe 20  ". " 
    JR c, C_E554                      ;0xe549:   38 09  "8." 
    LD HL,(0xbee5)                    ;0xe54b:   2a e5 be  "*.."  
    CALL 0x7cf                        ;0xe54e:   cd cf 07  "..." 
    JP 0x544                          ;0xe551:   c3 44 05  ".D." 
;--------------------------------------
C_E554:                               ; XREF: 0xE549 
    CALL 0x8e1                        ;0xe554:   cd e1 08  "..." 
    LD A,C                            ;0xe557:   79  "y" 
    CP 0x1b                           ;0xe558:   fe 1b  ".." 
    JR z, C_E565                      ;0xe55a:   28 09  "(." 
    LD HL,0x4c8                       ;0xe55c:   21 c8 04  "!.."  
    CALL 0x45a                        ;0xe55f:   cd 5a 04  ".Z." 
    JP 0x544                          ;0xe562:   c3 44 05  ".D." 
;--------------------------------------
C_E565:                               ; XREF: 0xE55A 
    CALL 0x455                        ;0xe565:   cd 55 04  ".U." 
    LD HL,0x470                       ;0xe568:   21 70 04  "!p."  
    CALL 0x45a                        ;0xe56b:   cd 5a 04  ".Z." 
    RET c                             ;0xe56e:   d8  "." 
    LD HL,0x4d5                       ;0xe56f:   21 d5 04  "!.."  
    CALL 0x45a                        ;0xe572:   cd 5a 04  ".Z." 
    LD HL,(0xbee5)                    ;0xe575:   2a e5 be  "*.."  
    CALL nc, 0x7cf                    ;0xe578:   d4 cf 07  "..." 
;--------------------------------------
C_E57B:                               ; XREF: 0xE53C 
    CALL 0x544                        ;0xe57b:   cd 44 05  ".D." 
    LD HL,0x416                       ;0xe57e:   21 16 04  "!.."  
    PUSH HL                           ;0xe581:   e5  "." 
    POP HL                            ;0xe582:   e1  "." 
    LD (0xbe69),HL                    ;0xe583:   22 69 be  ""i."  
    RET                               ;0xe586:   c9  "." 
    LD B,(HL)                         ;0xe587:   46  "F" 
;--------------------------------------
C_E588:                               ; XREF: 0xE58E 
    INC HL                            ;0xe588:   23  "#" 
    CP (HL)                           ;0xe589:   be  "." 
    INC HL                            ;0xe58a:   23  "#" 
    JR nc, C_E591                     ;0xe58b:   30 04  "0." 
    INC HL                            ;0xe58d:   23  "#" 
    DJNZ C_E588                       ;0xe58e:   10 f8  ".." 
    CCF                               ;0xe590:   3f  "?" 
;--------------------------------------
C_E591:                               ; XREF: 0xE58B 
    RET nz                            ;0xe591:   c0  "." 
    LD E,(HL)                         ;0xe592:   5e  "^" 
    INC HL                            ;0xe593:   23  "#" 
    LD D,(HL)                         ;0xe594:   56  "V" 
    LD HL,(0xbee5)                    ;0xe595:   2a e5 be  "*.."  
    CALL 0x116                        ;0xe598:   cd 16 01  "..." 
    NOP                               ;0xe59b:   00  "." 
    SCF                               ;0xe59c:   37  "7" 
    RET                               ;0xe59d:   c9  "." 
    DEC B                             ;0xe59e:   05  "." 
    LD H,E                            ;0xe59f:   63  "c" 
    XOR B                             ;0xe5a0:   a8  "." 
    INC B                             ;0xe5a1:   04  "." 
    LD H,D                            ;0xe5a2:   62  "b" 
    SBC A,H                           ;0xe5a3:   9c  "." 
    INC B                             ;0xe5a4:   04  "." 
    LD E,C                            ;0xe5a5:   59  "Y" 
    ADD A,B                           ;0xe5a6:   80  "." 
    INC B                             ;0xe5a7:   04  "." 
    INC SP                            ;0xe5a8:   33  "3" 
    CP (HL)                           ;0xe5a9:   be  "." 
    INC B                             ;0xe5aa:   04  "." 
    LD (0x4b4),A                      ;0xe5ab:   32 b4 04  "2.."  
    CALL 0x455                        ;0xe5ae:   cd 55 04  ".U." 
    SUB 0x20                          ;0xe5b1:   d6 20  ". " 
    JR nc, C_E5B6                     ;0xe5b3:   30 01  "0." 
    XOR A                             ;0xe5b5:   af  "." 
;--------------------------------------
C_E5B6:                               ; XREF: 0xE5B3 
    LD (0xbe6b),A                     ;0xe5b6:   32 6b be  "2k."  
    CALL 0x455                        ;0xe5b9:   cd 55 04  ".U." 
    SUB 0x20                          ;0xe5bc:   d6 20  ". " 
    JR nc, C_E5C1                     ;0xe5be:   30 01  "0." 
    XOR A                             ;0xe5c0:   af  "." 
;--------------------------------------
C_E5C1:                               ; XREF: 0xE5BE 
    LD HL,(0xbe6a)                    ;0xe5c1:   2a 6a be  "*j."  
    LD L,A                            ;0xe5c4:   6f  "o" 
    CALL 0x84d                        ;0xe5c5:   cd 4d 08  ".M." 
    JR $-76                           ;0xe5c8:   18 b2  ".." 
    CALL 0x455                        ;0xe5ca:   cd 55 04  ".U." 
    SUB 0x20                          ;0xe5cd:   d6 20  ". " 
    AND 0x3f                          ;0xe5cf:   e6 3f  ".?" 
    CALL 0x8fe                        ;0xe5d1:   cd fe 08  "..." 
    JR $-88                           ;0xe5d4:   18 a6  ".." 
    CALL 0x455                        ;0xe5d6:   cd 55 04  ".U." 
    SUB 0x20                          ;0xe5d9:   d6 20  ". " 
    AND 0x3f                          ;0xe5db:   e6 3f  ".?" 
    CALL 0x8f6                        ;0xe5dd:   cd f6 08  "..." 
    JR $-100                          ;0xe5e0:   18 9a  ".." 
    CALL 0x455                        ;0xe5e2:   cd 55 04  ".U." 
    AND 7                             ;0xe5e5:   e6 07  ".." 
    CALL 0xa20                        ;0xe5e7:   cd 20 0a  ". ." 
    JR $-110                          ;0xe5ea:   18 90  ".." 
    CALL 0x455                        ;0xe5ec:   cd 55 04  ".U." 
    AND 3                             ;0xe5ef:   e6 03  ".." 
    CALL 0x78b                        ;0xe5f1:   cd 8b 07  "..." 
;--------------------------------------
C_E5F4:                               ; XREF: 0xE658 
    JR $-120                          ;0xe5f4:   18 86  ".." 
    INC B                             ;0xe5f6:   04  "." 
    DEC C                             ;0xe5f7:   0d  "." 
    DEC (HL)                          ;0xe5f8:   35  "5" 
    EX AF,AF'                         ;0xe5f9:   08  "." 
    LD A,(BC)                         ;0xe5fa:   0a  "." 
    ADD HL,SP                         ;0xe5fb:   39  "9" 
    EX AF,AF'                         ;0xe5fc:   08  "." 
    EX AF,AF'                         ;0xe5fd:   08  "." 
    LD (0x708),HL                     ;0xe5fe:   22 08 07  "".."  
    DEFB 0xfd                         ;0xe601:   ('}') + 0x80
    DEFB 0x7                          ;0xe602:   0x7
    DEFB 0x1d                         ;0xe603:   0x1d
    DEFB 0x79                         ;0xe604:   "y"
    DEFB 0x81                         ;0xe605:   0x81
    DEFB 0x7                          ;0xe606:   0x7
    DEFB 0x78                         ;0xe607:   "x"
    DEFB 0x84                         ;0xe608:   0x84
    DEFB 0x7                          ;0xe609:   0x7
    DEFB 0x77                         ;0xe60a:   "w"
    DEFB 0x6                          ;0xe60b:   0x6
    DEFB 0x8                          ;0xe60c:   0x8
    DEFB 0x76                         ;0xe60d:   "v"
    DEFB 0x2                          ;0xe60e:   0x2
    DEFB 0x8                          ;0xe60f:   0x8
    DEFB 0x75                         ;0xe610:   "u"
    DEFB 0xec                         ;0xe611:   ('l') + 0x80
    DEFB 0x8                          ;0xe612:   0x8
    DEFB 0x72                         ;0xe613:   "r"
    DEFB 0xeb                         ;0xe614:   ('k') + 0x80
    DEFB 0x8                          ;0xe615:   0x8
    DEFB 0x71                         ;0xe616:   "q"
    DEFB 0xf1                         ;0xe617:   ('q') + 0x80
    DEFB 0x8                          ;0xe618:   0x8
    DEFB 0x70                         ;0xe619:   "p"
    DEFB 0xed                         ;0xe61a:   ('m') + 0x80
    DEFB 0x8                          ;0xe61b:   0x8
    DEFB 0x6f                         ;0xe61c:   "o"
    DEFB 0x9a                         ;0xe61d:   0x9a
    DEFB 0x8                          ;0xe61e:   0x8
    DEFB 0x6c                         ;0xe61f:   "l"
    DEFB 0x97                         ;0xe620:   0x97
    DEFB 0x8                          ;0xe621:   0x8
    DEFB 0x6b                         ;0xe622:   "k"
    DEFB 0x4a                         ;0xe623:   "J"
    DEFB 0x8                          ;0xe624:   0x8
    DEFB 0x6a                         ;0xe625:   "j"
    DEFB 0x69                         ;0xe626:   "i"
    DEFB 0x8                          ;0xe627:   0x8
    DEFB 0x66                         ;0xe628:   "f"
    DEFB 0x69                         ;0xe629:   "i"
    DEFB 0x5                          ;0xe62a:   0x5
    DEFB 0x65                         ;0xe62b:   "e"
    DEFB 0x6c                         ;0xe62c:   "l"
    DEFB 0x5                          ;0xe62d:   0x5
    DEFB 0x64                         ;0xe62e:   "d"
    DEFB 0x6d                         ;0xe62f:   "m"
    DEFB 0x8                          ;0xe630:   0x8
    DEFB 0x4e                         ;0xe631:   "N"
    DEFB 0xbc                         ;0xe632:   ('<') + 0x80
    DEFB 0x8                          ;0xe633:   0x8
    DEFB 0x4d                         ;0xe634:   "M"
    DEFB 0xa3                         ;0xe635:   ('#') + 0x80
    DEFB 0x8                          ;0xe636:   0x8
    DEFB 0x4c                         ;0xe637:   "L"
    DEFB 0x9f                         ;0xe638:   0x9f
    DEFB 0x8                          ;0xe639:   0x8
    DEFB 0x4b                         ;0xe63a:   "K"
    DEFB 0x93                         ;0xe63b:   0x93
    DEFB 0x8                          ;0xe63c:   0x8
    DEFB 0x4a                         ;0xe63d:   "J"
    DEFB 0x7b                         ;0xe63e:   "{"
    DEFB 0x8                          ;0xe63f:   0x8
    DEFB 0x49                         ;0xe640:   "I"
    DEFB 0x19                         ;0xe641:   0x19
    DEFB 0x8                          ;0xe642:   0x8
    DEFB 0x48                         ;0xe643:   "H"
    DEFB 0x45                         ;0xe644:   "E"
    DEFB 0x8                          ;0xe645:   0x8
    DEFB 0x45                         ;0xe646:   "E"
    DEFB 0x72                         ;0xe647:   "r"
    DEFB 0x8                          ;0xe648:   0x8
    DEFB 0x44                         ;0xe649:   "D"
    DEFB 0xf                          ;0xe64a:   0xf
    DEFB 0x8                          ;0xe64b:   0x8
    DEFB 0x43                         ;0xe64c:   "C"
    DEFB 0x16                         ;0xe64d:   0x16
    DEFB 0x8                          ;0xe64e:   0x8
    DEFB 0x42                         ;0xe64f:   "B"
    DEFB 0x13                         ;0xe650:   0x13
    DEFB 0x8                          ;0xe651:   0x8
    DEFB 0x41                         ;0xe652:   "A"
    DEFB 0xb                          ;0xe653:   0xb
    DEFB 0x8                          ;0xe654:   0x8
    DEFB 0x31                         ;0xe655:   "1"
    DEFB 0x9d                         ;0xe656:   0x9d
    DEFB 0x7                          ;0xe657:   0x7
    DEFB 0x30                         ;0xe658:   "0"
    DEFB 0x9a                         ;0xe659:   0x9a
    DEFB 0x7                          ;0xe65a:   0x7
    DEFB 0x1                          ;0xe65b:   0x1
    DEFB 0xff                         ;0xe65c:   0xff
    DEFB 0x80                         ;0xe65d:   0x80
    DEFB 0x21                         ;0xe65e:   "!"
    DEFB 0x72                         ;0xe65f:   "r"
    DEFB 0xbe                         ;0xe660:   ('>') + 0x80
    DEFB 0x11                         ;0xe661:   0x11
    DEFB 0x5c                         ;0xe662:   "\"
    DEFB 0x5                          ;0xe663:   0x5
    DEFB 0xcd                         ;0xe664:   ('M') + 0x80
    DEFB 0xef                         ;0xe665:   ('o') + 0x80
    DEFB 0xbc                         ;0xe666:   ('<') + 0x80
    DEFB 0x21                         ;0xe667:   "!"
    DEFB 0x6c                         ;0xe668:   "l"
    DEFB 0xbe                         ;0xe669:   ('>') + 0x80
    DEFB 0x11                         ;0xe66a:   0x11
    DEFB 0x2                          ;0xe66b:   0x2
    DEFB 0x0                          ;0xe66c:   0x0
    DEFB 0x42                         ;0xe66d:   "B"
    DEFB 0x4b                         ;0xe66e:   "K"
    DEFB 0xc3                         ;0xe66f:   ('C') + 0x80
    DEFB 0xe9                         ;0xe670:   ('i') + 0x80
    DEFB 0xbc                         ;0xe671:   ('<') + 0x80
    DEFB 0x21                         ;0xe672:   "!"
    DEFB 0x5                          ;0xe673:   0x5
    DEFB 0x1                          ;0xe674:   0x1
    DEFB 0x0                          ;0xe675:   0x0
    DEFB 0x22                         ;0xe676:   """
    DEFB 0x6e                         ;0xe677:   "n"
    DEFB 0xbe                         ;0xe678:   ('>') + 0x80
    DEFB 0xc9                         ;0xe679:   ('I') + 0x80
    DEFB 0x21                         ;0xe67a:   "!"
    DEFB 0x2                          ;0xe67b:   0x2
    DEFB 0x0                          ;0xe67c:   0x0
    DEFB 0x22                         ;0xe67d:   """
    DEFB 0x6e                         ;0xe67e:   "n"
    DEFB 0xbe                         ;0xe67f:   ('>') + 0x80
    DEFB 0x21                         ;0xe680:   "!"
    DEFB 0x7a                         ;0xe681:   "z"
    DEFB 0xbe                         ;0xe682:   ('>') + 0x80
    DEFB 0x7e                         ;0xe683:   "~"
    DEFB 0x36                         ;0xe684:   "6"
    DEFB 0x1                          ;0xe685:   0x1
    DEFB 0x0                          ;0xe686:   0x0
    DEFB 0xb7                         ;0xe687:   ('7') + 0x80
    DEFB 0xc8                         ;0xe688:   ('H') + 0x80
    DEFB 0xc3                         ;0xe689:   ('C') + 0x80
    DEFB 0x84                         ;0xe68a:   0x84
    DEFB 0xbb                         ;0xe68b:   (';') + 0x80
    DEFB 0x2a                         ;0xe68c:   "*"
    DEFB 0x79                         ;0xe68d:   "y"
    DEFB 0xbe                         ;0xe68e:   ('>') + 0x80
    DEFB 0x7c                         ;0xe68f:   "|"
    DEFB 0x2f                         ;0xe690:   "/"
    DEFB 0xa5                         ;0xe691:   ('%') + 0x80
    DEFB 0xc8                         ;0xe692:   ('H') + 0x80
    DEFB 0x32                         ;0xe693:   "2"
    DEFB 0x7a                         ;0xe694:   "z"
    DEFB 0xbe                         ;0xe695:   ('>') + 0x80
    DEFB 0xc3                         ;0xe696:   ('C') + 0x80
    DEFB 0x81                         ;0xe697:   0x81
    DEFB 0xbb                         ;0xe698:   (';') + 0x80
    DEFB 0xaf                         ;0xe699:   ('/') + 0x80
    DEFB 0x18                         ;0xe69a:   0x18
    DEFB 0x2                          ;0xe69b:   0x2
    DEFB 0x3e                         ;0xe69c:   ">"
    DEFB 0xff                         ;0xe69d:   0xff
;--------------------------------------
C_E69E:                               ; XREF: 0xE69A 
    LD (0xbe79),A                     ;0xe69e:   32 79 be  "2y."  
    RET                               ;0xe6a1:   c9  "." 
    LD HL,0x3d03                      ;0xe6a2:   21 03 3d  "!.="  
    LD (0xbe7b),HL                    ;0xe6a5:   22 7b be  ""{."  
    AND 0x7f                          ;0xe6a8:   e6 7f  ".." 
;--------------------------------------
C_E6AA:                               ; XREF: 0xE6EA 
    LD B,A                            ;0xe6aa:   47  "G" 
    LD HL,1                           ;0xe6ab:   21 01 00  "!.."  
    ADC A,B                           ;0xe6ae:   88  "." 
    INC B                             ;0xe6af:   04  "." 
    JR C_E6B7                         ;0xe6b0:   18 05  ".." 
;--------------------------------------
C_E6B2:                               ; XREF: 0xE6B5 
    LD A,(HL)                         ;0xe6b2:   7e  "~" 
    INC HL                            ;0xe6b3:   23  "#" 
    INC A                             ;0xe6b4:   3c  "<" 
    JR nz, C_E6B2                     ;0xe6b5:   20 fb  " ." 
;--------------------------------------
C_E6B7:                               ; XREF: 0xE6B0 
    DJNZ C_E6B2                       ;0xe6b7:   10 f9  ".." 
;--------------------------------------
C_E6B9:                               ; XREF: 0xE6C7 
    LD A,(HL)                         ;0xe6b9:   7e  "~" 
    INC HL                            ;0xe6ba:   23  "#" 
    CP 0xff                           ;0xe6bb:   fe ff  ".." 
    RET z                             ;0xe6bd:   c8  "." 
    OR A                              ;0xe6be:   b7  "." 
    JP p, 0x598                       ;0xe6bf:   f2 98 05  "..." 
    PUSH HL                           ;0xe6c2:   e5  "." 
    CALL 0x59d                        ;0xe6c3:   cd 9d 05  "..." 
    POP HL                            ;0xe6c6:   e1  "." 
    JR C_E6B9                         ;0xe6c7:   18 f0  ".." 
    CALL 0x609                        ;0xe6c9:   cd 09 06  "..." 
    JR C_E6B9                         ;0xe6cc:   18 eb  ".." 
    CP 0xfe                           ;0xe6ce:   fe fe  ".." 
    JR z, C_E72D                      ;0xe6d0:   28 5b  "([" 
    CP 0xfd                           ;0xe6d2:   fe fd  ".." 
    JR z, C_E732                      ;0xe6d4:   28 5c  "(\" 
    LD H,1                            ;0xe6d6:   26 01  "&."  
    NOP                               ;0xe6d8:   00  "." 
    LD L,D                            ;0xe6d9:   6a  "j" 
    CP 0xfb                           ;0xe6da:   fe fb  ".." 
    JR z, C_E6EC                      ;0xe6dc:   28 0e  "(." 
    LD L,E                            ;0xe6de:   6b  "k" 
    CP 0xfa                           ;0xe6df:   fe fa  ".." 
    JR z, C_E6EC                      ;0xe6e1:   28 09  "(." 
    LD H,D                            ;0xe6e3:   62  "b" 
    CP 0xf8                           ;0xe6e4:   fe f8  ".." 
    JR z, $+58                        ;0xe6e6:   28 38  "(8" 
    CP 0xf9                           ;0xe6e8:   fe f9  ".." 
    JR nz, C_E6AA                     ;0xe6ea:   20 be  " ." 
;--------------------------------------
C_E6EC:                               ; XREF: 0xE6DC 
    PUSH BC                           ;0xe6ec:   c5  "." 
    PUSH DE                           ;0xe6ed:   d5  "." 
    LD D,1                            ;0xe6ee:   16 01  ".."  
    NOP                               ;0xe6f0:   00  "." 
    LD BC,D_D8F0                      ;0xe6f1:   01 f0 d8  "..."  
    CALL 0x5df                        ;0xe6f4:   cd df 05  "..." 
    LD BC,D_FC18                      ;0xe6f7:   01 18 fc  "..."  
    CALL 0x5df                        ;0xe6fa:   cd df 05  "..." 
    LD BC,D_FF9C                      ;0xe6fd:   01 9c ff  "..."  
    CALL 0x5df                        ;0xe700:   cd df 05  "..." 
    LD BC,D_FFF6                      ;0xe703:   01 f6 ff  "..."  
    CALL 0x5df                        ;0xe706:   cd df 05  "..." 
    LD A,L                            ;0xe709:   7d  "}" 
    ADD A,0x30                        ;0xe70a:   c6 30  ".0" 
    CALL 0x609                        ;0xe70c:   cd 09 06  "..." 
    POP DE                            ;0xe70f:   d1  "." 
    POP BC                            ;0xe710:   c1  "." 
    RET                               ;0xe711:   c9  "." 
    LD A,0xff                         ;0xe712:   3e ff  ">."  
;--------------------------------------
C_E714:                               ; XREF: 0xE716 
    INC A                             ;0xe714:   3c  "<" 
    ADD HL,BC                         ;0xe715:   09  "." 
    JR c, C_E714                      ;0xe716:   38 fc  "8." 
    SBC HL,BC                         ;0xe718:   ed 42  ".B" 
    OR D                              ;0xe71a:   b2  "." 
    RET z                             ;0xe71b:   c8  "." 
    LD D,0x30                         ;0xe71c:   16 30  ".0"  
    OR D                              ;0xe71e:   b2  "." 
    JR C_E73C                         ;0xe71f:   18 1b  ".." 
    PUSH BC                           ;0xe721:   c5  "." 
    LD B,6                            ;0xe722:   06 06  ".."  
;--------------------------------------
C_E724:                               ; XREF: 0xE72B 
    LD A,(HL)                         ;0xe724:   7e  "~" 
    INC HL                            ;0xe725:   23  "#" 
    CP 0x20                           ;0xe726:   fe 20  ". " 
    CALL nz, 0x609                    ;0xe728:   c4 09 06  "..." 
    DJNZ C_E724                       ;0xe72b:   10 f7  ".." 
;--------------------------------------
C_E72D:                               ; XREF: 0xE6D0 
    POP BC                            ;0xe72d:   c1  "." 
    RET                               ;0xe72e:   c9  "." 
    LD A,(0xbe68)                     ;0xe72f:   3a 68 be  ":h."  
;--------------------------------------
C_E732:                               ; XREF: 0xE6D4 
    OR A                              ;0xe732:   b7  "." 
    RET z                             ;0xe733:   c8  "." 
    LD A,C                            ;0xe734:   79  "y" 
    ADD A,0x41                        ;0xe735:   c6 41  ".A" 
    CALL 0x609                        ;0xe737:   cd 09 06  "..." 
    LD A,0x3a                         ;0xe73a:   3e 3a  ">:"  
;--------------------------------------
C_E73C:                               ; XREF: 0xE71F 
    PUSH BC                           ;0xe73c:   c5  "." 
    PUSH DE                           ;0xe73d:   d5  "." 
    PUSH HL                           ;0xe73e:   e5  "." 
    LD C,A                            ;0xe73f:   4f  "O" 
    LD HL,(0xbe7b)                    ;0xe740:   2a 7b be  "*{."  
    CALL 0x11e                        ;0xe743:   cd 1e 01  "..." 
    NOP                               ;0xe746:   00  "." 
    POP HL                            ;0xe747:   e1  "." 
    POP DE                            ;0xe748:   d1  "." 
    POP BC                            ;0xe749:   c1  "." 
    RET                               ;0xe74a:   c9  "." 
    LD A,0xff                         ;0xe74b:   3e ff  ">."  
    LD (0xbe7d),A                     ;0xe74d:   32 7d be  "2}."  
    LD BC,0x80ff                      ;0xe750:   01 ff 80  "..."  
    LD HL,0xbe81                      ;0xe753:   21 81 be  "!.."  
    LD DE,0x6f2                       ;0xe756:   11 f2 06  "..."  
    CALL KL_INIT_EVENT                ;0xe759:   cd ef bc  "..." 
    LD HL,0xbe7f                      ;0xe75c:   21 7f be  "!.."  
    JP KL_ADD_FRAME_FLY               ;0xe75f:   c3 da bc  "..." 
    CALL 0x691                        ;0xe762:   cd 91 06  "..." 
    JR nz, C_E772                     ;0xe765:   20 0b  " ." 
    PUSH BC                           ;0xe767:   c5  "." 
    LD A,0x10                         ;0xe768:   3e 10  ">."  
    CALL 0x572                        ;0xe76a:   cd 72 05  ".r." 
    POP BC                            ;0xe76d:   c1  "." 
    LD A,B                            ;0xe76e:   78  "x" 
    JP 0x572                          ;0xe76f:   c3 72 05  ".r." 
;--------------------------------------
C_E772:                               ; XREF: 0xE765 
    XOR A                             ;0xe772:   af  "." 
    LD (0xbe8b),A                     ;0xe773:   32 8b be  "2.."  
    CALL 0x696                        ;0xe776:   cd 96 06  "..." 
    CALL 0x691                        ;0xe779:   cd 91 06  "..." 
    LD C,7                            ;0xe77c:   0e 07  ".."  
    JP z, 0x3d03                      ;0xe77e:   ca 03 3d  "..=" 
    XOR A                             ;0xe781:   af  "." 
    LD (0xbe8a),A                     ;0xe782:   32 8a be  "2.."  
    CALL 0x7fd                        ;0xe785:   cd fd 07  "..." 
    LD A,0xff                         ;0xe788:   3e ff  ">."  
    LD (0xbe8a),A                     ;0xe78a:   32 8a be  "2.."  
    RET                               ;0xe78d:   c9  "." 
    CALL 0x691                        ;0xe78e:   cd 91 06  "..." 
    LD A,0x10                         ;0xe791:   3e 10  ">."  
    JP z, 0x572                       ;0xe793:   ca 72 05  ".r." 
    XOR A                             ;0xe796:   af  "." 
    LD (0xbe8a),A                     ;0xe797:   32 8a be  "2.."  
    CALL 0x6e9                        ;0xe79a:   cd e9 06  "..." 
    CALL 0x691                        ;0xe79d:   cd 91 06  "..." 
    RET z                             ;0xe7a0:   c8  "." 
    LD A,(0xbe68)                     ;0xe7a1:   3a 68 be  ":h."  
    OR A                              ;0xe7a4:   b7  "." 
    JR nz, C_E7B7                     ;0xe7a5:   20 10  " ." 
    LD A,(0xbe7e)                     ;0xe7a7:   3a 7e be  ":~."  
    LD C,A                            ;0xe7aa:   4f  "O" 
    LD B,0x11                         ;0xe7ab:   06 11  ".."  
    LD A,(0xbee3)                     ;0xe7ad:   3a e3 be  ":.."  
    SUB 0x10                          ;0xe7b0:   d6 10  ".." 
    CALL 0x696                        ;0xe7b2:   cd 96 06  "..." 
    JR C_E81D                         ;0xe7b5:   18 66  ".f" 
;--------------------------------------
C_E7B7:                               ; XREF: 0xE7A5 
    CALL 0x691                        ;0xe7b7:   cd 91 06  "..." 
    RET z                             ;0xe7ba:   c8  "." 
    CALL 0x6cf                        ;0xe7bb:   cd cf 06  "..." 
    JR C_E81D                         ;0xe7be:   18 5d  ".]" 
    LD A,C                            ;0xe7c0:   79  "y" 
    LD (0xbe7e),A                     ;0xe7c1:   32 7e be  "2~."  
    RET                               ;0xe7c4:   c9  "." 
    LD A,(0xbe7d)                     ;0xe7c5:   3a 7d be  ":}."  
    OR A                              ;0xe7c8:   b7  "." 
    RET                               ;0xe7c9:   c9  "." 
    PUSH AF                           ;0xe7ca:   f5  "." 
    LD A,B                            ;0xe7cb:   78  "x" 
    LD HL,0xbe8c                      ;0xe7cc:   21 8c be  "!.."  
    LD B,5                            ;0xe7cf:   06 05  ".."  
;--------------------------------------
C_E7D1:                               ; XREF: 0xE7D4 
    LD (HL),0x20                      ;0xe7d1:   36 20  "6 "  
    INC HL                            ;0xe7d3:   23  "#" 
    DJNZ C_E7D1                       ;0xe7d4:   10 fb  ".." 
    LD (0xbedc),HL                    ;0xe7d6:   22 dc be  "".."  
    LD HL,0x6c4                       ;0xe7d9:   21 c4 06  "!.."  
    CALL 0x575                        ;0xe7dc:   cd 75 05  ".u." 
    CALL 0x6cf                        ;0xe7df:   cd cf 06  "..." 
    POP AF                            ;0xe7e2:   f1  "." 
    LD (0xbede),A                     ;0xe7e3:   32 de be  "2.."  
    LD HL,0xbe8c                      ;0xe7e6:   21 8c be  "!.."  
    LD (0xbedc),HL                    ;0xe7e9:   22 dc be  "".."  
;--------------------------------------
C_E7EC:                               ; XREF: 0xE7F6 
    LD A,(HL)                         ;0xe7ec:   7e  "~" 
    CP 0xff                           ;0xe7ed:   fe ff  ".." 
    CALL nz, 0x734                    ;0xe7ef:   c4 34 07  ".4." 
    RET nc                            ;0xe7f2:   d0  "." 
    CALL 0x716                        ;0xe7f3:   cd 16 07  "..." 
    JR C_E7EC                         ;0xe7f6:   18 f4  ".." 
    LD HL,(0xbedc)                    ;0xe7f8:   2a dc be  "*.."  
    LD (HL),C                         ;0xe7fb:   71  "q" 
    INC HL                            ;0xe7fc:   23  "#" 
    LD (HL),0xff                      ;0xe7fd:   36 ff  "6."  
    LD (0xbedc),HL                    ;0xe7ff:   22 dc be  "".."  
    RET                               ;0xe802:   c9  "." 
    CALL 0x54b                        ;0xe803:   cd 4b 05  ".K." 
    CALL 0x8e1                        ;0xe806:   cd e1 08  "..." 
    CALL TXT_GET_CURSOR               ;0xe809:   cd 78 bb  ".x." 
    LD (0xbe88),HL                    ;0xe80c:   22 88 be  "".."  
    LD HL,(0xbee2)                    ;0xe80f:   2a e2 be  "*.."  
    INC L                             ;0xe812:   2c  "," 
    LD H,1                            ;0xe813:   26 01  "&."  
    CALL TXT_SET_CURSOR               ;0xe815:   cd 75 bb  ".u." 
    LD A,0x12                         ;0xe818:   3e 12  ">."  
    JP TXT_OUTPUT                     ;0xe81a:   c3 5a bb  ".Z." 
;--------------------------------------
C_E81D:                               ; XREF: 0xE7B5 
    LD HL,(0xbe88)                    ;0xe81d:   2a 88 be  "*.."  
    CALL TXT_SET_CURSOR               ;0xe820:   cd 75 bb  ".u." 
    JP 0x544                          ;0xe823:   c3 44 05  ".D." 
    LD A,(0xbe8a)                     ;0xe826:   3a 8a be  ":.."  
    OR A                              ;0xe829:   b7  "." 
    RET z                             ;0xe82a:   c8  "." 
;--------------------------------------
C_E82B:                               ; XREF: 0xE831 
    CALL 0x734                        ;0xe82b:   cd 34 07  ".4." 
    CALL c, 0x716                     ;0xe82e:   dc 16 07  "..." 
    JR c, C_E82B                      ;0xe831:   38 f8  "8." 
    PUSH DE                           ;0xe833:   d5  "." 
    LD C,0x4f                         ;0xe834:   0e 4f  ".O"  
    LD L,E                            ;0xe836:   6b  "k" 
    LD DE,0x101                       ;0xe837:   11 01 01  "..."  
    NOP                               ;0xe83a:   00  "." 
    LD H,D                            ;0xe83b:   62  "b" 
    CALL 0x9b5                        ;0xe83c:   cd b5 09  "..." 
    POP DE                            ;0xe83f:   d1  "." 
    CALL 0xa14                        ;0xe840:   cd 14 0a  "..." 
    DEC B                             ;0xe843:   05  "." 
    LD HL,0xbe8b                      ;0xe844:   21 8b be  "!.."  
    INC (HL)                          ;0xe847:   34  "4" 
    LD A,(HL)                         ;0xe848:   7e  "~" 
    AND B                             ;0xe849:   a0  "." 
    RET nz                            ;0xe84a:   c0  "." 
    LD HL,(0xbedc)                    ;0xe84b:   2a dc be  "*.."  
    LD A,(HL)                         ;0xe84e:   7e  "~" 
    CP 0xff                           ;0xe84f:   fe ff  ".." 
    JR nz, C_E857                     ;0xe851:   20 04  " ." 
    LD HL,0xbe8c                      ;0xe853:   21 8c be  "!.."  
    LD A,(HL)                         ;0xe856:   7e  "~" 
;--------------------------------------
C_E857:                               ; XREF: 0xE851 
    INC HL                            ;0xe857:   23  "#" 
    LD (0xbedc),HL                    ;0xe858:   22 dc be  "".."  
    LD C,A                            ;0xe85b:   4f  "O" 
    EX DE,HL                          ;0xe85c:   eb  "." 
    INC H                             ;0xe85d:   24  "$" 
    INC L                             ;0xe85e:   2c  "," 
    CALL TXT_SET_CURSOR               ;0xe85f:   cd 75 bb  ".u." 
    EX DE,HL                          ;0xe862:   eb  "." 
    LD A,C                            ;0xe863:   79  "y" 
    CALL TXT_OUTPUT                   ;0xe864:   cd 5a bb  ".Z." 
    SCF                               ;0xe867:   37  "7" 
    RET                               ;0xe868:   c9  "." 
    LD DE,(0xbee2)                    ;0xe869:   ed 5b e2 be  ".[.."  
    LD A,(0xbede)                     ;0xe86d:   3a de be  ":.."  
    INC D                             ;0xe870:   14  "." 
    CP D                              ;0xe871:   ba  "." 
    DEC D                             ;0xe872:   15  "." 
    RET nc                            ;0xe873:   d0  "." 
    LD D,A                            ;0xe874:   57  "W" 
    INC A                             ;0xe875:   3c  "<" 
    LD (0xbede),A                     ;0xe876:   32 de be  "2.."  
    RET                               ;0xe879:   c9  "." 
    LD DE,(0xbee0)                    ;0xe87a:   ed 5b e0 be  ".[.."  
    LD HL,(0xbee5)                    ;0xe87e:   2a e5 be  "*.."  
    RET                               ;0xe881:   c9  "." 
    LD A,0x40                         ;0xe882:   3e 40  ">@"  
    CALL SCR_SET_BASE                 ;0xe884:   cd 08 bc  "..." 
    LD A,2                            ;0xe887:   3e 02  ">."  
    CALL SCR_SET_MODE                 ;0xe889:   cd 0e bc  "..." 
    CALL SCR_RESET                    ;0xe88c:   cd 02 bc  "..." 
    XOR A                             ;0xe88f:   af  "." 
    LD (0xbeeb),A                     ;0xe890:   32 eb be  "2.."  
    LD (0xbee9),A                     ;0xe893:   32 e9 be  "2.."  
    LD (0xbeea),A                     ;0xe896:   32 ea be  "2.."  
    LD A,1                            ;0xe899:   3e 01  ">."  
    CALL 0x8f6                        ;0xe89b:   cd f6 08  "..." 
    LD A,0x3f                         ;0xe89e:   3e 3f  ">?"  
    CALL 0x8fe                        ;0xe8a0:   cd fe 08  "..." 
    XOR A                             ;0xe8a3:   af  "." 
    LD (0xbedf),A                     ;0xe8a4:   32 df be  "2.."  
    CPL                               ;0xe8a7:   2f  "/" 
    LD (0xbee4),A                     ;0xe8a8:   32 e4 be  "2.."  
    LD HL,2                           ;0xe8ab:   21 02 00  "!.."  
    LD (0xbee5),HL                    ;0xe8ae:   22 e5 be  "".."  
    LD (0xbee7),HL                    ;0xe8b1:   22 e7 be  "".."  
    JR $+40                           ;0xe8b4:   18 26  ".&" 
    XOR A                             ;0xe8b6:   af  "." 
    JR C_E8BB                         ;0xe8b7:   18 02  ".." 
    LD A,0xff                         ;0xe8b9:   3e ff  ">."  
;--------------------------------------
C_E8BB:                               ; XREF: 0xE8B7 
    LD (0xbedf),A                     ;0xe8bb:   32 df be  "2.."  
    LD A,2                            ;0xe8be:   3e 02  ">."  
    CP 2                              ;0xe8c0:   fe 02  ".." 
    JR z, C_E8CA                      ;0xe8c2:   28 06  "(." 
    RET nc                            ;0xe8c4:   d0  "." 
    LD HL,0xbedf                      ;0xe8c5:   21 df be  "!.."  
    LD (HL),1                         ;0xe8c8:   36 01  "6."  
;--------------------------------------
C_E8CA:                               ; XREF: 0xE8C2 
    NOP                               ;0xe8ca:   00  "." 
    CALL SCR_SET_MODE                 ;0xe8cb:   cd 0e bc  "..." 
    JR C_E8DD                         ;0xe8ce:   18 0d  ".." 
    XOR A                             ;0xe8d0:   af  "." 
    JR C_E8D5                         ;0xe8d1:   18 02  ".." 
    LD A,0xff                         ;0xe8d3:   3e ff  ">."  
;--------------------------------------
C_E8D5:                               ; XREF: 0xE8D1 
    PUSH AF                           ;0xe8d5:   f5  "." 
    CALL 0x683                        ;0xe8d6:   cd 83 06  "..." 
    POP AF                            ;0xe8d9:   f1  "." 
    LD (0xbe7d),A                     ;0xe8da:   32 7d be  "2}."  
;--------------------------------------
C_E8DD:                               ; XREF: 0xE8CE 
    CALL SCR_CHAR_LIMITS              ;0xe8dd:   cd 17 bc  "..." 
    LD (0xbee2),BC                    ;0xe8e0:   ed 43 e2 be  ".C.."  
    LD A,(0xbedf)                     ;0xe8e4:   3a df be  ":.."  
    OR A                              ;0xe8e7:   b7  "." 
    LD HL,0x174f                      ;0xe8e8:   21 4f 17  "!O."  
    JR nz, C_E8F9                     ;0xe8eb:   20 0c  " ." 
    LD HL,(0xbee2)                    ;0xe8ed:   2a e2 be  "*.."  
    LD A,H                            ;0xe8f0:   7c  "|" 
    LD H,L                            ;0xe8f1:   65  "e" 
    LD L,A                            ;0xe8f2:   6f  "o" 
    CALL 0x691                        ;0xe8f3:   cd 91 06  "..." 
    JR z, C_E8F9                      ;0xe8f6:   28 01  "(." 
    DEC H                             ;0xe8f8:   25  "%" 
;--------------------------------------
C_E8F9:                               ; XREF: 0xE8EB 
    LD (0xbee0),HL                    ;0xe8f9:   22 e0 be  "".."  
    LD HL,(0xbee5)                    ;0xe8fc:   2a e5 be  "*.."  
    CALL 0x84d                        ;0xe8ff:   cd 4d 08  ".M." 
    JP 0x669                          ;0xe902:   c3 69 06  ".i." 
    PUSH HL                           ;0xe905:   e5  "." 
    CALL 0x8d8                        ;0xe906:   cd d8 08  "..." 
    LD A,C                            ;0xe909:   79  "y" 
    CALL TXT_WR_CHAR                  ;0xe90a:   cd 5d bb  ".]." 
    POP HL                            ;0xe90d:   e1  "." 
    INC L                             ;0xe90e:   2c  "," 
    LD (0xbee5),HL                    ;0xe90f:   22 e5 be  "".."  
    LD DE,(0xbee0)                    ;0xe912:   ed 5b e0 be  ".[.."  
    LD A,E                            ;0xe916:   7b  "{" 
    CP L                              ;0xe917:   bd  "." 
    RET nc                            ;0xe918:   d0  "." 
    DEC L                             ;0xe919:   2d  "-" 
    LD A,(0xbee4)                     ;0xe91a:   3a e4 be  ":.."  
    OR A                              ;0xe91d:   b7  "." 
    JR z, C_E930                      ;0xe91e:   28 10  "(." 
    LD L,1                            ;0xe920:   2e 01  ".."  
    NOP                               ;0xe922:   00  "." 
    INC H                             ;0xe923:   24  "$" 
    LD A,D                            ;0xe924:   7a  "z" 
    CP H                              ;0xe925:   bc  "." 
    JR nc, C_E931                     ;0xe926:   30 09  "0." 
    DEC H                             ;0xe928:   25  "%" 
    PUSH HL                           ;0xe929:   e5  "." 
    CALL 0x8e1                        ;0xe92a:   cd e1 08  "..." 
    CALL 0x95f                        ;0xe92d:   cd 5f 09  "._." 
;--------------------------------------
C_E930:                               ; XREF: 0xE91E 
    POP HL                            ;0xe930:   e1  "." 
;--------------------------------------
C_E931:                               ; XREF: 0xE926 
    JP 0x84d                          ;0xe931:   c3 4d 08  ".M." 
    LD A,7                            ;0xe934:   3e 07  ">."  
    JP TXT_OUTPUT                     ;0xe936:   c3 5a bb  ".Z." 
    LD A,0xff                         ;0xe939:   3e ff  ">."  
    JR C_E93E                         ;0xe93b:   18 01  ".." 
    XOR A                             ;0xe93d:   af  "." 
;--------------------------------------
C_E93E:                               ; XREF: 0xE93B 
    LD (0xbee4),A                     ;0xe93e:   32 e4 be  "2.."  
    RET                               ;0xe941:   c9  "." 
    DEC H                             ;0xe942:   25  "%" 
    RET m                             ;0xe943:   f8  "." 
    JR C_E992                         ;0xe944:   18 4c  ".L" 
    DEC L                             ;0xe946:   2d  "-" 
    RET m                             ;0xe947:   f8  "." 
    JR C_E992                         ;0xe948:   18 48  ".H" 
    INC H                             ;0xe94a:   24  "$" 
    JR $+57                           ;0xe94b:   18 37  ".7" 
    INC L                             ;0xe94d:   2c  "," 
    JR $+54                           ;0xe94e:   18 34  ".4" 
    DEC H                             ;0xe950:   25  "%" 
    JP p, 0x85b                       ;0xe951:   f2 5b 08  ".[." 
    CALL 0x957                        ;0xe954:   cd 57 09  ".W." 
    JR $+62                           ;0xe957:   18 3c  ".<" 
    DEC L                             ;0xe959:   2d  "-" 
    JP p, 0x85b                       ;0xe95a:   f2 5b 08  ".[." 
    INC L                             ;0xe95d:   2c  "," 
    LD A,(0xbee4)                     ;0xe95e:   3a e4 be  ":.."  
    OR A                              ;0xe961:   b7  "." 
    RET z                             ;0xe962:   c8  "." 
    LD A,H                            ;0xe963:   7c  "|" 
    DEC A                             ;0xe964:   3d  "=" 
    RET m                             ;0xe965:   f8  "." 
    LD HL,(0xbee0)                    ;0xe966:   2a e0 be  "*.."  
    LD H,A                            ;0xe969:   67  "g" 
    JR C_E992                         ;0xe96a:   18 26  ".&" 
    LD L,1                            ;0xe96c:   2e 01  ".."  
    NOP                               ;0xe96e:   00  "." 
    JR C_E993                         ;0xe96f:   18 22  "."" 
    INC H                             ;0xe971:   24  "$" 
    LD A,(0xbee1)                     ;0xe972:   3a e1 be  ":.."  
    CP H                              ;0xe975:   bc  "." 
    JR nc, C_E993                     ;0xe976:   30 1b  "0." 
    CALL 0x95f                        ;0xe978:   cd 5f 09  "._." 
    JR C_E996                         ;0xe97b:   18 19  ".." 
    LD HL,2                           ;0xe97d:   21 02 00  "!.."  
    JR C_E993                         ;0xe980:   18 11  ".." 
    LD HL,(0xbee7)                    ;0xe982:   2a e7 be  "*.."  
    LD DE,(0xbee0)                    ;0xe985:   ed 5b e0 be  ".[.."  
    LD A,E                            ;0xe989:   7b  "{" 
    CP L                              ;0xe98a:   bd  "." 
    JR nc, C_E98E                     ;0xe98b:   30 01  "0." 
    LD L,E                            ;0xe98d:   6b  "k" 
;--------------------------------------
C_E98E:                               ; XREF: 0xE98B 
    LD A,D                            ;0xe98e:   7a  "z" 
    CP H                              ;0xe98f:   bc  "." 
    JR nc, C_E993                     ;0xe990:   30 01  "0." 
;--------------------------------------
C_E992:                               ; XREF: 0xE944 
    LD H,D                            ;0xe992:   62  "b" 
;--------------------------------------
C_E993:                               ; XREF: 0xE96F 
    LD (0xbee5),HL                    ;0xe993:   22 e5 be  "".."  
;--------------------------------------
C_E996:                               ; XREF: 0xE97B 
    LD HL,(0xbee5)                    ;0xe996:   2a e5 be  "*.."  
    LD A,H                            ;0xe999:   7c  "|" 
    LD H,L                            ;0xe99a:   65  "e" 
    LD L,A                            ;0xe99b:   6f  "o" 
    INC L                             ;0xe99c:   2c  "," 
    INC H                             ;0xe99d:   24  "$" 
    JP TXT_SET_CURSOR                 ;0xe99e:   c3 75 bb  ".u." 
    LD (0xbee7),HL                    ;0xe9a1:   22 e7 be  "".."  
    RET                               ;0xe9a4:   c9  "." 
    LD A,0x13                         ;0xe9a5:   3e 13  ">."  
    JP TXT_OUTPUT                     ;0xe9a7:   c3 5a bb  ".Z." 
    CALL TXT_CLEAR_WINDOW             ;0xe9aa:   cd 6c bb  ".l." 
    CALL 0x669                        ;0xe9ad:   cd 69 06  ".i." 
    JP 0x85e                          ;0xe9b0:   c3 5e 08  ".^." 
    PUSH HL                           ;0xe9b3:   e5  "." 
    CALL TXT_GET_PAPER                ;0xe9b4:   cd 99 bb  "..." 
    CALL SCR_INK_ENCODE               ;0xe9b7:   cd 2c bc  ".,." 
    LD B,A                            ;0xe9ba:   47  "G" 
    LD A,H                            ;0xe9bb:   7c  "|" 
    LD HL,(0xbee0)                    ;0xe9bc:   2a e0 be  "*.."  
    LD D,L                            ;0xe9bf:   55  "U" 
    LD E,H                            ;0xe9c0:   5c  "\" 
    LD H,1                            ;0xe9c1:   26 01  "&."  
    NOP                               ;0xe9c3:   00  "." 
    LD L,A                            ;0xe9c4:   6f  "o" 
    INC L                             ;0xe9c5:   2c  "," 
    CP E                              ;0xe9c6:   bb  "." 
    LD A,B                            ;0xe9c7:   78  "x" 
    CALL c, SCR_FILL_BOX              ;0xe9c8:   dc 44 bc  ".D." 
    POP HL                            ;0xe9cb:   e1  "." 
    LD A,0x12                         ;0xe9cc:   3e 12  ">."  
    JR C_E9D5                         ;0xe9ce:   18 05  ".." 
    CALL 0x893                        ;0xe9d0:   cd 93 08  "..." 
    LD A,0x11                         ;0xe9d3:   3e 11  ">."  
;--------------------------------------
C_E9D5:                               ; XREF: 0xE9CE 
    JP TXT_OUTPUT                     ;0xe9d5:   c3 5a bb  ".Z." 
    LD B,1                            ;0xe9d8:   06 01  ".."  
    NOP                               ;0xe9da:   00  "." 
    JR C_E9DF                         ;0xe9db:   18 02  ".." 
    LD B,0xff                         ;0xe9dd:   06 ff  ".."  
;--------------------------------------
C_E9DF:                               ; XREF: 0xE9DB 
    LD A,(0xbee1)                     ;0xe9df:   3a e1 be  ":.."  
    CP H                              ;0xe9e2:   bc  "." 
    JR z, $-18                        ;0xe9e3:   28 ec  "(." 
    LD E,A                            ;0xe9e5:   5f  "_" 
    LD A,(0xbee0)                     ;0xe9e6:   3a e0 be  ":.."  
    LD D,A                            ;0xe9e9:   57  "W" 
    LD L,H                            ;0xe9ea:   6c  "l" 
    LD H,1                            ;0xe9eb:   26 01  "&."  
    NOP                               ;0xe9ed:   00  "." 
    CALL TXT_GET_PAPER                ;0xe9ee:   cd 99 bb  "..." 
    CALL SCR_INK_ENCODE               ;0xe9f1:   cd 2c bc  ".,." 
    JP SCR_SOFTWARE_ROLL              ;0xe9f4:   c3 50 bc  ".P." 
    LD A,L                            ;0xe9f7:   7d  "}" 
    LD L,H                            ;0xe9f8:   6c  "l" 
    LD H,A                            ;0xe9f9:   67  "g" 
    LD A,(0xbee0)                     ;0xe9fa:   3a e0 be  ":.."  
    PUSH AF                           ;0xe9fd:   f5  "." 
    PUSH HL                           ;0xe9fe:   e5  "." 
    SUB H                             ;0xe9ff:   94  "." 
    CALL nz, 0x9a7                    ;0xea00:   c4 a7 09  "..." 
    POP HL                            ;0xea03:   e1  "." 
    POP AF                            ;0xea04:   f1  "." 
    LD H,A                            ;0xea05:   67  "g" 
    INC L                             ;0xea06:   2c  "," 
    INC H                             ;0xea07:   24  "$" 
    CALL TXT_SET_CURSOR               ;0xea08:   cd 75 bb  ".u." 
    LD A,0x10                         ;0xea0b:   3e 10  ">."  
    CALL TXT_OUTPUT                   ;0xea0d:   cd 5a bb  ".Z." 
    JP 0x85e                          ;0xea10:   c3 5e 08  ".^." 
    LD A,(0xbee9)                     ;0xea13:   3a e9 be  ":.."  
    OR A                              ;0xea16:   b7  "." 
    RET z                             ;0xea17:   c8  "." 
    LD A,0xff                         ;0xea18:   3e ff  ">."  
    JR C_EA1D                         ;0xea1a:   18 01  ".." 
    XOR A                             ;0xea1c:   af  "." 
;--------------------------------------
C_EA1D:                               ; XREF: 0xEA1A 
    LD HL,0xbeea                      ;0xea1d:   21 ea be  "!.."  
    CP (HL)                           ;0xea20:   be  "." 
    RET z                             ;0xea21:   c8  "." 
    LD (HL),A                         ;0xea22:   77  "w" 
    JP TXT_INVERSE                    ;0xea23:   c3 9c bb  "..." 
    RET                               ;0xea26:   c9  "." 
    RET                               ;0xea27:   c9  "." 
    LD A,0xff                         ;0xea28:   3e ff  ">."  
    JR C_EA2D                         ;0xea2a:   18 01  ".." 
    XOR A                             ;0xea2c:   af  "." 
;--------------------------------------
C_EA2D:                               ; XREF: 0xEA2A 
    LD (0xbee9),A                     ;0xea2d:   32 e9 be  "2.."  
    RET                               ;0xea30:   c9  "." 
    LD E,1                            ;0xea31:   1e 01  ".."  
;--------------------------------------
C_EA33:                               ; XREF: 0xEA4F 
    NOP                               ;0xea33:   00  "." 
    CALL 0x1                          ;0xea34:   cd 01 00  "..." 
    ADD HL,BC                         ;0xea37:   09  "." 
    JP SCR_SET_BORDER                 ;0xea38:   c3 38 bc  ".8." 
;--------------------------------------
C_EA3B:                               ; XREF: 0xEA4C 
    LD E,1                            ;0xea3b:   1e 01  ".."  
    LD C,A                            ;0xea3d:   4f  "O" 
    LD B,A                            ;0xea3e:   47  "G" 
    CALL 0x920                        ;0xea3f:   cd 20 09  ". ." 
    PUSH BC                           ;0xea42:   c5  "." 
    LD A,E                            ;0xea43:   7b  "{" 
    CALL SCR_SET_INK                  ;0xea44:   cd 32 bc  ".2." 
    POP BC                            ;0xea47:   c1  "." 
    RET                               ;0xea48:   c9  "." 
    AND 15                            ;0xea49:   e6 0f  ".." 
    DEC A                             ;0xea4b:   3d  "=" 
    JR z, C_EA3B                      ;0xea4c:   28 ed  "(." 
    INC A                             ;0xea4e:   3c  "<" 
    JR z, C_EA33                      ;0xea4f:   28 e2  "(." 
    CALL 0x920                        ;0xea51:   cd 20 09  ". ." 
    JP SCR_SET_INK                    ;0xea54:   c3 32 bc  ".2." 
    CALL 0x920                        ;0xea57:   cd 20 09  ". ." 
    JP SCR_SET_BORDER                 ;0xea5a:   c3 38 bc  ".8." 
    PUSH AF                           ;0xea5d:   f5  "." 
    PUSH DE                           ;0xea5e:   d5  "." 
    LD A,B                            ;0xea5f:   78  "x" 
    CALL 0x92f                        ;0xea60:   cd 2f 09  "./." 
    LD B,A                            ;0xea63:   47  "G" 
    LD A,C                            ;0xea64:   79  "y" 
    CALL 0x92f                        ;0xea65:   cd 2f 09  "./." 
    LD C,A                            ;0xea68:   4f  "O" 
    POP DE                            ;0xea69:   d1  "." 
    POP AF                            ;0xea6a:   f1  "." 
    RET                               ;0xea6b:   c9  "." 
    PUSH BC                           ;0xea6c:   c5  "." 
    RLCA                              ;0xea6d:   07  "." 
    RLCA                              ;0xea6e:   07  "." 
    LD BC,1                           ;0xea6f:   01 01 00  "..."  
    INC BC                            ;0xea72:   03  "." 
    JR C_EA7A                         ;0xea73:   18 05  ".." 
;--------------------------------------
C_EA75:                               ; XREF: 0xEA85 
    LD C,A                            ;0xea75:   4f  "O" 
    ADD A,A                           ;0xea76:   87  "." 
    ADD A,C                           ;0xea77:   81  "." 
    LD C,A                            ;0xea78:   4f  "O" 
    LD A,D                            ;0xea79:   7a  "z" 
;--------------------------------------
C_EA7A:                               ; XREF: 0xEA73 
    RLCA                              ;0xea7a:   07  "." 
    RLCA                              ;0xea7b:   07  "." 
    LD D,A                            ;0xea7c:   57  "W" 
    AND 3                             ;0xea7d:   e6 03  ".." 
    CP 2                              ;0xea7f:   fe 02  ".." 
    JR c, C_EA84                      ;0xea81:   38 01  "8." 
    DEC A                             ;0xea83:   3d  "=" 
;--------------------------------------
C_EA84:                               ; XREF: 0xEA81 
    ADD A,C                           ;0xea84:   81  "." 
    DJNZ C_EA75                       ;0xea85:   10 ee  ".." 
    POP BC                            ;0xea87:   c1  "." 
    RET                               ;0xea88:   c9  "." 
    JP SCR_SET_FLASHING               ;0xea89:   c3 3e bc  ".>." 
    CALL TXT_GET_PAPER                ;0xea8c:   cd 99 bb  "..." 
    CALL SCR_INK_ENCODE               ;0xea8f:   cd 2c bc  ".,." 
    JP SCR_HARDWARE_ROLL              ;0xea92:   c3 4d bc  ".M." 
    LD B,1                            ;0xea95:   06 01  ".."  
    NOP                               ;0xea97:   00  "." 
    CALL 0x94e                        ;0xea98:   cd 4e 09  ".N." 
    JP 0x669                          ;0xea9b:   c3 69 06  ".i." 
    LD A,(0xbee1)                     ;0xea9e:   3a e1 be  ":.."  
    CP 0x18                           ;0xeaa1:   fe 18  ".." 
    LD B,0xff                         ;0xeaa3:   06 ff  ".."  
    JR z, $-24                        ;0xeaa5:   28 e6  "(." 
    CALL TXT_GET_PAPER                ;0xeaa7:   cd 99 bb  "..." 
    CALL SCR_INK_ENCODE               ;0xeaaa:   cd 2c bc  ".,." 
    LD C,A                            ;0xeaad:   4f  "O" 
    LD HL,0x118                       ;0xeaae:   21 18 01  "!.."  
    NOP                               ;0xeab1:   00  "." 
    PUSH HL                           ;0xeab2:   e5  "." 
    CALL SCR_CHAR_POSITION            ;0xeab3:   cd 1a bc  "..." 
    EX (SP),HL                        ;0xeab6:   e3  "." 
    INC L                             ;0xeab7:   2c  "," 
    CALL SCR_CHAR_POSITION            ;0xeab8:   cd 1a bc  "..." 
    PUSH HL                           ;0xeabb:   e5  "." 
    LD HL,0x101                       ;0xeabc:   21 01 01  "!.."  
    NOP                               ;0xeabf:   00  "." 
    CALL SCR_CHAR_POSITION            ;0xeac0:   cd 1a bc  "..." 
    CALL MC_WAIT_FLYBACK              ;0xeac3:   cd 19 bd  "..." 
    CALL SCR_SET_OFFSET               ;0xeac6:   cd 05 bc  "..." 
    POP DE                            ;0xeac9:   d1  "." 
    POP HL                            ;0xeaca:   e1  "." 
    LD B,8                            ;0xeacb:   06 08  ".."  
;--------------------------------------
C_EACD:                               ; XREF: 0xEAE5 
    PUSH BC                           ;0xeacd:   c5  "." 
    PUSH DE                           ;0xeace:   d5  "." 
    PUSH HL                           ;0xeacf:   e5  "." 
    LD B,0x50                         ;0xead0:   06 50  ".P"  
;--------------------------------------
C_EAD2:                               ; XREF: 0xEADD 
    LD A,(HL)                         ;0xead2:   7e  "~" 
    LD (DE),A                         ;0xead3:   12  "." 
    LD (HL),C                         ;0xead4:   71  "q" 
    INC E                             ;0xead5:   1c  "." 
    CALL z, 0x9fb                     ;0xead6:   cc fb 09  "..." 
    INC L                             ;0xead9:   2c  "," 
    CALL z, 0xa03                     ;0xeada:   cc 03 0a  "..." 
    DJNZ C_EAD2                       ;0xeadd:   10 f3  ".." 
    POP HL                            ;0xeadf:   e1  "." 
    POP DE                            ;0xeae0:   d1  "." 
    CALL 0xa0b                        ;0xeae1:   cd 0b 0a  "..." 
    POP BC                            ;0xeae4:   c1  "." 
    DJNZ C_EACD                       ;0xeae5:   10 e6  ".." 
    RET                               ;0xeae7:   c9  "." 
    LD C,A                            ;0xeae8:   4f  "O" 
    CALL 0xa14                        ;0xeae9:   cd 14 0a  "..." 
    XOR A                             ;0xeaec:   af  "." 
    LD D,A                            ;0xeaed:   57  "W" 
    LD E,B                            ;0xeaee:   58  "X" 
;--------------------------------------
C_EAEF:                               ; XREF: 0xEAF0 
    ADD A,C                           ;0xeaef:   81  "." 
    DJNZ C_EAEF                       ;0xeaf0:   10 fd  ".." 
    LD C,A                            ;0xeaf2:   4f  "O" 
    CALL MC_WAIT_FLYBACK              ;0xeaf3:   cd 19 bd  "..." 
    CALL SCR_CHAR_POSITION            ;0xeaf6:   cd 1a bc  "..." 
    EX DE,HL                          ;0xeaf9:   eb  "." 
    LD A,D                            ;0xeafa:   7a  "z" 
    ADD HL,DE                         ;0xeafb:   19  "." 
    XOR H                             ;0xeafc:   ac  "." 
    AND 0xf8                          ;0xeafd:   e6 f8  ".." 
    XOR H                             ;0xeaff:   ac  "." 
    LD H,A                            ;0xeb00:   67  "g" 
    LD B,8                            ;0xeb01:   06 08  ".."  
;--------------------------------------
C_EB03:                               ; XREF: 0xEB11 
    PUSH BC                           ;0xeb03:   c5  "." 
    PUSH DE                           ;0xeb04:   d5  "." 
    PUSH HL                           ;0xeb05:   e5  "." 
    CALL 0x9d3                        ;0xeb06:   cd d3 09  "..." 
    XOR A                             ;0xeb09:   af  "." 
    LD (DE),A                         ;0xeb0a:   12  "." 
    POP HL                            ;0xeb0b:   e1  "." 
    POP DE                            ;0xeb0c:   d1  "." 
    CALL 0xa0b                        ;0xeb0d:   cd 0b 0a  "..." 
    POP BC                            ;0xeb10:   c1  "." 
    DJNZ C_EB03                       ;0xeb11:   10 f0  ".." 
    RET                               ;0xeb13:   c9  "." 
    LD B,1                            ;0xeb14:   06 01  ".."  
    NOP                               ;0xeb16:   00  "." 
;--------------------------------------
C_EB17:                               ; XREF: 0xEB37 
    LD A,L                            ;0xeb17:   7d  "}" 
    CP E                              ;0xeb18:   bb  "." 
    JR nc, C_EB1C                     ;0xeb19:   30 01  "0." 
    LD A,E                            ;0xeb1b:   7b  "{" 
;--------------------------------------
C_EB1C:                               ; XREF: 0xEB19 
    CPL                               ;0xeb1c:   2f  "/" 
    OR A                              ;0xeb1d:   b7  "." 
    JR z, C_EB2C                      ;0xeb1e:   28 0c  "(." 
    CP C                              ;0xeb20:   b9  "." 
    JR nc, C_EB3A                     ;0xeb21:   30 17  "0." 
    PUSH BC                           ;0xeb23:   c5  "." 
    LD C,A                            ;0xeb24:   4f  "O" 
    LDIR                              ;0xeb25:   ed b0  ".." 
    POP BC                            ;0xeb27:   c1  "." 
    CPL                               ;0xeb28:   2f  "/" 
    INC A                             ;0xeb29:   3c  "<" 
    ADD A,C                           ;0xeb2a:   81  "." 
    LD C,A                            ;0xeb2b:   4f  "O" 
;--------------------------------------
C_EB2C:                               ; XREF: 0xEB1E 
    LD A,(HL)                         ;0xeb2c:   7e  "~" 
    LD (DE),A                         ;0xeb2d:   12  "." 
    INC E                             ;0xeb2e:   1c  "." 
    CALL z, 0x9fb                     ;0xeb2f:   cc fb 09  "..." 
    INC L                             ;0xeb32:   2c  "," 
    CALL z, 0xa03                     ;0xeb33:   cc 03 0a  "..." 
    DEC C                             ;0xeb36:   0d  "." 
    JR nz, C_EB17                     ;0xeb37:   20 de  " ." 
    RET                               ;0xeb39:   c9  "." 
;--------------------------------------
C_EB3A:                               ; XREF: 0xEB21 
    LDIR                              ;0xeb3a:   ed b0  ".." 
    RET                               ;0xeb3c:   c9  "." 
    LD A,D                            ;0xeb3d:   7a  "z" 
    INC A                             ;0xeb3e:   3c  "<" 
    XOR D                             ;0xeb3f:   aa  "." 
    AND 7                             ;0xeb40:   e6 07  ".." 
    XOR D                             ;0xeb42:   aa  "." 
    LD D,A                            ;0xeb43:   57  "W" 
    RET                               ;0xeb44:   c9  "." 
    LD A,H                            ;0xeb45:   7c  "|" 
    INC A                             ;0xeb46:   3c  "<" 
    XOR H                             ;0xeb47:   ac  "." 
    AND 7                             ;0xeb48:   e6 07  ".." 
    XOR H                             ;0xeb4a:   ac  "." 
    LD H,A                            ;0xeb4b:   67  "g" 
    RET                               ;0xeb4c:   c9  "." 
    LD A,D                            ;0xeb4d:   7a  "z" 
    ADD A,8                           ;0xeb4e:   c6 08  ".." 
    LD D,A                            ;0xeb50:   57  "W" 
    LD A,H                            ;0xeb51:   7c  "|" 
    ADD A,8                           ;0xeb52:   c6 08  ".." 
    LD H,A                            ;0xeb54:   67  "g" 
    RET                               ;0xeb55:   c9  "." 
    CALL SCR_GET_MODE                 ;0xeb56:   cd 11 bc  "..." 
    LD B,4                            ;0xeb59:   06 04  ".."  
    RET c                             ;0xeb5b:   d8  "." 
    LD B,2                            ;0xeb5c:   06 02  ".."  
    RET z                             ;0xeb5e:   c8  "." 
    LD B,1                            ;0xeb5f:   06 01  ".."  
    RET                               ;0xeb61:   c9  "." 
    PUSH AF                           ;0xeb62:   f5  "." 
    LD A,(0xbeeb)                     ;0xeb63:   3a eb be  ":.."  
    CALL 0xa2b                        ;0xeb66:   cd 2b 0a  ".+." 
    POP AF                            ;0xeb69:   f1  "." 
    LD (0xbeeb),A                     ;0xeb6a:   32 eb be  "2.."  
    LD L,A                            ;0xeb6d:   6f  "o" 
    ADD A,A                           ;0xeb6e:   87  "." 
    ADD A,A                           ;0xeb6f:   87  "." 
    ADD A,L                           ;0xeb70:   85  "." 
    ADD A,A                           ;0xeb71:   87  "." 
    ADD A,L                           ;0xeb72:   85  "." 
    LD L,A                            ;0xeb73:   6f  "o" 
    LD H,1                            ;0xeb74:   26 01  "&."  
    NOP                               ;0xeb76:   00  "." 
    LD DE,0xa62                       ;0xeb77:   11 62 0a  ".b."  
    ADD HL,DE                         ;0xeb7a:   19  "." 
    LD B,11                           ;0xeb7b:   06 0b  ".."  
;--------------------------------------
C_EB7D:                               ; XREF: 0xEB97 
    PUSH BC                           ;0xeb7d:   c5  "." 
    PUSH DE                           ;0xeb7e:   d5  "." 
    PUSH HL                           ;0xeb7f:   e5  "." 
    CALL 0xa57                        ;0xeb80:   cd 57 0a  ".W." 
    EX DE,HL                          ;0xeb83:   eb  "." 
    CALL 0xa57                        ;0xeb84:   cd 57 0a  ".W." 
    LD B,8                            ;0xeb87:   06 08  ".."  
;--------------------------------------
C_EB89:                               ; XREF: 0xEB90 
    LD C,(HL)                         ;0xeb89:   4e  "N" 
    LD A,(DE)                         ;0xeb8a:   1a  "." 
    LD (HL),A                         ;0xeb8b:   77  "w" 
    LD A,C                            ;0xeb8c:   79  "y" 
    LD (DE),A                         ;0xeb8d:   12  "." 
    INC DE                            ;0xeb8e:   13  "." 
    INC HL                            ;0xeb8f:   23  "#" 
    DJNZ C_EB89                       ;0xeb90:   10 f7  ".." 
    POP HL                            ;0xeb92:   e1  "." 
    POP DE                            ;0xeb93:   d1  "." 
    POP BC                            ;0xeb94:   c1  "." 
    INC DE                            ;0xeb95:   13  "." 
    INC HL                            ;0xeb96:   23  "#" 
    DJNZ C_EB7D                       ;0xeb97:   10 e4  ".." 
    RET                               ;0xeb99:   c9  "." 
    LD L,(HL)                         ;0xeb9a:   6e  "n" 
    LD H,1                            ;0xeb9b:   26 01  "&."  
    NOP                               ;0xeb9d:   00  "." 
    ADD HL,HL                         ;0xeb9e:   29  ")" 
    ADD HL,HL                         ;0xeb9f:   29  ")" 
    ADD HL,HL                         ;0xeba0:   29  ")" 
    LD BC,1                           ;0xeba1:   01 01 00  "..."  
    ADD A,B                           ;0xeba4:   80  "." 
    ADD HL,BC                         ;0xeba5:   09  "." 
    RET                               ;0xeba6:   c9  "." 
    INC HL                            ;0xeba7:   23  "#" 
    LD B,B                            ;0xeba8:   40  "@" 
    LD E,E                            ;0xeba9:   5b  "[" 
    LD E,H                            ;0xebaa:   5c  "\" 
    LD E,L                            ;0xebab:   5d  "]" 
    LD E,(HL)                         ;0xebac:   5e  "^" 
    LD H,B                            ;0xebad:   60  "`" 
    LD A,E                            ;0xebae:   7b  "{" 
    LD A,H                            ;0xebaf:   7c  "|" 
    LD A,L                            ;0xebb0:   7d  "}" 
    LD A,(HL)                         ;0xebb1:   7e  "~" 
    INC HL                            ;0xebb2:   23  "#" 
    JP pe, C_F5A2                     ;0xebb3:   ea a2 f5  "..." 
    AND (HL)                          ;0xebb6:   a6  "." 
    LD E,(HL)                         ;0xebb7:   5e  "^" 
    LD H,B                            ;0xebb8:   60  "`" 
    POP HL                            ;0xebb9:   e1  "." 
    XOR 0xeb                          ;0xebba:   ee eb  ".." 
    OR D                              ;0xebbc:   b2  "." 
    INC HL                            ;0xebbd:   23  "#" 
    AND (HL)                          ;0xebbe:   a6  "." 
    RET nc                            ;0xebbf:   d0  "." 
    OUT (0x00d4),A                    ;0xebc0:   d3 d4  ".." 
    LD E,(HL)                         ;0xebc2:   5e  "^" 
    LD H,B                            ;0xebc3:   60  "`" 
    RET p                             ;0xebc4:   f0  "." 
    DI                                ;0xebc5:   f3  "." 
    CALL p, 0xa3ba                    ;0xebc6:   f4 ba a3  "..." 
    LD B,B                            ;0xebc9:   40  "@" 
    LD E,E                            ;0xebca:   5b  "[" 
    LD E,H                            ;0xebcb:   5c  "\" 
    LD E,L                            ;0xebcc:   5d  "]" 
    LD E,(HL)                         ;0xebcd:   5e  "^" 
    LD H,B                            ;0xebce:   60  "`" 
    LD A,E                            ;0xebcf:   7b  "{" 
    LD A,H                            ;0xebd0:   7c  "|" 
    LD A,L                            ;0xebd1:   7d  "}" 
    LD A,(HL)                         ;0xebd2:   7e  "~" 
    INC HL                            ;0xebd3:   23  "#" 
    LD B,B                            ;0xebd4:   40  "@" 
    SUB 0xd8                          ;0xebd5:   d6 d8  ".." 
    RST 0x10                          ;0xebd7:   d7  "." 
    LD E,(HL)                         ;0xebd8:   5e  "^" 
    LD H,B                            ;0xebd9:   60  "`" 
    OR 0xf8                           ;0xebda:   f6 f8  ".." 
    RST 0x30                          ;0xebdc:   f7  "." 
    LD A,(HL)                         ;0xebdd:   7e  "~" 
    INC HL                            ;0xebde:   23  "#" 
    POP BC                            ;0xebdf:   c1  "." 
    RET nc                            ;0xebe0:   d0  "." 
    OUT (0x00d7),A                    ;0xebe1:   d3 d7  ".." 
    CALL nc, C_F0E1                   ;0xebe3:   d4 e1 f0  "..." 
    DI                                ;0xebe6:   f3  "." 
    RST 0x30                          ;0xebe7:   f7  "." 
    CALL p, 0x4023                    ;0xebe8:   f4 23 40  ".#@" 
    AND D                             ;0xebeb:   a2  "." 
    LD E,H                            ;0xebec:   5c  "\" 
    POP HL                            ;0xebed:   e1  "." 
    LD E,(HL)                         ;0xebee:   5e  "^" 
    XOR 0xea                          ;0xebef:   ee ea  ".." 
                                      ;0xebf1:   ed eb  ".." 
    CALL pe, 0x40ad                   ;0xebf3:   ec ad 40  "..@" 
    XOR A                             ;0xebf6:   af  "." 
    EXX                               ;0xebf7:   d9  "." 
    XOR (HL)                          ;0xebf8:   ae  "." 
    LD E,(HL)                         ;0xebf9:   5e  "^" 
    LD H,B                            ;0xebfa:   60  "`" 
    OR D                              ;0xebfb:   b2  "." 
    LD SP,HL                          ;0xebfc:   f9  "." 
    LD A,L                            ;0xebfd:   7d  "}" 
    LD A,(HL)                         ;0xebfe:   7e  "~" 
    RST 0x38                          ;0xebff:   ff  "." 
    RST 0x38                          ;0xec00:   ff  "." 
    RST 0x38                          ;0xec01:   ff  "." 
    RST 0x38                          ;0xec02:   ff  "." 
    RST 0x38                          ;0xec03:   ff  "." 
    RST 0x38                          ;0xec04:   ff  "." 
    RST 0x38                          ;0xec05:   ff  "." 
    RST 0x38                          ;0xec06:   ff  "." 
    RST 0x38                          ;0xec07:   ff  "." 
    RST 0x38                          ;0xec08:   ff  "." 
    RST 0x38                          ;0xec09:   ff  "." 
    RST 0x38                          ;0xec0a:   ff  "." 
    RST 0x38                          ;0xec0b:   ff  "." 
    RST 0x38                          ;0xec0c:   ff  "." 
    RST 0x38                          ;0xec0d:   ff  "." 
    RST 0x38                          ;0xec0e:   ff  "." 
    RST 0x38                          ;0xec0f:   ff  "." 
    RST 0x38                          ;0xec10:   ff  "." 
    RST 0x38                          ;0xec11:   ff  "." 
    RST 0x38                          ;0xec12:   ff  "." 
    RST 0x38                          ;0xec13:   ff  "." 
    RST 0x38                          ;0xec14:   ff  "." 
    LD A,(BC)                         ;0xec15:   0a  "." 
    LD (0x1eaf),A                     ;0xec16:   32 af 1e  "2.."  
    INC C                             ;0xec19:   0c  "." 
    RRCA                              ;0xec1a:   0f  "." 
    INC BC                            ;0xec1b:   03  "." 
    LD HL,0xb0d0                      ;0xec1c:   21 d0 b0  "!.."  
    LD B,0x30                         ;0xec1f:   06 30  ".0"  
    LD (HL),1                         ;0xec21:   36 01  "6."  
    NOP                               ;0xec23:   00  "." 
    INC HL                            ;0xec24:   23  "#" 
    DJNZ $-3                          ;0xec25:   10 fb  ".." 
    CALL 0xeb5                        ;0xec27:   cd b5 0e  "..." 
    LD HL,0xad0                       ;0xec2a:   21 d0 0a  "!.."  
    LD DE,0xb0ed                      ;0xec2d:   11 ed b0  "..."  
    LD BC,0x105                       ;0xec30:   01 05 01  "..."  
    NOP                               ;0xec33:   00  "." 
    LDIR                              ;0xec34:   ed b0  ".." 
    LD A,(0xb0f1)                     ;0xec36:   3a f1 b0  ":.."  
    DEC A                             ;0xec39:   3d  "=" 
    RLCA                              ;0xec3a:   07  "." 
    RLCA                              ;0xec3b:   07  "." 
    RLCA                              ;0xec3c:   07  "." 
    CPL                               ;0xec3d:   2f  "/" 
    AND 0xf0                          ;0xec3e:   e6 f0  ".." 
    OR (HL)                           ;0xec40:   b6  "." 
    INC HL                            ;0xec41:   23  "#" 
    LD H,(HL)                         ;0xec42:   66  "f" 
    LD L,A                            ;0xec43:   6f  "o" 
    LD A,3                            ;0xec44:   3e 03  ">."  
    CALL 0xe56                        ;0xec46:   cd 56 0e  ".V." 
    LD A,L                            ;0xec49:   7d  "}" 
    CALL 0xe56                        ;0xec4a:   cd 56 0e  ".V." 
    LD A,H                            ;0xec4d:   7c  "|" 
    JP 0xe56                          ;0xec4e:   c3 56 0e  ".V." 
    LD A,(IX+0x19)                    ;0xec51:   dd 7e 19  ".~." 
    AND 0x40                          ;0xec54:   e6 40  ".@" 
    OR 13                             ;0xec56:   f6 0d  ".." 
    CALL 0xb6f                        ;0xec58:   cd 6f 0b  ".o." 
    LD L,(IX+15)                      ;0xec5b:   dd 6e 0f  ".n." 
    LD H,(IX+0x13)                    ;0xec5e:   dd 66 13  ".f." 
    LD (0xb0e6),HL                    ;0xec61:   22 e6 b0  "".."  
    LD H,E                            ;0xec64:   63  "c" 
    LD L,(IX+0x18)                    ;0xec65:   dd 6e 18  ".n." 
    LD (0xb0e8),HL                    ;0xec68:   22 e8 b0  "".."  
    LD A,6                            ;0xec6b:   3e 06  ">."  
    LD (0xb0e3),A                     ;0xec6d:   32 e3 b0  "2.."  
    RET                               ;0xec70:   c9  "." 
    LD A,(IX+0x19)                    ;0xec71:   dd 7e 19  ".~." 
    OR 6                              ;0xec74:   f6 06  ".." 
    JR C_EC7F                         ;0xec76:   18 07  ".." 
    LD A,(IX+0x19)                    ;0xec78:   dd 7e 19  ".~." 
    AND 0xc0                          ;0xec7b:   e6 c0  ".." 
    OR 5                              ;0xec7d:   f6 05  ".." 
;--------------------------------------
C_EC7F:                               ; XREF: 0xEC76 
    CALL 0xb49                        ;0xec7f:   cd 49 0b  ".I." 
    LD (HL),0xff                      ;0xec82:   36 ff  "6."  
    RET                               ;0xec84:   c9  "." 
    LD A,(IX+0x19)                    ;0xec85:   dd 7e 19  ".~." 
    OR 0x11                           ;0xec88:   f6 11  ".." 
    CALL 0xb49                        ;0xec8a:   cd 49 0b  ".I." 
    LD (HL),1                         ;0xec8d:   36 01  "6."  
    RET                               ;0xec8f:   c9  "." 
    CALL 0xb6f                        ;0xec90:   cd 6f 0b  ".o." 
    LD A,E                            ;0xec93:   7b  "{" 
    ADD A,(IX+0x14)                   ;0xec94:   dd 86 14  "..." 
    LD E,A                            ;0xec97:   5f  "_" 
    LD (0xb0e8),A                     ;0xec98:   32 e8 b0  "2.."  
    LD L,(IX+15)                      ;0xec9b:   dd 6e 0f  ".n." 
    LD H,A                            ;0xec9e:   67  "g" 
    LD (0xb0e9),HL                    ;0xec9f:   22 e9 b0  "".."  
    LD A,(IX+0x17)                    ;0xeca2:   dd 7e 17  ".~." 
    LD (0xb0eb),A                     ;0xeca5:   32 eb b0  "2.."  
    LD H,B                            ;0xeca8:   60  "`" 
    LD L,D                            ;0xeca9:   6a  "j" 
    LD (0xb0e6),HL                    ;0xecaa:   22 e6 b0  "".."  
    LD A,9                            ;0xecad:   3e 09  ">."  
    LD (0xb0e3),A                     ;0xecaf:   32 e3 b0  "2.."  
    LD HL,0xb0ec                      ;0xecb2:   21 ec b0  "!.."  
    RET                               ;0xecb5:   c9  "." 
    LD (0xb0df),HL                    ;0xecb6:   22 df b0  "".."  
    LD L,A                            ;0xecb9:   6f  "o" 
    LD A,B                            ;0xecba:   78  "x" 
    LD (0xb0de),A                     ;0xecbb:   32 de b0  "2.."  
    CALL 0xb7f                        ;0xecbe:   cd 7f 0b  "..." 
    LD H,C                            ;0xecc1:   61  "a" 
    LD (0xb0e4),HL                    ;0xecc2:   22 e4 b0  "".."  
    RET                               ;0xecc5:   c9  "." 
    LD A,(IX+0x11)                    ;0xecc6:   dd 7e 11  ".~." 
    LD B,1                            ;0xecc9:   06 01  ".."  
    NOP                               ;0xeccb:   00  "." 
    OR A                              ;0xeccc:   b7  "." 
    RET z                             ;0xeccd:   c8  "." 
    DEC A                             ;0xecce:   3d  "=" 
    JR nz, C_ECD9                     ;0xeccf:   20 08  " ." 
    LD A,D                            ;0xecd1:   7a  "z" 
    RRA                               ;0xecd2:   1f  "." 
    LD D,A                            ;0xecd3:   57  "W" 
    LD A,B                            ;0xecd4:   78  "x" 
    RLA                               ;0xecd5:   17  "." 
    LD B,A                            ;0xecd6:   47  "G" 
    JR C_ECE5                         ;0xecd7:   18 0c  ".." 
;--------------------------------------
C_ECD9:                               ; XREF: 0xECCF 
    LD A,D                            ;0xecd9:   7a  "z" 
    SUB (IX+0x12)                     ;0xecda:   dd 96 12  "..." 
    JR c, C_ECE5                      ;0xecdd:   38 06  "8." 
    SUB (IX+0x12)                     ;0xecdf:   dd 96 12  "..." 
    CPL                               ;0xece2:   2f  "/" 
    LD D,A                            ;0xece3:   57  "W" 
    INC B                             ;0xece4:   04  "." 
;--------------------------------------
C_ECE5:                               ; XREF: 0xECD7 
    LD A,B                            ;0xece5:   78  "x" 
    ADD A,A                           ;0xece6:   87  "." 
    ADD A,A                           ;0xece7:   87  "." 
    OR C                              ;0xece8:   b1  "." 
    LD C,A                            ;0xece9:   4f  "O" 
    RET                               ;0xecea:   c9  "." 
    CALL 0xb2a                        ;0xeceb:   cd 2a 0b  ".*." 
    LD HL,0xbab                       ;0xecee:   21 ab 0b  "!.."  
    JR C_ED33                         ;0xecf1:   18 40  ".@" 
    LD HL,0xb0de                      ;0xecf3:   21 de b0  "!.."  
    JP 0xe09                          ;0xecf6:   c3 09 0e  "..." 
    CALL 0xb31                        ;0xecf9:   cd 31 0b  ".1." 
    JR C_ED0F                         ;0xecfc:   18 11  ".." 
    CALL 0xb3e                        ;0xecfe:   cd 3e 0b  ".>." 
    DEFB 0xcd                         ;0xed01:   ('M') + 0x80
    DEFB 0xc7                         ;0xed02:   ('G') + 0x80
    DEFB 0xb                          ;0xed03:   0xb
    DEFB 0xd0                         ;0xed04:   ('P') + 0x80
    DEFB 0x3a                         ;0xed05:   ":"
    DEFB 0xe3                         ;0xed06:   ('c') + 0x80
    DEFB 0xff                         ;0xed07:   0xff
    DEFB 0xfe                         ;0xed08:   ('~') + 0x80
    DEFB 0x8                          ;0xed09:   0x8
    DEFB 0x37                         ;0xed0a:   "7"
    DEFB 0xc9                         ;0xed0b:   ('I') + 0x80
    DEFB 0xcd                         ;0xed0c:   ('M') + 0x80
    DEFB 0xa                          ;0xed0d:   0xa
    DEFB 0xb                          ;0xed0e:   0xb
;--------------------------------------
C_ED0F:                               ; XREF: 0xECFC 
    LD HL,0xbcc                       ;0xed0f:   21 cc 0b  "!.."  
    JR C_ED33                         ;0xed12:   18 1f  ".." 
    LD HL,0xb0de                      ;0xed14:   21 de b0  "!.."  
    JP 0xe12                          ;0xed17:   c3 12 0e  "..." 
    CALL 0xbdd                        ;0xed1a:   cd dd 0b  "..." 
    LD HL,D_FFE0                      ;0xed1d:   21 e0 ff  "!.."  
    RET nc                            ;0xed20:   d0  "." 
    LD A,(D_FFE6)                     ;0xed21:   3a e6 ff  ":.."  
    RET                               ;0xed24:   c9  "." 
    CALL 0xb7f                        ;0xed25:   cd 7f 0b  "..." 
    LD HL,0xbe5                       ;0xed28:   21 e5 0b  "!.."  
    JR C_ED33                         ;0xed2b:   18 06  ".." 
    LD A,(IX+0x19)                    ;0xed2d:   dd 7e 19  ".~." 
    JP 0xe43                          ;0xed30:   c3 43 0e  ".C." 
;--------------------------------------
C_ED33:                               ; XREF: 0xECF1 
    CALL 0xe6d                        ;0xed33:   cd 6d 0e  ".m." 
    PUSH IY                           ;0xed36:   fd e5  ".." 
    CALL 0xbfb                        ;0xed38:   cd fb 0b  "..." 
    CALL 0xc83                        ;0xed3b:   cd 83 0c  "..." 
    POP IY                            ;0xed3e:   fd e1  ".." 
    JP 0xe8f                          ;0xed40:   c3 8f 0e  "..." 
    PUSH BC                           ;0xed43:   c5  "." 
    LD A,C                            ;0xed44:   79  "y" 
    AND 3                             ;0xed45:   e6 03  ".." 
    ADD A,A                           ;0xed47:   87  "." 
    LD C,A                            ;0xed48:   4f  "O" 
    LD B,1                            ;0xed49:   06 01  ".."  
    NOP                               ;0xed4b:   00  "." 
    LD IY,0xb0f2                      ;0xed4c:   fd 21 f2 b0  ".!.."  
    ADD IY,BC                         ;0xed50:   fd 09  ".." 
    POP BC                            ;0xed52:   c1  "." 
    RET                               ;0xed53:   c9  "." 
    INC H                             ;0xed54:   24  "$" 
    LD BC,0x300                       ;0xed55:   01 00 03  "..."  
    RLCA                              ;0xed58:   07  "." 
    LD BC,0xaa00                      ;0xed59:   01 00 aa  "..."  
    LD BC,0x3f00                      ;0xed5c:   01 00 3f  "..?"  
    LD BC,ROM_TYPE                    ;0xed5f:   01 00 c0  "..."  
    LD BC,0x1000                      ;0xed62:   01 00 10  "..."  
    LD BC,0x200                       ;0xed65:   01 00 02  "..."  
    LD BC,0x200                       ;0xed68:   01 00 02  "..."  
    INC BC                            ;0xed6b:   03  "." 
    LD BC,0x2800                      ;0xed6c:   01 00 28  "..("  
    ADD HL,BC                         ;0xed6f:   09  "." 
    LD B,C                            ;0xed70:   41  "A" 
    LD BC,0x200                       ;0xed71:   01 00 02  "..."  
    LD HL,(0x6052)                    ;0xed74:   2a 52 60  "*R`"  
    INC H                             ;0xed77:   24  "$" 
    LD BC,0x300                       ;0xed78:   01 00 03  "..."  
    RLCA                              ;0xed7b:   07  "." 
    LD BC,0xb300                      ;0xed7c:   01 00 b3  "..."  
    LD BC,0x3f00                      ;0xed7f:   01 00 3f  "..?"  
    LD BC,ROM_TYPE                    ;0xed82:   01 00 c0  "..."  
    LD BC,0x1000                      ;0xed85:   01 00 10  "..."  
    INC BC                            ;0xed88:   03  "." 
    NOP                               ;0xed89:   00  "." 
    LD (BC),A                         ;0xed8a:   02  "." 
    INC BC                            ;0xed8b:   03  "." 
    LD BC,0x2800                      ;0xed8c:   01 00 28  "..("  
    ADD HL,BC                         ;0xed8f:   09  "." 
    POP BC                            ;0xed90:   c1  "." 
    LD BC,0x200                       ;0xed91:   01 00 02  "..."  
    LD HL,(0x6052)                    ;0xed94:   2a 52 60  "*R`"  
    LD A,1                            ;0xed97:   3e 01  ">."  
    CALL 0xc5a                        ;0xed99:   cd 5a 0c  ".Z." 
    LD D,1                            ;0xed9c:   16 01  ".."  
    NOP                               ;0xed9e:   00  "." 
    PUSH BC                           ;0xed9f:   c5  "." 
    CALL 0xbd2                        ;0xeda0:   cd d2 0b  "..." 
    POP BC                            ;0xeda3:   c1  "." 
    RET nc                            ;0xeda4:   d0  "." 
    AND 0xc0                          ;0xeda5:   e6 c0  ".." 
    LD E,1                            ;0xeda7:   1e 01  ".."  
    CP 0x40                           ;0xeda9:   fe 40  ".@" 
    JR z, C_EDB2                      ;0xedab:   28 05  "(." 
    INC E                             ;0xedad:   1c  "." 
    CP 0xc0                           ;0xedae:   fe c0  ".." 
    JR nz, $+40                       ;0xedb0:   20 26  " &" 
;--------------------------------------
C_EDB2:                               ; XREF: 0xEDAB 
    LD A,E                            ;0xedb2:   7b  "{" 
    LD HL,0xc0b                       ;0xedb3:   21 0b 0c  "!.."  
    LD DE,0x12c                       ;0xedb6:   11 2c 01  ".,."  
    NOP                               ;0xedb9:   00  "." 
    CP 1                              ;0xedba:   fe 01  ".." 
    JR z, $+12                        ;0xedbc:   28 0a  "(." 
    LD HL,0xc25                       ;0xedbe:   21 25 0c  "!%."  
    LD DE,0x12e                       ;0xedc1:   11 2e 01  "..."  
    NOP                               ;0xedc4:   00  "." 
    CP 2                              ;0xedc5:   fe 02  ".." 
    JR nz, $+19                       ;0xedc7:   20 11  " ." 
    PUSH DE                           ;0xedc9:   d5  "." 
    PUSH BC                           ;0xedca:   c5  "." 
    PUSH IX                           ;0xedcb:   dd e5  ".." 
    POP DE                            ;0xedcd:   d1  "." 
    LD BC,0x11a                       ;0xedce:   01 1a 01  "..."  
    NOP                               ;0xedd1:   00  "." 
    LDIR                              ;0xedd2:   ed b0  ".." 
    POP BC                            ;0xedd4:   c1  "." 
    POP DE                            ;0xedd5:   d1  "." 
    LD HL,1                           ;0xedd6:   21 01 00  "!.."  
    LD BC,0xc937                      ;0xedd9:   01 37 c9  ".7."  
    LD A,6                            ;0xeddc:   3e 06  ">."  
    OR A                              ;0xedde:   b7  "." 
    RET                               ;0xeddf:   c9  "." 
    LD B,15                           ;0xede0:   06 0f  ".."  
;--------------------------------------
C_EDE2:                               ; XREF: 0xEE09 
    PUSH BC                           ;0xede2:   c5  "." 
    CALL 0xcb0                        ;0xede3:   cd b0 0c  "..." 
    POP BC                            ;0xede6:   c1  "." 
    RET z                             ;0xede7:   c8  "." 
    CP 4                              ;0xede8:   fe 04  ".." 
    JR nz, C_EE09                     ;0xedea:   20 1d  " ." 
    PUSH HL                           ;0xedec:   e5  "." 
    PUSH DE                           ;0xeded:   d5  "." 
    PUSH BC                           ;0xedee:   c5  "." 
    LD A,(IX+0x19)                    ;0xedef:   dd 7e 19  ".~." 
    CALL 0xe43                        ;0xedf2:   cd 43 0e  ".C." 
    CALL 0xd7f                        ;0xedf5:   cd 7f 0d  "..." 
    POP BC                            ;0xedf8:   c1  "." 
    POP DE                            ;0xedf9:   d1  "." 
    POP HL                            ;0xedfa:   e1  "." 
    JR nz, C_EE09                     ;0xedfb:   20 0c  " ." 
    RET nc                            ;0xedfd:   d0  "." 
    LD A,(D_FFE6)                     ;0xedfe:   3a e6 ff  ":.."  
    XOR (IX+0x14)                     ;0xee01:   dd ae 14  "..." 
    AND 0xc0                          ;0xee04:   e6 c0  ".." 
    LD A,8                            ;0xee06:   3e 08  ">."  
    RET nz                            ;0xee08:   c0  "." 
;--------------------------------------
C_EE09:                               ; XREF: 0xEDEA 
    DJNZ C_EDE2                       ;0xee09:   10 d7  ".." 
    OR A                              ;0xee0b:   b7  "." 
    RET                               ;0xee0c:   c9  "." 
    LD A,B                            ;0xee0d:   78  "x" 
    AND 7                             ;0xee0e:   e6 07  ".." 
    JR z, C_EE1C                      ;0xee10:   28 0a  "(." 
    CP 4                              ;0xee12:   fe 04  ".." 
    JR nz, C_EE26                     ;0xee14:   20 10  " ." 
    LD (IY+2),0                       ;0xee16:   fd 36 02 00  ".6.."  
    JR C_EE26                         ;0xee1a:   18 0a  ".." 
;--------------------------------------
C_EE1C:                               ; XREF: 0xEE10 
    PUSH DE                           ;0xee1c:   d5  "." 
    LD D,(IX+0x12)                    ;0xee1d:   dd 56 12  ".V." 
    DEC D                             ;0xee20:   15  "." 
    CALL 0xcdd                        ;0xee21:   cd dd 0c  "..." 
    POP DE                            ;0xee24:   d1  "." 
    RET nc                            ;0xee25:   d0  "." 
;--------------------------------------
C_EE26:                               ; XREF: 0xEE14 
    CALL 0xcdd                        ;0xee26:   cd dd 0c  "..." 
    RET nc                            ;0xee29:   d0  "." 
    PUSH HL                           ;0xee2a:   e5  "." 
    PUSH DE                           ;0xee2b:   d5  "." 
    PUSH BC                           ;0xee2c:   c5  "." 
    CALL 0x11e                        ;0xee2d:   cd 1e 01  "..." 
    NOP                               ;0xee30:   00  "." 
    POP BC                            ;0xee31:   c1  "." 
    POP DE                            ;0xee32:   d1  "." 
    CALL 0xd7f                        ;0xee33:   cd 7f 0d  "..." 
    POP HL                            ;0xee36:   e1  "." 
    RET                               ;0xee37:   c9  "." 
    CALL 0xbfb                        ;0xee38:   cd fb 0b  "..." 
    LD B,10                           ;0xee3b:   06 0a  ".."  
    LD A,(IY+1)                       ;0xee3d:   fd 7e 01  ".~." 
;--------------------------------------
C_EE40:                               ; XREF: 0xEE80 
    NOP                               ;0xee40:   00  "." 
    OR A                              ;0xee41:   b7  "." 
    JR nz, $+27                       ;0xee42:   20 19  " ." 
    PUSH HL                           ;0xee44:   e5  "." 
    PUSH BC                           ;0xee45:   c5  "." 
    RES 4,C                           ;0xee46:   cb a1  ".." 
    LD B,(IX+0x12)                    ;0xee48:   dd 46 12  ".F." 
    CALL 0xd23                        ;0xee4b:   cd 23 0d  ".#." 
    CALL 0xd5a                        ;0xee4e:   cd 5a 0d  ".Z." 
    POP BC                            ;0xee51:   c1  "." 
    POP HL                            ;0xee52:   e1  "." 
    JR nc, $+35                       ;0xee53:   30 21  "0!" 
    LD (IY+1),1                       ;0xee55:   fd 36 01 01  ".6.."  
    NOP                               ;0xee59:   00  "." 
    LD (IY+1),0                       ;0xee5a:   fd 36 01 00  ".6.."  
    RST 0x38                          ;0xee5e:   ff  "." 
    LD A,(IY+1)                       ;0xee5f:   fd 7e 01  ".~." 
    CP D                              ;0xee62:   ba  "." 
    SCF                               ;0xee63:   37  "7" 
    RET z                             ;0xee64:   c8  "." 
    PUSH HL                           ;0xee65:   e5  "." 
    PUSH BC                           ;0xee66:   c5  "." 
    LD B,(IY+1)                       ;0xee67:   fd 46 01  ".F." 
    CALL 0xd2c                        ;0xee6a:   cd 2c 0d  ".,." 
    CALL 0xd5a                        ;0xee6d:   cd 5a 0d  ".Z." 
    POP BC                            ;0xee70:   c1  "." 
    POP HL                            ;0xee71:   e1  "." 
    JR nc, C_EE78                     ;0xee72:   30 04  "0." 
    LD (IY+1),D                       ;0xee74:   fd 72 01  ".r." 
    RET                               ;0xee77:   c9  "." 
;--------------------------------------
C_EE78:                               ; XREF: 0xEE72 
    LD (IY+2),0                       ;0xee78:   fd 36 02 00  ".6.."  
    RET z                             ;0xee7c:   c8  "." 
    CALL 0xdac                        ;0xee7d:   cd ac 0d  "..." 
    DJNZ C_EE40                       ;0xee80:   10 be  ".." 
    CP A                              ;0xee82:   bf  "." 
    RET                               ;0xee83:   c9  "." 
    DEC B                             ;0xee84:   05  "." 
    LD A,7                            ;0xee85:   3e 07  ">."  
    CALL 0xe56                        ;0xee87:   cd 56 0e  ".V." 
    LD A,C                            ;0xee8a:   79  "y" 
    JR C_EE9E                         ;0xee8b:   18 11  ".." 
    LD A,D                            ;0xee8d:   7a  "z" 
    SUB B                             ;0xee8e:   90  "." 
    JR nc, S_EE93                     ;0xee8f:   30 02  "0." 
;--------------------------------------
S_ee91:                               ; XREF: 
    DEFB 0x2f                         ;0xee91:   
    DEFB 0x3c                         ;0xee92:   
;--------------------------------------
S_EE93:                               ; XREF: 0xEE8F 
    DEFB 0x47                         ;0xee93:   
    DEFB 0x3e                         ;0xee94:   
    RRCA                              ;0xee95:   0f  "." 
    CALL 0xe56                        ;0xee96:   cd 56 0e  ".V." 
    LD A,C                            ;0xee99:   79  "y" 
    CALL 0xe56                        ;0xee9a:   cd 56 0e  ".V." 
    LD A,D                            ;0xee9d:   7a  "z" 
;--------------------------------------
C_EE9E:                               ; XREF: 0xEE8B 
    CALL 0xe56                        ;0xee9e:   cd 56 0e  ".V." 
;--------------------------------------
C_EEA1:                               ; XREF: 0xEEA7 
    LD A,(0xb0f1)                     ;0xeea1:   3a f1 b0  ":.."  
    CALL 0xd51                        ;0xeea4:   cd 51 0d  ".Q." 
    DJNZ C_EEA1                       ;0xeea7:   10 f8  ".." 
    LD A,(0xb0f0)                     ;0xeea9:   3a f0 b0  ":.."  
    CALL 0xd51                        ;0xeeac:   cd 51 0d  ".Q." 
    JP 0xddd                          ;0xeeaf:   c3 dd 0d  "..." 
;--------------------------------------
C_EEB2:                               ; XREF: 0xEEB8 
    LD L,0xf8                         ;0xeeb2:   2e f8  ".."  
;--------------------------------------
C_EEB4:                               ; XREF: 0xEEB5 
    DEC L                             ;0xeeb4:   2d  "-" 
    JR nz, C_EEB4                     ;0xeeb5:   20 fd  " ." 
    DEC A                             ;0xeeb7:   3d  "=" 
    JR nz, C_EEB2                     ;0xeeb8:   20 f8  " ." 
    RET                               ;0xeeba:   c9  "." 
;--------------------------------------
C_EEBB:                               ; XREF: 0xEED2 
    LD A,C                            ;0xeebb:   79  "y" 
    OR 0x20                           ;0xeebc:   f6 20  ". " 
    INC HL                            ;0xeebe:   23  "#" 
    CP (HL)                           ;0xeebf:   be  "." 
    SCF                               ;0xeec0:   37  "7" 
    RET z                             ;0xeec1:   c8  "." 
    LD A,(HL)                         ;0xeec2:   7e  "~" 
    AND 0xc0                          ;0xeec3:   e6 c0  ".." 
    XOR 0x80                          ;0xeec5:   ee 80  ".." 
    JR z, C_EEDD                      ;0xeec7:   28 14  "(." 
    LD A,(HL)                         ;0xeec9:   7e  "~" 
    AND 7                             ;0xeeca:   e6 07  ".." 
    CP C                              ;0xeecc:   b9  "." 
    JR z, C_EED4                      ;0xeecd:   28 05  "(." 
    CALL 0xddd                        ;0xeecf:   cd dd 0d  "..." 
    JR C_EEBB                         ;0xeed2:   18 e7  ".." 
;--------------------------------------
C_EED4:                               ; XREF: 0xEECD 
    LD A,(HL)                         ;0xeed4:   7e  "~" 
    AND 8                             ;0xeed5:   e6 08  ".." 
    JR z, C_EEDD                      ;0xeed7:   28 04  "(." 
    LD A,1                            ;0xeed9:   3e 01  ">."  
    NOP                               ;0xeedb:   00  "." 
    CP A                              ;0xeedc:   bf  "." 
;--------------------------------------
C_EEDD:                               ; XREF: 0xEEC7 
    RET                               ;0xeedd:   c9  "." 
    OR 2                              ;0xeede:   f6 02  ".." 
    RET                               ;0xeee0:   c9  "." 
    INC HL                            ;0xeee1:   23  "#" 
    LD A,(HL)                         ;0xeee2:   7e  "~" 
    CP C                              ;0xeee3:   b9  "." 
    SCF                               ;0xeee4:   37  "7" 
    RET z                             ;0xeee5:   c8  "." 
    AND 8                             ;0xeee6:   e6 08  ".." 
    XOR 8                             ;0xeee8:   ee 08  ".." 
    LD A,1                            ;0xeeea:   3e 01  ">."  
    NOP                               ;0xeeec:   00  "." 
    RET z                             ;0xeeed:   c8  "." 
    INC HL                            ;0xeeee:   23  "#" 
    LD A,(HL)                         ;0xeeef:   7e  "~" 
    CP 0x80                           ;0xeef0:   fe 80  ".." 
    SCF                               ;0xeef2:   37  "7" 
    RET z                             ;0xeef3:   c8  "." 
    XOR 2                             ;0xeef4:   ee 02  ".." 
    LD A,1                            ;0xeef6:   3e 01  ">."  
    RET z                             ;0xeef8:   c8  "." 
    LD A,(HL)                         ;0xeef9:   7e  "~" 
    AND 0x20                          ;0xeefa:   e6 20  ". " 
    LD A,3                            ;0xeefc:   3e 03  ">."  
    RET nz                            ;0xeefe:   c0  "." 
    LD A,(HL)                         ;0xeeff:   7e  "~" 
    AND 4                             ;0xef00:   e6 04  ".." 
    LD A,4                            ;0xef02:   3e 04  ">."  
    RET nz                            ;0xef04:   c0  "." 
    LD A,(HL)                         ;0xef05:   7e  "~" 
    AND 1                             ;0xef06:   e6 01  ".." 
    LD A,5                            ;0xef08:   3e 05  ">."  
    RET nz                            ;0xef0a:   c0  "." 
    LD A,7                            ;0xef0b:   3e 07  ">."  
    OR A                              ;0xef0d:   b7  "." 
    RET                               ;0xef0e:   c9  "." 
    PUSH HL                           ;0xef0f:   e5  "." 
    PUSH AF                           ;0xef10:   f5  "." 
;--------------------------------------
C_EF11:                               ; XREF: 0xEF18 
    CALL 0xddd                        ;0xef11:   cd dd 0d  "..." 
    AND 0xc0                          ;0xef14:   e6 c0  ".." 
    CP 0x80                           ;0xef16:   fe 80  ".." 
    JR nz, C_EF11                     ;0xef18:   20 f7  " ." 
    POP AF                            ;0xef1a:   f1  "." 
    POP HL                            ;0xef1b:   e1  "." 
    RET                               ;0xef1c:   c9  "." 
    PUSH BC                           ;0xef1d:   c5  "." 
    LD C,1                            ;0xef1e:   0e 01  ".."  
    CALL 0xdc6                        ;0xef20:   cd c6 0d  "..." 
    POP BC                            ;0xef23:   c1  "." 
    AND 0x60                          ;0xef24:   e6 60  ".`" 
    RET z                             ;0xef26:   c8  "." 
    SCF                               ;0xef27:   37  "7" 
    RET                               ;0xef28:   c9  "." 
    CALL 0xe6d                        ;0xef29:   cd 6d 0e  ".m." 
    CALL 0xdac                        ;0xef2c:   cd ac 0d  "..." 
    CALL 0xdd2                        ;0xef2f:   cd d2 0d  "..." 
    JP 0xe8f                          ;0xef32:   c3 8f 0e  "..." 
    LD A,4                            ;0xef35:   3e 04  ">."  
    CALL 0xe56                        ;0xef37:   cd 56 0e  ".V." 
    LD A,C                            ;0xef3a:   79  "y" 
    CALL 0xe56                        ;0xef3b:   cd 56 0e  ".V." 
    JR C_EF45                         ;0xef3e:   18 05  ".." 
    LD A,8                            ;0xef40:   3e 08  ">."  
    CALL 0xe56                        ;0xef42:   cd 56 0e  ".V." 
;--------------------------------------
C_EF45:                               ; XREF: 0xEF3E 
    PUSH DE                           ;0xef45:   d5  "." 
    PUSH BC                           ;0xef46:   c5  "." 
    LD BC,D_FB7E                      ;0xef47:   01 7e fb  ".~."  
    LD D,1                            ;0xef4a:   16 01  ".."  
    NOP                               ;0xef4c:   00  "." 
    LD HL,D_FFE1                      ;0xef4d:   21 e1 ff  "!.."  
    PUSH HL                           ;0xef50:   e5  "." 
;--------------------------------------
C_EF51:                               ; XREF: 0xEF54 
    IN A,(C)                          ;0xef51:   ed 78  ".x" 
    ADD A,A                           ;0xef53:   87  "." 
    JR nc, C_EF51                     ;0xef54:   30 fb  "0." 
    JP p, 0xe02                       ;0xef56:   f2 02 0e  "..." 
    INC BC                            ;0xef59:   03  "." 
    IN A,(C)                          ;0xef5a:   ed 78  ".x" 
    DEC BC                            ;0xef5c:   0b  "." 
    LD (HL),A                         ;0xef5d:   77  "w" 
    INC HL                            ;0xef5e:   23  "#" 
    INC D                             ;0xef5f:   14  "." 
    EX (SP),HL                        ;0xef60:   e3  "." 
    EX (SP),HL                        ;0xef61:   e3  "." 
    EX (SP),HL                        ;0xef62:   e3  "." 
    EX (SP),HL                        ;0xef63:   e3  "." 
    JR C_EF51                         ;0xef64:   18 eb  ".." 
    POP HL                            ;0xef66:   e1  "." 
    LD A,(HL)                         ;0xef67:   7e  "~" 
    DEC HL                            ;0xef68:   2b  "+" 
    LD (HL),D                         ;0xef69:   72  "r" 
    POP BC                            ;0xef6a:   c1  "." 
    POP DE                            ;0xef6b:   d1  "." 
    RET                               ;0xef6c:   c9  "." 
    CALL 0xe24                        ;0xef6d:   cd 24 0e  ".$." 
    CALL D_FFA0                       ;0xef70:   cd a0 ff  "..." 
    JP 0xde2                          ;0xef73:   c3 e2 0d  "..." 
    CALL 0xe24                        ;0xef76:   cd 24 0e  ".$." 
    CALL C_FFBA                       ;0xef79:   cd ba ff  "..." 
    LD A,(0xb0ef)                     ;0xef7c:   3a ef b0  ":.."  
;--------------------------------------
C_EF7F:                               ; XREF: 0xEF83 
    DEC A                             ;0xef7f:   3d  "=" 
    INC BC                            ;0xef80:   03  "." 
    INC BC                            ;0xef81:   03  "." 
    INC BC                            ;0xef82:   03  "." 
    JR nz, C_EF7F                     ;0xef83:   20 fa  " ." 
    JP 0xde2                          ;0xef85:   c3 e2 0d  "..." 
    CALL 0xdac                        ;0xef88:   cd ac 0d  "..." 
    LD A,(HL)                         ;0xef8b:   7e  "~" 
    INC A                             ;0xef8c:   3c  "<" 
    OR 0xc0                           ;0xef8d:   f6 c0  ".." 
    LD C,A                            ;0xef8f:   4f  "O" 
    INC HL                            ;0xef90:   23  "#" 
    LD E,(HL)                         ;0xef91:   5e  "^" 
    INC HL                            ;0xef92:   23  "#" 
    LD D,(HL)                         ;0xef93:   56  "V" 
    INC HL                            ;0xef94:   23  "#" 
    INC HL                            ;0xef95:   23  "#" 
    INC HL                            ;0xef96:   23  "#" 
    LD B,(HL)                         ;0xef97:   46  "F" 
    INC HL                            ;0xef98:   23  "#" 
    DEC B                             ;0xef99:   05  "." 
;--------------------------------------
C_EF9A:                               ; XREF: 0xEF9F 
    LD A,(HL)                         ;0xef9a:   7e  "~" 
    INC HL                            ;0xef9b:   23  "#" 
    CALL 0xe56                        ;0xef9c:   cd 56 0e  ".V." 
    DJNZ C_EF9A                       ;0xef9f:   10 f9  ".." 
    LD A,(HL)                         ;0xefa1:   7e  "~" 
    EX DE,HL                          ;0xefa2:   eb  "." 
    LD B,0x7f                         ;0xefa3:   06 7f  ".."  
    DI                                ;0xefa5:   f3  "." 
    RET                               ;0xefa6:   c9  "." 
    PUSH AF                           ;0xefa7:   f5  "." 
    CALL 0xdac                        ;0xefa8:   cd ac 0d  "..." 
    POP AF                            ;0xefab:   f1  "." 
    AND 0x40                          ;0xefac:   e6 40  ".@" 
    OR 10                             ;0xefae:   f6 0a  ".." 
    CALL 0xe56                        ;0xefb0:   cd 56 0e  ".V." 
    LD A,C                            ;0xefb3:   79  "y" 
    CALL 0xe56                        ;0xefb4:   cd 56 0e  ".V." 
    JP 0xde2                          ;0xefb7:   c3 e2 0d  "..." 
    PUSH DE                           ;0xefba:   d5  "." 
    PUSH BC                           ;0xefbb:   c5  "." 
    LD D,A                            ;0xefbc:   57  "W" 
    LD BC,D_FB7E                      ;0xefbd:   01 7e fb  ".~."  
;--------------------------------------
C_EFC0:                               ; XREF: 0xEFC3 
    IN A,(C)                          ;0xefc0:   ed 78  ".x" 
    ADD A,A                           ;0xefc2:   87  "." 
    JR nc, C_EFC0                     ;0xefc3:   30 fb  "0." 
    ADD A,A                           ;0xefc5:   87  "." 
    JR c, C_EFCE                      ;0xefc6:   38 06  "8." 
    INC BC                            ;0xefc8:   03  "." 
    OUT (C),D                         ;0xefc9:   ed 51  ".Q" 
    DEC BC                            ;0xefcb:   0b  "." 
    EX (SP),HL                        ;0xefcc:   e3  "." 
    EX (SP),HL                        ;0xefcd:   e3  "." 
;--------------------------------------
C_EFCE:                               ; XREF: 0xEFC6 
    POP BC                            ;0xefce:   c1  "." 
    POP DE                            ;0xefcf:   d1  "." 
    RET                               ;0xefd0:   c9  "." 
    PUSH HL                           ;0xefd1:   e5  "." 
    PUSH DE                           ;0xefd2:   d5  "." 
    PUSH BC                           ;0xefd3:   c5  "." 
    PUSH AF                           ;0xefd4:   f5  "." 
    CALL 0xedc                        ;0xefd5:   cd dc 0e  "..." 
    LD A,(0xb0dd)                     ;0xefd8:   3a dd b0  ":.."  
    OR A                              ;0xefdb:   b7  "." 
    JR nz, C_EFF1                     ;0xefdc:   20 13  " ." 
    LD BC,D_FA7E                      ;0xefde:   01 7e fa  ".~."  
    LD A,1                            ;0xefe1:   3e 01  ">."  
    OUT (C),A                         ;0xefe3:   ed 79  ".y" 
    LD HL,(0xb0ed)                    ;0xefe5:   2a ed b0  "*.."  
    CALL 0xecb                        ;0xefe8:   cd cb 0e  "..." 
;--------------------------------------
C_EFEB:                               ; XREF: 0xEFEF 
    LD A,(0xb0dd)                     ;0xefeb:   3a dd b0  ":.."  
    OR A                              ;0xefee:   b7  "." 
    JR z, C_EFEB                      ;0xefef:   28 fa  "(." 
;--------------------------------------
C_EFF1:                               ; XREF: 0xEFDC 
    JR C_F006                         ;0xeff1:   18 13  ".." 
    PUSH HL                           ;0xeff3:   e5  "." 
    PUSH DE                           ;0xeff4:   d5  "." 
    PUSH BC                           ;0xeff5:   c5  "." 
    PUSH AF                           ;0xeff6:   f5  "." 
    CALL 0xedc                        ;0xeff7:   cd dc 0e  "..." 
    LD A,(0xb0dd)                     ;0xeffa:   3a dd b0  ":.."  
    OR A                              ;0xeffd:   b7  "." 
;--------------------------------------
C_EFFE:                               ; XREF: 0xFF8C 
    JR z, C_F006                      ;0xeffe:   28 06  "(." 
    LD HL,(0xb0ee)                    ;0xf000:   2a ee b0  "*.."  
    CALL 0xecb                        ;0xf003:   cd cb 0e  "..." 
;--------------------------------------
C_F006:                               ; XREF: 0xEFF1 
    POP AF                            ;0xf006:   f1  "." 
    POP BC                            ;0xf007:   c1  "." 
    POP DE                            ;0xf008:   d1  "." 
    POP HL                            ;0xf009:   e1  "." 
    RET                               ;0xf00a:   c9  "." 
    LD HL,0xb0dd                      ;0xf00b:   21 dd b0  "!.."  
    LD A,(HL)                         ;0xf00e:   7e  "~" 
    CPL                               ;0xf00f:   2f  "/" 
    LD (HL),A                         ;0xf010:   77  "w" 
    OR A                              ;0xf011:   b7  "." 
    JR nz, $+46                       ;0xf012:   20 2c  " ," 
    CALL 0xedc                        ;0xf014:   cd dc 0e  "..." 
    JR C_F025                         ;0xf017:   18 0c  ".." 
    LD BC,0x80ff                      ;0xf019:   01 ff 80  "..."  
    LD HL,0xb0d6                      ;0xf01c:   21 d6 b0  "!.."  
    LD DE,0xea7                       ;0xf01f:   11 a7 0e  "..."  
    CALL KL_INIT_EVENT                ;0xf022:   cd ef bc  "..." 
;--------------------------------------
C_F025:                               ; XREF: 0xF017 
    LD BC,D_FA7E                      ;0xf025:   01 7e fa  ".~."  
    XOR A                             ;0xf028:   af  "." 
    OUT (C),A                         ;0xf029:   ed 79  ".y" 
    LD (0xb0dd),A                     ;0xf02b:   32 dd b0  "2.."  
    RET                               ;0xf02e:   c9  "." 
    LD H,1                            ;0xf02f:   26 01  "&."  
    NOP                               ;0xf031:   00  "." 
    LD D,H                            ;0xf032:   54  "T" 
    LD E,L                            ;0xf033:   5d  "]" 
    ADD HL,HL                         ;0xf034:   29  ")" 
    ADD HL,HL                         ;0xf035:   29  ")" 
    ADD HL,DE                         ;0xf036:   19  "." 
    EX DE,HL                          ;0xf037:   eb  "." 
    LD HL,0xb0d0                      ;0xf038:   21 d0 b0  "!.."  
    LD BC,2                           ;0xf03b:   01 02 00  "..."  
    JP KL_ADD_TICKER                  ;0xf03e:   c3 e9 bc  "..." 
    LD HL,0xb0d0                      ;0xf041:   21 d0 b0  "!.."  
    JP KL_DEL_TICKER                  ;0xf044:   c3 ec bc  "..." 
    LD BC,0x7fc3                      ;0xf047:   01 c3 7f  "..."  
    OUT (C),C                         ;0xf04a:   ed 49  ".I" 
    LD DE,0x8080                      ;0xf04c:   11 80 80  "..."  
    LD HL,1                           ;0xf04f:   21 01 00  "!.."  
;--------------------------------------
C_F052:                               ; XREF: 0xF0B7 
    LD A,B                            ;0xf052:   78  "x" 
    LD BC,0x180                       ;0xf053:   01 80 01  "..."  
    NOP                               ;0xf056:   00  "." 
    LDIR                              ;0xf057:   ed b0  ".." 
    LD BC,0x7fc1                      ;0xf059:   01 c1 7f  "..."  
    OUT (C),C                         ;0xf05c:   ed 49  ".I" 
    RET                               ;0xf05e:   c9  "." 
    RST 0x38                          ;0xf05f:   ff  "." 
    RST 0x38                          ;0xf060:   ff  "." 
    RST 0x38                          ;0xf061:   ff  "." 
    RST 0x38                          ;0xf062:   ff  "." 
    RST 0x38                          ;0xf063:   ff  "." 
    RST 0x38                          ;0xf064:   ff  "." 
    RST 0x38                          ;0xf065:   ff  "." 
    RST 0x38                          ;0xf066:   ff  "." 
    CALL 0xe56                        ;0xf067:   cd 56 0e  ".V." 
    OUT (C),C                         ;0xf06a:   ed 49  ".I" 
    LD BC,D_FB7E                      ;0xf06c:   01 7e fb  ".~."  
    JR C_F076                         ;0xf06f:   18 05  ".." 
;--------------------------------------
C_F071:                               ; XREF: 0xF07D 
    INC C                             ;0xf071:   0c  "." 
    INI                               ;0xf072:   ed a2  ".." 
    INC B                             ;0xf074:   04  "." 
    DEC C                             ;0xf075:   0d  "." 
;--------------------------------------
C_F076:                               ; XREF: 0xF06F 
    IN A,(C)                          ;0xf076:   ed 78  ".x" 
    JP p, C_FFAF                      ;0xf078:   f2 af ff  "..." 
;--------------------------------------
C_F07B:                               ; XREF: 0xF0DF 
    AND 0x20                          ;0xf07b:   e6 20  ". " 
    JR nz, C_F071                     ;0xf07d:   20 f2  " ." 
    JR C_F099                         ;0xf07f:   18 18  ".." 
    CALL 0xe56                        ;0xf081:   cd 56 0e  ".V." 
    OUT (C),C                         ;0xf084:   ed 49  ".I" 
    LD BC,D_FB7E                      ;0xf086:   01 7e fb  ".~."  
    JR C_F090                         ;0xf089:   18 05  ".." 
;--------------------------------------
C_F08B:                               ; XREF: 0xF097 
    INC C                             ;0xf08b:   0c  "." 
    INC B                             ;0xf08c:   04  "." 
    OUTI                              ;0xf08d:   ed a3  ".." 
    DEC C                             ;0xf08f:   0d  "." 
;--------------------------------------
C_F090:                               ; XREF: 0xF089 
    IN A,(C)                          ;0xf090:   ed 78  ".x" 
    JP p, C_FFC9                      ;0xf092:   f2 c9 ff  "..." 
    AND 0x20                          ;0xf095:   e6 20  ". " 
    JR nz, C_F08B                     ;0xf097:   20 f2  " ." 
;--------------------------------------
C_F099:                               ; XREF: 0xF07F 
    LD BC,0x7fc1                      ;0xf099:   01 c1 7f  "..."  
    OUT (C),C                         ;0xf09c:   ed 49  ".I" 
    CALL 0xb92a                       ;0xf09e:   cd 2a b9  ".*." 
    EI                                ;0xf0a1:   fb  "." 
    RET                               ;0xf0a2:   c9  "." 
    RST 0x38                          ;0xf0a3:   ff  "." 
    RST 0x38                          ;0xf0a4:   ff  "." 
    RST 0x38                          ;0xf0a5:   ff  "." 
    RST 0x38                          ;0xf0a6:   ff  "." 
    CP 0x92                           ;0xf0a7:   fe 92  ".." 
;--------------------------------------
S_f0a9:                               ; XREF: 
    DEFB " not ready"                 ;0xf0a9:   0xf0a9 to 0xf0b3
    DEFB 0xff                         ;0xf0b4:   
    DEFB 0xfe                         ;0xf0b5:   
    DEFB 0x9d                         ;0xf0b6:   
    DEFB 0x20                         ;0xf0b7:   
    DEFB 0x99                         ;0xf0b8:   
;--------------------------------------
S_f0b9:                               ; XREF: 
    DEFB " writ"                      ;0xf0b9:   0xf0b9 to 0xf0be
;--------------------------------------
S_f0bf:                               ; XREF: 
    DEFB "protected"                  ;0xf0bf:   0xf0bf to 0xf0c8
    DEFB 0xff                         ;0xf0c9:   
    DEFB 0x93                         ;0xf0ca:   
;--------------------------------------
S_f0cb:                               ; XREF: 
    DEFB " seek fail"                 ;0xf0cb:   0xf0cb to 0xf0d5
    DEFB "no ", 0x9c                  ;0xf0d6:   0xf0d6 to 0xf0d7
    DEFB "no ", '' + 0x80            ;0xf0da:   0xf0da to 0xf0db
    DEFB 0x6f                         ;0xf0de:   
    DEFB 0x20                         ;0xf0df:   
    DEFB 0x9a                         ;0xf0e0:   
;--------------------------------------
C_F0E1:                               ; XREF: 0xEBE3 
    SBC A,E                           ;0xf0e1:   9b  "." 
    RST 0x38                          ;0xf0e2:   ff  "." 
    SBC A,H                           ;0xf0e3:   9c  "." 
    LD L,L                            ;0xf0e4:   6d  "m" 
    SBC A,C                           ;0xf0e5:   99  "." 
;--------------------------------------
S_f0e6:                               ; XREF: 
    DEFB "sing add"                   ;0xf0e6:   0xf0e6 to 0xf0ee
;--------------------------------------
S_f0ef:                               ; XREF: 
    DEFB "mark"                       ;0xf0ef:   0xf0ef to 0xf0f3
    DEFB 0xff                         ;0xf0f4:   
    DEFB 0xfe                         ;0xf0f5:   
;--------------------------------------
S_f0f6:                               ; XREF: 
    DEFB " bad f"                     ;0xf0f6:   0xf0f6 to 0xf0fc
    DEFB "mat"                        ;0xf0fd:   0xf0fd to 0xf100
    DEFB 0xff                         ;0xf101:   
    DEFB 0xfe                         ;0xf102:   
;--------------------------------------
S_f103:                               ; XREF: 
    DEFB " unknown"                   ;0xf103:   0xf103 to 0xf10b
    DEFB 0x9b                         ;0xf10c:   
    DEFB 0xff                         ;0xf10d:   
    DEFB 0xa                          ;0xf10e:   0xa
;--------------------------------------
S_f10f:                               ; XREF: 
    DEFB "CP/M Plus  Amstrad Consumer Electronics plc"  ;0xf10f:   0xf10f to 0xf13a
;--------------------------------------
C_F13A:                               ; XREF: 0xF118 
    ADC A,L                           ;0xf13a:   8d  "." 
    HALT                              ;0xf13b:   76  "v" 
    JR nz, C_F139                     ;0xf13c:   20 fb  " ." 
    LD L,0xfa                         ;0xf13e:   2e fa  ".."  
;--------------------------------------
S_f140:                               ; XREF: 0xF0CB 
    DEFB ", 61K TPA"                  ;0xf140:   0xf140 to 0xf149
    DEFB 0xff                         ;0xf14a:   
    DEFB 0x31                         ;0xf14b:   
    DEFB 0x9d                         ;0xf14c:   
;--------------------------------------
C_F14D:                               ; XREF: 0xF0EA 
    SUB D                             ;0xf14d:   92  "." 
    RST 0x38                          ;0xf14e:   ff  "." 
    LD (0x929d),A                     ;0xf14f:   32 9d 92  "2.."  
    LD (HL),E                         ;0xf152:   73  "s" 
    RST 0x38                          ;0xf153:   ff  "." 
    SUB A                             ;0xf154:   97  "." 
;--------------------------------------
S_f155:                               ; XREF: 
    DEFB "1 serial port"              ;0xf155:   0xf155 to 0xf162
;--------------------------------------
C_F162:                               ; XREF: 0xF0FA 
    RST 0x38                          ;0xf162:   ff  "." 
    SUB A                             ;0xf163:   97  "." 
    LD SP,HL                          ;0xf164:   f9  "." 
;--------------------------------------
C_F165:                               ; XREF: 0xF113 
    LD C,E                            ;0xf165:   4b  "K" 
;--------------------------------------
C_F166:                               ; XREF: 0xF121 
    SUB D                             ;0xf166:   92  "." 
    JR nz, S_F1B6                     ;0xf167:   20 4d  " M" 
    LD A,(0x90ff)                     ;0xf169:   3a ff 90  ":.."  
    LD A,(BC)                         ;0xf16c:   0a  "." 
    RST 0x38                          ;0xf16d:   ff  "." 
;--------------------------------------
S_f16e:                               ; XREF: 
    DEFB "Pleas"                      ;0xf16e:   0xf16e to 0xf173
    DEFB "put"                        ;0xf174:   0xf174 to 0xf177
    DEFB 0x9d                         ;0xf178:   
;--------------------------------------
C_F179:                               ; XREF: 0xF141 
    JR nz, S_F1E1                     ;0xf179:   20 66  " f" 
;--------------------------------------
C_F17B:                               ; XREF: 0xF17C 
    SUB H                             ;0xf17b:   94  "." 
    JR nz, C_F17B                     ;0xf17c:   20 fd  " ." 
;--------------------------------------
S_f17e:                               ; XREF: 
    DEFB " into"                      ;0xf17e:   0xf17e to 0xf183
    DEFB "n p", 0x95                  ;0xf184:   0xf184 to 0xf185
    DEFB 0x70                         ;0xf188:   
    DEFB 0x96                         ;0xf189:   
;--------------------------------------
S_f18a:                               ; XREF: 
    DEFB "any key"                    ;0xf18a:   0xf18a to 0xf191
    DEFB 0xf8                         ;0xf192:   
;--------------------------------------
S_f193:                               ; XREF: 
    DEFB " not ready"                 ;0xf193:   0xf193 to 0xf19d
    DEFB 0xff                         ;0xf19e:   
    DEFB 0xd                          ;0xf19f:   
    DEFB 0xa                          ;0xf1a0:   0xa
    DEFB 0xff                         ;0xf1a1:   
;--------------------------------------
S_f1a2:                               ; XREF: 
    DEFB "Driv"                       ;0xf1a2:   0xf1a2 to 0xf1a6
;--------------------------------------
C_F1A7:                               ; XREF: 0xF1A8 
    SBC A,C                           ;0xf1a7:   99  "." 
;--------------------------------------
C_F1A8:                               ; XREF: 0xF136 
    JR nz, C_F1A7                     ;0xf1a8:   20 fd  " ." 
    RST 0x38                          ;0xf1aa:   ff  "." 
;--------------------------------------
S_f1ab:                               ; XREF: 
    DEFB " drive"                     ;0xf1ab:   0xf1ab to 0xf1b1
    DEFB 0xfe                         ;0xf1b2:   
;--------------------------------------
S_f1b3:                               ; XREF: 
    DEFB " track ", '{' + 0x80        ;0xf1b3:   0xf1b3 to 0xf1bd
    DEFB 0xff                         ;0xf1bb:   
    DEFB 0x6f                         ;0xf1bc:   
    DEFB 0x72                         ;0xf1bd:   
    DEFB 0xff                         ;0xf1be:   
;--------------------------------------
S_f1bf:                               ; XREF: 
    DEFB " the"                       ;0xf1bf:   0xf1bf to 0xf1c3
;--------------------------------------
S_f1c4:                               ; XREF: 
    DEFB "ress "                      ;0xf1c4:   0xf1c4 to 0xf1c9
;--------------------------------------
C_F1C9:                               ; XREF: 0xF1C8 
    RST 0x38                          ;0xf1c9:   ff  "." 
    INC L                             ;0xf1ca:   2c  "," 
    JR nz, $+1                        ;0xf1cb:   20 ff  " ." 
    LD H,L                            ;0xf1cd:   65  "e" 
    JR nz, $+1                        ;0xf1ce:   20 ff  " ." 
    LD L,C                            ;0xf1d0:   69  "i" 
    LD (HL),E                         ;0xf1d1:   73  "s" 
    RST 0x38                          ;0xf1d2:   ff  "." 
;--------------------------------------
S_f1d3:                               ; XREF: 
    DEFB "data"                       ;0xf1d3:   0xf1d3 to 0xf1d7
;--------------------------------------
S_f1d8:                               ; XREF: 
    DEFB " - Retry"                   ;0xf1d8:   0xf1d8 to 0xf1e0
;--------------------------------------
S_F1E1:                               ; XREF: 0xF179 
    DEFB "Ign"                        ;0xf1e1:   0xf1e1 to 0xf1e4
    DEFB 0x98                         ;0xf1e5:   
    DEFB 0x94                         ;0xf1e6:   
;--------------------------------------
S_f1e7:                               ; XREF: 
    DEFB " Cancel?"                   ;0xf1e7:   0xf1e7 to 0xf1ef
    DEFB 0x93                         ;0xf1f0:   
    DEFB 0x97                         ;0xf1f1:   
;--------------------------------------
S_f1f2:                               ; XREF: 
    DEFB "sect"                       ;0xf1f2:   0xf1f2 to 0xf1f6
    DEFB 0x20                         ;0xf1f7:   
    DEFB 0xfa                         ;0xf1f8:   
;--------------------------------------
C_F1F9:                               ; XREF: 0xF187 
    JR nz, $+1                        ;0xf1f9:   20 ff  " ." 
    JR nz, $+102                      ;0xf1fb:   20 64  " d" 
    SBC A,C                           ;0xf1fd:   99  "." 
    LD H,E                            ;0xf1fe:   63  "c" 
    RST 0x38                          ;0xf1ff:   ff  "." 
;--------------------------------------
S_f200:                               ; XREF: 
    DEFB " err"                       ;0xf200:   0xf200 to 0xf204
    SUB H                             ;0xf204:   94  "." 
    RST 0x38                          ;0xf205:   ff  "." 
    RST 0x38                          ;0xf206:   ff  "." 
;--------------------------------------
C_F207:                               ; XREF: 0xF1D8 
    DI                                ;0xf207:   f3  "." 
    CALL 0x3e9                        ;0xf208:   cd e9 03  "..." 
;--------------------------------------
C_F20B:                               ; XREF: 0xF197 
    LD (0x3cfe),SP                    ;0xf20b:   ed 73 fe 3c  ".s.<"  
    LD SP,0x3cfe                      ;0xf20f:   31 fe 3c  "1.<"  
    CALL 0x89d5                       ;0xf212:   cd d5 89  "..." 
    LD DE,0x8080                      ;0xf215:   11 80 80  "..."  
    LD BC,0x180                       ;0xf218:   01 80 01  "..."  
    NOP                               ;0xf21b:   00  "." 
    LDIR                              ;0xf21c:   ed b0  ".." 
    LD BC,0x7fc1                      ;0xf21e:   01 c1 7f  "..."  
    OUT (C),C                         ;0xf221:   ed 49  ".I" 
    LD SP,(0x3cfe)                    ;0xf223:   ed 7b fe 3c  ".{.<"  
    LD A,(0xbef9)                     ;0xf227:   3a f9 be  ":.."  
    LD B,A                            ;0xf22a:   47  "G" 
    LD C,1                            ;0xf22b:   0e 01  ".."  
    NOP                               ;0xf22d:   00  "." 
;--------------------------------------
C_F22E:                               ; XREF: 0xF1DA 
    LD (D_FE59),BC                    ;0xf22e:   ed 43 59 fe  ".CY."  
    LD BC,0x180                       ;0xf232:   01 80 01  "..."  
;--------------------------------------
C_F235:                               ; XREF: 0xF1BF 
    NOP                               ;0xf235:   00  "." 
    LD HL,(0xbef6)                    ;0xf236:   2a f6 be  "*.."  
    LD DE,0x8080                      ;0xf239:   11 80 80  "..."  
    CALL 0xfccb                       ;0xf23c:   cd cb fc  "..." 
    DI                                ;0xf23f:   f3  "." 
    CALL 0xee2                        ;0xf240:   cd e2 0e  "..." 
    XOR A                             ;0xf243:   af  "." 
    EI                                ;0xf244:   fb  "." 
    RET                               ;0xf245:   c9  "." 
    DI                                ;0xf246:   f3  "." 
    CALL 0x3e9                        ;0xf247:   cd e9 03  "..." 
    LD A,(0xbef9)                     ;0xf24a:   3a f9 be  ":.."  
    LD B,1                            ;0xf24d:   06 01  ".."  
    NOP                               ;0xf24f:   00  "." 
    LD C,A                            ;0xf250:   4f  "O" 
    LD (D_FE59),BC                    ;0xf251:   ed 43 59 fe  ".CY."  
    LD BC,0x180                       ;0xf255:   01 80 01  "..."  
    NOP                               ;0xf258:   00  "." 
    LD HL,0x8080                      ;0xf259:   21 80 80  "!.."  
    LD DE,(0xbef6)                    ;0xf25c:   ed 5b f6 be  ".[.."  
    CALL 0xfccb                       ;0xf260:   cd cb fc  "..." 
    DI                                ;0xf263:   f3  "." 
    LD (0x3cfe),SP                    ;0xf264:   ed 73 fe 3c  ".s.<"  
    LD SP,0x3cfe                      ;0xf268:   31 fe 3c  "1.<"  
    CALL 0x89d5                       ;0xf26b:   cd d5 89  "..." 
    EX DE,HL                          ;0xf26e:   eb  "." 
    LD HL,0x8080                      ;0xf26f:   21 80 80  "!.."  
    LD BC,0x180                       ;0xf272:   01 80 01  "..."  
    NOP                               ;0xf275:   00  "." 
    LDIR                              ;0xf276:   ed b0  ".." 
    CALL 0xee2                        ;0xf278:   cd e2 0e  "..." 
    LD SP,(0x3cfe)                    ;0xf27b:   ed 7b fe 3c  ".{.<"  
    XOR A                             ;0xf27f:   af  "." 
    EI                                ;0xf280:   fb  "." 
    RET                               ;0xf281:   c9  "." 
    LD A,(0xbef2)                     ;0xf282:   3a f2 be  ":.."  
    LD B,A                            ;0xf285:   47  "G" 
    AND 3                             ;0xf286:   e6 03  ".." 
    LD C,A                            ;0xf288:   4f  "O" 
    LD A,B                            ;0xf289:   78  "x" 
    AND 0x1c                          ;0xf28a:   e6 1c  ".." 
    ADD A,A                           ;0xf28c:   87  "." 
    OR C                              ;0xf28d:   b1  "." 
    OR 0xc4                           ;0xf28e:   f6 c4  ".." 
    LD B,0x7f                         ;0xf290:   06 7f  ".."  
    OUT (C),A                         ;0xf292:   ed 79  ".y" 
    LD A,(0xbef4)                     ;0xf294:   3a f4 be  ":.."  
    LD L,1                            ;0xf297:   2e 01  ".."  
    NOP                               ;0xf299:   00  "." 
    LD H,A                            ;0xf29a:   67  "g" 
    SRA H                             ;0xf29b:   cb 2c  ".," 
    RR L                              ;0xf29d:   cb 1d  ".." 
    SET 6,H                           ;0xf29f:   cb f4  ".." 
    RET                               ;0xf2a1:   c9  "." 
    EX DE,HL                          ;0xf2a2:   eb  "." 
    RET                               ;0xf2a3:   c9  "." 
    RST 0x38                          ;0xf2a4:   ff  "." 
    RST 0x38                          ;0xf2a5:   ff  "." 
    RST 0x38                          ;0xf2a6:   ff  "." 
    RST 0x38                          ;0xf2a7:   ff  "." 
    RST 0x38                          ;0xf2a8:   ff  "." 
    RST 0x38                          ;0xf2a9:   ff  "." 
    RST 0x38                          ;0xf2aa:   ff  "." 
    RST 0x38                          ;0xf2ab:   ff  "." 
    RST 0x38                          ;0xf2ac:   ff  "." 
    RST 0x38                          ;0xf2ad:   ff  "." 
    LD (BC),A                         ;0xf2ae:   02  "." 
    NOP                               ;0xf2af:   00  "." 
    LD H,(HL)                         ;0xf2b0:   66  "f" 
    IN A,(0x00db)                     ;0xf2b1:   db db  ".." 
    IN A,(0x0066)                     ;0xf2b3:   db 66  ".f" 
    LD BC,0x3c00                      ;0xf2b5:   01 00 3c  "..<"  
    LD B,D                            ;0xf2b8:   42  "B" 
    ADD A,C                           ;0xf2b9:   81  "." 
    SBC A,C                           ;0xf2ba:   99  "." 
    ADD A,C                           ;0xf2bb:   81  "." 
    LD B,D                            ;0xf2bc:   42  "B" 
    INC A                             ;0xf2bd:   3c  "<" 
    LD BC,D_FE00                      ;0xf2be:   01 00 fe  "..."  
    ADD A,0xc0                        ;0xf2c1:   c6 c0  ".." 
    RET nz                            ;0xf2c3:   c0  "." 
    RET nz                            ;0xf2c4:   c0  "." 
    RET nz                            ;0xf2c5:   c0  "." 
    RET nz                            ;0xf2c6:   c0  "." 
    LD BC,0x1000                      ;0xf2c7:   01 00 10  "..."  
    JR c, $+58                        ;0xf2ca:   38 38  "88" 
    LD L,H                            ;0xf2cc:   6c  "l" 
    LD L,H                            ;0xf2cd:   6c  "l" 
    ADD A,0xfe                        ;0xf2ce:   c6 fe  ".." 
    LD BC,0x3c00                      ;0xf2d0:   01 00 3c  "..<"  
    LD B,D                            ;0xf2d3:   42  "B" 
    AND L                             ;0xf2d4:   a5  "." 
    SBC A,C                           ;0xf2d5:   99  "." 
    AND L                             ;0xf2d6:   a5  "." 
    LD B,D                            ;0xf2d7:   42  "B" 
    INC A                             ;0xf2d8:   3c  "<" 
    INC B                             ;0xf2d9:   04  "." 
    NOP                               ;0xf2da:   00  "." 
    INC H                             ;0xf2db:   24  "$" 
    JR C_F302                         ;0xf2dc:   18 24  ".$" 
    INC B                             ;0xf2de:   04  "." 
    NOP                               ;0xf2df:   00  "." 
    JR C_F2E3                         ;0xf2e0:   18 01  ".." 
    NOP                               ;0xf2e2:   00  "." 
;--------------------------------------
C_F2E3:                               ; XREF: 0xF2E0 
    LD A,(HL)                         ;0xf2e3:   7e  "~" 
    LD BC,0x1800                      ;0xf2e4:   01 00 18  "..."  
    INC BC                            ;0xf2e7:   03  "." 
    NOP                               ;0xf2e8:   00  "." 
    JR C_F303                         ;0xf2e9:   18 18  ".." 
    LD BC,0x6600                      ;0xf2eb:   01 00 66  "..f"  
    LD H,(HL)                         ;0xf2ee:   66  "f" 
    LD BC,D_FE00                      ;0xf2ef:   01 00 fe  "..."  
    DEFB "llllll"                     ;0xf2f2:   0xf2f2 to 0xf2f8
    DEFB 0x1                          ;0xf2f8:   0x1
    DEFB 0x0                          ;0xf2f9:   
    DEFB 0x18                         ;0xf2fa:   0x18
    DEFB 0x18                         ;0xf2fb:   0x18
    DEFB 0x18                         ;0xf2fc:   0x18
    DEFB 0x18                         ;0xf2fd:   0x18
    DEFB 0x7e                         ;0xf2fe:   
    DEFB 0x3c                         ;0xf2ff:   
    DEFB 0x18                         ;0xf300:   0x18
    DEFB 0x1                          ;0xf301:   0x1
;--------------------------------------
C_F302:                               ; XREF: 0xF2DC 
    NOP                               ;0xf302:   00  "." 
;--------------------------------------
C_F303:                               ; XREF: 0xF2E9 
    CP 0xc6                           ;0xf303:   fe c6  ".." 
    LD H,B                            ;0xf305:   60  "`" 
    JR nc, C_F368                     ;0xf306:   30 60  "0`" 
    ADD A,0xfe                        ;0xf308:   c6 fe  ".." 
    LD (BC),A                         ;0xf30a:   02  "." 
    NOP                               ;0xf30b:   00  "." 
    JR nz, S_F36E                     ;0xf30c:   20 60  " `" 
    CP 0xfe                           ;0xf30e:   fe fe  ".." 
    LD H,B                            ;0xf310:   60  "`" 
    JR nz, C_F315                     ;0xf311:   20 02  " ." 
    NOP                               ;0xf313:   00  "." 
    EX AF,AF'                         ;0xf314:   08  "." 
;--------------------------------------
C_F315:                               ; XREF: 0xF2FB 
    INC C                             ;0xf315:   0c  "." 
    CP 0xfe                           ;0xf316:   fe fe  ".." 
    INC C                             ;0xf318:   0c  "." 
    EX AF,AF'                         ;0xf319:   08  "." 
    LD (BC),A                         ;0xf31a:   02  "." 
    NOP                               ;0xf31b:   00  "." 
    JR C_F336                         ;0xf31c:   18 18  ".." 
    LD A,(HL)                         ;0xf31e:   7e  "~" 
    JR $+26                           ;0xf31f:   18 18  ".." 
    LD A,(HL)                         ;0xf321:   7e  "~" 
    LD (BC),A                         ;0xf322:   02  "." 
    NOP                               ;0xf323:   00  "." 
    INC H                             ;0xf324:   24  "$" 
    LD H,(HL)                         ;0xf325:   66  "f" 
    RST 0x38                          ;0xf326:   ff  "." 
    RST 0x38                          ;0xf327:   ff  "." 
    LD H,(HL)                         ;0xf328:   66  "f" 
    INC H                             ;0xf329:   24  "$" 
    LD BC,0x7c00                      ;0xf32a:   01 00 7c  "..|"  
    ADD A,0xc6                        ;0xf32d:   c6 c6  ".." 
    ADD A,0xc6                        ;0xf32f:   c6 c6  ".." 
    LD L,H                            ;0xf331:   6c  "l" 
    XOR 3                             ;0xf332:   ee 03  ".." 
    NOP                               ;0xf334:   00  "." 
    LD (HL),E                         ;0xf335:   73  "s" 
;--------------------------------------
C_F336:                               ; XREF: 0xF31C 
    SBC A,0xcc                        ;0xf336:   de cc  ".." 
    SBC A,0x73                        ;0xf338:   de 73  ".s" 
    LD BC,0x7c00                      ;0xf33a:   01 00 7c  "..|"  
    ADD A,0xc6                        ;0xf33d:   c6 c6  ".." 
    CALL m, S_C6C6                    ;0xf33f:   fc c6 c6  "..." 
    RET m                             ;0xf342:   f8  "." 
    RET nz                            ;0xf343:   c0  "." 
    DEFB "ff<fff<"                    ;0xf344:   0xf344 to 0xf34b
    DEFB 0x1                          ;0xf34b:   0x1
    DEFB 0x0                          ;0xf34c:   
    DEFB "<`<fff<"                    ;0xf34d:   0xf34d to 0xf354
    DEFB 0x3                          ;0xf354:   0x3
    DEFB 0x0                          ;0xf355:   
    DEFB 0x1e                         ;0xf356:   0x1e
    DEFB "0|0", 0x7c                  ;0xf357:   0xf357 to 0xf358
    DEFB 0x1                          ;0xf35b:   0x1
    DEFB 0x0                          ;0xf35c:   
    DEFB 0x38                         ;0xf35d:   
    DEFB 0x6c                         ;0xf35e:   
    DEFB 0xc6                         ;0xf35f:   
    DEFB 0xfe                         ;0xf360:   
    DEFB 0xc6                         ;0xf361:   
    DEFB 0x6c                         ;0xf362:   
    DEFB 0x38                         ;0xf363:   
    DEFB 0x2                          ;0xf364:   0x2
    DEFB 0x0                          ;0xf365:   
    DEFB 0xc0                         ;0xf366:   
;--------------------------------------
C_F367:                               ; XREF: 0xF363 
    LD H,B                            ;0xf367:   60  "`" 
;--------------------------------------
C_F368:                               ; XREF: 0xF306 
    JR nc, C_F3A2                     ;0xf368:   30 38  "08" 
    LD L,H                            ;0xf36a:   6c  "l" 
    ADD A,3                           ;0xf36b:   c6 03  ".." 
    NOP                               ;0xf36d:   00  "." 
;--------------------------------------
S_F36E:                               ; XREF: 0xF30C 
    DEFB "fff|``"                     ;0xf36e:   0xf36e to 0xf374
    DEFB 0x2                          ;0xf374:   0x2
    DEFB 0x0                          ;0xf375:   
    DEFB 0xfe                         ;0xf376:   
    DEFB "llll"                       ;0xf377:   0xf377 to 0xf37b
    DEFB 0x3                          ;0xf37b:   0x3
    DEFB 0x0                          ;0xf37c:   
;--------------------------------------
C_F37D:                               ; XREF: 0xF2FD 
    INC A                             ;0xf37d:   3c  "<" 
    LD H,(HL)                         ;0xf37e:   66  "f" 
    LD H,(HL)                         ;0xf37f:   66  "f" 
    LD A,H                            ;0xf380:   7c  "|" 
    LD H,B                            ;0xf381:   60  "`" 
    LD H,B                            ;0xf382:   60  "`" 
    LD (BC),A                         ;0xf383:   02  "." 
    NOP                               ;0xf384:   00  "." 
    LD A,(HL)                         ;0xf385:   7e  "~" 
    RET c                             ;0xf386:   d8  "." 
    RET c                             ;0xf387:   d8  "." 
    RET c                             ;0xf388:   d8  "." 
    LD (HL),B                         ;0xf389:   70  "p" 
    LD (BC),A                         ;0xf38a:   02  "." 
    NOP                               ;0xf38b:   00  "." 
    LD (HL),E                         ;0xf38c:   73  "s" 
    ADC A,0x18                        ;0xf38d:   ce 18  ".." 
    JR C_F3A9                         ;0xf38f:   18 18  ".." 
    INC C                             ;0xf391:   0c  "." 
    LD BC,0x300                       ;0xf392:   01 00 03  "..."  
    LD B,0x3c                         ;0xf395:   06 3c  ".<"  
    LD H,(HL)                         ;0xf397:   66  "f" 
    LD H,(HL)                         ;0xf398:   66  "f" 
    INC A                             ;0xf399:   3c  "<" 
    LD H,B                            ;0xf39a:   60  "`" 
    RET nz                            ;0xf39b:   c0  "." 
    LD BC,0xe600                      ;0xf39c:   01 00 e6  "..."  
    INC A                             ;0xf39f:   3c  "<" 
    JR C_F3DA                         ;0xf3a0:   18 38  ".8" 
;--------------------------------------
C_F3A2:                               ; XREF: 0xF368 
    LD L,H                            ;0xf3a2:   6c  "l" 
    RST 0                             ;0xf3a3:   c7  "." 
    LD BC,0x300                       ;0xf3a4:   01 00 03  "..."  
    LD B,0x66                         ;0xf3a7:   06 66  ".f"  
;--------------------------------------
C_F3A9:                               ; XREF: 0xF38F 
    DEFB 0x66                         ;0xf3a9:   
    DEFB "f<`", 0x3c                  ;0xf3aa:   0xf3aa to 0xf3ab
    DEFB 0x2                          ;0xf3ae:   0x2
    DEFB 0x0                          ;0xf3af:   
    DEFB 0x66                         ;0xf3b0:   
    DEFB 0xc3                         ;0xf3b1:   
    DEFB 0xdb                         ;0xf3b2:   
    DEFB 0xdb                         ;0xf3b3:   
    DEFB 0x7e                         ;0xf3b4:   
    DEFB 0x9                          ;0xf3b5:   0x9
    DEFB 0x0                          ;0xf3b6:   
    DEFB 0x18                         ;0xf3b7:   0x18
    DEFB 0x18                         ;0xf3b8:   0x18
    DEFB 0x18                         ;0xf3b9:   0x18
    DEFB 0x18                         ;0xf3ba:   0x18
    DEFB 0x18                         ;0xf3bb:   0x18
    DEFB 0x1                          ;0xf3bc:   0x1
    DEFB 0x0                          ;0xf3bd:   
;--------------------------------------
C_F3BE:                               ; XREF: 0xF3BB 
    JR S_F3C1                         ;0xf3be:   18 01  ".." 
    NOP                               ;0xf3c0:   00  "." 
;--------------------------------------
S_F3C1:                               ; XREF: 0xF3BE 
    DEFB "lll"                        ;0xf3c1:   0xf3c1 to 0xf3c4
    DEFB 0x5                          ;0xf3c4:   0x5
    DEFB 0x0                          ;0xf3c5:   
    DEFB 0x6c                         ;0xf3c6:   
    DEFB 0x6c                         ;0xf3c7:   
    DEFB 0xfe                         ;0xf3c8:   
    DEFB 0x6c                         ;0xf3c9:   
    DEFB 0xfe                         ;0xf3ca:   
    DEFB 0x6c                         ;0xf3cb:   
    DEFB 0x6c                         ;0xf3cc:   
    DEFB 0x1                          ;0xf3cd:   0x1
    DEFB 0x0                          ;0xf3ce:   
    DEFB 0x18                         ;0xf3cf:   0x18
    DEFB 0x3e                         ;0xf3d0:   
;--------------------------------------
C_F3D1:                               ; XREF: 0xF3B7 
    LD E,B                            ;0xf3d1:   58  "X" 
    INC A                             ;0xf3d2:   3c  "<" 
;--------------------------------------
C_F3D3:                               ; XREF: 0xF3B9 
    LD A,(DE)                         ;0xf3d3:   1a  "." 
    LD A,H                            ;0xf3d4:   7c  "|" 
    JR $+4                            ;0xf3d5:   18 02  ".." 
    NOP                               ;0xf3d7:   00  "." 
    ADD A,0xcc                        ;0xf3d8:   c6 cc  ".." 
;--------------------------------------
C_F3DA:                               ; XREF: 0xF3A0 
    JR C_F40C                         ;0xf3da:   18 30  ".0" 
    LD H,(HL)                         ;0xf3dc:   66  "f" 
    ADD A,1                           ;0xf3dd:   c6 01  ".." 
    NOP                               ;0xf3df:   00  "." 
    JR c, $+110                       ;0xf3e0:   38 6c  "8l" 
    JR c, C_F45A                      ;0xf3e2:   38 76  "8v" 
    CALL c, 0x76cc                    ;0xf3e4:   dc cc 76  "..v" 
    LD BC,0x1800                      ;0xf3e7:   01 00 18  "..."  
    JR C_F404                         ;0xf3ea:   18 18  ".." 
    DEC B                             ;0xf3ec:   05  "." 
    NOP                               ;0xf3ed:   00  "." 
    INC C                             ;0xf3ee:   0c  "." 
    JR C_F421                         ;0xf3ef:   18 30  ".0" 
    JR nc, $+50                       ;0xf3f1:   30 30  "00" 
    JR C_F401                         ;0xf3f3:   18 0c  ".." 
    LD BC,0x3000                      ;0xf3f5:   01 00 30  "..0"  
    JR C_F406                         ;0xf3f8:   18 0c  ".." 
    INC C                             ;0xf3fa:   0c  "." 
    INC C                             ;0xf3fb:   0c  "." 
    JR C_F42E                         ;0xf3fc:   18 30  ".0" 
    LD (BC),A                         ;0xf3fe:   02  "." 
    NOP                               ;0xf3ff:   00  "." 
    LD H,(HL)                         ;0xf400:   66  "f" 
;--------------------------------------
C_F401:                               ; XREF: 0xF3F3 
    INC A                             ;0xf401:   3c  "<" 
    RST 0x38                          ;0xf402:   ff  "." 
    INC A                             ;0xf403:   3c  "<" 
;--------------------------------------
C_F404:                               ; XREF: 0xF3EA 
    LD H,(HL)                         ;0xf404:   66  "f" 
    INC BC                            ;0xf405:   03  "." 
;--------------------------------------
C_F406:                               ; XREF: 0xF3F8 
    NOP                               ;0xf406:   00  "." 
    JR C_F421                         ;0xf407:   18 18  ".." 
    LD A,(HL)                         ;0xf409:   7e  "~" 
    JR C_F424                         ;0xf40a:   18 18  ".." 
;--------------------------------------
C_F40C:                               ; XREF: 0xF3DA 
    RLCA                              ;0xf40c:   07  "." 
    NOP                               ;0xf40d:   00  "." 
    JR $+26                           ;0xf40e:   18 18  ".." 
    JR nc, C_F415                     ;0xf410:   30 03  "0." 
    NOP                               ;0xf412:   00  "." 
    LD A,(HL)                         ;0xf413:   7e  "~" 
    ADD HL,BC                         ;0xf414:   09  "." 
;--------------------------------------
C_F415:                               ; XREF: 0xF410 
    NOP                               ;0xf415:   00  "." 
    JR C_F430                         ;0xf416:   18 18  ".." 
    LD BC,0x600                       ;0xf418:   01 00 06  "..."  
    INC C                             ;0xf41b:   0c  "." 
    JR $+50                           ;0xf41c:   18 30  ".0" 
    LD H,B                            ;0xf41e:   60  "`" 
    RET nz                            ;0xf41f:   c0  "." 
    ADD A,B                           ;0xf420:   80  "." 
;--------------------------------------
C_F421:                               ; XREF: 0xF3EF 
    LD BC,0x3800                      ;0xf421:   01 00 38  "..8"  
;--------------------------------------
C_F424:                               ; XREF: 0xF40A 
    LD L,H                            ;0xf424:   6c  "l" 
    ADC A,0xd6                        ;0xf425:   ce d6  ".." 
    AND 0x6c                          ;0xf427:   e6 6c  ".l" 
    JR c, C_F42C                      ;0xf429:   38 01  "8." 
    NOP                               ;0xf42b:   00  "." 
;--------------------------------------
C_F42C:                               ; XREF: 0xF429 
    JR C_F466                         ;0xf42c:   18 38  ".8" 
;--------------------------------------
C_F42E:                               ; XREF: 0xF3FC 
    JR C_F448                         ;0xf42e:   18 18  ".." 
;--------------------------------------
C_F430:                               ; XREF: 0xF416 
    JR C_F44A                         ;0xf430:   18 18  ".." 
    LD A,(HL)                         ;0xf432:   7e  "~" 
    LD BC,0x3c00                      ;0xf433:   01 00 3c  "..<"  
    LD H,(HL)                         ;0xf436:   66  "f" 
    LD B,0x3c                         ;0xf437:   06 3c  ".<"  
    LD H,B                            ;0xf439:   60  "`" 
    LD H,(HL)                         ;0xf43a:   66  "f" 
    LD A,(HL)                         ;0xf43b:   7e  "~" 
    LD BC,0x3c00                      ;0xf43c:   01 00 3c  "..<"  
    LD H,(HL)                         ;0xf43f:   66  "f" 
    LD B,0x1c                         ;0xf440:   06 1c  ".."  
    LD B,0x66                         ;0xf442:   06 66  ".f"  
    INC A                             ;0xf444:   3c  "<" 
    LD BC,0x1c00                      ;0xf445:   01 00 1c  "..."  
;--------------------------------------
C_F448:                               ; XREF: 0xF42E 
    INC A                             ;0xf448:   3c  "<" 
    LD L,H                            ;0xf449:   6c  "l" 
;--------------------------------------
C_F44A:                               ; XREF: 0xF430 
    CALL z, 0xcfe                     ;0xf44a:   cc fe 0c  "..." 
    LD E,1                            ;0xf44d:   1e 01  ".."  
    NOP                               ;0xf44f:   00  "." 
    LD A,(HL)                         ;0xf450:   7e  "~" 
    LD H,D                            ;0xf451:   62  "b" 
    LD H,B                            ;0xf452:   60  "`" 
    LD A,H                            ;0xf453:   7c  "|" 
    LD B,0x66                         ;0xf454:   06 66  ".f"  
    INC A                             ;0xf456:   3c  "<" 
    LD BC,0x3c00                      ;0xf457:   01 00 3c  "..<"  
;--------------------------------------
C_F45A:                               ; XREF: 0xF3E2 
    LD H,(HL)                         ;0xf45a:   66  "f" 
    LD H,B                            ;0xf45b:   60  "`" 
    LD A,H                            ;0xf45c:   7c  "|" 
    LD H,(HL)                         ;0xf45d:   66  "f" 
    LD H,(HL)                         ;0xf45e:   66  "f" 
    INC A                             ;0xf45f:   3c  "<" 
    LD BC,0x7e00                      ;0xf460:   01 00 7e  "..~"  
    LD H,(HL)                         ;0xf463:   66  "f" 
    LD B,12                           ;0xf464:   06 0c  ".."  
;--------------------------------------
C_F466:                               ; XREF: 0xF42C 
    JR $+26                           ;0xf466:   18 18  ".." 
    JR C_F46B                         ;0xf468:   18 01  ".." 
    NOP                               ;0xf46a:   00  "." 
;--------------------------------------
C_F46B:                               ; XREF: 0xF468 
    INC A                             ;0xf46b:   3c  "<" 
    LD H,(HL)                         ;0xf46c:   66  "f" 
    LD H,(HL)                         ;0xf46d:   66  "f" 
    INC A                             ;0xf46e:   3c  "<" 
    LD H,(HL)                         ;0xf46f:   66  "f" 
    LD H,(HL)                         ;0xf470:   66  "f" 
    INC A                             ;0xf471:   3c  "<" 
    LD BC,0x3c00                      ;0xf472:   01 00 3c  "..<"  
    LD H,(HL)                         ;0xf475:   66  "f" 
    LD H,(HL)                         ;0xf476:   66  "f" 
    LD A,6                            ;0xf477:   3e 06  ">."  
    LD H,(HL)                         ;0xf479:   66  "f" 
    INC A                             ;0xf47a:   3c  "<" 
    INC BC                            ;0xf47b:   03  "." 
    NOP                               ;0xf47c:   00  "." 
    JR $+26                           ;0xf47d:   18 18  ".." 
    LD BC,0x1800                      ;0xf47f:   01 00 18  "..."  
    JR C_F487                         ;0xf482:   18 03  ".." 
    NOP                               ;0xf484:   00  "." 
    JR C_F49F                         ;0xf485:   18 18  ".." 
;--------------------------------------
C_F487:                               ; XREF: 0xF482 
    LD BC,0x1800                      ;0xf487:   01 00 18  "..."  
    JR C_F4BC                         ;0xf48a:   18 30  ".0" 
    INC C                             ;0xf48c:   0c  "." 
    JR $+50                           ;0xf48d:   18 30  ".0" 
    LD H,B                            ;0xf48f:   60  "`" 
    JR nc, C_F4AA                     ;0xf490:   30 18  "0." 
    INC C                             ;0xf492:   0c  "." 
    INC BC                            ;0xf493:   03  "." 
    NOP                               ;0xf494:   00  "." 
    LD A,(HL)                         ;0xf495:   7e  "~" 
    LD BC,0x7e00                      ;0xf496:   01 00 7e  "..~"  
    INC BC                            ;0xf499:   03  "." 
    NOP                               ;0xf49a:   00  "." 
    LD H,B                            ;0xf49b:   60  "`" 
    JR nc, $+26                       ;0xf49c:   30 18  "0." 
    INC C                             ;0xf49e:   0c  "." 
;--------------------------------------
C_F49F:                               ; XREF: 0xF485 
    JR $+50                           ;0xf49f:   18 30  ".0" 
    LD H,B                            ;0xf4a1:   60  "`" 
    LD BC,0x3c00                      ;0xf4a2:   01 00 3c  "..<"  
    LD H,(HL)                         ;0xf4a5:   66  "f" 
    LD H,(HL)                         ;0xf4a6:   66  "f" 
    INC C                             ;0xf4a7:   0c  "." 
    JR C_F4AB                         ;0xf4a8:   18 01  ".." 
;--------------------------------------
C_F4AA:                               ; XREF: 0xF490 
    NOP                               ;0xf4aa:   00  "." 
;--------------------------------------
C_F4AB:                               ; XREF: 0xF4A8 
    JR C_F4AE                         ;0xf4ab:   18 01  ".." 
    NOP                               ;0xf4ad:   00  "." 
;--------------------------------------
C_F4AE:                               ; XREF: 0xF4AB 
    LD A,H                            ;0xf4ae:   7c  "|" 
    ADD A,0xde                        ;0xf4af:   c6 de  ".." 
    SBC A,0xde                        ;0xf4b1:   de de  ".." 
    RET nz                            ;0xf4b3:   c0  "." 
    LD A,H                            ;0xf4b4:   7c  "|" 
    LD BC,0x1800                      ;0xf4b5:   01 00 18  "..."  
    INC A                             ;0xf4b8:   3c  "<" 
    LD H,(HL)                         ;0xf4b9:   66  "f" 
    LD H,(HL)                         ;0xf4ba:   66  "f" 
    LD A,(HL)                         ;0xf4bb:   7e  "~" 
;--------------------------------------
C_F4BC:                               ; XREF: 0xF48A 
    LD H,(HL)                         ;0xf4bc:   66  "f" 
    LD H,(HL)                         ;0xf4bd:   66  "f" 
    LD BC,D_FC00                      ;0xf4be:   01 00 fc  "..."  
    LD H,(HL)                         ;0xf4c1:   66  "f" 
    LD H,(HL)                         ;0xf4c2:   66  "f" 
    LD A,H                            ;0xf4c3:   7c  "|" 
    LD H,(HL)                         ;0xf4c4:   66  "f" 
    LD H,(HL)                         ;0xf4c5:   66  "f" 
    CALL m, 0x1                       ;0xf4c6:   fc 01 00  "..." 
    INC A                             ;0xf4c9:   3c  "<" 
    LD H,(HL)                         ;0xf4ca:   66  "f" 
    RET nz                            ;0xf4cb:   c0  "." 
    RET nz                            ;0xf4cc:   c0  "." 
    RET nz                            ;0xf4cd:   c0  "." 
    LD H,(HL)                         ;0xf4ce:   66  "f" 
    INC A                             ;0xf4cf:   3c  "<" 
    LD BC,D_F800                      ;0xf4d0:   01 00 f8  "..."  
    DEFB "lfffl", 'x' + 0x80          ;0xf4d3:   0xf4d3 to 0xf4db
    DEFB 0x1                          ;0xf4d9:   0x1
    DEFB 0x0                          ;0xf4da:   
    DEFB 0xfe                         ;0xf4db:   
    DEFB "bhxhb", '~' + 0x80          ;0xf4dc:   0xf4dc to 0xf4e4
    DEFB 0x1                          ;0xf4e2:   0x1
    DEFB 0x0                          ;0xf4e3:   
    DEFB 0xfe                         ;0xf4e4:   
    DEFB "bhxh`", 'p' + 0x80          ;0xf4e5:   0xf4e5 to 0xf4ed
    DEFB 0x1                          ;0xf4eb:   0x1
    DEFB 0x0                          ;0xf4ec:   
    DEFB 0x3c                         ;0xf4ed:   
    DEFB 0x66                         ;0xf4ee:   
    DEFB 0xc0                         ;0xf4ef:   
    DEFB 0xc0                         ;0xf4f0:   
    DEFB 0xce                         ;0xf4f1:   
    DEFB 0x66                         ;0xf4f2:   
    DEFB 0x3e                         ;0xf4f3:   
    DEFB 0x1                          ;0xf4f4:   0x1
    DEFB 0x0                          ;0xf4f5:   
    DEFB "fff~fff"                    ;0xf4f6:   0xf4f6 to 0xf4fd
    DEFB 0x1                          ;0xf4fd:   0x1
    DEFB 0x0                          ;0xf4fe:   
    DEFB 0x7e                         ;0xf4ff:   
    DEFB 0x18                         ;0xf500:   0x18
    DEFB 0x18                         ;0xf501:   0x18
    DEFB 0x18                         ;0xf502:   0x18
    DEFB 0x18                         ;0xf503:   0x18
    DEFB 0x18                         ;0xf504:   0x18
    DEFB 0x7e                         ;0xf505:   
    DEFB 0x1                          ;0xf506:   0x1
    DEFB 0x0                          ;0xf507:   
    DEFB 0x1e                         ;0xf508:   0x1e
    DEFB 0xc                          ;0xf509:   0xc
    DEFB 0xc                          ;0xf50a:   0xc
    DEFB 0xc                          ;0xf50b:   0xc
    DEFB 0xcc                         ;0xf50c:   
    DEFB 0xcc                         ;0xf50d:   
    DEFB 0x78                         ;0xf50e:   
    DEFB 0x1                          ;0xf50f:   0x1
    DEFB 0x0                          ;0xf510:   
    DEFB 0xe6                         ;0xf511:   
    DEFB "flxlf", 'f' + 0x80          ;0xf512:   0xf512 to 0xf51a
    DEFB 0x1                          ;0xf518:   0x1
    DEFB 0x0                          ;0xf519:   
;--------------------------------------
C_F51A:                               ; XREF: 0xF500 
    RET p                             ;0xf51a:   f0  "." 
    LD H,B                            ;0xf51b:   60  "`" 
;--------------------------------------
C_F51C:                               ; XREF: 0xF502 
    LD H,B                            ;0xf51c:   60  "`" 
    LD H,B                            ;0xf51d:   60  "`" 
    LD H,D                            ;0xf51e:   62  "b" 
    LD H,(HL)                         ;0xf51f:   66  "f" 
    CP 1                              ;0xf520:   fe 01  ".." 
    NOP                               ;0xf522:   00  "." 
    ADD A,0xee                        ;0xf523:   c6 ee  ".." 
    CP 0xfe                           ;0xf525:   fe fe  ".." 
    SUB 0xc6                          ;0xf527:   d6 c6  ".." 
    ADD A,1                           ;0xf529:   c6 01  ".." 
    NOP                               ;0xf52b:   00  "." 
    ADD A,0xe6                        ;0xf52c:   c6 e6  ".." 
    OR 0xde                           ;0xf52e:   f6 de  ".." 
    ADC A,0xc6                        ;0xf530:   ce c6  ".." 
    ADD A,1                           ;0xf532:   c6 01  ".." 
    NOP                               ;0xf534:   00  "." 
    LD A,H                            ;0xf535:   7c  "|" 
    ADD A,0xc6                        ;0xf536:   c6 c6  ".." 
    ADD A,0xc6                        ;0xf538:   c6 c6  ".." 
    ADD A,0x7c                        ;0xf53a:   c6 7c  ".|" 
    LD BC,D_FC00                      ;0xf53c:   01 00 fc  "..."  
    LD H,(HL)                         ;0xf53f:   66  "f" 
    LD H,(HL)                         ;0xf540:   66  "f" 
    LD A,H                            ;0xf541:   7c  "|" 
    LD H,B                            ;0xf542:   60  "`" 
    LD H,B                            ;0xf543:   60  "`" 
    RET p                             ;0xf544:   f0  "." 
    LD BC,0x7c00                      ;0xf545:   01 00 7c  "..|"  
    ADD A,0xc6                        ;0xf548:   c6 c6  ".." 
    ADD A,0xda                        ;0xf54a:   c6 da  ".." 
    CALL z, 0x176                     ;0xf54c:   cc 76 01  ".v." 
    NOP                               ;0xf54f:   00  "." 
    CALL m, 0x6666                    ;0xf550:   fc 66 66  ".ff" 
    LD A,H                            ;0xf553:   7c  "|" 
    LD L,H                            ;0xf554:   6c  "l" 
    LD H,(HL)                         ;0xf555:   66  "f" 
    AND 1                             ;0xf556:   e6 01  ".." 
    NOP                               ;0xf558:   00  "." 
    INC A                             ;0xf559:   3c  "<" 
    LD H,(HL)                         ;0xf55a:   66  "f" 
    LD H,B                            ;0xf55b:   60  "`" 
    INC A                             ;0xf55c:   3c  "<" 
    LD B,0x66                         ;0xf55d:   06 66  ".f"  
    INC A                             ;0xf55f:   3c  "<" 
    LD BC,0x7e00                      ;0xf560:   01 00 7e  "..~"  
    LD E,D                            ;0xf563:   5a  "Z" 
    JR $+26                           ;0xf564:   18 18  ".." 
    JR $+26                           ;0xf566:   18 18  ".." 
    INC A                             ;0xf568:   3c  "<" 
    LD BC,0x6600                      ;0xf569:   01 00 66  "..f"  
    DEFB "fffff<", 0x66               ;0xf56c:   0xf56c to 0xf56d
    DEFB 0x0                          ;0xf573:   
    DEFB "fffff<"                     ;0xf574:   0xf574 to 0xf57a
    DEFB 0x18                         ;0xf57a:   0x18
    DEFB 0x1                          ;0xf57b:   0x1
    DEFB 0x0                          ;0xf57c:   
;--------------------------------------
C_F57D:                               ; XREF: 0xF57A 
    ADD A,0xc6                        ;0xf57d:   c6 c6  ".." 
    ADD A,0xd6                        ;0xf57f:   c6 d6  ".." 
    CP 0xee                           ;0xf581:   fe ee  ".." 
    ADD A,1                           ;0xf583:   c6 01  ".." 
    NOP                               ;0xf585:   00  "." 
    ADD A,0x6c                        ;0xf586:   c6 6c  ".l" 
    JR c, $+58                        ;0xf588:   38 38  "88" 
    LD L,H                            ;0xf58a:   6c  "l" 
    ADD A,0xc6                        ;0xf58b:   c6 c6  ".." 
    LD BC,0x6600                      ;0xf58d:   01 00 66  "..f"  
    DEFB "ff<", 0x66                  ;0xf590:   0xf590 to 0xf591
    DEFB 0x18                         ;0xf594:   0x18
    DEFB 0x3c                         ;0xf595:   
    DEFB 0x1                          ;0xf596:   0x1
    DEFB 0x0                          ;0xf597:   
    DEFB 0xfe                         ;0xf598:   
    DEFB 0xc6                         ;0xf599:   
    DEFB 0x8c                         ;0xf59a:   
    DEFB 0x18                         ;0xf59b:   0x18
    DEFB 0x32                         ;0xf59c:   
    DEFB 0x66                         ;0xf59d:   
    DEFB 0xfe                         ;0xf59e:   
    DEFB 0x1                          ;0xf59f:   0x1
    DEFB 0x0                          ;0xf5a0:   
    DEFB 0x3c                         ;0xf5a1:   
;--------------------------------------
C_F5A2:                               ; XREF: 0xEBB3 
    JR nc, C_F5D4                     ;0xf5a2:   30 30  "00" 
    JR nc, C_F5D6                     ;0xf5a4:   30 30  "00" 
    JR nc, C_F5E4                     ;0xf5a6:   30 3c  "0<" 
    LD BC,ROM_TYPE                    ;0xf5a8:   01 00 c0  "..."  
    LD H,B                            ;0xf5ab:   60  "`" 
    JR nc, C_F5C6                     ;0xf5ac:   30 18  "0." 
    INC C                             ;0xf5ae:   0c  "." 
    LD B,2                            ;0xf5af:   06 02  ".."  
    LD BC,0x3c00                      ;0xf5b1:   01 00 3c  "..<"  
    INC C                             ;0xf5b4:   0c  "." 
    INC C                             ;0xf5b5:   0c  "." 
    INC C                             ;0xf5b6:   0c  "." 
    INC C                             ;0xf5b7:   0c  "." 
    INC C                             ;0xf5b8:   0c  "." 
    INC A                             ;0xf5b9:   3c  "<" 
    LD BC,0x1800                      ;0xf5ba:   01 00 18  "..."  
    INC A                             ;0xf5bd:   3c  "<" 
    LD A,(HL)                         ;0xf5be:   7e  "~" 
    JR C_F5D9                         ;0xf5bf:   18 18  ".." 
    JR C_F5DB                         ;0xf5c1:   18 18  ".." 
    EX AF,AF'                         ;0xf5c3:   08  "." 
    NOP                               ;0xf5c4:   00  "." 
    RST 0x38                          ;0xf5c5:   ff  "." 
;--------------------------------------
C_F5C6:                               ; XREF: 0xF5AC 
    JR nc, C_F5E0                     ;0xf5c6:   30 18  "0." 
    INC C                             ;0xf5c8:   0c  "." 
    RLCA                              ;0xf5c9:   07  "." 
    NOP                               ;0xf5ca:   00  "." 
    LD A,B                            ;0xf5cb:   78  "x" 
    INC C                             ;0xf5cc:   0c  "." 
    LD A,H                            ;0xf5cd:   7c  "|" 
    CALL z, 0x176                     ;0xf5ce:   cc 76 01  ".v." 
    NOP                               ;0xf5d1:   00  "." 
    RET po                            ;0xf5d2:   e0  "." 
    DEFB "`|fff", '\' + 0x80          ;0xf5d3:   0xf5d3 to 0xf5db
;--------------------------------------
C_F5D9:                               ; XREF: 0xF5BF 
    INC BC                            ;0xf5d9:   03  "." 
    NOP                               ;0xf5da:   00  "." 
;--------------------------------------
C_F5DB:                               ; XREF: 0xF5C1 
    INC A                             ;0xf5db:   3c  "<" 
    LD H,(HL)                         ;0xf5dc:   66  "f" 
    LD H,B                            ;0xf5dd:   60  "`" 
    LD H,(HL)                         ;0xf5de:   66  "f" 
    INC A                             ;0xf5df:   3c  "<" 
;--------------------------------------
C_F5E0:                               ; XREF: 0xF5C6 
    LD BC,0x1c00                      ;0xf5e0:   01 00 1c  "..."  
    INC C                             ;0xf5e3:   0c  "." 
;--------------------------------------
C_F5E4:                               ; XREF: 0xF5A6 
    LD A,H                            ;0xf5e4:   7c  "|" 
    CALL z, C_CCCC                    ;0xf5e5:   cc cc cc  "..." 
    HALT                              ;0xf5e8:   76  "v" 
    INC BC                            ;0xf5e9:   03  "." 
    NOP                               ;0xf5ea:   00  "." 
    INC A                             ;0xf5eb:   3c  "<" 
    LD H,(HL)                         ;0xf5ec:   66  "f" 
    LD A,(HL)                         ;0xf5ed:   7e  "~" 
    LD H,B                            ;0xf5ee:   60  "`" 
    INC A                             ;0xf5ef:   3c  "<" 
    LD BC,0x1c00                      ;0xf5f0:   01 00 1c  "..."  
    LD (HL),0x30                      ;0xf5f3:   36 30  "60"  
    LD A,B                            ;0xf5f5:   78  "x" 
    JR nc, $+50                       ;0xf5f6:   30 30  "00" 
    LD A,B                            ;0xf5f8:   78  "x" 
    INC BC                            ;0xf5f9:   03  "." 
    NOP                               ;0xf5fa:   00  "." 
    LD A,0x66                         ;0xf5fb:   3e 66  ">f"  
    LD H,(HL)                         ;0xf5fd:   66  "f" 
    LD A,6                            ;0xf5fe:   3e 06  ">."  
    LD A,H                            ;0xf600:   7c  "|" 
    RET po                            ;0xf601:   e0  "." 
    DEFB "`|fff", 'f' + 0x80          ;0xf602:   0xf602 to 0xf60a
    DEFB 0x1                          ;0xf608:   0x1
    DEFB 0x0                          ;0xf609:   
    DEFB 0x18                         ;0xf60a:   0x18
    DEFB 0x1                          ;0xf60b:   0x1
    DEFB 0x0                          ;0xf60c:   
;--------------------------------------
C_F60D:                               ; XREF: 0xF60A 
    JR c, C_F627                      ;0xf60d:   38 18  "8." 
    JR C_F629                         ;0xf60f:   18 18  ".." 
    INC A                             ;0xf611:   3c  "<" 
;--------------------------------------
D_F612:                               ; XREF: 0xFE33 
    DEFB 0x1                          ;0xf612:   0x1
    DEFB 0x0                          ;0xf613:   0x0
;--------------------------------------
D_F614:                               ; XREF: 0xFDC8 0xFE2B 
    DEFB 0x6                          ;0xf614:   0x6
    DEFB 0x1                          ;0xf615:   0x1
;--------------------------------------
D_F616:                               ; XREF: 0xFE82 
    DEFB 0x0                          ;0xf616:   0x0
;--------------------------------------
D_F617:                               ; XREF: 0xFDE5 
    DEFB 0xe                          ;0xf617:   0xe
;--------------------------------------
D_F618:                               ; XREF: 0xFE6F 
    DEFB 0x6                          ;0xf618:   0x6
    DEFB 0x6                          ;0xf619:   0x6
    DEFB 0x66                         ;0xf61a:   "f"
    DEFB 0x66                         ;0xf61b:   "f"
    DEFB 0x3c                         ;0xf61c:   "<"
    DEFB 0xe0                         ;0xf61d:   ('`') + 0x80
    DEFB "`flxl", 'f' + 0x80          ;0xf61e:   0xf61e to 0xf626
    DEFB 0x1                          ;0xf624:   0x1
    DEFB 0x0                          ;0xf625:   
    DEFB 0x38                         ;0xf626:   
;--------------------------------------
C_F627:                               ; XREF: 0xF60D 
    JR $+26                           ;0xf627:   18 18  ".." 
;--------------------------------------
C_F629:                               ; XREF: 0xF60F 
    JR $+26                           ;0xf629:   18 18  ".." 
    JR $+62                           ;0xf62b:   18 3c  ".<" 
    INC BC                            ;0xf62d:   03  "." 
    NOP                               ;0xf62e:   00  "." 
    LD L,H                            ;0xf62f:   6c  "l" 
    CP 0xd6                           ;0xf630:   fe d6  ".." 
    SUB 0xc6                          ;0xf632:   d6 c6  ".." 
    INC BC                            ;0xf634:   03  "." 
    NOP                               ;0xf635:   00  "." 
    CALL c, 0x6666                    ;0xf636:   dc 66 66  ".ff" 
    DEFB 0x66                         ;0xf639:   
    DEFB 0x66                         ;0xf63a:   
    DEFB 0x3                          ;0xf63b:   0x3
    DEFB 0x0                          ;0xf63c:   
    DEFB "<fff<"                      ;0xf63d:   0xf63d to 0xf642
;--------------------------------------
C_F642:                               ; XREF: 0xF628 
    INC BC                            ;0xf642:   03  "." 
    NOP                               ;0xf643:   00  "." 
;--------------------------------------
C_F644:                               ; XREF: 0xF62A 
    CALL c, 0x6666                    ;0xf644:   dc 66 66  ".ff" 
    LD A,H                            ;0xf647:   7c  "|" 
    LD H,B                            ;0xf648:   60  "`" 
    RET p                             ;0xf649:   f0  "." 
    LD (BC),A                         ;0xf64a:   02  "." 
    NOP                               ;0xf64b:   00  "." 
    HALT                              ;0xf64c:   76  "v" 
    CALL z, 0x7ccc                    ;0xf64d:   cc cc 7c  "..|" 
    INC C                             ;0xf650:   0c  "." 
    LD E,2                            ;0xf651:   1e 02  ".."  
    NOP                               ;0xf653:   00  "." 
    CALL c, 0x6076                    ;0xf654:   dc 76 60  ".v`" 
    LD H,B                            ;0xf657:   60  "`" 
    RET p                             ;0xf658:   f0  "." 
    INC BC                            ;0xf659:   03  "." 
    NOP                               ;0xf65a:   00  "." 
    INC A                             ;0xf65b:   3c  "<" 
    LD H,B                            ;0xf65c:   60  "`" 
    INC A                             ;0xf65d:   3c  "<" 
    LD B,0x7c                         ;0xf65e:   06 7c  ".|"  
    LD BC,0x3000                      ;0xf660:   01 00 30  "..0"  
    JR nc, $+126                      ;0xf663:   30 7c  "0|" 
    JR nc, C_F697                     ;0xf665:   30 30  "00" 
    LD (HL),0x1c                      ;0xf667:   36 1c  "6."  
    INC BC                            ;0xf669:   03  "." 
    NOP                               ;0xf66a:   00  "." 
    DEFB "ffff>"                      ;0xf66b:   0xf66b to 0xf670
    DEFB 0x3                          ;0xf670:   0x3
    DEFB 0x0                          ;0xf671:   
    DEFB "fff<"                       ;0xf672:   0xf672 to 0xf676
    DEFB 0x18                         ;0xf676:   0x18
    DEFB 0x3                          ;0xf677:   0x3
    DEFB 0x0                          ;0xf678:   
    DEFB 0xc6                         ;0xf679:   
    DEFB 0xd6                         ;0xf67a:   
;--------------------------------------
C_F67B:                               ; XREF: 0xF676 
    SUB 0xfe                          ;0xf67b:   d6 fe  ".." 
    LD L,H                            ;0xf67d:   6c  "l" 
    INC BC                            ;0xf67e:   03  "." 
    NOP                               ;0xf67f:   00  "." 
    ADD A,0x6c                        ;0xf680:   c6 6c  ".l" 
    JR c, C_F6F0                      ;0xf682:   38 6c  "8l" 
    ADD A,3                           ;0xf684:   c6 03  ".." 
    NOP                               ;0xf686:   00  "." 
    DEFB "fff>"                       ;0xf687:   0xf687 to 0xf68b
    DEFB 0x6                          ;0xf68b:   0x6
    DEFB 0x7c                         ;0xf68c:   
    DEFB 0x2                          ;0xf68d:   0x2
    DEFB 0x0                          ;0xf68e:   
    DEFB 0x7e                         ;0xf68f:   
    DEFB 0x4c                         ;0xf690:   
    DEFB 0x18                         ;0xf691:   0x18
    DEFB 0x32                         ;0xf692:   
    DEFB 0x7e                         ;0xf693:   
    DEFB 0x1                          ;0xf694:   0x1
    DEFB 0x0                          ;0xf695:   
    DEFB 0xe                          ;0xf696:   0xe
;--------------------------------------
C_F697:                               ; XREF: 0xF665 
    JR $+26                           ;0xf697:   18 18  ".." 
    LD (HL),B                         ;0xf699:   70  "p" 
    JR $+26                           ;0xf69a:   18 18  ".." 
    LD C,1                            ;0xf69c:   0e 01  ".."  
    NOP                               ;0xf69e:   00  "." 
    JR C_F6B9                         ;0xf69f:   18 18  ".." 
    JR C_F6BB                         ;0xf6a1:   18 18  ".." 
    JR C_F6BD                         ;0xf6a3:   18 18  ".." 
    JR C_F6A8                         ;0xf6a5:   18 01  ".." 
    NOP                               ;0xf6a7:   00  "." 
;--------------------------------------
C_F6A8:                               ; XREF: 0xF6A5 
    LD (HL),B                         ;0xf6a8:   70  "p" 
    JR C_F6C3                         ;0xf6a9:   18 18  ".." 
    LD C,0x18                         ;0xf6ab:   0e 18  ".."  
    JR C_F71F                         ;0xf6ad:   18 70  ".p" 
    LD BC,0x7600                      ;0xf6af:   01 00 76  "..v"  
    CALL c, 0x6                       ;0xf6b2:   dc 06 00  "..." 
    JR c, C_F723                      ;0xf6b5:   38 6c  "8l" 
    ADD A,0xc6                        ;0xf6b7:   c6 c6  ".." 
;--------------------------------------
C_F6B9:                               ; XREF: 0xF69F 
    ADD A,0x6c                        ;0xf6b9:   c6 6c  ".l" 
;--------------------------------------
C_F6BB:                               ; XREF: 0xF6A1 
    JR c, C_F6C0                      ;0xf6bb:   38 03  "8." 
;--------------------------------------
C_F6BD:                               ; XREF: 0xF6A3 
    NOP                               ;0xf6bd:   00  "." 
    INC A                             ;0xf6be:   3c  "<" 
    INC A                             ;0xf6bf:   3c  "<" 
;--------------------------------------
C_F6C0:                               ; XREF: 0xF6BB 
    INC A                             ;0xf6c0:   3c  "<" 
    INC A                             ;0xf6c1:   3c  "<" 
    LD (BC),A                         ;0xf6c2:   02  "." 
;--------------------------------------
C_F6C3:                               ; XREF: 0xF6A9 
    NOP                               ;0xf6c3:   00  "." 
    JR C_F6DE                         ;0xf6c4:   18 18  ".." 
    RST 0x38                          ;0xf6c6:   ff  "." 
    LD (BC),A                         ;0xf6c7:   02  "." 
    NOP                               ;0xf6c8:   00  "." 
    RST 0x38                          ;0xf6c9:   ff  "." 
    LD (BC),A                         ;0xf6ca:   02  "." 
    NOP                               ;0xf6cb:   00  "." 
    INC H                             ;0xf6cc:   24  "$" 
    INC H                             ;0xf6cd:   24  "$" 
    INC H                             ;0xf6ce:   24  "$" 
    DAA                               ;0xf6cf:   27  "'" 
    DAA                               ;0xf6d0:   27  "'" 
    INC H                             ;0xf6d1:   24  "$" 
    INC H                             ;0xf6d2:   24  "$" 
    INC H                             ;0xf6d3:   24  "$" 
    INC H                             ;0xf6d4:   24  "$" 
    INC H                             ;0xf6d5:   24  "$" 
    DAA                               ;0xf6d6:   27  "'" 
    JR nz, C_F6F9                     ;0xf6d7:   20 20  "  " 
    CCF                               ;0xf6d9:   3f  "?" 
    INC B                             ;0xf6da:   04  "." 
    NOP                               ;0xf6db:   00  "." 
    RST 0x38                          ;0xf6dc:   ff  "." 
    LD (BC),A                         ;0xf6dd:   02  "." 
;--------------------------------------
C_F6DE:                               ; XREF: 0xF6C4 
    NOP                               ;0xf6de:   00  "." 
    RST 0x38                          ;0xf6df:   ff  "." 
    JR C_F6FA                         ;0xf6e0:   18 18  ".." 
    INC H                             ;0xf6e2:   24  "$" 
    INC H                             ;0xf6e3:   24  "$" 
    INC H                             ;0xf6e4:   24  "$" 
    INC H                             ;0xf6e5:   24  "$" 
    INC H                             ;0xf6e6:   24  "$" 
    INC H                             ;0xf6e7:   24  "$" 
    INC H                             ;0xf6e8:   24  "$" 
    INC H                             ;0xf6e9:   24  "$" 
    LD (BC),A                         ;0xf6ea:   02  "." 
    NOP                               ;0xf6eb:   00  "." 
    CCF                               ;0xf6ec:   3f  "?" 
    JR nz, C_F70F                     ;0xf6ed:   20 20  "  " 
    DAA                               ;0xf6ef:   27  "'" 
;--------------------------------------
C_F6F0:                               ; XREF: 0xF682 
    INC H                             ;0xf6f0:   24  "$" 
    INC H                             ;0xf6f1:   24  "$" 
    INC H                             ;0xf6f2:   24  "$" 
    INC H                             ;0xf6f3:   24  "$" 
    DAA                               ;0xf6f4:   27  "'" 
    JR nz, C_F717                     ;0xf6f5:   20 20  "  " 
    DAA                               ;0xf6f7:   27  "'" 
    INC H                             ;0xf6f8:   24  "$" 
;--------------------------------------
C_F6F9:                               ; XREF: 0xF6D7 
    INC H                             ;0xf6f9:   24  "$" 
;--------------------------------------
C_F6FA:                               ; XREF: 0xF6E0 
    INC H                             ;0xf6fa:   24  "$" 
    INC H                             ;0xf6fb:   24  "$" 
    INC H                             ;0xf6fc:   24  "$" 
    CALL po, 0x24e4                   ;0xf6fd:   e4 e4 24  "..$" 
    INC H                             ;0xf700:   24  "$" 
    INC H                             ;0xf701:   24  "$" 
    INC H                             ;0xf702:   24  "$" 
    INC H                             ;0xf703:   24  "$" 
    CALL po, 0x404                    ;0xf704:   e4 04 04  "..." 
    CALL m, 0x4                       ;0xf707:   fc 04 00  "..." 
    RST 0x38                          ;0xf70a:   ff  "." 
    LD (BC),A                         ;0xf70b:   02  "." 
    NOP                               ;0xf70c:   00  "." 
    RST 0x38                          ;0xf70d:   ff  "." 
    LD (BC),A                         ;0xf70e:   02  "." 
;--------------------------------------
C_F70F:                               ; XREF: 0xF6ED 
    NOP                               ;0xf70f:   00  "." 
    INC H                             ;0xf710:   24  "$" 
    INC H                             ;0xf711:   24  "$" 
    RST 0x20                          ;0xf712:   e7  "." 
    LD (BC),A                         ;0xf713:   02  "." 
    NOP                               ;0xf714:   00  "." 
    RST 0x38                          ;0xf715:   ff  "." 
    INC B                             ;0xf716:   04  "." 
;--------------------------------------
C_F717:                               ; XREF: 0xF6F5 
    NOP                               ;0xf717:   00  "." 
    CALL m, 0x404                     ;0xf718:   fc 04 04  "..." 
    CALL po, 0x2424                   ;0xf71b:   e4 24 24  ".$$" 
    INC H                             ;0xf71e:   24  "$" 
;--------------------------------------
C_F71F:                               ; XREF: 0xF6AD 
    INC H                             ;0xf71f:   24  "$" 
    CALL po, 0x404                    ;0xf720:   e4 04 04  "..." 
;--------------------------------------
C_F723:                               ; XREF: 0xF6B5 
    CALL po, 0x2424                   ;0xf723:   e4 24 24  ".$$" 
    LD (BC),A                         ;0xf726:   02  "." 
    NOP                               ;0xf727:   00  "." 
    RST 0x38                          ;0xf728:   ff  "." 
    LD (BC),A                         ;0xf729:   02  "." 
    NOP                               ;0xf72a:   00  "." 
    RST 0x20                          ;0xf72b:   e7  "." 
    INC H                             ;0xf72c:   24  "$" 
    INC H                             ;0xf72d:   24  "$" 
    INC H                             ;0xf72e:   24  "$" 
    INC H                             ;0xf72f:   24  "$" 
    RST 0x20                          ;0xf730:   e7  "." 
    LD (BC),A                         ;0xf731:   02  "." 
    NOP                               ;0xf732:   00  "." 
    RST 0x20                          ;0xf733:   e7  "." 
    INC H                             ;0xf734:   24  "$" 
    INC H                             ;0xf735:   24  "$" 
    INC BC                            ;0xf736:   03  "." 
    NOP                               ;0xf737:   00  "." 
    JR C_F752                         ;0xf738:   18 18  ".." 
    INC BC                            ;0xf73a:   03  "." 
    NOP                               ;0xf73b:   00  "." 
    JR C_F756                         ;0xf73c:   18 18  ".." 
    JR C_F758                         ;0xf73e:   18 18  ".." 
    JR $+8                            ;0xf740:   18 06  ".." 
    NOP                               ;0xf742:   00  "." 
    RRA                               ;0xf743:   1f  "." 
    RRA                               ;0xf744:   1f  "." 
    INC BC                            ;0xf745:   03  "." 
    NOP                               ;0xf746:   00  "." 
    JR C_F761                         ;0xf747:   18 18  ".." 
    JR $+33                           ;0xf749:   18 1f  ".." 
    RRCA                              ;0xf74b:   0f  "." 
    LD B,0                            ;0xf74c:   06 00  ".."  
    JR $+26                           ;0xf74e:   18 18  ".." 
    JR $+26                           ;0xf750:   18 18  ".." 
;--------------------------------------
C_F752:                               ; XREF: 0xF738 
    JR C_F76C                         ;0xf752:   18 18  ".." 
    JR C_F76E                         ;0xf754:   18 18  ".." 
;--------------------------------------
C_F756:                               ; XREF: 0xF73C 
    JR C_F770                         ;0xf756:   18 18  ".." 
;--------------------------------------
C_F758:                               ; XREF: 0xF73E 
    JR C_F772                         ;0xf758:   18 18  ".." 
    JR C_F75F                         ;0xf75a:   18 03  ".." 
    NOP                               ;0xf75c:   00  "." 
    RRCA                              ;0xf75d:   0f  "." 
    RRA                               ;0xf75e:   1f  "." 
;--------------------------------------
C_F75F:                               ; XREF: 0xF75A 
    JR C_F779                         ;0xf75f:   18 18  ".." 
;--------------------------------------
C_F761:                               ; XREF: 0xF747 
    JR C_F77B                         ;0xf761:   18 18  ".." 
    JR C_F77D                         ;0xf763:   18 18  ".." 
    RRA                               ;0xf765:   1f  "." 
    RRA                               ;0xf766:   1f  "." 
    JR $+26                           ;0xf767:   18 18  ".." 
    JR C_F76E                         ;0xf769:   18 03  ".." 
    NOP                               ;0xf76b:   00  "." 
;--------------------------------------
C_F76C:                               ; XREF: 0xF752 
    RET m                             ;0xf76c:   f8  "." 
    RET m                             ;0xf76d:   f8  "." 
;--------------------------------------
C_F76E:                               ; XREF: 0xF754 
    INC BC                            ;0xf76e:   03  "." 
    NOP                               ;0xf76f:   00  "." 
;--------------------------------------
C_F770:                               ; XREF: 0xF756 
    JR C_F78A                         ;0xf770:   18 18  ".." 
;--------------------------------------
C_F772:                               ; XREF: 0xF758 
    JR C_F76C                         ;0xf772:   18 f8  ".." 
    RET p                             ;0xf774:   f0  "." 
    LD B,0                            ;0xf775:   06 00  ".."  
    RST 0x38                          ;0xf777:   ff  "." 
    RST 0x38                          ;0xf778:   ff  "." 
;--------------------------------------
C_F779:                               ; XREF: 0xF75F 
    INC BC                            ;0xf779:   03  "." 
    NOP                               ;0xf77a:   00  "." 
;--------------------------------------
C_F77B:                               ; XREF: 0xF761 
    JR C_F795                         ;0xf77b:   18 18  ".." 
;--------------------------------------
C_F77D:                               ; XREF: 0xF763 
    JR $+1                            ;0xf77d:   18 ff  ".." 
    RST 0x38                          ;0xf77f:   ff  "." 
    LD B,0                            ;0xf780:   06 00  ".."  
    RET p                             ;0xf782:   f0  "." 
;--------------------------------------
C_F783:                               ; XREF: 0xFD3C 
    RET m                             ;0xf783:   f8  "." 
    JR $+26                           ;0xf784:   18 18  ".." 
    JR C_F7A0                         ;0xf786:   18 18  ".." 
    JR $+26                           ;0xf788:   18 18  ".." 
;--------------------------------------
C_F78A:                               ; XREF: 0xF770 
    RET m                             ;0xf78a:   f8  "." 
    RET m                             ;0xf78b:   f8  "." 
    JR $+26                           ;0xf78c:   18 18  ".." 
    JR C_F793                         ;0xf78e:   18 03  ".." 
    NOP                               ;0xf790:   00  "." 
    RST 0x38                          ;0xf791:   ff  "." 
    RST 0x38                          ;0xf792:   ff  "." 
;--------------------------------------
C_F793:                               ; XREF: 0xF78E 
    JR C_F7AD                         ;0xf793:   18 18  ".." 
;--------------------------------------
C_F795:                               ; XREF: 0xF77B 
    JR $+26                           ;0xf795:   18 18  ".." 
    JR $+26                           ;0xf797:   18 18  ".." 
    RST 0x38                          ;0xf799:   ff  "." 
    RST 0x38                          ;0xf79a:   ff  "." 
    JR $+26                           ;0xf79b:   18 18  ".." 
    JR C_F817                         ;0xf79d:   18 78  ".x" 
    INC C                             ;0xf79f:   0c  "." 
;--------------------------------------
C_F7A0:                               ; XREF: 0xF786 
    LD A,H                            ;0xf7a0:   7c  "|" 
    CALL z, 0x176                     ;0xf7a1:   cc 76 01  ".v." 
    NOP                               ;0xf7a4:   00  "." 
    CP 1                              ;0xf7a5:   fe 01  ".." 
    NOP                               ;0xf7a7:   00  "." 
    DEFB "<fff<"                      ;0xf7a8:   0xf7a8 to 0xf7ad
;--------------------------------------
C_F7AD:                               ; XREF: 0xF793 
    LD BC,0x7e00                      ;0xf7ad:   01 00 7e  "..~"  
    LD BC,0x3800                      ;0xf7b0:   01 00 38  "..8"  
    LD B,H                            ;0xf7b3:   44  "D" 
    JR c, C_F7BB                      ;0xf7b4:   38 05  "8." 
    NOP                               ;0xf7b6:   00  "." 
    INC A                             ;0xf7b7:   3c  "<" 
    LD H,(HL)                         ;0xf7b8:   66  "f" 
    LD H,B                            ;0xf7b9:   60  "`" 
    RET m                             ;0xf7ba:   f8  "." 
;--------------------------------------
C_F7BB:                               ; XREF: 0xF7B4 
    LD H,B                            ;0xf7bb:   60  "`" 
    LD H,(HL)                         ;0xf7bc:   66  "f" 
    CP 1                              ;0xf7bd:   fe 01  ".." 
    NOP                               ;0xf7bf:   00  "." 
    JR c, C_F806                      ;0xf7c0:   38 44  "8D" 
    CP D                              ;0xf7c2:   ba  "." 
    AND D                             ;0xf7c3:   a2  "." 
    CP D                              ;0xf7c4:   ba  "." 
    LD B,H                            ;0xf7c5:   44  "D" 
    JR c, C_F7C9                      ;0xf7c6:   38 01  "8." 
    NOP                               ;0xf7c8:   00  "." 
;--------------------------------------
C_F7C9:                               ; XREF: 0xF7C6 
    LD A,(HL)                         ;0xf7c9:   7e  "~" 
    CALL p, 0x74f4                    ;0xf7ca:   f4 f4 74  "..t" 
    INC (HL)                          ;0xf7cd:   34  "4" 
    INC (HL)                          ;0xf7ce:   34  "4" 
    INC (HL)                          ;0xf7cf:   34  "4" 
    LD BC,0x1e00                      ;0xf7d0:   01 00 1e  "..."  
    JR nc, C_F80D                     ;0xf7d3:   30 38  "08" 
    LD L,H                            ;0xf7d5:   6c  "l" 
    JR c, C_F7F0                      ;0xf7d6:   38 18  "8." 
    RET p                             ;0xf7d8:   f0  "." 
    LD BC,0x1800                      ;0xf7d9:   01 00 18  "..."  
    JR C_F85C                         ;0xf7dc:   18 7e  ".~" 
    JR C_F7F8                         ;0xf7de:   18 18  ".." 
    JR $+26                           ;0xf7e0:   18 18  ".." 
    LD BC,0x4000                      ;0xf7e2:   01 00 40  "..@"  
    RET nz                            ;0xf7e5:   c0  "." 
    DEFB "DLT"                        ;0xf7e6:   0xf7e6 to 0xf7e9
    DEFB 0x1e                         ;0xf7e9:   0x1e
    DEFB 0x4                          ;0xf7ea:   0x4
    DEFB 0x1                          ;0xf7eb:   0x1
    DEFB 0x0                          ;0xf7ec:   
    DEFB 0x40                         ;0xf7ed:   
    DEFB 0xc0                         ;0xf7ee:   
    DEFB "LRD"                        ;0xf7ef:   0xf7ef to 0xf7f2
    DEFB 0x8                          ;0xf7f2:   0x8
    DEFB 0x1e                         ;0xf7f3:   0x1e
    DEFB 0x1                          ;0xf7f4:   0x1
    DEFB 0x0                          ;0xf7f5:   
    DEFB 0xe0                         ;0xf7f6:   
    DEFB 0x10                         ;0xf7f7:   0x10
;--------------------------------------
C_F7F8:                               ; XREF: 0xF7DE 
    LD H,D                            ;0xf7f8:   62  "b" 
    LD D,0xea                         ;0xf7f9:   16 ea  ".."  
    RRCA                              ;0xf7fb:   0f  "." 
    LD (BC),A                         ;0xf7fc:   02  "." 
    LD (BC),A                         ;0xf7fd:   02  "." 
    NOP                               ;0xf7fe:   00  "." 
    INC SP                            ;0xf7ff:   33  "3" 
;--------------------------------------
D_F800:                               ; XREF: 0xF4D0 
    DEFB 0x66                         ;0xf800:   "f"
    DEFB 0xcc                         ;0xf801:   ('L') + 0x80
    DEFB 0x66                         ;0xf802:   "f"
    DEFB 0x33                         ;0xf803:   "3"
    DEFB 0x3                          ;0xf804:   0x3
    DEFB 0x0                          ;0xf805:   0x0
;--------------------------------------
C_F806:                               ; XREF: 0xF7C0 
    CALL z, 0x3366                    ;0xf806:   cc 66 33  ".f3" 
    LD H,(HL)                         ;0xf809:   66  "f" 
    CALL z, 0x2                       ;0xf80a:   cc 02 00  "..." 
;--------------------------------------
C_F80D:                               ; XREF: 0xF7D3 
    RET po                            ;0xf80d:   e0  "." 
    SUB B                             ;0xf80e:   90  "." 
    SUB H                             ;0xf80f:   94  "." 
    XOR 0x84                          ;0xf810:   ee 84  ".." 
    ADD A,H                           ;0xf812:   84  "." 
    ADD A,E                           ;0xf813:   83  "." 
    LD BC,0x1800                      ;0xf814:   01 00 18  "..."  
;--------------------------------------
C_F817:                               ; XREF: 0xF79D 
    LD BC,0x1800                      ;0xf817:   01 00 18  "..."  
    JR nc, $+104                      ;0xf81a:   30 66  "0f" 
    LD H,(HL)                         ;0xf81c:   66  "f" 
    INC A                             ;0xf81d:   3c  "<" 
    LD BC,0x1800                      ;0xf81e:   01 00 18  "..."  
    LD BC,0x1800                      ;0xf821:   01 00 18  "..."  
    JR $+26                           ;0xf824:   18 18  ".." 
    JR C_F840                         ;0xf826:   18 18  ".." 
    LD BC,0x1c00                      ;0xf828:   01 00 1c  "..."  
    LD (HL),0x30                      ;0xf82b:   36 30  "60"  
    CALL m, 0x3030                    ;0xf82d:   fc 30 30  ".00" 
    RET po                            ;0xf830:   e0  "." 
    LD (BC),A                         ;0xf831:   02  "." 
    NOP                               ;0xf832:   00  "." 
    JR C_F871                         ;0xf833:   18 3c  ".<" 
    LD H,(HL)                         ;0xf835:   66  "f" 
    LD H,B                            ;0xf836:   60  "`" 
    LD H,(HL)                         ;0xf837:   66  "f" 
    INC A                             ;0xf838:   3c  "<" 
    JR C_F83C                         ;0xf839:   18 01  ".." 
    NOP                               ;0xf83b:   00  "." 
;--------------------------------------
C_F83C:                               ; XREF: 0xF839 
    LD H,(HL)                         ;0xf83c:   66  "f" 
    LD B,0                            ;0xf83d:   06 00  ".."  
    INC C                             ;0xf83f:   0c  "." 
;--------------------------------------
C_F840:                               ; XREF: 0xF826 
    JR C_F872                         ;0xf840:   18 30  ".0" 
    DEC B                             ;0xf842:   05  "." 
    NOP                               ;0xf843:   00  "." 
    DJNZ C_F87E                       ;0xf844:   10 38  ".8" 
    LD L,H                            ;0xf846:   6c  "l" 
    ADD A,5                           ;0xf847:   c6 05  ".." 
    NOP                               ;0xf849:   00  "." 
    ADD A,0xcc                        ;0xf84a:   c6 cc  ".." 
    JR C_F86E                         ;0xf84c:   18 20  ". " 
    LD E,E                            ;0xf84e:   5b  "[" 
    IN A,(0x0001)                     ;0xf84f:   db 01  ".." 
    NOP                               ;0xf851:   00  "." 
    LD B,B                            ;0xf852:   40  "@" 
    RET nz                            ;0xf853:   c0  "." 
    DEFB "FIF"                        ;0xf854:   0xf854 to 0xf857
    DEFB 0x9                          ;0xf857:   0x9
    DEFB 0x6                          ;0xf858:   0x6
    DEFB 0x1                          ;0xf859:   0x1
    DEFB 0x0                          ;0xf85a:   
;--------------------------------------
C_F85B:                               ; XREF: 0xF7F7 
    RET po                            ;0xf85b:   e0  "." 
;--------------------------------------
C_F85C:                               ; XREF: 0xF7DC 
    DJNZ C_F8C4                       ;0xf85c:   10 66  ".f" 
    ADD HL,DE                         ;0xf85e:   19  "." 
    AND 9                             ;0xf85f:   e6 09  ".." 
    LD B,1                            ;0xf861:   06 01  ".."  
    NOP                               ;0xf863:   00  "." 
    RET p                             ;0xf864:   f0  "." 
    ADD A,B                           ;0xf865:   80  "." 
    AND 0x19                          ;0xf866:   e6 19  ".." 
    AND 9                             ;0xf868:   e6 09  ".." 
    LD B,1                            ;0xf86a:   06 01  ".."  
    NOP                               ;0xf86c:   00  "." 
    RET p                             ;0xf86d:   f0  "." 
;--------------------------------------
C_F86E:                               ; XREF: 0xF84C 
    DJNZ C_F896                       ;0xf86e:   10 26  ".&" 
    LD C,C                            ;0xf870:   49  "I" 
;--------------------------------------
C_F871:                               ; XREF: 0xF833 
    ADD A,(HL)                        ;0xf871:   86  "." 
;--------------------------------------
C_F872:                               ; XREF: 0xF840 
    ADD HL,BC                         ;0xf872:   09  "." 
    LD B,1                            ;0xf873:   06 01  ".."  
    NOP                               ;0xf875:   00  "." 
    JR c, $-56                        ;0xf876:   38 c6  "8." 
    ADD A,0xf8                        ;0xf878:   c6 f8  ".." 
    ADD A,0xc6                        ;0xf87a:   c6 c6  ".." 
    RET m                             ;0xf87c:   f8  "." 
    LD (BC),A                         ;0xf87d:   02  "." 
;--------------------------------------
C_F87E:                               ; XREF: 0xF844 
    NOP                               ;0xf87e:   00  "." 
    JR c, $+110                       ;0xf87f:   38 6c  "8l" 
    ADD A,0xc6                        ;0xf881:   c6 c6  ".." 
    LD L,H                            ;0xf883:   6c  "l" 
    JR c, $+4                         ;0xf884:   38 02  "8." 
    NOP                               ;0xf886:   00  "." 
    JR c, C_F905                      ;0xf887:   38 7c  "8|" 
    CP 0xfe                           ;0xf889:   fe fe  ".." 
    LD A,H                            ;0xf88b:   7c  "|" 
    JR c, C_F88F                      ;0xf88c:   38 01  "8." 
    NOP                               ;0xf88e:   00  "." 
;--------------------------------------
C_F88F:                               ; XREF: 0xF88C 
    LD H,(HL)                         ;0xf88f:   66  "f" 
    LD H,(HL)                         ;0xf890:   66  "f" 
    INC A                             ;0xf891:   3c  "<" 
    JR $+128                          ;0xf892:   18 7e  ".~" 
    JR C_F8D2                         ;0xf894:   18 3c  ".<" 
;--------------------------------------
C_F896:                               ; XREF: 0xF86E 
    LD BC,0x3c00                      ;0xf896:   01 00 3c  "..<"  
    LD B,D                            ;0xf899:   42  "B" 
    CP C                              ;0xf89a:   b9  "." 
    AND L                             ;0xf89b:   a5  "." 
    CP C                              ;0xf89c:   b9  "." 
    XOR C                             ;0xf89d:   a9  "." 
    LD H,(HL)                         ;0xf89e:   66  "f" 
    INC A                             ;0xf89f:   3c  "<" 
    EI                                ;0xf8a0:   fb  "." 
    DEFB "UQQ"                        ;0xf8a1:   0xf8a1 to 0xf8a4
    DEFB 0x4                          ;0xf8a4:   0x4
    DEFB 0x0                          ;0xf8a5:   
    DEFB 0xc                          ;0xf8a6:   0xc
    DEFB 0x30                         ;0xf8a7:   
    DEFB 0x18                         ;0xf8a8:   0x18
    DEFB "<f~f", 0x66                 ;0xf8a9:   0xf8a9 to 0xf8aa
    DEFB 0x0                          ;0xf8ae:   
    DEFB 0xc                          ;0xf8af:   0xc
    DEFB "0~`|", 0x7e                 ;0xf8b0:   0xf8b0 to 0xf8b1
    LD A,(HL)                         ;0xf8b5:   7e  "~" 
    LD BC,0xc00                       ;0xf8b6:   01 00 0c  "..."  
    JR nc, $+128                      ;0xf8b9:   30 7e  "0~" 
    JR C_F8D5                         ;0xf8bb:   18 18  ".." 
    JR C_F93D                         ;0xf8bd:   18 7e  ".~" 
    LD BC,0xc00                       ;0xf8bf:   01 00 0c  "..."  
    DEFB "0<fff<"                     ;0xf8c2:   0xf8c2 to 0xf8c8
;--------------------------------------
C_F8C8:                               ; XREF: 0xFEEF 
    LD BC,0xc00                       ;0xf8c8:   01 00 0c  "..."  
    DEFB "0ffff<"                     ;0xf8cb:   0xf8cb to 0xf8d1
    DEFB 0x1                          ;0xf8d1:   0x1
;--------------------------------------
C_F8D2:                               ; XREF: 0xF894 
    NOP                               ;0xf8d2:   00  "." 
    JR $+104                          ;0xf8d3:   18 66  ".f" 
;--------------------------------------
C_F8D5:                               ; XREF: 0xF8BB 
    JR C_F913                         ;0xf8d5:   18 3c  ".<" 
    LD H,(HL)                         ;0xf8d7:   66  "f" 
    LD A,(HL)                         ;0xf8d8:   7e  "~" 
    LD H,(HL)                         ;0xf8d9:   66  "f" 
    LD BC,0x1800                      ;0xf8da:   01 00 18  "..."  
    LD H,(HL)                         ;0xf8dd:   66  "f" 
    LD A,(HL)                         ;0xf8de:   7e  "~" 
    LD H,B                            ;0xf8df:   60  "`" 
    LD A,H                            ;0xf8e0:   7c  "|" 
    LD H,B                            ;0xf8e1:   60  "`" 
    LD A,(HL)                         ;0xf8e2:   7e  "~" 
    LD BC,0x1800                      ;0xf8e3:   01 00 18  "..."  
    LD H,(HL)                         ;0xf8e6:   66  "f" 
    LD A,(HL)                         ;0xf8e7:   7e  "~" 
    JR C_F902                         ;0xf8e8:   18 18  ".." 
    JR C_F96A                         ;0xf8ea:   18 7e  ".~" 
    LD BC,0x1800                      ;0xf8ec:   01 00 18  "..."  
    DEFB "f<fff<"                     ;0xf8ef:   0xf8ef to 0xf8f5
    DEFB 0x1                          ;0xf8f5:   0x1
    DEFB 0x0                          ;0xf8f6:   
    DEFB 0x18                         ;0xf8f7:   0x18
    DEFB "fffff<"                     ;0xf8f8:   0xf8f8 to 0xf8fe
    DEFB 0x1                          ;0xf8fe:   0x1
    DEFB 0x0                          ;0xf8ff:   
;--------------------------------------
C_F900:                               ; XREF: 0xF8C2 
    JR nc, $+14                       ;0xf900:   30 0c  "0." 
;--------------------------------------
C_F902:                               ; XREF: 0xF8E8 
    JR $+62                           ;0xf902:   18 3c  ".<" 
    LD H,(HL)                         ;0xf904:   66  "f" 
;--------------------------------------
C_F905:                               ; XREF: 0xF887 
    LD A,(HL)                         ;0xf905:   7e  "~" 
    LD H,(HL)                         ;0xf906:   66  "f" 
    LD BC,0x3000                      ;0xf907:   01 00 30  "..0"  
    INC C                             ;0xf90a:   0c  "." 
    LD A,(HL)                         ;0xf90b:   7e  "~" 
    LD H,B                            ;0xf90c:   60  "`" 
    LD A,H                            ;0xf90d:   7c  "|" 
    LD H,B                            ;0xf90e:   60  "`" 
    LD A,(HL)                         ;0xf90f:   7e  "~" 
    LD BC,0x3000                      ;0xf910:   01 00 30  "..0"  
;--------------------------------------
C_F913:                               ; XREF: 0xF8D5 
    INC C                             ;0xf913:   0c  "." 
    LD A,(HL)                         ;0xf914:   7e  "~" 
    JR C_F92F                         ;0xf915:   18 18  ".." 
    JR C_F997                         ;0xf917:   18 7e  ".~" 
    LD BC,0x3000                      ;0xf919:   01 00 30  "..0"  
    INC C                             ;0xf91c:   0c  "." 
    DEFB "<fff<"                      ;0xf91d:   0xf91d to 0xf922
    DEFB 0x1                          ;0xf922:   0x1
;--------------------------------------
C_F923:                               ; XREF: 0xFE68 
    NOP                               ;0xf923:   00  "." 
    JR nc, $+14                       ;0xf924:   30 0c  "0." 
    DEFB "ffff<"                      ;0xf926:   0xf926 to 0xf92b
    DEFB 0x1                          ;0xf92b:   0x1
    DEFB 0x0                          ;0xf92c:   
    DEFB 0x66                         ;0xf92d:   
    DEFB 0x1                          ;0xf92e:   0x1
;--------------------------------------
C_F92F:                               ; XREF: 0xF915 
    NOP                               ;0xf92f:   00  "." 
;--------------------------------------
C_F930:                               ; XREF: 0xF8B0 
    LD H,(HL)                         ;0xf930:   66  "f" 
    INC A                             ;0xf931:   3c  "<" 
    JR C_F94C                         ;0xf932:   18 18  ".." 
    JR C_F937                         ;0xf934:   18 01  ".." 
    NOP                               ;0xf936:   00  "." 
;--------------------------------------
C_F937:                               ; XREF: 0xF934 
    LD H,(HL)                         ;0xf937:   66  "f" 
    LD BC,0x1800                      ;0xf938:   01 00 18  "..."  
    INC A                             ;0xf93b:   3c  "<" 
    LD H,(HL)                         ;0xf93c:   66  "f" 
;--------------------------------------
C_F93D:                               ; XREF: 0xF8BD 
    LD A,(HL)                         ;0xf93d:   7e  "~" 
    LD H,(HL)                         ;0xf93e:   66  "f" 
    LD BC,0x6600                      ;0xf93f:   01 00 66  "..f"  
    LD BC,0x7e00                      ;0xf942:   01 00 7e  "..~"  
    LD H,B                            ;0xf945:   60  "`" 
    LD A,H                            ;0xf946:   7c  "|" 
    LD H,B                            ;0xf947:   60  "`" 
;--------------------------------------
C_F948:                               ; XREF: 0xFE55 
    LD A,(HL)                         ;0xf948:   7e  "~" 
    LD BC,0x6600                      ;0xf949:   01 00 66  "..f"  
;--------------------------------------
C_F94C:                               ; XREF: 0xF932 
    LD BC,0x7e00                      ;0xf94c:   01 00 7e  "..~"  
    JR C_F969                         ;0xf94f:   18 18  ".." 
    JR C_F9D1                         ;0xf951:   18 7e  ".~" 
    LD BC,0x6600                      ;0xf953:   01 00 66  "..f"  
    LD BC,0x3c00                      ;0xf956:   01 00 3c  "..<"  
    DEFB "fff<", 0x66                 ;0xf959:   0xf959 to 0xf95a
    DEFB 0x0                          ;0xf95e:   
    DEFB 0x66                         ;0xf95f:   
    DEFB 0x1                          ;0xf960:   0x1
    DEFB 0x0                          ;0xf961:   
    DEFB "ffff<"                      ;0xf962:   0xf962 to 0xf967
    DEFB 0x1                          ;0xf967:   0x1
    DEFB 0x0                          ;0xf968:   
;--------------------------------------
C_F969:                               ; XREF: 0xF94F 
    INC A                             ;0xf969:   3c  "<" 
;--------------------------------------
C_F96A:                               ; XREF: 0xF8EA 
    LD H,(HL)                         ;0xf96a:   66  "f" 
    RET nz                            ;0xf96b:   c0  "." 
    RET nz                            ;0xf96c:   c0  "." 
    LD H,(HL)                         ;0xf96d:   66  "f" 
    INC A                             ;0xf96e:   3c  "<" 
;--------------------------------------
C_F96F:                               ; XREF: 0xFE8A 
    LD BC,0x1800                      ;0xf96f:   01 00 18  "..."  
;--------------------------------------
C_F972:                               ; XREF: 0xF9B0 
    LD A,0x78                         ;0xf972:   3e 78  ">x"  
    RET c                             ;0xf974:   d8  "." 
    CP 0xd8                           ;0xf975:   fe d8  ".." 
    RET c                             ;0xf977:   d8  "." 
    SBC A,1                           ;0xf978:   de 01  ".." 
    NOP                               ;0xf97a:   00  "." 
    JR C_F97E                         ;0xf97b:   18 01  ".." 
    NOP                               ;0xf97d:   00  "." 
;--------------------------------------
C_F97E:                               ; XREF: 0xF97B 
    JR $+62                           ;0xf97e:   18 3c  ".<" 
    LD H,(HL)                         ;0xf980:   66  "f" 
    LD A,(HL)                         ;0xf981:   7e  "~" 
    LD H,(HL)                         ;0xf982:   66  "f" 
    LD BC,0x7a00                      ;0xf983:   01 00 7a  "..z"  
    CALL z, 0xd6ce                    ;0xf986:   cc ce d6  "..." 
    AND 0x66                          ;0xf989:   e6 66  ".f" 
    CP H                              ;0xf98b:   bc  "." 
    LD BC,0x3200                      ;0xf98c:   01 00 32  "..2"  
    LD C,H                            ;0xf98f:   4c  "L" 
    LD BC,0x6600                      ;0xf990:   01 00 66  "..f"  
    DEFB "vnf", 0x6e                  ;0xf993:   0xf993 to 0xf994
;--------------------------------------
C_F997:                               ; XREF: 0xF917 
    NOP                               ;0xf997:   00  "." 
    LD (0x14c),A                      ;0xf998:   32 4c 01  "2L."  
    NOP                               ;0xf99b:   00  "." 
    INC A                             ;0xf99c:   3c  "<" 
    LD H,(HL)                         ;0xf99d:   66  "f" 
    LD A,(HL)                         ;0xf99e:   7e  "~" 
    LD H,(HL)                         ;0xf99f:   66  "f" 
    LD BC,0x3200                      ;0xf9a0:   01 00 32  "..2"  
    DEFB "L<fff<", 0x3c               ;0xf9a3:   0xf9a3 to 0xf9a4
    DEFB 0x0                          ;0xf9aa:   
    DEFB 0xc0                         ;0xf9ab:   
    DEFB 0x30                         ;0xf9ac:   
    DEFB 0xc                          ;0xf9ad:   0xc
    DEFB 0x30                         ;0xf9ae:   
    DEFB 0xcc                         ;0xf9af:   
    DEFB 0x30                         ;0xf9b0:   
    DEFB 0xc0                         ;0xf9b1:   
;--------------------------------------
C_F9B2:                               ; XREF: 0xFE73 
    LD BC,0x600                       ;0xf9b2:   01 00 06  "..."  
    JR C_FA17                         ;0xf9b5:   18 60  ".`" 
    JR C_FA1F                         ;0xf9b7:   18 66  ".f" 
    JR $+8                            ;0xf9b9:   18 06  ".." 
    LD BC,0x600                       ;0xf9bb:   01 00 06  "..."  
    INC C                             ;0xf9be:   0c  "." 
    LD A,(HL)                         ;0xf9bf:   7e  "~" 
;--------------------------------------
C_F9C0:                               ; XREF: 0xFE58 
    JR C_FA40                         ;0xf9c0:   18 7e  ".~" 
    JR nc, C_FA24                     ;0xf9c2:   30 60  "0`" 
    INC BC                            ;0xf9c4:   03  "." 
    NOP                               ;0xf9c5:   00  "." 
    LD (0x14c),A                      ;0xf9c6:   32 4c 01  "2L."  
    NOP                               ;0xf9c9:   00  "." 
    LD A,(HL)                         ;0xf9ca:   7e  "~" 
    LD (BC),A                         ;0xf9cb:   02  "." 
    NOP                               ;0xf9cc:   00  "." 
    INC C                             ;0xf9cd:   0c  "." 
    JR nc, $+122                      ;0xf9ce:   30 78  "0x" 
    INC C                             ;0xf9d0:   0c  "." 
;--------------------------------------
C_F9D1:                               ; XREF: 0xF951 
    LD A,H                            ;0xf9d1:   7c  "|" 
    CALL z, 0x176                     ;0xf9d2:   cc 76 01  ".v." 
    NOP                               ;0xf9d5:   00  "." 
;--------------------------------------
D_F9D6:                               ; XREF: 0xFE26 
    DEFB 0xc                          ;0xf9d6:   0xc
    DEFB 0x30                         ;0xf9d7:   "0"
    DEFB 0x3c                         ;0xf9d8:   "<"
    DEFB 0x66                         ;0xf9d9:   "f"
    DEFB 0x7e                         ;0xf9da:   "~"
    DEFB 0x60                         ;0xf9db:   "`"
    DEFB 0x3c                         ;0xf9dc:   "<"
;--------------------------------------
C_F9DD:                               ; XREF: 0xFDC1 
    LD BC,0xc00                       ;0xf9dd:   01 00 0c  "..."  
    JR nc, C_F9E3                     ;0xf9e0:   30 01  "0." 
    NOP                               ;0xf9e2:   00  "." 
;--------------------------------------
C_F9E3:                               ; XREF: 0xF9E0 
    JR c, C_F9FD                      ;0xf9e3:   38 18  "8." 
    JR $+62                           ;0xf9e5:   18 3c  ".<" 
    LD BC,0xc00                       ;0xf9e7:   01 00 0c  "..."  
    JR nc, C_F9ED                     ;0xf9ea:   30 01  "0." 
    NOP                               ;0xf9ec:   00  "." 
;--------------------------------------
C_F9ED:                               ; XREF: 0xF9EA 
    INC A                             ;0xf9ed:   3c  "<" 
    LD H,(HL)                         ;0xf9ee:   66  "f" 
    LD H,(HL)                         ;0xf9ef:   66  "f" 
    INC A                             ;0xf9f0:   3c  "<" 
    LD BC,0xc00                       ;0xf9f1:   01 00 0c  "..."  
    JR nc, S_F9F7                     ;0xf9f4:   30 01  "0." 
    NOP                               ;0xf9f6:   00  "." 
;--------------------------------------
S_F9F7:                               ; XREF: 0xF9F4 
    DEFB "fff>"                       ;0xf9f7:   0xf9f7 to 0xf9fb
    DEFB 0x1                          ;0xf9fb:   0x1
    DEFB 0x0                          ;0xf9fc:   
;--------------------------------------
C_F9FD:                               ; XREF: 0xF9E3 
    JR C_FA65                         ;0xf9fd:   18 66  ".f" 
    LD A,B                            ;0xf9ff:   78  "x" 
    INC C                             ;0xfa00:   0c  "." 
    LD A,H                            ;0xfa01:   7c  "|" 
    CALL z, 0x176                     ;0xfa02:   cc 76 01  ".v." 
    NOP                               ;0xfa05:   00  "." 
    JR $+104                          ;0xfa06:   18 66  ".f" 
    INC A                             ;0xfa08:   3c  "<" 
    LD H,(HL)                         ;0xfa09:   66  "f" 
    LD A,(HL)                         ;0xfa0a:   7e  "~" 
    LD H,B                            ;0xfa0b:   60  "`" 
    INC A                             ;0xfa0c:   3c  "<" 
    LD BC,0x1800                      ;0xfa0d:   01 00 18  "..."  
    LD H,(HL)                         ;0xfa10:   66  "f" 
    LD BC,0x3800                      ;0xfa11:   01 00 38  "..8"  
    JR D_FA2E                         ;0xfa14:   18 18  ".." 
    INC A                             ;0xfa16:   3c  "<" 
;--------------------------------------
C_FA17:                               ; XREF: 0xF9B5 
    LD BC,0x1800                      ;0xfa17:   01 00 18  "..."  
    LD H,(HL)                         ;0xfa1a:   66  "f" 
    LD BC,0x3c00                      ;0xfa1b:   01 00 3c  "..<"  
    LD H,(HL)                         ;0xfa1e:   66  "f" 
;--------------------------------------
C_FA1F:                               ; XREF: 0xF9B7 
    LD H,(HL)                         ;0xfa1f:   66  "f" 
    INC A                             ;0xfa20:   3c  "<" 
    LD BC,0x1800                      ;0xfa21:   01 00 18  "..."  
;--------------------------------------
C_FA24:                               ; XREF: 0xF9C2 
    LD H,(HL)                         ;0xfa24:   66  "f" 
;--------------------------------------
D_FA25:                               ; XREF: 0xFE2E 
    DEFB 0x1                          ;0xfa25:   0x1
    DEFB 0x0                          ;0xfa26:   0x0
    DEFB "fff<"                       ;0xfa27:   0xfa27 to 0xfa2b
    DEFB 0x1                          ;0xfa2b:   0x1
;--------------------------------------
D_FA2C:                               ; XREF: 0xFEA9 
    DEFB 0x0                          ;0xfa2c:   0x0
    DEFB 0x30                         ;0xfa2d:   "0"
;--------------------------------------
D_FA2E:                               ; XREF: 0xFED0 0xFEAC 0xFA14 
    DEFB 0xc                          ;0xfa2e:   0xc
    DEFB 0x78                         ;0xfa2f:   "x"
    DEFB 0xc                          ;0xfa30:   0xc
    DEFB 0x7c                         ;0xfa31:   "|"
    DEFB 0xcc                         ;0xfa32:   ('L') + 0x80
    DEFB 0x76                         ;0xfa33:   "v"
    DEFB 0x1                          ;0xfa34:   0x1
    DEFB 0x0                          ;0xfa35:   0x0
    DEFB 0x30                         ;0xfa36:   "0"
    DEFB 0xc                          ;0xfa37:   0xc
    DEFB 0x3c                         ;0xfa38:   "<"
    DEFB 0x66                         ;0xfa39:   "f"
    DEFB 0x7e                         ;0xfa3a:   "~"
    DEFB 0x60                         ;0xfa3b:   "`"
    DEFB 0x3c                         ;0xfa3c:   "<"
    DEFB 0x1                          ;0xfa3d:   0x1
    DEFB 0x0                          ;0xfa3e:   0x0
    DEFB 0x30                         ;0xfa3f:   "0"
;--------------------------------------
C_FA40:                               ; XREF: 0xF9C0 
    INC C                             ;0xfa40:   0c  "." 
    LD BC,0x3800                      ;0xfa41:   01 00 38  "..8"  
;--------------------------------------
C_FA44:                               ; XREF: 0xFA36 
    JR C_FA5E                         ;0xfa44:   18 18  ".." 
    INC A                             ;0xfa46:   3c  "<" 
    LD BC,0x3000                      ;0xfa47:   01 00 30  "..0"  
    INC C                             ;0xfa4a:   0c  "." 
    LD BC,0x3c00                      ;0xfa4b:   01 00 3c  "..<"  
    LD H,(HL)                         ;0xfa4e:   66  "f" 
    LD H,(HL)                         ;0xfa4f:   66  "f" 
    INC A                             ;0xfa50:   3c  "<" 
    LD BC,0x3000                      ;0xfa51:   01 00 30  "..0"  
    INC C                             ;0xfa54:   0c  "." 
    LD BC,0x6600                      ;0xfa55:   01 00 66  "..f"  
    DEFB "ff<", 0x66                  ;0xfa58:   0xfa58 to 0xfa59
    DEFB 0x0                          ;0xfa5c:   
    DEFB 0x66                         ;0xfa5d:   
;--------------------------------------
C_FA5E:                               ; XREF: 0xFA44 
    LD BC,0x6600                      ;0xfa5e:   01 00 66  "..f"  
    DEFB "ff>", 0x66                  ;0xfa61:   0xfa61 to 0xfa62
;--------------------------------------
C_FA65:                               ; XREF: 0xF9FD 
    LD A,H                            ;0xfa65:   7c  "|" 
    LD H,(HL)                         ;0xfa66:   66  "f" 
    LD BC,0x7800                      ;0xfa67:   01 00 78  "..x"  
    INC C                             ;0xfa6a:   0c  "." 
    LD A,H                            ;0xfa6b:   7c  "|" 
    CALL z, 0x176                     ;0xfa6c:   cc 76 01  ".v." 
    NOP                               ;0xfa6f:   00  "." 
    LD H,(HL)                         ;0xfa70:   66  "f" 
    LD BC,0x3c00                      ;0xfa71:   01 00 3c  "..<"  
    LD H,(HL)                         ;0xfa74:   66  "f" 
    LD A,(HL)                         ;0xfa75:   7e  "~" 
    LD H,B                            ;0xfa76:   60  "`" 
    INC A                             ;0xfa77:   3c  "<" 
    LD BC,0x6600                      ;0xfa78:   01 00 66  "..f"  
    LD BC,0x3800                      ;0xfa7b:   01 00 38  "..8"  
;--------------------------------------
D_FA7E:                               ; XREF: 0xF025 0xEFDE 
    DEFB 0x18                         ;0xfa7e:   0x18
    DEFB 0x18                         ;0xfa7f:   0x18
    DEFB 0x18                         ;0xfa80:   0x18
    DEFB 0x3c                         ;0xfa81:   "<"
    DEFB 0x1                          ;0xfa82:   0x1
    DEFB 0x0                          ;0xfa83:   0x0
    DEFB 0x66                         ;0xfa84:   "f"
    DEFB 0x2                          ;0xfa85:   0x2
    DEFB 0x0                          ;0xfa86:   0x0
    DEFB 0x3c                         ;0xfa87:   "<"
    DEFB 0x66                         ;0xfa88:   "f"
    DEFB 0x66                         ;0xfa89:   "f"
    DEFB 0x3c                         ;0xfa8a:   "<"
    DEFB 0x1                          ;0xfa8b:   0x1
    DEFB 0x0                          ;0xfa8c:   0x0
    DEFB 0x66                         ;0xfa8d:   "f"
    DEFB 0x2                          ;0xfa8e:   0x2
    DEFB 0x0                          ;0xfa8f:   0x0
    DEFB "fff>"                       ;0xfa90:   0xfa90 to 0xfa94
    DEFB 0x3                          ;0xfa94:   0x3
    DEFB 0x0                          ;0xfa95:   
    DEFB 0x3c                         ;0xfa96:   
    DEFB 0x60                         ;0xfa97:   
;--------------------------------------
C_FA98:                               ; XREF: 0xFA7E 
    LD H,B                            ;0xfa98:   60  "`" 
    INC A                             ;0xfa99:   3c  "<" 
    LD BC,0x1800                      ;0xfa9a:   01 00 18  "..."  
    LD (BC),A                         ;0xfa9d:   02  "." 
    NOP                               ;0xfa9e:   00  "." 
    LD L,H                            ;0xfa9f:   6c  "l" 
    LD A,(DE)                         ;0xfaa0:   1a  "." 
    LD A,(HL)                         ;0xfaa1:   7e  "~" 
    RET c                             ;0xfaa2:   d8  "." 
    LD L,(HL)                         ;0xfaa3:   6e  "n" 
    LD BC,0x1800                      ;0xfaa4:   01 00 18  "..."  
    LD BC,0x7800                      ;0xfaa7:   01 00 78  "..x"  
    INC C                             ;0xfaaa:   0c  "." 
    LD A,H                            ;0xfaab:   7c  "|" 
    CALL z, 0x376                     ;0xfaac:   cc 76 03  ".v." 
    NOP                               ;0xfaaf:   00  "." 
    LD A,D                            ;0xfab0:   7a  "z" 
    CALL z, 0x66d6                    ;0xfab1:   cc d6 66  "..f" 
    CP H                              ;0xfab4:   bc  "." 
    LD BC,0x3200                      ;0xfab5:   01 00 32  "..2"  
    LD C,H                            ;0xfab8:   4c  "L" 
    LD BC,0xdc00                      ;0xfab9:   01 00 dc  "..."  
    DEFB "fff"                        ;0xfabc:   0xfabc to 0xfabf
    LD BC,0x3200                      ;0xfabf:   01 00 32  "..2"  
    LD C,H                            ;0xfac2:   4c  "L" 
    LD A,B                            ;0xfac3:   78  "x" 
    INC C                             ;0xfac4:   0c  "." 
    LD A,H                            ;0xfac5:   7c  "|" 
    CALL z, 0x176                     ;0xfac6:   cc 76 01  ".v." 
    NOP                               ;0xfac9:   00  "." 
    LD (0x14c),A                      ;0xfaca:   32 4c 01  "2L."  
    NOP                               ;0xfacd:   00  "." 
    INC A                             ;0xface:   3c  "<" 
    LD H,(HL)                         ;0xfacf:   66  "f" 
    LD H,(HL)                         ;0xfad0:   66  "f" 
    INC A                             ;0xfad1:   3c  "<" 
    LD BC,0x800                       ;0xfad2:   01 00 08  "..."  
    INC C                             ;0xfad5:   0c  "." 
    CP 7                              ;0xfad6:   fe 07  ".." 
    CP 12                             ;0xfad8:   fe 0c  ".." 
    EX AF,AF'                         ;0xfada:   08  "." 
    LD BC,0x1000                      ;0xfadb:   01 00 10  "..."  
    DEFB 0x30                         ;0xfade:   "0"
    DEFB 0x7f                         ;0xfadf:   0x7f
    DEFB 0xe0                         ;0xfae0:   ('`') + 0x80
    DEFB 0x7f                         ;0xfae1:   0x7f
    DEFB 0x30                         ;0xfae2:   "0"
    DEFB 0x10                         ;0xfae3:   0x10
    DEFB 0x2                          ;0xfae4:   0x2
    DEFB 0x0                          ;0xfae5:   0x0
    DEFB 0x24                         ;0xfae6:   "$"
    DEFB 0x7e                         ;0xfae7:   "~"
    DEFB 0xc3                         ;0xfae8:   ('C') + 0x80
    DEFB 0x7e                         ;0xfae9:   "~"
    DEFB 0x24                         ;0xfaea:   "$"
    DEFB 0x3                          ;0xfaeb:   0x3
    DEFB 0x0                          ;0xfaec:   0x0
    DEFB 0x7e                         ;0xfaed:   "~"
    DEFB 0x1                          ;0xfaee:   0x1
    DEFB 0x0                          ;0xfaef:   0x0
    DEFB 0x7e                         ;0xfaf0:   "~"
    DEFB 0x1                          ;0xfaf1:   0x1
    DEFB 0x0                          ;0xfaf2:   0x0
    DEFB 0x7e                         ;0xfaf3:   "~"
;--------------------------------------
C_FAF4:                               ; XREF: 0xFAE2 
    LD (BC),A                         ;0xfaf4:   02  "." 
    NOP                               ;0xfaf5:   00  "." 
    LD HL,(0x213e)                    ;0xfaf6:   2a 3e 21  "*>!"  
    CPL                               ;0xfaf9:   2f  "/" 
    CP 0xc9                           ;0xfafa:   fe c9  ".." 
    CALL 0xfd1c                       ;0xfafc:   cd 1c fd  "..." 
    LD D,(HL)                         ;0xfaff:   56  "V" 
    LD A,0xcd                         ;0xfb00:   3e cd  ">."  
    INC E                             ;0xfb02:   1c  "." 
    SUB A                             ;0xfb03:   fd 97  ".." 
    LD A,0xcd                         ;0xfb05:   3e cd  ">."  
    INC E                             ;0xfb07:   1c  "." 
    SBC A,IYH                         ;0xfb08:   fd 9c  ".." 
    LD A,0xc9                         ;0xfb0a:   3e c9  ">."  
;--------------------------------------
S_fb0c:                               ; XREF: 
    DEFB "CRT   "                     ;0xfb0c:   0xfb0c to 0xfb12
    DEFB 0x3                          ;0xfb12:   0x3
    DEFB 0x1                          ;0xfb13:   0x1
    DEFB 0x0                          ;0xfb14:   
;--------------------------------------
S_fb15:                               ; XREF: 
    DEFB "LPT   "                     ;0xfb15:   0xfb15 to 0xfb1b
    DEFB 0x2                          ;0xfb1b:   0x2
    DEFB 0x1                          ;0xfb1c:   0x1
    DEFB 0x0                          ;0xfb1d:   
;--------------------------------------
S_fb1e:                               ; XREF: 0xFB1A 
    DEFB "SIO   "                     ;0xfb1e:   0xfb1e to 0xfb24
    DEFB 0xf                          ;0xfb24:   0xf
    DEFB 0xe                          ;0xfb25:   0xe
    DEFB 0x1                          ;0xfb26:   0x1
    DEFB 0x0                          ;0xfb27:   
    DEFB 0x94                         ;0xfb28:   
    DEFB 0x3f                         ;0xfb29:   
    DEFB 0xb7                         ;0xfb2a:   
    DEFB 0x3f                         ;0xfb2b:   
    DEFB 0x4d                         ;0xfb2c:   
    DEFB 0x0                          ;0xfb2d:   
    DEFB 0x32                         ;0xfb2e:   
    DEFB 0xaf                         ;0xfb2f:   
    DEFB 0xfd                         ;0xfb30:   
;--------------------------------------
C_FB31:                               ; XREF: 0xFB0F 
    EX AF,AF'                         ;0xfb31:   08  "." 
    EXX                               ;0xfb32:   d9  "." 
    LD (D_FEE1),BC                    ;0xfb33:   ed 43 e1 fe  ".C.."  
    POP HL                            ;0xfb37:   e1  "." 
    POP DE                            ;0xfb38:   d1  "." 
    POP BC                            ;0xfb39:   c1  "." 
;--------------------------------------
C_FB3A:                               ; XREF: 0xFB18 
    POP AF                            ;0xfb3a:   f1  "." 
    EX AF,AF'                         ;0xfb3b:   08  "." 
    EXX                               ;0xfb3c:   d9  "." 
    POP AF                            ;0xfb3d:   f1  "." 
    LD SP,(D_FEDB)                    ;0xfb3e:   ed 7b db fe  ".{.."  
    EI                                ;0xfb42:   fb  "." 
;--------------------------------------
C_FB43:                               ; XREF: 0xFB21 
    RET                               ;0xfb43:   c9  "." 
    PUSH AF                           ;0xfb44:   f5  "." 
    PUSH HL                           ;0xfb45:   e5  "." 
    EXX                               ;0xfb46:   d9  "." 
    LD A,0xc1                         ;0xfb47:   3e c1  ">."  
    OUT (C),A                         ;0xfb49:   ed 79  ".y" 
    EXX                               ;0xfb4b:   d9  "." 
    LD HL,(D_FEDF)                    ;0xfb4c:   2a df fe  "*.."  
    CALL C_FDAD                       ;0xfb4f:   cd ad fd  "..." 
    LD A,(D_FE58)                     ;0xfb52:   3a 58 fe  ":X."  
    CALL 0xfd04                       ;0xfb55:   cd 04 fd  "..." 
    POP HL                            ;0xfb58:   e1  "." 
    POP AF                            ;0xfb59:   f1  "." 
    RET                               ;0xfb5a:   c9  "." 
    JP (HL)                           ;0xfb5b:   e9  "." 
;--------------------------------------
C_FB5C:                               ; XREF: 0xFB5C 
    JR C_FB5C                         ;0xfb5c:   18 fe  ".." 
    CALL 0xfd1c                       ;0xfb5e:   cd 1c fd  "..." 
    CCF                               ;0xfb61:   3f  "?" 
    LD A,0x21                         ;0xfb62:   3e 21  ">!"  
    LD D,0xfe                         ;0xfb64:   16 fe  ".."  
;--------------------------------------
D_FB66:                               ; XREF: 0xFEF6 
    DEFB 0xc9                         ;0xfb66:   ('I') + 0x80
    DEFB 0x2a                         ;0xfb67:   "*"
    DEFB 0xc4                         ;0xfb68:   ('D') + 0x80
    DEFB 0xfb                         ;0xfb69:   ('{') + 0x80
    DEFB 0x18                         ;0xfb6a:   0x18
    DEFB 0x8                          ;0xfb6b:   0x8
    DEFB 0x2a                         ;0xfb6c:   "*"
    DEFB 0xc6                         ;0xfb6d:   ('F') + 0x80
    DEFB 0xfb                         ;0xfb6e:   ('{') + 0x80
    DEFB 0x18                         ;0xfb6f:   0x18
    DEFB 0x3                          ;0xfb70:   0x3
    DEFB 0x2a                         ;0xfb71:   "*"
    DEFB 0xc0                         ;0xfb72:   ('@') + 0x80
    DEFB 0xfb                         ;0xfb73:   ('{') + 0x80
;--------------------------------------
C_FB74:                               ; XREF: 0xFB6A 
    CALL 0xfd1c                       ;0xfb74:   cd 1c fd  "..." 
    LD L,H                            ;0xfb77:   6c  "l" 
    DEC A                             ;0xfb78:   3d  "=" 
    LD HL,(D_FBC4)                    ;0xfb79:   2a c4 fb  "*.."  
    JR C_FB86                         ;0xfb7c:   18 08  ".." 
;--------------------------------------
D_FB7E:                               ; XREF: 0xF06C 0xEFBD 0xF086 0xEF47 
    DEFB 0x2a                         ;0xfb7e:   "*"
    DEFB 0xc6                         ;0xfb7f:   ('F') + 0x80
    DEFB 0xfb                         ;0xfb80:   ('{') + 0x80
    DEFB 0x18                         ;0xfb81:   0x18
    DEFB 0x3                          ;0xfb82:   0x3
    DEFB 0x2a                         ;0xfb83:   "*"
    DEFB 0xc0                         ;0xfb84:   ('@') + 0x80
    DEFB 0xfb                         ;0xfb85:   ('{') + 0x80
;--------------------------------------
C_FB86:                               ; XREF: 0xFB7C 
    CALL 0xfd1c                       ;0xfb86:   cd 1c fd  "..." 
    RET z                             ;0xfb89:   c8  "." 
    DEC A                             ;0xfb8a:   3d  "=" 
    LD HL,(D_FBC2)                    ;0xfb8b:   2a c2 fb  "*.."  
    JR C_FB9E                         ;0xfb8e:   18 0e  ".." 
    LD HL,(D_FBBE)                    ;0xfb90:   2a be fb  "*.."  
    LD A,H                            ;0xfb93:   7c  "|" 
    XOR 0x80                          ;0xfb94:   ee 80  ".." 
    OR L                              ;0xfb96:   b5  "." 
    JR nz, C_FB9E                     ;0xfb97:   20 05  " ." 
    LD A,(D_FFF3)                     ;0xfb99:   3a f3 ff  ":.."  
;--------------------------------------
D_FB9C:                               ; XREF: 0xFDEB 
    DEFB 0xb7                         ;0xfb9c:   ('7') + 0x80
;--------------------------------------
D_FB9D:                               ; XREF: 0xFE4E 
    DEFB 0xc8                         ;0xfb9d:   ('H') + 0x80
;--------------------------------------
C_FB9E:                               ; XREF: 0xFB8E 
    DEFB 0xcd                         ;0xfb9e:   ('M') + 0x80
    INC E                             ;0xfb9f:   1c  "." 
    ADD IY,DE                         ;0xfba0:   fd 19  ".." 
    LD A,0x2a                         ;0xfba2:   3e 2a  ">*"  
    JP nz, 0x18fb                     ;0xfba4:   c2 fb 18  "..." 
    INC BC                            ;0xfba7:   03  "." 
    LD HL,(D_FBBE)                    ;0xfba8:   2a be fb  "*.."  
    CALL 0xfd1c                       ;0xfbab:   cd 1c fd  "..." 
    LD (D_FE59),A                     ;0xfbae:   32 59 fe  "2Y."  
    XOR A                             ;0xfbb1:   af  "." 
    PUSH BC                           ;0xfbb2:   c5  "." 
    LD (D_FE58),A                     ;0xfbb3:   32 58 fe  "2X."  
    ADD A,0xc1                        ;0xfbb6:   c6 c1  ".." 
    LD B,0x7f                         ;0xfbb8:   06 7f  ".."  
    OUT (C),A                         ;0xfbba:   ed 79  ".y" 
    POP BC                            ;0xfbbc:   c1  "." 
    RET                               ;0xfbbd:   c9  "." 
;--------------------------------------
D_FBBE:                               ; XREF: 0xFB90 0xFBA8 
    DEFB 0x22                         ;0xfbbe:   """
    DEFB 0xdd                         ;0xfbbf:   (']') + 0x80
;--------------------------------------
D_FBC0:                               ; XREF: 0xFB71 0xFB83 
    DEFB 0xfe                         ;0xfbc0:   ('~') + 0x80
    DEFB 0xe1                         ;0xfbc1:   ('a') + 0x80
;--------------------------------------
D_FBC2:                               ; XREF: 0xFB8B 
    DEFB 0xe5                         ;0xfbc2:   ('e') + 0x80
    DEFB 0x23                         ;0xfbc3:   "#"
;--------------------------------------
D_FBC4:                               ; XREF: 0xFB79 0xFB67 
    DEFB 0x23                         ;0xfbc4:   "#"
    DEFB 0xe3                         ;0xfbc5:   ('c') + 0x80
;--------------------------------------
D_FBC6:                               ; XREF: 0xFB6C 0xFB7E 
    DEFB 0xe5                         ;0xfbc6:   ('e') + 0x80
    DEFB 0x2a                         ;0xfbc7:   "*"
    DEFB 0xdd                         ;0xfbc8:   (']') + 0x80
    DEFB 0xfe                         ;0xfbc9:   ('~') + 0x80
    DEFB 0xf3                         ;0xfbca:   ('s') + 0x80
    DEFB 0x8                          ;0xfbcb:   0x8
    DEFB 0xd9                         ;0xfbcc:   ('Y') + 0x80
    DEFB 0xe3                         ;0xfbcd:   ('c') + 0x80
    DEFB 0xed                         ;0xfbce:   ('m') + 0x80
    DEFB 0x73                         ;0xfbcf:   "s"
    DEFB 0xdb                         ;0xfbd0:   ('[') + 0x80
    DEFB 0xfe                         ;0xfbd1:   ('~') + 0x80
    DEFB 0x31                         ;0xfbd2:   "1"
    DEFB 0x53                         ;0xfbd3:   "S"
    DEFB 0xff                         ;0xfbd4:   0xff
    DEFB 0xd5                         ;0xfbd5:   ('U') + 0x80
    DEFB 0xc5                         ;0xfbd6:   ('E') + 0x80
    DEFB 0xf5                         ;0xfbd7:   ('u') + 0x80
    DEFB 0x5e                         ;0xfbd8:   "^"
    DEFB 0x23                         ;0xfbd9:   "#"
    DEFB 0x56                         ;0xfbda:   "V"
    DEFB 0x3a                         ;0xfbdb:   ":"
    DEFB 0x58                         ;0xfbdc:   "X"
    DEFB 0xfe                         ;0xfbdd:   ('~') + 0x80
    DEFB 0xf5                         ;0xfbde:   ('u') + 0x80
;--------------------------------------
D_FBDF:                               ; XREF: 0xE4D9 
    DEFB 0xcd                         ;0xfbdf:   ('M') + 0x80
    DEFB 0x3                          ;0xfbe0:   0x3
;--------------------------------------
D_FBE1:                               ; XREF: 0xFE37 0xFDAF 
    DEFB 0xfd                         ;0xfbe1:   ('}') + 0x80
    DEFB 0x3e                         ;0xfbe2:   ">"
    DEFB 0xe6                         ;0xfbe3:   ('f') + 0x80
    DEFB 0x32                         ;0xfbe4:   "2"
    DEFB 0xaf                         ;0xfbe5:   ('/') + 0x80
    DEFB 0xfd                         ;0xfbe6:   ('}') + 0x80
    DEFB 0xed                         ;0xfbe7:   ('m') + 0x80
    DEFB 0x4b                         ;0xfbe8:   "K"
    DEFB 0xe1                         ;0xfbe9:   ('a') + 0x80
    DEFB 0xfe                         ;0xfbea:   ('~') + 0x80
    DEFB 0xb7                         ;0xfbeb:   ('7') + 0x80
    DEFB 0xcd                         ;0xfbec:   ('M') + 0x80
    DEFB 0x5d                         ;0xfbed:   "]"
    DEFB 0xfd                         ;0xfbee:   ('}') + 0x80
    DEFB 0xf3                         ;0xfbef:   ('s') + 0x80
    DEFB 0x8                          ;0xfbf0:   0x8
    DEFB 0xd9                         ;0xfbf1:   ('Y') + 0x80
    DEFB 0xed                         ;0xfbf2:   ('m') + 0x80
    DEFB 0x43                         ;0xfbf3:   "C"
    DEFB 0xe1                         ;0xfbf4:   ('a') + 0x80
    DEFB 0xfe                         ;0xfbf5:   ('~') + 0x80
    DEFB 0x3e                         ;0xfbf6:   ">"
    DEFB 0xb2                         ;0xfbf7:   ('2') + 0x80
    DEFB 0x32                         ;0xfbf8:   "2"
    DEFB 0xaf                         ;0xfbf9:   ('/') + 0x80
    DEFB 0xfd                         ;0xfbfa:   ('}') + 0x80
    DEFB 0xf1                         ;0xfbfb:   ('q') + 0x80
    DEFB 0xcd                         ;0xfbfc:   ('M') + 0x80
    DEFB 0x4                          ;0xfbfd:   0x4
;--------------------------------------
D_FBFE:                               ; XREF: 0xFC48 
    DEFB 0xfd                         ;0xfbfe:   ('}') + 0x80
    DEFB 0xf1                         ;0xfbff:   ('q') + 0x80
;--------------------------------------
D_FC00:                               ; XREF: 0xF53C 0xF4BE 
    DEFB 0xc1                         ;0xfc00:   ('A') + 0x80
    DEFB 0xd1                         ;0xfc01:   ('Q') + 0x80
    DEFB 0xed                         ;0xfc02:   ('m') + 0x80
;--------------------------------------
D_FC03:                               ; XREF: 0xFC3E 
    DEFB 0x7b                         ;0xfc03:   "{"
    DEFB 0xdb                         ;0xfc04:   ('[') + 0x80
    DEFB 0xfe                         ;0xfc05:   ('~') + 0x80
;--------------------------------------
C_FC06:                               ; XREF: 0xFD77 
    POP HL                            ;0xfc06:   e1  "." 
    EX AF,AF'                         ;0xfc07:   08  "." 
    EXX                               ;0xfc08:   d9  "." 
;--------------------------------------
C_FC09:                               ; XREF: 0xFD7D 
    EI                                ;0xfc09:   fb  "." 
    RET                               ;0xfc0a:   c9  "." 
    PUSH DE                           ;0xfc0b:   d5  "." 
;--------------------------------------
C_FC0C:                               ; XREF: 0xFD83 
    EX AF,AF'                         ;0xfc0c:   08  "." 
    EXX                               ;0xfc0d:   d9  "." 
    EI                                ;0xfc0e:   fb  "." 
;--------------------------------------
C_FC0F:                               ; XREF: 0xFD39 
    RET                               ;0xfc0f:   c9  "." 
    LD (D_FEDB),SP                    ;0xfc10:   ed 73 db fe  ".s.."  
    LD SP,D_FF53                      ;0xfc14:   31 53 ff  "1S."  
    PUSH AF                           ;0xfc17:   f5  "." 
;--------------------------------------
D_FC18:                               ; XREF: 0xE6F7 
    DEFB 0xd9                         ;0xfc18:   ('Y') + 0x80
    DEFB 0x8                          ;0xfc19:   0x8
    DEFB 0xf5                         ;0xfc1a:   ('u') + 0x80
    DEFB 0xc5                         ;0xfc1b:   ('E') + 0x80
    DEFB 0xd5                         ;0xfc1c:   ('U') + 0x80
    DEFB 0xe5                         ;0xfc1d:   ('e') + 0x80
    DEFB 0xed                         ;0xfc1e:   ('m') + 0x80
    DEFB 0x4b                         ;0xfc1f:   "K"
    DEFB 0xe1                         ;0xfc20:   ('a') + 0x80
    DEFB 0xfe                         ;0xfc21:   ('~') + 0x80
    DEFB 0xb7                         ;0xfc22:   ('7') + 0x80
    DEFB 0xd9                         ;0xfc23:   ('Y') + 0x80
    DEFB 0x8                          ;0xfc24:   0x8
    DEFB 0x3e                         ;0xfc25:   ">"
    DEFB 0xe6                         ;0xfc26:   ('f') + 0x80
    DEFB 0x32                         ;0xfc27:   "2"
    DEFB 0xaf                         ;0xfc28:   ('/') + 0x80
    DEFB 0xfd                         ;0xfc29:   ('}') + 0x80
    DEFB 0xff                         ;0xfc2a:   0xff
    DEFB 0xf3                         ;0xfc2b:   ('s') + 0x80
    DEFB 0x3e                         ;0xfc2c:   ">"
    DEFB 0xb2                         ;0xfc2d:   ('2') + 0x80
    DEFB 0xcd                         ;0xfc2e:   ('M') + 0x80
    DEFB 0x4                          ;0xfc2f:   0x4
    DEFB 0xfd                         ;0xfc30:   ('}') + 0x80
    DEFB 0x3e                         ;0xfc31:   ">"
    DEFB 0xc3                         ;0xfc32:   ('C') + 0x80
    DEFB 0x21                         ;0xfc33:   "!"
    DEFB 0xae                         ;0xfc34:   ('.') + 0x80
    DEFB 0xfd                         ;0xfc35:   ('}') + 0x80
    DEFB 0x32                         ;0xfc36:   "2"
    DEFB 0x38                         ;0xfc37:   "8"
    DEFB 0x1                          ;0xfc38:   0x1
    DEFB 0x0                          ;0xfc39:   0x0
    DEFB 0x22                         ;0xfc3a:   """
    DEFB 0x39                         ;0xfc3b:   "9"
    DEFB 0x1                          ;0xfc3c:   0x1
    DEFB 0x0                          ;0xfc3d:   0x0
    DEFB 0x21                         ;0xfc3e:   "!"
    DEFB 0x3                          ;0xfc3f:   0x3
    DEFB 0xfc                         ;0xfc40:   ('|') + 0x80
    DEFB 0x32                         ;0xfc41:   "2"
    DEFB 0x2                          ;0xfc42:   0x2
    DEFB 0x0                          ;0xfc43:   0x0
    DEFB 0x22                         ;0xfc44:   """
    DEFB 0x1                          ;0xfc45:   0x1
    DEFB 0x1                          ;0xfc46:   0x1
    DEFB 0x0                          ;0xfc47:   0x0
    DEFB 0x2a                         ;0xfc48:   "*"
    DEFB 0xfe                         ;0xfc49:   ('~') + 0x80
    DEFB 0xfb                         ;0xfc4a:   ('{') + 0x80
;--------------------------------------
C_FC4B:                               ; XREF: 0xFEB6 
    LD (0x105),A                      ;0xfc4b:   32 05 01  "2.."  
    NOP                               ;0xfc4e:   00  "." 
    LD (0x106),HL                     ;0xfc4f:   22 06 01  "".."  
    NOP                               ;0xfc52:   00  "." 
    LD L,1                            ;0xfc53:   2e 01  ".."  
    NOP                               ;0xfc55:   00  "." 
    LD SP,HL                          ;0xfc56:   f9  "." 
    EI                                ;0xfc57:   fb  "." 
    LD BC,0x102                       ;0xfc58:   01 02 01  "..."  
    CALL 0xfcb6                       ;0xfc5b:   cd b6 fc  "..." 
    LD BC,0x14e2                      ;0xfc5e:   01 e2 14  "..."  
    LD DE,1                           ;0xfc61:   11 01 00  "..."  
    LD B,B                            ;0xfc64:   40  "@" 
    LD HL,1                           ;0xfc65:   21 01 00  "!.."  
    LD BC,0x18e5                      ;0xfc68:   01 e5 18  "..."  
    LD A,(BC)                         ;0xfc6b:   0a  "." 
    LD (D_FE59),BC                    ;0xfc6c:   ed 43 59 fe  ".CY."  
    RET                               ;0xfc70:   c9  "." 
;--------------------------------------
C_FC71:                               ; XREF: 0xFC7A 
    EX DE,HL                          ;0xfc71:   eb  "." 
    LDIR                              ;0xfc72:   ed b0  ".." 
    EX DE,HL                          ;0xfc74:   eb  "." 
    RET                               ;0xfc75:   c9  "." 
    LD A,(D_FE59)                     ;0xfc76:   3a 59 fe  ":Y."  
    INC A                             ;0xfc79:   3c  "<" 
;--------------------------------------
C_FC7A:                               ; XREF: 0xFCBA 
    JR z, C_FC71                      ;0xfc7a:   28 f5  "(." 
    CALL 0xfd1c                       ;0xfc7c:   cd 1c fd  "..." 
    SET 7,H                           ;0xfc7f:   cb fc  ".." 
    EX DE,HL                          ;0xfc81:   eb  "." 
    PUSH BC                           ;0xfc82:   c5  "." 
;--------------------------------------
C_FC83:                               ; XREF: 0xFCB2 
    EX (SP),HL                        ;0xfc83:   e3  "." 
    LD A,L                            ;0xfc84:   7d  "}" 
    LD BC,0x180                       ;0xfc85:   01 80 01  "..."  
    NOP                               ;0xfc88:   00  "." 
    OR A                              ;0xfc89:   b7  "." 
    SBC HL,BC                         ;0xfc8a:   ed 42  ".B" 
    JR nc, C_FC92                     ;0xfc8c:   30 04  "0." 
    LD C,A                            ;0xfc8e:   4f  "O" 
    LD HL,2                           ;0xfc8f:   21 02 00  "!.."  
;--------------------------------------
C_FC92:                               ; XREF: 0xFC8C 
    EX (SP),HL                        ;0xfc92:   e3  "." 
    LD A,(D_FE59)                     ;0xfc93:   3a 59 fe  ":Y."  
    CALL 0xfd04                       ;0xfc96:   cd 04 fd  "..." 
    PUSH DE                           ;0xfc99:   d5  "." 
    PUSH BC                           ;0xfc9a:   c5  "." 
    LD DE,D_FE5B                      ;0xfc9b:   11 5b fe  ".[."  
    LDIR                              ;0xfc9e:   ed b0  ".." 
    POP BC                            ;0xfca0:   c1  "." 
    POP DE                            ;0xfca1:   d1  "." 
    LD A,(D_FE5A)                     ;0xfca2:   3a 5a fe  ":Z."  
    CALL 0xfd04                       ;0xfca5:   cd 04 fd  "..." 
    PUSH HL                           ;0xfca8:   e5  "." 
    LD HL,D_FE5B                      ;0xfca9:   21 5b fe  "![."  
    LDIR                              ;0xfcac:   ed b0  ".." 
    POP HL                            ;0xfcae:   e1  "." 
    POP BC                            ;0xfcaf:   c1  "." 
    LD A,B                            ;0xfcb0:   78  "x" 
    OR C                              ;0xfcb1:   b1  "." 
    JR nz, C_FC83                     ;0xfcb2:   20 cf  " ." 
    EX DE,HL                          ;0xfcb4:   eb  "." 
    LD A,0xff                         ;0xfcb5:   3e ff  ">."  
    JP 0x3d0c                         ;0xfcb7:   c3 0c 3d  "..=" 
    JP C_FC7A                         ;0xfcba:   c3 7a fc  ".z." 
    JP 0xfde2                         ;0xfcbd:   c3 e2 fd  "..." 
;--------------------------------------
C_FCC0:                               ; XREF: 0xFD02 
    JP C_FDFA                         ;0xfcc0:   c3 fa fd  "..." 
    JP 0xfdc3                         ;0xfcc3:   c3 c3 fd  "..." 
    JP C_FDBE                         ;0xfcc6:   c3 be fd  "..." 
    JP C_FDB9                         ;0xfcc9:   c3 b9 fd  "..." 
    JP C_FDF5                         ;0xfccc:   c3 f5 fd  "..." 
    JP 0x3e74                         ;0xfccf:   c3 74 3e  ".t>" 
    JP C_FE06                         ;0xfcd2:   c3 06 fe  "..." 
    JP 0x3e77                         ;0xfcd5:   c3 77 3e  ".w>" 
    JP 0x3e7c                         ;0xfcd8:   c3 7c 3e  ".|>" 
    JP 0x3e81                         ;0xfcdb:   c3 81 3e  "..>" 
    JP C_FE0B                         ;0xfcde:   c3 0b fe  "..." 
    JP C_FE10                         ;0xfce1:   c3 10 fe  "..." 
    JP C_FDD0                         ;0xfce4:   c3 d0 fd  "..." 
    JP 0x3e8c                         ;0xfce7:   c3 8c 3e  "..>" 
    JP C_FDD5                         ;0xfcea:   c3 d5 fd  "..." 
    JP C_FDDD                         ;0xfced:   c3 dd fd  "..." 
    JP C_FDCB                         ;0xfcf0:   c3 cb fd  "..." 
    JP 0xfdb5                         ;0xfcf3:   c3 b5 fd  "..." 
    JP C_FDB0                         ;0xfcf6:   c3 b0 fd  "..." 
    JP C_FE02                         ;0xfcf9:   c3 02 fe  "..." 
    JP 0x3eb4                         ;0xfcfc:   c3 b4 3e  "..>" 
    JP 0x3eb9                         ;0xfcff:   c3 b9 3e  "..>" 
    JP C_FCC0                         ;0xfd02:   c3 c0 fc  "..." 
    JP C_FE15                         ;0xfd05:   c3 15 fe  "..." 
    JP 0xfd04                         ;0xfd08:   c3 04 fd  "..." 
    JP 0x3e88                         ;0xfd0b:   c3 88 3e  "..>" 
    JP 0xfcb6                         ;0xfd0e:   c3 b6 fc  "..." 
    JP 0xfd10                         ;0xfd11:   c3 10 fd  "..." 
    JP 0x2                            ;0xfd14:   c3 02 00  "..." 
    JP 0x2                            ;0xfd17:   c3 02 00  "..." 
    EXX                               ;0xfd1a:   d9  "." 
    LD (D_FEE1),BC                    ;0xfd1b:   ed 43 e1 fe  ".C.."  
    EXX                               ;0xfd1f:   d9  "." 
    LD HL,(0x139)                     ;0xfd20:   2a 39 01  "*9."  
    NOP                               ;0xfd23:   00  "." 
    LD (D_FEDF),HL                    ;0xfd24:   22 df fe  "".."  
    LD HL,D_FDAE                      ;0xfd27:   21 ae fd  "!.."  
    LD (0x139),HL                     ;0xfd2a:   22 39 01  ""9."  
    NOP                               ;0xfd2d:   00  "." 
    LD A,0xb2                         ;0xfd2e:   3e b2  ">."  
    LD (D_FDAF),A                     ;0xfd30:   32 af fd  "2.."  
    DI                                ;0xfd33:   f3  "." 
    LD SP,D_FF53                      ;0xfd34:   31 53 ff  "1S."  
    LD A,1                            ;0xfd37:   3e 01  ">."  
    JP C_FC0F                         ;0xfd39:   c3 0f fc  "..." 
    JP C_F783                         ;0xfd3c:   c3 83 f7  "..." 
    LD DE,0x700                       ;0xfd3f:   11 00 07  "..."  
    LD B,0xf6                         ;0xfd42:   06 f6  ".."  
    RLCA                              ;0xfd44:   07  "." 
    NOP                               ;0xfd45:   00  "." 
    LD SP,0x14                        ;0xfd46:   31 14 00  "1.."  
    LD C,(HL)                         ;0xfd49:   4e  "N" 
    LD BC,0x1700                      ;0xfd4a:   01 00 17  "..."  
    LD (DE),A                         ;0xfd4d:   12  "." 
    NOP                               ;0xfd4e:   00  "." 
    RST 0x38                          ;0xfd4f:   ff  "." 
    DEC B                             ;0xfd50:   05  "." 
    NOP                               ;0xfd51:   00  "." 
    LD L,D                            ;0xfd52:   6a  "j" 
    JP m, 0x224                       ;0xfd53:   fa 24 02  ".$." 
    NOP                               ;0xfd56:   00  "." 
    SBC A,H                           ;0xfd57:   9c  "." 
    EI                                ;0xfd58:   fb  "." 
    ADD A,B                           ;0xfd59:   80  "." 
    DEC C                             ;0xfd5a:   0d  "." 
    NOP                               ;0xfd5b:   00  "." 
    LD BC,2                           ;0xfd5c:   01 02 00  "..."  
    RST 0x38                          ;0xfd5f:   ff  "." 
    RST 0x38                          ;0xfd60:   ff  "." 
    RST 0x38                          ;0xfd61:   ff  "." 
    RLCA                              ;0xfd62:   07  "." 
    NOP                               ;0xfd63:   00  "." 
    ADD A,B                           ;0xfd64:   80  "." 
    LD (DE),A                         ;0xfd65:   12  "." 
    RLCA                              ;0xfd66:   07  "." 
    INC B                             ;0xfd67:   04  "." 
    NOP                               ;0xfd68:   00  "." 
    RET nz                            ;0xfd69:   c0  "." 
    JP 0xf7c                          ;0xfd6a:   c3 7c 0f  ".|." 
    LD B,0xf6                         ;0xfd6d:   06 f6  ".."  
    LD L,B                            ;0xfd6f:   68  "h" 
    NOP                               ;0xfd70:   00  "." 
    JP D_FC03                         ;0xfd71:   c3 03 fc  "..." 
    JP C_F783                         ;0xfd74:   c3 83 f7  "..." 
    JP C_FC06                         ;0xfd77:   c3 06 fc  "..." 
    JP C_F783                         ;0xfd7a:   c3 83 f7  "..." 
    JP C_FC09                         ;0xfd7d:   c3 09 fc  "..." 
    JP C_F783                         ;0xfd80:   c3 83 f7  "..." 
    JP C_FC0C                         ;0xfd83:   c3 0c fc  "..." 
    JP C_F783                         ;0xfd86:   c3 83 f7  "..." 
    ADD A,B                           ;0xfd89:   80  "." 
    NOP                               ;0xfd8a:   00  "." 
    ADD A,E                           ;0xfd8b:   83  "." 
    LD (BC),A                         ;0xfd8c:   02  "." 
    NOP                               ;0xfd8d:   00  "." 
    ADD A,D                           ;0xfd8e:   82  "." 
    ADD A,D                           ;0xfd8f:   82  "." 
    LD B,D                            ;0xfd90:   42  "B" 
    LD B,D                            ;0xfd91:   42  "B" 
    INC BC                            ;0xfd92:   03  "." 
    NOP                               ;0xfd93:   00  "." 
    ADD A,D                           ;0xfd94:   82  "." 
    ADD A,D                           ;0xfd95:   82  "." 
    INC B                             ;0xfd96:   04  "." 
    NOP                               ;0xfd97:   00  "." 
    EX AF,AF'                         ;0xfd98:   08  "." 
    LD (BC),A                         ;0xfd99:   02  "." 
    NOP                               ;0xfd9a:   00  "." 
    LD (BC),A                         ;0xfd9b:   02  "." 
    LD (BC),A                         ;0xfd9c:   02  "." 
    LD BC,0x300                       ;0xfd9d:   01 00 03  "..."  
    INC BC                            ;0xfda0:   03  "." 
    LD BC,0x8300                      ;0xfda1:   01 00 83  "..."  
    INC BC                            ;0xfda4:   03  "." 
    LD (BC),A                         ;0xfda5:   02  "." 
    LD (DE),A                         ;0xfda6:   12  "." 
    LD (BC),A                         ;0xfda7:   02  "." 
    LD B,0x61                         ;0xfda8:   06 61  ".a"  
    NOP                               ;0xfdaa:   00  "." 
    EI                                ;0xfdab:   fb  "." 
    EX DE,HL                          ;0xfdac:   eb  "." 
;--------------------------------------
C_FDAD:                               ; XREF: 0xFB4F 
    POP HL                            ;0xfdad:   e1  "." 
;--------------------------------------
D_FDAE:                               ; XREF: 0xFC33 0xFD27 
    DEFB 0x2b                         ;0xfdae:   "+"
;--------------------------------------
D_FDAF:                               ; XREF: 0xFBE4 0xFC27 0xFB2E 0xFD30 0xFBF8 
    DEFB 0x22                         ;0xfdaf:   """
;--------------------------------------
C_FDB0:                               ; XREF: 0xFCF6 
    DEFB 0xe1                         ;0xfdb0:   ('a') + 0x80
    EI                                ;0xfdb1:   fb  "." 
    POP BC                            ;0xfdb2:   c1  "." 
    LD A,L                            ;0xfdb3:   7d  "}" 
    AND 3                             ;0xfdb4:   e6 03  ".." 
    CP 3                              ;0xfdb6:   fe 03  ".." 
    RET z                             ;0xfdb8:   c8  "." 
;--------------------------------------
C_FDB9:                               ; XREF: 0xFCC9 
    LD A,E                            ;0xfdb9:   7b  "{" 
    AND 0xfc                          ;0xfdba:   e6 fc  ".." 
    LD E,A                            ;0xfdbc:   5f  "_" 
    LD A,L                            ;0xfdbd:   7d  "}" 
;--------------------------------------
C_FDBE:                               ; XREF: 0xFCC6 
    AND 0xfc                          ;0xfdbe:   e6 fc  ".." 
    LD L,A                            ;0xfdc0:   6f  "o" 
    CALL C_F9DD                       ;0xfdc1:   cd dd f9  "..." 
    OR L                              ;0xfdc4:   b5  "." 
    RET z                             ;0xfdc5:   c8  "." 
    LD A,0xff                         ;0xfdc6:   3e ff  ">."  
    LD (D_F614),A                     ;0xfdc8:   32 14 f6  "2.."  
;--------------------------------------
C_FDCB:                               ; XREF: 0xFCF0 
    XOR A                             ;0xfdcb:   af  "." 
    RET                               ;0xfdcc:   c9  "." 
    LD A,(HL)                         ;0xfdcd:   7e  "~" 
    AND 0x10                          ;0xfdce:   e6 10  ".." 
;--------------------------------------
C_FDD0:                               ; XREF: 0xFCE4 
    JP z, C_F937                      ;0xfdd0:   ca 37 f9  ".7." 
    LD A,(DE)                         ;0xfdd3:   1a  "." 
    XOR (HL)                          ;0xfdd4:   ae  "." 
;--------------------------------------
C_FDD5:                               ; XREF: 0xFCEA 
    AND 15                            ;0xfdd5:   e6 0f  ".." 
    JP nz, C_F937                     ;0xfdd7:   c2 37 f9  ".7." 
    JP 0xf9b8                         ;0xfdda:   c3 b8 f9  "..." 
;--------------------------------------
C_FDDD:                               ; XREF: 0xFCED 
    LD A,(HL)                         ;0xfddd:   7e  "~" 
    CP 0xf5                           ;0xfdde:   fe f5  ".." 
    JP nz, C_F937                     ;0xfde0:   c2 37 f9  ".7." 
    EX DE,HL                          ;0xfde3:   eb  "." 
    POP HL                            ;0xfde4:   e1  "." 
    LD (D_F617),HL                    ;0xfde5:   22 17 f6  "".."  
    JP 0xf939                         ;0xfde8:   c3 39 f9  ".9." 
    LD A,(D_FB9C)                     ;0xfdeb:   3a 9c fb  ":.."  
    OR A                              ;0xfdee:   b7  "." 
    RET z                             ;0xfdef:   c8  "." 
    LD C,A                            ;0xfdf0:   4f  "O" 
    RRCA                              ;0xfdf1:   0f  "." 
    RRCA                              ;0xfdf2:   0f  "." 
    RRA                               ;0xfdf3:   1f  "." 
    LD B,A                            ;0xfdf4:   47  "G" 
;--------------------------------------
C_FDF5:                               ; XREF: 0xFCCC 
    LD A,(DE)                         ;0xfdf5:   1a  "." 
    XOR (HL)                          ;0xfdf6:   ae  "." 
    AND B                             ;0xfdf7:   a0  "." 
    RET nz                            ;0xfdf8:   c0  "." 
    PUSH HL                           ;0xfdf9:   e5  "." 
;--------------------------------------
C_FDFA:                               ; XREF: 0xFCC0 
    INC HL                            ;0xfdfa:   23  "#" 
    INC DE                            ;0xfdfb:   13  "." 
    CALL 0xf9e4                       ;0xfdfc:   cd e4 f9  "..." 
;--------------------------------------
D_FDFF:                               ; XREF: 0xE12B 
    DEFB 0xe1                         ;0xfdff:   ('a') + 0x80
;--------------------------------------
D_FE00:                               ; XREF: 0xF4D9 0xF596 0xF2BE 0xF2EF 
    DEFB 0xc9                         ;0xfe00:   ('I') + 0x80
    DEFB 0xf5                         ;0xfe01:   ('u') + 0x80
;--------------------------------------
C_FE02:                               ; XREF: 0xFCF9 
    XOR A                             ;0xfe02:   af  "." 
    CALL 0xfc51                       ;0xfe03:   cd 51 fc  ".Q." 
;--------------------------------------
C_FE06:                               ; XREF: 0xFCD2 
    POP AF                            ;0xfe06:   f1  "." 
    RET                               ;0xfe07:   c9  "." 
    LD A,E                            ;0xfe08:   7b  "{" 
    SUB L                             ;0xfe09:   95  "." 
    LD L,A                            ;0xfe0a:   6f  "o" 
;--------------------------------------
C_FE0B:                               ; XREF: 0xFCDE 
    LD A,D                            ;0xfe0b:   7a  "z" 
    SBC A,H                           ;0xfe0c:   9c  "." 
    LD H,A                            ;0xfe0d:   67  "g" 
    RET                               ;0xfe0e:   c9  "." 
    LD A,(DE)                         ;0xfe0f:   1a  "." 
;--------------------------------------
C_FE10:                               ; XREF: 0xFCE1 
    CP (HL)                           ;0xfe10:   be  "." 
    RET nz                            ;0xfe11:   c0  "." 
    INC HL                            ;0xfe12:   23  "#" 
    INC DE                            ;0xfe13:   13  "." 
    DEC C                             ;0xfe14:   0d  "." 
;--------------------------------------
C_FE15:                               ; XREF: 0xFD05 
    RET z                             ;0xfe15:   c8  "." 
    JP 0xf9e4                         ;0xfe16:   c3 e4 f9  "..." 
    INC BC                            ;0xfe19:   03  "." 
    NOP                               ;0xfe1a:   00  "." 
    ADD A,E                           ;0xfe1b:   83  "." 
    ADD A,D                           ;0xfe1c:   82  "." 
    LD (0x322),HL                     ;0xfe1d:   22 22 03  """."  
    ADD A,D                           ;0xfe20:   82  "." 
    ADD A,D                           ;0xfe21:   82  "." 
    ADD A,E                           ;0xfe22:   83  "." 
    INC BC                            ;0xfe23:   03  "." 
    LD B,0                            ;0xfe24:   06 00  ".."  
    LD HL,D_F9D6                      ;0xfe26:   21 d6 f9  "!.."  
    PUSH HL                           ;0xfe29:   e5  "." 
    XOR A                             ;0xfe2a:   af  "." 
    LD (D_F614),A                     ;0xfe2b:   32 14 f6  "2.."  
    LD HL,(D_FA25)                    ;0xfe2e:   2a 25 fa  "*%."  
    LD B,H                            ;0xfe31:   44  "D" 
    LD C,L                            ;0xfe32:   4d  "M" 
    LD HL,(D_F612)                    ;0xfe33:   2a 12 f6  "*.."  
    EX DE,HL                          ;0xfe36:   eb  "." 
    LD HL,(D_FBE1)                    ;0xfe37:   2a e1 fb  "*.."  
    PUSH HL                           ;0xfe3a:   e5  "." 
    CALL C_F9DD                       ;0xfe3b:   cd dd f9  "..." 
    POP DE                            ;0xfe3e:   d1  "." 
    OR L                              ;0xfe3f:   b5  "." 
    RET z                             ;0xfe40:   c8  "." 
    PUSH HL                           ;0xfe41:   e5  "." 
    INC DE                            ;0xfe42:   13  "." 
    EX DE,HL                          ;0xfe43:   eb  "." 
    PUSH HL                           ;0xfe44:   e5  "." 
    DEC HL                            ;0xfe45:   2b  "+" 
    ADD HL,HL                         ;0xfe46:   29  ")" 
    ADD HL,HL                         ;0xfe47:   29  ")" 
    ADD HL,BC                         ;0xfe48:   09  "." 
    LD DE,0x104                       ;0xfe49:   11 04 01  "..."  
    NOP                               ;0xfe4c:   00  "." 
    ADD HL,DE                         ;0xfe4d:   19  "." 
    LD DE,D_FB9D                      ;0xfe4e:   11 9d fb  "..."  
    LD A,(DE)                         ;0xfe51:   1a  "." 
    XOR (HL)                          ;0xfe52:   ae  "." 
    AND 0x1f                          ;0xfe53:   e6 1f  ".." 
    JP nz, C_F948                     ;0xfe55:   c2 48 f9  ".H." 
;--------------------------------------
D_FE58:                               ; XREF: 0xE10A 0xFBB3 0xFB52 0xFBDB 
    DEFB 0xcd                         ;0xfe58:   ('M') + 0x80
;--------------------------------------
D_FE59:                               ; XREF: 0xFC6C 0xE10D 0xFBAE 0xF22E 0xF251 0xFC93 0xFC76 
    DEFB 0xc0                         ;0xfe59:   ('@') + 0x80
;--------------------------------------
D_FE5A:                               ; XREF: 0xFCA2 
    DEFB 0xf9                         ;0xfe5a:   ('y') + 0x80
;--------------------------------------
D_FE5B:                               ; XREF: 0xFCA9 0xFC9B 
    DEFB 0xca                         ;0xfe5b:   ('J') + 0x80
    DEFB 0x7e                         ;0xfe5c:   "~"
    DEFB 0xf9                         ;0xfe5d:   ('y') + 0x80
    DEFB 0xeb                         ;0xfe5e:   ('k') + 0x80
    DEFB 0xe1                         ;0xfe5f:   ('a') + 0x80
    DEFB 0x23                         ;0xfe60:   "#"
    DEFB 0xe3                         ;0xfe61:   ('c') + 0x80
    DEFB 0x2b                         ;0xfe62:   "+"
    DEFB 0x7d                         ;0xfe63:   "}"
    DEFB 0xb4                         ;0xfe64:   ('4') + 0x80
    DEFB 0xe3                         ;0xfe65:   ('c') + 0x80
    DEFB 0xe5                         ;0xfe66:   ('e') + 0x80
    DEFB 0xeb                         ;0xfe67:   ('k') + 0x80
    DEFB 0xc2                         ;0xfe68:   ('B') + 0x80
    DEFB 0x23                         ;0xfe69:   "#"
    DEFB 0xf9                         ;0xfe6a:   ('y') + 0x80
    DEFB 0x3c                         ;0xfe6b:   "<"
    DEFB 0xe1                         ;0xfe6c:   ('a') + 0x80
    DEFB 0xe1                         ;0xfe6d:   ('a') + 0x80
    DEFB 0xc9                         ;0xfe6e:   ('I') + 0x80
    DEFB 0x3a                         ;0xfe6f:   ":"
    DEFB 0x18                         ;0xfe70:   0x18
    DEFB 0xf6                         ;0xfe71:   ('v') + 0x80
    DEFB 0x3c                         ;0xfe72:   "<"
    DEFB 0xca                         ;0xfe73:   ('J') + 0x80
    DEFB 0xb2                         ;0xfe74:   ('2') + 0x80
    DEFB 0xf9                         ;0xfe75:   ('y') + 0x80
    DEFB 0x3c                         ;0xfe76:   "<"
    DEFB 0xc2                         ;0xfe77:   ('B') + 0x80
    DEFB 0x37                         ;0xfe78:   "7"
    DEFB 0xf9                         ;0xfe79:   ('y') + 0x80
    DEFB 0xd5                         ;0xfe7a:   ('U') + 0x80
    DEFB 0xcd                         ;0xfe7b:   ('M') + 0x80
    DEFB 0xc0                         ;0xfe7c:   ('@') + 0x80
    DEFB 0xf9                         ;0xfe7d:   ('y') + 0x80
    DEFB 0xd1                         ;0xfe7e:   ('Q') + 0x80
    DEFB 0xc2                         ;0xfe7f:   ('B') + 0x80
;--------------------------------------
D_FE80:                               ; XREF: 0xC27A 
    DEFB 0x37                         ;0xfe80:   "7"
    DEFB 0xf9                         ;0xfe81:   ('y') + 0x80
    DEFB 0x3a                         ;0xfe82:   ":"
    DEFB 0x16                         ;0xfe83:   0x16
    DEFB 0xf6                         ;0xfe84:   ('v') + 0x80
    DEFB 0x3c                         ;0xfe85:   "<"
    DEFB 0xca                         ;0xfe86:   ('J') + 0x80
    DEFB 0xa2                         ;0xfe87:   ('"') + 0x80
    DEFB 0xf9                         ;0xfe88:   ('y') + 0x80
    DEFB 0x3c                         ;0xfe89:   "<"
    DEFB 0xca                         ;0xfe8a:   ('J') + 0x80
    DEFB 0x6f                         ;0xfe8b:   "o"
    DEFB 0xf9                         ;0xfe8c:   ('y') + 0x80
    DEFB 0x7e                         ;0xfe8d:   "~"
    DEFB 0xe6                         ;0xfe8e:   ('f') + 0x80
    DEFB 0x1f                         ;0xfe8f:   0x1f
    DEFB 0xc2                         ;0xfe90:   ('B') + 0x80
    DEFB 0x37                         ;0xfe91:   "7"
    DEFB 0xf9                         ;0xfe92:   ('y') + 0x80
    DEFB 0xc3                         ;0xfe93:   ('C') + 0x80
    DEFB 0x7e                         ;0xfe94:   "~"
    DEFB 0xf9                         ;0xfe95:   ('y') + 0x80
    DEFB 0x1a                         ;0xfe96:   0x1a
    DEFB 0xae                         ;0xfe97:   ('.') + 0x80
    DEFB 0xe6                         ;0xfe98:   ('f') + 0x80
    DEFB 0xf                          ;0xfe99:   0xf
    DEFB 0xc2                         ;0xfe9a:   ('B') + 0x80
    DEFB 0x37                         ;0xfe9b:   "7"
    DEFB 0xf9                         ;0xfe9c:   ('y') + 0x80
    DEFB 0x7e                         ;0xfe9d:   "~"
    DEFB 0xe6                         ;0xfe9e:   ('f') + 0x80
    DEFB 0x30                         ;0xfe9f:   "0"
    DEFB 0xfe                         ;0xfea0:   ('~') + 0x80
    DEFB 0x30                         ;0xfea1:   "0"
    DEFB 0xca                         ;0xfea2:   ('J') + 0x80
    DEFB 0x37                         ;0xfea3:   "7"
    DEFB 0xf9                         ;0xfea4:   ('y') + 0x80
    DEFB 0x2a                         ;0xfea5:   "*"
    DEFB 0xe1                         ;0xfea6:   ('a') + 0x80
    DEFB 0xc5                         ;0xfea7:   ('E') + 0x80
    DEFB 0xd5                         ;0xfea8:   ('U') + 0x80
    DEFB 0x22                         ;0xfea9:   """
    DEFB 0x2c                         ;0xfeaa:   ","
    DEFB 0xfa                         ;0xfeab:   ('z') + 0x80
    DEFB 0x21                         ;0xfeac:   "!"
    DEFB 0x2e                         ;0xfead:   "."
    DEFB 0xfa                         ;0xfeae:   ('z') + 0x80
    DEFB 0x22                         ;0xfeaf:   """
    DEFB 0x2a                         ;0xfeb0:   "*"
    DEFB 0xfa                         ;0xfeb1:   ('z') + 0x80
    DEFB 0x1                          ;0xfeb2:   0x1
    DEFB 0x80                         ;0xfeb3:   0x80
    DEFB 0x1                          ;0xfeb4:   0x1
    DEFB 0x0                          ;0xfeb5:   0x0
    DEFB 0xcd                         ;0xfeb6:   ('M') + 0x80
    DEFB 0x4b                         ;0xfeb7:   "K"
    DEFB 0xfc                         ;0xfeb8:   ('|') + 0x80
    DEFB 0x36                         ;0xfeb9:   "6"
    DEFB 0x1                          ;0xfeba:   0x1
    DEFB 0x0                          ;0xfebb:   0x0
    DEFB 0xe                          ;0xfebc:   0xe
    DEFB 0x98                         ;0xfebd:   0x98
    DEFB 0x11                         ;0xfebe:   0x11
    DEFB 0x2a                         ;0xfebf:   "*"
;--------------------------------------
D_FEC0:                               ; XREF: 0xC288 0xC274 
    DEFB 0xfa                         ;0xfec0:   ('z') + 0x80
    DEFB 0xcd                         ;0xfec1:   ('M') + 0x80
    DEFB 0xd5                         ;0xfec2:   ('U') + 0x80
    DEFB 0xf8                         ;0xfec3:   ('x') + 0x80
    DEFB 0xc1                         ;0xfec4:   ('A') + 0x80
    DEFB 0x7d                         ;0xfec5:   "}"
    DEFB 0xb4                         ;0xfec6:   ('4') + 0x80
    DEFB 0xca                         ;0xfec7:   ('J') + 0x80
    DEFB 0xb4                         ;0xfec8:   ('4') + 0x80
    DEFB 0xf8                         ;0xfec9:   ('x') + 0x80
    DEFB 0x7d                         ;0xfeca:   "}"
    DEFB 0xa4                         ;0xfecb:   ('$') + 0x80
    DEFB 0x3c                         ;0xfecc:   "<"
    DEFB 0xca                         ;0xfecd:   ('J') + 0x80
    DEFB 0xb4                         ;0xfece:   ('4') + 0x80
    DEFB 0xf8                         ;0xfecf:   ('x') + 0x80
    DEFB 0x11                         ;0xfed0:   0x11
    DEFB 0x2e                         ;0xfed1:   "."
    DEFB 0xfa                         ;0xfed2:   ('z') + 0x80
    DEFB 0x7d                         ;0xfed3:   "}"
    DEFB 0x93                         ;0xfed4:   0x93
    DEFB 0x6f                         ;0xfed5:   "o"
    DEFB 0x7c                         ;0xfed6:   "|"
    DEFB 0x9a                         ;0xfed7:   0x9a
    DEFB 0x67                         ;0xfed8:   "g"
    DEFB 0x9                          ;0xfed9:   0x9
    DEFB 0x22                         ;0xfeda:   """
;--------------------------------------
D_FEDB:                               ; XREF: 0xFC10 0xFC02 0xFBCE 0xFB3E 
    DEFB 0x28                         ;0xfedb:   "("
    DEFB 0xfa                         ;0xfedc:   ('z') + 0x80
;--------------------------------------
D_FEDD:                               ; XREF: 0xFBBE 0xFBC7 
    DEFB 0xe1                         ;0xfedd:   ('a') + 0x80
    DEFB 0xd1                         ;0xfede:   ('Q') + 0x80
;--------------------------------------
D_FEDF:                               ; XREF: 0xFB4C 0xFD24 
    DEFB 0x1                          ;0xfedf:   0x1
    DEFB 0x24                         ;0xfee0:   "$"
;--------------------------------------
D_FEE1:                               ; XREF: 0xFBE7 0xFBF2 0xFB33 0xFD1B 0xFC1E 
    DEFB 0x1                          ;0xfee1:   0x1
    DEFB 0x0                          ;0xfee2:   0x0
    DEFB 0xc3                         ;0xfee3:   ('C') + 0x80
    DEFB 0x4b                         ;0xfee4:   "K"
    DEFB 0xfc                         ;0xfee5:   ('|') + 0x80
    DEFB 0xfe                         ;0xfee6:   ('~') + 0x80
    DEFB 0x98                         ;0xfee7:   0x98
    DEFB 0xca                         ;0xfee8:   ('J') + 0x80
    DEFB 0x74                         ;0xfee9:   "t"
    DEFB 0xf8                         ;0xfeea:   ('x') + 0x80
    DEFB 0x17                         ;0xfeeb:   0x17
    DEFB 0x3e                         ;0xfeec:   ">"
    DEFB 0x1                          ;0xfeed:   0x1
    DEFB 0x0                          ;0xfeee:   0x0
    DEFB 0xda                         ;0xfeef:   ('Z') + 0x80
    DEFB 0xc8                         ;0xfef0:   ('H') + 0x80
    DEFB 0xf8                         ;0xfef1:   ('x') + 0x80
    DEFB 0x3d                         ;0xfef2:   "="
    DEFB 0x32                         ;0xfef3:   "2"
    DEFB 0x28                         ;0xfef4:   "("
    DEFB 0xfa                         ;0xfef5:   ('z') + 0x80
    DEFB 0x2a                         ;0xfef6:   "*"
    DEFB 0x66                         ;0xfef7:   "f"
    DEFB 0xfb                         ;0xfef8:   ('{') + 0x80
    DEFB 0xf9                         ;0xfef9:   ('y') + 0x80
    DEFB 0x2a                         ;0xfefa:   "*"
    DEFB 0x28                         ;0xfefb:   "("
    DEFB 0xfa                         ;0xfefc:   ('z') + 0x80
    DEFB 0x7d                         ;0xfefd:   "}"
    DEFB 0x44                         ;0xfefe:   "D"
;--------------------------------------
D_FEFF:                               ; XREF: 0xC200 
    DEFB 0xc9                         ;0xfeff:   ('I') + 0x80
;--------------------------------------
ENCRYPTED_USER_NAME:                  ; XREF: 0xC0CB 0xE50D 0xC530 0xC434 0xC515 0xC2B7 
    DEFB 0x1c                         ;0xff00:   0x1c
    DEFB 0x60                         ;0xff01:   "`"
    DEFB 0xa                          ;0xff02:   0xa
    DEFB 0x60                         ;0xff03:   "`"
    DEFB 0x6e                         ;0xff04:   "n"
    DEFB 0x3                          ;0xff05:   0x3
    DEFB 0x2f                         ;0xff06:   "/"
    DEFB 0x2d                         ;0xff07:   "-"
    DEFB 0xa                          ;0xff08:   0xa
    DEFB "! /",34,"*NNNNNNNNNNbnxn"   ;0xff09:   0xff09 to 0xff1c
    DEFB 0xf                          ;0xff1c:   0xf
    DEFB "=&9!!*n", 0x26              ;0xff1d:   0xff1d to 0xff1e
    DEFB "<'8+bn", 0x27               ;0xff25:   0xff25 to 0xff26
    DEFB "; /9/*' )bn", 0x20          ;0xff2c:   0xff2c to 0xff2d
    DEFB "'-:!<'/n}", 0x2d            ;0xff38:   0xff38 to 0xff39
    DEFB 0x7d                         ;0xff42:   
    DEFB 0x7f                         ;0xff43:   
    DEFB 0x62                         ;0xff44:   
    DEFB 0x6e                         ;0xff45:   
    DEFB 0xf                          ;0xff46:   0xf
    DEFB ";=:</",34,"'/`NNNNNNNNNNNNNNCDD"  ;0xff47:   0xff47 to 0xff61
    DEC E                             ;0xff61:   1d  "." 
    DEC HL                            ;0xff62:   2b  "+" 
    INC A                             ;0xff63:   3c  "<" 
    DAA                               ;0xff64:   27  "'" 
    CPL                               ;0xff65:   2f  "/" 
    LD (0x6e),HL                      ;0xff66:   22 6e 00  ""n."  
    DEFB ";#,+<ntn"                   ;0xff69:   0xff69 to 0xff71
;--------------------------------------
ENCRYPTED_SERIAL:                     ; XREF: 0xC428 0xC527 
    DEFB 0x7f                         ;0xff71:   0x7f
    DEFB 0x7c                         ;0xff72:   "|"
    DEFB 0x7d                         ;0xff73:   "}"
    DEFB 0x7c                         ;0xff74:   "|"
    DEFB 0x63                         ;0xff75:   "c"
    DEFB 0x9                          ;0xff76:   0x9
    DEFB 0x1c                         ;0xff77:   0x1c
    DEFB 0xf                          ;0xff78:   0xf
    DEFB 0xa                          ;0xff79:   0xa
    DEFB 0x7f                         ;0xff7a:   0x7f
    DEFB "~|NNNNNNDDC"                ;0xff7b:   0xff7b to 0xff86
;--------------------------------------
ENCRYPTED_PASSWORD_LENGTH:            ; XREF: 0xCA7B 0xCA2E 
    DEFB 0xa2                         ;0xff87:   ('"') + 0x80
;--------------------------------------
ENCRYPTED_PASSWORD:                   ; XREF: 
    DEFB 0xf9                         ;0xff88:   ('y') + 0x80
    DEFB 0xfa                         ;0xff89:   ('z') + 0x80
    DEFB 0xe6                         ;0xff8a:   ('f') + 0x80
    DEFB 0xe3                         ;0xff8b:   ('c') + 0x80
    DEFB 0xe4                         ;0xff8c:   ('d') + 0x80
    DEFB 0xfe                         ;0xff8d:   ('~') + 0x80
    DEFB 0xef                         ;0xff8e:   ('o') + 0x80
    DEFB 0xf8                         ;0xff8f:   ('x') + 0x80
    DEFB "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN"  ;0xff90:   0xff90 to 0xffff
;--------------------------------------
D_FFFF:                               ; XREF: 0xC267 
    DEFB 0xfe                         ;0xffff:   ('~') + 0x80
