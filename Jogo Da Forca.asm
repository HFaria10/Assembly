ORG 100H                   
INCLUDE EMU8086.INC

JMP EscreverMenu

MENU:
     DB '',13,10
     DB '',13,10
     DB '            ---  -------  -------  -------        ------   ------- ', 13,10
     DB '           |   ||       ||       ||       |      |      | |   _   |', 13,10
     DB '           |   ||   _   ||    ___||   _   |      |  _    ||  |_|  |', 13,10
     DB '           |   ||  | |  ||   | __ |  | |  |      | | |   ||       |', 13,10    
     DB '        ___|   ||  |_|  ||   ||  ||  |_|  |      | |_|   ||       |', 13,10    
     DB '       |       ||       ||   |_| ||       |      |       ||   _   |', 13,10
     DB '       |_______||_______||_______||_______|      |______| |__| |__|', 13,10
     DB '                          -------  -------  ------    -------  ------- ', 13,10 
     DB '                         |       ||       ||    _ |  |       ||   _   |', 13,10
     DB '                         |    ___||   _   ||   | ||  |       ||  |_|  |', 13,10
     DB '                         |   |___ |  | |  ||   |_||_ |       ||       |', 13,10
     DB '                         |    ___||  |_|  ||    __  ||      _||       |', 13,10
     DB '                         |   |    |       ||   |  | ||     |_ |   _   |', 13,10
     DB '                         |___|    |_______||___|  |_||_______||__| |__|', 13,10
     DB '', 13,10       
     DB '', 13,10       
     DB '                               --------------------- ', 13,10
     DB '                              |        1-JOGAR      |', 13,10
     DB '                               --------------------- ', 13,10
     DB '                              |      2-INSTRUCOES   |', 13,10
     DB '                               --------------------- ', 13,10            
     DB '                              |        3-SAIR       |', 13,10
     DB '                               --------------------- ', 13,10,'$' 
     
 
EscreverMenu:
            call CLEAR_SCREEN
            MOV AH, 9
            LEA DX, MENU
            INT 21H 
               
            MOV AH, 1
            INT 21H
    
            CMP AL,'1'
            JE Jogo
    
            CMP AL,'2'
            JE EscreverInstrucoes
    
            CMP AL,'3'
            JE SAIR
     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

JMP EscreverInstrucoes
        
INSTRUCOES:
           DB '',13,10
           DB ' INSTRUCOES: ', 13,10
           DB ' ----------- ', 13,10
           DB '',13,10             
           DB '    O jogo da forca e um jogo em que o jogador tem que acertar',13,10 
           DB '   qual e a palavra proposta,tendo como dica o numero de letras', 13,10 
           DB '   e o tema ligado a palavra.', 13,10 
           DB '   A cada letra errada, e desenhada uma parte do corpo do enforcado.',13,10 
           DB '   O jogo termina ou com o acerto da palavra ou com o preenchimento',13,10 
           DB '   das partes corpo do enforcado.',13,10
           DB '   Caso a letra nao exista nessa palavra, desenha-se uma parte do corpo,',13,10 
           DB '   O jogo e ganho se a palavra e adivinhada.',13,10,13,10
           DB '   Para voltar ao menu pressiona s/S',13,10, '$'
           
    EscreverInstrucoes:
        
        call CLEAR_SCREEN
        
        MOV AH, 9
        LEA DX, INSTRUCOES
        INT 21H
           
        MOV AH, 1
        INT 21H
    
        CMP AL,'S'
        JE EscreverMenu
        CMP AL,'s'
        JE EscreverMenu

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    Jogo:
     
     call CLEAR_SCREEN
     
     gotoxy 1,1
     print 'Bem Vindo ao jogo da forca. Este jogo contem 5 niveis'
     gotoxy 1,2
     print 'e para ganhar tem de as acertar todas. Boa Sorte!!!'
     
     JMP Main1
     
     Call CLEAR_SCREEN              
    
    Main1:
     
    MOV CH,0
    jmp main 

    VerificarLetra5:
    
    MOV SI,0
    LEA BX, Palavra5
    jmp seguinte

    VerificarLetra4:
    
    MOV SI,0
    LEA BX, Palavra4
    jmp seguinte

    VerificarLetra3:
    
    MOV SI,0
    LEA BX, Palavra3
    jmp seguinte

    VerificarLetra2:
    
    MOV SI,0
    LEA BX, Palavra2
    jmp seguinte

    MAIN5:
    
    Call EscreverDica5
    CALL EspacoPalavra
    CALL PerguntaLetra     
    CALL LER_LETRA 
    MOV DH,'N'
    CALL VerificarLetra5
    CMP DH,'S'
    JE TESTE_FIM5
    INC CH
    CALL FORCA1
    CMP CH,6
    JE  EscreverPerder5
    JMP MAIN5

    MAIN4:
    
    Call EscreverDica4
    CALL EspacoPalavra
    CALL PerguntaLetra    
    CALL LER_LETRA 
    MOV DH,'N'
    CALL VerificarLetra4
    CMP DH,'S'
    JE TESTE_FIM4
    INC CH
    CALL FORCA1
    CMP CH,6
    JE  EscreverPerder4
    JMP MAIN4
    
    MAINDICA3:
    
    MAIN3:
    
    Call EscreverDica3
    CALL EspacoPalavra
    CALL PerguntaLetra     
    CALL LER_LETRA 
    MOV DH,'N'
    CALL VerificarLetra3
    CMP DH,'S'
    JE TESTE_FIM3
    INC CH
    CALL FORCA1
    CMP CH,6
    JE  EscreverPerder3
    JMP MAIN3

    MAIN2:
    
    Call EscreverDica2
    CALL EspacoPalavra
    CALL PerguntaLetra     
    CALL LER_LETRA 
    MOV DH,'N'
    CALL VerificarLetra2
    CMP DH,'S'
    JE TESTE_FIM2
    INC CH
    CALL FORCA1
    CMP CH,6
    JE  EscreverPerder2
    JMP MAIN2

    MAIN:    
    
    Call EscreverDica1
    CALL EspacoPalavra
    CALL PerguntaLetra     
    CALL LER_LETRA 
    MOV DH,'N'
    CALL VerificarLetra
    CMP DH,'S'
    JE TESTE_FIM
    INC CH
    CALL FORCA1
    CMP CH,6
    JE  EscreverPerder1
    JMP MAIN

    EspacoPalavra: 
   
    MOV AH,9    
    LEA DX,TracosPalavra
    INT 21H 
    RET
    
    PerguntaLetra:

    MOV AH,9
    LEA DX,EscolherLetra
    INT 21H
    RET
 
    LER_LETRA: 
            
    MOV AH,1
    INT 21H 
    RET 

    VerificarLetra:
    
    MOV SI,0
    LEA BX, Palavra1 

    SEGUINTE:        

    MOV CL,'$'     ;Marca o fim da palavra
    CMP BX[SI],CL
    JE FIM_PROCURA

    CMP BX[SI],AL ;Compara a letra numa posicao
    JE  ALTERA 
    INC SI  
    JMP SEGUINTE

    FIM_PROCURA:
  
    RET            
          
    ALTERA:       ; Muda o tracinho para a letra

    MOV DH,'S'               
    PUSH BX
    LEA BX, TracosPalavra 
    MOV BX[SI],AL 
    POP BX
    INC SI
    JMP SEGUINTE
    
    ACABOU:                             
    
    PUSH BX
    MOV DH,'N'    
    LEA BX, TracosPalavra
    MOV SI,0

    ComparaEncontrou:

    MOV DL,'$'    ; Verifica se esta tudo preenchido
    CMP BX[SI],DL
    JE  ENCONTROUTODAS
    
    MOV DL,'-' 
    CMP BX[SI],DL
    JE  ENCONTROU 
    INC SI
    JMP ComparaEncontrou

    ENCONTROU: 

    MOV DH,'S'

    ENCONTROUTODAS:

    POP BX
    RET    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

             
    TESTE_FIM:

    CALL ACABOU 
    CMP DH,'N'
    JE FIM
    JMP MAIN

    TESTE_FIM2:

    CALL ACABOU 
    CMP DH,'N'
    JE FIM2
    JMP MAIN2

    TESTE_FIM3:

    CALL ACABOU 
    CMP DH,'N'
    JE FIM3
    JMP MAIN3

    TESTE_FIM4:

    CALL ACABOU 
    CMP DH,'N'
    JE FIM4
    JMP MAIN4

    TESTE_FIM5:

    CALL ACABOU 
    CMP DH,'N'
    JE FIM5
    JMP MAIN5
                 
    FIM:
    
    Call EscreverRespostaAcertou1
    
    MOV AH, 9
    LEA DX, Acertou
    INT 21H  
    
    print 'Aguarde pela proxima palavra. |***********|'
    
    Call CLEAR_SCREEN
    
    MOV CH,0

    mov cx,6     ;cx e o contador do loop exe 20
    mov si,2      ;s1 e vetor o coloca na primeira celula do vetor

    loop1:

    LEA BX, TracosPalavra 
    MOV BX[SI],'-'       ;guarda a tecla q foi lida no vetor
    add si,1           ;adiciona 1 a posicao do vetor 

    loop loop1         ;volta ao ponto q diz batatas

    mov si,0

    MOV CH,0
           
    jmp main2 

    FIM2:
    
    Call EscreverRespostaAcertou2 
    
    MOV AH, 9
    LEA DX, Acertou
    INT 21H 
    
    print 'Aguarde pela proxima palavra. |***********|'
    
    Call CLEAR_SCREEN
    
    MOV CH,0

    mov cx,7     ;cx e o contador do loop exe 20
    mov si,2      ;s1 e vetor o coloca na primeira celula do vetor


    loop2:

    LEA BX, TracosPalavra 
    MOV BX[SI],'-'       ;guarda a tecla q foi lida no vetor
    add si,1           ;adiciona 1 a posicao do vetor 

    loop loop2         ;volta ao ponto q diz batatas

    mov si,0
    
    MOV CH,0
           
    jmp main3

    FIM3:
    
    Call EscreverRespostaAcertou3 

    MOV AH, 9
    LEA DX, Acertou
    INT 21H
    
    print 'Aguarde pela proxima palavra. |***********|' 
    
    Call CLEAR_SCREEN
    
    MOV CH,0

    mov cx,8     ;cx e o contador do loop exe 20
    mov si,2      ;s1 e vetor o coloca na primeira celula do vetor

    loop3:

    LEA BX, TracosPalavra 
    MOV BX[SI],'-'       ;guarda a tecla q foi lida no vetor
    add si,1           ;adiciona 1 a posicao do vetor 
    
    loop loop3         ;volta ao ponto q diz batatas

    mov si,0

    MOV CH,0
           
    jmp main4

    
    FIM4:
    
    Call EscreverRespostaAcertou4 
    
    MOV AH, 9
    LEA DX, Acertou
    INT 21H                    
    
    print 'Aguarde pela proxima palavra. |***********|'
    
    Call CLEAR_SCREEN
    
    MOV CH,0

    mov cx,9     ;cx e o contador do loop exe 20
    mov si,2      ;s1 e vetor o coloca na primeira celula do vetor

    
    loop4:

    LEA BX, TracosPalavra 
    MOV BX[SI],'-'       ;guarda a tecla q foi lida no vetor
    add si,1           ;adiciona 1 a posicao do vetor 

    loop loop4         ;volta ao ponto q diz batatas

    mov si,0

    MOV CH,0
           
    jmp main5

  

    FIM5:
    
    Call EscreverRespostaAcertou5
    
    MOV AH, 9
    LEA DX, Acertou
    INT 21H                
    
    print 'Aguarde pela proxima palavra. |***********|'
    
    Call CLEAR_SCREEN
    
    Call EscreverGanhar
    
    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
        
DesenhoForca1:
             DB ,9,9,9,9,9,9,9,'      =========', 187, 13,10           
             DB ,9,9,9,9,9,9,9,'      º        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      º        ', 186, 13,10             
             DB ,9,9,9,9,9,9,9,'     ( )       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      =========', 188, 13,10,13,10,'$'
             
DesenhoForca2:
             DB ,9,9,9,9,9,9,9,'      =========', 187, 13,10           
             DB ,9,9,9,9,9,9,9,'      º        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      º        ', 186, 13,10             
             DB ,9,9,9,9,9,9,9,'     ( )       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      =========', 188, 13,10,13,10,'$'

DesenhoForca3:
             DB ,9,9,9,9,9,9,9,'      =========', 187, 13,10           
             DB ,9,9,9,9,9,9,9,'      º        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      º        ', 186, 13,10             
             DB ,9,9,9,9,9,9,9,'     ( )       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'     /|        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      =========', 188, 13,10,13,10,'$'

DesenhoForca4:
             DB ,9,9,9,9,9,9,9, '      =========', 187, 13,10           
             DB ,9,9,9,9,9,9,9, '      º        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9, '      º        ', 186, 13,10             
             DB ,9,9,9,9,9,9,9, '     ( )       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9, '      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9, '     /|\       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9, '      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9, '               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9, '               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9, '      =========', 188, 13,10,13,10,'$'

DesenhoForca5:
             DB ,9,9,9,9,9,9,9, '      =========', 187, 13,10           
             DB ,9,9,9,9,9,9,9, '      º        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9, '      º        ', 186, 13,10             
             DB ,9,9,9,9,9,9,9,'     ( )       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'     /|\       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'     /         ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      =========', 188, 13,10,13,10,'$'
             
DesenhoForca6:
             DB ,9,9,9,9,9,9,9,'      =========', 187, 13,10           
             DB ,9,9,9,9,9,9,9,'      º        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      º        ', 186, 13,10             
             DB ,9,9,9,9,9,9,9,'     ( )       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'     /|\       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      |        ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'     / \       ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'               ', 186, 13,10           
             DB ,9,9,9,9,9,9,9,'      =========', 188, 13,10,13,10,'$' 
             
             
             
    FORCA1:
    
    CMP CH,1
    JNE FORCA2 
    MOV AH,9
    LEA DX,DesenhoForca1
    INT 21H
    RET

    FORCA2: 

    CMP CH,2
    JNE FORCA3             
    MOV AH,9
    LEA DX,DesenhoForca2
    INT 21H
    RET
     
    FORCA3: 

    CMP CH,3
    JNE FORCA4             
    MOV AH,9
    LEA DX,DesenhoForca3
    INT 21H
    RET
    
    FORCA4:                  

    CMP CH,4            
    JNE FORCA5
    MOV AH,9
    LEA DX,DesenhoForca4
    INT 21H
    RET
    
    FORCA5:
    
    CMP CH,5
    JNE FORCA6
    MOV AH,9
    LEA DX,DesenhoForca5
    INT 21H
    RET

    FORCA6:
    
    CMP CH,6
    JNE FORCA7
    MOV AH,9
    LEA DX,DesenhoForca6
    INT 21H
    RET  

    FORCA7:

    RET
     
   
Palavra1  DB ,10,13,'berlim',10,13,10,13,'$'
Dica1 DB ,10,13,10,13, 'Dica: Trata-se de uma capital.','$',13,10,13,10,13,10
RespostaFinal1  DB ,10,13,'A palavra era berlim',10,13,10,13,'$'
RespostaAcertou1 DB ,10,13,10,13, 'Passou para o proximo nivel!!! A palavra era berlim',10,13,10,13,'$'

Palavra2  DB ,10,13,'cavalo',10,13,10,13,'$'
Dica2 DB ,10,13,10,13,'Dica: Trata-se de um animal.','$',13,10,13,10
RespostaFinal2  DB ,10,13,'A palavra era cavalo',10,13,10,13,'$'
RespostaAcertou2 DB ,10,13,10,13, 'Passou para o proximo nivel!!! A palavra era cavalo',10,13,10,13,'$'

Palavra3  DB ,10,13,'benfica',10,13,10,13,'$'
Dica3 DB ,10,13,10,13, 'Dica: Trata-se de uma clube.','$',13,10,13,10
RespostaFinal3  DB ,10,13,'A palavra era benfica',10,13,10,13,'$'
RespostaAcertou3 DB ,10,13,10,13, 'Passou para o proximo nivel!!! A palavra era benfica',10,13,10,13,'$'

Palavra4  DB ,10,13,'advogado',10,13,10,13,'$'
Dica4 DB ,10,13,10,13, 'Dica: Trata-se de uma profissao.','$',13,10,13,10
RespostaFinal4  DB ,10,13,'A palavra era advogado',10,13,10,13,'$'
RespostaAcertou4 DB ,10,13,10,13, 'Passou para o proximo nivel!!! A palavra era advogado',10,13,10,13,'$'

Palavra5  DB ,10,13,'chevrolet',10,13,10,13,'$'
Dica5 DB ,10,13,10,13, 'Dica: Trata-se de uma marca de automovel.','$',13,10,13,10
RespostaFinal5  DB ,10,13,'A palavra era lamborghini',10,13,10,13,'$'
RespostaAcertou5 DB ,10,13,10,13, 'A sua jornada chegou ao fim!!! A palavra era chevrolet',10,13,10,13,'$'

TracosPalavra DB '  ------',10,13,10,13,'$'

EscreverDica1:
    MOV AH,9
    LEA DX,Dica1
    INT 21H
    RET

EscreverDica2:
    MOV AH,9
    LEA DX,Dica2
    INT 21H
    RET


EscreverDica3:
    MOV AH,9
    LEA DX,Dica3
    INT 21H
    RET


EscreverDica4:
    MOV AH,9
    LEA DX,Dica4
    INT 21H
    RET
    

EscreverDica5:
    MOV AH,9
    LEA DX,Dica5
    INT 21H
    RET

EscreverRespostaFinal1:
    MOV AH,9
    LEA DX,RespostaFinal1
    INT 21H
    RET
    
EscreverRespostaFinal2:
    MOV AH,9
    LEA DX,RespostaFinal2
    INT 21H
    RET

EscreverRespostaFinal3:
    MOV AH,9
    LEA DX,RespostaFinal3
    INT 21H
    RET
    
EscreverRespostaFinal4:
    MOV AH,9
    LEA DX,RespostaFinal4
    INT 21H
    RET

EscreverRespostaFinal5:
    MOV AH,9
    LEA DX,RespostaFinal5
    INT 21H
    RET

EscreverRespostaAcertou1:
    MOV AH,9
    LEA DX,RespostaAcertou1
 
    INT 21H
    RET
    
EscreverRespostaAcertou2:
    MOV AH,9
    LEA DX,RespostaAcertou2
    print '    '
    INT 21H
    RET
    
EscreverRespostaAcertou3:
    MOV AH,9
    LEA DX,RespostaAcertou3
    INT 21H
    RET
    
EscreverRespostaAcertou4:
    MOV AH,9
    LEA DX,RespostaAcertou4
    INT 21H
    RET
    
EscreverRespostaAcertou5:
    MOV AH,9
    LEA DX,RespostaAcertou5
    INT 21H
    RET    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
EscolherLetra DB ,10,10,'Escolha a letra que quer: ',13,10,'$'
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    Perder:
            DB '           _____          __  __ ______ ', 13,10            
            DB '          / ____|   /\   |  \/  |  ____|', 13,10           
            DB '         | |  __   /  \  | \  / | |__   ', 13,10              
            DB '         | | |_ | / /\ \ | |\/| |  __|  ', 13,10             
            DB '         | |__| |/ ____ \| |  | | |____ ', 13,10           
            DB '          \_____/_/    \_\_|_ |_|______|___ _____  ', 13,10  
            DB '                      / __ \ \    / /  ____|  __ \ ', 13,10 
            DB '                     | |  | \ \  / /| |__  | |__) |', 13,10
            DB '                     | |  | |\ \/ / |  __| |  _  / ', 13,10 
            DB '                     | |__| | \  /  | |____| | \ \ ', 13,10 
            DB '                      \____/   \/   |______|_|  \_\', 13,10
            DB '',13,10
            DB '                      Trabalho Realizado por: Hugo Faria', 13,10,13,10,'$'   
            
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    
    EscreverPerder1:
                   Call EscreverRespostaFinal1
                   call CLEAR_SCREEN
                   MOV AH, 9
                   LEA DX, Perder
                   INT 21H
                   
                   print '               '
                   
                   call SAIR              
                   
    EscreverPerder2:
                   Call EscreverRespostaFinal2
                   call CLEAR_SCREEN
                   MOV AH, 9
                   LEA DX, Perder
                   INT 21H
                   
                   print '               '
                   
                   call SAIR
                   
    EscreverPerder3:
                   Call EscreverRespostaFinal3
                   call CLEAR_SCREEN
                   MOV AH, 9
                   LEA DX, Perder
                   INT 21H           
                   
                   print '               '
                   
                   call SAIR
                   
    EscreverPerder4:
                   Call EscreverRespostaFinal4
                   call CLEAR_SCREEN
                   MOV AH, 9
                   LEA DX, Perder
                   INT 21H           
                   
                   print '               '
                   
                   call SAIR
                   
    EscreverPerder5:
                   Call EscreverRespostaFinal5
                   call CLEAR_SCREEN
                   MOV AH, 9
                   LEA DX, Perder
                   INT 21H                                                             
                   
                   print '               '                      
                                         
                   call SAIR
                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    Ganhar:
          
        DB '          _______      ___      .__   __.  __    __    ______    __    __ ', 13,10 
        DB '         /  _____|    /   \     |  \ |  | |  |  |  |  /  __  \  |  |  |  |', 13,10 
        DB '        |  |  __     /  ^  \    |   \|  | |  |__|  | |  |  |  | |  |  |  |', 13,10 
        DB '        |  | |_ |   /  /_\  \   |  .    | |   __   | |  |  |  | |  |  |  |', 13,10 
        DB '        |  |__| |  /  _____  \  |  |\   | |  |  |  | |   --   | |   --   |', 13,10 
        DB '         \______| /__/     \__\ |__| \__| |__|  |__|  \______/   \______/ ', 13,10
        DB '',13,10
        DB '                      Trabalho Realizado por: Hugo Faria', 13,10,13,10, '$'   
    
    EscreverGanhar:
                   call CLEAR_SCREEN
                   MOV AH, 9
                   LEA DX, Ganhar
                   INT 21H
                   print '               '
                   call SAIR
                   
                                                                                         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    Acertou:
        DB ' ', 13,10
        DB ' ', 13,10   
        DB '  _____  ___    ___    ___   _____  _____  _   _ ', 13,10
        DB ' (  _  )(  _ \ (  _ \ |  _ \(_   _)(  _  )( ) ( )', 13,10
        DB ' | (_) || ( (_)| (_(_)| (_) ) | |  | ( ) || | | |', 13,10
        DB ' |  _  || |  _ |  _)_ |    /  | |  | | | || | | |', 13,10
        DB ' | | | || (_( )| (_( )| |\ \  | |  | (_) || (_) |', 13,10
        DB ' (_) (_)(____/ (____/ (_) (_) (_)  (_____)(_____)', 13,10,13,10, '$'
        

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    
    SAIR:
        call CLEAR_SCREEN
        print 'Obrigado por ter jogado'
     
        MOV AX,4CH 
        INT 21H 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
RET
DEFINE_CLEAR_SCREEN                                                      