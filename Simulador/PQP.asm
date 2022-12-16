jmp main

;--------------------------------------------------------------------;
;	          VARIAVEIS UTILIZADAS NO PROGRAMA                 	  	 ;
;--------------------------------------------------------------------;

LarguraPista: var #1		; Define a largura da pista
DelayPista: var #1			; Delay da pista
IncDelayPista: var #1		; Incremento/Decremento do delay da pista
MaxDelayPista: var #1		; Valor maximo para o delay da pista
MinDelayPista: var #1		; Valor minimo para o delay da pista
DelayCarro: var #1			; Delay do carro
DelayCronometro: var #1		; Delay do cronometro
DelayBonus: var #1			; Delay dos obstaculos/bonus que aparecem na tela
NumVoltasDadas: var #1		; Numero de voltas dadas pelo carro do usuario na pista
NumVoltasPista:	var #1		; Numero de voltas maximas na pista
Pista: var #150 			; Indica os centros de cada posicao da pista
IndicePista: var #1			; Indice atual do vetor da pista
FimPista: var #1			; Indica se esta no final da pista
PosicoesDaPista: var #60	; Indica as posicoes da tela preenchidas pela pista
IndicePosicoesDaPista: var #1	; Indice da ultima posicao preenchida do vetor de posicoes
PosCarro: var #1			; Indica a posicao do carro na tela
CarroParado: var #1			; Indica se o carro esta parado ou nao (0 -> Nao esta parado, 1 -> Esta parado)
ValidaMovimento: var #1		; Indica se o movimento pode ser realizado ou nao
TempoCronometro: var #1		; Indica o tempo que esta no cronometro
Fim: var #1					; Indica a situacao de fim de jogo 
							; (0 -> Nao terminou; 1 -> Terminou por pista completada, 2 -> Terminou por tempo)
TamString: var #1
Bonus: var #3			
IndiceBonus: var #1
MostraBonus: var #1
PegouBonus: var #1
Obstaculo: var #3			
IndiceObstaculo: var #1
MostraObstaculo: var #1
PegouObstaculo: var #1
JogarNovamente: var #1


; Mensagens
strVelocidade: string "VELOCIDADE:"
strVoltas: string "VOLTAS:"

;Vetores que armazenam o cenario lateral
CenarioLt0: string "  %     %     %     %     %     %     % "
CenarioLt1: string "                                        "
CenarioLt2: string "     $     $     $     $     $     $    " 
CenarioLt3: string "                                        "
CenarioLt4: string "  &     &     &     &     &     &     & "
CenarioLt5: string "                                        "
CenarioLt6: string "     %     %     %     %     %     %    "
CenarioLt7: string "                                        "
CenarioLt8: string "  $     $     $     $     $     $     $ "
CenarioLt9: string "                                        "
CenarioLt10: string "  %     %     %     %     %     %     % "
CenarioLt11: string "                                        "
CenarioLt12: string "     $     $     $     $     $     $    " 
CenarioLt13: string "                                        "
CenarioLt14: string "  &     &     &     &     &     &     & "
CenarioLt15: string "                      $       %         "
CenarioLt16: string " $    &                                 "
CenarioLt17: string "                          &             "
CenarioLt18: string "       %                         %      "
CenarioLt19: string "  $                                     "
CenarioLt20: string "                     %              &   "
CenarioLt21: string "      $      &                &         "
CenarioLt22: string "                                        " 
CenarioLt23: string "  %                                $    "


; Tela Inicial1
tela1Linha0  : string "                                        "
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string "                                        "
tela1Linha4  : string "                                        "
tela1Linha5  : string "                                        "
tela1Linha6  : string "                                        "
tela1Linha7  : string "         PQP: P E R C O R R A           "
tela1Linha8  : string "        Q U A N D O P O S S I V E L     "  
tela1Linha9  : string "                                        "
tela1Linha10  : string "                                        "
tela1Linha11  : string "                                        "
tela1Linha12  : string "                                        "
tela1Linha13  : string "                                        "
tela1Linha14  : string "                                        "
tela1Linha15  : string "             < NOVO JOGO >              "
tela1Linha16  : string "              COMO  JOGAR               "
tela1Linha17  : string "                                        "
tela1Linha18  : string "                                        "
tela1Linha19  : string "           PRESSIONE ESPACO             "
tela1Linha20  : string "           PARA  SELECIONAR             "
tela1Linha21  : string "                                        "
tela1Linha22  : string "                                        "
tela1Linha23  : string "                                        "
tela1Linha24  : string "                                        "
tela1Linha25  : string "                                        "
tela1Linha26  : string "                                        "
tela1Linha27  : string "                                        "
tela1Linha28  : string "                                        "
tela1Linha29  : string "                                        "

; Tela Inicial2
tela2Linha0  : string "                                        "
tela2Linha1  : string "                                        "
tela2Linha2  : string "                                        "
tela2Linha3  : string "                                        "
tela2Linha4  : string "                                        "
tela2Linha5  : string "                                        "
tela2Linha6  : string "                                        "
tela2Linha7  : string "         PQP: P E R C O R R A          "
tela2Linha8  : string "        Q U A N D O P O S S I V E L     "  
tela2Linha9  : string "                                        "
tela2Linha10  : string "                                        "
tela2Linha11  : string "                                        "
tela2Linha12  : string "                                        "
tela2Linha13  : string "                                        "
tela2Linha14  : string "                                        "
tela2Linha15  : string "               NOVO JOGO                "
tela2Linha16  : string "             <COMO  JOGAR>              "
tela2Linha17  : string "                                        "
tela2Linha18  : string "                                        "
tela2Linha19  : string "           PRESSIONE ESPACO             "
tela2Linha20  : string "           PARA  SELECIONAR             "
tela2Linha21  : string "                                        "
tela2Linha22  : string "                                        "
tela2Linha23  : string "                                        "
tela2Linha24  : string "                                        "
tela2Linha25  : string "                                        "
tela2Linha26  : string "                                        "
tela2Linha27  : string "                                        "
tela2Linha28  : string "                                        "
tela2Linha29  : string "                                        "

; Tela Como jogar
tela3Linha0  : string "                                        "
tela3Linha1  : string "                                        "
tela3Linha2   : string "         PQP: P E R C O R R A          "
tela3Linha3  : string "        Q U A N D O P O S S I V E L     "  
tela3Linha4  : string "                                        "
tela3Linha5  : string "                                        "
tela3Linha6  : string " * Seu objetivo eh completar todas as   "
tela3Linha7  : string "  voltas do circuito no tempo possivel  "
tela3Linha8  : string "                                        "
tela3Linha9  : string "                                        "
tela3Linha10 : string " * Pegue as vidas x  para adicionar     "
tela3Linha11 : string "        mais tempo de corrida           "
tela3Linha12 : string "                                        "
tela3Linha13  : string " * Tome cuidado com as bombas ~         "
tela3Linha14  : string "   pois elas atrapalham seu jogo        "
tela3Linha15  : string "                                        "
tela3Linha16  : string "                                        "
tela3Linha17  : string " * Utilize as teclas 'w' 'a' 's' 'd'    "
tela3Linha18  : string "   para movimentar seu carrinho         "
tela3Linha19  : string "                                        "
tela3Linha20  : string "                                        "
tela3Linha21  : string " * A tecla P freia o carrinho           "
tela3Linha22  : string "                                        "
tela3Linha23  : string " * A tecla ESPACO acelera seu carrinho  "
tela3Linha24  : string "                                        "
tela3Linha25  : string "                                        "
tela3Linha26  : string " * Pressione 'w' ou 's' para retornar   "
tela3Linha27  : string "                                        "
tela3Linha28  : string "                                        "
tela3Linha29  : string "                                        "

; Tela Final -> Tempo acabou
tela4Linha0  : string "                                        "
tela4Linha1  : string "                                        "
tela4Linha2  : string "                                        "
tela4Linha3  : string "                                        "
tela4Linha4  : string "              __      _ _               "
tela4Linha5  : string "             |_   |  | | |              "
tela4Linha6  : string "             |    |  |   |              "
tela4Linha7  : string "                __   __                 "
tela4Linha8  : string "               |  | |_                  "
tela4Linha9  : string "               |__| |__                 "
tela4Linha10  : string "              _  _   _   _              "
tela4Linha11  : string "              | | | |_  | |             "
tela4Linha12  : string "            |_| |_| |_| |_|             "
tela4Linha13  : string "                                        "
tela4Linha14  : string "                                        "
tela4Linha15  : string "                                        "
tela4Linha16  : string "               QUE PENA :(              "
tela4Linha17  : string "                                        "
tela4Linha18  : string "      VOCE NAO TERMINOU O PERCURSO      "
tela4Linha19  : string "                                        "
tela4Linha20  : string "          NO TEMPO DETERMINADO          "
tela4Linha21  : string "                                        "
tela4Linha22  : string "                                        "
tela4Linha23  : string "            TENTE OUTRA VEZ !           "
tela4Linha24  : string "                                        "
tela4Linha25  : string "        JOGAR NOVAMENTE ? <s/n>         "
tela4Linha26  : string "                                        "
tela4Linha27  : string "                                        "
tela4Linha28  : string "                                        "
tela4Linha29  : string "                                        "

; Tela Final -> Atingiu o objetivo
tela5Linha0  : string "                                        "
tela5Linha1  : string "                                        "
tela5Linha2  : string "                                        "
tela5Linha3  : string "                                        "
tela5Linha4  : string "              __      _ _               "
tela5Linha5  : string "             |_   |  | | |              "
tela5Linha6  : string "             |    |  |   |              "
tela5Linha7  : string "                __   __                 "
tela5Linha8  : string "               |  | |_                  "
tela5Linha9  : string "               |__| |__                 "
tela5Linha10  : string "              _  _   _   _              "
tela5Linha11  : string "              | | | |_  | |             "
tela5Linha12  : string "            |_| |_| |_| |_|             "
tela5Linha13  : string "                                        "
tela5Linha14  : string "                                        "
tela5Linha15  : string "                                        "
tela5Linha16  : string "              PARABENS :D               "
tela5Linha17  : string "                                        "
tela5Linha18  : string "                                        "
tela5Linha18  : string "        VOCE TERMINOU O PERCURSO        "
tela5Linha20  : string "          RESTANDO    SEGUNDOS          "
tela5Linha21  : string "                                        "
tela5Linha22  : string "                                        "
tela5Linha23  : string "            CONTINUE JOGANDO E          "
tela5Linha24  : string "            MELHORE SEU TEMPO!          "
tela5Linha25  : string "                                        "
tela5Linha26  : string "                                        "
tela5Linha27  : string "        JOGAR NOVAMENTE ? <s/n>         "
tela5Linha28  : string "                                        "
tela5Linha29  : string "                                        "



;--------------------------------------------------------------------;
;	         INICIALIZACAO ESTATICA DE VETORES                   ;
;--------------------------------------------------------------------;

; Preenchimento do vetor da Pista
static Pista + #0, #20
static Pista + #1, #20
static Pista + #2, #20
static Pista + #3, #20
static Pista + #4, #20
static Pista + #5, #20
static Pista + #6, #20
static Pista + #7, #20
static Pista + #8, #20
static Pista + #9, #20
static Pista + #10, #20
static Pista + #11, #20
static Pista + #12, #20
static Pista + #13, #20
static Pista + #14, #20
static Pista + #15, #20
static Pista + #16, #20
static Pista + #17, #20
static Pista + #18, #20
static Pista + #19, #20
static Pista + #20, #20
static Pista + #21, #20
static Pista + #22, #20
static Pista + #23, #20
static Pista + #24, #20
static Pista + #25, #20
static Pista + #26, #20
static Pista + #27, #20
static Pista + #28, #20
static Pista + #29, #20
static Pista + #30, #21
static Pista + #31, #21
static Pista + #32, #21
static Pista + #33, #21
static Pista + #34, #22
static Pista + #35, #22
static Pista + #36, #22
static Pista + #37, #22
static Pista + #38, #23
static Pista + #39, #23
static Pista + #40, #23
static Pista + #41, #23
static Pista + #42, #24
static Pista + #43, #24
static Pista + #44, #24
static Pista + #45, #24
static Pista + #46, #25
static Pista + #47, #25
static Pista + #48, #25
static Pista + #49, #25
static Pista + #50, #24
static Pista + #51, #24
static Pista + #52, #24
static Pista + #53, #24
static Pista + #54, #23
static Pista + #55, #23
static Pista + #56, #23
static Pista + #57, #23
static Pista + #58, #22
static Pista + #59, #22
static Pista + #60, #22
static Pista + #61, #22
static Pista + #62, #21
static Pista + #63, #21
static Pista + #64, #21
static Pista + #65, #21
static Pista + #66, #20
static Pista + #67, #20
static Pista + #68, #20
static Pista + #69, #20
static Pista + #70, #19
static Pista + #71, #19
static Pista + #72, #19
static Pista + #73, #19
static Pista + #74, #18
static Pista + #75, #18
static Pista + #76, #18
static Pista + #77, #18
static Pista + #78, #17
static Pista + #79, #17
static Pista + #80, #17
static Pista + #81, #17
static Pista + #82, #16
static Pista + #83, #16
static Pista + #84, #16
static Pista + #85, #16
static Pista + #86, #15
static Pista + #87, #15
static Pista + #88, #15
static Pista + #89, #15
static Pista + #90, #16
static Pista + #91, #16
static Pista + #92, #16
static Pista + #93, #16
static Pista + #94, #17
static Pista + #95, #17
static Pista + #96, #17
static Pista + #97, #17
static Pista + #98, #18
static Pista + #99, #18
static Pista + #100, #18
static Pista + #101, #18
static Pista + #102, #19
static Pista + #103, #19
static Pista + #104, #19
static Pista + #105, #19
static Pista + #106, #20
static Pista + #107, #20
static Pista + #108, #20
static Pista + #109, #20
static Pista + #110, #19
static Pista + #111, #19
static Pista + #112, #19
static Pista + #113, #19
static Pista + #114, #18
static Pista + #115, #18
static Pista + #116, #19
static Pista + #117, #19
static Pista + #118, #19
static Pista + #119, #19
static Pista + #120, #20
static Pista + #121, #20
static Pista + #122, #20
static Pista + #123, #20
static Pista + #124, #20
static Pista + #125, #20
static Pista + #126, #20
static Pista + #127, #20
static Pista + #128, #20
static Pista + #129, #20
static Pista + #130, #20
static Pista + #131, #20
static Pista + #132, #20
static Pista + #133, #20
static Pista + #134, #20
static Pista + #135, #20
static Pista + #136, #20
static Pista + #137, #20
static Pista + #138, #20
static Pista + #139, #20
static Pista + #140, #20
static Pista + #141, #20
static Pista + #142, #20
static Pista + #143, #20
static Pista + #144, #20
static Pista + #145, #20
static Pista + #146, #20
static Pista + #147, #20
static Pista + #148, #20
static Pista + #149, #20

; Preenchimento do vetor de Bonus
static Bonus + #0, #300
static Bonus + #1, #698
static Bonus + #2, #418

; Preenchimento do vetor de Obstaculo
static Obstaculo + #0, #620
static Obstaculo + #1, #378
static Obstaculo + #2, #738


;--------------------------------------------------------------------;
;						FUNCAO PRINCIPAL                             ;
;--------------------------------------------------------------------;

main:
	push fr
	push r0		; Armazena o 'JogarNovamente'
	push r1		; Parametro auxiliar
	
	; Inicializa os parametros
	loadn r1, #'s'

	; Mostra a tela inicial	
	call controlaTela
		
	; Loop que controla os jogos do usuario
	main_loop:
		; Inicializa os parametros necessarios
		call inicializaJogo
	
		; Controla as acoes necessarias do jogo
		call controlaJogo
		
		call delayFim
		
		; Desenha o final do jogo
		call desenhaFim
		
		; Verifica se o usuario quer jogar novamente
		load r0, JogarNovamente
		cmp r0, r1
		jeq main_loop
		
	call apagaTela
		
	; Termina a execucao do programa	
	pop r1
	pop r0
	pop fr
	halt

;--------------------------------------------------------------------;
;		  		FUNCOES QUE CONTROLAM O JOGO                 	     ;
;--------------------------------------------------------------------;

; Funcao que inicializa a tela e as variaveis necessarias para o correto funcionamento do jogo
inicializaJogo:
	push fr
	push r0
	
	; Limpa a tela
	call apagaTela
	
	; Define a Largura da pista
	loadn r0, #7
	store LarguraPista, r0
	
	; Inicializa o indice da pista
	loadn r0, #0
	store IndicePosicoesDaPista, r0	
	
	; Inicializa o delay da pista
	loadn r0, #8
	store DelayPista, r0

	; Inicializa o delay dos obstaculos/bonus
	loadn r0, #240
	store DelayBonus, r0	
	
	; Define o incremento do delay da pista
	loadn r0, #3
	store IncDelayPista, r0	

	; Define o maximo delay da pista
	loadn r0, #17
	store MaxDelayPista, r0	
	
	; Define o minimo delay da pista
	loadn r0, #2
	store MinDelayPista, r0	
	
	; Inicializa o delay do carro
	loadn r0, #15
	store DelayCarro, r0	
	
	; Inicializa o delay do cronometro
	loadn r0, #120
	store DelayCronometro, r0	
	
	; Inicializa a posicao do vetor de pista
	loadn r0, #0
	store IndicePista, r0
	
	; Inicializa a variavel que indica o final da pista
	loadn r0, #0
	store FimPista, r0

	; Inicializa o numero de voltas dadas
	loadn r0, #1
	store NumVoltasDadas, r0
	
	; Define o numero maximo de voltas na pista
	loadn r0, #5
	store NumVoltasPista, r0
	
	; Define o tempo inicial do cronometro
	loadn r0, #25
	store TempoCronometro, r0

	; Inicializa a variavel que mostra se o carro esta parado ou nao
	loadn r0, #0
	store CarroParado, r0

	; Inicializa a variavel que controla o fim
	loadn r0, #0
	store Fim, r0
	
	; Inicializa a variavel que controla o tamanho da string
	loadn r0, #41
	store TamString, r0
	
	; Inicializa a variavel que controla o vetor de Bonus
	loadn r0, #0
	store IndiceBonus, r0
	
	; Inicializa a variavel que controla a hora de mostrar os Bonus
	loadn r0, #0
	store MostraBonus, r0
	
	; Inicializa a variavel que controla o Bonus
	loadn r0, #0
	store PegouBonus, r0
	
	; Inicializa a variavel que controla o vetor de Obstaculo
	loadn r0, #0
	store IndiceObstaculo, r0
	
	; Inicializa a variavel que controla a hora de mostrar os Obstaculo
	loadn r0, #0
	store MostraObstaculo, r0
	
	; Inicializa a variavel que controla o Obstaculo
	loadn r0, #0
	store PegouObstaculo, r0

	; Finaliza a execucao da funcao
	pop r0
	pop fr
	rts

; Funcao responsavel por controlar o andamento do jogo
controlaJogo:
	push fr
	push r0		; Condicao que nao eh fim (0) 
	push r1		; Situacao atual do fim
	push r2		; Indice do loop que controla os delays
	push r3		; Controle do indice para chamar as funcoes desejadas
	push r4		; Controle do indice para chamar as funcoes desejadas
	
	; Inicializa os parametros necessarios
	loadn r0, #0
	loadn r2, #0
	
	; Desenha o cenario inicial do jogo	
	call desenhaCenarioInicial
	
	; Loop que controla o jogo
	controlaJogo_Loop:
		; Executa um delay
		call delayJogo
		; Movimenta a pista
		load r3, DelayPista
		mod r4, r2, r3
		cmp r4, r0
		ceq movimentaPista
		; Desenha os obstaculos/bonus
		load r3, DelayBonus
		mod r4, r2, r3
		cmp r4, r0
		ceq desenhaBonus
		ceq desenhaObstaculo
		; Movimenta o carro do usuario
		load r3, DelayCarro
		mod r4, r2, r3
		cmp r4, r0
		ceq movimentaCarro
		; Decrementa o tempo restante para o usuario concluir a pista
		load r3, DelayCronometro
		mod r4, r2, r3
		cmp r4, r0
		ceq decrementaTempo
		; Verifica a condicao de fim
		load r1, Fim
		cmp r0, r1
		jne controlaJogo_Fim
		; Incrementa o indice
		inc r2
		jmp controlaJogo_Loop
	
	; Finaliza a execucao da funcao	
	controlaJogo_Fim:
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts

; Funcao que executa um 'delay' na execucao do jogo
delayJogo:
	push fr
	push r0 	; Parametro de delay 1
	push r1		; Parametro de delay 2
	
	; Carrega o delay desejado para um parametro
	;loadn r1, #300
	loadn r1, #10
	
	; Loop que promove o delay
   	delayJogo2_Loop:
		loadn r0, #100
	   	delayJogo_Loop: 
			dec r0				
			jnz delayJogo_Loop	
			dec r1
			jnz delayJogo2_Loop

	; Finaliza a execucao da funcao	
	pop r1
	pop r0
	pop fr	
	rts
	
; Funcao que executa um 'delay' na execucao do jogo
delayFim:
	push fr
	push r0 	; Parametro de delay 1
	push r1		; Parametro de delay 2
	
	; Carrega o delay desejado para um parametro
	;loadn r1, #300
	loadn r1, #3000
	
	; Loop que promove o delay
   	delayFim2_Loop:
		loadn r0, #100
	   	delayFim_Loop: 
			dec r0				
			jnz delayFim_Loop	
			dec r1
			jnz delayFim2_Loop

	; Finaliza a execucao da funcao	
	pop r1
	pop r0
	pop fr	
	rts

; Funcao que executa um 'delay' auxiliar na execucao do jogo
delayAux:
	push fr
	push r0 	; Parametro de delay 1
	push r1		; Parametro de delay 2
	
	; Carrega o delay desejado para um parametro
	loadn r1, #1
	
	; Loop que promove o delay
   	delayAux2_Loop:
		loadn r0, #100
	   	delayAux_Loop: 
			dec r0				
			jnz delayAux_Loop	
			dec r1
			jnz delayAux2_Loop

	; Finaliza a execucao da funcao	
	pop r1
	pop r0
	pop fr	
	rts


;--------------------------------------------------------------------;
;		  		FUNCOES QUE MANIPULAM A TELA                 	     ;
;--------------------------------------------------------------------;

controlaTela:
	push fr
	push r0		; Posicao da tela
	push r1		; String do cenario
	push r2		; Cor do cenario / Verificador de tecla para cima
	push r3		; Incremento da tela / Verificador de tecla para baixo
	push r4		; Incremento do cenario
	push r5		; Limite da tela
	push r6		; Opcao escolhida
	push r7		; Verificador de opcao
	
	; Inicializacao dos parametros e primeira impressao da tela
	controlaTela_Inicializacao:
		loadn r0, #0
		loadn r1, #tela1Linha0
		loadn r2, #512
		loadn r3, #40
		loadn r4, #41
		loadn r5, #1200
		loadn r6, #1
		call telaInicial
	
	; Espera o usuario digitar ' ' para prosseguir
	; Carrega nos registradores os possiveis botoes a serem pressionados
	telaInicial_Delay:
		loadn r1, #' '
		loadn r2, #'w'
		loadn r3, #'s'
		; Captura a tecla
		inchar r0
		; Verifica se o usuario digitou 'w'
		cmp r0, r2
		jeq carregaParametros_Tela1
		; Verifica se o usuario digitou 's'
		cmp r0, r3
		jeq carregaParametros_Tela2
		; Verifica se o usuario digitou 'ESPACO'
		cmp r0, r1
		jeq verificaOpcao
		; Recomeca o loop
		jne telaInicial_Delay
	
	;Se o usuario mover o cursor para cima, imprime novamente o menu
	carregaParametros_Tela1:
		loadn r0, #0
		loadn r1, #tela1Linha0
		loadn r2, #512
		loadn r3, #40
		loadn r4, #41
		loadn r5, #1200
		loadn r6, #1
		call telaInicial	
		jmp telaInicial_Delay

	;Se o usuario mover o cursor para cima, imprime novamente o menu
	carregaParametros_Tela2:
		loadn r0, #0
		loadn r1, #tela2Linha0
		loadn r2, #512
		loadn r3, #40
		loadn r4, #41
		loadn r5, #1200
		loadn r6, #2
		call telaInicial
		jmp telaInicial_Delay

	; Se o usuario apertar espaco, verifica a opcao selecionada
	verificaOpcao:
		loadn r7, #1
		cmp r6, r7
		jeq controlaTela_Fim
		loadn r0, #0
		loadn r1, #tela3Linha0
		loadn r2, #512
		loadn r3, #40
		loadn r4, #41
		loadn r5, #1200
		loadn r6, #3
		call telaInicial
		jmp telaInicial_Delay

	controlaTela_Fim:
		pop r7
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts

; Mostra a tela inicial
telaInicial:
	push fr
	push r0		; Posicao da tela
	push r1		; String do cenario
	push r2		; Cor do cenario
	push r3		; Incremento da tela
	push r4		; Incremento do cenario
	push r5		; Limite da tela
	push r6		; Opcao digitada
	push r7		; Utilizado na comparacao

		
	; Loop que desenha o cenario na tela
	telaInicial_Loop:
		call imprimeString
		add r0, r0, r3
		add r1, r1, r4
		cmp r0, r5
		jne telaInicial_Loop

	telaInicial_Fim:
		pop r7
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts
	

; Imprime uma string na tela
imprimeString:
	push fr
	push r0	; Posicao da tela que o primeiro caractere da mensagem sera' impresso;
	push r1	; endereco onde comeca a mensagem;
	push r2	; cor da mensagem.
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	; Criterio de parada
	loadn r3, #'\0'

	; Loop que imprime os caracteres da string na tela
	imprimeString_Loop:	
		loadi r4, r1
		cmp r4, r3
		jeq imprimeString_Fim
		add r4, r2, r4
		outchar r4, r0
		inc r0
		inc r1
		jmp imprimeString_Loop
	
	; Finaliza a execucao da funcao	
	imprimeString_Fim:
		pop r4	
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts

	
; Funcao que limpa a tela, inserindo espacoes em branco em todas as posicoes
apagaTela:
	push fr
	push r0		; Posicoes da tela a serem apagadas
	push r1		; Caracter espaco para apagar a tela
	
	; Inicializa os parametros necessarios	
	loadn r0, #1200
	loadn r1, #' '
		
	; Percorre todas as posicoes da tela, inserindo o caracter espaco
	ApagaTela_Loop:
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
	
	; Termina a execucao da funcao	
	pop r1
	pop r0
	pop fr
	rts

; Funcao que apaga a pista da tela
apagaPista:
	push fr
	push r0		; Vetor de posicoes da pista
	push r1		; Indice do vetor
	push r2		; PosicoesDaPista[i]
	push r3		; Maior 'i'
	push r4		; Caracter ' '
	
	; Inicializa os parametros
	loadn r0, #PosicoesDaPista
	loadn r1, #0
	load r3, IndicePosicoesDaPista
	loadn r4, #' '	
	add r0, r0, r3
		
	; Loop que apaga a pista da tela
	apagaPista_Loop:
		; Indexa o vetor e carrega o valor em r2
		loadi r2, r0
		; Apaga a posicao da pista da tela
		outchar r4, r2
		; Verifica se a pista ja foi toda apagada
		cmp r3, r1
		jeq apagaPista_Fim
		; Incrementa o vetor	
		dec r0
		inc r1
		jmp apagaPista_Loop
			
	; Executa as acoes necessarias para finalizar a funcao
	apagaPista_Fim:
		; "Limpa" o vetor das posicoes preenchidas pela pista, e armazena o indice como 0
		loadn r1, #0
		store IndicePosicoesDaPista, r1	
		; Encerra a execucao da funcao
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr	
		rts

; Funcao que imprime uma linha da pista na tela
imprimeLinhaPista:
	push fr
	push r0		; Caracter que representa a pista na tela / Indice do vetor de posicoes da pista
	push r1		; Numero de colunas da tela / Vetor de posicoes da pista
	push r2		; Posicao do centro da linha na tela
	push r3		;R3 deve conter o centro desejado para a linha da pista
	push r4		;R4 deve conter a linha desejada na tela
	push r5		; Posicao da pista na tela
	push r6		; Largura da pista
	push r7		; Posicao do carro na tela
	
	; Inicializa os parametros necessarios
	loadn r0, #'{'
	loadn r1, #40
	load r6, LarguraPista
	load r7, PosCarro
	
	; Calcula a posicao correta do centro da linha na tela
	mul r2, r1, r4
	add r2, r2, r3
	
	; Calcula a posicao a esquerda
	sub r5, r2, r6
	dec r5
	
	; Move o carro para tras se 'bater' na pista
	cmp r5, r7
	ceq movimentaCarroParaTras
	ceq paraCarro
	
	; Imprime a esquerda
	outchar r0, r5
	
	; Calcula a posicao a direita	
	add r5, r2, r6

	; Move o carro para tras se 'bater' na pista
	cmp r5, r7
	ceq movimentaCarroParaTras
	ceq paraCarro

	; Imprime a direita
	outchar r0, r5
	
	; Carrega o vetor de posicoes da pista
	load r0, IndicePosicoesDaPista	
	loadn r1, #PosicoesDaPista
	add r1, r1, r0
	
	; Armazena as posicoes da pista no vetor
	storei r1, r5
	inc r1
	sub r5, r2, r6
	dec r5
	storei r1, r5
	inc r1
	
	; Atualiza o indice de posicoes da pista
	loadn r1, #2
	add r0, r0, r1
	store IndicePosicoesDaPista, r0
	
	; Finaliza a execucao da funcao
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts

; Funcao que imprime a velocidade atual do carro na tela
imprimeVelocidade:
	push fr
	push r0		; Velocidade atual do carro
	push r1		; Velocidade maxima do carro	
	push r2		; Velocidade minima do carro
	push r3		; Incremento de velocidade do carro	
	push r4		; Posicao da velocidade na tela
	push r5		; Caracter a ser impresso na tela
	push r6		; Cor desejada
	
	; Carrega a posicao da velocidade na tela e o valor de conversao
	loadn r4, #126
	loadn r5, #48
	loadn r6, #2816
	
	; Verifica se o carro esta parado
	load r0, CarroParado
	loadn r1, #1
	cmp r0, r1
	jne imprimeVelocidade_CarregaParametros
	
	; Se sim, imprime '0'
	add r5, r5, r6
	outchar r5, r4
	jmp imprimeVelocidade_Fim
	
	; Carrega os parametros necessarios
	imprimeVelocidade_CarregaParametros:
		load r0, DelayPista
		load r1, MinDelayPista
		load r2, MaxDelayPista
		load r3, IncDelayPista
	
	; Verifica se esta na velocidade 1
	imprimeVelocidade_V1:
		inc r5
		cmp r0, r2
		jne imprimeVelocidade_V2
		; Imprime '1'
		add r5, r5, r6
		outchar r5, r4
		jmp imprimeVelocidade_Fim
	
	; Verifica se esta na velocidade 2
	imprimeVelocidade_V2:
		sub r2, r2, r3
		inc r5
		cmp r0, r2
		jne imprimeVelocidade_V3
		; Imprime '2'
		add r5, r5, r6
		outchar r5, r4
		jmp imprimeVelocidade_Fim
	
	; Verifica se esta na velocidade 3
	imprimeVelocidade_V3:
		sub r2, r2, r3
		inc r5
		cmp r0, r2
		jne imprimeVelocidade_V4
		; Imprime '3'
		add r5, r5, r6
		outchar r5, r4
		jmp imprimeVelocidade_Fim

	; Verifica se esta na velocidade 4
	imprimeVelocidade_V4:
		sub r2, r2, r3
		inc r5
		cmp r0, r2
		jne imprimeVelocidade_V5
		; Imprime '4'
		add r5, r5, r6
		outchar r5, r4
		jmp imprimeVelocidade_Fim

	; Verifica se esta na velocidade 5
	imprimeVelocidade_V5:
		sub r2, r2, r3
		inc r5
		cmp r0, r2
		jne imprimeVelocidade_V6
		; Imprime '5'
		add r5, r5, r6
		outchar r5, r4
		jmp imprimeVelocidade_Fim

	; Verifica se esta na velocidade 6
	imprimeVelocidade_V6:
		; Imprime '6'
		inc r5
		add r5, r5, r6
		outchar r5, r4

	; Termina a execucao da funcao
	imprimeVelocidade_Fim:
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts

; Funcao que imprime o numero de voltas dadas pelo usuario
imprimeNumVoltas:
	push fr
	push r0		; Posicao da tela a ser impresso
	push r1		; Numero de voltas dadas
	push r2		; Fator de conversao para ascii
	
	; Inicializa os parametros necessarios
	loadn r0, #151
	load r1, NumVoltasDadas
	loadn r2, #48
	add r1, r1, r2
	
	; Insere a cor desejada
	loadn r2, #512
	add r1, r1, r2
	
	; Imprime o numero de voltas na tela
	outchar r1, r0	
	
	; Finaliza a execucao da funcao
	pop r2
	pop r1
	pop r0
	pop fr
	rts


;--------------------------------------------------------------------;
;	  		 FUNCOES QUE DESENHAM O CENARIO INICIAL NA TELA	         ;
;--------------------------------------------------------------------;

; Desenha o cenario inicial
desenhaCenarioInicial:
	
	; Desenha a pista inicial
	call desenhaPistaInicial
		
	; Desenha o carrinho na posicao inicial	
	call desenhaCarroInicial
	
	; Desenha a parte superior da tela, que contem informacoes do jogo
	call desenhaInformacoes
			
	; Finaliza o desenhaCenarioInicial
	rts

; Desenha a pista inicial
desenhaPistaInicial:
	push fr
	push r0		; Largura da pista
	push r1		; Caracter que representa a pista
	push r2		; Posicao atual do centro da pista
	push r3		; Limite maximo da tela
	push r4		; Incremento da tela
	push r5		; Posicao da tela para desenhar a pista
	push r6		; Vetor de posicoes da pista
	
	; Inicializa os registradores com os valores necessarios
	load r0, LarguraPista
	loadn r1, #'A'
	loadn r2, #260
	loadn r3, #1199
	loadn r4, #40
	loadn r6, #PosicoesDaPista
	
	; Loop que percorre a tela, desenhando a pista
	desenhaPistaInicial_Loop:
		; Desenha a parte esquerda da pista
		sub r5, r2, r0	
		dec r5	
		outchar r1, r5
		storei r6, r5
		inc r6
		; Desenha a parte direita da pista
		add r5, r2, r0
		outchar r1, r5
		storei r6, r5
		inc r6
		; Incrementa a posicao da pista
		add r2, r2, r4
		; Valida a posicao da pista
		cmp r2, r3
		jeg desenhaPistaInicial_Fim
		; Finaliza a funcao
		jmp desenhaPistaInicial_Loop
		
	; Finaliza a execucao da funcao
	desenhaPistaInicial_Fim:
		; Armazena o numero de posicoes preenchidas no vetor
		loadn r6, #59
		store IndicePosicoesDaPista, r6
		; Termina a execucao da funcao
		pop r6
		pop r5	
		pop r4
		pop r3	
		pop r2
		pop r1
		pop r0
		pop fr
		rts

desenhaCenarioLTInicial:
	push fr
	push r0		; Posicao da tela
	push r1		; String que representa o cenario
	push r2		; Cor do cenario
	push r3		; Indice Inicial
	push r4		; Indice Final
	push r5		; Vetor de posicoes da pista
	push r6		; Elemento do vetor
	push r7		; Limite da tela
	
	; Inicializacao de parametros
	loadn r0, #1160
	loadn r1, #CenarioLt0
	loadn r2, #256
	loadn r5, #PosicoesDaPista
	loadn r7, #200
	desenhaCenarioLTInicial_Loop:
		loadi r6, r5
		; Imprime a parte direita
		sub r3, r6, r0
		inc r3
		loadn r4, #39
		add r0, r0, r3
		call imprimeString2
		; Imprime a parte esquerda
		inc r5
		loadi r6, r5
		sub r0, r0, r3
		loadn r3, #0
		sub r4, r6, r0
		call imprimeString2
		; Atualizar os valores
		loadn r3, #40
		sub r0, r0, r3
		inc r5
		loadn r3, #41
		add r1, r1, r3
		; Condicao de fim do loop
		cmp r0, r7
		jgr desenhaCenarioLTInicial_Loop
		
	pop r7		
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts
		
; Imprime uma string na tela
imprimeString2:
	push fr
	push r0	; Posicao da tela que o primeiro caractere da mensagem sera' impresso;
	push r1	; endereco onde comeca a mensagem;
	push r2	; cor da mensagem.
	push r3	; Indice inicial da mensagem
	push r4	; Indice final da mensagem
	push r5	; Elemento da string
	
	add r1, r1, r3	
		
	; Loop que imprime os caracteres da string na tela
	imprimeString2_Loop:	
		loadi r5, r1
		add r5, r2, r5
		outchar r5, r0
		inc r0
		inc r1
		inc r3
		cmp r3, r4
		jle imprimeString2_Loop
	
	; Finaliza a execucao da funcao	
	imprimeString2_Fim:
		pop r5
		pop r4	
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts

; Desenha o carrinho na posicao inicial
desenhaCarroInicial:
	push fr
	push r0		; Centro da pista
	push r1		; Linha inicial do carro na tela
	push r2		; Numero de colunas da tela
	push r3		; Posicao do carro na tela
	push r4		; Caracter que representa o carro na tela
	
	; Carrega os parametros iniciais
	loadn r0, #20
	loadn r1, #25
	loadn r2, #40
	loadn r4, #'}'
	
	; Calcula a posicao inicial do carro na tela
	mul r3, r1, r2
	add r3, r3, r0
	
	; Imprime o carro na posicao da tela desejada	
	loadn r2, #1536
	add r4, r4, r2
	outchar r4, r3
	
	; Armazena a posicao do carro
	store PosCarro, r3
	
	; Finaliza a execucao da funcao
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts

; Desenha a parte superior da tela, inserindo as informacoes necessarias
desenhaInformacoes:
	push fr
	push r0		; Caracter que representa a faixa separadora
	push r1		; Posicao inicial da faixa na tela
	push r2		; Posicao final da faixa na tela
	push r3		; Parametro de comparacao
	
	; Inicializa os parametros da faixa separadora
	loadn r0, #3072
	loadn r1, #200
	loadn r2, #240
	loadn r3, #40
	
	; Loop que desenha a faixa horizontal na tela
	desenhaInformacoes_FaixaHorizontalLoop:
		; Imprime o caracter na posicao desejada
		outchar r0, r1
		; Incrementa a posicao da tela
		inc r1
		; Verifica se ja chegou no fim da faixa
		cmp r1, r2
		jne desenhaInformacoes_FaixaHorizontalLoop
	
	; Loop que desenha a faixa vertical a esquerda na tela
	loadn r1, #15
	loadn r2, #215
	desenhaInformacoes_FaixaVertical1Loop:
		; Imprime o caracter na posicao desejada
		outchar r0, r1
		; Incrementa a posicao da tela
		add r1, r1, r3
		; Verifica se ja chegou no fim da faixa
		cmp r1, r2
		jne desenhaInformacoes_FaixaVertical1Loop
		
	; Loop que desenha a faixa vertical a direita na tela
	loadn r1, #24
	loadn r2, #224
	desenhaInformacoes_FaixaVertical2Loop:
		; Imprime o caracter na posicao desejada
		outchar r0, r1
		; Incrementa a posicao da tela
		add r1, r1, r3
		; Verifica se ja chegou no fim da faixa
		cmp r1, r2
		jne desenhaInformacoes_FaixaVertical2Loop
	
	; Insere o tempo do cronometro na tela
	call imprimeTempo
	
	; Insere a velocidade atual do carro do usuario na tela
	call imprimeVelocidade
	loadn r0, #42
	loadn r1, #strVelocidade
	loadn r2, #2816
	call imprimeString
		
	; Insere a maior velocidade disponivel para criterio de comparacao ao usuario
	loadn r0, #'/'	; Caracter separador
	loadn r1, #127	; Posicao da tela a ser mostrada
	add r0, r0, r2	; Cor
	outchar r0, r1 	; Imprime a barra separadora
	loadn r0, #54 	; 54 representa o '6' em ascii
	add r0, r0, r2	; Cor
	inc r1
	outchar r0, r1 	; Imprime a maior velocidade	
	
	; Insere o numero de voltas dadas pelo usuario na tela
	call imprimeNumVoltas
	loadn r0, #69
	loadn r1, #strVoltas
	loadn r2, #512
	call imprimeString
	
	; Insere o numero total de voltas a serem dadas
	loadn r0, #'/'	; Caracter separador
	loadn r1, #152	; Posicao da tela a ser mostrada
	add r0, r0, r2	; Cor
	outchar r0, r1 	; Imprime a barra separadora
	load r0, NumVoltasPista
	loadn r2, #48
	add r0, r0, r2
	loadn r2, #512	
	add r0, r0, r2	; Cor
	inc r1
	outchar r0, r1 	; Imprime o numero total de voltas	

	; Termina a execucao da funcao
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts


;--------------------------------------------------------------------;
;	       		FUNCOES QUE MOVEM O CENARIO NA TELA	                 ;
;--------------------------------------------------------------------;

; Funcao que movimenta a pista na tela
movimentaPista:
	push fr
	push r0		; Vetor que contem a pista
	push r1		; Indice do vetor que contem a pista
	push r2 	; Indice maximo do vetor
	push r3		; Numero maximo de voltas / Pista[i]
	push r4		; Linha da tela
	push r5		; Numero de voltas dadas na pista
	
	; Nao executa a movimentacao se o carro estiver parado
	load r0, CarroParado
	loadn r1, #1
	cmp r0, r1
	jeq movimentaPista_Fim
	
	; Recebe os parametros necessarios
	loadn r0, #Pista
	load r1, IndicePista
	add r0, r0, r1
	loadn r2, #126
	load r3, NumVoltasPista
	loadn r4, #30
	load r5, NumVoltasDadas
	
	; Movimenta a pista se o indice for menor ou igual ao limite maximo
	cmp r1, r2
	jel movimentaPista_ApagaPista
	
	; Finaliza a execucao da funcao se o numero maximo de voltas foi alcancado
	cmp r3, r5
	jeq movimentaPista_FimPista
	
	; Incrementa o numero de voltas dadas na pista
	inc r5
	store NumVoltasDadas, r5
	call imprimeNumVoltas
	load r5, LarguraPista
	dec r5
	store LarguraPista, r5
	
	; Reinicializa os parametros
	loadn r0, #Pista	
	loadn r1, #0
	store IndiceBonus, r1	
	store IndiceObstaculo, r1	
		
	; Apaga a pista da tela
	movimentaPista_ApagaPista:
		call apagaPista	
		loadn r2, #6

	; Desenha a pista 'Atualizada' na tela
	movimentaPista_Loop:
		; Decrementa a linha da pista
		dec r4		
		; Recebe um valor do vetor da pista
		loadi r3, r0
		inc r0
		; Imprime a pista na linha contida em r4
		call imprimeLinhaPista
		; Verifica o fim do loop
		cmp r4, r2
		jne movimentaPista_Loop		
		
	; Atualiza o indice da pista
	inc r1
	store IndicePista, r1
	
	; Reescreve o cenario
	call desenhaCenarioLTInicial
	
	; Desenha os Bonus na tela
	call desenhaBonus
	
	; Desenha os Obstaculos na tela
	call desenhaObstaculo
	
	; Finaliza a execucao da funcao	
	movimentaPista_Fim:
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts
	
	; Finaliza a execucao da funcao verificando se a pista foi completada
	movimentaPista_FimPista:
		; Verifica se ja esta no final da pista
		load r2, FimPista
		loadn r1, #4
		cmp r2, r1
		jeq movimentaPista_InicializaFimCarro
		; Movimenta o final da pista
		inc r2
		store FimPista, r2
		call movimentaFimPista
		jmp movimentaPista_FimPista
	
	; Inicializa o movimento final do carro
	movimentaPista_InicializaFimCarro:
		load r0, PosCarro
		loadn r1, #40
		loadn r3, #10

	; Movimenta o carro ate chegar na faixa final	
	movimentaPista_FimCarro:
		call delayJogo
		call delayJogo
		call delayJogo
		call delayJogo
		call delayJogo
		call delayJogo
		call delayJogo
		div r2, r0, r1
		loadn r4, #' '
		outchar r4, r0
		loadn r4, #'}'
		loadn r5, #1536
		add r4, r4, r5
		sub r0, r0, r1
		outchar r4, r0
		cmp r2, r3
		jgr movimentaPista_FimCarro			
				
	; Finaliza a execucao da funcao indicando termino do jogo
	movimentaPista_FimJogo:
		loadn r2, #1
		store Fim, r2
		jmp movimentaPista_Fim

desenhaBonus:
	push fr
	push r0		; Vetor de Bonus
	push r1		; Elemento do vetor
	push r2		; Indice da pista /  Indice do obstaculo
	push r3		; Cor
	
	; Verifica se existe um obstaculo na tela
	load r0, MostraBonus
	loadn r1, #0
	cmp r0, r1
	jgr desenhaBonus_DecrementaTempo
	
	; Verifica se esta na hora de por um obstaculo
	load r0, NumVoltasDadas
	loadn r1, #2
	loadn r2, #0
	mod r0, r0, r1
	cmp r0, r2
	jne desenhaBonus_Fim
	loadn r0, #0
	loadn r1, #30
	load r2, IndicePista
	mod r2, r2, r1
	cmp r2, r0
	jne desenhaBonus_Fim
	
	; Inicializacao dos parametros
	loadn r0, #Bonus
	loadn r1, #3
	load r2, IndiceBonus
	cmp r1, r2
	jeq desenhaBonus_Fim
	add r0, r0, r2
	loadi r1, r0
	
	; Verifica se nao vai  'casar' com o carro
	load r0, PosCarro
	cmp r0, r1
	jeq desenhaBonus_Fim
		
	; Imprime o obstaculo na tela
	loadn r0, #'x'
	loadn r3, #512
	add r0, r0, r3
	outchar r0, r1
	loadn r0, #20
	store MostraBonus, r0
	loadn r0, #0
	store PegouBonus, r0
	
	; Incrementa o indice do obstaculo
	inc r2
	store IndiceBonus, r2
	jmp desenhaBonus_Fim
	
	desenhaBonus_DecrementaTempo:
		dec r0
		store MostraBonus, r0
		cmp r0, r1
		jne desenhaBonus_Fim
		
	desenhaBonus_ApagaObstaculo:
		loadn r0, #Bonus
		load r1, IndiceBonus
		dec r1
		add r0, r0, r1
		loadi r1, r0
		loadn r0, #' '
		outchar r0, r1
	
	; Encerra a execucao do programa	
	desenhaBonus_Fim:
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts
		
desenhaObstaculo:
	push fr
	push r0		; Vetor de Obstaculo
	push r1		; Elemento do vetor
	push r2		; Indice da pista /  Indice do obstaculo
	push r3		; Cor
	
	; Verifica se existe um obstaculo na tela
	load r0, MostraObstaculo
	loadn r1, #0
	cmp r0, r1
	jgr desenhaObstaculo_DecrementaTempo
	
	; Verifica se esta na hora de por um obstaculo
	load r0, NumVoltasDadas
	loadn r1, #2
	loadn r2, #0
	mod r0, r0, r1
	cmp r0, r2
	jne desenhaObstaculo_Fim
	loadn r0, #0
	loadn r1, #20
	load r2, IndicePista
	mod r2, r2, r1
	cmp r2, r0
	jne desenhaObstaculo_Fim
	
	; Inicializacao dos parametros
	loadn r0, #Obstaculo
	loadn r1, #3
	load r2, IndiceObstaculo
	cmp r1, r2
	jeq desenhaObstaculo_Fim
	add r0, r0, r2
	loadi r1, r0
	
	; Verifica se nao vai  'casar' com o carro
	load r0, PosCarro
	cmp r0, r1
	jeq desenhaObstaculo_Fim
		
	; Imprime o obstaculo na tela
	loadn r0, #'~'
	loadn r3, #2304
	add r0, r0, r3
	outchar r0, r1
	loadn r0, #20
	store MostraObstaculo, r0
	loadn r0, #0
	store PegouObstaculo, r0
	
	; Incrementa o indice do obstaculo
	inc r2
	store IndiceObstaculo, r2
	jmp desenhaObstaculo_Fim
	
	desenhaObstaculo_DecrementaTempo:
		dec r0
		store MostraObstaculo, r0
		cmp r0, r1
		jne desenhaObstaculo_Fim
		
	desenhaObstaculo_ApagaObstaculo:
		loadn r0, #Obstaculo
		load r1, IndiceObstaculo
		dec r1
		add r0, r0, r1
		loadi r1, r0
		loadn r0, #' '
		outchar r0, r1
	
	; Encerra a execucao do programa	
	desenhaObstaculo_Fim:
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts

; Funcao responsavel por mover a faixa que indica o final da pista
movimentaFimPista:
	push fr
	push r0		; Controle do final da pista
	push r1		; Caracter da faixa de final da pista
	push r2		; Posicao da tela a ser impresso
	push r3		; Parametros auxiliares
	push r4		; Parametros auxiliares
	
	; Movimenta o carro para tras
	load r0, PosCarro
	loadn r1, #40
	loadn r2, #29
	movimentaFimPista_Loop:
		call delayJogo
		call delayJogo
		call delayJogo
		call delayJogo
		call delayJogo
		call delayJogo
		div r3, r0, r1
		cmp r3, r2
		jeq movimentaFimPista_Parametros
		loadn r4, #' '
		outchar r4, r0
		loadn r4, #'}'
		loadn r3, #1536
		add r4, r4, r3
		add r0, r0, r1
		outchar r4, r0
		jmp movimentaFimPista_Loop
	
	; Carrega os parametros necessarios
	movimentaFimPista_Parametros:
		store PosCarro, r0
		load r0, FimPista
		loadn r1, #'-'
	
	; Calcula a posicao do centro da faixa na tela
	loadn r2, #5
	loadn r3, #40
	add r2, r2, r0	
	mul r2, r2, r3
	loadn r3, #20
	add r2, r2, r3

	; Loop que desenha o lado esquerdo da faixa	
	load r3, LarguraPista
	sub r0, r2, r3
	movimentaFimPista_LoopEsq:
		outchar r1, r0
		inc r0
		cmp r0, r2
		jne movimentaFimPista_LoopEsq
	
	; Loop que desenha o lado direito da faixa
	add r0, r2, r3
	movimentaFimPista_LoopDir:
		outchar r1, r2
		inc r2
		cmp r2, r0
		jne movimentaFimPista_LoopDir
	
	; Finaliza a execucao da funcao	
	pop r4
	pop r3
	pop r2	
	pop r1
	pop r0
	pop fr
	rts

; Funcao que movimenta o carro do usuario na tela
movimentaCarro:
	push fr
	push r0		; Tecla que representa o movimento do carro desejado pelo usuario
	push r1		; Caracter que comparacao para uso em um 'switch'
	
	; Le o movimento desejado pelo usuario
	inchar r0
	
	; Realiza o movimento para frente se 'w'
	loadn r1, #'w'
	cmp r0, r1
	ceq movimentaCarroParaFrente
	
	; Realiza o movimento para a direita se 'd'
	loadn r1, #'d'
	cmp r0, r1
	ceq movimentaCarroParaDireita
	
	; Realiza o movimento para a esquerda se 'a'
	loadn r1, #'a'
	cmp r0, r1
	ceq movimentaCarroParaEsquerda

	; Realiza o movimento para tras (FREIO) se 's'
	loadn r1, #'s'
	cmp r0, r1
	ceq movimentaCarroParaTras
	
	; Acelera o carro se ' '
	loadn r1, #' '
	cmp r0, r1
	ceq aceleraCarro

	; Freia o carro se 'p'
	loadn r1, #'p'
	cmp r0, r1
	ceq freiaCarro
	
	; Verifica se o carro passou sobre o obstaculo ou bonus
	call atualizaIncTempo
	call atualizaDecTempo

	; Finaliza a execucao da funcao
	pop r1
	pop r0
	pop fr
	rts
	
; Incrementa o tempo se o usuario passar sobre um bonus
atualizaIncTempo:
	push fr
	push r0		; Posicao do carro
	push r1		; Vetor de Bonus
	push r2		; Posicao do obstaculo
	
	; Verifica se ja pegou o bonus
	load r0, PegouBonus
	loadn r1, #0
	cmp r0, r1
	jne atualizaIncTempo_Fim
	
	; Verifica se existe obstaculo na tela
	load r0, MostraBonus
	loadn r1, #0
	cmp r0, r1
	jeq atualizaIncTempo_Fim
	
	; Recebe os parametros necessarios
	load r0, PosCarro
	loadn r1, #Bonus
	load r2, IndiceBonus
	dec r2
	add r1, r1, r2
	loadi r2, r1
	
	; Verifica se atingiu
	cmp r0, r2
	jne atualizaIncTempo_Fim
	
	; Incrementa o tempo
	load r0, TempoCronometro
	loadn r1, #10
	add r0, r0, r1
	store TempoCronometro, r0
	call imprimeTempo
	loadn r0, #1
	store PegouBonus, r0
	
	; Finaliza a execucao da funcao
	atualizaIncTempo_Fim:
		pop r2
		pop r1
		pop r0
		pop fr
		rts
	
; Decrementa o tempo se o usuario passar sobre um obstaculo
atualizaDecTempo:
	push fr
	push r0		; Posicao do carro
	push r1		; Vetor de Bonus
	push r2		; Posicao do obstaculo
	
	; Verifica se ja pegou o bonus
	load r0, PegouObstaculo
	loadn r1, #0
	cmp r0, r1
	jne atualizaDecTempo_Fim
	
	; Verifica se existe obstaculo na tela
	load r0, MostraObstaculo
	loadn r1, #0
	cmp r0, r1
	jeq atualizaDecTempo_Fim
	
	; Recebe os parametros necessarios
	load r0, PosCarro
	loadn r1, #Obstaculo
	load r2, IndiceObstaculo
	dec r2
	add r1, r1, r2
	loadi r2, r1
	
	; Verifica se atingiu
	cmp r0, r2
	jne atualizaDecTempo_Fim
	
	; Decrementa o tempo
	load r0, TempoCronometro
	loadn r1, #10
	cmp r0, r1
	jel atualizaDecTempo_FimTempo
	
	sub r0, r0, r1
	store TempoCronometro, r0
	call imprimeTempo
	loadn r0, #1
	store PegouObstaculo, r0
	
	; Finaliza a execucao da funcao
	atualizaDecTempo_Fim:
		pop r2
		pop r1
		pop r0
		pop fr
		rts	
		
	; Zera o tempo do jogador
	atualizaDecTempo_FimTempo:
		; Impoe a condicao de fim por tempo acabado (Fim = 2)
		loadn r0, #2
		store Fim, r0
		loadn r0, #0
		store TempoCronometro, r0
		call imprimeTempo
		jmp atualizaDecTempo_Fim
		

;--------------------------------------------------------------------;
;        FUNCOES QUE MANIPULAM O MOVIMENTO DO CARRO DO USUARIO       ;
;--------------------------------------------------------------------;

; Freia o carro
freiaCarro:
	push fr
	push r0		; Delay da pista 
	push r1		; Maximo delay da pista
	
	; Recebe os parametros necessarios
	load r0, DelayPista
	load r1, MaxDelayPista
	
	; Verifica se ja esta com o maximo delay e para o carro, se sim
	cmp r0, r1
	jeq freiaCarro_ParaCarro
	
	; Freia o carro, aumentando o delay do jogo 
	load r1, IncDelayPista
	add r0, r0, r1
	store DelayPista, r0
	jmp freiaCarro_Fim
	
	freiaCarro_ParaCarro:
		loadn r0, #1
		store CarroParado, r0
	
	; Finaliza a execucao da funcao
	freiaCarro_Fim:
		; Atualiza a velocidade na tela
		call imprimeVelocidade
		pop r1
		pop r0
		pop fr
		rts
	
; Para o carro
paraCarro:
	push fr
	push r0		; Delay da pista 
	
	; Altera o delay da pista
	load r0, MaxDelayPista
	store DelayPista, r0
	
	; Para o carro	
	loadn r0, #1
	store CarroParado, r0
	
	; Finaliza a execucao da funcao
	call imprimeVelocidade
	pop r0
	pop fr
	rts

; Acelera o carro
aceleraCarro:
	push fr
	push r0		; Delay da pista
	push r1		; Minimo delay da pista	
	
	; Verifica se o carro esta parado
	load r0, CarroParado
	loadn r1, #1
	cmp r0, r1
	jeq aceleraCarro_Parado
		
	; Recebe os parametros necessarios
	load r0, DelayPista
	load r1, MinDelayPista
	
	; Verifica se ja esta com o minimo delay
	cmp r0, r1
	jeq aceleraCarro_Fim
	
	; Acelera o carro, diminuindo o delay do jogo 
	load r1, IncDelayPista
	sub r0, r0, r1
	store DelayPista, r0
	jmp aceleraCarro_Fim	
		
	; Tira o carro do repouso, se necessario
	aceleraCarro_Parado:	
		loadn r0, #0
		store CarroParado, r0
		load r0, MaxDelayPista
		store DelayPista, r0

	; Finaliza a execucao da funcao
	aceleraCarro_Fim:
		; Atualiza a velocidade na tela
		call imprimeVelocidade
		pop r1
		pop r0
		pop fr
		rts

; Move o carro para frente
movimentaCarroParaFrente:
	push fr
	push r0		; Nova Posicao do carro na tela
	push r1		; Caracter que representa o carro na tela
	push r2		; Antiga posicao do carro na tela
	push r3		; Valida movimento
	push r4		; Linha limite para o movimento
	push r5		; Linha atual do carro
	
	; Carrega a posicao atual do carro na tela
	load r2, PosCarro
	
	; Verifica se esta no limite
	loadn r4, #40
	div r5, r2, r4
	loadn r4, #6
	cmp r5, r4
	jeq movimentaCarroParaFrente_Fim
	
	; Calcula a nova posicao do carro
	loadn r1, #40
	sub r0, r2, r1
	
	; Valida o movimento desejado
	call verificaBarreiraPista
	load r3, ValidaMovimento
	loadn r1, #0
	cmp r1, r3
	jeq movimentaCarroParaFrente_Fim	
	
	; Apaga o carro da posicao atual
	loadn r1, #' '
	outchar r1, r2	
	
	call delayAux
	
	; Imprime o carro na nova posicao
	loadn r1, #'}'
	loadn r3, #1536
	add r1, r1, r3
	outchar r1, r0
	
	; Armazena a nova posicao do carro na memoria
	store PosCarro, r0
	
	; Finaliza a execucao da funcao
	movimentaCarroParaFrente_Fim:
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr		
		rts
	
; Move o carro para a direita
movimentaCarroParaDireita:
	push fr
	push r0		; Nova Posicao do carro na tela
	push r1		; Caracter que representa o carro na tela
	push r2		; Antiga Posicao do carro na tela
	push r3		; Valida Movimento
	
	; Carrega a posicao atual do carro na tela
	load r2, PosCarro
	
	; Calcula a nova posicao do carro
	loadn r1, #1
	add r0, r2, r1
	
	; Valida o movimento desejado
	call verificaBarreiraPista
	load r3, ValidaMovimento
	loadn r1, #0
	cmp r1, r3
	ceq freiaCarro
	jeq movimentaCarroParaDireita_Fim
	
	; Apaga o carro da posicao atual
	loadn r1, #' '
	outchar r1, r2	
	
	call delayAux
	
	; Imprime o carro na nova posicao
	loadn r1, #'}'
	loadn r3, #1536
	add r1, r1, r3
	outchar r1, r0
	
	; Armazena a nova posicao do carro na memoria
	store PosCarro, r0
	
	; Finaliza a execucao da funcao
	movimentaCarroParaDireita_Fim:
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr		
		rts
	
; Move o carro para a esquerda
movimentaCarroParaEsquerda:
	push fr
	push r0		; Nova Posicao do carro na tela
	push r1		; Caracter que representa o carro na tela
	push r2		; Antiga Posicao do carro na tela
	push r3		; Valida Movimento

	; Carrega a posicao atual do carro na tela
	load r2, PosCarro	
	
	; Calcula a nova posicao do carro
	loadn r1, #1
	sub r0, r2, r1
	
	; Valida o movimento desejado
	call verificaBarreiraPista
	load r3, ValidaMovimento
	loadn r1, #0
	cmp r1, r3
	ceq freiaCarro
	jeq movimentaCarroParaEsquerda_Fim
	
	; Apaga o carro da posicao atual
	loadn r1, #' '
	outchar r1, r2
	
	call delayAux

	; Imprime o carro na nova posicao
	loadn r1, #'}'
	loadn r3, #1536
	add r1, r1, r3
	outchar r1, r0
	
	; Armazena a nova posicao do carro na memoria
	store PosCarro, r0
	
	; Finaliza a execucao da funcao
	movimentaCarroParaEsquerda_Fim:
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr		
		rts
	
; Move o carro para tras
movimentaCarroParaTras:
	push fr
	push r0		; Nova Posicao do carro na tela
	push r1		; Caracter que representa o carro na tela
	push r2		; Antiga Posicao do carro na tela
	push r3		; Valida Movimento
	push r4		; Linha-Limite
	push r5		; Linha atual do carro

	; Carrega a posicao atual do carro na tela
	load r2, PosCarro
	
	; Verifica se esta no limite
	loadn r4, #40
	div r5, r2, r4
	loadn r4, #29
	cmp r5, r4
	jeq movimentaCarroParaTras_Fim

	; Calcula a nova posicao do carro
	loadn r1, #40
	add r0, r2, r1
		
	; Valida o movimento desejado
	call verificaBarreiraPista
	load r3, ValidaMovimento
	loadn r1, #0
	cmp r1, r3
	jeq movimentaCarroParaTras_Fim
	
	; Apaga o carro da posicao atual
	loadn r1, #' '
	outchar r1, r2
		
	call delayAux	
		
	; Imprime o carro na nova posicao
	loadn r1, #'}'
	loadn r3, #1536
	add r1, r1, r3
	outchar r1, r0
	
	; Armazena a nova posicao do carro na memoria
	store PosCarro, r0
	
	; Finaliza a execucao da funcao
	movimentaCarroParaTras_Fim:
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr		
		rts
	
; Funcao que verifica se um movimento desejado pelo usuario eh valido
verificaBarreiraPista:
	push fr
	push r0		; Posicao desejada para o carro
	push r1		; Vetor de posicoes da pista
	push r2		; Indice do vetor
	push r3		; Elemento do vetor para comparacao
	push r4		; Parametro que valida/invalida o movimento
	
	; Carrega os parametros necessarios
	loadn r1, #PosicoesDaPista
	load r2, IndicePosicoesDaPista
	inc r2
	loadn r4, #0
	add r1, r1, r2
	
	; Loop que verifica se a posicao esta ocupada
	verificaBarreiraPista_Loop:
		; Decrementa os indices
		dec r2
		dec r1
		; Carrega um elemento do vetor
		loadi r3, r1
		; Compara com a posicao desejada	
		cmp r3, r0
		jeq verificaBarreiraPista_InvalidaMovimento
		; Valida os indices
		cmp r2, r4
		jne verificaBarreiraPista_Loop
			
	; Valida o movimento
	loadn r4, #1
	store ValidaMovimento, r4
	jmp verificaBarreiraPista_Fim
	
	; Invalida o movimento desejado pelo usuario
	verificaBarreiraPista_InvalidaMovimento:
		loadn r4, #0
		store ValidaMovimento, r4
				
	; Finaliza a execucao do proggrama
	verificaBarreiraPista_Fim:
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts


;--------------------------------------------------------------------;
;                FUNCOES QUE MANIPULAM O CRONOMETRO                  ;
;--------------------------------------------------------------------;

; Funcao que diminui em '1s' o tempo mostrado no cronometro, e atualiza-o na tela
decrementaTempo:
	push fr
	push r0 	; Tempo atual mostrado no cronometro 
	push r1		; 0, para comparacao
	
	; Carrega os parametros necessarios
	load r0, TempoCronometro
	
	; Diminui '1s' no tempo restante
	dec r0
	store TempoCronometro, r0
	
	; Imprime o tempo na tela
	call imprimeTempo
	
	; Verifica se acabou o tempo
	cmp r0, r1
	jne decrementaTempo_Fim
	
	; Impoe a condicao de fim por tempo acabado (Fim = 2)
	loadn r0, #2
	store Fim, r0

	; Finaliza a execucao da funcao
	decrementaTempo_Fim:
		pop r1
		pop r0
		pop fr
		rts

; Funcao que imprime o tempo na tela
imprimeTempo:
	push fr
	push r0		; Tempo a ser exibido (2 digitos)
	push r1		; Posicao da tela para mostrar o tempo
	push r2		; 10, dezena que auxilia os calculos
	push r3		; 48, numero que auxilia na conversao de numeros em caracteres ascii
	push r4		; Contem a dezena ou a unidade do numero que representa o tempo
	push r5		; Contem o numero a ser impresso no codigo ascii
	push r6		; Cor
	
	; Carrega os parametros necessarios
	load r0, TempoCronometro
	loadn r1, #99
	loadn r2, #10
	loadn r3, #48
	
	; Insere a cor desejada
	cmp r0, r2
	jgr imprimeTempo_Calcula
	
	; Calcula a dezena do numero e insere a cor
	imprimeTempo_CalculaCor:
		loadn r6, #2304
		div r4, r0, r2
		jmp imprimeTempo_Converte
		
	; Calcula a dezena do numero
	imprimeTempo_Calcula:
		loadn r6, #0
		div r4, r0, r2
	
	; Converte a dezena para codigo ascii e imprime
	imprimeTempo_Converte:
		add r5, r4, r3
	
	add r5, r5, r6
	outchar r5, r1
	inc r1
	
	; Calcula a unidade do numero
	mul r4, r4, r2
	sub r4, r0, r4
	
	; Converte a unidade para codigo ascii e imprime
	add r5, r4, r3
	add r5, r5, r6
	outchar r5, r1
	
	; Finaliza a execucao da funcao
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts

;--------------------------------------------------------------------;
;                FUNCOES QUE MANIPULAM O FINAL DO JOGO               ;
;--------------------------------------------------------------------;

; Funcao que controla o final do jogo
desenhaFim:
	push fr
	push r0 	; Controle do final de jogo
	push r1		; Parametro auxiliar para o switch
	
	; Seta o 'JogarNovamente'
	loadn r0, #'n'
	store JogarNovamente, r0
	
	; Carrega os parametros necessarios
	load r0, Fim
	
	; Verifica se o usuario atingiu o objetivo
	loadn r1, #1
	cmp r0, r1
	ceq desenhaFimSucesso
	
	; Verifica se acabou por tempo
	loadn r1, #2
	cmp r0, r1
	ceq desenhaFimTempo
	
	; Finaliza a funcao
	pop r1
	pop r0
	pop fr
	rts

; Desenha o final do jogo quando o usuario atinge o objetivo
desenhaFimSucesso:
	push fr
	push r0		; Posicao da tela
	push r1		; String a ser exibida
	push r2		; Cor da string
	push r3		; Parametros auxiliares	'
	push r4		; Parametros auxiliares	'
	push r5		; Parametros auxiliares	'
	push r6		; Parametros auxiliares	'
	
	; Inicializa os parametros
	loadn r0, #0
	loadn r1, #tela5Linha0
	loadn r2, #512
	loadn r3, #41
	loadn r4, #1200
	loadn r5, #40
	
	; Imprime a tela
	desenhaFimSucesso_Loop:
		call imprimeString
		add r1, r1, r3
		add r0, r0, r5
		cmp r0, r4
		jne desenhaFimSucesso_Loop
	
	; Imprime o numero de segundos que restou
	loadn r0, #819
	load r1, TempoCronometro
	loadn r6, #10
	loadn r3, #48
	loadn r5, #1536
	div r2, r1, r6
	add r4, r2, r3
	add r4, r4, r5
	outchar r4, r0
	inc r0
	mul r2, r2, r6
	sub r2, r1, r2
	add r4, r2, r3
	add r4, r4, r5
	outchar r4, r0
	
	; Le a opcao desejada pelo usuario
	call digLetra
	
	; Finaliza a execucao da funcao
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts

; Desenha o final do jogo quando o tempo acaba
desenhaFimTempo:
	push fr
	push r0		; Posicao da tela
	push r1		; String a ser exibida
	push r2		; Cor da string
	push r3		; Parametros auxiliares	'
	push r4		; Parametros auxiliares	'
	push r5		; Parametros auxiliares	'
	
	; Inicializa os parametros
	loadn r0, #0
	loadn r1, #tela4Linha0
	loadn r2, #512
	loadn r3, #41
	loadn r4, #1200
	loadn r5, #40
	
	; Imprime a tela
	desenhaFimTempo_Loop:
		call imprimeString
		add r1, r1, r3
		add r0, r0, r5
		cmp r0, r4
		jne desenhaFimTempo_Loop
	
	; Le a opcao desejada pelo usuario
	call digLetra
	
	; Finaliza a execucao da funcao
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts

; Funcao que le uma letra digitada pelo usuario
digLetra:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	
	loadn r1, #255
	loadn r2, #0
	loadn r3, #'s'
	loadn r4, #'n'

	; Leitura da letra
	digLetra_Loop:
		inchar r0 ; Armazena o caracter lido em r0
		cmp r0, r1
		jeq digLetra_Loop
		cmp r0, r2
		jeq digLetra_Loop
		cmp r0, r3
		jeq digLetra_Armazena
		cmp r0, r4
		jeq digLetra_Armazena
		jmp digLetra_Loop
	
	; Armazena o caracter lido em 'Letra'
	digLetra_Armazena:
		store JogarNovamente, r0
	
	; Finaliza a execucao da funcao
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr	
	rts


;------------------------------------------------------------------------------------------
