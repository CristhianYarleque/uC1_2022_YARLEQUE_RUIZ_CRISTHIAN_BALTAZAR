; @archivo: PRACTICA03.s
; @brief: Este programa es un contador ascendente/descendente de 0 a 99 uitiliozando un display ánodo común y un decodificador 74LS47
; @fecha: 13/01/2023
; @autor: Cristhian  Baltazar  Yarleque  Ruiz
    
PROCESSOR 18F57Q84

#include "Bit_Config.inc"  /*config statements should precede project file includes.*/
#include <xc.inc>
#include "Retardos1.inc"
    
PSECT resetVect Class=CODE, reloc=2
    
resectVect:
GOTO Main

PSECT CODE
Main:
 CALL Config_osc
 CALL Config_port
    
 BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
 GOTO NUMERO_0
 GOTO NUMERO_99
 
    ;PORTD <0,3> como unidades
    ;PORTD <4,7> como decenas
     
    NUMERO_0: 
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BCF LATB,1,1     ;PORTB<1> =0   
     BCF LATB,2,1     ;PORTB<2> =0
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_1
     GOTO NUMERO_99
    
    
    NUMERO_1:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_2
     GOTO NUMERO_0
    
    NUMERO_2:
     BANKSEL PORTD   
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_3
     GOTO NUMERO_1    
     
    NUMERO_3:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_4
     GOTO NUMERO_2
   
    NUMERO_4:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_5
     GOTO NUMERO_3
     
    NUMERO_5:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_6
     GOTO NUMERO_4
     
    NUMERO_6:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_7
     GOTO NUMERO_5
     
    NUMERO_7:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_8
     GOTO NUMERO_6
     
    NUMERO_8:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_9
     GOTO NUMERO_7
     
    NUMERO_9:  
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BCF LATB,1,1     ;PORTB<1> =0   
     BCF LATB,2,1     ;PORTB<2> =0
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades 
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0  
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_10
     GOTO NUMERO_8
     
    NUMERO_10: 
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BCF LATB,1,1     ;PORTB<1> =0   
     BCF LATB,2,1     ;PORTB<2> =0
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades 
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_11
     GOTO NUMERO_9
    
    NUMERO_11:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_12
     GOTO NUMERO_10
    
    NUMERO_12:
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_13
     GOTO NUMERO_11    
     
    NUMERO_13:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_14
     GOTO NUMERO_12
   
    NUMERO_14:  
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_15
     GOTO NUMERO_13
     
    NUMERO_15:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_16
     GOTO NUMERO_14
     
    NUMERO_16:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0   
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_17
     GOTO NUMERO_15
     
    NUMERO_17:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_18
     GOTO NUMERO_16
     
    NUMERO_18:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_19
     GOTO NUMERO_17
     
    NUMERO_19:  
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BCF LATB,1,1     ;PORTB<1> =0   
     BCF LATB,2,1     ;PORTB<2> =0
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades 
     BANKSEL PORTD
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0  
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_20
     GOTO NUMERO_18
   
    NUMERO_20: 
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BCF LATB,1,1     ;PORTB<1> =0   
     BSF LATB,2,1     ;PORTB<2> =0
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades 
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_21
     GOTO NUMERO_19
    
    
    NUMERO_21:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_22
     GOTO NUMERO_20
    
    NUMERO_22:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_23
     GOTO NUMERO_21    
     
    NUMERO_23:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_24
     GOTO NUMERO_22
   
    NUMERO_24:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_25
     GOTO NUMERO_23
     
    NUMERO_25:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_26
     GOTO NUMERO_24
     
    NUMERO_26:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_27
     GOTO NUMERO_25
     
    NUMERO_27:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_28
     GOTO NUMERO_26
     
    NUMERO_28:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_29
     GOTO NUMERO_27
     
    NUMERO_29:  
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BCF LATB,1,1     ;PORTB<1> =0   
     BSF LATB,2,1     ;PORTB<2> =1
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades 
     BANKSEL PORTD
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0  
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_30
     GOTO NUMERO_28
 
   NUMERO_30: 
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BCF LATB,1,1     ;PORTB<1> =0   
     BSF LATB,2,1     ;PORTB<2> =1
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades 
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_31
     GOTO NUMERO_29
    
    
    NUMERO_31:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_32
     GOTO NUMERO_30
    
    NUMERO_32:
     BANKSEL PORTD   
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_33
     GOTO NUMERO_31    
     
    NUMERO_33:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_34
     GOTO NUMERO_32
   
    NUMERO_34:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_35
     GOTO NUMERO_33
     
    NUMERO_35:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_36
     GOTO NUMERO_34
     
    NUMERO_36:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_37
     GOTO NUMERO_35
     
    NUMERO_37:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_38
     GOTO NUMERO_36
     
    NUMERO_38:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_39
     GOTO NUMERO_37
     
    NUMERO_39:  
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BCF LATB,1,1     ;PORTB<1> =0   
     BSF LATB,2,1     ;PORTB<2> =1
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades 
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_40
     GOTO NUMERO_38
    NUMERO_40: 
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BSF LATB,1,1     ;PORTB<1> =1   
     BCF LATB,2,1     ;PORTB<2> =0
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_41
     GOTO NUMERO_39
    
    
    NUMERO_41:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_42
     GOTO NUMERO_40
    
    NUMERO_42:
     BANKSEL PORTD   
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_43
     GOTO NUMERO_41    
     
    NUMERO_43:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_44
     GOTO NUMERO_42
   
    NUMERO_44:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_45
     GOTO NUMERO_43
     
    NUMERO_45:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_46
     GOTO NUMERO_44
     
    NUMERO_46:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_47
     GOTO NUMERO_45
     
    NUMERO_47:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_48
     GOTO NUMERO_46
     
    NUMERO_48:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_49
     GOTO NUMERO_47
     
    NUMERO_49:  
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BSF LATB,1,1     ;PORTB<1> =1 
     BCF LATB,2,1     ;PORTB<2> =0
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades
     BANKSEL PORTD   
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0  
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_50
     GOTO NUMERO_48
     
  NUMERO_50: 
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BSF LATB,1,1     ;PORTB<1> =1  
     BCF LATB,2,1     ;PORTB<2> =0
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_51
     GOTO NUMERO_49
    
    
    NUMERO_51:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_52
     GOTO NUMERO_50
    
    NUMERO_52:
     BANKSEL PORTD   
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_53
     GOTO NUMERO_51    
     
    NUMERO_53:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_54
     GOTO NUMERO_52
   
    NUMERO_54:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_55
     GOTO NUMERO_53
     
    NUMERO_55:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_56
     GOTO NUMERO_54
     
    NUMERO_56:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_57
     GOTO NUMERO_55
     
    NUMERO_57:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_58
     GOTO NUMERO_56
     
    NUMERO_58:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_59
     GOTO NUMERO_57
     
    NUMERO_59:  
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BSF LATB,1,1     ;PORTB<1> =1   
     BCF LATB,2,1     ;PORTB<2> =0
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades 
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0  
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_60
     GOTO NUMERO_58
  
    NUMERO_60: 
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BSF LATB,1,1     ;PORTB<1> =1
     BSF LATB,2,1     ;PORTB<2> =1
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_61
     GOTO NUMERO_59
    
    
    NUMERO_61:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_62
     GOTO NUMERO_60
    
    NUMERO_62:
     BANKSEL PORTD   
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_63
     GOTO NUMERO_61    
     
    NUMERO_63:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_64
     GOTO NUMERO_62
   
    NUMERO_64:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_65
     GOTO NUMERO_63
     
    NUMERO_65:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_66
     GOTO NUMERO_64
     
    NUMERO_66:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_67
     GOTO NUMERO_65
     
    NUMERO_67:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_68
     GOTO NUMERO_66
     
    NUMERO_68:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_69
     GOTO NUMERO_67
     
    NUMERO_69:  
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BSF LATB,1,1     ;PORTB<1> =1   
     BSF LATB,2,1     ;PORTB<2> =1
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades 
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0  
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_70
     GOTO NUMERO_68
     
    NUMERO_70: 
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BSF LATB,1,1     ;PORTB<1> =1  
     BSF LATB,2,1     ;PORTB<2> =1
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_71
     GOTO NUMERO_69
    
    
    NUMERO_71:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_72
     GOTO NUMERO_70
    
    NUMERO_72:
     BANKSEL PORTD   
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_73
     GOTO NUMERO_71    
     
    NUMERO_73:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_74
     GOTO NUMERO_72
   
    NUMERO_74:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_75
     GOTO NUMERO_73
     
    NUMERO_75:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_76
     GOTO NUMERO_74
     
    NUMERO_76:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_77
     GOTO NUMERO_75
     
    NUMERO_77:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_78
     GOTO NUMERO_76
     
    NUMERO_78:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_79
     GOTO NUMERO_77
     
    NUMERO_79:  
     BANKSEL PORTB
     ;Decenas
     BCF LATB,0,1     ;PORTB<0> =0
     BSF LATB,1,1     ;PORTB<1> =1   
     BSF LATB,2,1     ;PORTB<2> =1
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades 
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0  
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_80
     GOTO NUMERO_78
     
    NUMERO_80: 
     BANKSEL PORTB
     ;Decenas
     BSF LATB,0,1     ;PORTB<0> =1
     BCF LATB,1,1     ;PORTB<1> =0   
     BCF LATB,2,1     ;PORTB<2> =0
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_81
     GOTO NUMERO_79
    
    
    NUMERO_81:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_82
     GOTO NUMERO_80
    
    NUMERO_82:
     BANKSEL PORTD   
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_83
     GOTO NUMERO_81    
     
    NUMERO_83:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_84
     GOTO NUMERO_82
   
    NUMERO_84:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_85
     GOTO NUMERO_83
     
    NUMERO_85:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_86
     GOTO NUMERO_84
     
    NUMERO_86:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_87
     GOTO NUMERO_85
     
    NUMERO_87:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_88
     GOTO NUMERO_86
     
    NUMERO_88:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_89
     GOTO NUMERO_87
     
    NUMERO_89:  
     BANKSEL PORTB
     ;Decenas
     BSF LATB,0,1     ;PORTB<0> =1
     BCF LATB,1,1     ;PORTB<1> =0   
     BCF LATB,2,1     ;PORTB<2> =0
     BCF LATB,3,1     ;PORTB<3> =0

     ;Unidades 
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0  
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_90
     GOTO NUMERO_88
     
    NUMERO_90: 
     BANKSEL PORTB
     ;Decenas
     BSF LATB,0,1     ;PORTB<0> =1
     BCF LATB,1,1     ;PORTB<1> =0   
     BCF LATB,2,1     ;PORTB<2> =0
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_91
     GOTO NUMERO_89
    
    
    NUMERO_91:
     BANKSEL PORTD  
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s 
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_92
     GOTO NUMERO_90
    
    NUMERO_92:
     BANKSEL PORTD   
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_93
     GOTO NUMERO_91    
     
    NUMERO_93:
     BANKSEL PORTD
     BCF LATD,0,1     ;PORTD<0> =0
     BCF LATD,1,1     ;PORTD<1> =0   
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_94
     GOTO NUMERO_92
   
    NUMERO_94:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1  
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_95
     GOTO NUMERO_93
     
    NUMERO_95:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1 
     BCF LATD,2,1     ;PORTD<2> =0
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_96
     GOTO NUMERO_94
     
    NUMERO_96:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_97
     GOTO NUMERO_95
     
    NUMERO_97:  
     BANKSEL PORTD 
     BCF LATD,0,1     ;PORTD<0> =0
     BSF LATD,1,1     ;PORTD<1> =1
     BSF LATD,2,1     ;PORTD<2> =1
     BSF LATD,3,1     ;PORTD<3> =1 
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_98
     GOTO NUMERO_96
     
    NUMERO_98:  
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0
     BCF LATD,3,1     ;PORTD<3> =0  
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_99
     GOTO NUMERO_97
     
    NUMERO_99:  
     BANKSEL PORTB
     ;Decenas
     BSF LATB,0,1     ;PORTB<0> =1
     BCF LATB,1,1     ;PORTB<1> =0   
     BCF LATB,2,1     ;PORTB<2> =0
     BSF LATB,3,1     ;PORTB<3> =1

     ;Unidades 
     BANKSEL PORTD 
     BSF LATD,0,1     ;PORTD<0> =1
     BCF LATD,1,1     ;PORTD<1> =0
     BCF LATD,2,1     ;PORTD<2> =0  
     BSF LATD,3,1     ;PORTD<3> =1
     CALL Delay_1s    ;Retardo de 1s

     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     GOTO NUMERO_0
     GOTO NUMERO_98
    
Config_osc:
    ;Configiración del oscilador interno a una frecuencia de 4MHz
    BANKSEL OSCCON1
    MOVLW 0x60     ;Seleccionamos el bloque del osc interno con un div:1
    MOVWF OSCCON1 
    MOVLW 0x02     ;seleccionamos una frecuencia de 4MHz
    MOVWF OSCFRQ,1
    RETURN
    
Config_port:

    ;Puerto B
    BANKSEL PORTD
    CLRF PORTB,1    ;PORTB=0 
    CLRF LATB,1     ;PORTB=0 
    CLRF ANSELB,1   ; PORTB digital
    CLRF TRISB,1    ;PORTB como salida
    
    ;Puerto D
    BANKSEL PORTD
    CLRF PORTD,1    ;PORTD=0 
    CLRF LATD,1     ;PORTD=0
    CLRF ANSELD,1   ; PORTD digital
    CLRF TRISD,1    ;PORTD como salida
    
    ;Config button
    BANKSEL PORTA
    CLRF    PORTA,1	;PORTA<7,0> = 0
    CLRF    ANSELA,1	;PORTA DIGITAL
    BSF	    TRISA,3,1	;PORTA <3> COMO ENTRADA
    BSF	    WPUA,3,1	;ACTIVAMOS LA RESISTENCIA PULLUP
    
RETURN
    
END resectVect




