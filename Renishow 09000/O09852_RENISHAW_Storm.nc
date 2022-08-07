%
O09852 (DIAMETER SET RENISHAW V3.14 FOR NGC)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
G04 P160 (M98 P9854)
#2= #4
M05
#174= 0
IF [ #19 EQ #0 ] GOTO34
M98 P9799
IF [ #6 NE #0 ] GOTO1
G65 P9725 A3.
IF [ #7 EQ #0 ] GOTO34
GOTO2
N1
#166= #6
N2
#5= 3
IF [ #19 LT 0 ] GOTO3
#5= 4
N3
#7= ABS[ #7 ]
#19= ABS[ #19 ]
IF [ #18 NE #0 ] GOTO4
#18= 4 * #29
N4
IF [ #13 EQ #0 ] GOTO5
#[ 2000 + #13 ]= 0
N5
#15= [ ROUND[ 1910 / [ #19 / #29 ] ] ] * 10
IF [ #15 LT 800 ] GOTO6
#15= 800
N6
IF [ #15 GT 150 ] GOTO7
#15= 150
N7
#31= 800
N8
#9= #15 / 6 * #29
#27= 4 * #29
N9
#10= 5000 * #29
#12= 1000 * #29
IF [ #26 NE #0 ] GOTO10
#26= -15 * #29
N10
IF [ #6 NE #0 ] GOTO12
IF [ #15 NE #0 ] GOTO11
#15= 800
N11 S#15 M#5
G04 P1.
N12
#21= #5041
#22= #5042
#3004= 0
IF [ #6 NE #0 ] GOTO15
G31 X [ #167 - [ #5021 - #5041 ] ] Y [ #168 - [ #5022 - #5042 ] ] F#10
G04 P160 (M98 P9854)
#30= 121
IF [ #167 - [ #5021 - #5041 ] EQ #0 ] GOTO13
IF [ ABS[ #5041 - [ #167 - [ #5021 - #5041 ] ] ] GE 0.05 * #29 ] GOTO14
N13
IF [ #168 - [ #5022 - #5042 ] EQ #0 ] GOTO15
IF [ ABS[ #5042 - [ #168 - [ #5022 - #5042 ] ] ] GE 0.05 * #29 ] GOTO14
GOTO15
N14 M05
G01 X#21 Y#22
#3000= 92 (UNEXPECTED SURFACE FOUND)
N15
IF [ #176 EQ 2 ] GOTO18
IF [ #176 EQ - 2 ] GOTO18
#21= #5041
#22= #5042
#23= #5043 - #199
#1= -0.5 * #29
#14= 0
#16= #23 + #26
#24= #21 - [ [ #166 + #19 ] / 2 ] + #18
#28= #21 - [ [ #166 + #19 ] / 2 ] - #18
N16
G31 X#28 F#10
G04 P160 (M98 P9854)
#30= 121
IF [ ABS[ #5061 - #28 ] GT 0.05 * #29 ] GOTO35
G31 Z#16 F#12
G04 P160 (M98 P9854)
#30= 121
IF [ ABS[ [ #5063 - #199 ] - #16 ] GT 0.05 * #29 ] GOTO33
#3004= 2
G31 X#24 F#9
G04 P160 (M98 P9854)
#25= #5061 + #1
G01 X#25 F#10
#30= 122
IF [ ABS[ #5061 - #24 ] LE 0.05 * #29 ] GOTO33
#30= 121
IF [ ABS[ #5061 - #28 ] LE 0.05 * #29 ] GOTO33
IF [ #6 NE #0 ] GOTO17
S#31
N17 G04 P1.
G31 X#24 F [ #27 ]
G04 P160 (M98 P9854)
G01 X#28 F [ 3000 * #29 ]
#3004= 0
S#15
#30= 122
IF [ ABS[ #5061 - #24 ] LE 0.05 * #29 ] GOTO33
#30= 121
IF [ ABS[ #5061 - #25 ] LE 0.05 * #29 ] GOTO33
#30= 0
#[ #14 + 4 ]= #5061
Z#23
X#21
#1= - #1
#14= #14 + 1
#24= #21 + [ [ #166 + #19 ] / 2 ] - #18
#28= #21 + [ [ #166 + #19 ] / 2 ] + #18
IF [ #14 NE 2 ] GOTO16
IF [ #6 NE #0 ] GOTO32
GOTO21
N18
#21= #5042
#22= #5041
#23= #5043 - #199
#1= -0.5 * #29
#14= 0
#16= #23 + #26
#24= #21 - [ [ #166 + #19 ] / 2 ] + #18
#28= #21 - [ [ #166 + #19 ] / 2 ] - #18
N19
G31 Y#28 F#10
G04 P160 (M98 P9854)
#30= 121
IF [ ABS[ #5062 - #28 ] GT 0.05 * #29 ] GOTO39
G31 Z#16 F#12
G04 P160 (M98 P9854)
#30= 121
IF [ ABS[ [ #5063 - #199 ] - #16 ] GT 0.05 * #29 ] GOTO37
#3004= 2
G31 Y#24 F#9
G04 P160 (M98 P9854)
#25= #5062 + #1
G01 Y#25 F#10
#30= 122
IF [ ABS[ #5062 - #24 ] LE 0.05 * #29 ] GOTO37
#30= 121
IF [ ABS[ #5062 - #28 ] LE 0.05 * #29 ] GOTO37
IF [ #6 NE #0 ] GOTO20
S#31
N20 G04 P1.
G31 Y#24 F [ #27 ]
G04 P160 (M98 P9854)
G01 Y#28 F [ 3000 * #29 ]
#3004= 0
S#15
#30= 122
IF [ ABS[ #5062 - #24 ] LE 0.05 * #29 ] GOTO37
#30= 121
IF [ ABS[ #5062 - #25 ] LE 0.05 * #29 ] GOTO37
#30= 0
#[ #14 + 4 ]= #5062
Z#23
Y#21
#1= - #1
#14= #14 + 1
#24= #21 + [ [ #166 + #19 ] / 2 ] - #18
#28= #21 + [ [ #166 + #19 ] / 2 ] + #18
IF [ #14 NE 2 ] GOTO19
IF [ #6 NE #0 ] GOTO32
N21
#8= ABS[ #4 - #5 ] - #166 - [ #2 * #156 ]
IF [ #11 EQ #0 ] GOTO31
IF [ ABS[ [ #8 / #156 ] - #[ 2400 + #7 ] - #[ 2600 + #7 ] ] GT #11 ] GOTO42
GOTO44
N31
#[ 2400 + #7 ]= #8 / #156
#[ 2600 + #7 ]= 0
GOTO44
N32
IF [ #176 EQ 2 ] GOTO36
IF [ #176 EQ - 2 ] GOTO36
#166= ABS[ #4 - #5 ] - #19
#167= [ [ #4 + #5 ] / 2 ] + #5021 - #5041
#168= #5022
X [ #167 - [ #5021 - #5041 ] ]
#174= 2
GOTO44
N33
G01 X#28 F [ 5000 * #29 ]
Z#23
GOTO35
N34 M05
#3000= 93 (FORMAT ERROR)
N35 M05
G01 X#21 F [ 5000 * #29 ]
IF [ #30 EQ 122 ] GOTO41
GOTO40
N36
#166= ABS[ #4 - #5 ] - #19
#168= [ [ #4 + #5 ] / 2 ] + #5022 - #5042
#167= #5021
Y [ #168 - [ #5022 - #5042 ] ]
#174= 2
GOTO44
N37
G01 Y#28 F [ 5000 * #29 ]
Z#23
GOTO39
N38 M05
#3000= 91 (FORMAT ERROR)
N39 M05
G01 Y#21 F [ 5000 * #29 ]
IF [ #30 EQ 122 ] GOTO41
N40
#3000= 92 (UNEXPECTED SURFACE FOUND)
N41
IF [ #11 NE #0 ] GOTO42
#3000= 93 (SURFACE NOT FOUND)
N42
IF [ #13 EQ #0 ] GOTO43
#[ 2000 + #13 ]= 1
GOTO44
N43 M05
#3000= 99 (BROKEN TOOL)
N44 M05
M98 P9799
#174= 0
N999
G103
(G04 P1.0)
M99



%