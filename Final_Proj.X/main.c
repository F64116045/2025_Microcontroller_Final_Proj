#include <xc.h>
#include"INTERFACE.h"
#include"uart.h"
#pragma config OSC = INTIO67 // Oscillator Selection bits
#pragma config WDT = OFF     // Watchdog Timer Enable bit
#pragma config PWRT = OFF    // Power-up Enable bit
#pragma config BOREN = ON    // Brown-out Reset Enable bit
#pragma config PBADEN = OFF  // Watchdog Timer Enable bit
#pragma config LVP = OFF     // Low Voltage (single -supply) In-Circute Serial Pragramming Enable bit
#pragma config CPD = OFF     // Data EEPROM?Memory Code Protection bit (Data EEPROM code protection off)

volatile GAME_CONTROL_TABLE GC_TABLE;
volatile TTT_OUTPUT_TABLE TTTO_TABLE;
volatile REACTION_OUTPUT_TABLE REACTO_TABLE;
volatile WHAC_A_MOLE_OUTPUT_TABLE WAWO_TABLE;
volatile END_OUTPUT_TABLE EO_TABLE;
volatile HINT_OUTPUT_TABLE HO_TABLE;



void delay(volatile unsigned long t) {
    while (t--);
}

void CLEAR_PRESS(volatile GAME_CONTROL_TABLE *GC){
    GC->P1_PRESS = 0;
    GC->P2_PRESS = 0;
}

void GameSwiching(int a){
    EO_TABLE.P1_WIN_AMOUNT+=(a == 1);
    EO_TABLE.P2_WIN_AMOUNT+=(a == 2);
    GC_TABLE.PROCESS++;
    GC_TABLE.GAME_STATE++;
    CLEAR_PRESS(&GC_TABLE);
}

void CONFIG_INITIALIZE(void){
    //
    OSCCONbits.IRCF = 0b111;
    
    //output input configuration
    TRISB = 0b00000011; // two button
    TRISA = 1; //adc ouput

    //ADC and ADC INTERUPt SETTING
    ADCON2 = 0b00001000;
    ADCON1 = 0b00001110;
    ADCON0 = 0b00000001;

    PIE1bits.ADIE = 0;
    PIR1bits.ADIF = 0;
    IPR1bits.ADIP = 0;

    //BUTTON INTERUPT SETTING
    INTCONbits.INT0IF = 0; // button 1 RB 0
    INTCONbits.INT0IE = 1;
    INTCON3bits.INT1IF = 0; //button 2 RB 1
    INTCON3bits.INT1IE = 1;
    INTCON3bits.INT1IP = 1;

    //TIMER INTERUPT SETTIMH
    PIR1bits.TMR2IF = 0;
    PIE1bits.TMR2IE = 1;
    IPR1bits.TMR2IP = 0;
    PR2 = 1;  
    T2CON = 0b01111011; //  t2con not start yet


    //GENERAL INTERUPRT SETTING
    RCONbits.IPEN = 1;
    INTCONbits.GIEH = 1;
    INTCONbits.GIEL = 1;
}

void GC_TABLE_INITIALIZE(void){
    GC_TABLE.ADC_VALUE = 0;
    GC_TABLE.GAME_STATE = 0;
    GC_TABLE.P1_PRESS = 0;
    GC_TABLE.P2_PRESS = 0;
    GC_TABLE.PROCESS = -1;
}

void EO_TABLE_INITIALIZE(void){
    EO_TABLE.P1_WIN_AMOUNT = 0;
    EO_TABLE.P2_WIN_AMOUNT = 0;
    EO_TABLE.WHO_WIN = -1;
}

void REACTION_OUTPUT_TABLE_INITIALIZE(void){
    REACTO_TABLE.PLAYER1_STATE = 0;
    REACTO_TABLE.PLAYER2_STATE = 0;
    REACTO_TABLE.tick100us = 0;
    REACTO_TABLE.WINNER = -1;
}
void WHAC_A_MOLE_OUTPUT_TABLE_INITIALIZE(void){
	WAWO_TABLE.SCORE_P1 = 0;
    WAWO_TABLE.SCORE_P2 = 0;
	WAWO_TABLE.INPUT = 'N';
	WAWO_TABLE.HIT = 0;
	WAWO_TABLE.MISS = 0;
	WAWO_TABLE.NOT_HIT_NOT_MISS = 0;
	WAWO_TABLE.REMAINING_TIME = 0; // 0.001us 
    WAWO_TABLE.WINNER = -1;
    WAWO_TABLE.tick100us= 0 ;//0.001s
	WAWO_TABLE.PLAYER1_STATE = 0;
	WAWO_TABLE.PLAYER2_STATE= 0;
}

HINT_OUTPUT_TABLE WRITE_HO_TABLE(void){
    HINT_OUTPUT_TABLE HO_TABLE_R;
    HO_TABLE_R.GAME_STATE = GC_TABLE.GAME_STATE;
    HO_TABLE_R.P1_PREPARE = GC_TABLE.P1_PRESS;
    HO_TABLE_R.P2_PREPARE = GC_TABLE.P2_PRESS;
    return HO_TABLE_R;
}



void PROCESS_HINT(void){
    while(GC_TABLE.P1_PRESS != 1 || GC_TABLE.P2_PRESS != 1){
        HO_TABLE = WRITE_HO_TABLE();
        HINT_OUTPUT(HO_TABLE);
    }
    //2 player ready
    HO_TABLE = WRITE_HO_TABLE();
    HINT_OUTPUT(HO_TABLE);
     delay(160000);//
    return;
}

void PROCESS_ONE(void){
    TTTO_TABLE = TTT_START(TTTO_TABLE); // include
    while(TTTO_TABLE.DETWINNER == 0){
        if(!ADCON0bits.GO){
            ADCON0bits.GO = 1;
        }
        TTT_OUTPUT(TTTO_TABLE);// include show game progress
    }

    if(TTTO_TABLE.DETWINNER == 1){
        PIE1bits.ADIE = 0;
        TTT_OUTPUT(TTTO_TABLE); // include show winner
    }
      delay(160000);//
    return;
}
//process 3 game2
void PROCESS_THREE(void){
    REACTION_OUTPUT_TABLE_INITIALIZE();
    REACTO_TABLE = REACTION_START(REACTO_TABLE); //  write random number
    T2CONbits.TMR2ON = 1;
    while(REACTO_TABLE.PLAYER1_STATE != 2 || REACTO_TABLE.PLAYER2_STATE !=2){
        if((REACTO_TABLE.PLAYER1_STATE == 0 && REACTO_TABLE.PLAYER2_STATE == 0) || (REACTO_TABLE.PLAYER1_STATE == 2 && REACTO_TABLE.PLAYER2_STATE == 0)){
            REACTO_TABLE.tick100us = 0;
            TMR2 = 0;
        }
        REACTO_TABLE = REACTION_UPDATE(REACTO_TABLE); //include
        REACTION_OUTPUT(REACTO_TABLE);//process
    }
    T2CONbits.TMR2ON = 0;
    REACTO_TABLE = REACTION_UPDATE(REACTO_TABLE); //include
    REACTION_OUTPUT(REACTO_TABLE);//precess
      delay(160000);//
    REACTO_TABLE = REACTION_UPDATE_WHO_WIN(REACTO_TABLE);
    REACTION_OUTPUT(REACTO_TABLE);//who end
       delay(160000);//
    return;
}

void PROCESS_FIVE(void){
    WHAC_A_MOLE_OUTPUT_TABLE_INITIALIZE();
    T2CONbits.TMR2ON = 1;
    while(WAWO_TABLE.PLAYER1_STATE!=2 || WAWO_TABLE.PLAYER2_STATE != 2){
        if((WAWO_TABLE.PLAYER1_STATE == 0 && WAWO_TABLE.PLAYER2_STATE == 0) || (WAWO_TABLE.PLAYER1_STATE == 2 && WAWO_TABLE.PLAYER2_STATE == 0)){
            WAWO_TABLE.tick100us = 0;
            TMR2 =0;
        }
        WAWO_TABLE = WHAC_A_MOLE_UPDATE(WAWO_TABLE);
        if(WAWO_TABLE.REMAINING_TIME<=0){
            if(WAWO_TABLE.PLAYER1_STATE == 1 && WAWO_TABLE.PLAYER2_STATE == 0){
                WAWO_TABLE.PLAYER1_STATE = 2;
            }
            else if(WAWO_TABLE.PLAYER1_STATE == 2 && WAWO_TABLE.PLAYER2_STATE == 1){
                WAWO_TABLE.PLAYER2_STATE = 2;
            }
        }
        WHAC_A_MOLE_OUTPUT(WAWO_TABLE);// if 00 - 10 or 20 - 21 remaning time need to be reset
    }
    T2CONbits.TMR2ON = 0;
    WAWO_TABLE = WHAC_A_MOLE_UPDATE(WAWO_TABLE);
    WHAC_A_MOLE_OUTPUT(WAWO_TABLE);
     delay(160000);//
    WAWO_TABLE = WHAC_A_MOLE_UPDATE_WHO_WIN(WAWO_TABLE);
    WHAC_A_MOLE_OUTPUT(WAWO_TABLE);
     delay(160000);//
    return;
}

void main(void){   
    GC_TABLE_INITIALIZE();
    EO_TABLE_INITIALIZE();
    UART_Initialize();// include
    CONFIG_INITIALIZE();
    START_OUTPUT();//include
    //wait p1 press to start the game;
    while(GC_TABLE.PROCESS != 0);
    
    //process 0
    if(GC_TABLE.PROCESS == 0 && GC_TABLE.GAME_STATE == 1){
        PROCESS_HINT();
    }

    GC_TABLE.PROCESS++;
    CLEAR_PRESS(&GC_TABLE);

    //GAME 1 PROCESS 1
    if(GC_TABLE.PROCESS == 1 && GC_TABLE.GAME_STATE == 1){
        PIE1bits.ADIE = 1;
        PROCESS_ONE();// game 1 is playing
    }
    
    GameSwiching(1+!TTTO_TABLE.CURPLAYER);

    if(GC_TABLE.PROCESS == 2 && GC_TABLE.GAME_STATE == 2){
        PROCESS_HINT();
    }

    GC_TABLE.PROCESS++;
    CLEAR_PRESS(&GC_TABLE);

    if(GC_TABLE.PROCESS == 3 && GC_TABLE.GAME_STATE == 2){
        PROCESS_THREE(); //game 2 is playing
    }

    GameSwiching(REACTO_TABLE.WINNER);

    if(GC_TABLE.PROCESS == 4 && GC_TABLE.GAME_STATE == 3){
        PROCESS_HINT(); //game 2 is playing
    }

    GC_TABLE.PROCESS++;
    CLEAR_PRESS(&GC_TABLE);

    if(GC_TABLE.PROCESS == 5 && GC_TABLE.GAME_STATE == 3){
        PROCESS_FIVE(); //game 3 is playing
    }
    GameSwiching(WAWO_TABLE.WINNER);

    EO_TABLE.WHO_WIN = (EO_TABLE.P1_WIN_AMOUNT < EO_TABLE.P2_WIN_AMOUNT)*2 + (EO_TABLE.P1_WIN_AMOUNT > EO_TABLE.P2_WIN_AMOUNT);
    INTCONbits.INT0IE = 0;
    INTCON3bits.INT1IE = 0;
    while(1)
        END_OUTPUT(EO_TABLE);//include
}

void __interrupt(high_priority) Hi_ISR(void)
{
    if(PIR1bits.RCIF)
    {
    WAWO_TABLE.INPUT = RCREG;
       if(RCSTAbits.OERR)
        {
            CREN = 0;
            Nop();
            CREN = 1;
            PIR1bits.RCIF = 0;
            return;
        }
        
        
        if(GC_TABLE.PROCESS == 5){
            if(RCREG < '1' || RCREG > '9' ){
                WAWO_TABLE.INPUT = 'N';
            }
            else{
                WAWO_TABLE.INPUT = RCREG;
                WAWO_TABLE = WHAC_A_MOLE_UPDATE(WAWO_TABLE);
                WAWO_TABLE.INPUT = RCREG;
                WHAC_A_MOLE_OUTPUT(WAWO_TABLE);
                WAWO_TABLE.INPUT = 'N';
				//delay
            }

        }
        PIR1bits.RCIF = 0;
        return;
    }
    if(INTCONbits.INT0IF == 1){
        if(GC_TABLE.PROCESS == -1){
            delay(60000);//
            GC_TABLE.GAME_STATE++;
            GC_TABLE.PROCESS++;
            INTCONbits.INT0IF = 0;
            return;
        }

        if(GC_TABLE.PROCESS == 0 || GC_TABLE.PROCESS == 2 || GC_TABLE.PROCESS == 4){
            delay(60000);//
            GC_TABLE.P1_PRESS = 1;
            INTCONbits.INT0IF = 0;
            return;
        }

        if(GC_TABLE.PROCESS == 1){
            delay(60000);//
            TTTO_TABLE = TTT_UPDATE(TTTO_TABLE,1,0,TTTO_TABLE.CURSOR);// update TTT_UPDATE(TTT_OUTPUT_TABLE,P1_PRESS,P2_PRESS,ADRESH) return output table include
            INTCONbits.INT0IF = 0;
            return;
        }

        if(GC_TABLE.PROCESS == 3){
            if(REACTO_TABLE.PLAYER1_STATE == 0 && REACTO_TABLE.PLAYER2_STATE == 0){
                delay(60000);//
                REACTO_TABLE.PLAYER1_STATE = 1 ;
            }
            else if(REACTO_TABLE.PLAYER1_STATE == 1 && REACTO_TABLE.PLAYER2_STATE == 0){
                delay(60000);//
                REACTO_TABLE.PLAYER1_STATE = 2 ;
            }
            // 2 0 donothing
            INTCONbits.INT0IF = 0;
            return;
        }

        if(GC_TABLE.PROCESS == 5){
            if(WAWO_TABLE.PLAYER1_STATE == 0 && WAWO_TABLE.PLAYER2_STATE == 0){
                delay(60000);//
                WAWO_TABLE.PLAYER1_STATE = 1 ;
            }
            INTCONbits.INT0IF = 0;
            return;
        }

        INTCONbits.INT0IF = 0;
        return;
    }

    if(INTCON3bits.INT1IF ==1){
        if(GC_TABLE.PROCESS == -1){
            INTCON3bits.INT1IF = 0;
            return;
        }
        
        if(GC_TABLE.PROCESS == 0 || GC_TABLE.PROCESS == 2 || GC_TABLE.PROCESS == 4){
            delay(60000);//
            GC_TABLE.P2_PRESS = 1;
            INTCON3bits.INT1IF = 0;
            return;
        }

        if(GC_TABLE.PROCESS == 1){
            delay(60000);//
            TTTO_TABLE = TTT_UPDATE(TTTO_TABLE,0,1,TTTO_TABLE.CURSOR);
            INTCON3bits.INT1IF = 0;
            return;
        }

         if(GC_TABLE.PROCESS == 3  ){
            if(REACTO_TABLE.PLAYER1_STATE == 2 && REACTO_TABLE.PLAYER2_STATE == 0){
                delay(60000);//
                REACTO_TABLE.PLAYER2_STATE = 1 ;
            }
            else if(REACTO_TABLE.PLAYER1_STATE == 2 && REACTO_TABLE.PLAYER2_STATE == 1){
                delay(60000);//
                REACTO_TABLE.PLAYER2_STATE = 2;
            }
            // 2 2 donothing
            INTCON3bits.INT1IF = 0;
            return;
         }
        
         if(GC_TABLE.PROCESS == 5){
            if(WAWO_TABLE.PLAYER1_STATE == 2 && WAWO_TABLE.PLAYER2_STATE == 0){
                delay(60000);//
                WAWO_TABLE.PLAYER2_STATE = 1 ;
            }
            // 2 2 donothing
            INTCON3bits.INT1IF = 0;
            return;
        }
        INTCON3bits.INT1IF = 0;
        return;
    }
}

void __interrupt(low_priority) Lo_ISR(void)
{
    if(PIR1bits.ADIF == 1){
        GC_TABLE.ADC_VALUE = (ADRESH << 2) + (ADRESL >> 6);
        TTTO_TABLE.CURSOR = GC_TABLE.ADC_VALUE / 114;
        PIR1bits.ADIF = 0;
        return;
    }
    if(PIR1bits.TMR2IF == 1){
        if(GC_TABLE.PROCESS == 3){
            REACTO_TABLE.tick100us++;
        }else if(GC_TABLE.PROCESS == 5){
            WAWO_TABLE.tick100us++;
        }
        PIR1bits.TMR2IF = 0;
        return;    
    }
   
}
