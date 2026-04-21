programa
{
	
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

	funcao jogarPartida() {

			cadeia nomeJogador1
			cadeia nomeJogador2

			escreva("Antes de começar, precisamos que informe seus nomes!\n")
			escreva("Jogador 1, informe seu nome: \n")
			leia(nomeJogador1)
			escreva("Jogador 2, informe seu nome: \n")
			leia(nomeJogador2)

			escreva("Muito bem! Sejam vindos" + nomeJogador1 + " e " + nomeJogador2)
		}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1309; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */