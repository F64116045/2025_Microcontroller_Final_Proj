# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/REACTION_GAME.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 285 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/REACTION_GAME.c" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdio.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/musl_xc8.h" 1 3
# 5 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdio.h" 2 3





# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/features.h" 1 3
# 11 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdio.h" 2 3
# 24 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdio.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 1 3
# 12 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef void * va_list[1];




typedef void * __isoc_va_list[1];
# 128 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned size_t;
# 143 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef __int24 ssize_t;
# 174 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef __int24 int24_t;
# 210 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef __uint24 uint24_t;
# 255 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef long long off_t;
# 409 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef struct _IO_FILE FILE;
# 25 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdio.h" 2 3
# 52 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdio.h" 3
typedef union _G_fpos64_t {
 char __opaque[16];
 double __align;
} fpos_t;

extern FILE *const stdin;
extern FILE *const stdout;
extern FILE *const stderr;





FILE *fopen(const char *restrict, const char *restrict);
FILE *freopen(const char *restrict, const char *restrict, FILE *restrict);
int fclose(FILE *);

int remove(const char *);
int rename(const char *, const char *);

int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
void clearerr(FILE *);

int fseek(FILE *, long, int);
long ftell(FILE *);
void rewind(FILE *);

int fgetpos(FILE *restrict, fpos_t *restrict);
int fsetpos(FILE *, const fpos_t *);

size_t fread(void *restrict, size_t, size_t, FILE *restrict);
size_t fwrite(const void *restrict, size_t, size_t, FILE *restrict);

int fgetc(FILE *);
int getc(FILE *);
int getchar(void);





int ungetc(int, FILE *);
int getch(void);

int fputc(int, FILE *);
int putc(int, FILE *);
int putchar(int);





void putch(char);

char *fgets(char *restrict, int, FILE *restrict);

char *gets(char *);


int fputs(const char *restrict, FILE *restrict);
int puts(const char *);

__attribute__((__format__(__printf__, 1, 2)))
int printf(const char *restrict, ...);
__attribute__((__format__(__printf__, 2, 3)))
int fprintf(FILE *restrict, const char *restrict, ...);
__attribute__((__format__(__printf__, 2, 3)))
int sprintf(char *restrict, const char *restrict, ...);
__attribute__((__format__(__printf__, 3, 4)))
int snprintf(char *restrict, size_t, const char *restrict, ...);

__attribute__((__format__(__printf__, 1, 0)))
int vprintf(const char *restrict, __isoc_va_list);
int vfprintf(FILE *restrict, const char *restrict, __isoc_va_list);
__attribute__((__format__(__printf__, 2, 0)))
int vsprintf(char *restrict, const char *restrict, __isoc_va_list);
__attribute__((__format__(__printf__, 3, 0)))
int vsnprintf(char *restrict, size_t, const char *restrict, __isoc_va_list);

__attribute__((__format__(__scanf__, 1, 2)))
int scanf(const char *restrict, ...);
__attribute__((__format__(__scanf__, 2, 3)))
int fscanf(FILE *restrict, const char *restrict, ...);
__attribute__((__format__(__scanf__, 2, 3)))
int sscanf(const char *restrict, const char *restrict, ...);

__attribute__((__format__(__scanf__, 1, 0)))
int vscanf(const char *restrict, __isoc_va_list);
int vfscanf(FILE *restrict, const char *restrict, __isoc_va_list);
__attribute__((__format__(__scanf__, 2, 0)))
int vsscanf(const char *restrict, const char *restrict, __isoc_va_list);

void perror(const char *);

int setvbuf(FILE *restrict, char *restrict, int, size_t);
void setbuf(FILE *restrict, char *restrict);

char *tmpnam(char *);
FILE *tmpfile(void);




FILE *fmemopen(void *restrict, size_t, const char *restrict);
FILE *open_memstream(char **, size_t *);
FILE *fdopen(int, const char *);
FILE *popen(const char *, const char *);
int pclose(FILE *);
int fileno(FILE *);
int fseeko(FILE *, off_t, int);
off_t ftello(FILE *);
int dprintf(int, const char *restrict, ...);
int vdprintf(int, const char *restrict, __isoc_va_list);
void flockfile(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);
ssize_t getdelim(char **restrict, size_t *restrict, int, FILE *restrict);
ssize_t getline(char **restrict, size_t *restrict, FILE *restrict);
int renameat(int, const char *, int, const char *);
char *ctermid(char *);







char *tempnam(const char *, const char *);
# 2 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/REACTION_GAME.c" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 1 3
# 21 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 1 3
# 24 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef long int wchar_t;
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
# 3 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/REACTION_GAME.c" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/time.h" 1 3
# 33 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/time.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 1 3
# 82 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned long time_t;
# 303 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef void * timer_t;




typedef int clockid_t;




typedef unsigned long clock_t;
# 323 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
struct timespec { time_t tv_sec; long tv_nsec; };





typedef int pid_t;
# 421 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef struct __locale_struct * locale_t;
# 34 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/time.h" 2 3






struct tm {
 int tm_sec;
 int tm_min;
 int tm_hour;
 int tm_mday;
 int tm_mon;
 int tm_year;
 int tm_wday;
 int tm_yday;
 int tm_isdst;
 long __tm_gmtoff;
 const char *__tm_zone;
};

clock_t clock (void);
time_t time (time_t *);
double difftime (time_t, time_t);
time_t mktime (struct tm *);
size_t strftime (char *restrict, size_t, const char *restrict, const struct tm *restrict);
struct tm *gmtime (const time_t *);
struct tm *localtime (const time_t *);
char *asctime (const struct tm *);
char *ctime (const time_t *);
int timespec_get(struct timespec *, int);
# 73 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/time.h" 3
size_t strftime_l (char * restrict, size_t, const char * restrict, const struct tm * restrict, locale_t);

struct tm *gmtime_r (const time_t *restrict, struct tm *restrict);
struct tm *localtime_r (const time_t *restrict, struct tm *restrict);
char *asctime_r (const struct tm *restrict, char *restrict);
char *ctime_r (const time_t *, char *);

void tzset (void);

struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};
# 102 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/time.h" 3
int nanosleep (const struct timespec *, struct timespec *);
int clock_getres (clockid_t, struct timespec *);
int clock_gettime (clockid_t, struct timespec *);
int clock_settime (clockid_t, const struct timespec *);
int clock_nanosleep (clockid_t, int, const struct timespec *, struct timespec *);
int clock_getcpuclockid (pid_t, clockid_t *);

struct sigevent;
int timer_create (clockid_t, struct sigevent *restrict, timer_t *restrict);
int timer_delete (timer_t);
int timer_settime (timer_t, int, const struct itimerspec *restrict, struct itimerspec *restrict);
int timer_gettime (timer_t, struct itimerspec *);
int timer_getoverrun (timer_t);

extern char *tzname[2];





char *strptime (const char *restrict, const char *restrict, struct tm *restrict);
extern int daylight;
extern long timezone;
extern int getdate_err;
struct tm *getdate (const char *);
# 4 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/REACTION_GAME.c" 2
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
# 5 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/REACTION_GAME.c" 2

REACTION_OUTPUT_TABLE REACTION_START(REACTION_OUTPUT_TABLE REACTO_TABLE){
    srand(REACTO_TABLE.tick100us);
    REACTO_TABLE.RANDOM_NUMBER = rand() % 100 + 1;
    REACTO_TABLE.DISPLAY_NUMBER_1 = 0;
    REACTO_TABLE.DISPLAY_NUMBER_2 = 0;
    REACTO_TABLE.P1_RESULT = -1;
    REACTO_TABLE.P2_RESULT = -1;
    return REACTO_TABLE;
}

REACTION_OUTPUT_TABLE REACTION_UPDATE(REACTION_OUTPUT_TABLE REACTO_TABLE){
        if(REACTO_TABLE.PLAYER1_STATE == 1 && REACTO_TABLE.PLAYER2_STATE == 0){
            if(REACTO_TABLE.tick100us > 1 ){
                if(REACTO_TABLE.DISPLAY_NUMBER_1 > 100){
                    REACTO_TABLE.DISPLAY_NUMBER_1 = 0;
                }
                else{
                    REACTO_TABLE.DISPLAY_NUMBER_1++;
                }
                REACTO_TABLE.tick100us = 0;
                return REACTO_TABLE;
            }
        }
        else if(REACTO_TABLE.PLAYER1_STATE == 2 && REACTO_TABLE.PLAYER2_STATE == 0){
            REACTO_TABLE.P1_RESULT = REACTO_TABLE.DISPLAY_NUMBER_1 - REACTO_TABLE.RANDOM_NUMBER;
            if(REACTO_TABLE.P1_RESULT < 0){
                REACTO_TABLE.P1_RESULT = 0 - REACTO_TABLE.P1_RESULT;
            }
        }
        else if(REACTO_TABLE.PLAYER1_STATE == 2 && REACTO_TABLE.PLAYER2_STATE == 1){
            if(REACTO_TABLE.tick100us > 1 ){
                if(REACTO_TABLE.DISPLAY_NUMBER_2 > 100){
                    REACTO_TABLE.DISPLAY_NUMBER_2 = 0;
                }
                else{
                    REACTO_TABLE.DISPLAY_NUMBER_2++;
                }
                REACTO_TABLE.tick100us = 0;
                return REACTO_TABLE;
            }
        }
        else if(REACTO_TABLE.PLAYER1_STATE == 2 && REACTO_TABLE.PLAYER2_STATE == 2){
            REACTO_TABLE.P2_RESULT = REACTO_TABLE.DISPLAY_NUMBER_2 - REACTO_TABLE.RANDOM_NUMBER;
            if(REACTO_TABLE.P2_RESULT < 0){
                REACTO_TABLE.P2_RESULT = 0 - REACTO_TABLE.P2_RESULT;
            }
        }
    return REACTO_TABLE;
}

REACTION_OUTPUT_TABLE REACTION_UPDATE_WHO_WIN(REACTION_OUTPUT_TABLE REACTO_TABLE){
    if(REACTO_TABLE.P1_RESULT < REACTO_TABLE.P2_RESULT){
        REACTO_TABLE.WINNER = 1;
    }
    else if(REACTO_TABLE.P1_RESULT > REACTO_TABLE.P2_RESULT){
        REACTO_TABLE.WINNER = 2;
    }
    else{
        REACTO_TABLE.WINNER = 0;
    }

    return REACTO_TABLE;
}
