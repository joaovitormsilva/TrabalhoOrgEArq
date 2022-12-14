jmp main

chaveRandom: var #2
TamanhoNumero: var #1
mensagem : string "TESATNSEOANDOWAD"
espaco : string "_"
posCursor: var #2
posNumero: var #1
Numero: var #1
IntervaloCDigitado: var #1
IntervaloFDigitado: var #1

main:

	loadn r0, #0	
	loadn r1, #tela1Linha0
	loadn r2, #3584

	call ImprimeTela
	call EsperaEnter
	
	call ApagaTela
	loadn r1, #tela2Linha0
	call ImprimeTela
	
	loadn r1, #2
	loadn r2, #419			; Ponto central da tela	
	div r0, r0, r1
	sub r2, r2, r0			; Deslocando a palavra pra esquerda de acordo com o tamanho
	store posCursor, r2
	
	loop_principal:
	call ImprimeEspacos
	call InputIntervalo
	call EsperaEnter

	call ApagaTela
	loadn r0, #tela3Linha0
	call ImprimeTela
	
	
	
	jne loop_principal
	
	
	
	;call ImprimeTela
	;call EsperaEnter
	
	
	
	main_Fim:
		halt






	
InputIntervalo:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6

	
	loadn r1, #IntervaloCDigitado 	; Endereco reservado pra palavra a ser digitada
	loadn r2, #IntervaloFDigitado 
	load r3, posCursor			; Aponta o inicio da linha para escrever

	inputIntervalo_Loop:
	
		call InputNumero
		
		load r0, Numero
		store IntervaloCDigitado, Numero
		
		loadn r6, #13
		
		cmp r0, r6
		jeq main_Fim
		add r5, r1, r4 			; r5 = posicao da Numero a ser inserida na memoria
		storei r5, r0 			; Mem[r5] = r0

		outchar r0, r3
		inc r3

		inc r4
		cmp r4, r2
		jne inputIntervalo_Loop

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
InputNumero:
	push r0
	push r1

	loadn r1, #255

	inputNumero_Loop:
		inchar r0
		cmp r0, r1
		jeq inputNumero_Loop

	store Numero, r0
	
	pop r1
	pop r0
	rts


ImprimeEspacos:	; r0 = Numero da linha que vai iniciar
	push r0
	push r1
	push r2
	push r3
	

	load r2, posCursor

	load r3, espaco		; Salva o Espaco em branco (Underline)
	
	
	outchar r3, r2
	inc r2		
	
	load r3, espaco		; Salva o Espaco em branco (Underline)
	
	
	outchar r3, r2
	inc r2	
	
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
		
		
	
	                                        
tela1Linha0  : string "                                        "
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string "                                        "
tela1Linha4  : string "   ##   ##   ##### #      # ##### #   # "
tela1Linha5  : string "  #  #  # #    #   #      #   #   ##  # "
tela1Linha6  : string " #    # #  #   #    #     #   #   # # # "
tela1Linha7  : string " ###### #  #   #     #   #    #   #  ## "
tela1Linha8  : string " #    # # #    #      # #     #   #   # "
tela1Linha9  : string " #    # ##   #####     #    ##### #   # "
tela1Linha10 : string "                                        "
tela1Linha11 : string " #  # ###### ##### ######  ####  ####   "
tela1Linha12 : string " #  # #        #     #    #    # #   #  "
tela1Linha13 : string " #  # #        #     #    #    # #   #  "
tela1Linha14 : string " #### #####    #     #    #    # ####   "
tela1Linha15 : string " #  # #        #     #    #    # #  #   "
tela1Linha16 : string " #  # #        #     #    #    # #   #  "
tela1Linha17 : string " #  # ###### #####   #     ####  #    # "
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
tela2Linha1  : string "|             Adivinheitor             |"
tela2Linha2  : string "|                                      |"
tela2Linha3  : string "|  Insira o inicio!                    |"
tela2Linha4  : string "|                                      |"
tela2Linha5  : string "|                                      |"
tela2Linha6  : string "|                                      |"
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



tela3Linha0  : string "o======================================o"
tela3Linha1  : string "|             Adivinheitor             |"
tela3Linha2  : string "|                                      |"
tela3Linha3  : string "|  Insira o Fim!                       |"
tela3Linha4  : string "|                                      |"
tela3Linha5  : string "|                                      |"
tela3Linha6  : string "|                                      |"
tela3Linha7  : string "|                                      |"
tela3Linha8  : string "|                                      |"
tela3Linha9  : string "|                                      |"
tela3Linha10 : string "|                                      |"
tela3Linha11 : string "|                                      |"
tela3Linha12 : string "|                                      |"
tela3Linha13 : string "|                                      |"
tela3Linha14 : string "|                                      |"
tela3Linha15 : string "|                                      |"
tela3Linha16 : string "|                                      |"
tela3Linha17 : string "|                                      |"
tela3Linha18 : string "|                                      |"
tela3Linha19 : string "|                                      |"
tela3Linha20 : string "|                                      |"
tela3Linha21 : string "|                                      |"
tela3Linha22 : string "|                                      |"
tela3Linha23 : string "|                                      |"
tela3Linha24 : string "|                                      |"
tela3Linha25 : string "|                                      |"
tela3Linha26 : string "|                                      |"
tela3Linha27 : string "|                                      |"
tela3Linha28 : string "|                                      |"
tela3Linha29 : string "o======================================o"