%9811
;Renishow style XYZ measure cycle for HNC8 by BM

;Input variables
;#223 - X target
;#224 - Y target
;#225 - Z target
;#217 - Q - Overtravel
;#219 - S - Coordinate system to update 

;Output variables
;#500 - Measured position

#40=500 ;Fast probing speed
#41=10 ;Slow probing speed
#42=4.75/2 ;Probe radius
#43=1 ;Travel back distance after touch
#44=1 ;Overtravel of second touch
#45=16 ;Probe tool number

;Claculate WCS starting variable number
IF[#219 LE 6]
    #3 = 1040+[#219-1]*10
ENDIF
IF[#219 GT 100]
    #3 = 40100+[#219-1]*9
ENDIF

;Get tool length compensation number
#4 = 1040+[#219-1]*10


IF[AR[#223] EQ 90] ;X probing
    #1 = SIGN[#223-#1000] ;Get movement direction
    #2 = #223+#217*#1
    G31 G1 X[#2] F[#40]
    IF[#1020 EQ #2]
        ;Rise error! Surface not found
    ELSE
        G90
        G0 X[#43*[-#1]]
        G31 G1 X[[#43+#44]*#1] F[#41]
        IF[AR[#219] GT 0]
            #3=#1000-#223+#42*#1
        ENDIF
        #500=#1000+#42*#1
        G0 X[#43*[-#1]]
        G91
    ENDIF
ENDIF

IF[AR[#224] EQ 90] ;Y probing
    #1 = SIGN[#224-#1001] ;Get movement direction
    #2 = #224+#217*#1
    G31 G1 Y[#2] F[#40]
    IF[#1021 EQ #2]
        ;Rise error! Surface not found
    ELSE
        G90
        G0 Y[#43*[-#1]]
        G31 G1 Y[[#43+#44]*#1] F[#41]
        IF[AR[#219] GT 0]
            #[#3+1]=#1001-#224+#42*#1
        ENDIF
        #500=#1001+#42*#1
        G0 Y[#43*[-#1]]
        G91
    ENDIF
ENDIF

IF[AR[#225] EQ 90] ;Z probing
    IF[#225 LT #1002] ;Get movement direction
        G31 G1 Z[#225-#217] F[#40]
        IF[#1023 EQ #225-#217]
            ;Rise error! Surface not found
        ELSE
            G90
            G0 Z[#43]
            G31 G1 Z[-#43-#44] F[#41]
            IF[AR[#219] GT 0]
                #[#3+2]=#1002-#4-#225
            ENDIF
            #500=#1002-#[70006+[#45-1]*200]
            G0 Y[#43*[-#1]]
            G91
        ENDIF
    ENDIF
ENDIF

M99
%