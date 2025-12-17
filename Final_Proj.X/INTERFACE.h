#ifndef INTERFACE_H 
#define INTERFACE_H
#include "TIC_TAC_TOE.h"
#include "WHAC_A_MOLE.h"
#include "REACTION_GAME.h"


typedef struct{
    int PROCESS; //-1 0 1/ 2 3/ 4 5/ 6
    int GAME_STATE;
    int P1_PRESS;
    int P2_PRESS;
    int ADC_VALUE;
} GAME_CONTROL_TABLE;

typedef struct {
    int GAME_STATE;
    int P1_PREPARE;
    int P2_PREPARE;
}HINT_OUTPUT_TABLE;

typedef struct {
    int WHO_WIN; // -1 eeror ,0 draw ,1 p1 win ,2 p2win
    int P1_WIN_AMOUNT;
    int P2_WIN_AMOUNT;
}END_OUTPUT_TABLE;

#define STATE_IDLE 0
#define STATE_PLAYING 1
#define STATE_GAMEOVER 2

//UART
void START_OUTPUT(void);
void HINT_OUTPUT(HINT_OUTPUT_TABLE HO_TABLE);
void TTT_OUTPUT(TTT_OUTPUT_TABLE TTTO_TABLE);
void REACTION_OUTPUT(REACTION_OUTPUT_TABLE REACTO_TABLE);
void WHAC_A_MOLE_OUTPUT(WHAC_A_MOLE_OUTPUT_TABLE WAWO_TABLE);
void END_OUTPUT(END_OUTPUT_TABLE EO_TABLE);

#endif
