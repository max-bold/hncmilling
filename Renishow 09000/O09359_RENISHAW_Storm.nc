%
O09359 (IPS SINGLE SURFACE RENISHAW V3.14 FOR NGC)
(PROBE - SINGLE SURFACE)
(G65P9359W114.X1.)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
#27= 10 (DEFAULT Q IN MM)
#30= 10 (STAND OFF)
#161= 556 (START CALIBRATION VARIABLE)
IF [ #23 GE 110 ] GOTO3
#23= #23 - 53
N3
IF [ #[ #161 ] EQ 0 ] GOTO91 (CHECK CAL)
IF [ #[ #161 ] EQ #0 ] GOTO91
G43 H#3026
G65 P9832
#30= #30 * #179
IF [ #25 NE #0 ] GOTO13
IF [ #26 NE #0 ] GOTO16
N11 (SET SURF X)
#14= #5041 + #24
G65 P9811 X#14 Q#17
G103 P1
#190= #190 + #14
GOTO15
N13 (SET SURF Y)
#15= #5042 + #25
G65 P9811 Y#15 Q#17
G103 P1
#191= #191 + #15
N15
G65 P9732 S#23 W1.
GOTO998
N16 (SET SURF Z)
#16= #5043 - #5083 + #26
G65 P9811 Z#16 Q#17
G103 P1
#192= #192 + #16
G65 P9732 S#23 W1. Z1.
N998
G65 P9833
GOTO999
N91 #3000= 11 (OMP40 NOT CALIBRATED)
N999
(G04 P1.0)
M99



%