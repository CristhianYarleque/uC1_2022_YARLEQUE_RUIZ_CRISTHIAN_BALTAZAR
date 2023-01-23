; @archivo: PRACTICA02.s
; @brief: Este programa es un contador alfanumérico con un display de 7 segmentos ánodo común.
; @fecha: 13/01/2023
; @autor: Cristhian  Baltazar  Yarleque  Ruiz
    
PROCESSOR 18F57Q84
    
#include "Bit_Config.inc" /*config statements should precede project file includes.*/
#include "Retardos1.inc"
#include <xc.inc>

PSECT resectVect,class=CODE, reloc=2
resectVect:
    GOTO Main

PSECT CODE
Main:
    CALL Config_osc
    CALL Config_port
    NOP
  
BUTTON:
    BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
    GOTO VALORES_NUMERICOS
    GOTO LETRAS
    
    VALORES_NUMERICOS:    
        NUMERO_0:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido   
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1   ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_1
         GOTO LETRAS
 
        NUMERO_1:
         BANKSEL PORTD
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF   
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_2
         GOTO LETRAS
   
        NUMERO_2:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido 
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido   
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_3
         GOTO LETRAS
 
 
        NUMERO_3:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido   
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_4
         GOTO LETRAS

        NUMERO_4:
         BANKSEL PORTD
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido    
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
	 
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_5
         GOTO LETRAS

        NUMERO_5:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido   
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    

         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_6
         GOTO LETRAS
    
        NUMERO_6:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido   
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
    
          BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_7
         GOTO LETRAS
 
        NUMERO_7:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_8
         GOTO LETRAS

        NUMERO_8:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido  
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido  
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
	 
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_9
         GOTO LETRAS
 
        NUMERO_9:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_0
         GOTO LETRAS

    LETRAS:     
        LETRA_A:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido   
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s  
         SETF PORTD,1     ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_0
         GOTO LETRA_B
    
        LETRA_B:
         BANKSEL PORTD
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido   
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s   
         SETF PORTD,1     ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_0
         GOTO LETRA_C
 
        LETRA_C:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido 
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido   
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_0
         GOTO LETRA_D
    
        LETRA_D:
         BANKSEL PORTD
         BCF LATD,1,1     ;PORTD<1> =0, b del display ánodo común encendido
         BCF LATD,2,1     ;PORTD<2> =0, c del display ánodo común encendido  
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido   
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_0
         GOTO LETRA_E
    
        LETRA_E:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido
         BCF LATD,3,1     ;PORTD<3> =0, d del display ánodo común encendido   
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
 
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_0
         GOTO LETRA_F

        LETRA_F:
         BANKSEL PORTD
         BCF LATD,0,1     ;PORTD<0> =0, a del display ánodo común encendido 
         BCF LATD,4,1     ;PORTD<4> =0, e del display ánodo común encendido
         BCF LATD,5,1     ;PORTD<5> =0, f del display ánodo común encendido
         BCF LATD,6,1     ;PORTD<6> =0, g del display ánodo común encendido
         BCF LATD,7,1     ;PORTD<7> =0, dp del display ánodo común encendido
         CALL Delay_1s    ;Retardo de 1s
         SETF PORTD,1     ;PORTD =1, display OFF    
    
         BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
         GOTO NUMERO_0
         GOTO LETRA_A

      
Config_osc:
    ;Configiración del oscilador interno a una frecuencia de 4MHz
    BANKSEL OSCCON1
    MOVLW 0x60     ;Seleccionamos el bloque del osc interno con un div:1
    MOVWF OSCCON1 
    MOVLW 0x02     ;seleccionamos una frecuencia de 4MHz
    MOVWF OSCFRQ,1
    RETURN
    
Config_port:
    
    ;Puerto D
    BANKSEL PORTD
    CLRF PORTD,1    ;PORTD=0
    SETF LATD,1    ;;PORTD=1 display apagado
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





