;------------------------------------------------------------------------------
; ZONA I: Definicao de constantes
;         Pseudo-instrucao : EQU
;------------------------------------------------------------------------------
CR              EQU     0Ah
FIM_TEXTO       EQU     '@'
IO_READ         EQU     FFFFh
IO_WRITE        EQU     FFFEh
IO_STATUS       EQU     FFFDh
INITIAL_SP      EQU     FDFFh
CURSOR	        EQU     FFFCh
CURSOR_INIT	EQU	FFFFh
TIMER_UNITS     EQU     FFF6h
ACTIVATE_TIMER  EQU     FFF7h

OFF             EQU     0d
ON              EQU     1d

ROW_POSITION	EQU	0d
COL_POSITION	EQU     0d
ROW_SHIFT	EQU 	8d
COLUMN_SHIFT	EQU     8d
SPACE           EQU     ' ' 
DIR_U           EQU     0d
DIR_D           EQU     1d
DIR_L           EQU     2d
DIR_R           EQU     3d
TRUE            EQU     1d      
FALSE           EQU     0d

FRUTA           EQU     '#'
RND_MASK	EQU	8016h	; 1000 0000 0001 0110b
LSB_MASK	EQU	0001h	; Mascara para testar o bit menos significativo do Random_Var
PRIME_NUMBER_1	EQU     11d
PRIME_NUMBER_2	EQU     13d
MAXIMO_LINHAS   EQU     20d
MAXIMO_COLUNAS  EQU     78d

POS_SCORE_1     EQU     0000000101001101b ; 01L x 77C
POS_SCORE_2     EQU     0000000101001100b ; 01L x 76C
POS_SCORE_3     EQU     0000000101001011b ; 01L x 75C
POS_SCORE_4     EQU     0000000101001010b ; 01L x 74C

ASCII           EQU     48d

RIGHT_LIMIT     EQU     80d
LEFT_LIMIT      EQU     0d
UP_LIMIT        EQU     2d
DOWN_LIMIT      EQU     23d

SPEED           EQU     3d

NUMBER_THOUSAND EQU     1000d
NUMBER_HUNDRED  EQU     100d
NUMBER_TEN      EQU     10d

;------------------------------------------------------------------------------
; ZONA II: definicao de variaveis
;          Pseudo-instrucoes : WORD - palavra (16 bits)
;                              STR  - sequencia de caracteres (cada ocupa 1 palavra: 16 bits).
;          Cada caracter ocupa 1 palavra
;------------------------------------------------------------------------------

                ORIG    8000h
L0              STR     '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%', FIM_TEXTO
L1              STR     '% Snakezinha                                                      Pontos: 0000 %', FIM_TEXTO
L2              STR     '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%', FIM_TEXTO
L3              STR     '%                                                                              %', FIM_TEXTO
L4              STR     '%                                                                              %', FIM_TEXTO
L5              STR     '%                                                                              %', FIM_TEXTO
L6              STR     '%                                                                              %', FIM_TEXTO
L7              STR     '%                                                                              %', FIM_TEXTO
L8              STR     '%                                                                              %', FIM_TEXTO
L9              STR     '%                                                                              %', FIM_TEXTO
L10             STR     '%                                                                              %', FIM_TEXTO
L11             STR     '%                                                                              %', FIM_TEXTO
L12             STR     '%                                                                              %', FIM_TEXTO
L13             STR     '%                                                                              %', FIM_TEXTO
L14             STR     '%                                                                              %', FIM_TEXTO
L15             STR     '%                                                                              %', FIM_TEXTO
L16             STR     '%                                                                              %', FIM_TEXTO
L17             STR     '%                                                                              %', FIM_TEXTO
L18             STR     '%                                                                              %', FIM_TEXTO
L19             STR     '%                                                                              %', FIM_TEXTO
L20             STR     '%                                                                              %', FIM_TEXTO
L21             STR     '%                                                                              %', FIM_TEXTO
L22             STR     '%                                                                              %', FIM_TEXTO
L23             STR     '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%', FIM_TEXTO

P0              STR     '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%', FIM_TEXTO
P1              STR     '%                              ____  ________                                  %', FIM_TEXTO
P2              STR     '%                              |   _     _  |                                  %', FIM_TEXTO
P3              STR     '%                              |  |_) | |_) |                                  %', FIM_TEXTO
P4              STR     '%                              |  | \ | |   |                                  %', FIM_TEXTO
P5              STR     '%                              |            |                                  %', FIM_TEXTO
P6              STR     '%               ______.______%_|            |__________  _____                 %', FIM_TEXTO
P7              STR     '%             _/                                       \|     |                %', FIM_TEXTO
P8              STR     '%            |              LITTLE SNAKE JUNIOR               <                %', FIM_TEXTO
P9              STR     '%            |_____.-._________              ____/|___________|                %', FIM_TEXTO
P10             STR     '%                              | * 2min     |                                  %', FIM_TEXTO
P11             STR     '%                              | + now      |                                  %', FIM_TEXTO
P12             STR     '%                              |            |                                  %', FIM_TEXTO
P13             STR     '%                              |            |                                  %', FIM_TEXTO
P14             STR     '%                              |   _        <                                  %', FIM_TEXTO
P15             STR     '%                              |__/         |                                  %', FIM_TEXTO
P16             STR     '%                               / `--.      |                                  %', FIM_TEXTO
P17             STR     '%                             %|            |%                                 %', FIM_TEXTO
P18             STR     '%                         |/.%%|          -< 8%%%                              %', FIM_TEXTO
P19             STR     '%                         `\%`8|     v      |8`8                               %', FIM_TEXTO
P20             STR     '%                         `\%`8|     v      |88%8%%                            %', FIM_TEXTO
P21             STR     '%                       .%%%888|%    |    % 888%%8%%%%                         %', FIM_TEXTO
P22             STR     '%                  _.%%%%%%888888%%_/%\_%88%%8888888%%%%%%                     %', FIM_TEXTO
P23             STR     '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%', FIM_TEXTO

                   
I0              STR     '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%', FIM_TEXTO
I1              STR     '%                                                                              %', FIM_TEXTO
I2              STR     '%             `7MMF         db    mm      mm    `7MM                           %', FIM_TEXTO
I3              STR     '%               MM                MM      MM      MM                           %', FIM_TEXTO
I4              STR     '%               MM        `7MM  mmMMmm  mmMMmm    MM   .gP"Ya                  %', FIM_TEXTO
I5              STR     '%               MM          MM    MM      MM      MM  ,M    Yb                 %', FIM_TEXTO
I6              STR     '%               MM      ,   MM    MM      MM      MM  8M""""""                 %', FIM_TEXTO
I7              STR     '%               MM     ,M   MM    MM      MM      MM  YM.    ,                 %', FIM_TEXTO
I8              STR     '%             .JMMmmmmMMM .JMML.  `Mbmo   `Mbmo .JMML. `Mbmmd                  %', FIM_TEXTO
I9              STR     '%                                                                              %', FIM_TEXTO
I10             STR     '%                                                                              %', FIM_TEXTO
I11             STR     '%                                                                              %', FIM_TEXTO
I12             STR     '%                                       ,,                                     %', FIM_TEXTO
I13             STR     '%                 .g8"""bgd           *MM                                      %', FIM_TEXTO
I14             STR     '%               .dP      `M            MM                                      %', FIM_TEXTO
I15             STR     '%               dM        `  ,pW"Wq.   MM,dMMb.  `7Mb,od8  ,6"Yb.              %', FIM_TEXTO
I16             STR     '%               MM          6W    `Wb  MM    `Mb   MM   H 8)   MM              %', FIM_TEXTO
I17             STR     '%               MM.         8M     M8  MM     M8   MM      ,pm9MM              %', FIM_TEXTO
I18             STR     '%               `Mb.     ,  YA.   ,A9  MM.   ,M9   MM     8M   MM              %', FIM_TEXTO
I19             STR     '%                `"bmmmdO   `Ybmd9o    P^YbmdPO  .JMML.   `Moo9^Yo.            %', FIM_TEXTO
I20             STR     '%                                                                              %', FIM_TEXTO
I21             STR     '%                                PRESS SPACE                                   %', FIM_TEXTO
I22             STR     '%                                                                              %', FIM_TEXTO
I23             STR     '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%', FIM_TEXTO


SnakeDir                WORD    DIR_D
                                                                                                        
RowIndex                WORD    0d
ColumnIndex             WORD    0d
TextIndex               WORD    0d

Caracter                WORD    'o'
CaracterCabeca          WORD    'O'
Linha                   WORD    12d
Coluna                  WORD    40d

gameover                WORD    FALSE

vetor                   TAB     40d
cobra                   TAB     1560d     
cauda                   WORD    0d

Random_Var	        WORD	A5A5h  ; 1010 0101 1010 0101
RandomState             WORD	666d

ColunaFruta             WORD    0d
LinhaFruta              WORD    0d
Tamanho                 WORD    1d

StartBool               WORD    0d

Score                   WORD    0d

;------------------------------------------------------------------------------
; ZONA II: definicao de tabela de interrupções
;------------------------------------------------------------------------------
                 ORIG    FE00h
INT0             WORD    ChangeSnakeDirUp
INT1             WORD    ChangeSnakeDirLeft  
INT2             WORD    ChangeSnakeDirDown
INT3             WORD    ChangeSnakeDirRight
INT4             WORD    Start

                 ORIG    FE0Fh
INT15            WORD    Timer




;------------------------------------------------------------------------------
; ZONA IV: codigo
;        conjunto de instrucoes Assembly, ordenadas de forma a realizar
;        as funcoes pretendidas
;------------------------------------------------------------------------------
                ORIG    0000h
                JMP     Main
;------------------------------------------------------------------------------
; Rotina Timer
;------------------------------------------------------------------------------

ConfigureTimer: PUSH R1
                PUSH R2

                MOV R1, SPEED
                MOV M[ TIMER_UNITS ], R1
                
                MOV R1, ON
                MOV M[ ACTIVATE_TIMER ], R1

                POP R2
                POP R1
                RET


Timer:  PUSH R1
        PUSH R2
        PUSH R3
        
        MOV R1, M[gameover]
        CMP R1, TRUE
        JMP.Z EndTimer

        CALL Eat 
        
        CALL MovSnake 
              
        CALL ConfigureTimer

EndTimer:       POP R3
                POP R2
                POP R1
                RTI

;------------------------------------------------------------------------------
; Rotina Start - verifica a interrupção de inicio do jogo
;------------------------------------------------------------------------------

Start:                  PUSH R1

                        MOV R1, TRUE
                        MOV M[StartBool], R1

                        POP  R1
                        RTI
;------------------------------------------------------------------------------
; Rotina Movimentação cobra
;------------------------------------------------------------------------------

ChangeSnakeDirUp:       PUSH R1

                        MOV R1, DIR_U
                        MOV M[SnakeDir], R1

                        POP R1
                        RTI

ChangeSnakeDirDown:     PUSH R1

                        MOV R1, DIR_D
                        MOV M[SnakeDir], R1

                        POP R1
                        RTI

ChangeSnakeDirRight:    PUSH R1

                        MOV R1, DIR_R
                        MOV M[SnakeDir], R1

                        POP R1
                        RTI

ChangeSnakeDirLeft:     PUSH R1

                        MOV R1, DIR_L
                        MOV M[SnakeDir], R1

                        POP R1
                        RTI
;------------------------------------------------------------------------------
; Rotina MovSnake - verifica se bateu em algo e printa a tela de over
;------------------------------------------------------------------------------

MovSnake:       PUSH R1

                MOV R1, M[SnakeDir]
                
                CALL printCobra
                CALL updatePos
                CALL Hit

                CMP R1, DIR_U
                CALL.Z Cima

                CMP R1, DIR_D
                CALL.Z Baixo
                
                CMP R1, DIR_L
                CALL.Z Esq

                CMP R1, DIR_R
                CALL.Z Dir
                
                POP R1
                RET
;------------------------------------------------------------------------------
; Rotina direita - cobra andando pra direita
;------------------------------------------------------------------------------
Dir:    PUSH R1     
        
        INC M[Coluna]

        POP R1
        RET
;------------------------------------------------------------------------------
; Rotina esquerda - cobra andando pra esquerda
;------------------------------------------------------------------------------
Esq:    PUSH R1
       
        DEC M[Coluna]

        POP R1
        RET
;------------------------------------------------------------------------------
; Rotina baixo - cobra andando pra baixo
;------------------------------------------------------------------------------
Baixo:  PUSH R1
                     
        INC M[Linha]

        POP R1
        RET
;------------------------------------------------------------------------------
; Rotina cima - cobra andando pra cima
;------------------------------------------------------------------------------
Cima:   PUSH R1

        DEC M[Linha]

        POP R1
        RET

;------------------------------------------------------------------------------
; Rotina Hit e Loser - verifica as condições de morte e printa a tela de game over
;------------------------------------------------------------------------------
Hit:    PUSH R1
        PUSH R2
        PUSH R3
        PUSH R4
        PUSH R5
        PUSH R6

        MOV R1, M[cobra]         ;choque nela mesma
        MOV R3, 0d
dead:   INC R3                        
        MOV R2, M[R3+cobra]
        CMP R1, R2
        JMP.Z  loser
        CMP R3, M[Tamanho]
        JMP.NZ dead

        MOV R1, M[Coluna]
        CMP R1, RIGHT_LIMIT
        JMP.Z  loser
        
        MOV R1, M[Coluna]
        CMP R1, LEFT_LIMIT
        JMP.Z  loser

        MOV R1, M[Linha]
        CMP R1, DOWN_LIMIT
        JMP.Z  loser

        MOV R1, M[Linha]
        CMP R1, UP_LIMIT
        JMP.Z  loser
        JMP.NZ end

loser:  MOV R1, TRUE                    ;imprime a tela de gameover
        MOV M[ gameover ], R1

        MOV     R5, P0
        MOV     R6, R0

        MOV     M[TextIndex], R0
        MOV     M[ColumnIndex], R0
        MOV     M[RowIndex], R0

        CALL printTela

end:    POP R6
        POP R5
        POP R4
        POP R3
        POP R2
        POP R1
        RET

;------------------------------------------------------------------------------
; Rotina Print Cobra - imprime na tela a cobra
;------------------------------------------------------------------------------

printCobra:     PUSH R1
                PUSH R2
                PUSH R3

                MOV     R1, M[Linha]
                MOV     R2, M[Coluna]
                SHL     R1, 8d 
                OR      R1, R2
                
                MOV     M[ CURSOR ], R1
                MOV     R1, M[ CaracterCabeca ]
                MOV     M[ IO_WRITE ], R1


                MOV     R1, 0d
cbr:            MOV     R2, M [ R1 + cobra ]     
                MOV     R3, M [ Caracter ]
                MOV     M [ CURSOR ], R2
                MOV     M [ IO_WRITE ], R3

                INC     R1
                CMP     R1, M [ Tamanho ]
                JMP.NZ  cbr

                MOV     R1, M[ Tamanho ]
                DEC     R1
                MOV     R3, M[R1 + cobra]
                MOV     M[cauda], R3
                 
                MOV     R1, M[cauda]
                MOV     R2, SPACE
                MOV     M[CURSOR], R1
                MOV     M[IO_WRITE], R2


                POP R3
                POP R2
                POP R1
                RET
        
;------------------------------------------------------------------------------
; Rotina Print Tela do jogo - imprime a tela de jogo
;------------------------------------------------------------------------------                
printJogo:      PUSH R5
                PUSH R6

                MOV     R5, L0
                MOV     R6, R0

                MOV     M[TextIndex], R0
                MOV     M[ColumnIndex], R0
                MOV     M[RowIndex], R0

                CALL printTela

                POP     R6
                POP     R5
                RET
        

;------------------------------------------------------------------------------
; Rotina Print Tela - imprime qualquer tela
;------------------------------------------------------------------------------
printTela:      PUSH R1
                PUSH R2
                PUSH R3 
                PUSH R4
                PUSH R5
                PUSH R6

exec:           MOV     R1, M[ TextIndex ]
                ADD     R1, R5
                MOV     R2, M[ R1]
                CMP     R2, FIM_TEXTO
                JMP.Z   fim     
                MOV     R3, M[ RowIndex ]
                MOV     R4, M[ColumnIndex]

                SHL     R3, ROW_SHIFT
                OR      R3, R4

                MOV     M[CURSOR], R3
                MOV     M[IO_WRITE], R2

                INC     M[TextIndex]
                INC     M[ColumnIndex]

                JMP     exec 

fim:            MOV     M[TextIndex], R0
                MOV     M[ColumnIndex], R0
                INC     M[RowIndex]
                INC     R6
                CMP     R6, 24d
                JMP.Z   final
                ADD     R5, 51h
                JMP     exec

final:          POP     R6
                POP     R5
                POP     R4
                POP     R3 
                POP     R2
                POP     R1
                RET

;------------------------------------------------------------------------------
; Função: RandomV1 (versão 1)
;
; Random: Rotina que gera um valor aleatório - guardado em M[Random_Var]
; Entradas: M[Random_Var]
; Saidas:   M[Random_Var]
;------------------------------------------------------------------------------

RandomV1:	        PUSH	R1

			MOV	R1, LSB_MASK
			AND	R1, M[Random_Var] ; R1 = bit menos significativo de M[Random_Var]
			BR.Z	Rnd_Rotate
			MOV	R1, RND_MASK
			XOR	M[Random_Var], R1

Rnd_Rotate:	        ROR	M[Random_Var], 1
			
			POP	R1

			RET

;------------------------------------------------------------------------------
; Função: RandomV2 (versão 2)
;
; Random: Rotina que gera um valor aleatório - guardado em M[Random_Var]
; Entradas: 
; Saidas:   M[Random_Var]
;------------------------------------------------------------------------------

RandomV2:	        PUSH R1
			PUSH R2
			PUSH R3
			PUSH R4

			MOV R1, M[ RandomState ]
			MOV R2, PRIME_NUMBER_1
			MOV R3, PRIME_NUMBER_2

			MUL R1, R2 ; Atenção: O resultado da operacao fica em R1 e R2!!!
			ADD R2, R3 ; Vamos usar os 16 bits menos significativos da MUL
			MOV M[ RandomState ], R2
                        MOV M[ Random_Var ], R2

			POP R4
			POP R3
			POP R2
			POP R1

			RET


;------------------------------------------------------------------------------
; Função Geradora de Fruta - gera um local pra fruta 
;------------------------------------------------------------------------------
GeraFruta:              PUSH R1
                        PUSH R2


                        CALL RandomV2
                        MOV  R1, M[ Random_Var ]
                        MOV  R2, MAXIMO_COLUNAS
                        DIV  R1, R2
                        ADD  R2, 1d
                        MOV  M[ ColunaFruta ], R2

                        CALL RandomV2
                        MOV  R1, M[ Random_Var ]
                        MOV  R2, MAXIMO_LINHAS
                        DIV  R1, R2
                        ADD  R2, 3d
                        MOV  M[ LinhaFruta ], R2

                        CALL PrintFruta

                        POP R2
                        POP R1
                        RET

;------------------------------------------------------------------------------
; Rotina Print Fruta - imprime a fruta
;------------------------------------------------------------------------------
PrintFruta:             PUSH R1
                        PUSH R2
                        PUSH R3

                        MOV     R1, M [ LinhaFruta ]
                        MOV     R2, M [ ColunaFruta ]
                        SHL     R1, 8d
                        OR      R1, R2
                        
                        MOV     R3, 0d
loopfruta:              CMP     R1, M [ R3 + cobra ]   ;verifica se spawnou a fruta em cima da cobra, se sim gera outra  
                        CALL.Z  GeraFruta

                        INC     R3
                        CMP     R3, M [ Tamanho ]
                        JMP.NZ  loopfruta


                        MOV     M [ CURSOR ], R1
                        MOV     R1, FRUTA
                        MOV     M [ IO_WRITE ], R1
                        
                        POP R3
                        POP R2
                        POP R1
                        RET

;------------------------------------------------------------------------------
; Rotina Eat - verifica se a cobra consumiu a fruta
;------------------------------------------------------------------------------

Eat:                    PUSH R1
                        PUSH R2
                        PUSH R3
                        
                        MOV R1, M [ LinhaFruta ]
                        MOV R2, M [ ColunaFruta ]
                        SHL     R1, 8d 
                        OR      R1, R2

                        MOV R3, M [ cobra ]

                        CMP R1, R3
                        JMP.NZ not

                        INC     M [ Tamanho ]
                        INC     M [ Score ]

                        CALL printScore
                        CALL GeraFruta

not:                    POP R3
                        POP R2 
                        POP R1
                        RET

;------------------------------------------------------------------------------
; Rotina updatePos - atualiza as posições da cobra de acordo com o movimento
;------------------------------------------------------------------------------

updatePos:              PUSH R1
                        PUSH R2
                        PUSH R3 

                        MOV     R2, M[ Tamanho ]

updt:                   MOV     R1, R2
                        DEC     R1
                        MOV     R3, M[ R1 + cobra ]
                        MOV     M[ R2 + cobra ], R3
                        
                        DEC     R2

                        CMP     R2, 0d
                        JMP.NZ  updt

                        MOV  R2, M[Linha]
                        MOV  R3, M[Coluna]
                        SHL  R2, 8d 
                        OR   R2, R3
                        MOV  M[ cobra ], R2

                        POP R3
                        POP R2 
                        POP R1
                        RET

;------------------------------------------------------------------------------
; Rotina TelaInicial - imprime a tela inicial
;------------------------------------------------------------------------------
TelaInicial:            PUSH R5
                        PUSH R6
                        
                        MOV     R5, I0
                        MOV     R6, R0

                        MOV     M[TextIndex], R0
                        MOV     M[ColumnIndex], R0
                        MOV     M[RowIndex], R0
                        CALL    printTela  
                       
                        POP     R6
                        POP     R5
                        RET

;------------------------------------------------------------------------------
; Rotina VerificaInicio - aguarda a interrupção de inicio para começar
;------------------------------------------------------------------------------

VerificaInicio:         PUSH R1
                        PUSH R2
                        
                        MOV     R1, TRUE 
check:                  CMP     M[StartBool], R1
                        JMP.NZ  check
                        JMP.Z   Go

                        POP R2
                        POP R1
                        RET
;------------------------------------------------------------------------------
; Rotina print Pontuação - imprime a pontuação
;------------------------------------------------------------------------------

printScore:             PUSH R1
                        PUSH R2
                        PUSH R3

                        MOV     R1, M[Score]
                        MOV     R2, NUMBER_THOUSAND
                        DIV     R1, R2
                        MOV     R3, POS_SCORE_4
                        MOV     M[ CURSOR ], R3
                        ADD     R1, ASCII
                        MOV     M [ IO_WRITE ], R1

                        MOV     R1, R2
                        MOV     R2, NUMBER_HUNDRED
                        DIV     R1, R2
                        MOV     R3, POS_SCORE_3
                        MOV     M[ CURSOR ], R3
                        ADD     R1, ASCII
                        MOV     M [ IO_WRITE ], R1

                        MOV     R1, R2
                        MOV     R2, NUMBER_TEN
                        DIV     R1, R2
                        MOV     R3, POS_SCORE_2
                        MOV     M[ CURSOR ], R3
                        ADD     R1, ASCII
                        MOV     M [ IO_WRITE ], R1

                        MOV     R3, POS_SCORE_1
                        MOV     M[ CURSOR ], R3
                        ADD     R2, ASCII
                        MOV     M [ IO_WRITE ], R2

                        POP R3
                        POP R2
                        POP R1
                        RET

;------------------------------------------------------------------------------
; Função Main
;------------------------------------------------------------------------------

Main:   ENI

	MOV	R1, INITIAL_SP
	MOV	SP, R1		 	; We need to initialize the stack
	MOV	R1, CURSOR_INIT	        ; We need to initialize the cursor 
	MOV	M[ CURSOR ], R1		; with value CURSOR_INIT    
        

                MOV R1, 0d 
                MOV R2, 'x'

Initialize:     INC R1
                MOV M[R1 + cobra], R2
                CMP R1, 1560d
                JMP.NZ Initialize
        
        CALL TelaInicial
        CALL VerificaInicio   

Go:     CALL printJogo      
        CALL GeraFruta
        CALL ConfigureTimer



Cycle: 		BR		Cycle	
Halt:           BR		Halt
