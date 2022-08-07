%
O09985 (SINGLE AXIS MRZP)

(AFTER EACH M3O JOG AXIS TO THE NEXT LOCATION AND PRESS CYCLE START)
(WHEN THE PROGRAM IS FINISHED THE Z AXIS WILL RETRACT TO THE HOME POSITION)
(DESIGNED TO PROBE 3 POINTS)
(MODIFIED PROGRAM TO PROBE THE UPPER PORTION OF CALIBRATION BALL)  
(CREATED BY ERIC RODRIGUEZ 8/31/2016)
(ADDED HOME POSITION RETURN)
(ADDED DPRNT OUTPUT)
(REVISED 3/1/2016)

( OUTPUT MRZP SETTING VALUES )
( COPY VALUE FROM THE MACRO VARIABLE INTO THE SETTING )
( MACRO #10121 IS SETTING 255 - MRZP X OFFSET )
( MACRO #10122 IS SETTING 256 - MRZP Y OFFSET ) 
( MACRO #10123 IS SETTING 257 - MRZP Z OFFSET ) 

( USE MACRO OUTPUT TO SET TWO SINGLE AXIS ROTARIES COMBINED CORRECTLY )
( SLAVE ROTARY IS MOUNTED ON MASTER ROTARY ) 

( SETTING 300 - MRZP X OFFSET MASTER ) 
( SETTING 301 - MRZP Y OFFSET MASTER ) 
( SETTING 302 - MRZP Z OFFSET MASTER ) 
( SETTING 303 - MRZP X OFFSET SLAVE ) 
( SETTING 304 - MRZP Y OFFSET SLAVE )
( SETTING 305 - MRZP Z OFFSET SLAVE )

(DPRNT- FIRST AND LAST PROBE POINT MUST BE 90 DEGREES APART)
(DPRNT- SETTING 261 MUST BE SET TO FILE)
(DPRNT- SETTING 262 MUST HAVE A PATH DESTINATION)

(NOT FOR USE ON COLDFIRE MACHINES)  
(WORKS IN INCH AND METRIC)
(TO RESET PROGRAM PROCESS START PROGRAM FROM N96)
 
( B GAGE BALL DIAMETER ) 

( THIS PROGRAM WILL WRITE OVER) 
( G154 P80,G154 P81 AND G154 P82) 

(LIMIT LOOK AHEAD) 
G103 P1 
G04 P1 
G04 P1 
G04 P1 
G04 P1 
G04 P1 
G04 P1 
G04 P1 
G04 P400 
G04 P1 
G04 P1 
G04 P1 
G04 P1 
G04 P1 
G04 P1 
G04 P1 


( B CALL CHECK ) 
 
IF [ #2 LE 0 ] GOTO104 ( B CALL CHECK ) 
IF [ #2 EQ #0 ] GOTO104 ( B CALL CHECK ) 

( METRIC CHECK ) 
( CHECKS SETTING 9 )
#10998=25.
#10999=.25
IF [ #20009 EQ 1 ] GOTO4 
GOTO5 
N4 
#10998=635.
#10999=6.35
N5 


(CHECK PROBE CAILIBRATION)
IF [ #10556 EQ 0 ] GOTO102
IF [ #10560 EQ 0 ] GOTO102
IF [ #10561 EQ 0 ] GOTO102

#10254= #20254 
(CHECK SETTING 254)
IF [ #10254 LT 0 ] GOTO103
IF [ #10254 GT 0 ] GOTO103

(CYCLE CHECK)
#10801=#10801+1
IF [ #10801 EQ 1 ] GOTO97
N107
#10800=#10800+1
IF [ #10800 LE 3 ] GOTO1
IF [ #10800 GT 3 ] GOTO6

(PROGRAM FILTER)
N1
IF [ #15581 AND #15582 LT 0 ] GOTO2
#10800=#10800 -1 
M97 P100
#10800=#10800+1
M30
N2
IF [ #15601 AND #15602 LT 0 ] GOTO3 
#10800=#10800 -1 
M97 P200
#10800=#10800+1
M30 
N3
IF [ #15621 AND #15622 LT 0 ] GOTO4 
#10800=#10800 -1 
M97 P300
M30

N100
#2= #2 / 2 
(PROBE LOCATION #1)  
G04 P300 
G65 P9995 W154.8 A11. D#2 E - [ #2 / 3 + #10999 ] 
G04 P300 
G65 P9995 W154.8 A20. H - [ #2 / 2 ] 
G00 G90 G154 P80 X0. Y0. 
T#3026 
G43 H#3026 
G01 Z#10999 F#10998 
G04 P3 
G65 P9995 W154.8 A11. D#2 E - [ #2 / 3 + #10999 ] 
G04 P300 
#2= #2 * 2 
(MOVE Z OFFSET - HALF GAGE BALL DIAMETER) 
#15583= #15583 - [ #2 / 2 ] 
#15584= #5024
#15585= #5025 
#15586= #5026 
G04 P300 
M99 

N200
#2= #2 / 2 
(PROBE LOCATION #2)  
G04 P300 
G65 P9995 W154.81 A11. D#2 E - [ #2 / 3 + #10999 ] 
G04 P300 
G65 P9995 W154.81 A20. H - [ #2 / 2 ] 
G00 G90 G154 P81 X0. Y0. 
T#3026 
G43 H#3026 
G01 Z#10999 F#10998 
G04 P3 
G65 P9995 W154.81 A11. D#2 E - [ #2 / 3 + #10999 ] 
G04 P300 
#2= #2 * 2 
(MOVE Z OFFSET - HALF GAGE BALL DIAMETER) 
#15603= #15603 - [ #2 / 2 ] 
#15604= #5024
#15605= #5025 
#15606= #5026 
G04 P300 
M99 

N300
#2= #2 / 2 
(PROBE LOCATION #3)
G04 P300 
G65 P9995 W154.82 A11. D#2 E - [ #2 / 3 + #10999 ]
G04 P300 
G65 P9995 W154.82 A20. H - [ #2 / 2 ] 
G00 G90 G154 P82 X0. Y0. 
T#3026 
G43 H#3026 
G01 Z#10999 F#10998 
G04 P3 
G65 P9995 W154.82 A11. D#2 E - [ #2 / 3 + #10999 ] 
G04 P300 
#2= #2 * 2 
(MOVE Z OFFSET - HALF GAGE BALL DIAMETER) 
#15623= #15623 - [ #2 / 2 ] 
#15624= #5024
#15625= #5025 
#15626= #5026 
G04 P300 
#10800=#10800+1


N4
G103P1
(CONVERT VALUES)
#701=#15601*-1.
#702=#15602*-1.
#703=#15603*-1.
#704=#15581*-1.
#705=#15582*-1.
#706=#15583*-1.
#707=#15621*-1.
#708=#15622*-1.
#809=#15623*-1.

#600= #704-#701
#601= #705-#702
#602= #706-#703
#603= #707-#701
#604= #708-#702
#605= #809-#703

IF [ #600 LT 0 ]THEN #600=#600*-1.
IF [ #601 LT 0 ]THEN #601=#601*-1.
IF [ #602 LT 0 ]THEN #602=#602*-1.
IF [ #603 LT 0 ]THEN #603=#603*-1.
IF [ #604 LT 0 ]THEN #604=#604*-1.
IF [ #605 LT 0 ]THEN #605=#605*-1.

#606=[#600+#602]/2
#607=[#601+#602]/2
#608=[#603+#605]/2
#609=[#604+#605]/2

( METRIC CHECK ) 
( CHECKS SETTING 9 )
IF [ #20009 EQ 1 ] GOTO1000

(INCH FILTER DIRECTOR)
IF [[ #600 LT 0.002] AND [ #603 LT 0.002]] GOTO34
IF [[ #601 LT 0.002] AND [ #604 LT 0.002]] GOTO24
IF [[ #602 LT 0.002] AND [ #605 LT 0.002]] GOTO14 

GOTO99

N1000
(MM FILTER DIRECTOR)
IF [[ #600 LT 0.0508] AND [ #603 LT 0.0508]] GOTO34
IF [[ #601 LT 0.0508] AND [ #604 LT 0.0508]] GOTO24
IF [[ #602 LT 0.0508] AND [ #605 LT 0.0508]] GOTO14

GOTO99 


N14
#10711=#15581(X)
#10721=#15582(Y) 
 
#10712= #15601(X)
#10722= #15602(Y)  
 
#10713= #15621(X)
#10723= #15622(Y)

#10711= [ ROUND[ #10711 * 10000 ] ] / 10000 
#10721= [ ROUND[ #10721 * 10000 ] ] / 10000 
#10712= [ ROUND[ #10712 * 10000 ] ] / 10000 
#10722= [ ROUND[ #10722 * 10000 ] ] / 10000 
#10713= [ ROUND[ #10713 * 10000 ] ] / 10000 
#10723= [ ROUND[ #10723 * 10000 ] ] / 10000

IF[#10712-#10711 EQ 0] THEN #10712=#10712+0.0001

IF[#10713-#10712 EQ 0] THEN #10713=#10713+0.0001

#10715=[[#10722]-[#10721]]/[[#10712]-[#10711]] 
#10716=[[#10723]-[#10722]]/[[#10713]-[#10712]]

#10714=[[[#10715]*[#10716]]*[[#10721]-[#10723]]+[[#10716]*[[#10711]+[#10712]]]-[[#10715]*[[#10712]+[#10713]]]]/[[2.]*[[#10716]-[#10715]]]

#10724=[[-1.]/[#10715]]*[[#10714]-[[#10711]+[#10712]]/[2.]]+[[#10721]+[#10722]]/[2.]

#10121= #10714 
#10122= #10724  
#15643= 0 
#10100=#30003.078
G49
IF [ #20009 EQ 1 ] GOTO77
N76(INCH)
#10101=#10100/25.4
GOTO78
N77(METRIC)
#10101=#10100
N78
G1G154P83Z#10101 F[ #10998 * 8 ]
G103P1
(-----------------------------------------)
POPEN

DPRNT[UNITS*#4006[20]] 
DPRNT[TYPE*2] 
#11= FIX[ #3011 / 10000 ] 
#12= FIX[ [ #3011 - [ #11 * 10000 ] ] / 100 ] 
#13= FIX[ [ #3011 - [ #11 * 10000 ] - [ #12 * 100 ] ] / 1 ] 
DPRNT[DATE*20#11[40]*#12[20]*#13[20]] 
#11= FIX[ #3012 / 10000 ] 
#12= FIX[ [ #3012 - [ #11 * 10000 ] ] / 100 ] 
#13= FIX[ [ #3012 - [ #11 * 10000 ] - [ #12 * 100 ] ] / 1 ] 
DPRNT[TIME*#11[20]*#12[20]*#13[20]] 
DPRNT[AXISLABELS*A*B*C*X*Y*Z] 

#11=#15584  
#12=#15585 
#13=#15586 
#16=#15581
#17=#15582
#18=#15583

#11= [ ROUND[ #11 * 10000 ] ] / 10000 
#12= [ ROUND[ #12 * 10000 ] ] / 10000 
#13= [ ROUND[ #13 * 10000 ] ] / 10000 
#16= [ ROUND[ #16 * 10000 ] ] / 10000 
#17= [ ROUND[ #17 * 10000 ] ] / 10000 
#18= [ ROUND[ #18 * 10000 ] ] / 10000 

DPRNT[NEW FINAL MRZP VALUES]
DPRNT[#10121[44]*#10122[44]*#10123[44]]
DPRNT[#11[44]*#12[44]*#13[44]*#16[44]*#17[44]*#18[44]] 

#11=#15604  
#12=#15605 
#13=#15606 
#16=#15601
#17=#15602
#18=#15603

#11= [ ROUND[ #11 * 10000 ] ] / 10000 
#12= [ ROUND[ #12 * 10000 ] ] / 10000 
#13= [ ROUND[ #13 * 10000 ] ] / 10000 
#16= [ ROUND[ #16 * 10000 ] ] / 10000 
#17= [ ROUND[ #17 * 10000 ] ] / 10000 
#18= [ ROUND[ #18 * 10000 ] ] / 10000 

DPRNT[#11[44]*#12[44]*#13[44]*#16[44]*#17[44]*#18[44]] 

#11=#15624  
#12=#15625 
#13=#15626 
#16=#15621
#17=#15622
#18=#15623

#11= [ ROUND[ #11 * 10000 ] ] / 10000 
#12= [ ROUND[ #12 * 10000 ] ] / 10000 
#13= [ ROUND[ #13 * 10000 ] ] / 10000 
#16= [ ROUND[ #16 * 10000 ] ] / 10000 
#17= [ ROUND[ #17 * 10000 ] ] / 10000 
#18= [ ROUND[ #18 * 10000 ] ] / 10000 

DPRNT[#11[44]*#12[44]*#13[44]*#16[44]*#17[44]*#18[44]] 

DPRNT[END*DATA] 
PCLOS 
(-----------------------------------------)

G103
M30 
 
N24
G103P1 
#10711=#15581(X)
#10721=#15583(Z) 
 
#10712= #15601(X)
#10722= #15603(Z)  
 
#10713= #15621(X)
#10723= #15623(Z)

#10711= [ ROUND[ #10711 * 10000 ] ] / 10000 
#10721= [ ROUND[ #10721 * 10000 ] ] / 10000 
#10712= [ ROUND[ #10712 * 10000 ] ] / 10000 
#10722= [ ROUND[ #10722 * 10000 ] ] / 10000 
#10713= [ ROUND[ #10713 * 10000 ] ] / 10000 
#10723= [ ROUND[ #10723 * 10000 ] ] / 10000

IF[#10712-#10711 EQ 0] THEN #10712=#10712+0.0001

IF[#10713-#10712 EQ 0] THEN #10713=#10713+0.0001

#10715=[[#10722]-[#10721]]/[[#10712]-[#10711]] 
#10716=[[#10723]-[#10722]]/[[#10713]-[#10712]]

#10714=[[[#10715]*[#10716]]*[[#10721]-[#10723]]+[[#10716]*[[#10711]+[#10712]]]-[[#10715]*[[#10712]+[#10713]]]]/[[2.]*[[#10716]-[#10715]]]

#10724=[[-1.]/[#10715]]*[[#10714]-[[#10711]+[#10712]]/[2.]]+[[#10721]+[#10722]]/[2.]

#10121= #10714 
#10123= #10724 
#10300= #10121
#10302= #10123 
#15643= 0 
#10100=#30003.078
G49
IF [ #20009 EQ 1 ] GOTO77
N76(INCH)
#10101=#10100/25.4
GOTO78
N77(METRIC)
#10101=#10100
N78
G1G154P83Z#10101 F[ #10998 * 8 ]
G103P1

(-----------------------------------------)
POPEN

DPRNT[UNITS*#4006[20]] 
DPRNT[TYPE*2] 
#11= FIX[ #3011 / 10000 ] 
#12= FIX[ [ #3011 - [ #11 * 10000 ] ] / 100 ] 
#13= FIX[ [ #3011 - [ #11 * 10000 ] - [ #12 * 100 ] ] / 1 ] 
DPRNT[DATE*20#11[40]*#12[20]*#13[20]] 
#11= FIX[ #3012 / 10000 ] 
#12= FIX[ [ #3012 - [ #11 * 10000 ] ] / 100 ] 
#13= FIX[ [ #3012 - [ #11 * 10000 ] - [ #12 * 100 ] ] / 1 ] 
DPRNT[TIME*#11[20]*#12[20]*#13[20]] 
DPRNT[AXISLABELS*A*B*C*X*Y*Z] 

#11=#15584  
#12=#15585 
#13=#15586 
#16=#15581
#17=#15582
#18=#15583

#11= [ ROUND[ #11 * 10000 ] ] / 10000 
#12= [ ROUND[ #12 * 10000 ] ] / 10000 
#13= [ ROUND[ #13 * 10000 ] ] / 10000 
#16= [ ROUND[ #16 * 10000 ] ] / 10000 
#17= [ ROUND[ #17 * 10000 ] ] / 10000 
#18= [ ROUND[ #18 * 10000 ] ] / 10000 

DPRNT[NEW FINAL MRZP VALUES]
DPRNT[#10121[44]*#10122[44]*#10123[44]]
DPRNT[#11[44]*#12[44]*#13[44]*#16[44]*#17[44]*#18[44]] 

#11=#15604  
#12=#15605 
#13=#15606 
#16=#15601
#17=#15602
#18=#15603

#11= [ ROUND[ #11 * 10000 ] ] / 10000 
#12= [ ROUND[ #12 * 10000 ] ] / 10000 
#13= [ ROUND[ #13 * 10000 ] ] / 10000 
#16= [ ROUND[ #16 * 10000 ] ] / 10000 
#17= [ ROUND[ #17 * 10000 ] ] / 10000 
#18= [ ROUND[ #18 * 10000 ] ] / 10000 

DPRNT[#11[44]*#12[44]*#13[44]*#16[44]*#17[44]*#18[44]] 

#11=#15624  
#12=#15625 
#13=#15626 
#16=#15621
#17=#15622
#18=#15623

#11= [ ROUND[ #11 * 10000 ] ] / 10000 
#12= [ ROUND[ #12 * 10000 ] ] / 10000 
#13= [ ROUND[ #13 * 10000 ] ] / 10000 
#16= [ ROUND[ #16 * 10000 ] ] / 10000 
#17= [ ROUND[ #17 * 10000 ] ] / 10000 
#18= [ ROUND[ #18 * 10000 ] ] / 10000 

DPRNT[#11[44]*#12[44]*#13[44]*#16[44]*#17[44]*#18[44]] 

DPRNT[END*DATA] 
PCLOS 
(-----------------------------------------)

G103
M30 
 
N34
G103P1
#10711=#15582(Y)
#10721=#15583(Z) 
 
#10712= #15602(Y)
#10722= #15603(Z)  
 
#10713= #15622(Y)
#10723= #15623(Z)

#10711= [ ROUND[ #10711 * 10000 ] ] / 10000 
#10721= [ ROUND[ #10721 * 10000 ] ] / 10000 
#10712= [ ROUND[ #10712 * 10000 ] ] / 10000 
#10722= [ ROUND[ #10722 * 10000 ] ] / 10000 
#10713= [ ROUND[ #10713 * 10000 ] ] / 10000 
#10723= [ ROUND[ #10723 * 10000 ] ] / 10000

IF[#10712-#10711 EQ 0] THEN #10712=#10712+0.0001

IF[#10713-#10712 EQ 0] THEN #10713=#10713+0.0001

#10715=[[#10722]-[#10721]]/[[#10712]-[#10711]] 
#10716=[[#10723]-[#10722]]/[[#10713]-[#10712]]

#10714=[[[#10715]*[#10716]]*[[#10721]-[#10723]]+[[#10716]*[[#10711]+[#10712]]]-[[#10715]*[[#10712]+[#10713]]]]/[[2.]*[[#10716]-[#10715]]]

#10724=[[-1.]/[#10715]]*[[#10714]-[[#10711]+[#10712]]/[2.]]+[[#10721]+[#10722]]/[2.]

#10122= #10714 
#10123= #10724 
#10304= #10122
#10305= #10123
#15643= 0 
#10100=#30003.078
G49
IF [ #20009 EQ 1 ] GOTO77
N76(INCH)
#10101=#10100/25.4
GOTO78
N77(METRIC)
#10101=#10100
N78
G1G154P83Z#10101 F[ #10998 * 8 ]
G103P1

(-----------------------------------------)
POPEN

DPRNT[UNITS*#4006[20]] 
DPRNT[TYPE*2] 
#11= FIX[ #3011 / 10000 ] 
#12= FIX[ [ #3011 - [ #11 * 10000 ] ] / 100 ] 
#13= FIX[ [ #3011 - [ #11 * 10000 ] - [ #12 * 100 ] ] / 1 ] 
DPRNT[DATE*20#11[40]*#12[20]*#13[20]] 
#11= FIX[ #3012 / 10000 ] 
#12= FIX[ [ #3012 - [ #11 * 10000 ] ] / 100 ] 
#13= FIX[ [ #3012 - [ #11 * 10000 ] - [ #12 * 100 ] ] / 1 ] 
DPRNT[TIME*#11[20]*#12[20]*#13[20]] 
DPRNT[AXISLABELS*A*B*C*X*Y*Z] 

#11=#15584  
#12=#15585 
#13=#15586 
#16=#15581
#17=#15582
#18=#15583

#11= [ ROUND[ #11 * 10000 ] ] / 10000 
#12= [ ROUND[ #12 * 10000 ] ] / 10000 
#13= [ ROUND[ #13 * 10000 ] ] / 10000 
#16= [ ROUND[ #16 * 10000 ] ] / 10000 
#17= [ ROUND[ #17 * 10000 ] ] / 10000 
#18= [ ROUND[ #18 * 10000 ] ] / 10000 

DPRNT[NEW FINAL MRZP VALUES]
DPRNT[#10121[44]*#10122[44]*#10123[44]]
DPRNT[#11[44]*#12[44]*#13[44]*#16[44]*#17[44]*#18[44]] 

#11=#15604  
#12=#15605 
#13=#15606 
#16=#15601
#17=#15602
#18=#15603

#11= [ ROUND[ #11 * 10000 ] ] / 10000 
#12= [ ROUND[ #12 * 10000 ] ] / 10000 
#13= [ ROUND[ #13 * 10000 ] ] / 10000 
#16= [ ROUND[ #16 * 10000 ] ] / 10000 
#17= [ ROUND[ #17 * 10000 ] ] / 10000 
#18= [ ROUND[ #18 * 10000 ] ] / 10000 

DPRNT[#11[44]*#12[44]*#13[44]*#16[44]*#17[44]*#18[44]] 

#11=#15624  
#12=#15625 
#13=#15626 
#16=#15621
#17=#15622
#18=#15623

#11= [ ROUND[ #11 * 10000 ] ] / 10000 
#12= [ ROUND[ #12 * 10000 ] ] / 10000 
#13= [ ROUND[ #13 * 10000 ] ] / 10000 
#16= [ ROUND[ #16 * 10000 ] ] / 10000 
#17= [ ROUND[ #17 * 10000 ] ] / 10000 
#18= [ ROUND[ #18 * 10000 ] ] / 10000 

DPRNT[#11[44]*#12[44]*#13[44]*#16[44]*#17[44]*#18[44]] 

DPRNT[END*DATA] 
PCLOS 
(-----------------------------------------)

G103
M30 

N6
(CHECK OFFSETS FOR VALUES)
#500=#15581+#15582+#15583(P80)
#501=#15601+#15602+#15603(P81) 
#502=#15621+#15622+#15623(P82)  

IF [ #500 EQ 0 ] GOTO91
IF [ #501 EQ 0 ] GOTO92
IF [ #502 EQ 0 ] GOTO93 
IF [ #10800 EQ 4 ] GOTO95
IF [ #10800 GT 4 ] GOTO96
GOTO94

( ALARMS ) 
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N91 
#3000= 1 (NO OFFSETS APPLIED TO G154 P80 SET MACRO #10800 TO ZERO AND RESTART PROBING PROCESS) 
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N92 
#3000= 2 (NO OFFSETS APPLIED TO G154 P81 SET MACRO #10800 TO ZERO AND RESTART PROBING PROCESS) 
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N93 
#3000= 3 (NO OFFSETS APPLIED TO G154 P82 SET MACRO #10800 TO ZERO AND RESTART PROBING PROCESS)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N94
#3000= 4 (NO OFFSETS APPLIED TO G154 P80, G154 P81 OR G154 P82 / SET MACRO #10800 TO ZERO AND RESTART PROCESS)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N95
#3000= 5 (PROBING CYCLE IS COMPLETE / MRZP VALUES SETTING 255=#10121/ SETTING 256=#10122/ SETTING 256=#10123/ RUN THE PROGRAM AGAIN TO CLEAR MACROS AND OFFSETS USED DURING THIS PROCESS)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N96
G103P1
#10800=0
#10801=0
#500=0
#501=0
#502=0
#502=0
#600=0
#601=0
#602=0
#701=0
#702=0
#703=0
#704=0
#705=0
#706=0
#10998=0
#10999=0
#10711=0
#10712=0
#10714=0
#10724=0
#10713=0
#10721=0
#10722=0
#10723=0
#15581=0
#15582=0
#15583=0
#15584=0
#15585=0
#15586=0
#15601=0
#15602=0
#15603=0
#15604=0
#15605=0
#15606=0
#15621=0
#15622=0
#15623=0
#15624=0
#15625=0
#15626=0
#15643=0
#3901=0
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
#3000= 7(MACROS AND OFFSETS HAVE BEEN CLEARED YOU MAY BEGIN TO PROBE THE NEXT AXIS)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)

N97
#10800=0
(CHECK OFFSETS FOR VALUES)
#500=#15581+#15582+#15583(P80)
#501=#15601+#15602+#15603(P81) 
#502=#15621+#15622+#15623(P82)  
#503=#500+#501+#502

IF [ #503 LT 0 ] GOTO98
#3901=0
GOTO107 

(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N98
#3000= 8 (WORK OFFSETS G154 P80, P81 AND P82 MUST BE SET TO ZERO BEFORE PROCEEDING)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N99
#3000= 9 (ERROR / PLEASE INDICATE YOUR ROTARY SURFACE FLAT OR STRAIGHT WITHIN .002" / RESET YOUR TOOL CHANGE OFFSET IF NEEDED)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N101
#3000= 10 (CALIBRATION UNIT IS TOO CLOSE THE CENTERLINE OF ROTATION PLEASE ADJUST IT AND START THE PROCESS OVER)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N102
#3000= 11 (PROBE IS NOT CALIBRATED / PLEASE CALIBRATE PROBE AND START PROCESS OVER)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N103
#3000= 12 (SETTING 254 MUST BE SET TO ZERO FOR ACCURATE MRZP VALUES)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
N104 
#3000= 13 (NO B CALL IN G65 LINE) 
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)
(************************************************************************************************************************)



%