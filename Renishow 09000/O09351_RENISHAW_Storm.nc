%
O09351 (IPS BORE RECT RENISHAW V3.14 FOR NGC)
(PROBE - BORE)
(G65P9351W114.D2.)
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
IF [ #7 EQ #0 ] GOTO10
N5 (BORE)
G65 P9814 D#7 R#18 Q#17
#3=#190
GOTO15
N10 (SQUARE POCKET)
G65 P9812 X#1
#3= #190
G65 P9812 Y#2
N15
G103 P1
#190= #3 + #5041
#191= #191 + #5042
G31 X [ #190 ] Y [ #191 ] F [ 1016. * #179 ]
#190= #190 + #24
#191= #191 + #25
G65 P9732 S#23 W1.
G65 P9833
GOTO999
N91 #3000= 11 (OMP40 NOT CALIBRATED)
N999
(G04 P1.0)
M99



%