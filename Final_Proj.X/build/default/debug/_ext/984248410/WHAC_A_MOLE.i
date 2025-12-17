# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/WHAC_A_MOLE.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 285 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/WHAC_A_MOLE.c" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/musl_xc8.h" 1 3
# 5 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 2 3





# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/features.h" 1 3
# 11 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 2 3
# 21 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 1 3
# 24 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef long int wchar_t;
# 128 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned size_t;
# 174 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef __int24 int24_t;
# 210 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef __uint24 uint24_t;
# 22 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 2 3

int atoi (const char *);
long atol (const char *);

long long atoll (const char *);

double atof (const char *);


float strtof (const char *restrict, char **restrict);
double strtod (const char *restrict, char **restrict);
long double strtold (const char *restrict, char **restrict);



long strtol (const char *restrict, char **restrict, int);
unsigned long strtoul (const char *restrict, char **restrict, int);

long long strtoll (const char *restrict, char **restrict, int);
unsigned long long strtoull (const char *restrict, char **restrict, int);


unsigned long __strtoxl(const char * s, char ** endptr, int base, char is_signed);

unsigned long long __strtoxll(const char * s, char ** endptr, int base, char is_signed);
# 55 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 3
int rand (void);
void srand (unsigned);

void *malloc (size_t);
void *calloc (size_t, size_t);
void *realloc (void *, size_t);
void free (void *);

          void abort (void);
int atexit (void (*) (void));
          void exit (int);
          void _Exit (int);

void *bsearch (const void *, const void *, size_t, size_t, int (*)(const void *, const void *));







__attribute__((nonreentrant)) void qsort (void *, size_t, size_t, int (*)(const void *, const void *));

int abs (int);
long labs (long);

long long llabs (long long);


typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;

typedef struct { long long quot, rem; } lldiv_t;


div_t div (int, int);
ldiv_t ldiv (long, long);

lldiv_t lldiv (long long, long long);


typedef struct { unsigned int quot, rem; } udiv_t;
typedef struct { unsigned long quot, rem; } uldiv_t;
udiv_t udiv (unsigned int, unsigned int);
uldiv_t uldiv (unsigned long, unsigned long);
# 2 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/WHAC_A_MOLE.c" 2
# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/INTERFACE.h" 1


# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/TIC_TAC_TOE.h" 1



typedef struct {
# 14 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/TIC_TAC_TOE.h"
 int BOARD[9];
 int CURPLAYER;
 int DETWINNER;
 int SUCCESS;
    int CURSOR;
} TTT_OUTPUT_TABLE;

TTT_OUTPUT_TABLE TTT_START(TTT_OUTPUT_TABLE TTTO_TABLE);
TTT_OUTPUT_TABLE TTT_UPDATE(TTT_OUTPUT_TABLE TTTO_TABLE,int P1_PRESS,int P2_PRESS,int CURSOR);
void printBoard(TTT_OUTPUT_TABLE gameState);
int detwinner(int i);
# 4 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/INTERFACE.h" 2
# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/WHAC_A_MOLE.h" 1



typedef struct {
 int SCORE_P1;
  int SCORE_P2;
 int WHAC_A_MOLE[9];
 char INPUT;
 int HIT;
 int MISS;
 int NOT_HIT_NOT_MISS;
 long REMAINING_TIME;
  int WINNER;
  unsigned long tick100us;
 int PLAYER1_STATE;
 int PLAYER2_STATE;
}WHAC_A_MOLE_OUTPUT_TABLE;

WHAC_A_MOLE_OUTPUT_TABLE WHAC_A_MOLE_UPDATE(WHAC_A_MOLE_OUTPUT_TABLE WAWO_TABLE);
WHAC_A_MOLE_OUTPUT_TABLE WHAC_A_MOLE_UPDATE_WHO_WIN(WHAC_A_MOLE_OUTPUT_TABLE WAWO_TABLE);
# 5 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/INTERFACE.h" 2
# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/REACTION_GAME.h" 1



typedef struct {
 int RANDOM_NUMBER;
 int DISPLAY_NUMBER_1;
 int DISPLAY_NUMBER_2;
    int P1_RESULT;
    int P2_RESULT;
    int WINNER;
    unsigned long tick100us;
    int PLAYER1_STATE;
    int PLAYER2_STATE;
} REACTION_OUTPUT_TABLE;

REACTION_OUTPUT_TABLE REACTION_START(REACTION_OUTPUT_TABLE REACTO_TABLE);
REACTION_OUTPUT_TABLE REACTION_UPDATE(REACTION_OUTPUT_TABLE REACTO_TABLE);
REACTION_OUTPUT_TABLE REACTION_UPDATE_WHO_WIN(REACTION_OUTPUT_TABLE REACTO_TABLE);
# 6 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/INTERFACE.h" 2


typedef struct{
    int PROCESS;
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
    int WHO_WIN;
    int P1_WIN_AMOUNT;
    int P2_WIN_AMOUNT;
}END_OUTPUT_TABLE;






void START_OUTPUT(void);
void HINT_OUTPUT(HINT_OUTPUT_TABLE HO_TABLE);
void TTT_OUTPUT(TTT_OUTPUT_TABLE TTTO_TABLE);
void REACTION_OUTPUT(REACTION_OUTPUT_TABLE REACTO_TABLE);
void WHAC_A_MOLE_OUTPUT(WHAC_A_MOLE_OUTPUT_TABLE WAWO_TABLE);
void END_OUTPUT(END_OUTPUT_TABLE EO_TABLE);
# 3 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/WHAC_A_MOLE.c" 2



static int active_mole = -1;
static int prev_player1_state = 0;
static int prev_player2_state = 0;
static long spawn_counter = 0;
static long stay_counter = 0;
static long spawn_interval_ticks = 0;
static long stay_time_ticks = 0;
static unsigned long last_tick = 0;

WHAC_A_MOLE_OUTPUT_TABLE WHAC_A_MOLE_UPDATE(WHAC_A_MOLE_OUTPUT_TABLE table) {
    unsigned long current_tick = table.tick100us;
    unsigned long delta_ticks = current_tick - last_tick;
    last_tick = current_tick;


    table.HIT = 0;
    table.MISS = 0;
    table.NOT_HIT_NOT_MISS = 1;

    spawn_interval_ticks = 1600;
    stay_time_ticks = 3200;


    int input_idx = -1;
    if (table.INPUT >= '1' && table.INPUT <= '9') {
        input_idx = table.INPUT - '1';
    }


    int *current_score = ((void*)0);
    int current_playing = 0;


    if (table.PLAYER1_STATE == 1 && prev_player1_state != 1) {

        table.SCORE_P1 = 0;
        table.REMAINING_TIME = (long)(60.0 * 4000);
        active_mole = -1;
        spawn_counter = 0;
        for(int j=0; j<9; j++)
            table.WHAC_A_MOLE[j] = 0;
        srand(table.tick100us);
    }

    if (table.PLAYER2_STATE == 1 && prev_player2_state != 1) {

        table.SCORE_P2 = 0;
        table.REMAINING_TIME = (long)(60.0 * 4000);
        active_mole = -1;
        spawn_counter = 0;
        for(int j=0; j<9; j++)
            table.WHAC_A_MOLE[j] = 0;
        srand(table.tick100us);
    }


    if (table.PLAYER1_STATE == 1) {

        current_playing = 1;
        current_score = &table.SCORE_P1;
    } else if (table.PLAYER2_STATE == 1) {

        current_playing = 2;
        current_score = &table.SCORE_P2;
    }


    if (current_playing != 0) {


        if (table.REMAINING_TIME > 0) {
            table.REMAINING_TIME -= delta_ticks;
        }


        if (input_idx != -1) {
            if (active_mole == input_idx) {

                (*current_score) += 10;
                table.HIT = 1;
                table.NOT_HIT_NOT_MISS = 0;
                table.WHAC_A_MOLE[input_idx] = 0;
                active_mole = -1;
                spawn_counter = 0;
            } else {

                (*current_score) -= 5;
                table.MISS = 1;
                table.NOT_HIT_NOT_MISS = 0;
            }
        }


        if (active_mole == -1) {
            spawn_counter += delta_ticks;
            if (spawn_counter >= spawn_interval_ticks) {
                spawn_counter = 0;
                active_mole = rand() % 9;
                table.WHAC_A_MOLE[active_mole] = 1;
                stay_counter = 0;
            }
        } else {
            stay_counter += delta_ticks;
            if (stay_counter >= stay_time_ticks) {

                (*current_score) -= 2;
                table.MISS = 1;
                table.NOT_HIT_NOT_MISS = 0;
                table.WHAC_A_MOLE[active_mole] = 0;
                active_mole = -1;
                spawn_counter = 0;
            }
        }
    }


    else {
         for(int j=0; j<9; j++) table.WHAC_A_MOLE[j] = 0;
         active_mole = -1;
    }

    prev_player1_state = table.PLAYER1_STATE;
    prev_player2_state = table.PLAYER2_STATE;
    table.INPUT = 0;

    return table;
}


WHAC_A_MOLE_OUTPUT_TABLE WHAC_A_MOLE_UPDATE_WHO_WIN(WHAC_A_MOLE_OUTPUT_TABLE table) {


    if (table.SCORE_P1 > table.SCORE_P2) {
        table.WINNER = 1;
    }
    else if (table.SCORE_P1 < table.SCORE_P2) {
        table.WINNER = 2;
    }
    else if (table.SCORE_P1 == table.SCORE_P2) {
        table.WINNER = 0;
    }
    else {
        table.WINNER = -1;
    }

    return table;

}
