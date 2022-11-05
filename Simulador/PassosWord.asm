jmp main

; --Variaveis Globais

chaveRandom: var #2
Palavra: var #20		
TamanhoPalavra: var #1
Letra: var #1
posLetra: var #1
PalavraDigitada: var #20
posCursor: var #2

; Memoria bem limitada, entao quando eu tento adicionar mais palavras ou funcoes
; o programa nao funciona corretamente

; --Para adicionar novas palavras:
;	.Crie novas strings com as novas palavras
;	.Adicione as referencias para as strings no catalogo 
;		(NAO ESQUECER DE ADICIONAR AO TAMANHO DO CATALOGO)
;		(TAMBEM PRECISA ATUALIZAR O TAMANHO NA FUNCAO DE SORTEAR PALAVRA)
;	.Adicione o tamanho das palavras no catalogo de tamanhos
;		(TEM QUE AUMENTAR O TAMANHO DESSE OUTRO CATALOGO TAMBEM)
;


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


;Inicio do programa
main:
	; --Abre a tela0 (menu do jogo)
	loadn r1, #tela1Linha0
	loadn r2, #0
	loadn r3, #40		; Tamanho da Linha
	loadn r4, #4 		; Maximo de tentativas por padrao

	call ImprimeTela
	call EsperaEnter

	; --Prepara a tela para iniciar de fato o loop do jogo
	call ApagaTela
	loadn r1, #tela2Linha0
	call ImprimeTela
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

   main_Fim:

	halt

; --Usa uma chave pseudorandomica pra pegar uma palavra do catalogo
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


; --Espera o jogador apertar ENTER e pega o "tempo" demorado pra ser usado como chave pseudorandomica depois
EsperaEnter: 	
	push r0
	push r1
	push r2

	loadn r0, #255	;Se nao digitar nada, tem um espaco
	loadn r1, #13 	;Codigo ASCII do Enter
	loadn r2, #0 	;Inicia Contador em zero

	espera_loop:
		inchar r0
		inc r2
		cmp r0, r1
		jne espera_loop

	store chaveRandom, r2

	pop r2
	pop r1
	pop r0
	rts


; --Imprime tracos na tela indicando quantos caracteres a palavra tem
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


; --Recebe uma palavra digitada pelo jogador
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
		jeq main_Fim
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

; --Espera que uma tecla seja digitada e salva na variavel global "Letra"
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


;********************************************************
;                   IMPRIME STRING
;********************************************************
ImprimeLetra: 	; r0 = Letra a ser impressa, r5 = cor da letra, r3 = posicao na palavra
	push r0
	push r1
	push r2
	push r3

	load r3, posCursor
	add r3, r3, r2		; Pega endereco da posicao certa
	add r0, r0, r1 		; Colore a letra

	outchar r0, r3

	pop r3
	pop r2
	pop r1
	pop r0
	rts


ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela do primeiro caractere;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push fr		; Protege o registrador de flags
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3
		jeq ImprimeStr_Sai
		add r4, r2, r4
		outchar r4, r0
		inc r0
		inc r1
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts


;********************************************************
;                       APAGA TELA
;********************************************************
ApagaTela:
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
	
;----------------

;********************************************************
;                       IMPRIME TELA
;********************************************************	

ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
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
	
   	ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5		; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts
				
;---------------------

	; Declara e preenche tela linha por linha (40 caracteres):
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
