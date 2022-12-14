%
O09724 (SETTINGS RENISHAW V3.14 FOR NGC)
G103 P1

G187P2(MEDUIM SETTING)
IF[#598 NE 1.]G65 P9725 (MACHINE CHECK)
#166= #5083 (M98 P9723)
#170= 19 (SELECT DIA OFFSET)
IF [ #20040 EQ 1 ] GOTO90 (RAD DIA) (storm)
#170= 3 (SELECT RAD OFFSET)
N90
#161= 556 (START CALIBRATION VARIABLE)
G90 G80 G40 G94
IF [ #4008 NE 49 ] GOTO100
#3000= 89 (NO TOOL LENGTH ACTIVE)
N100
(#6996 = 774) (storm)
#162 = #30001.116 (STATUS OF PARAMETER 774) (storm)
IF [ #4006 EQ 20 ] GOTO400
IF [ #4006 EQ 70 ] GOTO400
#173= 0.05 (INPOS ZONE MM)
#179= 1
#169= 5000 (FAST FEED MM)
IF [ #162 NE 7 ] GOTO140 (SIGMA 5 MOTOR)
IF [ [ #30001.037 * #30001.035 ] GT 32000000 ] GOTO150 (storm)
GOTO145
N140
IF [ [ #30001.037 * #30001.035 ] GT 4000000 ] GOTO150 (storm)
N145
#169= 2500 (FAST FEED FOR SLOW MACHINES- MM)
N150
GOTO500
N400
#173= 0.002 (INPOS ZONE INCH)
#179= 1 / 25.4
#169= 200 (FAST FEED INCH)
IF [ #162 NE 7 ] GOTO440 (SIGMA 5 MOTOR)
IF [ [ #30001.037 * #30001.035 ] GT 32000000 ] GOTO450 (storm)
GOTO445
N440
IF [ [ #30001.037 * #30001.035 ] GT 4000000 ] GOTO450 (storm)
N445
#169= 100 (FAST FEED FOR SLOW MACHINES- INCH)
N450
N500
IF [ #[ #161 + 6 ] LE 0 ] GOTO600
IF [ #[ #161 + 6 ] GT 1 ] GOTO600
GOTO700
N600
#[ #161 + 6 ]= 0.2
N700
(G04 P1.0)
M99



%