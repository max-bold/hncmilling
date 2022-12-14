%
O09726 (BASIC MEASURE -2T RENISHAW V3.14 FOR NGC)
G103P1
IF [ #17 NE #0 ] GOTO1
#17= 5 * #179
N1
IF [ #7 EQ #0 ] GOTO2
(* A D INPUT XY PLANE ONLY)
#24= #5041 + [ [ #7 / 2 ] * COS[ #1 ] ]
#25= #5042 + [ [ #7 / 2 ] * SIN[ #1 ] ]
#26= #5043 - #166
N2
#31= 8 * #[ #161 + 6 ] * #179 (* BACK OFF)
#199= 0
#1= #5041
IF [ #24 NE #0 ] GOTO3
#24= #1
N3
#2= #5042
IF [ #25 NE #0 ] GOTO4
#25= #2
N4
#3= #5043 - #166
IF [ #26 NE #0 ] GOTO5
#26= #3
N5
(* CALC NRML DIR VEC)
#11= #24 - #1
#12= #25 - #2
#13= #26 - #3
#10= SQRT[ [ #11 * #11 ] + [ #12 * #12 ] + [ #13 * #13 ] ]
IF [ #10 EQ 0 ] GOTO6 (* NO MOVE)
#11= #11 / #10
#12= #12 / #10
#13= #13 / #10
(*CALC TARGET POS.)
#14= #24 + [ #17 * #11 ]
#15= #25 + [ #17 * #12 ]
#16= #26 + [ #17 * #13 ]
#3004= 2
G31 X#14 Y#15 Z#16 F [ #169 * 0.6 ]
(* P.FAIL)
#4= #5041 - #14
#5= #5042 - #15
#6= #5043 - #166 - #16
#29= SQRT[ [ #4 * #4 ] + [ #5 * #5 ] + [ #6 * #6 ] ]
IF [ #29 LT #173 ] GOTO7 (* P F)
(* P.OPEN)
#4= #5041 - #1
#5= #5042 - #2
#6= #5043 - #166 - #3
#29= SQRT[ [ #4 * #4 ] + [ #5 * #5 ] + [ #6 * #6 ] ]
IF [ #29 LT #173 ] GOTO6 (* P O)
(* CALC BACK OFF POS.)
#21= #5061 - [ #31 * #11 ]
#22= #5062 - [ #31 * #12 ]
#23= #5063 - #166 - [ #31 * #13 ]
G09 G01 X#21 Y#22 Z#23 F#169 (* BACK OFF)
G04 P50 (DWELL MP700)
G31 X#14 Y#15 Z#16 F [ 102 * #179 ] (* MEASURE)
#3004= 0
G01 X#1 Y#2 Z#3 F#169
(* P F CHCK)
#4= #5061 - #14
#5= #5062 - #15
#6= #5063 - #166 - #16
#29= SQRT[ [ #4 * #4 ] + [ #5 * #5 ] + [ #6 * #6 ] ]
IF [ #29 LT #173 ] GOTO7 (* P F)
(* P O CHCK)
#4= #5061 - #21
#5= #5062 - #22
#6= #5063 - #166 - #23
#29= SQRT[ [ #4 * #4 ] + [ #5 * #5 ] + [ #6 * #6 ] ]
IF [ #29 LT #173 ] GOTO6 (* P O)
#199= 0 (* NRML MEAS)
#174= #5061
#175= #5062
#176= #5063
IF [ #29 GT #173 ] GOTO8
N6
#199= 1
#174= #1
#175= #2
#176= #3
GOTO8
N7
#199= 2
#174= #14
#175= #15
#176= #16
N8
G01 X#1 Y#2 Z#3 F#169
(G04 P1.0)
M99



%