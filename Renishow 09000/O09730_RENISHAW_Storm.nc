%
O09730 (PRINT RENISHAW V3.14 FOR NGC)
(40120883.0C HAAS)
G103 P1
#30= .5 (EDIT DWELL)
POPEN
IF [ #171 NE #0 ] GOTO1
#171= 1
N1
IF [ #172 NE #0 ] GOTO2
#172= 1
N2
IF [ #23 NE 2 ] GOTO3
#171= #171 + 1
#172= 1
N3
DPRNT[]
G04 P#30
DPRNT[-------------------------------------------------------------------]
G04 P#30
DPRNT[***COMPONENT*NO*#171[60]*******************FEATURE*NO*#172[40]]
G04 P#30
DPRNT[-------------------------------------------------------------------]
G04 P#30
#172= #172 + 1
IF [ #20 EQ #0 ] GOTO4
DPRNT[TOOL*OFFSET*H#20[40]]
G04 P#30
N4
IF [ #19 EQ #0 ] GOTO20
DPRNT[WORK*OFFSET*S#19[30]]
G04 P#30
N20
IF [ #18 EQ #0 ] GOTO30
(PCD INPUT)
#28= #185 - #24 + #4
#29= #186 - #25 + #5
DPRNT[PCD*FEATURE*NO*#197[30]]
G04 P#30
DPRNT[INC*X#4[44]***ACTUAL*#28[44]]
G04 P#30
DPRNT[INC*Y#5[44]***ACTUAL*#29[44]]
G04 P#30
DPRNT[PCD*#18[44]***ACTUAL*#187[44]***DEV*#192[34]]
G04 P#30
DPRNT[ANG*#1[44]***ACTUAL*#189[44]***DEV*#194[34]]
G04 P#30
DPRNT[]
G04 P#30
#1= #0
N30 (D INPUT)
IF [ #7 EQ #0 ] GOTO40
IF [ #8 EQ 2 ] GOTO31
IF [ #11 NE #0 ] GOTO31
IF [ #20 NE #0 ] GOTO31
GOTO35
N31 (SIZE DATA)
#14= 1
IF [ #11 NE #0 ] GOTO32
DPRNT[SIZE*D#7[44]***ACTUAL*#188[44]***DEV*#193[34]]
G04 P#30
GOTO40
N32
DPRNT[SIZE*D#7[44]***ACTUAL*#188[44]***TOL*#11[24]**DEV*#193[34]]
G04 P#30
IF [ ABS[ #193 ] LE #11 ] GOTO40
#32= 40
GOTO110
N35 (POS)
IF [ #13 NE #0 ] GOTO36
DPRNT[POSN*R#7[44]***ACTUAL*#188[44]***DEV*#193[34]]
G04 P#30
GOTO40
N36
DPRNT[POSN*R#7[44]***ACTUAL*#188[44]***TOL*TP*#13[24]**DEV*#193[34]]
G04 P#30
N40 (X INPUT)
IF [ #24 EQ #0 ] GOTO50
IF [ #14 EQ 1 ] GOTO45
IF [ #11 NE #0 ] GOTO41
IF [ #20 NE #0 ] GOTO41
GOTO45
N41 (SIZE DATA)
#14= 1
IF [ #11 NE #0 ] GOTO42
DPRNT[SIZE*X#24[44]***ACTUAL*#188[44]***DEV*#193[34]]
G04 P#30
GOTO50
N42
DPRNT[SIZE*X#24[44]***ACTUAL*#188[44]***TOL*#11[24]**DEV*#193[34]]
G04 P#30
IF [ ABS[ #193 ] LE #11 ] GOTO50
#32= 50
GOTO110
N45 (POS)
IF [ #13 NE #0 ] GOTO46
DPRNT[POSN*X#24[44]***ACTUAL*#185[44]***DEV*#190[34]]
G04 P#30
GOTO50
N46
DPRNT[POSN*X#24[44]***ACTUAL*#185[44]***TOL*TP*#13[24]**DEV*#190[34]]
G04 P#30
N50 (Y INPUT)
IF [ #25 EQ #0 ] GOTO60
IF [ #14 EQ 1 ] GOTO55
IF [ #11 NE #0 ] GOTO51
IF [ #20 NE #0 ] GOTO51
GOTO55
N51 (SIZE DATA)
#14= 1
IF [ #11 NE #0 ] GOTO52
DPRNT[SIZE*Y#25[44]***ACTUAL*#188[44]***DEV*#193[34]]
G04 P#30
GOTO60
N52
DPRNT[SIZE*Y#25[44]***ACTUAL*#188[44]***TOL*#11[24]**DEV*#193[34]]
G04 P#30
IF [ ABS[ #193 ] LE #11 ] GOTO60
#32= 60
GOTO110
N55 (POS)
IF [ #13 NE #0 ] GOTO56
DPRNT[POSN*Y#25[44]***ACTUAL*#186[44]***DEV*#191[34]]
G04 P#30
GOTO60
N56
DPRNT[POSN*Y#25[44]***ACTUAL*#186[44]***TOL*TP*#13[24]**DEV*#191[34]]
G04 P#30
N60 (Z INPUT)
IF [ #26 EQ #0 ] GOTO67
IF [ #14 EQ 1 ] GOTO65
IF [ #11 NE #0 ] GOTO61
IF [ #20 NE #0 ] GOTO61
GOTO65
N61 (SIZE DATA)
#14= 1
IF [ #11 NE #0 ] GOTO62
DPRNT[SIZE*Z#26[44]***ACTUAL*#188[44]***DEV*#193[34]]
G04 P#30
GOTO70
N62
DPRNT[SIZE*Z#26[44]***ACTUAL*#188[44]***TOL*#11[24]**DEV*#193[34]]
G04 P#30
IF [ ABS[ #193 ] LE #11 ] GOTO70
#32= 70
GOTO110
N65 (POS)
IF [ #13 NE #0 ] GOTO66
DPRNT[POSN*Z#26[44]***ACTUAL*#187[44]***DEV*#192[34]]
G04 P#30
GOTO70
N66
DPRNT[POSN*Z#26[44]***ACTUAL*#187[44]***TOL*TP*#13[24]**DEV*#192[34]]
G04 P#30
N67
IF [ #13 EQ #0 ] GOTO70
IF [ ABS[ #195 ] LE #13 / 2 ] GOTO70
#32= 70
GOTO120
N70 (ANG1 INPUT)
IF [ #1 EQ #0 ] GOTO80
IF [ #17 NE #0 ] GOTO71
DPRNT[ANG*#1[44]***ACTUAL*#189[44]***DEV*#194[34]]
G04 P#30
GOTO80
N71
DPRNT[ANG*#1[44]***ACTUAL*#189[44]***TOL*#17[24]**DEV*#194[34]]
G04 P#30
IF [ ABS[ #194 ] LE #17 ] GOTO80
#28= #194
#29= #17
#32= 80
GOTO130
N80
IF [ #2 EQ #0 ] GOTO199
(ANG2 INPUT)
IF [ #3 NE #0 ] GOTO81
DPRNT[ANG*#2[44]***ACTUAL*#192[44]***DEV*#193[34]]
G04 P#30
GOTO199
N81
DPRNT[ANG*#2[44]***ACTUAL*#192[44]***TOL*#3[24]**DEV*#193[34]]
G04 P#30
IF [ ABS[ #193 ] LE #3 ] GOTO199
#28= #193
#29= #3
#32= 199
GOTO130
N110 (SIZE TOL)
IF [ #193 LT 0 ] GOTO111
#31= #193 - #11
GOTO112
N111
#31= #193 + #11
N112
DPRNT[]
G04 P#30
DPRNT[**********+++++OUT*OF*TOL+++++*ERROR*#31[34]]
G04 P#30
DPRNT[]
G04 P#30
GOTO#32
N120 (POS TOL)
IF [ #15 EQ 1 ] GOTO#32
#28= #195 - #13 / 2
DPRNT[]
G04 P#30
DPRNT[**********+++++OUT*OF*POS+++++*ERROR*TP*#28[34]*RADIAL]
G04 P#30
DPRNT[]
G04 P#30
#15= 1
GOTO#32
N130 (ANG TOL)
IF [ #28 LT 0 ] GOTO131
#31= #28 - #29
GOTO132
N131
#31= #28 + #29
N132
DPRNT[]
G04 P#30
DPRNT[**********+++++ANG*OUT*OF*TOL+++++*ERROR*#31[34]]
G04 P#30
DPRNT[]
G04 P#30
GOTO#32
N199
PCLOS
(G04 P1.0)
M99



%