%
O09851 (LENGTH SET RENISHAW V3.14 FOR NGC)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
G04 P160 (M98 P9854)
M05
#174= 0
M98 P9799
IF [ #6 NE #0 ] GOTO1
G65 P9725 A3.(CAL CHECK)
IF [ #20 EQ #0 ] GOTO22
N1
#3= #5023 - #5043
#5= 3
IF [ #19 LT 0 ] GOTO2
#5= 4
N2
#23= #5043 - #199
IF [ #17 NE #0 ] GOTO3
#17= 4 * #29
N3
IF [ #26 NE #0 ] GOTO4
#26= -10 * #29
N4
IF [ #13 EQ #0 ] GOTO5
#[ 2000 + #13 ]= 0
N5
#28= #23 + #26
#1= 0.5 * #29
IF [ #23 GT #28 ] GOTO6
#1= -0.5 * #29
#17= - #17
N6
IF [ #6 NE #0 ] GOTO10
IF [ #19 EQ #0 ] GOTO10
#15= [ ROUND[ 1910 / ABS[ #19 / #29 ] ] ] * 10
IF [ #15 LT 800 ] GOTO7
#15= 800
N7
IF [ #15 GT 150 ] GOTO8
#15= 150
N8
#31= 800
N9
#9= #15 / 8 * #29
#27= 4 * #29
GOTO11
N10
#27= 4 * #29
#9= 1000 * #29
#1= 5 * #29 * #[ #30 + 12 ]
N11
#10= 1000 * #29
#28= #28 - #17
IF [ #6 NE #0 ] GOTO12
IF [ #19 EQ #0 ] GOTO12
S#15 M#5
G04 P1.
N12
#3004= 2
#30= 122
G31 Z#28 F#9
G04 P160 (M98 P9854)
#25= #5063 - #199 + #1
G01 Z#25 F#10
#30= 122
IF [ ABS[ #5063 - #199 - #28 ] LE 0.05 * #29 ] GOTO23
#30= 121
IF [ ABS[ #5063 - #199 - #23 ] LE 0.05 * #29 ] GOTO23
#30= 0
#32= #25
IF [ #6 NE #0 ] GOTO13
IF [ #19 EQ #0 ] GOTO121
S#31
G04 P1.
N121
#32= #5063 - #199 - #26
IF [ #19 NE #0 ] GOTO14
N13
G31 Z#28 F [ 30 * #29 ]
G04 P160 (M98 P9854)
G01 Z#32 F [ 5000 * #29 ]
#3004= 0
#30= 122
IF [ ABS[ #5063 - #199 - #28 ] LE 0.05 * #29 ] GOTO23
#30= 121
IF [ ABS[ #5063 - #199 - #25 ] LE 0.05 * #29 ] GOTO23
#30= 0
#12= #5063
#8= #5063 + #3 - #163
IF [ #6 EQ #0 ] GOTO15
#3004= 2
N14
G31 Z#28 F [ #27 ]
G04 P160 (M98 P9854)
G01 Z [ #5063 - #199 - #26 ] F [ 5000 * #29 ]
#3004= 0
IF [ #19 EQ #0 ] GOTO141
S#15
N141
#30= 122
IF [ ABS[ #5063 - #199 - #28 ] LE 0.05 * #29 ] GOTO23
#30= 121
IF [ ABS[ #5063 - #199 - #25 ] LE 0.05 * #29 ] GOTO23
#30= 0
#14= #5063
#8= #5063 + #3 - #169
IF [ #6 NE #0 ] GOTO21
N15
IF [ #11 EQ #0 ] GOTO20
IF [ ABS[ #8 - #[ 2000 + #20 ] - #[ 2200 + #20 ] ] GT #11 ] GOTO26
GOTO28
N20
#[ 2000 + #20 ]= #8
#[ 2200 + #20 ]= 0
GOTO28
N21
#163= #12 - #6 + #3
#169= #14 - #6 + #3
#174= 1
GOTO28
N22
#3000= 91 (FORMAT ERROR)
N23 M05
G01 Z#23 F [ 2000 * #29 ]
IF [ #30 EQ 122 ] GOTO25
N24
#3000= 92 (UNEXPECTED SURFACE FOUND)
N25
IF [ #11 NE #0 ] GOTO26
#3000= 93 (SURFACE NOT FOUND)
N26
IF [ #13 EQ #0 ] GOTO27
#[ 2000 + #13 ]= 1
GOTO28
N27 M05
#3000= 99 (BROKEN TOOL)
N28 M05
M98 P9799
#174= 0
N999
G103
(G04 P1.0)
M99



%