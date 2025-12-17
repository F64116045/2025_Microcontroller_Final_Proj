# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/TIC_TAC_TOE.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 285 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/TIC_TAC_TOE.c" 2
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
# 2 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/TIC_TAC_TOE.c" 2
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
# 3 "../../Desktop/2025_MICROCHIP_FINAL_PROJECT_2.0-main/2025_MICROCHIP_FINAL_PROJECT_2.0-main/TIC_TAC_TOE.c" 2

int PQ[2][3];
int pt[2];

int detwinner(int i){
    if(PQ[i][2]==-1)
        return 0;
    if(PQ[i][0]%3==PQ[i][1]%3 && PQ[i][1]%3==PQ[i][2]%3)
        return 1;
    if(PQ[i][0]/3==PQ[i][1]/3 && PQ[i][1]/3==PQ[i][2]/3)
        return 1;
    if((PQ[i][0]==4||PQ[i][1]==4||PQ[i][2]==4) && PQ[i][0]+PQ[i][1]+PQ[i][2]==12)
        return 1;
    return 0;
}

TTT_OUTPUT_TABLE TTT_START(TTT_OUTPUT_TABLE TTTO_TABLE){
    for(int i=0;i<3;i++)
        for(int j=0;j<3;j++)
            PQ[i][j]=-1;
    for(int i=0;i<9;i++)
        TTTO_TABLE.BOARD[i]=-1;
    pt[0]=0;
    pt[1]=0;
    TTTO_TABLE.CURPLAYER = 0;
    TTTO_TABLE.DETWINNER = 0;
    TTTO_TABLE.SUCCESS = 1;
    return TTTO_TABLE;
}

TTT_OUTPUT_TABLE TTT_UPDATE(TTT_OUTPUT_TABLE TTTO_TABLE,int P1_PRESS,int P2_PRESS,int num){
    if((P1_PRESS==TTTO_TABLE.CURPLAYER)||(P2_PRESS!=TTTO_TABLE.CURPLAYER)){
        TTTO_TABLE.SUCCESS=0;
        return TTTO_TABLE;
    }

    if(TTTO_TABLE.BOARD[num] > -1){
        TTTO_TABLE.SUCCESS=0;
        return TTTO_TABLE;
    }
    TTTO_TABLE.SUCCESS = 1;
    TTTO_TABLE.BOARD[num] = TTTO_TABLE.CURPLAYER;
    if(PQ[TTTO_TABLE.CURPLAYER][pt[TTTO_TABLE.CURPLAYER]] > -1)
        TTTO_TABLE.BOARD[PQ[TTTO_TABLE.CURPLAYER][pt[TTTO_TABLE.CURPLAYER]]] = -1;
    PQ[TTTO_TABLE.CURPLAYER][pt[TTTO_TABLE.CURPLAYER]] = num;
    pt[TTTO_TABLE.CURPLAYER] = (pt[TTTO_TABLE.CURPLAYER]+1) % 3;
    TTTO_TABLE.DETWINNER = detwinner(TTTO_TABLE.CURPLAYER);
    TTTO_TABLE.CURPLAYER = (TTTO_TABLE.CURPLAYER + 1) % 2;
    return TTTO_TABLE;
}

void printBoard(TTT_OUTPUT_TABLE gameState){
    if(!gameState.SUCCESS){
        printf("illeagal move!!!\n");
        return;
    }
    for(int i=0;i<9;i++){
        (!gameState.BOARD[i])?printf("O"):(gameState.BOARD[i]==1)?printf("X"):printf("-");
        if(i%3==2)
            printf("\n");
    }
    if(gameState.DETWINNER){
        (gameState.CURPLAYER)?printf("X win the game\n"):printf("O win the game\n");
        printf("by %d,%d,%d", PQ[gameState.CURPLAYER][0], PQ[gameState.CURPLAYER][1], PQ[gameState.CURPLAYER][2]);
    }
    else
        (gameState.CURPLAYER)?printf("O's turn\n"):printf("X's turn\n");
    printf("************\n");
}
