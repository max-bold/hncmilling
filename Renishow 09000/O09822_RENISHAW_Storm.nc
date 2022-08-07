%
O09822 (ANG WEB POCKET RENISHAW V3.14 FOR NGC)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
G65 P9724
G65 P9725 A2.
#3= #5043 - #166
#5= #5041
#6= #5042
IF [ #1 NE #0 ] GOTO1
#3000= 91 (A INPUT MISSING)
N1
IF [ #7 NE #0 ] GOTO2
#3000= 91 (D INPUT MISSING)
N2
#14= 185
WHILE [ #14 LE 199 ] DO1
#[ #14 ]= #0
#14= #14 + 1
END1
G31 X [ #5 - #[ #161 + 2 ] ] Y [ #6 - # [ #161 + 3 ] ] F#169
IF [ ABS[ #5041 - [ #5 - #[ #161 + 2 ] ] ] GE #173 ] GOTO22
IF [ ABS[ #5042 - [ #6 - #[ #161 + 3 ] ] ] GE #173 ] GOTO22
IF [ #1 LT 90 ] GOTO7
#28= #1 - 90
#31= #28 - 180
#29= 180
GOTO8
N7
#28= #1 + 90
#31= #28 + 180
#29= -180
N8
IF [ #18 LT 0 ] GOTO83
IF [ #26 EQ #0 ] GOTO83
(WEB CASE)
#28= #28 + #29
#31= #31 + #29
N83
G65 P9731 A [ #28 ] (#[#161+9] LOAD)
#32= #[ #161 + 9 ]
G65 P9731 A [ #31 ] (#[#161+9] LOAD)
#27= #[ #161 + 9 ]
#30= -1
IF [ #26 EQ #0 ] GOTO9
IF [ #18 NE #0 ] GOTO85
#18= 5 * #179
N85
IF [ #18 LT 0 ] GOTO9
#30= 1
N9
G65 P9727 A [ #28 ] Q#17 D#7 Z#26 R#18 S #[ #161 + 9 ]
IF [ #199 NE 0 ] GOTO21
#32= #32 * [ - #30 ]
#190= #174 + #[ #161 + 2 ] + [ #32 * COS[ #28 ] ] (X COR SKIPS)
#190= [ ROUND[ #190 * 10000 ] ] / 10000
#191= #175 + #[ #161 + 3 ] + [ #32 * SIN[ #28 ] ] (Y COR SKIPS)
#191= [ ROUND[ #191 * 10000 ] ] / 10000
G65 P9727 A [ #31 ] Q#17 D#7 Z#26 R#18 S #[ #161 + 9 ]
IF [ #199 NE 0 ] GOTO21
#27= #27 * [ - #30 ]
#174= #174 + #[ #161 + 2 ] + [ #27 * COS[ #31 ] ] (X COR SKIPS)
#174= [ ROUND[ #174 * 10000 ] ] / 10000
#175= #175 + #[ #161 + 3 ] + [ #27 * SIN[ #31 ] ] (Y COR SKIPS)
#175= [ ROUND[ #175 * 10000 ] ] / 10000
#12= #190 - #174
#16= #191 - #175
#185= [ #190 + #174 ] / 2 (X POS)
#186= [ #191 + #175 ] / 2 (Y POS)
#188= [ SQRT[ [ #12 * #12 ] + [ #16 * #16 ] ] ]
IF [ #8 EQ #0 ] GOTO95
#188= #188 + #[ 2000 + #8 ] (ACT SIZE)
N95
#190= #185 - #5 (X ERROR)
#191= #186 - #6 (Y ERROR)
#193= #188 - #7 (SIZE ERROR)
#195= SQRT[ [ #190 * #190 ] + [ #191 * #191 ] ] (TP ERROR)
#196= #193 * #30 / 2 (METAL COND)
IF [ #23 EQ #0 ] GOTO10 (PRINT)
G65 P9730 D#7 H#11 M#13 S#19 T#20 W#23 X#5 Y#6 E2.
N10
IF [ #21 EQ #0 ] GOTO11 (U UPPER TOL)
IF [ ABS[ #193 ] GE #21 ] GOTO23
IF [ #195 GE #21 ] GOTO23
N11
IF [ #11 EQ #0 ] GOTO13
IF [ ABS[ #193 ] LT #11 ] GOTO12
#198= 1
N12
IF [ #170 AND 4 EQ 4 ] GOTO13
IF [ ABS[ #193 ] LT #11 ] GOTO13
#[ 3006 - [ [ #170 AND 8 ] / 8 * 6 ] ]= 1 (OUT OF TOL)
N13
IF [ #13 EQ #0 ] GOTO15
IF [ ABS[ #195 ] LT #13 / 2 ] GOTO14
#198= 2
N14
IF [ #170 AND 4 EQ 4 ] GOTO15
IF [ ABS[ #195 ] LT #13 / 2 ] GOTO15
#[ 3006 - [ [ #170 AND 8 ] / 8 * 6 ] ]= 1 (OUT OF POSITION)
N15
IF [ #20 EQ #0 ] GOTO19
IF [ ABS[ #196 ] LT #22 ] GOTO19 (NULL BAND)
IF [ #9 NE #0 ] GOTO16
#9= 1
N16
G65 P9732 T#20 C [ #196 * #9 ]
IF [ #26 NE #0 ] GOTO19
IF [ #168 LT #7 / 2 ] GOTO18
#198= 5
N18
IF [ #170 AND 4 EQ 4 ] GOTO19
IF [ #168 LT #7 / 2 ] GOTO19
#[ 3006 - [ [ #170 AND 8 ] / 8 * 6 ] ]= 1 (DIA OFFSET TOO LARGE)
N19
IF [ #19 EQ #0 ] GOTO24 (S W OFFSET)
G65 P9732 S#19 W1.
GOTO24
N21
G01 X#5 Y#6 F#169
IF [ #199 NE 2 ] GOTO22
#3000= 93 (SURFACE NOT FOUND)
N22
#3000= 92 (UNEXPECTED SURFACE FOUND)
N23
G01 X#5 Y#6 F#169
#198= 3
IF [ #170 AND 4 EQ 4 ] GOTO24
#[ 3006 - [ [ #170 AND 8 ] / 8 * 6 ] ]= 1 (UPPER TOL EXCEEDED)
N24
G01 X#5 Y#6 F#169
N999
G103
(G04 P1.0)
M99



%