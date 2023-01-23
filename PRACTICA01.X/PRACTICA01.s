; @archivo: PRACTICA01.s
; @brief: Este es el programa que hace un corrimiento de leds
; @fecha: 13/01/2023
; @autor: Cristhian  Baltazar  Yarleque  Ruiz
    

PROCESSOR 18F57Q84

#include "Bit_Config.inc"  /*config statements should precede project file includes.*/
#include <xc.inc>
#include "Retardos1.inc"
    
PSECT resetVect Class=CODE, reloc=2
    
resectVect:
    Goto Main

PSECT CODE
Main:
    CALL Config_osc
    CALL Config_port
    CALL Config_button

BUTTON:
    BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
    Goto BUTTON

    LED_PAR_ON1: 
     BANKSEL PORTE
     BSF LATE,0,1     ;PORTE<0> =1, LED de visualización par en ON
    
     BSF LATC,1,1     ;PORTC<1>=1 Led ON
     CALL Delay_500ms ;Retardo de 500ms
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     Goto  LED_PAR_ON2
     Goto  LED_PAR_ON1
    
    LED_PAR_ON2:     
     BCF LATC,1,1     ;PORTC<1> =0, LED OFF
     BSF LATC,3,1     ;PORTC<3>=1 Led ON
     CALL Delay_500ms ;Retardo de 500ms
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     Goto  LED_PAR_ON3
     Goto LED_PAR_ON2
    
    LED_PAR_ON3:   
    
     BCF LATC,3,1     ;PORTC<3> =0, LED OFF
     BSF LATC,5,1     ;PORTC<5>=1 Led ON
     CALL Delay_500ms ;Retardo de 500ms
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     Goto  LED_PAR_ON4
     Goto  LED_PAR_ON3
    
    LED_PAR_ON4: 
     BCF LATC,5,1     ;PORTC<5> =0, LED OFF
     BSF LATC,7,1     ;PORTC<7>=1 Led ON
     CALL Delay_500ms ;Retardo de 500ms

     Goto LED_IMPAR_ON1
 
    LED_IMPAR_ON1: 
     Goto Config_port
     BSF LATE,1,1     ;PORTE<1> =1, LED de visualización impar en ON
     
     BSF LATC,0,1     ;PORTC<0>=1 Led ON
     CALL Delay_250ms ;Retardo de 250ms
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     Goto  LED_IMPAR_ON2
     Goto LED_IMPAR_ON1
    
    LED_IMPAR_ON2:
     BCF LATC,0,1     ;PORTC<0> =0, LED OFF
     BSF LATC,2,1     ;PORTC<2>=1 Led ON
     CALL Delay_250ms ;Retardo de 250ms
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     Goto  LED_IMPAR_ON3
     Goto LED_IMPAR_ON2
    
    LED_IMPAR_ON3:
     BCF LATC,2,1     ;PORTC<2> =0, LED OFF
     BSF LATC,4,1     ;PORTC<4>=1 Led ON
     CALL Delay_250ms ;Retardo de 250ms
    
     BTFSC PORTA,3,0  ;PORTA<3>=0? -Button press?
     Goto  LED_IMPAR_ON4
     Goto LED_PAR_ON3

    LED_IMPAR_ON4:
     BCF LATC,4,1     ;PORTC<4> =0, LED OFF
     BSF LATC,6,1     ;PORTC<6>=1 Led ON
     CALL Delay_250ms ;Retardo de 250ms
     BCF LATC,6,1     ;PORTC<6> =0, LED OFF

    Goto LED_PAR_ON1

Config_osc:
    ;Configiración del oscilador interno a una frecuencia de 4MHz
    BANKSEL OSCCON1
    MOVLW 0x60     ;Seleccionamos el bloque del osc interno con un div:1
    MOVWF OSCCON1 
    MOVLW 0x02     ;seleccionamos una frecuencia de 4MHz
    MOVWF OSCFRQ,1
    RETURN
    
Config_port:
    
    ;Puertos de leds de visualisación de corrimiento
    BANKSEL PORTE
    CLRF PORTE,1    ;PORTE=0
    CLRF LATE,1    ;LEDS OFF
    CLRF ANSELE,1	 ;PORTE DIGITAL
    CLRF TRISE,1  ;PORTC como salida
    
    ;Puertos de leds de corrimiento
    BANKSEL PORTC
    CLRF PORTC,1    ;PORTC=0
    CLRF LATC,1     ;LEDDS OFF
    CLRF ANSELC,1   ; PORTC digital
    CLRF TRISC,1    ;PORTC como salida
    
 RETURN
    
Config_button:
    BANKSEL PORTA 
    CLRF PORTA,1    ;PORTA=0
    CLRF ANSELA,1   ; PORTA digital
    BSF TRISA,3,1
    BSF WPUA,3,1   ;Activamos la resistencia  PullUp
    
RETURN
    
END resectVect




