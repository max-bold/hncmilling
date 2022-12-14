%
O09821 (ANG XY SINGLE SURFACE RENISHAW V3.14 FOR NGC)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
G65 P9724
G65 P9725 A2.
#198= 0
#199= 0
#3= #5043 - #166
#5= #5041
#6= #5042
IF [ #1 NE #0 ] GOTO1
#3000= 91 (A INPUT MISSING)
N1
IF [ #7 NE #0 ] GOTO2
#3000= 91 (D INPUT MISSING)
N2
IF [ #19 EQ #0 ] GOTO3
IF [ #11 EQ #0 ] GOTO3
#3000= 91 (SH INPUT MIXED)
N3
IF [ #20 EQ #0 ] GOTO4
IF [ #13 EQ #0 ] GOTO4
#3000= 91 (TM INPUT MIXED)
N4
IF [ #19 EQ #0 ] GOTO45
IF [ #20 EQ #0 ] GOTO45
#3000= 91 (ST INPUT MIXED)
N45
#14= 185
WHILE [ #14 LE 199 ] DO1
#[ #14 ]= #0
#14= #14 + 1
END1
G31 X [ #5 - #[ #161 + 2 ] ] Y [ #6 - # [ #161 + 3 ] ] F#169
IF [ ABS[ #5041 - [ #5 - #[ #161 + 2 ] ] ] GE #173 ] GOTO22
IF [ ABS[ #5042 - [ #6 - #[ #161 + 3 ] ] ] GE #173 ] GOTO22
#198= 0
N8
#28= #1
G65 P9731 A#28 (#[#161+9] LOAD)
#30= -1
G65 P9726 A#28 Q#17 D [ #7 * 2 ] S #[ #161 + 9 ]
IF [ #199 NE 0 ] GOTO21
#185= #174 + [ #[ #161 + 9 ] * COS[ #28 ] ] + #[ #161 + 2 ] (COR X SKIP POS)
#185= [ ROUND[ #185 * 10000 ] ] / 10000
#186= #175 + [ #[ #161 + 9 ] * SIN[ #28 ] ] + #[ #161 + 3 ] (COR Y SKIP POS)
#186= [ ROUND[ #186 * 10000 ] ] / 10000
#188= SQRT[ [ #185 - #5 ] * [ #185 - #5 ] + [ #186 - #6 ] * [ #186 - #6 ] ] (SIZE)
IF [ #8 EQ #0 ] GOTO9
#188= #188 + #[ 2000 + #8 ] (SIZE COR)
N9
#190= #185 - #5 - [ #7 * COS[ #28 ] ] (X ERROR)
#191= #186 - #6 - [ #7 * SIN[ #28 ] ] (Y ERROR)
#193= #188 - #7 (SIZE ERROR)
#195= SQRT[ [ #190 * #190 ] + [ #191 * #191 ] ] (TP ERROR)
#196= #193 * #30 (METAL CON)
#197= #30
IF [ #23 EQ #0 ] GOTO10 (PRINT)
G65 P9730 D#7 H#11 M#13 S#19 T#20 W#23 X#5 Y#6
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
G01 X#5 Y#6 F#169
#[ 3006 - [ [ #170 AND 8 ] / 8 * 6 ] ]= 1 (OUT OF TOL)
N13
IF [ #13 EQ #0 ] GOTO15
IF [ ABS[ #195 ] LT #13 / 2 ] GOTO14
#198= 2
N14
IF [ #170 AND 4 EQ 4 ] GOTO15
IF [ ABS[ #195 ] LT #13 / 2 ] GOTO15
G01 X#5 Y#6 F#169
#[ 3006 - [ [ #170 AND 8 ] / 8 * 6 ] ]= 1 (OUT OF POSITION)
N15
IF [ #20 EQ #0 ] GOTO19
IF [ ABS[ #196 ] LT #22 ] GOTO19 (NULL BAND)
IF [ #9 NE #0 ] GOTO16
#9= 1
N16
G65 P9732 T#20 C [ #196 * #9 ]
N19
IF [ #19 EQ #0 ] GOTO24
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