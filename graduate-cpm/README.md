# Graduate CP/M Rom

## About

Graduate Software produced a two ROM set that allowed CP/M Plus to be booted without the need for a disc.

They also created a method where additional programs could be installed as addon ROMs.

This project aims to produce a disassembly of thier code to gain a better understanding of the technology.

## Tools used

This was generated using z80-smart-disassembler, available at https://github.com/cormacj/z80-smart-disassembler

## Description of Files

**README.md** - This file

**amstrad-labels.txt** - A list of descriptive code labels with thier locations and definitions for BIOS calls. (used with the disassembler)

**CPM1-rom-template.txt** - A list of locations of strings, data area and other fixups as needed. (used with the disassembler)

**CPM1-rom-details.txt** - The list of commands that the ROM provides

**cpm1.asm** - The disassembled source

## The ROMs

* CPM1.rom
* CPM2.rom
