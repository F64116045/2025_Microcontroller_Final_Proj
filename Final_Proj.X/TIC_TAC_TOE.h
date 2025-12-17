#ifndef TTT_GAME
#define TTT_GAME

typedef struct {
        /***
        board: 0 is O, 1 is X, -1 is non-fill
        0,1,2
        3,4,5
        6,7,8
        curplayer: 0 is O, 1 is X (who lead board change this time)
        detwinner: 0 no winner, 1 has winner
        success: the move legal or not
    ***/
	int BOARD[9];
	int CURPLAYER;
	int DETWINNER;
	int SUCCESS;
    int CURSOR;
} TTT_OUTPUT_TABLE;

TTT_OUTPUT_TABLE TTT_START(TTT_OUTPUT_TABLE TTTO_TABLE);// initialize
TTT_OUTPUT_TABLE TTT_UPDATE(TTT_OUTPUT_TABLE TTTO_TABLE,int P1_PRESS,int P2_PRESS,int CURSOR);
void printBoard(TTT_OUTPUT_TABLE gameState);
int detwinner(int i);

#endif