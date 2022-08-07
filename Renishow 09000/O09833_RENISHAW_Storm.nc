%
O09833 (OMP40 OFF RENISHAW V3.14 FOR NGC)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
N2
#4= 0
N3
(#6996 = 710) (NO HS3 on Storm)
(#5 = #6998 (STATUS OF PARAMETER 710))
(IF [ #5 NE 8 ] GOTO200)
(M69 P1136 (NEITHER PROBE ON M65 HS3 ONLY))
(GOTO201)
(N200)
M69 P3 (NEITHER PROBE ON) (storm)
(N201)
(G04 P201)
#4= #4 + 1 (TRY TURN ON 4 TIMES)
IF [ #4 EQ 4 ] GOTO4
#3001= 0 (RESET MS TIMER)
WH [ #11017 NE 1 ] DO1 (WAIT FOR OTS OFF) (storm)
IF [ #3001 GT 3000. ] GOTO3 (OMP40 FAIL TO TURN OFF AFTER 3 SEC TRY AGAIN)
END1
GOTO5
N4
#3000= 1 (PROBE SWITCH OFF FAILURE)
N5
N999
G187(BACK TO DEFAULT)
G103
(G04 P1.)
M99



%