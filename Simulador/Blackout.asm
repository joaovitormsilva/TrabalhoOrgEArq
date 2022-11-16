; Blackout

jmp main

; Variaveis e constantes
posPersonagem: var #1			; Contem a posicao atual da Nave
posAntPersonagem: var #1		; Contem a posicao anterior da Nave

;*** Inicializando globais da password e catalogando as palavras
;***************************************************************************************************

chaveRandom: var #2
Palavra: var #20		
TamanhoPalavra: var #1
Letra: var #1
posLetra: var #1
PalavraDigitada: var #20
posCursor: var #2

; --Catalogo com as palavras
word0: string "abacate"
word1: string "mensagem"
word2: string "pizza"
word3: string "dignidade"
word4: string "inapto"
word5: string "hortensia"
word6: string "problema"
word7: string "carro"
word8: string "maca"
word9: string "parafuseta"
;word10: string "casual"
;word11: string "alegria"
;word12: string "camiseta"
;word13: string "vulnerabilidade"
;word14: string "pressa"
;word15: string "vazamento"
;word16: string "perpendicular"
;word17: string "improviso"
;word18: string "empatia"
;word19: string "cozinha"

; --Catalogo de referencias para as palavras (numeros estaticos podem variar de acorodo com tamanhos)
Catalogo : var #20
static Catalogo + #0, #word0
static Catalogo + #2, #word1
static Catalogo + #4, #word2
static Catalogo + #6, #word3
static Catalogo + #8, #word4
static Catalogo + #10, #word5
static Catalogo + #12, #word6
static Catalogo + #14, #word7
static Catalogo + #16, #word8
static Catalogo + #18, #word9
;static Catalogo + #20, #word10
;static Catalogo + #22, #word11
;static Catalogo + #24, #word12
;static Catalogo + #26, #word13
;static Catalogo + #28, #word14
;static Catalogo + #30, #word15
;static Catalogo + #32, #word16
;static Catalogo + #34, #word17
;static Catalogo + #36, #word18
;static Catalogo + #38, #word19

; --Catalogo com o tamanho das respectivas palavras do catalogo
catTamanhos: var #10 		; Tamanho do catalogo de tamanho = quantidade de palavras no catalogo original
static catTamanhos + #0, #7
static catTamanhos + #1, #8
static catTamanhos + #2, #5
static catTamanhos + #3, #9
static catTamanhos + #4, #6
static catTamanhos + #5, #9
static catTamanhos + #6, #8
static catTamanhos + #7, #5
static catTamanhos + #8, #4
static catTamanhos + #9, #10
;static catTamanhos + #10, #6
;static catTamanhos + #11, #7
;static catTamanhos + #12, #8
;static catTamanhos + #13, #15
;static catTamanhos + #14, #6
;static catTamanhos + #15, #9
;static catTamanhos + #16, #13
;static catTamanhos + #17, #9
;static catTamanhos + #18, #7
;static catTamanhos + #19, #7

;****************************************************************************************

;***************************************************** INICIO DO Blackout

msg_start: string "PRESS 'SPACE' TO START" ; mensagem de inicio.

main:
	; Tela inicial
	call ApagaTela
	loadn R1, #tela6Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #1536  			; cor teal!
	call ImprimeTela    		;  Rotina de Impresao de Cenario na Tela Inteira
	
	
	; printa a mensagem de inicio.
	loadn R0, #1009			; posicao na tela onde a mensagem sera escrita
	loadn R1, #msg_start	; carrega r1 com o endereco do vetor que contem a mensagem
	loadn R2, #0			; seleciona a cor da mensagem
	call ImprimeStr
	
	loop_espera_iniciar: ; espera o jogador iniciar.

		loadn r0, #0 ; limpa o registrador que recebera input.
		inchar r0 ; tenta receber input.
		
		loadn r1, #' ' ; verifica se o input ocorreu.
		cmp r0, r1
		jeq start ; inicia o jogo.

		jmp loop_espera_iniciar ; continua o loop.
	
	
	start:
	
	; mapa 1	
	call ApagaTela
	loadn R1, #telaMp3Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #2304  			; cor teal!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
	
	; icmc	
	loadn R1, #telaICMCLinha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #2816  			; cor amarelo!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
	
	; veneno	
	loadn R1, #telaVeneno3Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #1280  			; cor roxo!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
	
	
	; chegada	
	loadn R1, #telaChegada3Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #512  			; cor verde!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
	 

    
    loadn R0, #1158			
	store posPersonagem, R0		; Zera Posicao Atual da Nave
	store posAntPersonagem, R0	; Zera Posicao Anterior da Nave
	
	loadn R1, #'*'
	outchar R1, R0 ; Printa personagem 
	
	loadn R0, #0			; Contador para os Mods	= 0
	loadn R2, #0			; Para verificar se (mod(c/10)==0
	loadn R3, #0
	loadn R5, #999          ; indica que acabou de comecar		
	
	loop:
		; rotina de movimentacao do personagem 
		loadn R1, #5    ; "slowness" (inversamente prop a velocidade)
		mod R1, R0, R1  ; resto p compara
		cmp R1, R2		; if (mod(c/5)==0
		ceq MovePersonagem	; chama rotina de movimentacao do personagem

    ; verifica se morreu 
		loadn r6, #2    ; r6=2  
		cmp r6, r7      ; morreu?
		jeq ImprimeStr   ; sim: pula para rotina de password
		
		; verifica se ganhou 
		loadn r6, #3    ; r6=3
		cmp r6, r7      ; ganhou?
		jeq ganhou    ; sim: pula para rotina de ganhou
	; **********************************************************************************
	;		PISCAR TELA ----- COMENTADO
	;***********************************************************************************
			
		; piscar tela
		;loadn R1, #500    ; a cada 500 ciclos, entra (500 =~ 1s)
		;mod R1, R0, R1    ; resto p compara
		;cmp R1, R2		  ; if (mod(c/500)==0
		;jeq conta_pisca_tela  
		;jmp pula_pisca_tela
	;	conta_pisca_tela:
		;	inc r3           ; entra aqui a cada 1s aproximadamente
			
			;loadn r1, #3     ; apaga o mapa dps de 5s
			;cmp r1, r3       ; 
			;ceq ApagaMapaIni ; 
			
			;loadn r1, #1
			;cmp r1, r5       ; r5 = 1 ou 0 (map apagado?)
			;ceq ApagaMapa    ; subrotina a ser chamada a cada x segundos
			
			;loadn r1, #4	 ; tempo x em segundos aprox	
			;;mod r1, r3, r1  
			;cmp r1, r2
			;;ceq MostraMapa    ; subrotina a ser chamada a cada x segundos
			
			
		;;pula_pisca_tela:	
;************************************************************************************	
			
		; delay do jogo
		call Delay
		inc R0 	;c++
		jmp loop
		
	gameover:
		call Delay2
		call ApagaTela
		loadn R1, #telaGameOverLinha0	; Endereco onde comeca a primeira linha do cenario!!
		loadn R2, #2304  			; cor vermelha!
		call ImprimeTela2    		;  Rotina de Impresao de Cenario na Tela Inteira
		
		loadn R1, #telaRestartLinha0	; Endereco onde comeca a primeira linha do cenario!!
		loadn R2, #0     			; cor branca!
		call ImprimeTela2    		;  Rotina de Impresao de Cenario na Tela Inteira
		
		jmp restart_loop
	
	ganhou:
		call Delay2
		call ApagaTela
		
		;PASSWORD
		loadn r1, #tela2Linha0 ; tela2 == tela password
		call ImprimeTela ;prepara tela para algo 
		call SorteiaPalavra ;
		call ImprimeTelaPass 
		;////////////////
		;loadn R1, #telaVenceuLinha0	; Endereco onde comeca a primeira linha do cenario!!
		;loadn R2, #512  			; cor verde!
		;;call ImprimeTela2    		;  Rotina de Impresao de Cenario na Tela Inteira
		
		loadn R1, #telaRestartLinha0	; Endereco onde comeca a primeira linha do cenario!!
		loadn R2, #0     			; cor branca!
		call ImprimeTela2    		;  Rotina de Impresao de Cenario na Tela Inteira
		
	restart_loop: ; espera o jogador iniciar.

		loadn r0, #0 ; limpa o registrador que recebera input.
		inchar r0 ; tenta receber input.
		
		loadn r1, #' ' ; verifica se o input ocorreu.
		cmp r0, r1
		jeq restart_game ; pula para reiniciar o jogo.

		jmp restart_loop ; continua o loop.
			
	restart_game:
	
		loadn r1, #255 ; carrega para comparacao.
		espera_soltar_tecla_restart: ; espera a tecla ser solta.
		
		inchar r0
		cmp r1, r0 ; condicao de saida.
		jeq espera_soltar_tecla_restart_exit
		
		jmp espera_soltar_tecla_restart ; continua o loop.
		
	espera_soltar_tecla_restart_exit:
		call LimpaMemoriaTela0
			
		jmp main  ; restarta o game
	
; /main






;************************************************************
;                         FUNÇÕES --- BLACKOUT
;************************************************************

MovePersonagem:
	push r0
	push r1
	
	call MovePersonagem_RecalculaPos		; Recalcula Posicao o Personagem
	call MovePersonagem_ChecaPos          ; Checa em que posição o Personagem tentou ir
	
			
	checa_parede: ; verifica se o jogador colidiu com uma parede
		loadn r6, #1
		cmp r6, r7
		jne checa_continua
		
			jmp MovePersonagem_Skip;	;n faz nada	

			
	checa_continua:
	
		load r0, posPersonagem
		load r1, posAntPersonagem
		cmp r0, r1
		jeq MovePersonagem_Skip
			call MovePersonagem_Apaga
			call MovePersonagem_Desenha		;}.
			
  	MovePersonagem_Skip:
	
	pop r1
	pop r0
	rts

;--------------------------------
	
MovePersonagem_Apaga:		; Apaga a Nave preservando o Cenario!
	push R0
	push R1
	push R2
	push R3

	load R0, posAntPersonagem	; R0 = posAnt
	
	; --> R2 = Tela0 + posAnt  ;

	loadn R1, #tela0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela0 + posAnt
	
	loadi R3, R2	; R3 = Char (Tela(posAnt))
	
	outchar R3, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R3
	pop R2
	pop R1
	pop R0
	rts
;----------------------------------	
	
MovePersonagem_RecalculaPos:		; Recalcula posicao do Personagem em funcao das Teclas pressionadas
	push R0
	push R1
	push R2
	push R3

	load R0, posPersonagem
	
	inchar R1				; Le Teclado para controlar o Personagem
	loadn R2, #'a'
	cmp R1, R2
	jeq MovePersonagem_RecalculaPos_A
	
	loadn R2, #'d'
	cmp R1, R2
	jeq MovePersonagem_RecalculaPos_D
		
	loadn R2, #'w'
	cmp R1, R2
	jeq MovePersonagem_RecalculaPos_W
		
	loadn R2, #'s'
	cmp R1, R2
	jeq MovePersonagem_RecalculaPos_S
	
	
  MovePersonagem_RecalculaPos_Fim:	; Se nao for nenhuma tecla valida, vai embora
	store posPersonagem, R0
	pop R3
	pop R2
	pop R1
	pop R0
	rts
			
  MovePersonagem_RecalculaPos_A:	; Move Personagem para Esquerda
	loadn R1, #40
	loadn R2, #0
	mod R1, R0, R1		; Testa condicoes de Contorno 
	cmp R1, R2
	jeq MovePersonagem_RecalculaPos_Fim
	dec R0	; pos = pos -1
	jmp MovePersonagem_RecalculaPos_Fim
		
  MovePersonagem_RecalculaPos_D:	; Move Personagem para Direita	
	loadn R1, #40
	loadn R2, #39
	mod R1, R0, R1		; Testa condicoes de Contorno 
	cmp R1, R2
	jeq MovePersonagem_RecalculaPos_Fim
	inc R0	; pos = pos + 1
	jmp MovePersonagem_RecalculaPos_Fim
	
  MovePersonagem_RecalculaPos_W:	; Move Personagem para Cima
	loadn R1, #40
	cmp R0, R1		; Testa condicoes de Contorno 
	jle MovePersonagem_RecalculaPos_Fim
	sub R0, R0, R1	; pos = pos - 40
	jmp MovePersonagem_RecalculaPos_Fim

  MovePersonagem_RecalculaPos_S:	; Move Personagem para Baixo
	loadn R1, #1159
	cmp R0, R1		; Testa condicoes de Contorno 
	jgr MovePersonagem_RecalculaPos_Fim
	loadn R1, #40
	add R0, R0, R1	; pos = pos + 40
	jmp MovePersonagem_RecalculaPos_Fim	
		
;----------------------------------
MovePersonagem_Desenha:	; Desenha caractere da Nave
	push R0
	push R1
	
	Loadn R1, #'*'	; Nave
	load R0, posPersonagem
	outchar R1, R0
	store posAntPersonagem, R0	; Atualiza Posicao Anterior da Nave = Posicao Atual
	
	pop R1
	pop R0
	rts
	
	
MovePersonagem_ChecaPos:
	push r0
	push r1
	push r2
	
	
	; --> tela0 + pos ;
	
	load  r0, posPersonagem ; carrega a nova posicao do personagem da memoria. r0 = pos
	loadn r1, #tela0  ; carrega a posicao inicial do mapa da memoria.    r1 = tela0
	
	add r1, r0, r1  ; r1 = tela0 + posicao do jogador

	loadi r2, r1	; r2 = Char (Tela(pos))
	 
		;checa parede teal
		loadn r1, #1600 ; checa se o jogador andou para uma parede(cod parede: 64 + cor teal: 1536).
		cmp r2, r1
		jne check_yellow_wall
		jmp check_wall 
	
	check_yellow_wall:	
		loadn r1, #2880 ; checa se o jogador andou para uma parede(cod parede: 64 + cor amarela: 2816).
		cmp r2, r1
		jne check_veneno
		jmp check_wall
		
	check_veneno: ; marca que tomou veneno
		loadn r1, #1315 ; checa se o jogador andou para veneno(cod veneno: 35 + cor roxo: 1280).
		cmp r2, r1
		jne check_chegada
		jmp check_die ; morra
	
	check_chegada: ; marca que chegou no objetivo
		loadn r1, #576 ; checa se o jogador andou para a linha de chegada(cod parede: 64 + cor verde: 512).
		cmp r2, r1
		jne check_empty 
		jmp check_venceu
	
	
	
	check_venceu: ; marca que o jogador venceu (deve ganhar e acabar o jogo).
		loadn r7, #3 ; 3: die
		jmp end_check
	
	check_die: ; marca que o jogador morrera (deve morrer e acabar o jogo).
		loadn r7, #2 ; 2: die
		jmp end_check	
		
	check_wall: ; marca que o jogador andou para um espaco vazio (deve apenas se movimentar).
		loadn r7, #1 ; 1: wall
		load r1, posAntPersonagem ;; recupera a posicao anterior
		store posPersonagem, r1   ;; e salva 
		jmp end_check
		
	check_empty: ; marca que o jogador andou para um espaco vazio (deve apenas se movimentar).
		loadn r7, #0 ; 0: move		
	
	end_check:

			
	pop r2 ; resgata os valores dos registradores utilizados na subrotina da pilha.
	pop r1
	pop r0

	rts
	

;----------------------------------
;----------------------------------
;----------------------------------

ApagaMapaIni:
	push r0
	push r1
	
	loadn r0, #999  ; r0 = 999
	cmp r0, r5      ; if (r5===999)
	ceq ApagaMapa	; apaga mapa 
	
	pop r1
	pop r0
	rts

ApagaMapa:
	push r0
	push r1
	
	
	call ApagaTela
	load r0, posPersonagem
	loadn r1, #'*'
	outchar r1, r0
	loadn r5, #0; flag de mapa invisivel
	
	pop r1
	pop r0
	rts
	
MostraMapa:
	push r0
	push r1
	push r2
	
	
	call PrintaTela0
	load r0, posPersonagem
	loadn r1, #'*'
	outchar r1, r0
	loadn r5, #1 ; flag de mapa visivel
	
	pop r2
	pop r1
	pop r0
	rts
	
;********************************************************
;                       DELAY - BLACKOUT
;********************************************************		


Delay:
	; Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	Push R0
	Push R1
	
	Loadn R1, #5  ; a
   Delay_volta2:				;Quebrou o contador acima em duas partes (dois loops de decremento)
	Loadn R0, #3000	; b
   Delay_volta: 
	Dec R0					; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	JNZ Delay_volta	
	Dec R1
	JNZ Delay_volta2
	
	Pop R1
	Pop R0
	
	RTS							;return
	
	
Delay2:
						;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	Push R0
	Push R1
	
	Loadn R1, #300  ; a
   Delay_volta2:				;Quebrou o contador acima em duas partes (dois loops de decremento)
	Loadn R0, #3000	; b
   Delay_volta: 
	Dec R0					; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	JNZ Delay_volta	
	Dec R1
	JNZ Delay_volta2
	
	Pop R1
	Pop R0
	
	RTS							;return
	
	


	
; IMPRIME TELA2 BLACKOUT_______________________________________
ImprimeTela2: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #tela0	; Endereco onde comeca a primeira linha do cenario!!
	
   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r3  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40  porcausa do /0 so no fim !!) --> r1 = r1 + 40
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts		
; /IMPRIME TELA2_________________________________________		


; IMPRIME STRING2________________________________________
ImprimeStr2:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	
	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco

   ImprimeStr2_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr2_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq ImprimeStr2_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
   		storei r6, r4
   ImprimeStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6
		jmp ImprimeStr2_Loop
	
   ImprimeStr2_Sai:	
	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
; /IMPRIME STRING2__________________________________________		

; APAGA TELA BLACKOUT________________________________________________
ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	;;label for(r0=1200;r3>0;r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts	
; /APAGA TELA________________________________________________

; LIMPA TELA0 BLACKOUT________________________________________________
LimpaMemoriaTela0:
	push r0
	push r1
	push r2
	push r3
	
	loadn r0, #1199		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	loadn r2, #tela0
	;loadn r4, #1200
	   ; limpa do final do vetor para o inicio	
	   LimpaMemoria_Loop:	;;label for(r3=1200;r3>0;r3--)
		;add r3, r2, r0  ; r3 = posicao de char[i] na MEM
		;loadn r3, #578
		add r3, r2, r0  ; r3 = posicao de char[i] na MEM
		storei r3, r1   ; MEM[i] = ' ' ; limpa char cm espaco vazio
		dec r0
		loadn r3, #0
		cmp r0, r3
		jne LimpaMemoria_Loop
 
		
 	pop r3
 	pop r2
	pop r1
	pop r0
	rts	
; /LIMPA TELA0________________________________________________

; PRINTA TELA0 BLACKOUT________________________________________________
PrintaTela0:
	push r0
	push r1
	push r2
	push r3
	
	loadn r0, #1200		; printa as 1200 posicoes da Tela
	loadn r1, #tela0

	   ; limpa do final do vetor para o inicio	
	   PrintaTela0_Loop:	; label for(r0=1200;r0>0;r0--)
	    dec r0
		add r2, r1, r0  ; r2 = posicao de char[i] na MEM
		loadi r3, r2   ; r1 = MEM[i] ; recebe char da mem tela0 
		outchar r3, r0
		
		loadn r3, #0
		cmp r0, r3
		jne PrintaTela0_Loop
 
		
 	pop r3
 	pop r2
	pop r1
	pop r0
	rts	
; /PRINTA TELA0________________________________________________

ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;--------------------------------------
;                   IMPRIME STRING
;---------------------------------------
ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
;------------------------------------------
;                       IMPRIME TELA0
;---------------------------------------------------
ImprimeTela0: 	;  Rotina de Impresao de Cenario na Tela Inteira 

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
	call ImprimeStr
	add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
	add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
	cmp r0, r5			; Compara r0 com 1200
	jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts



;************************************************************



;********************************************************
;                       PASSAWORD
;********************************************************	

	; --Prepara a tela para iniciar de fato o loop do jogo
	call ApagaTelaPASS
	loadn r1, #tela2Linha0
	call ImprimeTelaPass
	call SorteiaPalavra


	; --Calcula a posicao e numero de tentativas ideais com base na palavra sorteada
	load r0, TamanhoPalavra
	loadn r3, #3
	div r3, r0, r3
	add r4, r4, r3 		; Adiciona algumas tentativas se a palavra for grande
	loadn r1, #2
	loadn r2, #419			; Ponto central da tela	
	div r0, r0, r1
	sub r2, r2, r0			; Deslocando a palavra pra esquerda de acordo com o tamanho
	store posCursor, r2

	loadn r1, #0 		; Guarda o numero da tentativa
	loadn r3, #40 		; Tamanho da linha da tela

	loop_principal:
		call ImprimeEspacos
		call InputPalavra
		call ChecaPalavra

		inc r1
		add r2, r2, r3		; Passa pra proxima linha
		store posCursor, r2

		cmp r1, r4 			; Caso nao tenha excedido o numero de tentativas, continua
		jne loop_principal

;********************************************************
;                  FUNÇÕES PASSWORD
;********************************************************
ImprimeTelaPass: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push fr		; Protege o registrador de flags
	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn r6, #0
	
   	ImprimeTelaPass_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5		; Compara r0 com 1200
		jne ImprimeTelaPass_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts

SorteiaPalavra:
	push r0
	push r1
	push r2
	push r3
	push r4

	; Seleciona um numero entre 0 e o tamanho do catalogo
	load r1, chaveRandom
	rotl r1, #4		 	; Faz um rotate so pra tentar adicionar um pouco de "caos"
	loadn r2, #10 			; Numero de palavras no catalogo (ATUALIZAR CASO ADICIONE MAIS)
	mod r2, r1, r2 			; r2 = chaveRandom % numCatalogo (um numero pseudo randomico)

	; Salva a palavra selecionada
	loadn r3, #2 			; Tamanho de um endereco de memoria
	loadn r4, #Catalogo		; Endereco do inicio do catalogo de palavras
	mul r3, r3, r2
	add r4, r4, r3			; Pula o tanto de palavras necessarias
	loadi r4, r4

	store Palavra, r4	; Guarda palavra a ser usada

	; Salva o tamanho da palavra
	loadn r4, #catTamanhos
	add r4, r4, r2
	loadi r4, r4

	store TamanhoPalavra, r4
	

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

ApagaTelaPASS:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	pop fr
	rts

ImprimeEspacos:	; r0 = Numero da linha que vai iniciar
	push r0
	push r1
	push r2
	push r3
	push r4

	load r1, TamanhoPalavra
	loadn r4, #0 			; Contador de Letras
	load r2, posCursor

	espacos_Loop:
		loadn r3, #'_'		; Salva o Espaco em branco (Underline)
		outchar r3, r2
		inc r2
		inc r4
		cmp r1, r4
		jne espacos_Loop		; Se o contador for igual ao tamanho, sai do loop

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

InputPalavra:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6

	
	loadn r1, #PalavraDigitada 	; Endereco reservado pra palavra a ser digitada
	load r2, TamanhoPalavra
	load r3, posCursor			; Aponta o inicio da linha para escrever
	loadn r4, #0 				; Contador de letras

	inputPalavra_Loop:
		call InputLetra

		load r0, Letra
		loadn r6, #13
		cmp r0, r6
		jeq main
		add r5, r1, r4 			; r5 = posicao da letra a ser inserida na memoria
		storei r5, r0 			; Mem[r5] = r0

		outchar r0, r3
		inc r3

		inc r4
		cmp r4, r2
		jne inputPalavra_Loop

	loadn r0, #0
	add r4, r4, r3
	storei r4, r0


	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

InputLetra:
	push r0
	push r1

	loadn r1, #255

	inputLetra_Loop:
		inchar r0
		cmp r0, r1
		jeq inputLetra_Loop

	store Letra, r0
	
	pop r1
	pop r0
	rts


; --Compara a palavra digitada pelo jogador com a correta letra por letra
ChecaPalavra:
	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r1, #PalavraDigitada 		; Endereco de inicio da palavra
	load r2, TamanhoPalavra
	loadn r3, #0 			; Contador de letras

	
	checaPalavra_Loop:
		store posLetra, r3
		add r4, r1, r3		; Pega endereco exato da letra a ser lida
		loadi r0, r4		; r0 = Mem[r4]
		store Letra, r0

		call ChecaLetra

		inc r3
		cmp r3, r2 			; Se tiver acabado a palavra, sai
		jne checaPalavra_Loop


	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts


; --Checa uma letra com toda a palavra certa e pinta ela com a cor de acordo com sua aparicao e posicao
ChecaLetra: ; r0 = Letra a ser checada com todas as outras
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6

	load r1, Palavra 	; Endereco da palavra
	load r2, TamanhoPalavra	
	loadn r3, #0 		; Contador
	loadn r5, #0 		; Por padrao, a letra sera branca

	checaLetra_Loop:
		add r4, r1, r3 		
		loadi r4, r4		; r4 = Mem[r4] (Letra da palavra certa a ser checada)
		cmp r0, r4
		jeq letraPresente

	  checaLetra_Continue:
		inc r3
		cmp r2, r3
		jeq checaLetra_Sai	; Caso ja tenha acabado a palavra, sai do loop
		jmp checaLetra_Loop


	letraPresente:
		load r6, posLetra
		cmp r6, r3 			; Caso a letra esteja no lugar certo
		jne letraAmarela
		loadn r5, #512 		; Cor verde
		jmp checaLetra_Sai

		letraAmarela:
			loadn r5, #2816
			jmp checaLetra_Continue


   checaLetra_Sai:
   	load r3, posLetra
	load r4, posCursor
	add r4, r4, r3		; Pega endereco da posicao certa
	add r0, r0, r5 		; Colore a letra

	outchar r0, r4

  	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

;************************************************************
;                          TELAS
;************************************************************
	
; Declara uma tela vazia para ser preenchida em tempo de execucao:
tela0  : string "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "
	
; tela icmc	
telaICMCLinha0  : string "                                        "
telaICMCLinha1  : string "                                        "
telaICMCLinha2  : string "                                        "
telaICMCLinha3  : string "                                        "
telaICMCLinha4  : string "                                        "
telaICMCLinha5  : string "                                        "
telaICMCLinha6  : string "                                        "
telaICMCLinha7  : string "         @@  @@@@ @@   @@  @@@@         "
telaICMCLinha8  : string "         @@ @@@   @@@ @@@ @@@           "
telaICMCLinha9  : string "         @@ @@@   @@@ @@@ @@@           "
telaICMCLinha10 : string "         @@ @@@   @@ @ @@ @@@           "
telaICMCLinha11 : string "         @@  @@@@ @@   @@  @@@@         "
telaICMCLinha12 : string "                                        "
telaICMCLinha13 : string "                                        "
telaICMCLinha14 : string "                                        "
telaICMCLinha15 : string "                                        "
telaICMCLinha16 : string "                                        "
telaICMCLinha17 : string "                                        "
telaICMCLinha18 : string "                                        "
telaICMCLinha19 : string "                                        "
telaICMCLinha20 : string "                                        "
telaICMCLinha21 : string "                                        "
telaICMCLinha22 : string "                                        "
telaICMCLinha23 : string "                                        "
telaICMCLinha24 : string "                                        "
telaICMCLinha25 : string "                                        "
telaICMCLinha26 : string "                                        "
telaICMCLinha27 : string "                                        "
telaICMCLinha28 : string "                                        "
telaICMCLinha29 : string "                                        "

; Declara e preenche tela linha por linha (40 caracteres):
tela6Linha0  : string "                                        "
tela6Linha1  : string "                                        "
tela6Linha2  : string "                                        "
tela6Linha3  : string "                                        "
tela6Linha4  : string "                                        "
tela6Linha5  : string "                                        "
tela6Linha6  : string "         **  **** **   **  ****         "
tela6Linha7  : string "         ** ***   *** *** ***           "
tela6Linha8  : string "         ** ***   ** * ** ***           "
tela6Linha9  : string "         **  **** **   **  ****         "
tela6Linha10 : string "                                        "
tela6Linha11 : string " *   * **** *   *       ** ** *** ***   "
tela6Linha12 : string " **  * *    *   *       ** ** *   *     "
tela6Linha13 : string " * * * **** *   *       * * * *** *     "
tela6Linha14 : string " *  ** *    * * *       *   *   * ***   "
tela6Linha15 : string " *   * *    ** **       *   *   * * *   "
tela6Linha16 : string " *   * **** *   *       *   * *** ***   "
tela6Linha17 : string "                                        "
tela6Linha18 : string " ______________________________________ "
tela6Linha19 : string "                                        "
tela6Linha20 : string "                       by Nome grupo    "
tela6Linha21 : string "                                        "
tela6Linha22 : string "                                        "
tela6Linha23 : string "                                        "
tela6Linha24 : string "                                        "
tela6Linha25 : string "                                        "
tela6Linha26 : string "                                        "
tela6Linha27 : string "                                        "
tela6Linha28 : string "                                        "
tela6Linha29 : string "                                        "

telaMp2Linha0  : string "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
telaMp2Linha1  : string "@                                      @"
telaMp2Linha2  : string "@                                      @"
telaMp2Linha3  : string "@                                      @"
telaMp2Linha4  : string "@                                      @"
telaMp2Linha5  : string "@                                      @"
telaMp2Linha6  : string "@                                      @"
telaMp2Linha7  : string "@                                      @"
telaMp2Linha8  : string "@                                      @"
telaMp2Linha9  : string "@                                      @"
telaMp2Linha10 : string "@                                      @"
telaMp2Linha11 : string "@                                      @"
telaMp2Linha12 : string "@                                      @"
telaMp2Linha13 : string "@                                      @"
telaMp2Linha14 : string "@                  @@                  @"
telaMp2Linha15 : string "@                  @@                  @"
telaMp2Linha16 : string "@                                      @"
telaMp2Linha17 : string "@                                      @"
telaMp2Linha18 : string "@                                      @"
telaMp2Linha19 : string "@                                      @"
telaMp2Linha20 : string "@                                      @"
telaMp2Linha21 : string "@                                      @"
telaMp2Linha22 : string "@                                      @"
telaMp2Linha23 : string "@                                      @"
telaMp2Linha24 : string "@                                      @"
telaMp2Linha25 : string "@                                      @"
telaMp2Linha26 : string "@                                      @"
telaMp2Linha27 : string "@                                      @"
telaMp2Linha28 : string "@                                      @"
telaMp2Linha29 : string "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

telaMp3Linha0  : string "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
telaMp3Linha1  : string "@                                      @"
telaMp3Linha2  : string "@                                      @"
telaMp3Linha3  : string "@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @"
telaMp3Linha4  : string "@  @                                @  @"
telaMp3Linha5  : string "@  @                                @  @"
telaMp3Linha6  : string "@  @                                @  @"
telaMp3Linha7  : string "@  @     @@  @@@@ @@   @@  @@@@     @  @"
telaMp3Linha8  : string "@  @     @@ @@@   @@@ @@@ @@@       @  @"
telaMp3Linha9  : string "@  @                                @  @"
telaMp3Linha10 : string "@  @                                @  @"
telaMp3Linha11 : string "@  @                                @  @"
telaMp3Linha12 : string "@  @                                @  @"
telaMp3Linha13 : string "@  @                                @  @"
telaMp3Linha14 : string "@  @         @    @@@@    @         @  @"
telaMp3Linha15 : string "@  @         @    @  @    @         @  @"
telaMp3Linha16 : string "@  @         @            @         @  @"
telaMp3Linha17 : string "@  @         @@@@@@@@@@@@@@         @  @"
telaMp3Linha18 : string "@  @                                @  @"
telaMp3Linha19 : string "@  @                                @  @"
telaMp3Linha20 : string "@  @                                @  @"
telaMp3Linha21 : string "@  @                                @  @"
telaMp3Linha22 : string "@  @                                @  @"
telaMp3Linha23 : string "@  @                                @  @"
telaMp3Linha24 : string "@  @                                @  @"
telaMp3Linha25 : string "@  @                                @  @"
telaMp3Linha26 : string "@  @                                @  @"
telaMp3Linha27 : string "@                                   @  @"
telaMp3Linha28 : string "@                                   @  @"
telaMp3Linha29 : string "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

telaVeneno2Linha0  : string "                                        "
telaVeneno2Linha1  : string "      #                          #      "
telaVeneno2Linha2  : string "                #               #       "
telaVeneno2Linha3  : string "        #                      #        "
telaVeneno2Linha4  : string "         #                    #         "
telaVeneno2Linha5  : string "          #                  #          "
telaVeneno2Linha6  : string "   #       #                #      #    "
telaVeneno2Linha7  : string "            #              #            "
telaVeneno2Linha8  : string "             #            #             "
telaVeneno2Linha9  : string "              #                         "
telaVeneno2Linha10 : string "               #        #               "
telaVeneno2Linha11 : string "                #      #   #            "
telaVeneno2Linha12 : string "                 #    #                 "
telaVeneno2Linha13 : string "                  #  #                  "
telaVeneno2Linha14 : string "                                        "
telaVeneno2Linha15 : string "                                        "
telaVeneno2Linha16 : string "                  #  #                  "
telaVeneno2Linha17 : string "                 #    #                 "
telaVeneno2Linha18 : string "                #      #                "
telaVeneno2Linha19 : string "               #        #               "
telaVeneno2Linha20 : string "              #          #      #       "
telaVeneno2Linha21 : string "             #            #             "
telaVeneno2Linha22 : string "            #              #            "
telaVeneno2Linha23 : string "           #                #           "
telaVeneno2Linha24 : string "          #                  #          "
telaVeneno2Linha25 : string "    #    #                    #     #   "
telaVeneno2Linha26 : string "                               #        "
telaVeneno2Linha27 : string "       #                        #       "
telaVeneno2Linha28 : string "      #                          #      "
telaVeneno2Linha29 : string "                                    
    "

telaVeneno3Linha0  : string "                                        "
telaVeneno3Linha1  : string " #      #           #          #      # "
telaVeneno3Linha2  : string "             #             #            "
telaVeneno3Linha3  : string "                                        "
telaVeneno3Linha4  : string "                                        "
telaVeneno3Linha5  : string "                                        "
telaVeneno3Linha6  : string "                                        "
telaVeneno3Linha7  : string "                                        "
telaVeneno3Linha8  : string "                                        "
telaVeneno3Linha9  : string "                                        "
telaVeneno3Linha10 : string "                                        "
telaVeneno3Linha11 : string "                                        "
telaVeneno3Linha12 : string "                                        "
telaVeneno3Linha13 : string "     #     #                #     #     "
telaVeneno3Linha14 : string "                                        "
telaVeneno3Linha15 : string "       # #                    # #       "
telaVeneno3Linha16 : string "  #           #          #           #  "
telaVeneno3Linha17 : string "                                        "
telaVeneno3Linha18 : string " #                                    # "
telaVeneno3Linha19 : string "                                        "
telaVeneno3Linha20 : string "  #                                  #  "
telaVeneno3Linha21 : string "        #                      #        "
telaVeneno3Linha22 : string " #    #   #                  #   #    # "
telaVeneno3Linha23 : string "                                        "
telaVeneno3Linha24 : string "  #                                  #  "
telaVeneno3Linha25 : string "                                        "
telaVeneno3Linha26 : string " #                                    # "
telaVeneno3Linha27 : string "                                        "
telaVeneno3Linha28 : string "                                     #  "
telaVeneno3Linha29 : string "                                        "

telaVenenoLinha0  : string "                                        "
telaVenenoLinha1  : string "                                        "
telaVenenoLinha2  : string "                #                       "
telaVenenoLinha3  : string "                                        "
telaVenenoLinha4  : string "                                        "
telaVenenoLinha5  : string "                                        "
telaVenenoLinha6  : string "   #                               #    "
telaVenenoLinha7  : string "                                        "
telaVenenoLinha8  : string "                                        "
telaVenenoLinha9  : string "                                        "
telaVenenoLinha10 : string "                                        "
telaVenenoLinha11 : string "                #          #            "
telaVenenoLinha12 : string "                    #                   "
telaVenenoLinha13 : string "                                        "
telaVenenoLinha14 : string "                    #                   "
telaVenenoLinha15 : string "                 #                      "
telaVenenoLinha16 : string "                                        "
telaVenenoLinha17 : string "                                        "
telaVenenoLinha18 : string "                                        "
telaVenenoLinha19 : string "                                        "
telaVenenoLinha20 : string "                                #       "
telaVenenoLinha21 : string "                                        "
telaVenenoLinha22 : string "                                        "
telaVenenoLinha23 : string "                                        "
telaVenenoLinha24 : string "                                        "
telaVenenoLinha25 : string "    #                               #   "
telaVenenoLinha26 : string "                                        "
telaVenenoLinha27 : string "                                        "
telaVenenoLinha28 : string "                                        "
telaVenenoLinha29 : string "                                        "

; final
telaChegadaLinha0  : string "                                        "
telaChegadaLinha1  : string "  @                                     "
telaChegadaLinha2  : string "                                        "
telaChegadaLinha3  : string "                                        "
telaChegadaLinha4  : string "                                        "
telaChegadaLinha5  : string "                                        "
telaChegadaLinha6  : string "                                        "
telaChegadaLinha7  : string "                                        "
telaChegadaLinha8  : string "                                        "
telaChegadaLinha9  : string "                                        "
telaChegadaLinha10 : string "                                        "
telaChegadaLinha11 : string "                                        "
telaChegadaLinha12 : string "                                        "
telaChegadaLinha13 : string "                                        "
telaChegadaLinha14 : string "                                        "
telaChegadaLinha15 : string "                                        "
telaChegadaLinha16 : string "                                        "
telaChegadaLinha17 : string "                                        "
telaChegadaLinha18 : string "                                        "
telaChegadaLinha19 : string "                                        "
telaChegadaLinha20 : string "                                        "
telaChegadaLinha21 : string "                                        "
telaChegadaLinha22 : string "                                        "
telaChegadaLinha23 : string "                                        "
telaChegadaLinha24 : string "                                        "
telaChegadaLinha25 : string "                                        "
telaChegadaLinha26 : string "                                        "
telaChegadaLinha27 : string "                                        "
telaChegadaLinha28 : string "                                        "
telaChegadaLinha29 : string "                                        "

telaChegada2Linha0  : string "                                        "
telaChegada2Linha1  : string "                                        "
telaChegada2Linha2  : string "                                        "
telaChegada2Linha3  : string "                                        "
telaChegada2Linha4  : string "                                        "
telaChegada2Linha5  : string "                                        "
telaChegada2Linha6  : string "                                        "
telaChegada2Linha7  : string "                                        "
telaChegada2Linha8  : string "                                        "
telaChegada2Linha9  : string "                                        "
telaChegada2Linha10 : string "                                        "
telaChegada2Linha11 : string "                                        "
telaChegada2Linha12 : string "                                        "
telaChegada2Linha13 : string "                                        "
telaChegada2Linha14 : string "                                        "
telaChegada2Linha15 : string "                                        "
telaChegada2Linha16 : string "                   @@                   "
telaChegada2Linha17 : string "                                        "
telaChegada2Linha18 : string "                                        "
telaChegada2Linha19 : string "                                        "
telaChegada2Linha20 : string "                                        "
telaChegada2Linha21 : string "                                        "
telaChegada2Linha22 : string "                                        "
telaChegada2Linha23 : string "                                        "
telaChegada2Linha24 : string "                                        "
telaChegada2Linha25 : string "                                        "
telaChegada2Linha26 : string "                                        "
telaChegada2Linha27 : string "                                        "
telaChegada2Linha28 : string "                                        "
telaChegada2Linha29 : string "                                        "

telaChegada3Linha0  : string "                                        "
telaChegada3Linha1  : string "                                        "
telaChegada3Linha2  : string "                                        "
telaChegada3Linha3  : string "                                        "
telaChegada3Linha4  : string "                                        "
telaChegada3Linha5  : string "                                        "
telaChegada3Linha6  : string "                                        "
telaChegada3Linha7  : string "                                        "
telaChegada3Linha8  : string "                                        "
telaChegada3Linha9  : string "                                        "
telaChegada3Linha10 : string "                                        "
telaChegada3Linha11 : string "                                        "
telaChegada3Linha12 : string "                                        "
telaChegada3Linha13 : string "                                        "
telaChegada3Linha14 : string "                                        "
telaChegada3Linha15 : string "                   @@                   "
telaChegada3Linha16 : string "                                        "
telaChegada3Linha17 : string "                                        "
telaChegada3Linha18 : string "                                        "
telaChegada3Linha19 : string "                                        "
telaChegada3Linha20 : string "                                        "
telaChegada3Linha21 : string "                                        "
telaChegada3Linha22 : string "                                        "
telaChegada3Linha23 : string "                                        "
telaChegada3Linha24 : string "                                        "
telaChegada3Linha25 : string "                                        "
telaChegada3Linha26 : string "                                        "
telaChegada3Linha27 : string "                                        "
telaChegada3Linha28 : string "                                        "
telaChegada3Linha29 : string "                                        "


; Tela GAMEOVER
telaGameOverLinha0  : string "                                        "
telaGameOverLinha1  : string "                                        "
telaGameOverLinha2  : string "                                        "
telaGameOverLinha3  : string "                                        "
telaGameOverLinha4  : string "                                        "
telaGameOverLinha5  : string "                                        "
telaGameOverLinha6  : string "                                        "
telaGameOverLinha7  : string "          @@@@  @@@  @   @ @@@@@        "
telaGameOverLinha8  : string "         @     @   @ @@ @@ @            "
telaGameOverLinha9  : string "         @  @@ @@@@@ @ @ @ @@@@         "
telaGameOverLinha10 : string "         @   @ @   @ @   @ @            "
telaGameOverLinha11 : string "          @@@@ @   @ @   @ @@@@@        "
telaGameOverLinha12 : string "                                        "
telaGameOverLinha13 : string "          @@@  @   @ @@@@@ @@@@         "
telaGameOverLinha14 : string "         @   @ @   @ @     @   @        "
telaGameOverLinha15 : string "         @   @ @   @ @@@@  @@@@         "
telaGameOverLinha16 : string "         @   @  @ @  @     @ @          "
telaGameOverLinha17 : string "          @@@    @   @@@@@ @  @         "
telaGameOverLinha18 : string "                                        "
telaGameOverLinha19 : string "                                        "
telaGameOverLinha20 : string "                                        "
telaGameOverLinha21 : string "                                        "
telaGameOverLinha22 : string "                                        "
telaGameOverLinha23 : string "                                        "
telaGameOverLinha24 : string "                                        "
telaGameOverLinha25 : string "                                        "
telaGameOverLinha26 : string "                                        "
telaGameOverLinha27 : string "                                        "
telaGameOverLinha28 : string "                                        "
telaGameOverLinha29 : string "                                        "

; Tela GANHOU
telaVenceuLinha0  : string "                                        "
telaVenceuLinha1  : string "                                        "
telaVenceuLinha2  : string "                                        "
telaVenceuLinha3  : string "                                        "
telaVenceuLinha4  : string "                                        "
telaVenceuLinha5  : string "                                        "
telaVenceuLinha6  : string "                                        "
telaVenceuLinha7  : string "           @   @  @@@  @   @            "
telaVenceuLinha8  : string "           @@ @@ @   @ @   @            "
telaVenceuLinha9  : string "            @@@  @   @ @   @            "
telaVenceuLinha10 : string "             @   @   @ @   @            "
telaVenceuLinha11 : string "             @    @@@  @@@@@            "
telaVenceuLinha12 : string "                                        "
telaVenceuLinha13 : string "           @   @   @   @   @            "
telaVenceuLinha14 : string "           @   @   @   @@  @            "
telaVenceuLinha15 : string "           @ @ @   @   @ @ @            "
telaVenceuLinha16 : string "           @ @ @   @   @  @@            "
telaVenceuLinha17 : string "            @@@    @   @   @            "
telaVenceuLinha18 : string "                                        "
telaVenceuLinha19 : string "                                        "
telaVenceuLinha20 : string "                                        "
telaVenceuLinha21 : string "                                        "
telaVenceuLinha22 : string "                                        "
telaVenceuLinha23 : string "                                        "
telaVenceuLinha24 : string "                                        "
telaVenceuLinha25 : string "                                        "
telaVenceuLinha26 : string "                                        "
telaVenceuLinha27 : string "                                        "
telaVenceuLinha28 : string "                                        "
telaVenceuLinha29 : string "                                        "

; Tela RESTART
telaRestartLinha0  : string "                                        "
telaRestartLinha1  : string "                                        "
telaRestartLinha2  : string "                                        "
telaRestartLinha3  : string "                                        "
telaRestartLinha4  : string "                                        "
telaRestartLinha5  : string "                                        "
telaRestartLinha6  : string "                                        "
telaRestartLinha7  : string "                                        "
telaRestartLinha8  : string "                                        "
telaRestartLinha9  : string "                                        "
telaRestartLinha10 : string "                                        "
telaRestartLinha11 : string "                                        "
telaRestartLinha12 : string "                                        "
telaRestartLinha13 : string "                                        "
telaRestartLinha14 : string "                                        "
telaRestartLinha15 : string "                                        "
telaRestartLinha16 : string "                                        "
telaRestartLinha17 : string "                                        "
telaRestartLinha18 : string "                                        "
telaRestartLinha19 : string "                                        "
telaRestartLinha20 : string "                                        "
telaRestartLinha21 : string "        PRESS 'SPACE' TO RESTART        "
telaRestartLinha22 : string "                                        "
telaRestartLinha23 : string "                                        "
telaRestartLinha24 : string "                                        "
telaRestartLinha25 : string "                                        "
telaRestartLinha26 : string "                                        "
telaRestartLinha27 : string "                                        "
telaRestartLinha28 : string "                                        "
telaRestartLinha29 : string "                                        "	
;Telas_fim

tela1Linha0  : string "                                        "
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string " ####                                   "
tela1Linha4  : string " #   #   ##    ###   ###   ####   ###   "
tela1Linha5  : string " #   #  #  #  #     #     #    # #      "
tela1Linha6  : string " ####  #    #  ###   ###  #    #  ###   "
tela1Linha7  : string " #     ######     #     # #    #     #  "
tela1Linha8  : string " #     #    # #   # #   # #    # #   #  "
tela1Linha9  : string " #     #    #  ###   ###   ####   ###   "
tela1Linha10 : string "                                        "
tela1Linha11 : string "      #     #                           "
tela1Linha12 : string "      #  #  #  ####  #####  #####       "
tela1Linha13 : string "      #  #  # #    # #    # #    #      "
tela1Linha14 : string "      #  #  # #    # #    # #    #      "
tela1Linha15 : string "      #  #  # #    # #####  #    #      "
tela1Linha16 : string "      #  #  # #    # #   #  #    #      "
tela1Linha17 : string "       ## ##   ####  #    # #####       "
tela1Linha18 : string "                                        "
tela1Linha19 : string "                                        "
tela1Linha20 : string "                                        "
tela1Linha21 : string "                                        "
tela1Linha22 : string "                                        "
tela1Linha23 : string "                                        "
tela1Linha24 : string "        Aperte ENTER para jogar         "
tela1Linha25 : string "                                        "
tela1Linha26 : string "                                        "
tela1Linha27 : string "                                        "
tela1Linha28 : string "                                        "
tela1Linha29 : string "                                        "


; ***************PARTE DO JOGO PASSWORD
;***********************************************************************

tela2Linha0  : string "o======================================o"
tela2Linha1  : string "|             Passos Word              |"
tela2Linha2  : string "| Como Jogar:                          |"
tela2Linha3  : string "|  Descubra a senha!                   |"
tela2Linha4  : string "|  Teste diferentes letras e palavras  |"
tela2Linha5  : string "|   Amarelo = letra na posicao errada  |"
tela2Linha6  : string "|   Verde = letra e posicao certas     |"
tela2Linha7  : string "|                                      |"
tela2Linha8  : string "|                                      |"
tela2Linha9  : string "|                                      |"
tela2Linha10 : string "|                                      |"
tela2Linha11 : string "|                                      |"
tela2Linha12 : string "|                                      |"
tela2Linha13 : string "|                                      |"
tela2Linha14 : string "|                                      |"
tela2Linha15 : string "|                                      |"
tela2Linha16 : string "|                                      |"
tela2Linha17 : string "|                                      |"
tela2Linha18 : string "|                                      |"
tela2Linha19 : string "|                                      |"
tela2Linha20 : string "|                                      |"
tela2Linha21 : string "|                                      |"
tela2Linha22 : string "|                                      |"
tela2Linha23 : string "|                                      |"
tela2Linha24 : string "|                                      |"
tela2Linha25 : string "|                                      |"
tela2Linha26 : string "|                                      |"
tela2Linha27 : string "|                                      |"
tela2Linha28 : string "|                                      |"
tela2Linha29 : string "o======================================o"
