programa
{
	inclua biblioteca Util --> u

	funcao inteiro jogarDado() {
		inteiro dado 

		dado = u.sorteia(1,6) //2
		retorne dado // 2
	}

	
	
	funcao jogarPartida() {

		//Jogadores são apresentados ao jogo
		
			cadeia nomeJogador1
			cadeia nomeJogador2
			inteiro casaJogador1 = 1
			inteiro casaJogador2 = 1
			inteiro vitoriasJogador1 = 0
			inteiro vitoriasJogador2 = 0
			inteiro jogadorAtual = 1
			inteiro op = 0
			

			escreva("Antes de começar, precisamos que informe seus nomes!\n")
			escreva("Jogador 1, informe seu nome: \n")
			leia(nomeJogador1)
			escreva("Jogador 2, informe seu nome: \n")
			leia(nomeJogador2)

			escreva("\n \nSejam bem vindos " + nomeJogador1 + " e " + nomeJogador2 + "\n \n")
			escreva("Os jogadores irão iniciar a partida na casa 1\n \n")

		//loop para rodar ate alcancar a casa desejada
			enquanto (casaJogador1 <= 20 e casaJogador2 <= 20) {

				inteiro numSorteado = jogarDado() // 2

				se(jogadorAtual == 1) {

	
					escreva(nomeJogador1 + " escolha uma opcao \n")
					escreva(" 1 - jogar dado \n 2 - Ver placar \n 3 - Sair \n")
					leia(op)
					
					se(op == 1){
					escreva("\n" + nomeJogador1 + " jogou o dado, número sorteado: " + numSorteado + "\n")
					casaJogador1 = casaJogador1 + numSorteado
					escreva(nomeJogador1 + " você está na casa " + casaJogador1 + "\n\n")

					se(casaJogador1 == 2) {
						
						escreva("Que baita sorte! Você avançara para a casa 5\n")
						casaJogador1 = 5
						escreva(nomeJogador1 + " agora você está na casa " + casaJogador1 + "\n\n")
					}
				}

				
				senao se(op == 2 ){
					escreva("Funcao indisponivel!")
					}
					
					jogadorAtual = 2
				} 


				// bloco 2 abaixo

				
				senao {

					escreva(nomeJogador2 + " escolha uma opcao \n")
					escreva(" 1 - jogar dado \n 2 - Ver placar \n 3 - Sair \n")
					leia(op)
					
					se(op == 1){
					escreva("\n" + nomeJogador2 + " jogou o dado, número sorteado: " + numSorteado + "\n")
					casaJogador2 = casaJogador2 + numSorteado
					escreva(nomeJogador2 + " você está na casa " + casaJogador2 + "\n\n")
					

					se(casaJogador1 == 2) {
						
						escreva("Que baita sorte! Você avançara para a casa 5\n")
						casaJogador1 = 5
						escreva(nomeJogador1 + " agora você está na casa " + casaJogador1 + "\n\n")
					}
				}

					jogadorAtual = 1
					
				}	
			}

			

			
	}
			


		
	
	funcao inicio()
	{
		inteiro opcaoEscolhida = 0
		logico rep = verdadeiro
		inteiro casaJogador1 = 1, casaJogador2 = 1

		//Lógica do menu do jogo
		// quando o user escolher uma opcao válida, rep se torna falso para sair do laco
		// quando o user escolher um valor negativo ou maior que 3, ocorrer um erro
		// o loop continua ate que o user digite um valor valido

		enquanto(rep == verdadeiro) {
			
		escreva("Digite uma opção: \n")
		escreva(" 1 - Jogar \n 2 - Consultar placar \n 3 - Sair \n")
		leia(opcaoEscolhida)

		se (opcaoEscolhida == 1) {
			escreva("A opção escolhida foi a 1\n")
			jogarPartida()
			

			
			rep = falso
		}

		senao se (opcaoEscolhida == 2) {
			escreva("A opção escolhida foi a 2\n")
			rep = falso
		}

		senao se (opcaoEscolhida == 3) {
			escreva("A opção escolhida foi a 3\n")
			rep = falso
		}

		senao {
			escreva("ERRO! Por favor escolha uma opção válida! \n")
			rep = verdadeiro
		}

		
		}
	
	}

	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1846; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */