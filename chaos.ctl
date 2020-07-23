; define macros
@ $7D00 expand=#DEFINE1(DPEEK,#EVAL(((#PEEK({0}+1))*$100)+#PEEK{0}))
@ $7D00 expand=#DEFINE1(SIGNED,#IF({0}>127)(-#EVAL(256-{0}),{0}))
@ $7D00 expand=#DEFINE1(MPRINTLINK,#R#(#DPEEK(#EVAL($CDD3+({0}*4)))))
@ $7D00 expand=#DEFINE1(MTWOPRINTLINK,#R#(#DPEEK(#EVAL($8809+({0}*4)))))
@ $7D00 expand=#DEFINE1(SPRITE,#UDGARRAY#(2,#PEEK({0}+2),4;#DPEEK({0})-#EVAL(#DPEEK({0})+$1F)-8))

@ $7D00 label=start
c $7D00 Start.
C $7D00 Jump to initialization routine.

@ $7D03 label=unknown01
g $7D03 unknown01

@ $7D04 label=routine01
c $7D04 routine01
C $7D04 Return if #R$7D03 is less than 6.
C $7D0A Temporarily store address of #R$E01F(map area object code table) in #R$AC12 variable.
C $7D10 Load B with 159 as loop counter.
C $7D12 Stack loop counter.
C $7D13 Load byte from cell in #R$E01F(map area object code table) into A.
C $7D14 Jump to #R$7D3B if byte is less than 2 or greater than 33.
C $7D1E Add $0281 to address to get address of same cell in #R$E2A0.
C $7D22 Load byte from #R$E2A0 into A.
C $7D23 Subtract 41 from byte read.
C $7D25 Jump to #R$7D3B if result is equal to #R$AC0E variable.
C $7D2B Load address of cell in #R$E01F(map area object code table) back into HL from #R$AC12 variable and add $01E1 to get address of same cell in #R$E200.
C $7D32 Load byte from #R$E200 into A.
C $7D33 Mod 8.
C $7D35 Jump to #R$7D52 if result is equal to #R$AC0E variable.
C $7D3B Pop loop counter.
C $7D3C Increment #R$AC12 variable.
C $7D43 Loop back to #R$7D12 158 times.
C $7D45 Set HL to address of #R$AC1E.
C $7D48 Add value of #R$AC0E variable as offset.
C $7D4F Store $14 in byte pointed to by HL and return.
C $7D52 Pop loop counter.
C $7D53 Set HL to address of #R$AC1E.
C $7D5B Add value of #R$AC0E variable as offset.
C $7D5D Store $00 in byte pointed to by HL and return.

; macro to print out spell data
@ $E440 expand=#DEFINE1(SPELLDATA,Message #PEEK({0}): Casting chance=#PEEK({0}+1)#RAW(,) Max distance=#EVAL(#PEEK({0}+2)/2)#RAW(,) Chaos/Law=#SIGNED(#PEEK({0}+3))#RAW(,) ???=#PEEK({0}+4))

@ $7D60 label=spells_table
b $7D60 Spells table.
D $7D60 5 bytes of spell data followed by address of spell routine.
B $7D60,5 #SPELLDATA$7D60
W $7D65,2
B $7D67,5 #SPELLDATA$7D67
W $7D6C,2
B $7D6E,5 #SPELLDATA$7D6E
W $7D73,2
B $7D75,5 #SPELLDATA$7D75
W $7D7A,2
B $7D7C,5 #SPELLDATA$7D7C
W $7D81,2
B $7D83,5 #SPELLDATA$7D83
W $7D88,2
B $7D8A,5 #SPELLDATA$7D8A
W $7D8F,2
B $7D91,5 #SPELLDATA$7D91
W $7D96,2
B $7D98,5 #SPELLDATA$7D98
W $7D9D,2
B $7D9F,5 #SPELLDATA$7D9F
W $7DA4,2
B $7DA6,5 #SPELLDATA$7DA6
W $7DAB,2
B $7DAD,5 #SPELLDATA$7DAD
W $7DB2,2
B $7DB4,5 #SPELLDATA$7DB4
W $7DB9,2
B $7DBB,5 #SPELLDATA$7DBB
W $7DC0,2
B $7DC2,5 #SPELLDATA$7DC2
W $7DC7,2
B $7DC9,5 #SPELLDATA$7DC9
W $7DCE,2
B $7DD0,5 #SPELLDATA$7DD0
W $7DD5,2
B $7DD7,5 #SPELLDATA$7DD7
W $7DDC,2
B $7DDE,5 #SPELLDATA$7DDE
W $7DE3,2
B $7DE5,5 #SPELLDATA$7DE5
W $7DEA,2
B $7DEC,5 #SPELLDATA$7DEC
W $7DF1,2
B $7DF3,5 #SPELLDATA$7DF3
W $7DF8,2
B $7DFA,5 #SPELLDATA$7DFA
W $7DFF,2
B $7E01,5 #SPELLDATA$7E01
W $7E06,2
B $7E08,5 #SPELLDATA$7E08
W $7E0D,2
B $7E0F,5 #SPELLDATA$7E0F
W $7E14,2
B $7E16,5 #SPELLDATA$7E16
W $7E1B,2
B $7E1D,5 #SPELLDATA$7E1D
W $7E22,2
B $7E24,5 #SPELLDATA$7E24
W $7E29,2
B $7E2B,5 #SPELLDATA$7E2B
W $7E30,2
B $7E32,5 #SPELLDATA$7E32
W $7E37,2
B $7E39,5 #SPELLDATA$7E39
W $7E3E,2
B $7E40,5 #SPELLDATA$7E40
W $7E45,2
B $7E47,5 #SPELLDATA$7E47
W $7E4C,2
B $7E4E,5 #SPELLDATA$7E4E
W $7E53,2
B $7E55,5 #SPELLDATA$7E55
W $7E5A,2
B $7E5C,5 #SPELLDATA$7E5C
W $7E61,2
B $7E63,5 #SPELLDATA$7E63
W $7E68,2
B $7E6A,5 #SPELLDATA$7E6A
W $7E6F,2
B $7E71,5 #SPELLDATA$7E71
W $7E76,2
B $7E78,5 #SPELLDATA$7E78
W $7E7D,2
B $7E7F,5 #SPELLDATA$7E7F
W $7E84,2
B $7E86,5 #SPELLDATA$7E86
W $7E8B,2
B $7E8D,5 #SPELLDATA$7E8D
W $7E92,2
B $7E94,5 #SPELLDATA$7E94
W $7E99,2
B $7E9B,5 #SPELLDATA$7E9B
W $7EA0,2
B $7EA2,5 #SPELLDATA$7EA2
W $7EA7,2
B $7EA9,5 #SPELLDATA$7EA9
W $7EAE,2
B $7EB0,5 #SPELLDATA$7EB0
W $7EB5,2
B $7EB7,5 #SPELLDATA$7EB7
W $7EBC,2
B $7EBE,5 #SPELLDATA$7EBE
W $7EC3,2
B $7EC5,5 #SPELLDATA$7EC5
W $7ECA,2
B $7ECC,5 #SPELLDATA$7ECC
W $7ED1,2
B $7ED3,5 #SPELLDATA$7ED3
W $7ED8,2
B $7EDA,5 #SPELLDATA$7EDA
W $7EDF,2
B $7EE1,5 #SPELLDATA$7EE1
W $7EE6,2
B $7EE8,5 #SPELLDATA$7EE8
W $7EED,2
B $7EEF,5 #SPELLDATA$7EEF
W $7EF4,2
B $7EF6,5 #SPELLDATA$7EF6
W $7EFB,2
B $7EFD,5 #SPELLDATA$7EFD
W $7F02,2
B $7F04,5 #SPELLDATA$7F04
W $7F09,2
B $7F0B,5 #SPELLDATA$7F0B
W $7F10,2
B $7F12,5 #SPELLDATA$7F12
W $7F17,2
B $7F19,5 #SPELLDATA$7F19
W $7F1E,2
B $7F20,5 #SPELLDATA$7F20
W $7F25,2

@ $7F27 label=s_cursor_sprite
b $7F27 S cursor sprite data.
B $7F27,$20,8 #HTML(#UDGARRAY2,,4;$7F27-$7F46-8(scursorsprite) )S cursor.

@ $7F47 label=posessed_spell_tables
g $7F47 Table of posessed spells.
B $7F47,$28 wizard 1
B $7F6F,$28 wizard 2
B $7F97,$28 wizard 3
B $7FBF,$28 wizard 4
B $7FE7,$28 wizard 5
B $800F,$28 wizard 6
B $8037,$28 wizard 7
B $805F,$28 wizard 8

u $8087

b $80B0 Modified wizard sprites data.
@ $80B0 label=modwizardsprite0
B $80B0,$20 #HTML(#UDGARRAY2,,4;$80B0-$80CF-8(modwizardsprite0*)) modwizardsprite0.
@ $80D0 label=modwizardsprite1
B $80D0,$20 #HTML(#UDGARRAY2,,4;$80D0-$80EF-8(modwizardsprite1*)) modwizardsprite1.
@ $80F0 label=modwizardsprite2
B $80F0,$20 #HTML(#UDGARRAY2,,4;$80F0-$810F-8(modwizardsprite2*)) modwizardsprite2.
@ $8110 label=modwizardsprite3
B $8110,$20 #HTML(#UDGARRAY2,,4;$8110-$812F-8(modwizardsprite3*)) modwizardsprite3.
@ $8130 label=modwizardsprite4
B $8130,$20 #HTML(#UDGARRAY2,,4;$8130-$814F-8(modwizardsprite4*)) modwizardsprite4.
@ $8150 label=modwizardsprite5
B $8150,$20 #HTML(#UDGARRAY2,,4;$8150-$816F-8(modwizardsprite5*)) modwizardsprite5.
@ $8170 label=modwizardsprite6
B $8170,$20 #HTML(#UDGARRAY2,,4;$8170-$818F-8(modwizardsprite6*)) modwizardsprite6.
@ $8190 label=modwizardsprite7
B $8190,$20 #HTML(#UDGARRAY2,,4;$8190-$81AF-8(modwizardsprite7*)) modwizardsprite7.
@ $81B0 label=modwizardsprite8
B $81B0,$20 #HTML(#UDGARRAY2,,4;$81B0-$81CF-8(modwizardsprite8*)) modwizardsprite8.
@ $81D0 label=modwizardsprite9
B $81D0,$20 #HTML(#UDGARRAY2,,4;$81D0-$81EF-8(modwizardsprite9*)) modwizardsprite9.
@ $81F0 label=modwizardspriteA
B $81F0,$20 #HTML(#UDGARRAY2,,4;$81F0-$820F-8(modwizardspriteA*)) modwizardspriteA.
@ $8210 label=modwizardspriteB
B $8210,$20 #HTML(#UDGARRAY2,,4;$8210-$822F-8(modwizardspriteB*)) modwizardspriteB.
@ $8230 label=modwizardspriteC
B $8230,$20 #HTML(#UDGARRAY2,,4;$8230-$824F-8(modwizardspriteC*)) modwizardspriteC.
@ $8250 label=modwizardspriteD
B $8250,$20 #HTML(#UDGARRAY2,,4;$8250-$826F-8(modwizardspriteD*)) modwizardspriteD.
@ $8270 label=modwizardspriteE
B $8270,$20 #HTML(#UDGARRAY2,,4;$8270-$828F-8(modwizardspriteE*)) modwizardspriteE.

w $8290 Table of pointers to modified wizard sprites.
@ $8290 label=modwizard_pointers_1
W $8290 #HTML(#UDGARRAY*modwizardsprite0;modwizardsprite1;modwizardsprite2;modwizardsprite1(modwizard0121)) Animation cycle modwizard 0,1,2,1.
@ $8298 label=modwizard_pointers_2
W $8298 #HTML(#UDGARRAY*modwizardsprite3;modwizardsprite4;modwizardsprite5;modwizardsprite4(modwizard3454)) Animation cycle modwizard 3,4,5,4.
@ $82A0 label=modwizard_pointers_3
W $82A0 #HTML(#UDGARRAY*modwizardsprite6(modwizardsprite6)) Animation cycle modwizard 6,6,6,6.
@ $82A8 label=modwizard_pointers_4
W $82A8 #HTML(#UDGARRAY*modwizardsprite7(modwizardsprite7)) Animation cycle modwizard 7,7,7,7.
@ $82B0 label=modwizard_pointers_5
W $82B0 #HTML(#UDGARRAY*modwizardsprite8;modwizardsprite9;modwizardspriteA;modwizardsprite9(modwizard89A9)) Animation cycle modwizard 8,9,A,9.
@ $82B8 label=modwizard_pointers_6
W $82B8 #HTML(#UDGARRAY*modwizardspriteB;modwizardspriteC;modwizardspriteD;modwizardspriteE(modwizardBCDE)) Animation cycle modwizard B,C,D,E.

w $82C0 Table of pointers to character sprite data.
@ $82C0 label=character_1_sprite_pointers
W $82C0 Character 1.
@ $82C8 label=character_2_sprite_pointers
W $82C8 Character 2.
@ $82D0 label=character_3_sprite_pointers
W $82D0 Character 3.
@ $82D8 label=character_4_sprite_pointers
W $82D8 Character 4.
@ $82E0 label=character_5_sprite_pointers
W $82E0 Character 5.
@ $82E8 label=character_6_sprite_pointers
W $82E8 Character 6.
@ $82F0 label=character_7_sprite_pointers
W $82F0 Character 7.
@ $82F8 label=character_8_sprite_pointers
W $82F8 Character 8.

@ $8300 label=get_wizard_object
c $8300 Get address of the wizard object data of the current player.
C $8300 Preserve contents of HL.
C $8301 Add 40 to #R$AC0E variable.
C $8308 Multiply by two.
C $830A Add to address of #R$E3E0(object address table) to give address of current player's object pointer in HL.
C $830F Read address of wizard object into DE.
C $8312 Swap address into HL and store in #R$89AA.
C $8319 Add $17 to address and store in #R$8321.
C $831D Restore contents of HL and return.

@ $831F label=current_character_pointer
g $831F current_character_pointer
W $831F Pointer to current character in #R$82C0(table of pointers to character sprite data).

@ $8321 label=temp_pointer
g $8321 temp_pointer
W $8321 Temporary pointer used by multiple routines.

@ $8323 label=no_less_than_2_flag
g $8323 no_less_than_2_flag
B $8323 Flag that prevents entering a number less than 2.

@ $8324 label=routine02
c $8324 routine02
C $8324 Get address of first sprite pointer in wizard object data of current player.
C $8327 Set B to four as a loop counter and push to stack.
C $832A Set B to two as another counter and push to stack.
C $832D Load #R$831F into HL.
C $8330 Read low byte of sprite data pointer to A first time, high byte on second time around loop.
C $8331 Increment HL and store back in #R$831F.
C $8335 Store the low byte of sprite data pointer in wizard data object at the address held in #R$8321. Second time around loop high byte is stored.
C $8339 Increment HL and store back in #R$8321.
C $833D Pop loop counter and repeat inner loop.
C $8340 Increment address in #R$8321 because there is a byte gap between each sprite pointer in wizard object data.
C $8347 Pop loop counter and repeat outer loop three times before returning.

c $834B routine03
@ $834B label=routine03
C $834B Add #R$AC0E variable to address of #R$AC16.
C $8355 Read byte from that address into A and Return.

@ $8357 label=routine04
c $8357 routine04
C $8357 If player is human, display wizard name, spell being cast, and spell casting range.
C $8360 Call #R$9760 ???
C $8363 Call #R$97D1 ???
C $8366 Call #R$A18A ??? and return.

# spell names from comments on chaos
@ $836A label=magic_armour_spell
c $836A MagicArmour spell.
C $836A Jump to #R$837D if player is human.
C $8370 Else call #R$834B to get byte from #R$AC16.
C $8373 Jump to #R$83AF if bit 7 is clear.
C $8377 Set #R$975F variable to zero and return.
C $837D Call #R$8357 ???
C $8380 Jump to #R$8395 if #R$9167 is clear.
C $8386 Set #R$831F to #R$82A0.
C $838C Copy sprite pointers to wizard data.
C $838F Get byte from #R$AC16.
C $8392 Set bits 6 and 7.
C $8394 Store result back in #R$AC16.
C $8395 Call #R$C0DD ???
C $8398 Display SPELL FAILS or SPELL SUCCEEDS message and return.

@ $839C label=magic_sword_spell
c $839C MagicSword spell.
C $839C Jump to #R$83AF if player is human.
C $83A2 Else call #R$834B to get byte from #R$AC16.
C $83A5 Jump to #R$83AF if bit 2 is clear.
C $83A9 Set #R$975F variable to zero and return.
C $83AF Call #R$8357 ???
C $83B2 Jump to #R$83C9 if #R$9167 is clear.
C $83B8 Set #R$831F to #R$8290.
C $83BE Copy sprite pointers to wizard data.
C $83C1 Get byte from #R$AC16.
C $83C4 Clear bits 0 and 1, and set bit 2.
C $83C8 Store result back in #R$AC16.
C $83C9 Call #R$C0DD ???
C $83CC Display SPELL FAILS or SPELL SUCCEEDS message and return.

@ $83D0 label=magic_knife_spell
c $83D0 MagicKnife spell.
C $83D0 Jump to #R$83E3 if player is human.
C $83D6 Else call #R$834B to get byte from #R$AC16.
C $83D9 Jump to #R$83E3 if lowest three bits are clear.
C $83DD Set #R$975F variable to zero and return.
C $83E3 Call #R$8357 ???
C $83E6 Jump to #R$83FD if #R$9167 is clear.
C $83EC Set #R$831F to #R$8298.
C $83F2 Copy sprite pointers to wizard data.
C $83F5 Get byte from #R$AC16.
C $83F8 Clear bits 0 and 2, and set bit 1.
C $83FC Store result back in #R$AC16.
C $83FD Call #R$C0DD ???
C $8400 Display SPELL FAILS or SPELL SUCCEEDS message and return.

@ $8404 label=magic_shield_spell
c $8404 MagicShield spell.
C $8404 Jump to #R$8417 if player is human.
C $840A Else call #R$834B to get byte from #R$AC16.
C $840D Jump to #R$8417 if bit 6 is clear.
C $8411 Set #R$975F variable to zero and return.
C $8417 Call #R$8357 ???
C $841A Jump to #R$8431 if #R$9167 is clear.
C $8420 Set #R$831F to #R$82A8.
C $8426 Copy sprite pointers to wizard data.
C $8429 Get byte from #R$AC16.
C $842C Clear bit 7 and set bit 6.
C $8430 Store result back in #R$AC16.
C $8431 Call #R$C0DD ???
C $8434 Display SPELL FAILS or SPELL SUCCEEDS message and return.

@ $8438 label=magic_wings_spell
c $8438 MagicWings spell.
C $8438 Jump to #R$844B if player is human.
C $843E Else call #R$834B to get byte from #R$AC16.
C $8441 Jump to #R$844B if bit 5 is clear.
C $8445 Set #R$975F variable to zero and return.
C $844B Call #R$8357 ???
C $844E Jump to #R$8463 if #R$9167 is clear.
C $8454 Set #R$831F to #R$82B0.
C $845A Copy sprite pointers to wizard data.
C $845D Get byte from #R$AC16.
C $8460 Set bit 5
C $8462 Store result back in #R$AC16.
C $8463 Call #R$C0DD ???
C $8466 Display SPELL FAILS or SPELL SUCCEEDS message and return.

@ $846A label=magic_bow_spell
c $846A MagicBow spell.
C $846A Jump to #R$8486 if player is human.
C $8470 Else call #R$8300 to get address of the wizard object data of the current player.
C $8473 Ensure the carry flag is clear.
C $8474 Load address from #R$8321 into HL and subtract $0009.
C $847C If byte at resulting address is zero then jump to #R$8486.
C $8480 Set #R$975F variable to zero and return.
C $8486 Call #R$8357 ???
C $8489 Jump to #R$84A9 if #R$9167 is clear.
C $848F Set #R$831F to #R$82B8.
C $8495 Copy sprite pointers to wizard data.
C $8498 Get address of the wizard object data of the current player.
C $849B Load address from #R$8321 into HL and subtract $0009.
C $84A4 Store $03 at resulting address ???
C $84A6 Increment address and store $06 ???
C $84A9 Call #R$C0DD ???
C $84AC Display SPELL FAILS or SPELL SUCCEEDS message and return.

@ $84B0 label=chaos_law_spell
c $84B0 ChaosOrLawSpell.
C $84B0 Jump to #R$84B9 if player is human.
C $84B6 Else display wizard name, spell being cast, and spell casting range.
C $84B9 Call #R$9760 ???
C $84BC Display SPELL FAILS or SPELL SUCCEEDS message and return.

@ $84C0 label=shadow_form_spell
c $84C0 ShadowForm spell.
C $84C0 Jump to #R$84D3 if player is human.
C $84C6 Else call #R$834B to get byte from #R$AC16.
C $84C9 Jump to #R$84D3 if bit 5 zero.
C $84CD Set #R$975F variable to zero and return.
C $84D3 Call #R$8357 ???
C $84D6 Display SPELL FAILS or SPELL SUCCEEDS message.
C $84D9 Return if #R$9167 is clear.
C $84DE Get address of the wizard object data of the current player.
C $84E1 Load address from #R$8321 into HL and add $0005.
C $84E8 Store zero at resulting address ???
C $84EA Add $0006 to address and store zero at resulting address ???
C $84F0 Get byte from #R$AC16.
C $84F3 Set bit 3. 
C $84F5 Store result back in #R$AC16 and return.

@ $84F7 label=subversion_spell
c $84F7 Subversion spell.
C $84F7 Jump to #R$853B if player is not human.
C $84FD Clear bottom row of screen.
C $8500 Set P-FLAGS to 3 (OVER mode).
C $8505 Call #R$BC96 ???
C $8508 Call KEYBOARD routine in Spectrum ROM.
C $850B If keypress is 'S' jump to #R$851B.
C $850F Else if keypress is not 'K' loop back to #R$8508.
@ $8513 label=subversion_pressed_k
C $8513 Play #R$C2B1.
C $8519 Enable interrupts and return.
@ $851B label=subversion_pressed_s
C $851B

@ $853B label=subversion_computer

@ $8557 label=BART_L
@ $8567 label=OK_SUB
@ $859C label=SUB_DO
@ $85A5 label=BALSUP
@ $85CA label=TOFAIL

@ $85F6 label=raise_dead_spell
c $85F6 RaiseDead spell.
@ $85D3 label=YESSUB 
@ $8604 label=RAILOO
@ $861A label=RAI_CH
@ $8639 label=RASART
@ $8647 label=RASLOO
@ $8676 label=RASBAK
@ $868D label=LOORAS
@ $869A label=OK_RAS

@ $86C3 label=RAISDO 
c $86C3 RAISDO

@ $86EB label=ENDRAS

# spell name from comments on chaos
@ $86EF label=turmoil_spell
c $86EF Turmoil spell.
C $86EF Jump to #R$86F9 if player is human.
C $86F5 Else call #R$8741 and return.
@ $86F9 label=TURART
C $86F9 Copy #R$AC14 into #R$C78B.
C $86FF Call #R$C7BC.
C $8702 Copy #R$C78B to #R$AC14.
C $8708 Set #R$CD86 to address of #R$D3F2.
C $870E Load #R$C7BB to A and add 1.
C $8712 Call #R$C64C.
C $8715 Set #R$A172 to zero.
@ $871A label=LOOTUR
C $871A Load #R$CD86 into HL.
C $871D Load byte from address in #R$CD86.
C $871E Increment address in #R$CD86.
C $8722 If byte read is not zero jump to #R$872B.
C $8725 Else set #R$975F to zero and return.
@ $872B label=ADD_ON
C $872B Add value in A to #R$872B.
C $8730 If #R$872B < 30 then jump back to #R$871A.
C $8735 Display wizard name, spell being cast, and spell casting range.
C $8738 Call #R$8741 and return.

@ $873C label=CRE000
g $873C CRE000
@ $873D label=FLA481
g $873D FLA481
@ $873E label=HID641
g $873E HID641
@ $873F label=BOD801
g $873F BOD801
@ $8740 label=FRA321
g $8740 FRA321

@ $8741 label=TUR_DO
c $8741 TUR_DO
@ $8756 label=MOLLOO
@ $8784 label=RANMOL
@ $87DF label=MOLEND
@ $87EB label=FUCKIT

@ $87EF label=M2PRIN
c $87EF Print a message from #R$8809(game messages table 2).
R $87EF A Message number
R $87EF BC Coordinates
C $87EF Preserve HL, DE, and BC.
C $87F2 Set HL to value in A (message number).
C $87F5 Multiply HL by four because each row is 4 bytes.
C $87F7 Add address of #R$8809 to get address of desired row in #R$8809(game messages table 2).
C $87FB Load address of message into DE.
C $87FE Load message length into C.
C $8800 Swap DE into HL.
C $8801 Copy message length into E.
C $8802 Restore coordinates in BC.
C $8803 Print string.
C $8806 Restore DE and HL, and return.

@ $8809 label=M2ESAG
b $8809 Game messages table 2
D $8809 Address,Length
W $8809,$50,4

t $8859 Game message strings 2
@ $8859 label=M_1
T $8859 M_1
@ $8875 label=M_2
T $8875 M_2
@ $8885 label=M_3
T $8885 M_3
@ $8897 label=M_4
T $8897 M_4
@ $88A6 label=M_5
T $88A6 M_5
@ $88AD label=M_6
T $88AD M_6
@ $88C2 label=M_7
T $88C2 M_7
@ $88C5 label=M_8
T $88C5 M_8
@ $88C7 label=M_9
T $88C7 M_9
@ $88E2 label=M_10
T $88E2 M_10
@ $88FE label=M_11
T $88FE M_11
@ $890C label=M_12
T $890C M_12
@ $891A label=M_13
T $891A M_13
@ $892B label=M_14
T $892B M_14
@ $8941 label=M_15
T $8941 M_15
@ $894F label=M_16
T $894F M_16
@ $895D label=M_17
T $895D M_17
@ $8979 label=M_18
T $8979 M_18
@ $8987 label=M_19
B $8987 M_19
@ $8997 label=M_20
B $8997 M_20

@ $89A7 label=LEVEL
g $89A7 LEVEL
@ $89A8 label=NUM
g $89A8 NUM
@ $89A9 label=GAMTUN
g $89A9 GAMTUN
@ $89AA label=player_name_string
@ $89AA ssub=DEFW $EA39+$23
g $89AA player name string pointer
@ $89AC label=POSPRI
g $89AC POSPRI
@ $89AE label=string_length
g $89AE string length
@ $89AF label=KEY_P
g $89AF KEY_P

@ $89B0 label=CHONUM
c $89B0 CHONUM
D $89B0 Get a number from user between 1-8 or 2-8 depending on state of flag, print it at coordinates in BC, and return number-1 in A.
C $89B0 Preserve coordinates.
@ $89B1 label=KEYIT
C $89B1 Call KEYBOARD routine in Spectrum ROM.
C $89B4 Jump back to #R$89B1 until a number between 1 and 9 is pressed.
C $89BE Store key code in #R$89A8.
C $89C1 If #R$8323 is clear jump to #R$89CF.
C $89C7 Else load #R$89A8 into A (key code of key pressed).
C $89CA Jump back to #R$89B1 if the number was less than 2.
@ $89CF label=NOADD
C $89CF Restore coordinates.
C $89D0 Set ATTR-T to $47 (bright white on black).
C $89D5 Load #R$89A8 into A and call #R$BAD6 to print it at coordinates in BC.
C $89DB Set HL to #R$89EF (key bloop sound effect) and call play_sound_effect_in_HL.
C $89E1 Call #R$907B.
C $89E4 Clear flag byte that prevents entering a number less than 2.
C $89E9 Load #R$89A8 into A and subtract $31 so that A = number pressed-1 and return.

@ $89EF label=S60
b $89EF S60
D $89EF key bloop sound effect.

@ $89F9 label=init_routine
c $89F9 Initialization routine.
C $89F9 Set border to black.
C $89FC Set ATTR-T to black.
C $89FF Set ATTR-P to black.
C $8A02 Set MASK-P to all transparent.
C $8A07 Set P-FLAGS to 3 (OVER mode).
C $8A0C Disable interrupts.
C $8A0D Call #R$C5EE ???
C $8A10 Zero out 32 bytes at #R$AC16.
@ $8A13 ssub=LD DE,$AC16+1
C $8A1D Zero out #R$7F47.
@ $8A20 ssub=LD DE,$7F47+1
C $8A2A Zero out #R$E01F.
@ $8A2D ssub=LD DE,$E01F+1
C $8A37 Zero out #R$E0C0(other five map area tables). These tables hold the data for what object are on the screen and their state.
@ $8A3A ssub=LD DE,$E0C0+1
C $8A44 Set #R$C3A4 to zero.
C $8A49 Set ATTR-T to $5A (bright red on magenta) and draw border.
C $8A51 Set ATTR-T to $43 (bright magenta on black).
C $8A56 Print message #MTWOPRINTLINK($00) at coordinates (2,2).
C $8A5E Set ATTR-T to $42 (bright red on black).
C $8A63 Print message #MTWOPRINTLINK($01) at coordinates (8,4).
C $8A6B Set ATTR-T to $46 (bright yellow on black).
C $8A70 Print message #MTWOPRINTLINK($02) at coordinates (2,9).
C $8A78 Set ATTR-T to $44 (bright green on black).
C $8A7D Print message #MTWOPRINTLINK($0E) at coordinates (2,11).
C $8A85 Set BC to coordinates (20,9).
C $8A88 Set the flag to prevent numbers less than 2 in input.
C $8A8D Call #R$89B0 ???
C $8A90 Increment the number input and store in #R$AC0F.
C $8A94 Set ATTR-T to $46 (bright yellow on black).
C $8A99 Print message #MTWOPRINTLINK($08) at coordinates (2,14).
C $8AA1 Set ATTR-T to $43 (bright magenta on black).
C $8AA6 Print message #MTWOPRINTLINK($03) at coordinates (2,16).
C $8AAE Call #R$89B0 with coordinates 29,14.
C $8AB4 Store input in #R$89A7.
C $8AB7 Multiply level by four and add fifteen.
C $8ABD Store the result in #R$89A9.
C $8AC0 Set B to ten as a loop counter.
@ $8AC2 label=REPWAT
C $8AC2 Preserve BC and call #R$96E6 ??? then restore BC.
C $8AC7 Repeat for ten iterations.
C $8AC9 Set #R$AC0E to zero.
C $8ACE Get #R$AC0F into B, and store #R$D3F2 in #R$CD86.
@ $8AD8 label=STALOO
C $8AD8 Preserve BC.
C $8AD9 call #R$C5EE ???
C $8ADC Set ATTR-T to $69 (bright cyan on black) and draw border.
C $8AE4 Set ATTR-T to $46 (bright yellow on black) and print message #MTWOPRINTLINK($04) at coordinates (2,2).
C $8AF1 Get current player number, add $31 to convert to char value and call #R$BAD6.
C $8AF9 Set ATTR-T to $43 (bright magenta on black) and print message #MTWOPRINTLINK($09) at coordinates (2,4).
C $8B06 Get address of wizard object data for current player.
C $8B09 Set #R$89AE to zero.
C $8B0E Set #R$89AC to coordinates (2,6) and set ATTR-T to $45 (bright cyan on black).
@ $8B19 label=INPLOO
C $8B19 Call KEYBOARD in Spectrum ROM.
C $8B1C Store keypress in #R$89AF.
C $8B1F If key is 'enter' jump to #R$8B95.
C $8B24 If key is not 'delete' jump to #R$8B56.
C $8B28 If #R$89AE is zero jump back to #R$8B19.
C $8B2E Load #R$89AC into BC and decrement (move cursor left over letter to delete).
C $8B33 Call #R$BAD6 ??? with A set to $20 (space) to blank out letter under cursor.
C $8B38 Decrement #R$89AC again ready for next letter.
C $8B3F Decrement #R$89AE.
C $8B43 Decrement #R$89AA pointer (move back over last character).
C $8B4A Set HL to #R$89EF (key bloop sound) and call #R$C2F9.
C $8B50 Call #R$96E6 ??? then jump back to #R$8B19.
@ $8B56 label=NO_DEL
C $8B56 If string length equals 11 jump back to #R$8B19.
C $8B5E If #R$89AF is 'space' jump to #R$8B6F.
C $8B65 If #R$89AF is less than 'A' or greater than 'z' jump back to #R$8B19.
@ $8B6F label=SPACE
C $8B6F Store space character at the position given by the #R$89AA pointer.
C $8B73 Advance the #R$89AA pointer and store.
C $8B77 Increment #R$89AE.
C $8B7B Load #R$89AC into BC and call #R$BAD6 to print character still in A (space) at those coordinates.
C $8B82 Increment #R$89AC.
C $8B89 Play key bloop sound effect.
C $8B8F Call #R$907B ??? then jump back to #R$8B19.
@ $8B95 label=ENTER
C $8B95 Read string length into A. If zero jump back to #R$8B19.
C $8B9C Set HL = #R$AC0E + $29.
C $8BA4 Multiply result by four.
C $8BA6 Add result to address of #R$CDD3(game messages table 1) to point at offset to relevant wizard data.
C $8BAA Move past address word in table to wizard name length.
C $8BAC Read #R$89AE variable again and write into table.
C $8BB0 Call #R$907B ???
C $8BB3 Set ATTR-T to $43 (bright magenta on black) and print message #MTWOPRINTLINK($05) at coordinates (2,9).
C $8BC0 Set ATTR-T to $46 (bright yellow on black).
C $8BC5 Set #R$AC2E to zero (current player is human).
@ $8BCA label=Y_OR_N
C $8BCA Call KEYBOARD in Spectrum ROM.
C $8BCD If keypress is 'Y' jump to #R$8BDF.
C $8BD1 If keypress is not 'N' jump back to #R$8BCA.
C $8BD5 Print message #MTWOPRINTLINK($07) at coordinates (23,9).
C $8BDD Jump to #R$8BF8.
@ $8BDF label=YES_CC
C $8BDF Print message #MTWOPRINTLINK($08) at 23,9.
C $8BE7 Set HL to #R$AC26 + #R$AC0E.
C $8BF1 Write $01 to #R$AC26 + #R$AC0E.
C $8BF3 Set #R$AC2E.
@ $8BF8 label=NOT_CC
C $8BF8 Play key bloop sound effect.
C $8BFE Call #R$907B ???
C $8C01 Set ATTR-T to $43 (bright magenta on black) and print message #MTWOPRINTLINK($0C) at coordinates (2,11).
C $8C0E Set ATTR-T to $45 (bright cyan on black) and print message #MTWOPRINTLINK($0D) at coordinates (2,13).
C $8C1B Set #R$89AC to coordinates (3,13).
C $8C22 Set #R$89A8 to zero.
C $8C27 Set B to eight as a loop counter.
@ $8C29 label=P_WIZL
C $8C29 Preserve the loop counter.
C $8C2A Copy #R$89A8 to #R$90DF.
C $8C30 Increment #R$89A8.
C $8C34 Call #R$90F0 (print character sprite).
C $8C37 Sdd three to #R$89AC.
C $8C42 Restore loop counter.
C $8C43 Loop back to #R$8C29 for eight iterations.
C $8C45 Call #R$89B0 with coordinates (19,11).
C $8C4B Store number returned in #R$90DF.
C $8C4E Set #R$89AC to coordinates (20,11) and call #R$90F0.
C $8C58 Set HL to unknown data block at #R$82C0.
C $8C5B Multiply #R$90DF by eight and add to #R$82C0 to give address of pointer to sprite data for selected character.
C $8C68 Store result at address in #R$831F.
C $8C6B Copy pointers to sprite data of chosen character to wizard object data for current player.
C $8C6E Set ATTR-T to $43 (bright magenta on black) and print message #MTWOPRINTLINK($0B) at coordinates (2,16).
C $8C7B Set ATTR-T to $46 (bright yellow on black) and print message #MTWOPRINTLINK($0D) at coordinates (2,18).
C $8C88 Set #R$89AC to coordinates (3,18).
C $8C8F Set #R$8321 to address of #R$90D7 (attribute table).
C $8C95 Set B to eight as loop counter.
@ $8C97 label=COLOO
C $8C97 Preserve the loop counter.
C $8C98 Read byte from address held in #R$8321.
C $8C9C Store in ATTR-T.
C $8C9F Increment HL and store back in #R$8321.
C $8CA3 Print character sprite.
C $8CA6 Add three to #R$89AC.
C $8CB0 Restore loop counter from stack.
C $8CB1 Loop back to #R$8C97 for eight iterations.
C $8CB3 Call #R$89B0 with coordinates (16,16) ???
C $8CB9 Add number returned to address of #R$90D7 giving address of byte in attribute table corresponding to chosen colour.
C $8CC0 Read attribute byte from attribute table and set ATTR-T.
C $8CC4 Set #R$89AC to coordinates (17,16) and print character sprite.
C $8CCE Get address of first sprite pointer in wizard object data of the current player).
C $8CD1 load address of first sprite pointer in wizard object data from #R$8321 into HL and decrement (HL = address of first sprite pointer - 1).
C $8CD5 Set DE to three.
C $8CD8 Read ATTR-T onto A.
C $8CDB Set B to four as a loop counter.
@ $8CDD label=PUTATL
C $8CDD Add three to HL to point at next attr byte in wizard data
C $8CDE Write attribute byte to wizard data.
C $8CDF Loop back to #R$8CDD for four iterations.
C $8CE1 Set #R$9049 to zero.
C $8CE6 If player is human then jump to #R$8CF2.
C $8CEC Else copy #R$89A7 to #R$9049.
@ $8CF2 label=MAKCHR
C $8CF2 Get address of first sprite pointer in wizard object data of the current player.
C $8CF5 Read #R$89AA into HL.
C $8CF8 Move past player name string to player stats.
C $8CFD Call #R$904B ???
C $8D00 Halve value in A and add one, add #R$9049 divided by two.
C $8D0A Store calculated value in first byte of wizard stats (combat).
C $8D0B Set second and third bytes of wizard stats to zero (ranged combat and range).
C $8D11 Call #R$904B ???
C $8D14 Halve value, add one, add to #R$9049 divided by two.
C $8D1E Store in fourth byte of wizard stats (defence).
C $8D20 Set fifth byte of wizard stats to one (movement allowance).
C $8D23 Call #R$904B ???
C $8D26 Halve value, add three, add to #R$9049 divided by four.
C $8D33 Store in sixth byte of wizard stats (manouvre rating).
C $8D35 Call #R$904B ???
C $8D38 Divide value by four, add six and store in seventh byte of wizard stats (magic resistance).
C $8D40 Call #R$904B ???
C $8D43 Halve value, add eleven, add #R$9049.
C $8D4C If result is less than twenty one jump to #R$8D53 else set A to twenty. In other words limit the value to twenty.
@ $8D53 label=NOTMOR
C $8D53 Store value in #R$904A and in eighth byte of wizard stats (spells).
C $8D58 Set ninth byte in wizard stats to zero (ability).
C $8D5B Halve #R$9049 and subtract from five.
C $8D64 Store result in #R$A172.
C $8D67 Call #R$904B ???
C $8D6A Compare returned value with #R$A172.
C $8D6F If random value is less than #R$A172 jump to #R$8D7A.
C $8D72 Call #R$904B ???
C $8D75 Halve value and store in ninth byte of wizard stats (ability).
@ $8D7A label=NOABIL
C $8D7A call #R$92AA ???
C $8D7D Decrement #R$9154 to first byte in table of spells possesed by current wizard.
C $8D84 Call #R$904B ???
C $8D87 Add twelve to value and store at address in #R$9154.
C $8D8D Set first spell to $01 (disbelieve).
C $8D90 Set #R$9154 to next address.
C $8D94 Set #R$CD86 to #R$D3F2.
C $8D9A Get #R$904A into B.
@ $8D9E label=INSPLO
C $8D9E Preserve BC.
@ $8D9F label=RIND
C $8D9F Copy R register into A.
C $8DA1 Mask lowest three bits.
C $8DA3 Copy to H.
C $8DA4 Get R register into L.
C $8DA7 Read byte at address in HL.
C $8DA8 Add byte at address held in #R$CD86.
C $8DAC Mask lowest six bits.
C $8DAE Jump back to #R$8D9F unless 1 < A < 66.
C $8DB8 Increment #R$CD86.
C $8DB9 Store A in #R$937B.
C $8DBF Call #R$92F9 ???
C $8DC2 Read fourth value from spell table at address in IX.
C $8DC5 Store A at address held in #R$9154.
C $8DC9 Increment address and copy #R$937B there.
C $8DCE Increment address and update pointer in #R$9154.
C $8DD2 Restore loop counter.
C $8DD3 Loop back to #R$8D9E for #R$904A iterations.
C $8DD5 If player is human, jump to #R$8E08.
C $8DDB Call #R$92AA ???
C $8DDE Set HL to address held in #R$9154 and decrement.
C $8DE2 Set B to nineteen as outer loop counter.
@ $8DE4 label=OUTL_
C $8DE4 Preserve outer loop counter and address (#R$9154)-1.
C $8DE6 Set B to nineteen as inner loop counter.
@ $8DE8 label=INL_
C $8DE8 Preserve inner loop counter.
C $8DE9 Read four bytes from address in HL into E, D, C, and B.
C $8DF0 Move pointer back to the third byte.
C $8DF1 If byte in E (first byte read) is greater than or equal to C (third byte read) jump to #R$8E01.
C $8DF7 Move pointer forwards again and write D to memory at pointer (fourth byte).
C $8DF9 Move pointer back and write E to third byte, B to second byte, and C to first byte.
C $8DFF Move pointer back to the third byte read.
@ $8E01 label=NOBIGA
C $8E01 Restore inner loop counter and loop back to #R$8DE8 for nineteen iterations.
C $8E04 Restore address (#R$9154)-1 and outer loop counter and loop back to #R$8DE4 for nineteen iterations.
@ $8E08 label=DONSOR
C $8E08 Increment #R$AC0E variable.
C $8E0F Restore loop counter and jump back to #R$8AD8 for #R$AC0F iterations.
C $8E14 Read #R$AC0F into A.
C $8E17 Subtract two.
C $8E19 Multiply by eight.
C $8E1F And add result to #R$909F to get address of row in table for selected number of players.
C $8E26 Store this address in variable at #R$8321.
C $8E29 Set #R$AC0E variable to zero.
C $8E2E Read #R$AC0F into B as loop counter.
@ $8E32 label=PUTIBO
C $8E32 Read byte from address held in #R$8321 into A.
C $8E36 Increment address in temporary variable at #R$8321.
C $8E3A Set HL to #R$E01F.
C $8E3D Calculate address in table by adding the value just read from current player data in #R$909F table.
C $8E41 Add forty one to contents of #R$AC0E variable and store at calculated address (the wizards have object codes 41-48).
C $8E47 Add $1E1 to HL to get address of same position in table at #R$E200.
C $8E4B Store contents of #R$AC0E variable at calculated address.
C $8E4F Increment #R$AC0E variable.
C $8E53 Loop back to #R$8E32 for #R$AC0F iterations.
C $8E55 Set #R$7D03 variable to zero.
C $8E5A Read #R$AC0F into A, double it, add 15 and copy the result to B as a loop counter.
@ $8E62 label=TURLOO
C $8E62 Preserve loop counter.
C $8E63 call #R$9168 ???
C $8E66 Load #R$AC34 variable and increment it.
C $8E6A Jump to #R$8E93 if #R$AC34 + 1 is equal to #R$AC0F.
C $8E70 Call #R$9F50 ???
C $8E73 Call #R$8F9A ???
C $8E76 Call #R$A173 ???
C $8E79 Call #R$AC36 ???
C $8E7C Switch to interrupt mode 2.
C $8E7F Set B to ten as loop counter.
@ $8E81 label=PAUS_L
C $8E81 Preserve BC, call #R$96E6, Restore BC.
C $8E86 Loop back to #R$8E81 for ten iterations.
C $8E88 Switch to interrupt mode 1.
C $8E8B Read #R$AC34 variable into A and add one.
C $8E8F Compare #R$AC34 +1 with #R$AC0F.
@ $8E93 label=GO_END
C $8E93 Restore loop counter.
C $8E94 Jump to #R$8F04 if #R$AC34 + 1 was equal to #R$AC0F.
C $8E96 Increment variable #R$7D03.
C $8E9A Loop back to #R$8E62 for (#R$AC0F * 2) + 15 iterations.
C $8E9C Call #R$C5EE ???
C $8E9F Set ATTR-T to $01 (dark blue on black).
@ $8EA4 label=LOOPY
C $8EA4 Call #R$8F8B ???
C $8EA7 Draw border.
C $8EAA Call #R$8F8B ???
C $8EAD Print message #MTWOPRINTLINK($10) at coordinates (2,2).
C $8EB5 Set HL to #R$AC16.
C $8EB8 Set #R$89AC to coordinates (10,3).
C $8EBF Set #R$AC0E variable to $29 (row in #R$CDD3(game messages table 1) for pointer to the first wizards name).
C $8EC4 Load #R$AC0F into B as loop counter.
@ $8EC8 label=ZAPEM
C $8EC8 Preserve BC and HL.
C $8ECA Jump to #R$8EE2 if bit 4 of byte at address in HL is not zero.
C $8ECE Call #R$8F8B ???
C $8ED1 Load #R$AC0E variable back into A (message in message table 1).
C $8ED5 Load BC with #R$89AC and increment twice (move two columns right).
C $8EDF Print the wizard name.
@ $8EE2 label=DEDED
C $8EE2 Pop HL back and increment it (next byte in 16 byte table).
C $8EE4 Increment #R$AC0E variable (next row in game message table 1).
C $8EEB Restore loop counter from stack.
C $8EEC Loop back to #R$8EC8 for #R$AC0F iterations.
C $8EEE Call #R$8F8B ???
C $8EF1 Print #MPRINTLINK($3D) at coordinates (0,22).
C $8EF9 Call #R$96E6 ???
C $8EFC Call KEY-SCAN in Spectrum ROM.
C $8EFF Jump back to #R$8EA4 if no key is pressed else return.
@ $8F04 label=ENDGAM
C $8F04 Call #R$C5EE ???
C $8F07 Set ATTR-T to $01 (dark blue on black).
@ $8F0C label=LOPY2
C $8F0C Call #R$8F8B ???
C $8F0F Draw border.
C $8F12 Call #R$8F8B ???
C $8F15 Print message #MTWOPRINTLINK($11) at coordinates (9,4).
C $8F1D Call #R$8F8B ???
C $8F20 Print message #MTWOPRINTLINK($12) at coordinates (8,8).
C $8F28 Print message #MTWOPRINTLINK($13) at coordinates (8,10).
C $8F30 Print message #MTWOPRINTLINK($13) at coordinates (8,12).
C $8F38 Print message #MTWOPRINTLINK($13) at coordinates (8,14).
C $8F40 Print message #MTWOPRINTLINK($12) at coordinates (8,16).
C $8F48 Call #R$8F8B ???
C $8F4B Set HL to address #R$AC16.
C $8F4E Set B to eight as loop counter.
@ $8F50 label=GRONK
C $8F50 Jump to #R$8F57 if bit 4 of byte at address in HL is set.
C $8F54 Else move on to next byte.
C $8F55 Loop back to #R$8F50 for eight iterations.
@ $8F57 Label=FOUDIM
C $8F57 Set A to forty nine - the row in #R$CDD3(game messages table 1) of wizard eight.
C $8F59 Subtract loop counter to get row of wizard.
C $8F5A Preserve AF.
C $8F5B Load BC with coordinates (10,12).
C $8F5E Set HL to four times the value in A.
C $8F63 Add offset to the address of #R$CDD3(game messages table 1).
C $8F67 Add two to resulting address to move to length byte.
C $8F69 Read byte into A.
C $8F6A Divide by two and copy result to E.
C $8F6D Subtract E from sixteen and copy result to C.
C $8F71 Pop row of #R$CDD3(game messages table 1) back into A.
C $8F72 Print wizard name centred in box.
C $8F75 Call #R$8F8B ???
C $8F78 Print message $3D at coordinates (0,22) (#MPRINTLINK($3D)).
C $8F80 Call #R$96E6 ???
C $8F83 Call KEY-SCAN in ROM to see if a key was pressed.
C $8F88 Loop back to #R$8F0C if no key was pressed.
C $8F8A Else return (to BASIC).

@ $8F8B label=ATTRDO
c $8F8B ATTRDO
C $8F8B increment ATTR-T
C $8F92 return unless ATTR-T is $08
C $8F95 else set ATTR-T to $01 (dark blue on black)
@ $8F9A label=TREPUT
C $8F9A set HL to address of map area object code table
C $8F9D store HL in "position of cursor" variable
C $8FA0 load B with 159 as loop counter
@ $8FA2 label=TRFILO
C $8FA2 preserve loop counter
C $8FA3 load byte from address in HL (entry in map area object table)
C $8FA4 if byte read is not $24 jump to #R$9031
C $8FA9 add $0281 to address to get address of same cell in ???fifth map area table???
C $8FA3 load byte from address in HL (entry in ???fifth map area table???)
C $8FAD load byte from address in HL (entry in ???fifth map area table???)
C $8FAE if byte read is zero jump to #R$9031
C $8FB2 store this byte in #R$A172
C $8FB5 call #R$904B
C $8FB8 if value is greater than 4 jump to #R$9031
C $8FBD subtract 41 from #R$A172 and store result in #R$AC0E
C $8FC5 set ATTR-T to $46 (bright yellow on black) and print message #MTWOPRINTLINK($0F) at coordinates (0,22).
C $8FD2 move coordinates right one column
C $8FD3 Print message number in #R$A172
C $8FD9 set HL to address of #R$903E and call routine to copy ten bytes to data block at #R$C2E8
C $8FDF enable interrupts
C $8FE0 load B with 10 as a loop counter
@ $8FE2 label=WAYLOO
C $8FE2 call #R$96E6 ten times
C $8FE7 call routine at #R$BED7
@ $8FEA label=RUNDY
C $8FEA call #R$904B
C $8FED jump back to #R$8FEA if #R$907A is less than 2 or greater than 65
C $8FFA else store it in #R$937B
C $8FFD call #R$92AA
C $9000 read #R$9154 into HL
C $9003 add two to pointer
C $9005 set B to nineteen as a loop counter
@ $9007 label=PRILOO
C $9007 read byte from address
C $9008 if byte is zero jump to #R$900F
C $900B add two to pointer
C $900D loop back to #R$9007 eighteen times
@ $900F label=INITGO
C $900F copy value of #R$937B to the address in HL
C $9013 load #R$A172 into A
C $9016 load position of cursor into HL
C $9019 store #R$A172 at the position of the cursor
C $901A add $0281 to address (from map area object code table to ???fifth map area table???)
C $901E set byte in ???fifth map area table??? to zero
C $9020 load position of cursor into HL
C $9023 add $01E1 to address (from map area object code table to ???fourth map area table???)
C $9027 subtract 41 from #R$A172
C $902C store result at address in ???fourth map area table???
C $902D call routine at #R$C0DD
C $9030 wait for interrupt
@ $9031 label=N_HERE
C $9031 restore loop counter
C $9032 increment position of cursor
C $9039 jump back to #R$8FA2 158 times
C $903D return

@ $903E label=S61
b $903E S61

u $9046
@ $9046 label=LOW
B $9046 LOW
@ $9047 label=HIGH
B $9047 HIGH
@ $9048 label=TO_VAL
B $9048 TO_VAL

@ $9049 label=COMPAR
g $9049 COMPAR
@ $904A label=SPELNO
g $904A SPELNO

c $904B RANDY
@ $904B label=RANDY
C $904B preserve HL
@ $904C label=RANDO
C $904C copy R register to A
C $904E add value of SEED system variable
C $9052 set msb
C $9054 copy value to B register as loop counter
@ $9055 label=PODER
C $9055 push loop counter
C $9056 set B to fifteen as loop counter
@ $9058 label=PODEI
C $9058 jump back to #R$9058 (do nothing) fourteen times
C $905B pop loop counter
C $905C loop back to #R$9055
C $905E copy R register to A
C $9060 mask lowest three bits and copy to H
C $9063 copy R register to A then to L
C $9066 copy R register to A then add byte at the address in HL twice
C $906A add the SEED system variable
C $906E store the result in #R$907A
C $9071 mask the lower four bits
C $9073 if the result is less than ten jump back to #R$904C
C $9078 else restore HL and return

@ $907A label=RANUM
g $907A RANUM

@ $907B label=NKEY2
c $907B NKEY2
D $907B generate four random numbers at address held in #R$CD86 based on the length of time a key is held down for.
C $907B preserve HL, DE, and BC registers
@ $907E label=WAIT1
C $907E stack BC again
C $907F call KEY-SCAN in Spectrum ROM to see if a key was pressed.
C $9082 pop BC
C $9083 increment C
C $9084 copy E register to A (key value returned in the range 0 to 39)
C $9085 jump back to #R$907E if a key is still being pressed
C $9088 load contents of #R$CD86 into HL
C $908B store C at address in HL
C $908C double value in C register and store at next address
C $9090 copy R register into A and store at next address
C $9094 double the value in A and store at next address
C $9097 set #R$CD86 to next address
C $909B restore BC, DE, and HL registers and return

b $909F Starting positions table.
D $909F table of starting positions for 2-8 player games. Value is the offset in the map table of the place where the player will start.
@ $909F label=STAPOS

b $90D7 Wizard colours table.
D $90D7 table of attribute bytes defining the colours for wizards (used by the wizard colour picker)
@ $90D7 label=ATTAB

g $90DF ROMP
@ $90DF label=ROMP

w $90E0 Wizard character sprites table.
D $90E0 table of pointers to the eight wizard character sprites (used by the character picker)
@ $90E0 label=W_TAB
W $90E0

c $90F0 PR_CHR
@ $90F0 label=PR_CHR
C $90F0 read #R$90DF into A
C $90F3 set HL to #R$90E0
C $90F6 get address of desired entry in table of pointers to character sprite data by doubling A to and adding to address of table
C $90FC read the table entry and store in #R$DF4A
C $9103 copy #R$89AC to #R$DF4C
C $9109 call #R$DF4E then return

@ $910D label=sound_effect_1
b $910D sound_effect_1
@ $9117 label=sound_effect_2
b $9117 sound_effect_2
@ $9121 label=sound_effect_3
b $9121 sound_effect_3
@ $912B label=sound_effect_4
b $912B sound_effect_4
@ $9135 label=sound_effect_5
b $9135 sound_effect_5
@ $913F label=sound_effect_6
b $913F sound_effect_6
@ $9149 label=sound_effect_7
b $9149 sound_effect_7

@ $9153 label=casting_chance
g $9153 Chance of casting selected spell.

@ $9154 label=HISPEL
@ $9154 ssub=DEFW $7F47+$2F
g $9154 HISPEL
W $9154

@ $9156 label=cast_table
g $9156 Spell casting tables.

B $9156,8 Spells cast for each wizard.
@ $915E label=illusion_table
B $915E,8 Illusion flag for each spell.

@ $9166 label=unknown02
g $9166 unknown02

@ $9167 label=spell_success_flag
g $9167 spell successful flag

c $9168 CAST_S
@ $9168 label=CAST_S
C $9168 Clear #R$9156 and #R$915E to zeros.
@ $916D ssub=LD DE,$9156+1
C $9175 set UDG system variable to point to #R$7F27(S cursor sprite data)
C $917B load #R$AC0F into B as player loop counter
C $917F set #R$AC0E to zero
C $9184 disable interrupts
@ $9185 label=cast_s_players_loop
C $9185 stack BC
C $9186 set HL to address of #R$AC16
C $9189 load #R$AC0E into A
C $918C add current player as offset in #R$AC16
C $9190 if bit 4 of address is not zero jump to #R$929E ???
C $9195 call #R$95B8 to check if player is computer controlled
C $9198 jump to #R$929E if current player is computer controlled
@ $919C label=cast_s_menu_loop
C $919C set HL to address of sound effect data at #R$C2E3. This overlaps the sound effect playback data memory with the result that when copied the same 5 bytes are repeated.
C $919F call play_sound_effect_in_HL
C $91A2 wait for no key to be pressed
C $91A5 call #R$C5EE
C $91A8 set ATTR-T to $72 (bright red on yellow) and draw border.
C $91B0 jump forwards to #R$9230 if #R$C3A4 is zero
C $91B6 set BC to coordinates (7,7)
C $91B9 jump forwards to #R$91F6 if #R$C3A4 is positive
C $91BC set ATTR-T to $46 (bright yellow on black)
C $91C1 Print #MPRINTLINK($47)
C $91C6 load #R$C3A4 into A and divide by four
C $91CD jump forwards to #R$91EF if result is zero
C $91D0 set #R$89AC to coordinates (7,7)
C $91D4 copy #R$C3A4/4 into B
@ $91D5 label=cast_s_law_loop
C $91D5 preserve BC (loop counter)
C $91D6 call #R$BAD6 with character '^'
C $91DF move #R$89AC one character right
C $91E8 restore BC (loop counter)
C $91E9 loop back to #R$91D5 #R$C3A4/4 - 1 times
C $91EB load #R$89AC into BC
@ $91EF label=cast_s_end_law
C $91EF call #R$BAD6 with ')' character and jump forwards to #R$9230
@ $91F6 label=cast_s_chaotic
C $91F6 set ATTR-T to $45 (bright cyan on black)
C $91FB Print #MPRINTLINK($46)
C $9200 load #R$C3A4 into A
C $9203 store BC in #R$89AC
C $9207 negate A
C $9209 divide by 4
C $920D jump forwards to #R$922B if -#R$C3A4/4 is zero
C $9210 copy -#R$C3A4/4 into B and stack BC
@ $9211 label=cast_s_chaos_loop
C $9212 call #R$BAD6 with character '*'
C $921B move #R$89AC one character right
C $9224 restore loop counter and loop back to #R$9211 -#R$C3A4/4 - 1 times
C $9227 load #R$89AC into BC
@ $922B label=cast_s_end_chaos
C $922B call #R$BAD6 with character ')'
@ $9230 label=cast_s_ch_law_done
C $9230 set ATTR-T to $46 (bright yellow on black)
C $9235 load #R$AC0E into A
C $9238 add $29 (first wizard name string in #R$CDD3(game messages table 1))
C $923A Print #MPRINTLINK($29) at coordinates (7,5)
C $9240 set ATTR-T to $45 (bright cyan on black)
C $9245 Print #MPRINTLINK($59) at coordinates (7,9)
C $924D Print #MPRINTLINK($5A) at coordinates (7,11)
C $9255 Print #MPRINTLINK($5B) at coordinates (7,13)
C $925D Print #MPRINTLINK($5C) at coordinates (7,15)
C $9265 set ATTR-T to $56 (bright yellow on red)
C $926A Print #MPRINTLINK($57) at coordinates (0,22)
C $9272 call #R$92AA
@ $9275 label=cast_s_key_loop
C $9275 call KEYBOARD routine in ROM returning character code in A
C $9278 set #R$9384 to zero ???
C $927D if A equals '1' then call #R$9385 and jump back to #R$919C
@ $9287 label=cast_s_not_1
C $9287 else if A equals '4' then jump to #R$929E
C $928B else if A equals '3' then jump to #R$92BE
C $928F else if A does not equal '2' then loop back to #R$9275
C $9293 '2' key was pressed, set #R$9384 ??? to 1
C $9298 call #R$9385 ??? then jump back to #R$919C
@ $929E label=cast_s_continue
C $929E '4' key was pressed, restore BC (player loop counter)
C $929F increment #R$AC0E variable
C $92A3 decrement B
C $92A4 jump back to #R$9185 if there are still players to process
C $92A7 else jump to #R$95C7 ???

c $92AA GETHIS
@ $92AA label=GETHIS
C $92AA point HL at table of possessed spells
C $92AD load #R$AC0E variable into DE
C $92B3 set B to $28 (length of spell data for each wizard) as loop counter
C $92B5 set A to zero
C $92B6 add DE to HL as an offset into the table of possessed spells
C $92B7 loop back to #R$92B6 39 times so that HL points to correct wizard's spells
C $92B9 increment HL and store its value in #R$9154
C $92BD return

c $92BE user selected "Examine board" from options in #R$9168 routine
@ $92BE label=examine_board
C $92BE call #R$C5EE
C $92C1 call #R$FE56 to switch to IM2 interrupt handler
C $92C4 set ATTR-P to zero
C $92C9 set MASK-P to 0xFF (print using existing attributes instead of ATTR-P)
C $92CE call #R$C0DD ???
C $92D1 enable interrupts and wait for the next interrupt
C $92D3 set P-FLAGS to $03 (OVER mode).
C $92D8 wait for no key to be pressed
C $92DB call #R$BC96 ???
C $92DE call KEYBOARD routine in ROM returning character code in A
C $92E1 if A equals '0' then jump to #R$92EC
C $92E5 else if A equals 'I' then jump to #R$C3B3
C $92EA else jump back to #R$92DB
C $92EC disable interrupts
C $92ED set UDG system variable to address of S cursor sprite
C $92F3 call #R$C5EE and jump back to #R$919C in #R$9168 routine

c $92F9 CHAN_C
@ $92F9 label=CHAN_C
C $92F9 Add #R$937B - 1 to address of #R$7D60 7 times to get address of current spell entry.
@ $9306 label=spell_add_loop
C $930A Store address in #R$9380.
C $930E Load Chaos/Law value from spell data and store in #R$937F.
C $9314 If #R$C3A4 is not zero jump to #R$9324.
@ $931A label=not_aligned
C $931A Copy chance value from spell data into #R$9153 and jump to #R$9353.
@ $9324 label=not_neutral
C $9324 If #R$C3A4 is negative jump to #R$933E.
C $9327 Copy value (lawfulness) into E
C $9328 If #R$937F is less than or equal to zero jump to #R$931A.
C $9331 Divide lawfulness by 4 and add chance value from spell data.
C $9339 Store in #R$9153 and jump to #R$9353.
@ $933E label=chaotic
C $933E Convert to positive value (chaos) and copy into E.
C $9341 If #R$937F is greater than or equal to zero jump to #R$931A.
C $9348 Divide lawfulness by 4, add chance value from spell data, and store in #R$9153.
@ $9353 label=add_ability
C $9353 Get ability attribute from current wizard.
C $935E Add to value in #R$9153.
C $9365 If #R$9153 is not 0 to 9 clear it.
@ $9370 label=less_than_ten
@ $9377 label=greater_equal_zero
C $937A Return.

@ $937B label=CURSP
g $937B CURSP

@ $937C label=unknown03
g $937C unknown03
W $937C

@ $937E label=unknown04
g $937E unknown04

@ $937F label=unknown05
g $937F unknown05

@ $9380 label=current_spell_pointer
g $9380 Address of spell entry in #R$7D60.
W $9380

@ $9382 label=unknown07
g $9382 unknown07
W $9382

@ $9384 label=unknown08
g $9384 unknown08

c $9385 routine05
@ $9385 label=routine05

@ $93CB ssub=LD A,($937C+$1)

@ $93D0 ssub=LD ($937C+1),A

@ $949A ssub=LD HL,$9156+$8

c $94A7 routine37
@ $94A7 label=routine37

@ $94B6 ssub=LD HL,$E01F+$9F

c $95B8 Get player controlled flag from #R$AC26 table
@ $95B8 label=get_player_controlled_flag
C $95B8 set HL to address of #R$AC26 table
C $95BB load #R$AC0E variable into A
C $95BE add to #R$AC26 to get address in table
C $95C2 copy byte from table into the #R$AC2E
C $95C6 return

c $95C7 routine06
@ $95C7 label=routine06
C $95C7 call #R$C5EE
C $95CA switch to interrupt mode 2
C $95CD call #R$C0DD ???
C $95D0 do nothing for two video frames
C $95D2 set #R$AC0E to zero
C $95D7 set HL to address of #R$AC16
C $95DA add #R$AC0E to address as offset
C $95E1 load at HL into A
C $95E2 if bit 4 is set then jump to #R$9665 ???
C $95E7 else call #R$97D1 ???
C $95EA update #R$AC2E
C $95EA if player is computer controlled then jump to #R$96F3
C $95F1 else set HL to the sixteen byte table used by #R$9168 ??? and add #R$AC0E as an offset ???
C $95FB copy byte from table into #R$937B
C $95FF if zero then jump forward to #R$9665
C $9603 call #R$92AA which updates #R$9154 and returns with the address of the player's spell table in HL
C $9606 set B to 19 as a loop counter
C $9608 load #R$937B into A
C $9608 if #R$937B equals one then jump forward to #R$961B
C $960F load spell number from the address in HL into E
C $9610 if the spell number in E is equal to #R$937B then jump forward to #R$9617
C $9613 else zero that entry in spell table (two bytes) and jump out of loop to #R$961B
C $9617 address to move on two bytes to next spell in player's spell table
C $9619 loop back to #R$960F 18 times
C $961B call #R$92F9 ???
C $961E Display wizard name, the spell being cast, and spell casting range
C $9621 wait for a keypress
C $9624 clear bottom of screen (line 22)
@ $9627 ssub=LD HL,$9156+8
C $9627 set HL to #R$9156+8 (second half of 16 byte table used by #R$9168) ???
C $962A add #R$AC0E as offset in table
C $9631 copy byte at offset into #R$9166 ???
C $9632 if byte is non zero then jump forward to #R$964C
C $9638 else get a random number between 11 and 15 in A
C $963B load #R$9153 into E, increment it, and compare with random value
C $9641 if #R$9153 + 1 is greater than random value then skip to #R$964C
C $9644 else set spell successful flag to zero and skip forward to #R$9659 ???
C $964C set spell successful flag to one
C $9651 add #R$937F to #R$C3A4 and store result in #R$C3A4 ???
C $9659 load call address for spell from spell table into HL (IX set by earlier call to #R$92F9)
@ $965F ssub=LD ($9662+1),HL
C $965F overwrite the address of the following CALL instruction (self modifying code)
@ $9662 label=spell_cast_function_call
C $9662 call CreatureCast spell
C $9665 clear bottom of screen (line 22)
C $9668 set HL to address of #R$A172 and call #R$7D04 ???
C $966E increment #R$AC0E variable
C $9672 if #R$AC0E equals #R$AC0F then return else loop back to #R$95D7 

c $967A Display wizard name, spell being cast, and spell casting range
@ $967A label=display_wizard_spell_range
C $967A set ATTR-T to $46 (bright yellow on black)
C $967F load value of #R$AC0E variable and add 41
C $9684 print wizard name at coordinates (0,22)
C $968A call routine at #R$96D1
C $968D set ATTR-T to $44 (bright green on black)
C $9692 load byte at IX+0
C $9695 Print spell being cast
C $9698 call routine at #R$96D1
C $969B set ATTR-T to $47 (bright white on black)
C $96A0 increment C to move right one column
C $96A1 load byte at IX+2
C $96A4 divide it by 2
C $96A6 if spell casting range is greater than nine, then jump to #R$96B2 to print the number twenty.
C $96AB add 48 to A
C $96AD call #R$BAD6 to display a number from 0-9
C $96B0 jump to #R$96BF
C $96B2 load A with $32 ('2')
C $96B4 preserve BC
C $96B5 call #R$BAD6
C $96B8 restore BC
C $96B9 increment C to move right one column
C $96BA load A with $30 ('0')
C $96BC call #R$BAD6
C $96BF call routine at #R$96D1
C $96C2 return if #R$AC2E is zero
C $96C7 set B to 8 as loop counter
C $96C9 stack loop counter
C $96CA call #R$96E6
C $96CD restore loop counter
C $96CE loop back to #R$96C9 seven times
C $96D0 return

c $96D1 routine07
@ $96D1 label=routine07
C $96D1 stack BC
C $96D2 set HL to address of sound effect at #R$9117
C $96D5 call play_sound_effect_in_HL
C $96D8 enable interrupts
C $96D9 set B to 255 as outer loop counter
C $96DB stack outer loop counter
C $96DC set B to 60 as inner loop counter
C $96DE loop 59 times
C $96E0 restore outer loop counter
C $96E1 loop back to #R$96DB 254 times
C $96E3 restore BC
C $96E4 increment C and return

c $96E6 PAUSER
@ $96E6 label=PAUSER
C $96E6 stack BC
C $96E7 load B with 255 as outer loop counter
C $96E9 preserve outer loop counter
C $96EA load B with 160 as inner loop counter
C $96EC loop back to #R$96EC 159 times
C $96EE restore outer loop counter
C $96EF loop back to #R$96E9 254 times
C $96F1 pop BC and return

c $96F3 routine08
@ $96F3 label=routine08
C $9732 Self modifying code
@ $9732 ssub=LD ($9735+1),HL
C $9738

@ $975F label=unknown10
g $975F unknown10

c $9760 routine09
@ $9760 label=routine09

c $9786 routine10
@ $9786 label=routine10

c $97A3 routine11
@ $97A3 label=routine11
C $97A3 call #R$BED7 to clear line 22 of the display
C $97A6 jump to #R$97BB if spell successful flag is set
C $97AC set ATTR-T to bright magenta on black
C $97B1 set A to $54 ("SPELL FAILS" message)
C $97B1 Print #MPRINTLINK($54) at coordinates (0,22)
C $97B9 jump to #R$97C8
C $97BB set ATTR-T to bright white on black
C $97C0 Print #MPRINTLINK($55) at coordinates (0,22)
C $97C8 set loop counter to $64
C $97CA HALT
C $97CB loop back to #R$97CA ninety-nine times (pause for two seconds)
C $97CD return

@ $97CE label=unknown11
g $97CE unknown11

@ $97CF label=unknown12
@ $97CF ssub=DEFW $E01F+$9B
g $97CF unknown12
W $97CF

c $97D1 routine12
@ $97D1 label=routine12

c $980E OFBORD
@ $980E label=OFBORD

c $981A routine13
@ $981A label=routine13

c $98DB routine14
@ $98DB label=routine14

c $98F1 routine15
@ $98F1 label=routine15

@ $9940 label=unknown79
g $9940 unknown79

c $9941 routine16
@ $9941 label=routine16

# spell names from comments on chaos
c $9975 CreatureCast spell
@ $9975 label=creature_cast_spell

c $99F1 Disbelieve spell
@ $99F1 label=disbelieve_spell

c $9ADD Trees&Castles spell
@ $9ADD label=trees_castles_spell

c $9B76 Wall spell
@ $9B76 label=wall_spell

c $9B85 routine17
@ $9B85 label=routine17

c $9BB3 routine18
@ $9BB3 label=routine18

@ $9C0E label=unknown80
g $9C0E unknown80

c $9C0F routine19
@ $9C0F label=routine19

c $9C59 Lightning spell
@ $9C59 label=lightning_spell

c $9DE0 DarkPowerEtc spell
@ $9DE0 label=dark_power_spell

@ $9E43 ssub=LD HL,$D908-$100

c $9F50 INTERO
@ $9F50 label=INTERO

@ $A162 ssub=LD HL,$E01F+$57

@ $A172 label=STRENG
g $A172 STRENG

c $A173 WALKYS
@ $A173 label=WALKYS

c $A17E GETPLA
@ $A17E label=GETPLA
C $A17E load word at #R$CD86 into HL
C $A181 increment pointer and load byte into A
C $A183 increment again and store back at #R$CD86
C $A187 return

@ $A188 label=explosion_sprite_pointer
g $A188 sprite pointer for explosion routine
W $A188

c $A18A routine20
@ $A18A label=routine20

@ $A1E6 label=twirl_sprite_pointer
g $A1E6 sprite pointer for twirl routine
W $A1E6

@ $A1E8 twirl_sprites_table
w $A1E8 table of pointers to twirl sprites
D $A1E8 #HTML(#UDGARRAY2,,4;$A20C-$A22B-8(*twirlsprite0)) #HTML(#UDGARRAY2,,4;$A22C-$A24B-8(*twirlsprite1)) #HTML(#UDGARRAY2,,4;$A24C-$A26B-8(*twirlsprite2)) #HTML(#UDGARRAY2,,4;$A26C-$A28B-8(*twirlsprite3)) #HTML(#UDGARRAY2,,4;$A28C-$A2AB-8(*twirlsprite4)) #HTML(#UDGARRAY2,,4;$A2AC-$A2CB-8(*twirlsprite5)) #HTML(#UDGARRAY2,,4;$A2CD-$A2EC-8(*twirlsprite6)) #HTML(#UDGARRAY2,,4;$A2E5-$A304-8(*twirlsprite7)) #HTML(#UDGARRAY2,,4;$A305-$A324-8(*twirlsprite8)) #HTML(#UDGARRAY2,,4;$A325-$A344-8(*twirlsprite9)) #HTML(#UDGARRAY*twirlsprite0,5;twirlsprite1;twirlsprite2;twirlsprite3;twirlsprite0;twirlsprite1;twirlsprite2;twirlsprite3;twirlsprite0;twirlsprite1;twirlsprite2;twirlsprite3;twirlsprite4;twirlsprite5;twirlsprite6;twirlsprite7;twirlsprite8;twirlsprite9,100(twirlsprite)) animation cycle twirlsprite 0,1,2,3,0,1,2,3,0,1,2,3,4,5,6,7,8,9

b $A20C sprite data for casting twirl
@ $A20C label=twirlsprite0
B $A20C,$20 twirl 0 #HTML(#UDGARRAY*twirlsprite0(twirlsprite0))
@ $A22C label=twirlsprite1
B $A22C,$20 twirl 1 #HTML(#UDGARRAY*twirlsprite1(twirlsprite1))
@ $A24C label=twirlsprite2
B $A24C,$20 twirl 2 #HTML(#UDGARRAY*twirlsprite2(twirlsprite2))
@ $A26C label=twirlsprite3
B $A26C,$20 twirl 3 #HTML(#UDGARRAY*twirlsprite3(twirlsprite3))
@ $A28C label=twirlsprite4
B $A28C,$20 twirl 4 #HTML(#UDGARRAY*twirlsprite4(twirlsprite4))
@ $A2AC label=twirlsprite5
B $A2AC,$20 twirl 5 #HTML(#UDGARRAY*twirlsprite5(twirlsprite5))
B $A2CC unused
@ $A2CD label=twirlsprite6
B $A2CD twirl 6 #HTML(#UDGARRAY*twirlsprite6(twirlsprite6)) (overlaps twirl 7)
@ $A2E5 label=twirlsprite7
B $A2E5,$20 twirl 7 #HTML(#UDGARRAY*twirlsprite7(twirlsprite7))
@ $A305 label=twirlsprite8
B $A305,$20 twirl 8 #HTML(#UDGARRAY*twirlsprite8(twirlsprite8))
@ $A325 label=twirlsprite9
B $A325,$20 twirl 9 #HTML(#UDGARRAY*twirlsprite9(twirlsprite9))

b $A345 sprite data for explosion 
D $A345 #HTML(#UDGARRAY2,,4;$A345-$A364-8(*explosionsprite0)) #HTML(#UDGARRAY2,,4;$A365-$A384-8(*explosionsprite1)) #HTML(#UDGARRAY2,,4;$A385-$A3A4-8(*explosionsprite2)) #HTML(#UDGARRAY2,,4;$A3A5-$A3C4-8(*explosionsprite3)) #HTML(#UDGARRAY2,,4;$A3C5-$A3E4-8(*explosionsprite4)) #HTML(#UDGARRAY2,,4;$A3E5-$A404-8(*explosionsprite5)) #HTML(#UDGARRAY2,,4;$A405-$A424-8(*explosionsprite6)) #HTML(#UDGARRAY*explosionsprite0,5;explosionsprite1;explosionsprite2;explosionsprite3;explosionsprite4;explosionsprite5;explosionsprite6,100(explosionsprite))

@ $A345 label=explosion0
B $A345,$20 explosion 0 #HTML(#UDGARRAY*explosionsprite0(explosionsprite0))
@ $A365 label=explosion1
B $A365,$20 explosion 1 #HTML(#UDGARRAY*explosionsprite1(explosionsprite1))
@ $A385 label=explosion2
B $A385,$20 explosion 2 #HTML(#UDGARRAY*explosionsprite2(explosionsprite2))
@ $A3A5 label=explosion3
B $A3A5,$20 explosion 3 #HTML(#UDGARRAY*explosionsprite3(explosionsprite3))
@ $A3C5 label=explosion4
B $A3C5,$20 explosion 4 #HTML(#UDGARRAY*explosionsprite4(explosionsprite4))
@ $A3E5 label=explosion5
B $A3E5,$20 explosion 5 #HTML(#UDGARRAY*explosionsprite5(explosionsprite5))
@ $A405 label=explosion6
B $A405,$20 explosion 6 #HTML(#UDGARRAY*explosionsprite6(explosionsprite6))

u $A425 data left behind by editor/assembler
D $A425 contains original names of functions and variables
B $A425 
T $A427 SUB_DO
W $A42D
B $A42F
T $A434 D_ADD
W $A439
B $A43B
T $A440 TEMADD
W $A446
B $A448
T $A44D EN_AN 
W $A452
B $A454
T $A459 INBUF
W $A45E
B $A460
T $A465 BUFPNT
W $A46B
B $A46D
T $A472 SRTCNT
W $A478
B $A47A
T $A47F SORT
W $A483
B $A485
T $A48A BART_L
W $A490
B $A492
T $A497 GETPLA
W $A49D
B $A49F
T $A4A4 OK_SUB
W $A4AA
B $A4AC
T $A4B1 PAUSER
W $A4B7
B $A4B9
T $A4BE BALSUP
W $A4C4
B $A4C6
T $A4CB TOFAIL
W $A4D1
B $A4D3
T $A4D8 GETCHR
W $A4DE
B $A4E0
T $A4E5 STRENG
W $A4EB
B $A4ED
T $A4F2 RANDY
W $A4F7
B $A4F9
T $A4FE YESSUB
W $A504
B $A506
T $A50B RASART
W $A511
B $A513
T $A518 RAILOO
W $A51E
B $A520
T $A525 RAI_CH
W $A52B
B $A52D
T $A532 RAISDO
W $A538
B $A53A
T $A53F RASLOO
W $A545
B $A547
T $A54C RASBAK
W $A552
B $A554
T $A559 THRTAB
W $A55F
B $A561
T $A566 LOORAS
W $A56C
B $A56E
T $A573 OK_RAS
W $A579
B $A57B
T $A580 ENDRAS
W $A586
B $A588
T $A58D TURART
W $A593
B $A595
T $A59A TUR_DO
W $A5A0
B $A5A2
T $A5A7 LOOTUR
W $A5AD
B $A5AF
T $A5B4 ADD_ON
W $A5BA
B $A5BC
T $A5C1 CRE000
W $A5C7
B $A5C9
T $A5CE FLA481
W $A5D4
B $A5D6
T $A5DB HID641
W $A5E1
B $A5E3
T $A5E8 BOD801
W $A5EE
B $A5F0
T $A5F5 FRA321
W $A5FB
B $A5FD
T $A602 FUCKIT
W $A608
B $A60A
T $A60F WALKYS
W $A615
B $A617
T $A61C MOLLOO
W $A622
B $A624
T $A629 MOLEND
W $A62F
B $A631
T $A636 RANMOL
W $A63C
B $A63E
T $A643 RANUM
W $A648
B $A64A
T $A64F OFBORD
W $A655
B $A657
T $A65C M2PRIN
W $A662
B $A664
T $A669 M2ESAG
W $A66F
B $A671
T $A676 M_1
W $A679
B $A67B
T $A680 M_2
W $A683
B $A685
T $A68A M_3
W $A68D
B $A68F
T $A694 M_4
W $A697
B $A699
T $A69E M_5
W $A6A1
B $A6A3
T $A6A8 M_6
W $A6AB
B $A6AD
T $A6B2 M_7
W $A6B5
B $A6B7
T $A6BC M_8
W $A6BF
B $A6C1
T $A6C6 M_9
W $A6C9
B $A6CB
T $A6D0 M_10
W $A6D4
B $A6D6
T $A6DB M_11
W $A6DF
B $A6E1
T $A6E6 M_12
W $A6EA
B $A6EC
T $A6F1 M_13
W $A6F5
B $A6F7
T $A6FC M_14
W $A700
B $A702
T $A707 M_15
W $A70B
B $A70D
T $A712 M_16
W $A716
B $A718
T $A71D M_17
W $A721
B $A723
T $A728 M_18
W $A72C
B $A72E
T $A733 M_19
W $A737
B $A739
T $A73E M_20
W $A742
B $A744
T $A749 LEVEL
W $A74E
B $A750
T $A755 NUM
W $A758
B $A75A
T $A75F GAMTUN
W $A765
B $A767
T $A76C POSPRI
W $A772
B $A774
T $A779 COUNTL
W $A77F
B $A781
T $A786 KEY_P
W $A78B
B $A78D
T $A792 CHONUM
W $A798
B $A79A
T $A79F KEYIT
W $A7A4
B $A7A6
T $A7AB NOADD
W $A7B0
B $A7B2
T $A7B7 ATTR-T
W $A7BD
B $A7BF
T $A7C4 DH_P
W $A7C8
B $A7CA
T $A7CF S60
W $A7D2
B $A7D4
T $A7D9 NKEY2
W $A7DE
B $A7E0
T $A7E5 CLS
W $A7E8
B $A7EA
T $A7EF CH_LAW
W $A7F5
B $A7F7
T $A7FC ZRDR_P
W $A802
B $A804
T $A809 NO_PLA
W $A80F
B $A811
T $A816 REPWAT
W $A81C
B $A81E
T $A823 STALOO
W $A829
B $A82B
T $A830 INPLOO
W $A836
B $A838
T $A83D ENTER
W $A842
B $A844
T $A849 NO_DEL
W $A84F
B $A851
T $A856 SPACE
W $A85B
B $A85D
T $A862 Y_OR_N
W $A868
B $A86A
T $A86F YES_CC
W $A875
B $A877
T $A87C NOT_CC
W $A882
B $A884
T $A889 WIZCON
W $A88F
B $A891
T $A896 P_WIZL
W $A89C
B $A89E
T $A8A3 ROMP
W $A8A7
B $A8A9
T $A8AE PR_CHR
W $A8B4
B $A8B6
T $A8BB ATTAB
W $A8C0
B $A8C2
T $A8C7 COLOO
W $A8CC
B $A8CE
T $A8D3 PUTATL
W $A8D9
B $A8DB
T $A8E0 COMPAR
W $A8E6
B $A8E8
T $A8ED MAKCHR
W $A8F3
B $A8F5
T $A8FA NOTMOR
W $A900
B $A902
T $A907 SPELNO
W $A90D
B $A90F
T $A914 NOABIL
W $A91A
B $A91C
T $A921 GETHIS
W $A927
B $A929
T $A92E HISPEL
W $A934
B $A936
T $A93B INSPLO
W $A941
B $A943
T $A948 RIND
W $A94C
B $A94E
T $A953 CURSP
W $A958
B $A95A
T $A95F CHAN_C
W $A965
B $A967
T $A96C DONSOR
W $A972
B $A974
T $A979 OUTL_
W $A97E
B $A980
T $A985 INL_
W $A989
B $A98B
T $A990 NOBIGA
W $A996
B $A998
T $A99D STAPOS
W $A9A3
B $A9A5
T $A9AA PUTIBO
W $A9B0
B $A9B2
T $A9B7 TURLOO
W $A9BD
B $A9BF
T $A9C4 CAST_S
W $A9CA
B $A9CC
T $A9D1 GO_END
W $A9D7
B $A9D9
T $A9DE INTERO
W $A9E4
B $A9E6
T $A9EB TREPUT
W $A9F1
B $A9F3
T $A9F8 PAUS_L
W $A9FE
B $AA00
T $AA05 ENDGAM
W $AA0B
B $AA0D
T $AA12 LOOPY
W $AA17
B $AA19
T $AA1E ATTRDO
W $AA24
B $AA26
T $AA2B ZAPEM
W $AA30
B $AA32
T $AA37 DEDED
W $AA3C
B $AA3E
T $AA43 MPRINT
W $AA49
B $AA4B
T $AA50 LOPY2
W $AA55
B $AA57
T $AA5C GRONK
W $AA61
B $AA63
T $AA68 FOUDIM
W $AA6E
B $AA70
T $AA75 TRFILO
W $AA7B
B $AA7D
T $AA82 N_HERE
W $AA88
B $AA8A
T $AA8F S61
W $AA92
B $AA94
T $AA99 WAYLOO
W $AA9F
B $AAA1
T $AAA6 RUNDY
W $AAAB
B $AAAD
T $AAB2 PRILOO
W $AAB8
B $AABA
T $AABF INITGO
W $AAC5
B $AAC7
T $AACC LOW
W $AACF
B $AAD1
T $AAD6 HIGH
W $AADA
B $AADC
T $AAE1 TO_VAL
W $AAE7
B $AAE9
T $AAEE RANDO
W $AAF3
B $AAF5
T $AAFA PODER
W $AAFF
B $AB01
T $AB06 PODEI
W $AB0B
B $AB0D
T $AB12 WAIT1
W $AB17
B $AB19
T $AB1E W_TAB
W $AB23
B $AB25
T $AB2A C_DATA
W $AB30
B $AB32
T $AB37 LC_POS
W $AB3D
B $AB3F
T $AB44 P_CHAR
W $AB4A
B $AB4C
T $AB51 GET_LC
W $AB57
B $AB59
T $AB5E FIREON
W $AB64
B $AB66
T $AB6B S10
W $AB6E
B $AB70
T $AB75 WOOP_D
W $AB7B
B $AB7D
T $AB82 WIZKIL
W $AB88
B $AB8A
T $AB8F AIM
W $AB92
B $AB94
T $AB99 LOF_D
W $AB9E
B $ABA0
T $ABA5 TEMP_C
W $ABAB
B $ABAD
T $ABB2 SPATAB
W $ABB8
B $ABBA
T $ABBF SPADAT
W $ABC5
B $ABC7
T $ABCC ADSPA
W $ABD1
B $ABD3
T $ABD8 X_ADD
W $ABDD
B $ABDF


@ $ABFC label=unknown13
g $ABFC unknown13

@ $ABFD label=unknown14
@ $ABFD ssub=DEFW $E01F+$9F
g $ABFD unknown14
W $ABFD

@ $ABFF label=unknown15
g $ABFF unknown15

@ $AC00 label=unknown16
g $AC00 unknown16

@ $AC01 label=unknown17
g $AC01 unknown17

@ $AC02 label=movement_x2
g $AC02 Movement points multiplied by two.

@ $AC03 label=unknown18
g $AC03 unknown18

@ $AC04 label=unknown19
g $AC04 unknown19
W $AC04

@ $AC06 label=unknown20
g $AC06 unknown20

@ $AC07 label=unknown21
g $AC07 unknown21

@ $AC08 label=unknown22
g $AC08 unknown22

@ $AC09 label=unknown23
g $AC09 unknown23

@ $AC0A label=unknown24
g $AC0A unknown24
W $AC0A

@ $AC0C label=unknown25
g $AC0C unknown25

@ $AC0D label=unknown26
g $AC0D unknown26

@ $AC0E label=current_player
g $AC0E current player (0-7)

@ $AC0F label=NO_PLA
D $AC0F Number of players in the current game.
g $AC0F NO_PLA

@ $AC10 label=unknown27
g $AC10 unknown27

@ $AC11 label=unknown28
g $AC11 unknown28

@ $AC12 label=cursor_position
@ $AC12 ssub=DEFW $E01F+$9F
g $AC12 position of cursor
W $AC12

@ $AC14 ssub=DEFW $E01F+$9E
@ $AC14 label=D_ADD
g $AC14 D_ADD
W $AC14

@ $AC16 label=unknown_table_3
g $AC16 unknown table 3

@ $AC1E label=unknown_table_4
g $AC1E unknown table 4

@ $AC26 label=WIZCON
g $AC26 WIZCON table

@ $AC2E label=computer_player_flag
g $AC2E current player is computer controlled flag

u $AC2F

@ $AC30 label=unknown29
g $AC30 unknown29

@ $AC31 label=unknown30
g $AC31 unknown30

@ $AC32 label=unknown31
g $AC32 unknown31

@ $AC33 label=unknown32
g $AC33 unknown32

@ $AC34 label=unknown33
g $AC34 unknown33

@ $AC35 label=unknown34
g $AC35 unknown34

c $AC36 routine21
@ $AC36 label=routine21
C $AC36 load #R$AC0F into B as loop counter
C $AC3A preserve BC
C $AC3B load #R$AC0F into A
C $AC3E subtract loop counter from A and store result in #R$AC0E variable and in #R$D391 ???
C $AC45 add result as offset to address of #R$AC16
C $AC4C read byte at offset in table
C $AC4D if bit 4 is set then jump to end of loop
C $AC51 clear #R$AC2E
C $AC56 load byte from #R$AC26 using #R$AC0E as an offset
C $AC61 if the byte is zero then jump forward to #R$AC69
C $AC64 else set #R$AC2E
C $AC69 set ATTR-P to $46 (bright yellow on black)
C $AC6E clear bottom row of screen (line 22)
C $AC71 #R$AC0E into A and add $29 to get message number of player name in #R$CDD3(game messages table 1)
C $AC76 Print wizard name at coordinates (0,22)
C $AC7C Print #MPRINTLINK($37)
C $AC81 call #R$C0DD ???
C $AC84 do nothing for two frames
C $AC86 copy #R$AC0E into #R$D391 ???
C $AC8C call #R$D392 ???
C $AC8F Busy wait loop to pause for approximately 1/4 second ???
C $AC99 call #R$C0DD ???
C $AC9C wait for a keypress
C $AC9F if current player is human then jump forward to #R$ACB0
C $ACA5 else do nothing for 60 frames
C $ACAA clear bottom row of screen (line 22)
C $ACAD jump to #R$C710 ???
C $ACB0 clear bottom row of screen (line 22)
C $ACB3 wait for player to press 'S' or '0'
C $ACB6 wait for no key to be pressed
C $ACB9 restore BC
C $ACBA decrement loop counter and loop back to #R$AC3A if not zero
C $ACBE set #R$AC33 to zero ???
C $ACC3 set Interrupt Mode 1 and return

c $ACC6 routine22
@ $ACC6 label=routine22
C $ACC6 set system variable "UDG" to #R$C33D
C $ACCC call routine at #R$BC96
C $ACCF preserve BC
C $ACD0 call KEYBOARD in Spectrum ROM
C $ACD3 compare value returned with $53 (letter S)
C $ACD5 restore BC
C $ACD6 call routine at #R$ACED if "S" was pressed
C $ACD9 jump to back to #R$ACC6 if "0" was not pressed
C $ACDD call routine at #R$C0DD
C $ACE0 wait for two interrupts
C $ACE2 call routine at #R$BED7
C $ACE5 set HL to address of sound effect at #R$C27F
C $ACE8 call play_sound_effect_in_HL
C $ACEB enable interrupts
C $ACEC return

c $ACED routine23
@ $ACED label=routine23

c $AECC COUNTL
@ $AECC label=COUNTL

c $B0A8 routine24
@ $B0A8 label=routine24

@ $B161 label=unknown35
g $B161 unknown35

@ $B162 label=unknown36
g $B162 unknown36

@ $B163 label=unknown37
g $B163 unknown37

@ $B164 label=unknown38
g $B164 unknown38

@ $B165 label=unknown39
g $B165 unknown39

@ $B166 label=unknown40
g $B166 unknown40
W $B166

c $B168 routine25
@ $B168 label=routine25

@ $B374 label=unknown41
g $B374 unknown41

c $B375 routine26
@ $B375 label=routine26

@ $B3C3 label=unknown42
g $B3C3 unknown42

@ $B3C4 label=unknown43
g $B3C4 unknown43

@ $B3C5 label=unknown44
g $B3C5 unknown44

@ $B3C6 label=unknown45
g $B3C6 unknown45

@ $B3C7 label=unknown46
g $B3C7 unknown46
W $B3C7

c $B3C9 WIZKIL
@ $B3C9 label=WIZKIL

@ $B60B label=unknown48
g $B60B unknown48

@ $B60C label=unknown49
g $B60C unknown49

c $B60D routine27
@ $B60D label=routine27

c $B626 routine28
@ $B626 label=routine28

c $B746 routine29
@ $B746 label=routine29

@ $B754 label=LOF_D
g $B754 LOF_D

c $B755 test_pixel
@ $B755 label=test_pixel
D $B755 enter with coordinates in BC
C $B755 store BC in COORDS system variable (x-coordinate of last point plotted)
C $B759 call PIXEL-ADD in Spectrum ROM (get pixel address in HL)
C $B75C set loop counter by loading position of pixel within byte into B and adding one
C $B75E load byte in screen bitmap from address in HL
C $B75F rotate A left 'B' times
C $B762 return if LSB is zero
C $B765 else store $01 in #R$B754 and return

@ $B769 label=unknown50
g $B769 unknown50

@ $B76A lgabel=unknown51
g $B76A unknown51

@ $B76b label=unknown52
g $B76b unknown52
W $B76b

@ $B76D label=unknown_table_5
g $B76D unknown_table_5

c $B7D3 routine30
@ $B7D3 label=routine30
@ $B7E4 ssub=LD HL,$B76D+99
@ $B7E7 ssub=LD DE,$B76D+101

c $B7FD routine31
@ $B7FD label=routine31

c $B81C routine32
@ $B81C label=routine32

@ $B844 label=unknown54
g $B844 unknown54

c $B845 routine33
@ $B845 label=routine33

c $B8BD routine34
@ $B8BD label=routine34

c $B8DD routine35
@ $B8DD label=routine35

@ $BA75 label=unknown55
g $BA75 unknown55
W $BA75

c $BA77 TEMP_C
@ $BA77 label=TEMP_C
C $BA77 disable interrupts
C $BA78 set HL to first address in #R$E01F
C $BA7B set B to $9F as loop counter
@ $BA7D label=TEMP_C_loop
C $BA7D preserve loop counter
C $BA7E store address of table entry in #R$BA75
C $BA81 load map object byte from table location
C $BA82 if byte is $23, $1D, or $1F, then call #R$BABE
C $BA91 add $0141 to address to get address of same entry in #R$E160
C $BA95 if byte at that location is $04 then call #R$BABE
C $BA9B load address back from #R$BA75 and compare to value in #R$AC12. If equal then call #R$BABE
C $BAA8 load address back from #R$BA75 and compare to value in #R$AC14. If equal then call #R$BABE
C $BAB5 load address back from #R$BA75 and increment to next entry in #R$E01F
C $BAB9 restore loop counter
C $BABA execute loop 160 times
C $BABC re-enable interrupts and return

c $BABE routine36
@ $BABE label=routine36
C $BABE preserve map object byte in A register
C $BABF load table entry address from #R$BA75
C $BAC2 Get screen coordinates for address.
C $BAC8 store returned value in #R$DF4C
C $BACE load value of #R$DF4A into HL and call #R$DF4E to print the object
C $BAD4 restore A register and return

c $BAD6 DH_P
D $BAD6 Print double height font.
@ $BAD6 label=DH_P
@ $BAD6 ssub=LD HL,$D908-$100
@ $BAD6 keep
C $BAD6 Set CHARS to #R$D908 - $100 (data for top half of font).
C $BADC Preserve AF.
C $BADD Print top half of char in A.
C $BAE0 Restore AF.
C $BAE1 Increment B to move one row down.
@ $BAE2 ssub=LD HL,$DB08-$100
@ $BAE2 keep
C $BAE2 Set CHARS to #R$DC08 - $100 (data for bottom half of font).
C $BAE8 Print bottom half of char in A.
C $BAEB Decrement B to return to original row.
C $BAEC Increment C to move right to next column and return.

c $BAEE Print string loop
@ $BAEE label=print_string_loop
R $BAEE HL Address
R $BAEE E length
C $BAEE load byte from address in HL
C $BAEF preserve HL and DE
C $BAF1 call #R$BAD6 to print character in A at coordinates in BC
C $BAF4 restore DE and HL
C $BAF6 decrement E
C $BAF7 increment HL to point at the next character in string
C $BAF8 loop back to #R$BAEE until E = 0
C $BAFA return

c $BAFB MPRINT
@ $BAFB label=MPRINT
D $BAFB print a message from #R$CDD3(game messages table 1).
R $BAFB A Message number
R $BAFB BC Coordinates
C $BAFB preserve HL, DE, and BC
C $BAFE set HL to value in A (message number)
C $BB01 multiply HL by four because each row is 4 bytes
C $BB03 add address of #R$CDD3(game messages table 1) to get address of desired row in game messages table
C $BB07 load address of message into DE
C $BB0A load message length into C
C $BB0C swap DE into HL
C $BB0D copy length into E
C $BB0E restore coordinates in BC
C $BB0F call routine at #R$BAEE to print string
C $BB12 restore DE and HL 
C $BB14 return

b $BB15 border graphic data
@ $BB15 label=border_graphics
B $BB15 #HTML(#UDG$BB15(bordersprite0))
B $BB1D #HTML(#UDG$BB1D(bordersprite1))
B $BB25 #HTML(#UDG$BB25(bordersprite2))
B $BB2D #HTML(#UDG$BB2D(bordersprite3))
B $BB35 #HTML(#UDG$BB35(bordersprite4))
B $BB3D #HTML(#UDG$BB3D(bordersprite5))
B $BB45 #HTML(#UDG$BB45(bordersprite6))
B $BB4D #HTML(#UDG$BB4D(bordersprite7))

w $BB55 address of border graphics table
@ $BB55 label=border_graphics_pointer

c $BB57 ZRDR_P
@ $BB57 label=ZRDR_P
D $BB57 Print border around game area.
C $BB57 Preserve registers.
C $BB5B Load address of border graphics from #R$BB55 and store in CHARS.
C $BB61 Set E to 20 as loop counter and row coordinate.
@ $BB63 label=vertical_border_loop
C $BB63 Print character $00 (left border) in column 0.
C $BB6C Print character $01 (right border) in column 31.
C $BB74 Loop back to #R$BB63 for 20 rows.
C $BB77 Set E to 30 as loop counter and column coordinate.
@ $BB79 label=horizontal_border_loop
C $BB79 Print character $02 (top border) in row 0.
C $BB82 Print character $03 (bottom border) in row 21.
C $BB8A Loop back to #R$BB79 for 30 columns.
C $BB8D Print character $04 (top-left corner) at coordinate (0,0).
C $BB95 Print character $05 (top-right corner) at coordinate (31,0).
C $BB9C Print character $06 (bottom-left corner) at coordinate (0,21).
C $BBA4 Print character $07 (bottom-right corner) at coordinate (31,21).
C $BBAB Restore registers and return.

c $BBB0 wait for a key and set SEED based on how long no key is pressed
@ $BBB0 label=wait_key_seed
C $BBB0 preserve HL, DE, BC
C $BBB3 skip to end of routine if current player is not human
C $BBB9 preserve BC
C $BBBA call KEY-SCAN in ROM to see if a key was pressed.
C $BBBD restore BC
C $BBBE increment counter (used to set SEED later)
C $BBBF loop back to #R$BBB9 if no key was pressed
C $BBC4 set SEED to the value of the counter
C $BBC8 restore BC, DE, HL
C $BBCB return

c $BBCC wait for no key to be pressed and set SEED based on how long a key is pressed
@ $BBCC label=wait_no_key_seed
C $BBCC preserve HL, DE, BC
C $BBCF skip to end of routine if current player is not human
C $BBD5 preserve BC
C $BBD6 call KEY-SCAN in ROM to see if a key was pressed.
C $BBD9 restore BC
C $BBDA increment counter (used to set SEED later)
C $BBDB loop back to #R$BBD5 if a key was pressed
C $BBDF set SEED to the value of the counter
C $BBE3 restore BC, DE, HL
C $BBE6 return

c $BBE7 Move cursor on screen depending on direction key pressed
@ $BBE7 label=move_cursor
D $BBE7 Movement points variable holds the number of points multiplied by two. It is set to 2 for non-diagonal movement, and 3 for diagonal movement.
C $BBE7 Preserve registers.
C $BBE9 Set CAPS mode.
C $BBEE Preserve cursor coordinates
C $BBEF Jump to #R$CDC0 if player is computer controlled.
C $BBF6 Call KEYBOARD routine in ROM.
C $BBF9 Restore cursor coordinates.
C $BBFA Store value of A (key pressed) in #R$AC32
C $BBFD If 'W' key pressed set movement points to 2 and decrement y coordinate.
@ $BC09 label=not_W_pressed
C $BC09 If 'X' key pressed set movement points to 2 and increment y coordinate.
@ $BC15 label=not_X_pressed
C $BC15 If 'A' key pressed set movement points to 2 and decrement x coordinate.
@ $BC21 label=not_A_pressed
C $BC21 If 'D' key pressed set movement points to 2 and increment x coordinate.
@ $BC2D label=not_D_pressed
C $BC2D If 'Q' key pressed set movement points to 3 and decrement x and y coordinates.
@ $BC3C label=not_Q_pressed
C $BC3C If 'E' key pressed set movement points to 3, increment x, and decrement y coordinates.
@ $BC4B label=not_E_pressed
C $BC4B If 'Z' key pressed set movement points to 3, increment y, and decrement x coordinates.
@ $BC5A label=not_Z_pressed
C $BC5A If 'C' key pressed set movement points to 3 and increment x and y coordinates.
@ $BC69 label=not_C_pressed
C $BC69 Restore registers and return.

c $BC6C cursor_up
@ $BC6C label=cursor_up
D $BC6C Move cursor up and prevent from going into border.
C $BC6C Decrement y-coordinate.
C $BC6D If 0 set back to 1.
C $BC70 Jump to return instruction at #R$BC8C.

c $BC72 cursor_down
@ $BC72 label=cursor_down
D $BC72 Move cursor down and prevent from going into border.
C $BC72 Increment y-coordinate.
C $BC73 If 11 set back to 10.
C $BC7A Jump to return instruction at #R$BC8C.

c $BC7D cursor_left
@ $BC7D label=cursor_left
D $BC7D Move cursor left and prevent from going into border.
C $BC7D Decrement x-coordinate.
C $BC7E If 0 set back to 1.
C $BC81 Jump to return instruction at #R$BC8C.

c $BC83 cursor_right
@ $BC83 label=cursor_right
D $BC83 Move cursor right and prevent from going into border.
C $BC83 Increment x-coordinate.
C $BC84 If 16 set back to 15.
C $BC8C Return.

c $BC8D GET_LC
@ $BC8D label=GET_LC
C $BC8D double contents of B and subtract one
C $BC90 double contents of C and subtract one
C $BC93 return

@ $BC94 label=cursor_coordinates
g $BC94 cursor coordinates
W $BC94

c $BC96 routine41
@ $BC96 label=routine41
C $BC96 Call KEYBOARD in ROM.
C $BC99 If decoded key is 'I' call #R$C3B3 to display information about the object at the current cursor position.
C $BCA0 On return wait for next interrupt, then jump to #R$BCE5.
@ $BCA3 label=not_I
C $BCA3 Call KEYBOARD in ROM.
C $BCA6 If decoded key is greater than '8' or less than '1' jump to #R$BCE5.
C $BCB0 Subtract $31 to convert keycode into player number.
C $BCB2 If value is greater than or equal to #R$AC0F jump to #R$BCE5.
C $BCB9 Else store number in #R$D391.
C $BCBC Call #R$C0DD ???
C $BCBF Wait for next interrupt then call #R$D392 ???
C $BCC3 Load #R$D391 into A and add $29 as offset to wizards in #R$CDD3(game messages table 1).
C $BCC8 Set BC to coordinates (0,22) and set ATTR-T to $46 (bright yellow on black).
C $BCD0 Print wizard name.
C $BCD3 Print #MPRINTLINK($5F).
C $BCD8 Call KEY-SCAN routine in ROM to see if a key was pressed.
C $BCDB If E is not $FF jump back to #R$BCC0. This prints messages and flashes the wizard and his creatures again while key is held down.
C $BCDE Clear bottom of screen.
C $BCE1 Call #R$C0DD ???
C $BCE4 Wait for next interrupt.
@ $BCE5 label=test_cursor_key
C $BCE5 Load #R$BC94(cursor coordinates) into BC and preserve on the stack.
C $BCEA Call #R$BBE7 to move cursor depending on direction key pressed.
C $BCED Restore old cursor coordinates into HL.
C $BCEE Preserve new cursor coordinates on stack.
C $BCEF Clear carry flag.
C $BCF0 If cursor coordinates have changed call #R$BED7.
C $BCF5 Restore new cursor coordinates and store in #R$BC94.
C $BCFA Call #R$BDA5 to print cursor sprite at cursor coordinates.
C $BCFD Set #R$AC12 to address of new coordinates in #R$E01F.
C $BD03 Read value back pointlessly.
C $BD06 Add $01E1 to get corresponding address in #R$E200.
C $BD0A Copy entry into #R$AC10.
C $BD0E Load address in #R$E01F again.
C $BD11 Set ATTR-T to bright cyan on black.
C $BD16 If object number is zero (nothing) jump to #R$BD88.
C $BD1A Else print the current object name at coordinates (0,22).
C $BD20 Set ATTR-T to bright green on black.
C $BD25 If bit 3 of #R$AC10 is set print #MPRINTLINK($31).
C $BD31 On return jump to #R$BD88 (Z flag is always set).
C $BD33 Else Add $0141 to address to get corresponding entry in #R$E160.
C $BD37 If animation frame is 4 print #MPRINTLINK($32) and jump to #R$BD88.
C $BD43 Else Add $0140 to address to get corresponding entry in #R$E2A0.
C $BD47 Set ATTR-T to bright white on black.
C $BD4C If entry is not zero ??? jump to #R$BD5D.
C $BD50 Else add $00A0 to address to get corresponding entry in #R$E340.
C $BD54 If entry is zero ??? jump to #R$BD62.
C $BD58 Else set ATTR-T to bright magenta on black.
C $BD5D Print '#' character.
C $BD62 If the object is a wizard jump to #R$BD88.
C $BD6B Else get address of entry in #R$E200.
C $BD6F Set ATTR-T to bright yellow on black.
C $BD74 Print '(' character.
C $BD7B Read entry from #R$E200 and mask lower 3 bits to get wizard number.
C $BD7E Convert wizard number to object number and print the wizard name.
C $BD83 Print ')' character.
C $BD88 Perform a busy wait delay.
@ $BD8A label=wait_outer_loop
@ $BD8D label=wait_inner_loop
C $BD92 Call #R$BDA5 to print cursor sprite at cursor coordinates.
C $BD95 Return if object number at cursor position is zero.
C $BD9B Else wait for three frames and set corresponding entry in #R$E0C0 to $01 then return.

c $BDA5 Print cursor sprite.
D $BDA5 
@ $BDA5 label=print_cursor
C $BDA5 Call CHAN-OPEN in ROM to set output channel to 2 (Screen).
C $BDAA Load #R$BC94(cursor coordinates) into BC and convert to Spectrum screen coordinates.
C $BDB1 Use PRINT-A routine in ROM to print AT control code.
C $BDB4 Output the coordinates B,C using PRINT-A.
C $BDB8 Print the first User Defined Graphic character.
C $BDBB Print the second User Defined Graphic character.
C $BDBE Increment B coordinate to move down a row.
C $BDBF Print AT control code followed by coordinates B,C.
C $BDC6 Print third and fourth User Defined Graphic characters.
C $BDCC Load #R$BC94(cursor coordinates) into BC and return.

c $BDD1 Get address of entry in #R$E01F.
D $BDD1 Calculate address of entry in #R$E01F from coordinates in BC and return in HL.
@ $BDD1 label=coordinate_to_address
C $BDD1 Preserve coordinates.
C $BDD2 Decrement each coordinate to get zero-based value.
C $BDD4 Multiply row by 16 and add column as table offset.
C $BDDE Set HL to address of #R$E01F and add offset.
C $BDE5 Restore coordinates and return.

c $BDE7 routine44
@ $BDE7 label=routine44

c $BE0A GETCHR
@ $BE0A label=GETCHR
D $BE0A enter with object number in D and offset in object data entry in E
C $BE0A preserve HL and BC
C $BE0C set HL to address of first entry in object address table
C $BE0F set BC to value in D (row number in object address table)
C $BE12 decrement C, then double it and add result to HL as an offset in object address table
C $BE16 load address of object data from the table into BC
C $BE19 set HL to value in E (offset in object data table entry)
C $BE1C add to the object address in BC to get offset within object data
C $BE1D load byte from object data into A
C $BE1E restore BC, HL
C $BE20 return

c $BE21 routine45
@ $BE21 label=routine45

c $BE52 routine46
@ $BE52 label=routine46

c $BE94 get a random number from 11 to 15 in A register
@ $BE94 label=get_random
C $BE94 preserve HL and DE
C $BE96 copy value of R register into E
@ $BE99 ssub=LD HL,$E01F+$96
C $BE99 set HL to address of #R$E01F+$96
C $BE9C add byte in E
C $BE9E load byte from resulting address into E
C $BEA1 add value of R register
C $BEA4 add value of SEED system variable
C $BEA8 mask off lower four bits
C $BEAA jump back to #R$BE96 if A is less than eleven
C $BEAF restore DE and HL
C $BE81 return

c $BEB2 routine47
@ $BEB2 label=routine47
C $BEB2 preserve AF, BC
C $BEB4 set #R$AC03 to zero
C $BEB8 set #R$AC07 to one
C $BEBD set ATTR-T to bright yellow on black
C $BEC2 set A to message $34
C $BEC4 set BC to coordinates (0,22)
C $BEC7 call #R$BED7 to clear line 22
C $BECA Print #MPRINTLINK($34) at coordinates (0,22)
C $BECD set HL to address of "ENGAGED TO ENEMY" sound effect
C $BED0 call play_sound_effect_in_HL
C $BED3 re-enable interrupts
C $BED4 restore BC, AF
C $BED6 return

c $BED7 clear bottom of screen by printing 32 spaces on line 22
@ $BED7 label=clear_bottom_row
C $BED7 preserve AF, DE, HL, BC
C $BEDB Print #MPRINTLINK($01) at coordinates (0,22)
C $BEE3 restore BC, HL, DE, AF
C $BEE7 return

@ $BEE8 label=unknown74
g $BEE8 unknown74

@ $BEE9 label=unknown75
g $BEE9 unknown75
W $BEE9

@ $BEEB label=unknown76
g $BEEB unknown76
W $BEEB

@ $BEED label=unknown77
g $BEED unknown77

@ $BEEE label=unknown78
g $BEEE unknown78

c $BEEF routine48
@ $BEEF label=routine48

b $BF37 sprite data for attack effect
@ $BF37 label=attack_effect_sprites
D $BF37 #HTML(#UDGARRAY2,,4;$BF37-$BF56-8(*attackeffectsprite0)) #HTML(#UDGARRAY2,,4;$BF57-$BF76-8(*attackeffectsprite1)) #HTML(#UDGARRAY2,,4;$BF77-$BF96-8(*attackeffectsprite2)) #HTML(#UDGARRAY2,,4;$BF97-$BFB6-8(*attackeffectsprite3)) #HTML(#UDGARRAY*attackeffectsprite0,10;attackeffectsprite1;attackeffectsprite2;attackeffectsprite3(attackeffect))
B $BF37,$20 #HTML(#UDGARRAY*attackeffectsprite0(attackeffectsprite0))
B $BF57,$20 #HTML(#UDGARRAY*attackeffectsprite1(attackeffectsprite1))
B $BF77,$20 #HTML(#UDGARRAY*attackeffectsprite2(attackeffectsprite2))
B $BF97,$20 #HTML(#UDGARRAY*attackeffectsprite3(attackeffectsprite3))

b $BFB7 WOOP_D
@ $BFB7 label=WOOP_D
D $BFB7 #HTML(#UDGARRAY2,,4;$BFB7-$BFD6-8(*WOOP_Dsprite0)) #HTML(#UDGARRAY2,,4;$BFD7-$BFF6-8(*WOOP_Dsprite1)) #HTML(#UDGARRAY2,,4;$BFF7-$C016-8(*WOOP_Dsprite2)) #HTML(#UDGARRAY2,,4;$C017-$C036-8(*WOOP_Dsprite3)) #HTML(#UDGARRAY2,,4;$C037-$C056-8(*WOOP_Dsprite4)) #HTML(#UDGARRAY2,,4;$C057-$C076-8(*WOOP_Dsprite5)) #HTML(#UDGARRAY2,,4;$C077-$C096-8(*WOOP_Dsprite6)) #HTML(#UDGARRAY2,,4;$C097-$C0B6-8(*WOOP_Dsprite7)) #HTML(#UDGARRAY2,,4;$C0B7-$C0D6-8(*WOOP_Dsprite8)) #HTML(#UDGARRAY*WOOP_Dsprite0,10;WOOP_Dsprite1;WOOP_Dsprite2;WOOP_Dsprite3;WOOP_Dsprite4;WOOP_Dsprite5;WOOP_Dsprite6;WOOP_Dsprite7;WOOP_Dsprite8,100(WOOP_Dsprite))
B $BFB7,$20 #HTML(#UDGARRAY*WOOP_Dsprite0(WOOP_Dsprite0))
B $BFD7,$20 #HTML(#UDGARRAY*WOOP_Dsprite1(WOOP_Dsprite1))
B $BFF7,$20 #HTML(#UDGARRAY*WOOP_Dsprite2(WOOP_Dsprite2))
B $C017,$20 #HTML(#UDGARRAY*WOOP_Dsprite3(WOOP_Dsprite3))
B $C037,$20 #HTML(#UDGARRAY*WOOP_Dsprite4(WOOP_Dsprite4))
B $C057,$20 #HTML(#UDGARRAY*WOOP_Dsprite5(WOOP_Dsprite5))
B $C077,$20 #HTML(#UDGARRAY*WOOP_Dsprite6(WOOP_Dsprite6))
B $C097,$20 #HTML(#UDGARRAY*WOOP_Dsprite7(WOOP_Dsprite7))
B $C0B7,$20 #HTML(#UDGARRAY*WOOP_Dsprite8(WOOP_Dsprite8))

u $C0D7

c $C0D8 routine49
@ $C0D8 label=routine49
@ $C105 ssub=LD DE,$E0C0+1

b $C123 sprite data for dragon breath
@ $C123 label=dragon_breath_sprites
D $C123 #HTML(#UDGARRAY2,,4;$C123-$C142-8(*dragonbreathsprite0)) #HTML(#UDGARRAY2,,4;$C143-$C162-8(*dragonbreathsprite1)) #HTML(#UDGARRAY2,,4;$C163-$C182-8(*dragonbreathsprite2)) #HTML(#UDGARRAY2,,4;$C183-$C1A2-8(*dragonbreathsprite3)) #HTML(#UDGARRAY2,,4;$C1A3-$C1C2-8(*dragonbreathsprite4)) #HTML(#UDGARRAY2,,4;$C1C3-$C1E2-8(*dragonbreathsprite5)) #HTML(#UDGARRAY2,,4;$C1E3-$C202-8(*dragonbreathsprite6)) #HTML(#UDGARRAY2,,4;$C203-$C222-8(*dragonbreathsprite7)) #HTML(#UDGARRAY2,,4;$C223-$C242-8(*dragonbreathsprite8)) #HTML(#UDGARRAY*dragonbreathsprite0,10;dragonbreathsprite1;dragonbreathsprite2;dragonbreathsprite3;dragonbreathsprite4;dragonbreathsprite5;dragonbreathsprite6;dragonbreathsprite7;dragonbreathsprite8,100(dragonbreath))
B $C123,$20 #HTML(#UDGARRAY*dragonbreathsprite0(dragonbreathsprite0))
B $C143,$20 #HTML(#UDGARRAY*dragonbreathsprite1(dragonbreathsprite1))
B $C163,$20 #HTML(#UDGARRAY*dragonbreathsprite2(dragonbreathsprite2))
B $C183,$20 #HTML(#UDGARRAY*dragonbreathsprite3(dragonbreathsprite3))
B $C1A3,$20 #HTML(#UDGARRAY*dragonbreathsprite4(dragonbreathsprite4))
B $C1C3,$20 #HTML(#UDGARRAY*dragonbreathsprite5(dragonbreathsprite5))
B $C1E3,$20 #HTML(#UDGARRAY*dragonbreathsprite6(dragonbreathsprite6))
B $C203,$20 #HTML(#UDGARRAY*dragonbreathsprite7(dragonbreathsprite7))
B $C223,$20 #HTML(#UDGARRAY*dragonbreathsprite8(dragonbreathsprite8))

@ $C243 label=sound_effect_16
b $C243 sound_effect_16
@ $C24D label=sound_effect_17
b $C24D sound_effect_17
@ $C257 label=sound_effect_18
b $C257 sound_effect_18
@ $C261 label=sound_effect_19
b $C261 sound_effect_19
@ $C26B label=sound_effect_20
b $C26B sound_effect_20
@ $C275 label=sound_effect_21
b $C275 sound_effect_21

@ $C27F label=sound_effect_8
b $C27F sound_effect_8
@ $C289 label=engaged_sound_effect
b $C289 "ENGAGED TO ENEMY" sound effect
@ $C293 label=sound_effect_9
b $C293 sound_effect_9
@ $C29D label=S10
b $C29D S10
@ $C2A7 label=sound_effect_10
b $C2A7 sound_effect_10
@ $C2B1 label=sound_effect_11
b $C2B1 sound_effect_11
@ $C2BB label=sound_effect_12
b $C2BB sound_effect_12
@ $C2C5 label=sound_effect_13
b $C2C5 sound_effect_13
@ $C2CF label=sound_effect_14
b $C2CF sound_effect_14
@ $C2D9 label=sound_effect_15
b $C2D9 sound_effect_15

@ $C2E3 label=sound_effect_22
D $C2E3 This overlaps #R$C2E8 with the result that when copied the same 5 bytes are repeated.
b $C2E3 sound_effect_22

@ $C2E8 label=sound_effect_temp
g $C2E8 sound effect data
D $C2E8 Sound effects are copied here by #R$C2F9 and the bytes read directly to save calculating offsets at the original location.
B $C2E8 Outer loop counter.
B $C2E9 Middle loop counter.
B $C2EA Delay counters.
B $C2EE Values to add to delay.

@ $C2F2 label=port_FE_output_byte
g $C2F2 port_FE_output_byte

@ $C2F3 label=sound_effect_pointer
g $C2F3 sound_effect_pointer
W $C2F3

u $C2F5

c $C2F6 play_sound_effect_pointer
@ $C2F6 label=play_sound_effect_pointer
C $C2F6 load sound_effect_pointer into HL as address to copy sound data from
@ $C2F9 label=play_sound_effect_in_HL
C $C2F9 copy ten bytes from address in HL to #R$C2E8 (sound effect playback data)
@ $C301 label=sound_effect_playback
D $C301 play the sound effect data at #R$C2E8
C $C301 disable interrupts
C $C302 load first byte of sound effect playback data into B
@ $C306 label=outer_sound_loop
C $C306 preserve BC (outer loop counter)
C $C307 load second byte of #R$C2E8 data into B
@ $C30B label=middle_sound_loop
C $C30B preserve BC (middle loop counter)
C $C30C set B to four as loop counter
C $C30E set HL to third byte of #R$C2E8 data
@ $C311 label=inner_sound_loop
C $C311 preserve inner loop counter
C $C312 preserve HL
C $C313 load byte at HL into B as delay
C $C314 call sound_playback_delay_routine
C $C317 load port_FE_output_byte into A
C $C31A XOR with 00110000 (flip bits 4 and 5)
C $C31C write result back to port_FE_output_byte
C $C31F output value to port $FE (ULA sound and border)
C $C321 restore HL
C $C322 increment HL to point to the next byte in the data block
C $C323 restore inner loop counter
C $C324 loop back to inner_sound_loop for 4 iterations
C $C326 restore middle loop counter
C $C327 loop back to middle_sound_loop
C $C329 set B to four
C $C32B swap HL and DE (so DE = #R$C2EE)
C $C32C set HL to #R$C2EA
@ $C32F label=sound_delay_addition_loop
C $C32F add byte at address in HL to byte at address in DE and store result at address in HL
C $C332 increment DE and HL
C $C334 loop back to sound_delay_addition_loop three times
C $C336 restore outer loop counter
C $C337 loop back to outer_sound_loop
C $C339 return

c $C33A sound_playback_delay_routine
@ $C33A label=sound_playback_delay_routine
D $C33A calling routine takes 17 T-states, loop for (13*(B-1))+8 T-states, and return takes 10 T-states
C $C33A loop to self B-1 times then return

b $C33D sprite data for cursors
@ $C33D label=cursorsprite0
B $C33D #HTML(#UDGARRAY2,,4;$C33D-$C35C-8(cursorsprite0))
@ $C35D label=cursorsprite1
B $C35D #HTML(#UDGARRAY2,,4;$C35D-$C37C-8(cursorsprite1))
@ $C37D label=cursorsprite2
B $C37D #HTML(#UDGARRAY2,,4;$C37D-$C39C-8(cursorsprite2))

@ $C39D label=unknown70
g $C39D unknown70
@ $C39E label=unknown71
g $C39E unknown71 
@ $C39F label=object_number
g $C39F Object number in #R$E3E0(object address table).
@ $C3A0 label=display_comma_flag
g $C3A0 Display comma before spell property flag.
@ $C3A1 label=unknown72
g $C3A1 unknown72
@ $C3A2 label=offset_in_object_data
g $C3A2 offset within object data
@ $C3A3 label=creature_attribute_message
g $C3A3 creature spell attribute message number
@ $C3A4 label=CH_LAW
g $C3A4 CH_LAW

@ $C3A5 label=creature_attr_coords_table
w $C3A5 Coordinates for printing creature attributes.

c $C3B3 Display information about the object at the current cursor position.
@ $C3B3 label=display_object_info
C $C3B3 Disable interrupts and preserve registers.
C $C3B8 If object at cursor position is blank, jump to #R$C5E8
C $C3C0 Else store code for current object in #R$C39F.
C $C3C3 If the current object is a wizard, bit 1 of #R$C39E is set, else it is cleared.
@ $C3CF label=not_wizard
C $C3CF Read corresponding entry in #R$E2A0.
C $C3D7 If not zero store in #R$C39D and set bit 2 of #R$C39E. ???
C $C3E2 Clear the screen and play #R$C2E3.
C $C3EB Set ATTR-T to bright green on black and draw border.
C $C3F3 Set ATTR-T to black on bright green and print #MPRINTLINK($3D) at coordinates (0,22).
C $C400 Set ATTR-T to bright yellow on black and print creature's name at (4,2).
C $C40E Clear #R$C3A0.
C $C412 If bit 1 (wizard object) of #R$C39E is clear jump to #R$C479.
C $C419 Set BC to coordinates (4,4).
C $C41C Calculate wizard number as offset in #R$AC16.
C $C428 Copy from table into #R$C3A1.
C $C42C If bit 1 is set print #MPRINTLINK($3E) spell property.
@ $C435 label=not_knife
C $C435 If bit 2 is set print #MPRINTLINK($3F) spell property.
@ $C441 label=not_sword
C $C441 If bits 6 and 7 are set print #MPRINTLINK($40) spell property.
@ $C44F label=not_armour
C $C44F If bit 6 is set and bit 7 is clear print #MPRINTLINK($41) spell property.
@ $C45D label=not_shield
C $C45D If bit 5 is set print #MPRINTLINK($42) spell property.
@ $C469 label=not_flying
C $C469 If bit 3 is set print #MPRINTLINK($43) spell property.
C $C476 If zero jump to #R$C4B8.
@ $C479 label=not_wizard_2
C $C479 Increment x coordinate.
C $C47A Get CHAOS/LAW attribute of object.
C $C483 If zero jump to #R$C4B8.
C $C486 If negative jump to #R$C4A1.
C $C48A Set ATTR-T to bright cyan on black and print #MPRINTLINK($47).
C $C495 Print value and closing bracket.
C $C49F Jump to #R$C4B8.
@ $C4A1 label=is_chaos
C $C4A1 Set ATTR-T to bright magenta on black and print #MPRINTLINK($46).
C $C4AC Convert value to positive number and print it followed by closing bracket.
@ $C4B8 label=done_chaos_law
C $C4B8 Set ATTR-T to bright green on black and set coordinates to (4,4).
C $C4C0 If object number is between 16 and 21 print #MPRINTLINK($44) property.
@ $C4D2 label=done_mount
C $C4D2 If #R$C39D is not zero print wizard name in brackets. ???
C $C4E7 Set #R$C3A0.
@ $C4EC label=done_wizard_name
C $C4EC If object number is between 19 and 29 print #MPRINTLINK($42) property.
@ $C4FE label=done_flying
C $C4FE If bit 6 of entry in #R$E200 is set or object number is between 28 and 33, print #MPRINTLINK($45) property.
@ $C516 label=is_undead
@ $C51B label=done_undead
C $C51B Set ATTR-T to bright cyan on black.
C $C520 Set #R$C3A3 to #MPRINTLINK($48).
C $C525 Set #R$C3A2 to combat attribute.
C $C52A Set HL to address of first coordinate in #R$C3A5.
C $C52D Set B to seven as loop counter.
@ $C52F label=display_next_attribute
C $C534 Preserve loop counter.
C $C530 Load coordinates into BC and move on to next word in table.
C $C534 Print the next attribute.
C $C539 Restore counter and loop for seven iterations.
C $C53C If bit 0 ??? of #R$C39E is clear then jump to #R$C56E.
C $C543 Set ATTR-T to bright cyan on black.
C $C548 Print #MPRINTLINK($4F) at coordinates (4,18).
C $C550 If #R$FFFF + 1 equals 10 print #MPRINTLINK($50).
@ $C55F label=print_casting_chance
C $C55F Else print value.
@ $C564 label=print_0_percent
C $C564 Print "0%".
@ $C56E label=done_casting_chance
C $C56E If bit 1 (wizard object) of #R$C39E is clear then jump to #R$C5C1.
C $C575 Set ATTR-T to bright yellow on black.
C $C57A Print #MPRINTLINK($51) at coordinates (4,18).
C $C582 Get number of spells attribute from wizard object.
C $C58B If less than 10 jump to #R$C5A6.
C $C590 If not 20 jump to #R$C59D.
C $C594 Print '2' and jump to #R$C5A6.
@ $C59D label=ten_to_nineteen
C $C59D Subtract 10 from value and print '1'.
@ $C5A6 label=spell_units
C $C5A6 Print value.
C $C5AB Print #MPRINTLINK($52) at coordinates (14,18).
C $C5B3 Get ability attribute from wizard object.
C $C5BC Print value.
C $C5C1 If #R$C39D is zero jump to #R$C5DC. ???
C $C5C7 Clear bit 1 (wizard object) of #R$C39E.
C $C5CC Copy #R$C39D to #R$C39F.
C $C5CF Set #R$C39D to zero.
C $C5D3 Wait for a keypress from human players and jump back to #R$C3E2. ???
C $C5DC Wait for a keypress from human players and clear screen.
C $C5E5 Call #R$C0DD. ???
C $C5E8 Restore registers, enable interrupts, and return.

@ $C5C1 label=not_wizard_3

C $C5E8 Restore registers, enable interrupts and return.

c $C5EE CLS
@ $C5EE label=CLS

c $C5FC Print a spell property
@ $C5FC label=print_spell_property
D $C5FC optional preceding comma as indicated by flag at #R$C3A0.
R $C5FC A Current spell property
C $C5FC preserve AF
C $C5FD skip to #R$C608 if #R$C3A0 flag is clear
C $C603 call #R$BAD6 to print a comma
C $C608 restore AF
C $C609 Print current spell property (e.g. undead, flying, etc)
C $C60C set flag at #R$C3A0 so comma is printed next time
C $C611 return

c $C612 Print an attribute for a creature spell.
@ $C612 label=print_creature_attribute
C $C612 load A with spell attribute message number from #R$C3A3
C $C615 preserve AF
C $C616 Print creature attribute
C $C619 restore AF
C $C61A increment spell attribute message number at #R$C3A3
C $C61E set ATTR-T to $47 (bright white on black)
C $C623 load object table row number variable into D
C $C627 load offset within object data variable into E
C $C62B increment byte at #R$C3A2
C $C62F call #R$BE0A
C $C632 add $30 to number returned to get character value
C $C634 call #R$BAD6 to print double height character at coordinates in BC
C $C637 set ATTR-P to $45 (bright cyan on black)
C $C63C return

c $C63D routine51
@ $C63D label=routine51

@ $C649 label=X_ADD
g $C649 X_ADD
W $C649

@ $C64B label=unknown59
g $C64B unknown59

c $C64C SORT
@ $C64C label=SORT

@ $C679 label=unknown82
g $C679 unknown82

c $C67A routine52
@ $C67A label=routine52

@ $C6D4 label=THRTAB
b $C6D4 THRTAB

c $C703 routine53
@ $C703 label=routine53

c $C710 routine54
@ $C710 label=routine54

@ $C78B label=TEMADD
g $C78B TEMADD
W $C78B

c $C78D routine55
@ $C78D label=routine55

@ $C7BB label=SRTCNT
g $C7BB SRTCNT

@ $C7BC label=EN_AN
c $C7BC EN_AN

c $C825 routine56
@ $C825 label=routine56

@ $C858 label=unknown60
g $C858 unknown60

c $C859 routine57
@ $C859 label=routine57

@ $C8B7 label=AIM
g $C8B7 AIM
W $C8B7

c $C8B9 routine58
@ $C8B9 label=routine58
@ $C8B9 ssub=LD HL,$D3F2+$1

c $C8C7 routine59
@ $C8C7 label=routine59

@ $C94A ssub=LD HL,$D3F2+$F

c $C955 routine60
@ $C955 label=routine60

@ $C9CD ssub=LD HL,$D3F2+$F3

c $C9D4 routine61
@ $C9D4 label=routine61
C $C9D4 load #R$CD86 into HL
C $C9D7 decrement HL twice
C $C9D9 store #R$CD86

@ $CA16 label=unknown61
@ $CA16 ssub=DEFW $E01F+$46
g $CA16 unknown61
W $CA16

@ $CA18 label=unknown62
g $CA18 unknown62

c $CA19 routine62
@ $CA19 label=routine62

c $CA7C routine63
@ $CA7C label=routine63

c $CA92 routine64
@ $CA92 label=routine64

@ $CB9C ssub=LD HL,$D3F2+$F

@ $CBB8 label=unknown63
g $CBB8 unknown63

c $CBB9 routine65
@ $CBB9 label=routine65

c $CBC7 routine66
@ $CBC7 label=routine66

@ $CC3A ssub=LD HL,$D3F2+$A1

@ $CC55 label=unknown64
g $CC55 unknown64

c $CC56 FIREON
@ $CC56 label=FIREON
C $CC56 copy #R$AC14 variable into #R$C78B
C $CC5C set #R$CC55 variable to $3C and call #R$C825 ??
C $CC64 set #R$CC55 variable to $20 ?? space character?
C $CC69 copy #R$C649 variable into #R$AC14
C $CC6F set #R$AC12 pointer to point at first entry in #R$E01F
C $CC75 set #R$C7BB variable to $09
C $CC7A set B register to $9E as loop counter
@ $CC7C label=FIREON_loop
C $CC7C preserve loop counter
C $CC7D call #R$C67A ???
C $CC80 if byte returned in A equals zero then jump forwards to #R$CC9E
C $CC83 copy byte from the address in #R$CD86 to #R$AC12 variable
C $CC8A ensure carry flag is clear
C $CC8B subtract #R$E01F from address in #R$CD86 to get offset
C $CC90 increment address in #R$CD86 and store offset at resulting address
C $CC96 increment address again and store result back in #R$CD86
C $CC9A increment #R$C7BB variable
@ $CC9E label=LCC9E
C $CC9E increment #R$AC12 pointer
C $CCA5 restore loop counter
C $CCA6 execute loop 158 times
C $CCA8 call #R$C64C with #R$D3F2 in HL and #R$C7BB in A ??
@ $CCB1 ssub=LD HL,$D3F2+1
C $CCB1 set #R$CD86 to second byte of #R$D3F2
C $CCB7 copy #R$C78B to #R$AC14
C $CCBD set #R$CC55 to zero and return

c $CCC3 routine67
@ $CCC3 label=routine67

@ $CD2A label=SPATAB
w $CD2A SPATAB
@ $CD2A keep
@ $CD36 keep

@ $CD3A label=SPADAT
g $CD3A SPADAT
W $CD3A

c $CD3C ADSPA
@ $CD3C label=ADSPA

@ $CD86 label=BUFPNT
g $CD86 BUFPNT
W $CD86

@ $CD88 label=direction_keys_string
t $CD88 string containing the direction keys

@ $CD90 label=unknown65
g $CD90 unknown65
W $CD90

c $CD92 routine68
@ $CD92 label=routine68
C $CD92 Set HL to address of #R$E01F.
C $CD95 Set B to 158 as loop counter.
C $CD97 Preserve address and counter.
C $CD99 Set #R$AC12 to position in #R$E01F.
C $CD9C Call #R$C67A ???
C $CD9F Add return value to byte at address in #R$CD86.
C $CDA4 Restore counter and address and advance to next entry.
C $CDA7 Loop for 158 iterations and return.

c $CDAA fill #R$D3F2 with $FF00
@ $CDAA label=fill_inbuf
C $CDAA set HL to address of #R$D3F2
C $CDAD set loop counter to $9E
C $CDAF store $FF00 at address in HL
C $CDB5 loop back to #R$CDAF for 158 iterations and return.

c $CDB8 routine69
@ $CDB8 label=routine69

c $CDC0 routine70
@ $CDC0 label=routine70

b $CDD3 game messages table 1
@ $CDD3 label=game_messages_1
D $CDD3 address,length
W $CDD3,$1F8,4

t $CFCB game message strings 1
T $CFCB,$3C6,$1F,$09,$07,$20,$20,$20,$0E,$07,$15,$19,1,$0F,$14,$10,$20,$05,$05,$06,$06,$06,$06,$05,$06,$07,$05,$07,$0E,$06,$08,$13,$11,$11,$0F,$02,$07,$08,$09,$0B,$0E,$0D,$20,$20,$10,$0E,$0F,$14,$0A,$18,$0C,$0A,$0A,$09,$09,$0A,$06,$07,$05,$05,$07,$07,$0C,$0C,$0B,$0B,$09,$05,$0A,$07,$0A,$08,$0A,$07,$0C,$0C,$06,$0D,$0B,$0B,$0B
@ $CFCB label=blank_line_string
@ $CFEA label=asleep_string
@ $CFF3 label=dead_string
@ $CFFA label=dismount_string
@ $D01A label=engaged_string
@ $D03A label=out_of_range_string
@ $D05A label=flying_brackets_string
@ $D068 label=s_turn_string
@ $D06F label=movement_points_string
@ $D084 label=undead_cannot_string
@ $D09D label=space_string
@ $D09E label=movement_range_string
@ $D0AD label=ranged_combat_range_string
@ $D0C1 label=no_line_of_sight_string
@ $D0D1 label=press_any_key_string
@ $D0F1 label=knife_string
@ $D0F6 label=sword_string
@ $D0FB label=armour_string
@ $D101 label=shield_string
@ $D107 label=flying_string
@ $D10D label=shadow_string
@ $D113 label=mount_string
@ $D118 label=undead_string
@ $D11E label=chaos_string
@ $D125 label=law_string
@ $D12A label=combat_string
@ $D131 label=ranged_combat_string
@ $D13F label=range_string
@ $D145 label=defence_string
@ $D14D label=movement_allowance_string
@ $D160 label=manoeuvre_string
@ $D171 label=magic_resistance_string
@ $D182 label=casting_chance_string
@ $D191 label=ten_string
@ $D193 label=spells_string
@ $D19A label=ability_string
@ $D1A2 label=s_spells_string
@ $D1AB label=spell_fails_string
@ $D1B6 label=spell_succeeds_string
@ $D1C4 label=is_the_winner_string
@ $D1D1 label=press_1_to_4_string
@ $D1F1 label=press_0_to_return_string
@ $D211 label=examine_spells_string
@ $D221 label=select_spell_string
@ $D22F label=examine_board_string
@ $D23E label=continue_game_string
@ $D252 label=disbelieve_string
@ $D25C label=illusion_string
@ $D274 label=s_creations_string
@ $D280 label=magic_fire_string
@ $D28A label=goey_blob_string
@ $D294 label=lightning_string
@ $D29D label=vengeance_string
@ $D2A6 label=dark_power_string
@ $D2B0 label=decree_string
@ $D2B6 label=justice_string
@ $D2BD label=law_1_string
@ $D2C2 label=law_2_string
@ $D2C7 label=chaos_1_string
@ $D2CE label=chaos_2_string
@ $D2D5 label=magic_shield_string
@ $D2E1 label=magic_armour_string
@ $D2ED label=magic_sword_string
@ $D2F8 label=magic_knife_string
@ $D303 label=magic_bow_string
@ $D30C label=blind_string
@ $D311 label=magic_bolt_string
@ $D31B label=tempest_string
@ $D322 label=raise_dead_string
@ $D32C label=teleport_string
@ $D334 label=subversion_string
@ $D33E label=turmoil_string
@ $D345 label=dead_revenge_string
@ $D351 label=consecration_string
@ $D35D label=dispel_string
@ $D363 label=counter_spell_string
@ $D370 label=magic_wings_string
@ $D37B label=magic_sleep_string
@ $D386 label=shadow_form_string

@ $D391 label=unknown68
g $D391 unknown68

c $D392 routine71
@ $D392 label=routine71

u $D3F0

b $D3F2 INBUF
@ $D3F2 label=INBUF

c $D52E routine72
@ $D52E label=routine72

c $D588 routine73
@ $D588 label=routine73

c $D5EC routine74
@ $D5EC label=routine74

c $D602 routine75
@ $D602 label=routine75

s $D651

c $D652 routine76
@ $D652 label=routine76

c $D686 routine77
@ $D686 label=routine77

c $D702 routine78
@ $D702 label=routine78

c $D732 routine79
@ $D732 label=routine79

c $D763 routine80
@ $D763 label=routine80

c $D7A6 routine81
@ $D7A6 label=routine81

c $D7EE routine82
@ $D7EE label=routine82

c $D82D routine83
@ $D82D label=routine83

c $D887 routine84
@ $D887 label=routine84

c $D8DE routine85
@ $D8DE label=routine85

@ $D908 expand=#DEFINE0(DOUBLEFONT,#UDGARRAY#(1,,4;#PC;#EVAL(#PC+$300))(font#N(((#PC-$D908) / 8) + $20)))

b $D908 Font data.
D $D908 #HTML(Images show top and bottom rows of font combined.)
@ $D908 label=font_data_top
B $D908 #HTML(#DOUBLEFONT)
B $D910 #HTML(#DOUBLEFONT)
B $D918 #HTML(#DOUBLEFONT)
B $D920 #HTML(#DOUBLEFONT)
B $D928 #HTML(#DOUBLEFONT)
B $D930 #HTML(#DOUBLEFONT)
B $D938 #HTML(#DOUBLEFONT)
B $D940 #HTML(#DOUBLEFONT)
B $D948 #HTML(#DOUBLEFONT)
B $D940 #HTML(#DOUBLEFONT)
B $D948 #HTML(#DOUBLEFONT)
B $D950 #HTML(#DOUBLEFONT)
B $D958 #HTML(#DOUBLEFONT)
B $D960 #HTML(#DOUBLEFONT)
B $D968 #HTML(#DOUBLEFONT)
B $D970 #HTML(#DOUBLEFONT)
B $D978 #HTML(#DOUBLEFONT)
B $D980 #HTML(#DOUBLEFONT)
B $D988 #HTML(#DOUBLEFONT)
B $D990 #HTML(#DOUBLEFONT)
B $D998 #HTML(#DOUBLEFONT)
B $D9A0 #HTML(#DOUBLEFONT)
B $D9A8 #HTML(#DOUBLEFONT)
B $D9B0 #HTML(#DOUBLEFONT)
B $D9B8 #HTML(#DOUBLEFONT)
B $D9C0 #HTML(#DOUBLEFONT)
B $D9C8 #HTML(#DOUBLEFONT)
B $D9D0 #HTML(#DOUBLEFONT)
B $D9D8 #HTML(#DOUBLEFONT)
B $D9E0 #HTML(#DOUBLEFONT)
B $D9E8 #HTML(#DOUBLEFONT)
B $D9F0 #HTML(#DOUBLEFONT)
B $D9F8 #HTML(#DOUBLEFONT)
B $DA00 #HTML(#DOUBLEFONT)
B $DA08 #HTML(#DOUBLEFONT)
B $DA10 #HTML(#DOUBLEFONT)
B $DA18 #HTML(#DOUBLEFONT)
B $DA20 #HTML(#DOUBLEFONT)
B $DA28 #HTML(#DOUBLEFONT)
B $DA30 #HTML(#DOUBLEFONT)
B $DA38 #HTML(#DOUBLEFONT)
B $DA40 #HTML(#DOUBLEFONT)
B $DA48 #HTML(#DOUBLEFONT)
B $DA40 #HTML(#DOUBLEFONT)
B $DA48 #HTML(#DOUBLEFONT)
B $DA50 #HTML(#DOUBLEFONT)
B $DA58 #HTML(#DOUBLEFONT)
B $DA60 #HTML(#DOUBLEFONT)
B $DA68 #HTML(#DOUBLEFONT)
B $DA70 #HTML(#DOUBLEFONT)
B $DA78 #HTML(#DOUBLEFONT)
B $DA80 #HTML(#DOUBLEFONT)
B $DA88 #HTML(#DOUBLEFONT)
B $DA90 #HTML(#DOUBLEFONT)
B $DA98 #HTML(#DOUBLEFONT)
B $DAA0 #HTML(#DOUBLEFONT)
B $DAA8 #HTML(#DOUBLEFONT)
B $DAB0 #HTML(#DOUBLEFONT)
B $DAB8 #HTML(#DOUBLEFONT)
B $DAC0 #HTML(#DOUBLEFONT)
B $DAC8 #HTML(#DOUBLEFONT)
B $DAD0 #HTML(#DOUBLEFONT)
B $DAD8 #HTML(#DOUBLEFONT)
B $DAE0 #HTML(#DOUBLEFONT)
B $DAE8 #HTML(#DOUBLEFONT)
B $DAF0 #HTML(#DOUBLEFONT)
B $DAF8 #HTML(#DOUBLEFONT)
B $DB00 #HTML(#DOUBLEFONT)
B $DB00 #HTML(#DOUBLEFONT)
B $DB08 #HTML(#DOUBLEFONT)
B $DB10 #HTML(#DOUBLEFONT)
B $DB18 #HTML(#DOUBLEFONT)
B $DB20 #HTML(#DOUBLEFONT)
B $DB28 #HTML(#DOUBLEFONT)
B $DB30 #HTML(#DOUBLEFONT)
B $DB38 #HTML(#DOUBLEFONT)
B $DB40 #HTML(#DOUBLEFONT)
B $DB48 #HTML(#DOUBLEFONT)
B $DB40 #HTML(#DOUBLEFONT)
B $DB48 #HTML(#DOUBLEFONT)
B $DB50 #HTML(#DOUBLEFONT)
B $DB58 #HTML(#DOUBLEFONT)
B $DB60 #HTML(#DOUBLEFONT)
B $DB68 #HTML(#DOUBLEFONT)
B $DB70 #HTML(#DOUBLEFONT)
B $DB78 #HTML(#DOUBLEFONT)
B $DB80 #HTML(#DOUBLEFONT)
B $DB88 #HTML(#DOUBLEFONT)
B $DB90 #HTML(#DOUBLEFONT)
B $DB98 #HTML(#DOUBLEFONT)
B $DBA0 #HTML(#DOUBLEFONT)
B $DBA8 #HTML(#DOUBLEFONT)
B $DBB0 #HTML(#DOUBLEFONT)
B $DBB8 #HTML(#DOUBLEFONT)
B $DBC0 #HTML(#DOUBLEFONT)
B $DBC8 #HTML(#DOUBLEFONT)
B $DBD0 #HTML(#DOUBLEFONT)
B $DBD8 #HTML(#DOUBLEFONT)
B $DBE0 #HTML(#DOUBLEFONT)
B $DBE8 #HTML(#DOUBLEFONT)
B $DBF0 #HTML(#DOUBLEFONT)
B $DBF8 #HTML(#DOUBLEFONT)
B $DC00 #HTML(#DOUBLEFONT)
@ $DC08 label=font_data_bottom
B $DC08 Bottom half of characters.

u $DF08

c $DF0C routine86
@ $DF0C label=routine86
C $DF0C jump to #R$DF72 ???

c $DF0F print 8x8 char graphic for char in A at coordinates C,B
@ $DF0F label=print_8x8_graphic

u $DF47

@ $DF4A label=C_DATA
g $DF4A C_DATA
W $DF4A

@ $DF4C label=LC_POS
g $DF4C LC_POS
W $DF4C

c $DF4E P_CHAR
@ $DF4E label=P_CHAR
C $DF4E set CHARS variable to address in #R$DF4A minus 256
C $DF55 read #R$DF4C into BC
C $DF59 call #R$DF0F to print character $20 (top left block of sprite)
C $DF5E move one character position right
C $DF5F call #R$DF0F to print character $21 (top right block of sprite)
C $DF64 move one character position left and one character row down
C $DF66 call #R$DF0F to print character $22 (bottom left block of sprite)
C $DF6B move one character position right
C $DF6C call #R$DF0F to print character $23 (bottom right block of sprite) then return

c $DF72 Update sprite for any objects which need to animate, and update counters.
D $DF72 Each position on the map has an associated animation timeout and frame number in #R$E0C0 and #R$E160.
D $DF72 For all map positions containing an object, decrement the timeout until it reaches 1, then cycle to the next frame and reset the timeout from the #R$E440(object data table).
@ $DF72 label=update_animation
C $DF72 Preserve registers.
C $DF76 Preserve value of ATTR-T.
C $DF7A Preserve value of CHARS.
C $DF7E Set HL to address of #R$E01F.
C $DF81 Call KEY-SCAN routine in Spectrum ROM to see if a key was pressed.
C $DF86 If CAPS SHIFT is pressed jump to #R$DF9D.
@ $DF8B label=next_object_entry
C $DF8B Else read entry from #R$E01F.
C $DF8C If value is $FF jump to #R$DF9D.
C $DF90 Else if value is not $00 jump to #R$DFAA.
@ $DF93 label=check_zero
C $DF93 If object is $01 set it to zero.
@ $DF9A label=not_1
C $DF9A Move on to next address and jump back to #R$DF8B.
@ $DF9D label=end_of_table
C $DF9D Restore value of CHARS.
C $DFA1 Restore value of ATTR-T.
C $DFA5 Restore registers and return.
@ $DFAA label=object_not_zero
C $DFAA Preserve position in #R$E01F and object number.
C $DFAC If corresponding entry in #R$E0C0 is $01 jump to #R$DFB9.
C $DFB4 Else decrement it and jump back to #R$DF93.
@ $DFB9 label=animation_delay_timeout
C $DFB9 Restore object number and preserve position in #R$E0C0.
C $DFBB Set HL to address of first object.
C $DFBE Decrement object number (to make first object 0).
C $DFBF Double it and add to HL.
C $DFC4 Load object pointer into BC.
C $DFC7 Load animation delay attribute from object.
C $DFCC Swap address of delay attribute into DE.
C $DFCD Restore position in #R$E0C0 and store animation delay there.
C $DFCF Add $0A to get corresponding address in #R$E160 and load it.
C $DFD4 Increment the frame number.
C $DFD5 If 4 reset to frame 0 (loop the animation).
@ $DFDA label=not_4
C $DFDA If 5 reset to frame 4 (dead creature sprite).
@ $DFDF label=not_5
C $DFDF Update value in #R$E160.
C $DFE0 Swap address of animation delay attribute back into HL and increment to address of first sprite pointer.
C $DFE2 Add frame number * 3 to get to required pointer.
C $DFE8 Store sprite pointer in #R$DF4A.
C $DFEF Load attribute for sprite and copy to ATTR-T.
C $DFF4 Restore position in #R$E01F and store in #R$E005.
C $DFF8 Convert position to coordinates and store in #R$DF4C then print the sprite.
C $E003 Jump back to #R$DF93.

@ $E005 label=unknown66
g $E005 unknown66
W $E005

c $E007 Calculate coordinates for an address in #R$E01F.
@ $E007 label=address_to_coordinate
C $E007 Load #R$E005 into HL.
C $E00A Clear carry flag.
C $E00B Subtract address of #R$E01F to get position in table.
C $E010 Copy offset into A and clear lower nibble.
C $E013 Divide by 8 to get row and store in H.
C $E010 Multiply offset by 2 and mask bits to get column and store in L.
C $E01C Increment both coordinates to account for border and return.

@ $E01F label=map_object_table
D $E01F Table is 16 columns by 10 rows, but rightmost column ($E0xE) is unused. This holds the object number for each map position.
g $E01F map_object_table
B $E01F Object codes for each map position.
B $E0BF End of table marker.

@ $E0C0 label=map_animation_timeout_table
g $E0C0 map_animation_timeout_table
D $E0C0 Table is 16 columns by 10 rows.

@ $E160 label=map_animation_frame_table
g $E160 map_animation_frame_table
D $E160 Table is 16 columns by 10 rows. This holds the current animation frame for each map position.
B $E160 Frame numbers $00 to $03, or $04 for dead.

@ $E200 label=fourth_map_table
g $E200 fourth_map_table
D $E200 Table is 16 columns by 10 rows.

@ $E2A0 label=fifth_map_table
g $E2A0 fifth_map_table
D $E2A0 Table is 16 columns by 10 rows.

@ $E340 label=sixth_map_table
g $E340 sixth_map_table
D $E340 Table is 16 columns by 10 rows.

w $E3E0 object address table
@ $E3E0 label=nothing_pointer
W $E3E0 Object 1: Nothing.
@ $E3E2 label=king_cobra_pointer
W $E3E2 Object 2: King cobra.
@ $E3E4 label=dire_wolf_pointer
W $E3E4 Object 3: Dire wolf.
@ $E3E6 label=goblin_pointer
W $E3E6 Object 4: Goblin.
@ $E3E8 label=crocodile_pointer
W $E3E8 Object 5: Crocodile.
@ $E3EA label=faun_pointer
W $E3EA Object 6: Faun.
@ $E3EC label=lion_pointer
W $E3EC Object 7: Lion.
@ $E3EE label=elf_pointer
W $E3EE Object 8: Elf.
@ $E3F0 label=orc_pointer
W $E3F0 Object 9: Orc.
@ $E3F2 label=bear_pointer
W $E3F2 Object 10: Bear.
@ $E3F4 label=gorilla_pointer
W $E3F4 Object 11: Gorilla.
@ $E3F6 label=ogre_pointer
W $E3F6 Object 12: Ogre.
@ $E3F8 label=hydra_pointer
W $E3F8 Object 13: Hydra.
@ $E3FA label=giant_rat_pointer
W $E3FA Object 14: Giant rat.
@ $E3FC label=giant_pointer
W $E3FC Object 15: Giant.
@ $E3FE label=horse_pointer
W $E3FE Object 16: Horse.
@ $E400 label=unicorn_pointer
W $E400 Object 17: Unicorn.
@ $E402 label=centaur_pointer
W $E402 Object 18: Centaur.
@ $E404 label=pegasus_pointer
W $E404 Object 19: Pegasus.
@ $E406 label=gryphon_pointer
W $E406 Object 20: Gryphon.
@ $E408 label=manticore_pointer
W $E408 Object 21: Manticore.
@ $E40A label=bat_pointer
W $E40A Object 22: Bat.
@ $E40C label=green_dragon_pointer
W $E40C Object 23: Green dragon.
@ $E40E label=red_dragon_pointer
W $E40E Object 24: Red dragon.
@ $E410 label=golden_dragon_pointer
W $E410 Object 25: Golden dragon.
@ $E412 label=harpy_pointer
W $E412 Object 26: Harpy.
@ $E414 label=eagle_pointer
W $E414 Object 27: Eagle.
@ $E416 label=vampire_pointer
W $E416 Object 28: Vampire.
@ $E418 label=ghost_pointer
W $E418 Object 29: Ghost.
@ $E41A label=spectre_pointer
W $E41A Object 30: Spectre.
@ $E41C label=wraith_pointer
W $E41C Object 31: Wraith.
@ $E41E label=skeleton_pointer
W $E41E Object 32: Skeleton.
@ $E420 label=zombie_pointer
W $E420 Object 33: Zombie.
@ $E422 label=blob_pointer
W $E422 Object 34: Blob.
@ $E424 label=fire_pointer
W $E424 Object 35: Fire.
@ $E426 label=magic_wood_pointer
W $E426 Object 36: Magic wood.
@ $E428 label=shadow_wood_pointer
W $E428 Object 37: Shadow wood.
@ $E42A label=magic_castle_pointer
W $E42A Object 38: Magic castle.
@ $E42C label=dark_citadel_pointer
W $E42C Object 39: Dark citadel.
@ $E42E label=wall_pointer
W $E42E Object 40: Wall.
@ $E430 label=wizard_0_pointer
W $E430 Object 41: Wizard 0.
@ $E432 label=wizard_1_pointer
W $E432 Object 42: Wizard 1.
@ $E434 label=wizard_2_pointer
W $E434 Object 43: Wizard 2.
@ $E436 label=wizard_3_pointer
W $E436 Object 44: Wizard 3.
@ $E438 label=wizard_4_pointer
W $E438 Object 45: Wizard 4.
@ $E43A label=wizard_5_pointer
W $E43A Object 46: Wizard 5.
@ $E43C label=wizard_6_pointer
W $E43C Object 47: Wizard 6.
@ $E43E label=wizard_7_pointer
W $E43E Object 48: Wizard 7.


@ $E440 expand=#DEFINE1,1(ANIMSPELL,#FOR(0,3)||$n|#SPRITE#(({0}+($n*3)))(*frame$n)||#UDGARRAY*frame0;frame1;frame2;frame3({1}))
@ $E440 expand=#DEFINE1,1(SPELLSPRITE,#SPRITE{0}({1}))
@ $E440 expand=#DEFINE1,(SPELLNAME,#FOR(0,12)||$n|#CHR(#PEEK({0}+$n))||)
@ $E440 expand=#DEFINE1(SPELLSTATS,Combat=#PEEK({0})#RAW(,) Ranged combat=#PEEK({0}+1)#RAW(,) Range=#PEEK({0}+2)#RAW(,) Defence=#PEEK({0}+3)#RAW(,) Movement allowance=#PEEK({0}+4)#RAW(,) Manouvre rating=#PEEK({0}+5)#RAW(,) Magic resistance=#PEEK({0}+6)#RAW(,) Casting chance=#PEEK({0}+7)#RAW(,) Chaos/Law=#SIGNED(#PEEK({0}+8))#RAW(,) Animation delay=#PEEK({0}+9))

b $E440 object data table
@ $E440 label=nothing
T $E440 Nothing
B $E44D,10,d10 #SPELLSTATS$E44D
M $E457,12 #HTML(#UDGARRAY2,$45,4;$EB51-$EB70-8(nothingcoloured))
W $E457,2
B $E459,1
L $E457,3,4

@ $E463 label=king_cobra
T $E463 #SPELLNAME$E463
B $E470,10,d10 #SPELLSTATS$E470
M $E47A,12 #HTML(#ANIMSPELL$E47A|kingcobracoloured| )king cobra animation cycle
W $E47A,2
B $E47C,1
L $E47A,3,4
M $E486,3 #HTML(#SPELLSPRITE$E486|deadkingcobracoloured| )dead king cobra
W $E486,2
B $E488,1

@ $E489 label=bat
T $E489 #SPELLNAME$E489
B $E496,10,d10 #SPELLSTATS$E496
M $E4A0,12 #HTML(#ANIMSPELL$E4A0|batcoloured| )bat animation cycle
W $E4A0,2
B $E4A2,1
L $E4A0,3,4
M $E4AC,3 #HTML(#SPELLSPRITE$E4AC|deadbatcoloured| )dead bat
W $E4AC,2
B $E4AE,1

@ $E4AF label=blob
T $E4AF #SPELLNAME$E4AF
B $E4BC,10,d10 #SPELLSTATS$E4BC
M $E4C6,12 #HTML(#ANIMSPELL$E4C6|blobcoloured| )blob animation cycle
W $E4C6,2
B $E4C8,1
L $E4C6,3,4
M $E4D2,3 #HTML(#SPELLSPRITE$E4D2|deadblobcoloured| )dead blob
W $E4D2,2
B $E4D4,1

@ $E4D5 label=dire_wolf
T $E4D5 #SPELLNAME$E4D5
B $E4E2,10,d10 #SPELLSTATS$E4E2
M $E4EC,12 #HTML(#ANIMSPELL$E4EC|direwolfcoloured| )dire wolf animation cycle
W $E4EC,2
B $E4EE,1
L $E4EC,3,4
M $E4F8,3 #HTML(#SPELLSPRITE$E4F8|deaddirewolfcoloured| )dead dire wolf
W $E4F8,2
B $E4FA,1

@ $E4FB label=spectre
T $E4FB #SPELLNAME$E4FB
B $E508,10,d10 #SPELLSTATS$E508
M $E512,12 #HTML(#ANIMSPELL$E512|spectrecoloured| )spectre animation cycle
W $E512,2
B $E514,1
L $E512,3,4
M $E51E,3 #HTML(#SPELLSPRITE$E51E|deadspectrecoloured| )dead spectre
W $E51E,2
B $E520,1

@ $E521 label=goblin
T $E521 #SPELLNAME$E521
B $E52E,10,d10 #SPELLSTATS$E52E
M $E538,12 #HTML(#ANIMSPELL$E538|goblincoloured| )goblin animation cycle
W $E538,2
B $E53A,1
L $E538,3,4
M $E544,3 #HTML(#SPELLSPRITE$E544|deadgoblincoloured| )dead goblin
W $E544,2
B $E546,1

@ $E547 label=crocodile
T $E547 #SPELLNAME$E547
B $E554,10,d10 #SPELLSTATS$E554
M $E55E,12 #HTML(#ANIMSPELL$E55E|crocodilecoloured| )crocodile animation cycle
W $E55E,2
B $E560,1
L $E55E,3,4
M $E56A,3 #HTML(#SPELLSPRITE$E56A|deadcrocodilecoloured| )dead crocodile
W $E56A,2
B $E56C,1

@ $E56D label=green_dragon
T $E56D #SPELLNAME$E56D
B $E57A,10,d10 #SPELLSTATS$E57A
M $E584,12 #HTML(#ANIMSPELL$E584|greendragoncoloured| )green dragon animation cycle
W $E584,2
B $E586,1
L $E584,3,4
M $E590,3 #HTML(#SPELLSPRITE$E590|deadgreendragoncoloured| )dead green dragon
W $E590,2
B $E592,1

@ $E593 label=vampire
T $E593 #SPELLNAME$E593
B $E5A0,10,d10 #SPELLSTATS$E5A0
M $E5AA,12 #HTML(#ANIMSPELL$E5AA|vampirecoloured| )vampire animation cycle
W $E5AA,2
B $E5AC,1
L $E5AA,3,4
M $E5B6,3 #HTML(#SPELLSPRITE$E5B6|deadvampirecoloured| )dead vampire
W $E5B6,2
B $E5B8,1

@ $E5B9 label=faun
T $E5B9 #SPELLNAME$E5B9
B $E5C6,10,d10 #SPELLSTATS$E5C6
M $E5D0,12 #HTML(#ANIMSPELL$E5D0|fauncoloured| )faun animation cycle
W $E5D0,2
B $E5D2,1
L $E5D0,3,4
M $E5DC,3 #HTML(#SPELLSPRITE$E5DC|deadfauncoloured| )dead faun
W $E5DC,2
B $E5DE,1

@ $E5DF label=lion
T $E5DF #SPELLNAME$E5DF
B $E5EC,10,d10 #SPELLSTATS$E5EC
M $E5F6,12 #HTML(#ANIMSPELL$E5F6|lioncoloured| )lion animation cycle
W $E5F6,2
B $E5F8,1
L $E5F6,3,4
M $E602,3 #HTML(#SPELLSPRITE$E602|deadlioncoloured| )dead lion
W $E602,2
B $E604,1

@ $E605 label=gryphon
T $E605 #SPELLNAME$E605
B $E612,10,d10 #SPELLSTATS$E612
M $E61C,12 #HTML(#ANIMSPELL$E61C|gryphoncoloured| )gryphon animation cycle
W $E61C,2
B $E61E,1
L $E61C,3,4
M $E628,3 #HTML(#SPELLSPRITE$E628|deadgryphoncoloured| )dead gryphon
W $E628,2
B $E62A,1

@ $E62B label=elf
T $E62B #SPELLNAME$E62B
B $E638,10,d10 #SPELLSTATS$E638
M $E642,12 #HTML(#ANIMSPELL$E642|elfcoloured| )elf animation cycle
W $E642,2
B $E644,1
L $E642,3,4
M $E64E,3 #HTML(#SPELLSPRITE$E64E|deadelfcoloured| )dead elf
W $E64E,2
B $E650,1

@ $E651 label=horse
T $E651 #SPELLNAME$E651
B $E65E,10,d10 #SPELLSTATS$E65E
M $E668,12 #HTML(#ANIMSPELL$E668|horsecoloured| )horse animation cycle
W $E668,2
B $E66A,1
L $E668,3,4
M $E674,3 #HTML(#SPELLSPRITE$E674|deadhorsecoloured| )dead horse
W $E674,2
B $E676,1

@ $E677 label=orc
T $E677 #SPELLNAME$E677
B $E684,10,d10 #SPELLSTATS$E684
M $E68E,12 #HTML(#ANIMSPELL$E68E|orccoloured| )orc animation cycle
W $E68E,2
B $E690,1
L $E68E,3,4
M $E69A,3 #HTML(#SPELLSPRITE$E69A|deadorccoloured| )dead orc
W $E69A,2
B $E69C,1

@ $E69D label=red_dragon
T $E69D #SPELLNAME$E69D
B $E6AA,10,d10 #SPELLSTATS$E6AA
M $E6B4,12 #HTML(#ANIMSPELL$E6B4|reddragoncoloured| )red dragon animation cycle
W $E6B4,2
B $E6B6,1
L $E6B4,3,4
M $E6C0,3 #HTML(#SPELLSPRITE$E6C0|deadreddragoncoloured| )dead red dragon
W $E6C0,2
B $E6C2,1

@ $E6C3 label=fire
T $E6C3 #SPELLNAME$E6C3
B $E6D0,10,d10 #SPELLSTATS$E6D0
M $E6DA,12 #HTML(#ANIMSPELL$E6DA|redfirecoloured| )fire animation cycle
W $E6DA,2
B $E6DC,1
L $E6DA,3,4

@ $E6E6 label=manticore
T $E6E6 #SPELLNAME$E6E6
B $E6F3,10,d10 #SPELLSTATS$E6F3
M $E6FD,12 #HTML(#ANIMSPELL$E6FD|manticorecoloured| )manticore animation cycle
W $E6FD,2
B $E6FF,1
L $E6FD,3,4
M $E709,3 #HTML(#SPELLSPRITE$E709|deadmanticorecoloured| )dead manticore
W $E709,2
B $E70B,1

@ $E70D label=troll
T $E70D #SPELLNAME$E70D
B $E71A,10,d10 #SPELLSTATS$E71A
M $E724,12 #HTML(#ANIMSPELL$E724|trollcoloured| )troll animation cycle
W $E724,2
B $E726,1
L $E724,3,4
M $E730,3 #HTML(#SPELLSPRITE$E730|deadtrollcoloured| )dead troll
W $E730,2
B $E732,1

@ $E733 label=unicorn
T $E733 #SPELLNAME$E733
B $E740,10,d10 #SPELLSTATS$E740
M $E74A,12 #HTML(#ANIMSPELL$E74A|unicorncoloured| )unicorn animation cycle
W $E74A,2
B $E74C,1
L $E74A,3,4
M $E756,3 #HTML(#SPELLSPRITE$E756|deadunicorncoloured| )dead unicorn
W $E756,2
B $E758,1

@ $E759 label=ghost
T $E759 #SPELLNAME$E759
B $E766,10,d10 #SPELLSTATS$E766
M $E770,12 #HTML(#ANIMSPELL$E770|ghostcoloured| )ghost animation cycle
W $E770,2
B $E772,1
L $E770,3,4

@ $E77C label=wraith
T $E77C #SPELLNAME$E77C
B $E789,10,d10 #SPELLSTATS$E789
M $E793,12 #HTML(#ANIMSPELL$E793|wraithcoloured| )wraith animation cycle
W $E793,2
B $E795,1
L $E793,3,4

@ $E79F label=bear
T $E79F #SPELLNAME$E79F
B $E7AC,10,d10 #SPELLSTATS$E7AC
M $E7B6,12 #HTML(#ANIMSPELL$E7B6|bearcoloured| )bear animation cycle
W $E7B6,2
B $E7B8,1
L $E7B6,3,4
M $E7C2,3 #HTML(#SPELLSPRITE$E7C2|deadbearcoloured| )dead bear
W $E7C2,2
B $E7C4,1

@ $E7C5 label=gorilla
T $E7C5 #SPELLNAME$E7C5
B $E7D2,10,d10 #SPELLSTATS$E7D2
M $E7DC,12 #HTML(#ANIMSPELL$E7DC|gorillacoloured| )gorilla animation cycle
W $E7DC,2
B $E7DE,1
L $E7DC,3,4
M $E7E8,3 #HTML(#SPELLSPRITE$E7E8|deadgorillacoloured| )dead gorilla
W $E7E8,2
B $E7EA,1

@ $E7EB label=skeleton
T $E7EB #SPELLNAME$E7EB
B $E7F8,10,d10 #SPELLSTATS$E7F8
M $E802,12 #HTML(#ANIMSPELL$E802|skeletoncoloured| )skeleton animation cycle
W $E802,2
B $E804,1
L $E802,3,4

@ $E80E label=ogre
T $E80E #SPELLNAME$E80E
B $E81B,10,d10 #SPELLSTATS$E81B
M $E825,12 #HTML(#ANIMSPELL$E825|ogrecoloured| )ogre animation cycle
W $E825,2
B $E827,1
L $E825,3,4
M $E831,3 #HTML(#SPELLSPRITE$E831|deadogrecoloured| )dead ogre
W $E831,2
B $E833,1

@ $E834 label=zombie
T $E834 #SPELLNAME$E834
B $E841,10,d10 #SPELLSTATS$E841
M $E84B,12 #HTML(#ANIMSPELL$E84B|zombiecoloured| )zombie animation cycle
W $E84B,2
B $E84D,1
L $E84B,3,4

@ $E857 label=harpy
T $E857 #SPELLNAME$E857
B $E864,10,d10 #SPELLSTATS$E864
M $E86E,12 #HTML(#ANIMSPELL$E86E|harpycoloured| )harpy animation cycle
W $E86E,2
B $E870,1
L $E86E,3,4
M $E87A,3 #HTML(#SPELLSPRITE$E87A|deadharpycoloured| )dead harpy
W $E87A,2
B $E87C,1

@ $E87D label=pegasus
T $E87D #SPELLNAME$E87D
B $E88A,10,d10 #SPELLSTATS$E88A
M $E894,12 #HTML(#ANIMSPELL$E894|pegasuscoloured| )pegasus animation cycle
W $E894,2
B $E896,1
L $E894,3,4
M $E8A0,3 #HTML(#SPELLSPRITE$E8A0|deadpegasuscoloured| )dead pegasus
W $E8A0,2
B $E8A2,1

@ $E8A3 label=eagle
T $E8A3 #SPELLNAME$E8A3
B $E8B0,10,d10 #SPELLSTATS$E8B0
M $E8BA,12 #HTML(#ANIMSPELL$E8BA|eaglecoloured| )eagle animation cycle
W $E8BA,2
B $E8BC,1
L $E8BA,3,4
M $E8C6,3 #HTML(#SPELLSPRITE$E8C6|deadeaglecoloured| )dead eagle
W $E8C6,2
B $E8C8,1

@ $E8C9 label=hydra
T $E8C9 #SPELLNAME$E8C9
B $E8D6,10,d10 #SPELLSTATS$E8D6
M $E8E0,12 #HTML(#ANIMSPELL$E8E0|hydracoloured| )hydra animation cycle
W $E8E0,2
B $E8E2,1
L $E8E0,3,4
M $E8EC,3 #HTML(#SPELLSPRITE$E8EC|deadhydracoloured| )dead hydra
W $E8EC,2
B $E8EE,1

@ $E8EF label=giant_rat
T $E8EF #SPELLNAME$E8EF
B $E8FC,10,d10 #SPELLSTATS$E8FC
M $E906,12 #HTML(#ANIMSPELL$E906|giantratcoloured| )giant rat animation cycle
W $E906,2
B $E908,1
L $E906,3,4
M $E912,3 #HTML(#SPELLSPRITE$E912|deadgiantratcoloured| )dead giant rat
W $E912,2
B $E914,1

@ $E915 label=centaur
T $E915 #SPELLNAME$E915
B $E922,10,d10 #SPELLSTATS$E922
M $E92C,12 #HTML(#ANIMSPELL$E92C|centaurcoloured| )centaur animation cycle
W $E92C,2
B $E92E,1
L $E92C,3,4
M $E938,3 #HTML(#SPELLSPRITE$E938|deadcentaurcoloured| )dead centaur
W $E938,2
B $E93A,1

@ $E93B label=giant
T $E93B #SPELLNAME$E93B
B $E948,10,d10 #SPELLSTATS$E948
M $E952,12 #HTML(#ANIMSPELL$E952|giantcoloured| )giant animation cycle
W $E952,2
B $E954,1
L $E952,3,4
M $E95E,3 #HTML(#SPELLSPRITE$E95E|deadgiantcoloured| )dead giant
W $E95E,2
B $E960,1

@ $E961 label=golden_dragon
T $E961 #SPELLNAME$E961
B $E96E,10,d10 #SPELLSTATS$E96E
M $E978,12 #HTML(#ANIMSPELL$E978|goldendragoncoloured| )golden dragon animation cycle
W $E978,2
B $E97A,1
L $E978,3,4
M $E984,3 #HTML(#SPELLSPRITE$E984|deadgoldendragoncoloured| )dead golden dragon
W $E984,2
B $E986,1

@ $E987 label=dark_citadel
T $E987 #SPELLNAME$E987
B $E994,10,d10 #SPELLSTATS$E994
M $E99E,12 #HTML(#ANIMSPELL$E99E|darkcitadelcoloured| )dark citadel animation cycle
W $E99E,2
B $E9A0,1
L $E99E,3,4
M $E9AA,3 #HTML(#SPELLSPRITE$E9AA|deaddarkcitadelcoloured| )dead dark citadel ???
W $E9AA,2
B $E9AC,1

@ $E9AD label=magic_castle
T $E9AD #SPELLNAME$E9AD
B $E9BA,10,d10 #SPELLSTATS$E9BA
M $E9C4,12 #HTML(#ANIMSPELL$E9C4|magiccastlecoloured| )magic castle animation cycle
W $E9C4,2
B $E9C6,1
L $E9C4,3,4

@ $E9D0 label=shadow_wood
T $E9D0 #SPELLNAME$E9D0
B $E9DD,10,d10 #SPELLSTATS$E9DD
M $E9E7,12 #HTML(#ANIMSPELL$E9E7|shadowwoodcoloured| )shadow wood animation cycle
W $E9E7,2
B $E9E9,1
L $E9E7,3,4

@ $E9F3 label=magic_wood
T $E9F3 #SPELLNAME$E9F3
B $EA00,10,d10 #SPELLSTATS$EA00
M $EA0A,12 #HTML(#ANIMSPELL$EA0A|magicwoodcoloured| )magic wood animation cycle
W $EA0A,2
B $EA0C,1
L $EA0A,3,4

@ $EA16 label=wall
T $EA16 #SPELLNAME$EA16
B $EA23,10,d10 #SPELLSTATS$EA23
; M $EA2D,12 #HTML(#ANIMSPELL$EA2D|wallcoloured| )wall
M $EA2D,12 #HTML(#SPELLSPRITE$EA2D|wallcoloured| )wall
W $EA2D,2
B $EA2F,1
L $EA2D,3,4

g $EA39 wizard data
; macro to print wizard name for wizard n by looking up address and length in games message table 1
@ $EA39 expand=#DEFINE1(WIZARDNAME,#FOR(0,#EVAL(#PEEK($CE79+({0}*4))-1))||$n|#CHR(#PEEK(#DPEEK($CE77+({0}*4))+$n))||)

; macro to print out wizard stats from memory
@ $EA39 expand=#DEFINE1(WIZARDSTATS,Combat=#PEEK({0})#RAW(,) Ranged combat=#PEEK({0}+1)#RAW(,) Range=#PEEK({0}+2)#RAW(,) Defence=#PEEK({0}+3)#RAW(,) Movement allowance=#PEEK({0}+4)#RAW(,) Manouvre rating=#PEEK({0}+5)#RAW(,) Magic resistance=#PEEK({0}+6)#RAW(,) Spells=#PEEK({0}+7)#RAW(,) Ability=#PEEK({0}+8)#RAW(,) Animation delay=#PEEK({0}+9))

D $EA39 The first two names memory in the released tape were obviously written over existing strings. Based on Gollop's blog post about the origins of Chaos they were most likely JEVARELL and LARGEFART.
D $EA39 This data is overwritten during character creation at the start of the game

@ $EA39 label=wizard_0
T $EA39 Wizard 0: #WIZARDNAME0
B $EA46,10,d10 #WIZARDSTATS$EA46
M $EA50,12 #HTML(#ANIMSPELL$EA50|wizard0coloured| )
W $EA50,2
B $EA52,1
L $EA50,3,4

@ $EA5C label=wizard_1
T $EA5C Wizard 1: #WIZARDNAME1
B $EA69,10,d10 #WIZARDSTATS$EA69
M $EA73,12 #HTML(#ANIMSPELL$EA73|wizard1coloured| )
W $EA73,2
B $EA75,1
L $EA73,3,4

@ $EA7F label=wizard_2
T $EA7F Wizard 2: #WIZARDNAME2
B $EA8C,10,d10 #WIZARDSTATS$EA8C
M $EA96,12 #HTML(#ANIMSPELL$EA96|wizard2coloured| )
W $EA96,2
B $EA98,1
L $EA96,3,4

@ $EAA2 label=wizard_3
T $EAA2 Wizard 3: #WIZARDNAME3
B $EAAF,10,d10 #WIZARDSTATS$EAAF
M $EAB9,12 #HTML(#ANIMSPELL$EAB9|wizard3coloured| )
W $EAB9,2
B $EABB,1
L $EAB9,3,4

@ $EAC5 label=wizard_4
T $EAC5 Wizard 4: #WIZARDNAME4
B $EAD2,10,d10 #WIZARDSTATS$EAD2
M $EADC,12 #HTML(#ANIMSPELL$EADC|wizard4coloured| )
W $EADC,2
B $EADE,1
L $EADC,3,4

@ $EAE8 label=wizard_5
T $EAE8 Wizard 5: #WIZARDNAME5
B $EAF5,10,d10 #WIZARDSTATS$EAF5
M $EAFF,12 #HTML(#ANIMSPELL$EAFF|wizard5coloured| )
W $EAFF,2
B $EB01,1
L $EAFF,3,4

@ $EB0B label=wizard_6
T $EB0B Wizard 6: #WIZARDNAME6
B $EB18,10,d10 #WIZARDSTATS$EB18
M $EB22,12 #HTML(#ANIMSPELL$EB22|wizard6coloured| )
W $EB22,2
B $EB24,1
L $EB22,3,4

@ $EB2E label=wizard_7
T $EB2E Wizard 7: #WIZARDNAME7
B $EB3B,10,d10 #WIZARDSTATS$EB3B
M $EB45,12 #HTML(#ANIMSPELL$EB45|wizard7coloured| )
W $EB45,2
B $EB47,1
L $EB45,3,4

b $EB51 sprite data for creatures and objects
@ $EB51 label=nothingsprite
B $EB51,$20 #HTML(#UDGARRAY2,,4;$EB51-$EB70-8(nothingsprite) )nothing
@ $EB71 label=kingcobrasprite0
B $EB71,$20 #HTML(#UDGARRAY2,,4;$EB71-$EB90-8(kingcobrasprite0) )king cobra 0
@ $EB91 label=kingcobrasprite1
B $EB91,$20 #HTML(#UDGARRAY2,,4;$EB91-$EBB0-8(kingcobrasprite1) )king cobra 1
@ $EBB1 ssub=DEFW $EB51+$722
W $EBB1 unknown83
@ $EBB3 label=kingcobrasprite2
B $EBB3,$20 #HTML(#UDGARRAY2,,4;$EBB3-$EBD2-8(kingcobrasprite2) )king cobra 2
@ $EBD3 label=deadbatsprite
B $EBD3,$20 #HTML(#UDGARRAY2,,4;$EBD3-$EBF2-8(deadbatsprite) )dead bat
@ $EBF3 label=batsprite0
B $EBF3,$20 #HTML(#UDGARRAY2,,4;$EBF3-$EC12-8(batsprite0) )bat 0 
@ $EC13 label=batsprite2
B $EC13,$20 #HTML(#UDGARRAY2,,4;$EC13-$EC32-8(batsprite1) )bat 1 
@ $EC33 label=batsprite1
B $EC33,$20 #HTML(#UDGARRAY2,,4;$EC33-$EC52-8(batsprite2) )bat 2 
@ $EC53 label=deadcobrasprite
B $EC53,$20 #HTML(#UDGARRAY2,,4;$EC53-$EC72-8(deadcobrasprite) )dead cobra
@ $EC73 label=blobsprite0
B $EC73,$20 #HTML(#UDGARRAY2,,4;$EC73-$EC92-8(blobsprite0) )blob 0
@ $EC93 label=blobsprite1
B $EC93,$20 #HTML(#UDGARRAY2,,4;$EC93-$ECB2-8(blobsprite1) )blob 1
@ $ECB3 label=blobsprite2
B $ECB3,$20 #HTML(#UDGARRAY2,,4;$ECB3-$ECD2-8(blobsprite2) )blob 2
@ $ECD3 label=deadblobsprite
B $ECD3,$20 #HTML(#UDGARRAY2,,4;$ECD3-$ECF2-8(deadblobsprite) )dead blob
@ $ECF3 label=wolfsprite0
B $ECF3,$20 #HTML(#UDGARRAY2,,4;$ECF3-$ED12-8(wolfsprite0) )wolf 0
@ $ED13 label=wolfsprite1
B $ED13,$20 #HTML(#UDGARRAY2,,4;$ED13-$ED32-8(wolfsprite1) )wolf 1
@ $ED33 label=wolfsprite2
B $ED33,$20 #HTML(#UDGARRAY2,,4;$ED33-$ED52-8(wolfsprite2) )wolf 2
@ $ED53 label=deadwolfsprite
B $ED53,$20 #HTML(#UDGARRAY2,,4;$ED53-$ED72-8(deadwolfsprite) )dead wolf
@ $ED73 label=spectrsprite
B $ED73,$20 #HTML(#UDGARRAY2,,4;$ED73-$ED92-8(spectresprite) )spectre
@ $ED93 label=deadspectresprite
B $ED93,$20 #HTML(#UDGARRAY2,,4;$ED93-$EDB2-8(deadspectresprite) )dead spectre
@ $EDB3 label=goblinsprite0
B $EDB3,$20 #HTML(#UDGARRAY2,,4;$EDB3-$EDD2-8(goblinsprite0) )goblin 0
@ $EDD3 label=goblinsprite1
B $EDD3,$20 #HTML(#UDGARRAY2,,4;$EDD3-$EDF2-8(goblinsprite1) )goblin 1
@ $EDF3 label=goblinsprite2
B $EDF3,$20 #HTML(#UDGARRAY2,,4;$EDF3-$EE12-8(goblinsprite2) )goblin 2
@ $EE13 label=deadgoblinsprite
B $EE13,$20 #HTML(#UDGARRAY2,,4;$EE13-$EE32-8(deadgoblinsprite) )dead goblin
@ $EE33 label=crocodilesprite0
B $EE33,$20 #HTML(#UDGARRAY2,,4;$EE33-$EE52-8(crocodilesprite0) )crocodile 0
@ $EE53 label=crocodilesprite1
B $EE53,$20 #HTML(#UDGARRAY2,,4;$EE53-$EE72-8(crocodilesprite1) )crocodile 1
@ $EE73 label=crocodilesprite2
B $EE73,$20 #HTML(#UDGARRAY2,,4;$EE73-$EE92-8(crocodilesprite2) )crocodile 2
@ $EE93 label=deadcrocodilesprite
B $EE93,$20 #HTML(#UDGARRAY2,,4;$EE93-$EEB2-8(deadcrocodilesprite) )dead crocodile
@ $EEB3 label=greendragonsprite0
B $EEB3,$20 #HTML(#UDGARRAY2,,4;$EEB3-$EED2-8(greendragonsprite0) )green dragon 0
@ $EED3 label=greendragonsprite1
B $EED3,$20 #HTML(#UDGARRAY2,,4;$EED3-$EEF2-8(greendragonsprite1) )green dragon 1
@ $EEF3 label=greendragonsprite2
B $EEF3,$20 #HTML(#UDGARRAY2,,4;$EEF3-$EF12-8(greendragonsprite2) )green dragon 2
@ $EF13 label=deaddragonsprite
B $EF13,$20 #HTML(#UDGARRAY2,,4;$EF13-$EF32-8(deaddragonsprite) )dead dragon
@ $EF33 label=vampiresprite0
B $EF33,$20 #HTML(#UDGARRAY2,,4;$EF33-$EF52-8(vampiresprite0) )vampire 0
@ $EF53 label=vampiresprite1
B $EF53,$20 #HTML(#UDGARRAY2,,4;$EF53-$EF72-8(vampiresprite1) )vampire 1
@ $EF73 label=vampiresprite2
B $EF73,$20 #HTML(#UDGARRAY2,,4;$EF73-$EF92-8(vampiresprite2) )vampire 2
@ $EF93 label=deadvampiresprite
B $EF93,$20 #HTML(#UDGARRAY2,,4;$EF93-$EFB2-8(deadvampiresprite) )dead vampire
@ $EFB3 label=faunsprite0
B $EFB3,$20 #HTML(#UDGARRAY2,,4;$EFB3-$EFD2-8(faunsprite0) )faun 0
@ $EFD3 label=faunsprite1
B $EFD3,$20 #HTML(#UDGARRAY2,,4;$EFD3-$EFF2-8(faunsprite1) )faun 1
@ $EFF3 label=faunsprite2
B $EFF3,$20 #HTML(#UDGARRAY2,,4;$EFF3-$F012-8(faunsprite2) )faun 2
@ $F013 label=deadfaunsprite
B $F013,$20 #HTML(#UDGARRAY2,,4;$F013-$F032-8(deadfaunsprite) )dead faun
@ $F033 label=lionsprite0
B $F033,$20 #HTML(#UDGARRAY2,,4;$F033-$F052-8(lionsprite0) )lion 0
@ $F053 label=lionsprite1
B $F053,$20 #HTML(#UDGARRAY2,,4;$F053-$F072-8(lionsprite1) )lion 1
@ $F073 label=lionsprite2
B $F073,$20 #HTML(#UDGARRAY2,,4;$F073-$F092-8(lionsprite2) )lion 2
@ $F093 label=deadlionsprite
B $F093,$20 #HTML(#UDGARRAY2,,4;$F093-$F0B2-8(deadlionsprite) )dead lion
@ $F0B3 label=gryphonsprite0
B $F0B3,$20 #HTML(#UDGARRAY2,,4;$F0B3-$F0D2-8(gryphonsprite0) )gryphon 0
@ $F0D3 label=gryphonsprite1
B $F0D3,$20 #HTML(#UDGARRAY2,,4;$F0D3-$F0F2-8(gryphonsprite1) )gryphon 1
@ $F0F3 label=gryphonsprite2
B $F0F3,$20 #HTML(#UDGARRAY2,,4;$F0F3-$F112-8(gryphonsprite2) )gryphon 2
@ $F113 label=deadgryphonsprite
B $F113,$20 #HTML(#UDGARRAY2,,4;$F113-$F132-8(deadgryphonsprite) )dead gryphon
@ $F133 label=elfsprite0
B $F133,$20 #HTML(#UDGARRAY2,,4;$F133-$F152-8(elfsprite0) )elf 0
@ $F153 label=elfsprite1
B $F153,$20 #HTML(#UDGARRAY2,,4;$F153-$F172-8(elfsprite1) )elf 1
@ $F173 label=elfsprite2
B $F173,$20 #HTML(#UDGARRAY2,,4;$F173-$F192-8(elfsprite2) )elf 2
@ $F193 label=elfsprite3
B $F193,$20 #HTML(#UDGARRAY2,,4;$F193-$F1B2-8(elfsprite3) )elf 3
@ $F1B3 label=deadelfsprite
B $F1B3,$20 #HTML(#UDGARRAY2,,4;$F1B3-$F1D2-8(deadelfsprite) )dead elf
@ $F1D3 label=horsesprite0
B $F1D3,$20 #HTML(#UDGARRAY2,,4;$F1D3-$F1F2-8(horsesprite0) )horse 0
@ $F1F3 label=horsesprite1
B $F1F3,$20 #HTML(#UDGARRAY2,,4;$F1F3-$F212-8(horsesprite1) )horse 1
@ $F213 label=horsesprite2
B $F213,$20 #HTML(#UDGARRAY2,,4;$F213-$F232-8(horsesprite2) )horse 2
@ $F233 label=deadhorsesprite
B $F233,$20 #HTML(#UDGARRAY2,,4;$F233-$F252-8(deadhorsesprite) )dead horse
@ $F253 label=orcsprite0
B $F253,$20 #HTML(#UDGARRAY2,,4;$F253-$F272-8(orcsprite0) )orc 0
@ $F273 label=orcsprite1
B $F273,$20 #HTML(#UDGARRAY2,,4;$F273-$F292-8(orcsprite1) )orc 1
@ $F293 label=orcsprite2
B $F293,$20 #HTML(#UDGARRAY2,,4;$F293-$F2B2-8(orcsprite2) )orc 2
@ $F2B3 label=deadorcsprite
B $F2B3,$20 #HTML(#UDGARRAY2,,4;$F2B3-$F2D2-8(deadorcsprite) )dead orc
@ $F2D3 label=reddragonsprite0
B $F2D3,$20 #HTML(#UDGARRAY2,,4;$F2D3-$F2F2-8(reddragonsprite0) )red dragon 0
@ $F2F3 label=reddragonsprite1
B $F2F3,$20 #HTML(#UDGARRAY2,,4;$F2F3-$F312-8(reddragonsprite1) )red dragon 1
@ $F313 label=reddragonsprite2
B $F313,$20 #HTML(#UDGARRAY2,,4;$F313-$F332-8(reddragonsprite0) )red dragon 2
@ $F333 label=firesprite0
B $F333,$20 #HTML(#UDGARRAY2,,4;$F333-$F352-8(firesprite0) )fire 0
@ $F353 label=firesprite1
B $F353,$20 #HTML(#UDGARRAY2,,4;$F353-$F372-8(firesprite1) )fire 1
@ $F373 label=firesprite2
B $F373,$20 #HTML(#UDGARRAY2,,4;$F373-$F392-8(firesprite2) )fire 2
@ $F393 label=firesprite3
B $F393,$20 #HTML(#UDGARRAY2,,4;$F393-$F3B2-8(firesprite3) )fire 3
@ $F3B3 label=manticoresprite0
B $F3B3,$20 #HTML(#UDGARRAY2,,4;$F3B3-$F3D2-8(manticoresprite0) )manticore 0
@ $F3D3 label=manticoresprite1
B $F3D3,$20 #HTML(#UDGARRAY2,,4;$F3D3-$F3F2-8(manticoresprite1) )manticore 1
@ $F3F3 label=manticoresprite2
B $F3F3,$20 #HTML(#UDGARRAY2,,4;$F3F3-$F412-8(manticoresprite2) )manticore 2
@ $F413 label=deadmanticoresprite
B $F413,$20 #HTML(#UDGARRAY2,,4;$F413-$F432-8(deadmanticoresprite) )dead manticore
@ $F433 label=trollsprite0
B $F433,$20 #HTML(#UDGARRAY2,,4;$F433-$F452-8(trollsprite0) )troll 0
@ $F453 label=trollsprite1
B $F453,$20 #HTML(#UDGARRAY2,,4;$F453-$F472-8(trollsprite1) )troll 1
@ $F473 label=trollsprite2
B $F473,$20 #HTML(#UDGARRAY2,,4;$F473-$F492-8(trollsprite2) )troll 2
@ $F493 label=deadtrollsprite
B $F493,$20 #HTML(#UDGARRAY2,,4;$F493-$F4B2-8(deadtrollsprite) )dead troll
@ $F4B3 label=unicornsprite0
B $F4B3,$20 #HTML(#UDGARRAY2,,4;$F4B3-$F4D2-8(unicornsprite0) )unicorn 0
@ $F4D3 label=unicornsprite1
B $F4D3,$20 #HTML(#UDGARRAY2,,4;$F4D3-$F4F2-8(unicornsprite1) )unicorn 1
@ $F4F3 label=unicornsprite2
B $F4F3,$20 #HTML(#UDGARRAY2,,4;$F4F3-$F512-8(unicornsprite2) )unicorn 2
@ $F513 label=deadunicornsprite
B $F513,$20 #HTML(#UDGARRAY2,,4;$F513-$F532-8(deadunicornsprite) )dead unicorn
@ $F533 label=ghostsprite0
B $F533,$20 #HTML(#UDGARRAY2,,4;$F533-$F552-8(ghostsprite0) )ghost 0
@ $F553 label=ghostsprite1
B $F553,$20 #HTML(#UDGARRAY2,,4;$F553-$F572-8(ghostsprite1) )ghost 1
@ $F573 label=ghostsprite2
B $F573,$20 #HTML(#UDGARRAY2,,4;$F573-$F592-8(ghostsprite2) )ghost 2
@ $F593 label=ghostsprite3
B $F593,$20 #HTML(#UDGARRAY2,,4;$F593-$F5B2-8(ghostsprite3) )ghost 3
@ $F5B3 label=wraithsprite0
B $F5B3,$20 #HTML(#UDGARRAY2,,4;$F5B3-$F5D2-8(wraithsprite0) )wraith 0
@ $F5D3 label=wraithsprite1
B $F5D3,$20 #HTML(#UDGARRAY2,,4;$F5D3-$F5F2-8(wraithsprite1) )wraith 1
@ $F5F3 label=wraithsprite2
B $F5F3,$20 #HTML(#UDGARRAY2,,4;$F5F3-$F612-8(wraithsprite2) )wraith 2
@ $F613 label=wraithsprite3
B $F613,$20 #HTML(#UDGARRAY2,,4;$F613-$F632-8(wraithsprite3) )wraith 3
@ $F633 label=bearsprite0
B $F633,$20 #HTML(#UDGARRAY2,,4;$F633-$F652-8(bearsprite0) )bear 0
@ $F653 label=bearsprite1
B $F653,$20 #HTML(#UDGARRAY2,,4;$F653-$F672-8(bearsprite1) )bear 1
B $F673 unusued
@ $F674 label=bearsprite2
B $F674,$20 #HTML(#UDGARRAY2,,4;$F674-$F693-8(bearsprite2) )bear 2
@ $F694 label=deadbearsprite
B $F694,$20 #HTML(#UDGARRAY2,,4;$F694-$F6B3-8(deadbearsprite) )dead bear
@ $F6B4 label=gorillasprite0
B $F6B4,$20 #HTML(#UDGARRAY2,,4;$F6B4-$F6D3-8(gorillasprite0) )gorilla 0
@ $F6D4 label=gorillasprite1
B $F6D4,$20 #HTML(#UDGARRAY2,,4;$F6D4-$F6F3-8(gorillasprite1) )gorilla 1
@ $F6F4 label=gorillasprite2
B $F6F4,$20 #HTML(#UDGARRAY2,,4;$F6F4-$F713-8(gorillasprite2) )gorilla 2
@ $F714 label=deadgorillasprite
B $F714,$20 #HTML(#UDGARRAY2,,4;$F714-$F733-8(deadgorillasprite) )dead gorilla
@ $F734 label=skeletonsprite0
B $F734,$20 #HTML(#UDGARRAY2,,4;$F734-$F753-8(skeletonsprite0) )skeleton 0
@ $F754 label=skeletonsprite1
B $F754,$20 #HTML(#UDGARRAY2,,4;$F754-$F773-8(skeletonsprite1) )skeleton 1
@ $F774 label=skeletonsprite2
B $F774,$20 #HTML(#UDGARRAY2,,4;$F774-$F793-8(skeletonsprite2) )skeleton 2
@ $F794 label=ogresprite0
B $F794,$20 #HTML(#UDGARRAY2,,4;$F794-$F7B3-8(ogresprite0) )ogre 0
@ $F7B4 label=ogresprite1
B $F7B4,$20 #HTML(#UDGARRAY2,,4;$F7B4-$F7D3-8(ogresprite1) )ogre 1
@ $F7D4 label=ogresprite2
B $F7D4,$20 #HTML(#UDGARRAY2,,4;$F7D4-$F7F3-8(ogresprite2) )ogre 2
@ $F7F4 label=deadogresprite
B $F7F4,$20 #HTML(#UDGARRAY2,,4;$F7F4-$F813-8(deadogresprite) )dead ogre
@ $F814 label=zombiesprite0
B $F814,$20 #HTML(#UDGARRAY2,,4;$F814-$F833-8(zombiesprite0) )zombie 0
@ $F834 label=zombiesprite1
B $F834,$20 #HTML(#UDGARRAY2,,4;$F834-$F853-8(zombiesprite1) )zombie 1
@ $F854 label=zombiesprite2
B $F854,$20 #HTML(#UDGARRAY2,,4;$F854-$F873-8(zombiesprite2) )zombie 2
@ $F874 label=zombiesprite3
B $F874,$20 #HTML(#UDGARRAY2,,4;$F874-$F893-8(zombiesprite3) )zombie 3
@ $F894 label=harpysprite0
B $F894,$20 #HTML(#UDGARRAY2,,4;$F894-$F8B3-8(harpysprite0) )harpy 0
@ $F8B4 label=harpysprite1
B $F8B4,$20 #HTML(#UDGARRAY2,,4;$F8B4-$F8D3-8(harpysprite1) )harpy 1
@ $F8D4 label=harpysprite2
B $F8D4,$20 #HTML(#UDGARRAY2,,4;$F8D4-$F8F3-8(harpysprite2) )harpy 2
@ $F8F4 label=deadharpysprite
B $F8F4,$20 #HTML(#UDGARRAY2,,4;$F8F4-$F913-8(deadharpysprite) )dead harpy
@ $F914 label=pegasussprite0
B $F914,$20 #HTML(#UDGARRAY2,,4;$F914-$F933-8(pegasussprite0) )pegasus 0
@ $F934 label=pegasussprite1
B $F934,$20 #HTML(#UDGARRAY2,,4;$F934-$F953-8(pegasussprite1) )pegasus 1
@ $F954 label=pegasussprite2
B $F954,$20 #HTML(#UDGARRAY2,,4;$F954-$F973-8(pegasussprite2) )pegasus 2
@ $F974 label=deadpegasussprite
B $F974,$20 #HTML(#UDGARRAY2,,4;$F974-$F993-8(deadpegasussprite) )dead pegasus
@ $F994 label=eaglesprite0
B $F994,$20 #HTML(#UDGARRAY2,,4;$F994-$F9B3-8(eaglesprite0) )eagle 0
@ $F9B4 label=eaglesprite1
B $F9B4,$20 #HTML(#UDGARRAY2,,4;$F9B4-$F9D3-8(eaglesprite1) )eagle 1
@ $F9D4 label=eaglesprite2
B $F9D4,$20 #HTML(#UDGARRAY2,,4;$F9D4-$F9F3-8(eaglesprite2) )eagle 2
@ $F9F4 label=deadeaglesprite
B $F9F4,$20 #HTML(#UDGARRAY2,,4;$F9F4-$FA13-8(deadeaglesprite) )dead eagle
@ $FA14 label=hydrasprite0
B $FA14,$20 #HTML(#UDGARRAY2,,4;$FA14-$FA33-8(hydrasprite0) )hydra 0
@ $FA34 label=hydrasprite1
B $FA34,$20 #HTML(#UDGARRAY2,,4;$FA34-$FA53-8(hydrasprite1) )hydra 1
@ $FA54 label=hydrasprite2
B $FA54,$20 #HTML(#UDGARRAY2,,4;$FA54-$FA73-8(hydrasprite2) )hydra 2
@ $FA74 label=deadhydrasprite
B $FA74,$20 #HTML(#UDGARRAY2,,4;$FA74-$FA93-8(deadhydrasprite) )dead hydra
@ $FA94 label=giantratsprite0
B $FA94,$20 #HTML(#UDGARRAY2,,4;$FA94-$FAB3-8(giantratsprite0) )giant rat 0
@ $FAB4 label=giantratsprite1
B $FAB4,$20 #HTML(#UDGARRAY2,,4;$FAB4-$FAD3-8(giantratsprite1) )giant rat 1
@ $FAD4 label=giantratsprite2
B $FAD4,$20 #HTML(#UDGARRAY2,,4;$FAD4-$FAF3-8(giantratsprite2) )giant rat 2
@ $FAF4 label=deadgiantratsprite
B $FAF4,$20 #HTML(#UDGARRAY2,,4;$FAF4-$FB13-8(deadgiantratsprite) )dead giant rat
@ $FB14 label=centaursprite0
B $FB14,$20 #HTML(#UDGARRAY2,,4;$FB14-$FB33-8(centaursprite0) )centaur 0
@ $FB34 label=centaursprite1
B $FB34,$20 #HTML(#UDGARRAY2,,4;$FB34-$FB53-8(centaursprite1) )centaur 1
@ $FB54 label=centaursprite2
B $FB54,$20 #HTML(#UDGARRAY2,,4;$FB54-$FB73-8(centaursprite2) )centaur 2
@ $FB74 label=deadcentaursprite
B $FB74,$20 #HTML(#UDGARRAY2,,4;$FB74-$FB93-8(deadcentaursprite) )dead centaur
@ $FB94 label=giantsprite0
B $FB94,$20 #HTML(#UDGARRAY2,,4;$FB94-$FBB3-8(giantsprite0) )giant 0
@ $FBB4 label=giantsprite1
B $FBB4,$20 #HTML(#UDGARRAY2,,4;$FBB4-$FBD3-8(giantsprite1) )giant 1
@ $FBD4 label=giantsprite2
B $FBD4,$20 #HTML(#UDGARRAY2,,4;$FBD4-$FBF3-8(giantsprite2) )giant 2
@ $FBF4 label=deadgiantsprite
B $FBF4,$20 #HTML(#UDGARRAY2,,4;$FBF4-$FC13-8(deadgiantsprite) )dead giant
@ $FC14 label=goldendragonsprite0
B $FC14,$20 #HTML(#UDGARRAY2,,4;$FC14-$FC33-8(goldendragonsprite0) )golden dragon 0
@ $FC34 label=goldendragonsprite1
B $FC34,$20 #HTML(#UDGARRAY2,,4;$FC34-$FC53-8(goldendragonsprite1) )golden dragon 1
@ $FC54 label=goldendragonsprite2
B $FC54,$20 #HTML(#UDGARRAY2,,4;$FC54-$FC73-8(goldendragonsprite2) )golden dragon 2
@ $FC74 label=deadgoldendragonsprite
B $FC74,$20 #HTML(#UDGARRAY2,,4;$FC74-$FC93-8(deadgoldendragonsprite) )dead golden dragon
@ $FC94 label=darkcitadelsprite
B $FC94,$20 #HTML(#UDGARRAY2,,4;$FC94-$FCB3-8(darkcitadelsprite) )dark citadel
@ $FCB4 label=magiccastlesprite
B $FCB4,$20 #HTML(#UDGARRAY2,,4;$FCB4-$FCD3-8(magiccastlesprite) )magic castle
@ $FCD4 label=shadowwoodsprite
B $FCD4,$20 #HTML(#UDGARRAY2,,4;$FCD4-$FCF3-8(shadowwoodsprite) )shadow wood
@ $FCF4 label=magicwoodsprite
B $FCF4,$20 #HTML(#UDGARRAY2,,4;$FCF4-$FD13-8(magicwoodsprite) )magic wood
@ $FD14 label=wallsprite
B $FD14,$20 #HTML(#UDGARRAY2,,4;$FD14-$FD33-8(wallsprite) )wall

b $FD34 sprite data for wizard characters
@ $FD34 label=character_1_sprite
B $FD34,$20 #HTML(#UDGARRAY2,,4;$FD34-$FD53-8(character1sprite) )character 1
@ $FD54 label=character_2_sprite
B $FD54,$20 #HTML(#UDGARRAY2,,4;$FD54-$FD73-8(character2sprite) )character 2
@ $FD74 label=character_3_sprite
B $FD74,$20 #HTML(#UDGARRAY2,,4;$FD74-$FD93-8(character3sprite) )character 3
@ $FD94 label=character_4_sprite
B $FD94,$20 #HTML(#UDGARRAY2,,4;$FD94-$FDB3-8(character4sprite) )character 4
@ $FDB4 label=character_5_sprite
B $FDB4,$20 #HTML(#UDGARRAY2,,4;$FDB4-$FDD3-8(character5sprite) )character 5
@ $FDD4 label=character_6_sprite
B $FDD4,$20 #HTML(#UDGARRAY2,,4;$FDD4-$FDF3-8(character6sprite) )character 6
@ $FDF4 label=character_7_sprite
B $FDF4,$20 #HTML(#UDGARRAY2,,4;$FDF4-$FE13-8(character7sprite) )character 7
@ $FE14 label=character_8_sprite
B $FE14,$20 #HTML(#UDGARRAY2,,4;$FE14-$FE33-8(character8sprite) )character 8

u $FE34

c $FE56 switch to interrupt mode 2
@ $FE56 label=set_IM2_mode
C $FE56 set I to $09 for the high byte of the interrupt vector. The lower byte is assumed to always be $FF so that the value $FE69 will be read from adress $09FF in ROM
C $FE5A set interrupt mode 2
C $FE5C return

u $FE5D

c $FE60 switch to interrupt mode 1
@ $FE60 label=set_IM1_mode
C $FE60 load I with $3E ???
C $FE64 set interrupt mode 1
C $FE66 return

u $FE67

c $FE69 interrupt service routine
@ $FE69 label=ISR
C $FE69 disable interrupts
C $FE6A call #R$DF0C which executes a jump to #R$DF72
C $FE6D enable interrupts
C $FE6E jump to $0038 in ROM (the IM1 interrupt service routine)

u $FE71

@ $FFFF label=unknown67
g $FFFF unknown67
