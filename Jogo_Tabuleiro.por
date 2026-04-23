programa
{
	inclua biblioteca Util --> u
	
	// Variáveis globais para armazenar as vitórias, pois o placar deve persistir durante toda o tempo em que o jogo estiver aberto
	inteiro vitoriasJogador1 = 0
	inteiro vitoriasJogador2 = 0
	cadeia timeJogador1 = ""
	cadeia timeJogador2 = ""

	// Função inicial, bloco principal que exibe o menu e controla a execução geral do programa
	funcao inicio()
	{
		caracter opcaoMenu = '0'
		logico executando = verdadeiro

		// Laço principal que mantém o jogo aberto até o usuário escolher a opção de sair
		enquanto(executando == verdadeiro)
		{
			escreva("\n===================================================\n")
			escreva("⚽ CAMPEONATO DE FUTEBOL DE TABULEIRO ⚽\n")
			escreva("===================================================\n")
			escreva("1. Jogar (Dar o pontapé inicial!)\n")
			escreva("2. Verificar Placar (Tabela do Campeonato)\n")
			escreva("3. Fechar o jogo (Ir para o vestiário)\n")
			escreva("===================================================\n")
			escreva("Escolha uma opção: ")
			leia(opcaoMenu)
			
			limpa()

			// Executa blocos separados de acordo com a opção que o usuário escolher no menu  (Jogar, Placar, e Sair)
			se (opcaoMenu == '1') {
				prepararJogo() // Coleta de informações iniciais
				jogarPartida() // Roda o jogo de tabuleiro propriamente dito
			} senao se (opcaoMenu == '2') {
				mostrarPlacar() // Exibe a tabela de vitórias cumulativas
			} senao se (opcaoMenu == '3') {
				escreva("Fim de jogo! Apito final e fim da transmissão!\n")
				executando = falso // Quebra a condição do while e encerra o sistema
			} senao {
				escreva("Pênalti! Opção inválida! Escolha 1, 2 ou 3.\n")
			}
		}
	}

	// Função responsável por configurar regras, nomes e times antes de começar a corrida (partida real)
	funcao prepararJogo()
	{
		escreva("\n--- PREPARAÇÃO PARA O JOGO ---\n")
		escreva("REGRAS DO JOGO:\n")
		escreva("- O percurso vai da casa 1 à casa 25.\n")
		escreva("- O primeiro jogador a alcançar a casa final vence.\n")
		escreva("- O dado possui 6 lados, mas durante a trajetória, as casas ativam lances de futebol (bônus ou punições).\n\n")

		cadeia timesDisponiveis = "a, b, c, d, e, f, g"
		logico time1Valido = falso
		logico time2Valido = falso

		// Validação e escolha do time do Jogador 1 (loop para garantir um time válido)
		enquanto(time1Valido == falso)
		{
			escreva("\nTimes disponíveis da liga: ", timesDisponiveis, "\n")
			escreva("Jogador 1, escolha a letra do seu time (a, b, c, d, e, f, g): ")
			leia(timeJogador1)

			// Verifica se o time é uma das letras permitidas em caractere individual
			se (timeJogador1 == "a" ou timeJogador1 == "b" ou timeJogador1 == "c" ou timeJogador1 == "d" ou timeJogador1 == "e" ou timeJogador1 == "f" ou timeJogador1 == "g") {
				time1Valido = verdadeiro // Quebra o While
			} senao {
				escreva("Time inválido! Você chutou pra fora. Tente escolher uma letra aceita na lista.\n")
			}
		}
		
		limpa()
		escreva("--- PREPARAÇÃO PARA O JOGO ---\n")

		// Validação e escolha do time do Jogador 2, possuindo uma regra rigorosa que não pode ser igual ao do Jogador 1
		enquanto(time2Valido == falso)
		{
			escreva("\nTimes disponíveis (exceto ", timeJogador1, "): a, b, c, d, e, f, g\n")
			escreva("Jogador 2, escolha a letra do seu time: ")
			leia(timeJogador2)

			// Impede escolha repetida e checa se digitou letras estritas
			se (timeJogador2 == timeJogador1) {
				escreva("Falta! Esse time já foi escolhido pelo Jogador 1 e não pode ser repetido. Escolha outro.\n")
			} senao se (timeJogador2 == "a" ou timeJogador2 == "b" ou timeJogador2 == "c" ou timeJogador2 == "d" ou timeJogador2 == "e" ou timeJogador2 == "f" ou timeJogador2 == "g") {
				time2Valido = verdadeiro // Tudo certo, sai do loop 
			} senao {
				escreva("Time inválido ou Inexistente! Tente de novo.\n")
			}
		}
		
		limpa()
	}

	// Função de exibir apenas dados formatados sobre quem lidera o número de jogos
	funcao mostrarPlacar()
	{
		escreva("\n===================================================\n")
		escreva("🏆 PLACAR GERAL DO CAMPEONATO🏆\n")
		escreva("===================================================\n")
		// Verificamos se houve pelo menos uma pessoa registrando seu jogo para então mostrar os pontos
		se (timeJogador1 != "") {
			escreva("Jogador 1 (Time ", timeJogador1, "): ", vitoriasJogador1, " vitória(s)\n")
			escreva("Jogador 2 (Time ", timeJogador2, "): ", vitoriasJogador2, " vitória(s)\n")
		} senao {
			escreva("A temporada ainda não iniciou! Jogue a primeira partida e volte aqui.\n")
		}
		escreva("===================================================\n\n")
	}

	funcao tocarAudio(inteiro casa, inteiro dado)
	{
		// Estrutura reservada para no futuro adicionar áudio
		// Exemplo: se (casa == 21) { tocarSom("apito.wav") }
	}

	funcao animarDado(inteiro numero)
	{
		escreva("\n")
		escreva(" +-------+ \n")
		se (numero == 1) { 
			escreva(" |       | \n")
			escreva(" |   .   | \n")
			escreva(" |       | \n")
		} senao se (numero == 2) { 
			escreva(" | .     | \n")
			escreva(" |       | \n")
			escreva(" |     . | \n")
		} senao se (numero == 3) { 
			escreva(" | .     | \n")
			escreva(" |   .   | \n")
			escreva(" |     . | \n")
		} senao se (numero == 4) { 
			escreva(" | .   . | \n")
			escreva(" |       | \n")
			escreva(" | .   . | \n")
		} senao se (numero == 5) { 
			escreva(" | .   . | \n")
			escreva(" |   .   | \n")
			escreva(" | .   . | \n")
		} senao se (numero == 6) { 
			escreva(" | .   . | \n")
			escreva(" | .   . | \n")
			escreva(" | .   . | \n")
		}
		escreva(" +-------+ \n")
	}

	funcao exibirTabuleiro(inteiro pos1, inteiro pos2, cadeia t1, cadeia t2)
	{
		escreva("\n--- CAMPO DE JOGO ---\n")
		para (inteiro i = 1; i <= 25; i++) {
			se (pos1 == i e pos2 == i) {
				escreva("[", t1, ",", t2, "] ")
			} senao se (pos1 == i) {
				escreva("[ ", t1, " ] ")
			} senao se (pos2 == i) {
				escreva("[ ", t2, " ] ")
			} senao {
				se (i < 10) {
					escreva("[ 0", i, "] ")
				} senao {
					escreva("[ ", i, "] ")
				}
			}
			se (i == 8 ou i == 16) {
				escreva("\n")
			}
		}
		escreva("\n---------------------\n")
	}

	// Função gigante que comanda o núcleo de lógica do tabuleiro propriamente dito, rodada a rodada
	funcao jogarPartida()
	{
		// Usamos vetores para guardar as informações de ambos os jogadores pareadamente 
		cadeia nomes[2]
		nomes[0] = "Jogador 1"
		nomes[1] = "Jogador 2"
		
		cadeia times[2]
		times[0] = timeJogador1
		times[1] = timeJogador2
		
		// Iniciar posições dos dois jogadores estritamente na casa 1 de acordo com as regras dadas
		inteiro casas[2]
		casas[0] = 1
		casas[1] = 1
		
		// Vetor para controlar eventuais penalidades (rodadas suspensas/sem poder jogar)
		inteiro penalidades[2]
		penalidades[0] = 0
		penalidades[1] = 0
		
		inteiro vez = 0 // "0" significa que é o jogador 1 atual, enquanto "1" é o jogador 2
		logico partidaEmAndamento = verdadeiro
		caracter controleDado
		
		escreva("\n===================================================\n")
		escreva("⚽ BOLA ROLANDO! INÍCIO DA PARTIDA! ⚽\n")
		escreva("Ambos os jogadores iniciam na casa 1.\n")
		escreva("===================================================\n")
		
		exibirTabuleiro(casas[0], casas[1], times[0], times[1])

		// Laço principal do Tabuleiro, que continua a girar rodadas até que alguém derrote o percurso
		enquanto(partidaEmAndamento == verdadeiro)
		{
			// Configura os índices lógicos para poder interagir com quem detém a vez e o adversário no vetor
			inteiro pAtual = vez
			inteiro pAdversario = 1
			se (vez == 1) {
				pAdversario = 0
			}

			escreva("\n---> Vez do ", nomes[pAtual], " (Time ", times[pAtual], ") <---\n")
			
			// Se o jogador possuir um "Cartão Amarelo/Vermelho" pendente (maior que 0), ele é obrigado a pular este turno 
			se (penalidades[pAtual] > 0) {
				escreva("Você está suspenso pelo juiz e aguarda no banco! (Foi punido e vai perder sua rodada).\n")
				penalidades[pAtual] = penalidades[pAtual] - 1 // Desconta para na próxima rodada poder se libertar da penalidade
				exibirTabuleiro(casas[0], casas[1], times[0], times[1])
			} senao {
				logico turnoValido = verdadeiro
				
				// O loop interno serve para ocasiões de benefício extra como a casa 23, de modo a jogar novamente
				enquanto (turnoValido == verdadeiro) {
					turnoValido = falso // Define como falso pra não ficar no loop contínuo (a menos que a casa 23 ligue a chave de novo)
					
					escreva("PRESSIONE a tecla ESPAÇO e ENTER para mandar um bicão na bola (jogar o dado): ")
					leia(controleDado)

					enquanto (controleDado != ' ') {
						escreva("Opa! Jogada errada! Pressione a tecla ESPAÇO e em seguida ENTER: ")
						leia(controleDado)
					}

					// Limpa a tela para uma visão individual da rodada
					limpa()
					escreva("---> Resultado do ", nomes[pAtual], " (Time ", times[pAtual], ") <---\n")

					// Rola o dado do Portugol (sorteia) de 1 a 6 como ensinado no detalhamento de funções
					inteiro dado = u.sorteia(1, 6)
					
					tocarAudio(casas[pAtual], dado)
					animarDado(dado)
					
					escreva("A bola voou e rolou o dado número: ", dado, "!!!\n")
					
					// Soma à posição local que a pessoa estava
					casas[pAtual] = casas[pAtual] + dado
					
					escreva("Correndo você alcançou a casa ", casas[pAtual], ".\n")
					
					// ==== COMEÇO DA LÓGICA REGRAS E EVENTOS DAS CASAS ESPECÍFICAS ====== //
					
					se (casas[pAtual] == 2) {
						escreva("[CASA 2] Falta perigosa! O juiz ajustou a barreira. Avance magicamente para a casa 5.\n")
						casas[pAtual] = 5
					} senao se (casas[pAtual] == 3) {
						// Jogará o dado extra especial pedido de 3 faces
						escreva("[CASA 3] Chute de trivela lindíssimo! Bônus: role um dado adicional de 3 lados.\n")
						inteiro extra = u.sorteia(1, 3)
						escreva("O dado triplo caiu no número: ", extra, "!\n")
						casas[pAtual] = casas[pAtual] + extra
						escreva("Agora você parou na casa: ", casas[pAtual], ".\n")
					} senao se (casas[pAtual] == 7) {
						// Impute cartão que paralisa as chances do jogador na próxima rodada global
						escreva("[CASA 7] Reclamação insistente com o árbitro... Cartão amarelo! Fique 1 rodada sem jogar.\n")
						penalidades[pAtual] = 1
					} senao se (casas[pAtual] == 10) {
						// Inversão de locais onde ocorre a troca nas posições dos arrays
						escreva("[CASA 10] O VAR de confusão apontou irregularidade de ambos e trocou a posição de vocês dois!!\n")
						inteiro temporario = casas[pAtual]
						casas[pAtual] = casas[pAdversario]
						casas[pAdversario] = temporario
						escreva("Você foi enviado para a casa ", casas[pAtual], " e o adversário levado para a ", casas[pAdversario], "!\n")
					} senao se (casas[pAtual] == 12) {
						escreva("[CASA 12] Impedimento! O bandeirinha levantou na banheira tardiamente. Volte 1 casa.\n")
						casas[pAtual] = casas[pAtual] - 1
					} senao se (casas[pAtual] == 15) {
						escreva("[CASA 15] Pênalti pra fora do estádio! E para se redimir, a regra manda cantar uma música na vida real para seu colega!\n")
						escreva("Escolha sua forma de escapar da pressão:\n")
						escreva(" 1 - Cantar o trecho da música na vida real e ficar parado aqui.\n")
						escreva(" 2 - Desistir de vergonha e Voltar 2 casas como punição pesada.\n")
						caracter decisaoSing
						leia(decisaoSing)
						se (decisaoSing == '1') {
							escreva("Maravilha! Você soltou a voz presencialmente e a posição foi mantida!\n")
						} senao {
							escreva("Pipocou a responsabilidade pra torcida... Punição de fujão. Você recuou 2 casas.\n")
							casas[pAtual] = casas[pAtual] - 2
						}
					} senao se (casas[pAtual] == 19) {
						// Punição máxima de regressão local
						escreva("[CASA 19] Carrinho violento criminoso por trás! Cartão Vermelho, chuveiro! O Juiz mandou voltar ao ínicio da Partida (CASA 1).\n")
						casas[pAtual] = 1
					} senao se (casas[pAtual] == 20) {
						// Customizadas entre 20 e 24, equipe decidiu criar a temática focada em futebol também
						escreva("[CASA 20] Bônus: Fez o famoso 'Drible da Vaca' que quebrou a linha inimiga. Avance 2 casas!\n")
						casas[pAtual] = casas[pAtual] + 2
					} senao se (casas[pAtual] == 21) {
						escreva("[CASA 21] Punição: Gol com a mão à lá Maradona! O VAR desmascarou e recuou você em 3 casas.\n")
						casas[pAtual] = casas[pAtual] - 3
					} senao se (casas[pAtual] == 22) {
						// Pular posições
						escreva("[CASA 22] Bônus: Lançamento em profundidade de meia cancha, contra-ataque da morte! Avance velozmente até a casa 24.\n")
						casas[pAtual] = 24
					} senao se (casas[pAtual] == 23) {
						escreva("[CASA 23] Bônus: Houve penalti agarrando o seu boneco na área no escanteio! Jogue o dado de novo AGORA!\n")
						turnoValido = verdadeiro // Vira a chave para que a estrutura de repetição menor não termine e o atual jogue outra vez
					} senao se (casas[pAtual] == 24) {
						// Punição de perda de turno
						escreva("[CASA 24] Punição: Bola quebra as pernas e fura o travessão mas NÃO ENTRA! Você cai em desespero e fica 1 rodada no chão.\n")
						penalidades[pAtual] = 1
					}

					// ==== FIM DA LÓGICA EVENTOS ESPECÍFICOS ====== //

					// Tratamento final de Checagem se alguém extrapolou ou atingiu a casa mestre de limite do tabuleiro
					se (casas[pAtual] >= 25) {
						casas[pAtual] = 25 // Força ele mostrar "25" apenas pra visual da vitória ficar perfeito
						
						exibirTabuleiro(casas[0], casas[1], times[0], times[1])

						escreva("\nGOOOOOOOOLLAAAAAAAAÇOOOOOO! O JUIZ APITA O FIM DA COPA DO MUNDO DE TABULEIRO!! 🏆\n")
						escreva("O ", nomes[pAtual], " (Time ", times[pAtual], ") alcançou a casa mestre ", casas[pAtual], " e faturou a Partida!\n")
						
						// Computa a vitória no vencedor apropriado, de forma definitiva à variável solta
						se (vez == 0) {
							vitoriasJogador1 = vitoriasJogador1 + 1
						} senao {
							vitoriasJogador2 = vitoriasJogador2 + 1
						}
						
						// Declara o fim lógico dos dois engate de loop para encerrar a ação
						partidaEmAndamento = falso
						turnoValido = falso 
					} senao se (turnoValido == falso) {
						// Exibe tabuleiro da situação final se não foi apenas um "jogue de novo" da casa 23
						exibirTabuleiro(casas[0], casas[1], times[0], times[1])
					}
				} // fim loop turno extra (do lance benefício)
			}

			// Esse if assegura que a rodada passa corretamente apenas repassando as variaveis "vez" enquanto tiver vivo
			se (partidaEmAndamento == verdadeiro) {
				// Inversão simples para dar a vez a quem é de direito pela fila
				se (vez == 0) {
					vez = 1
				} senao {
					vez = 0
				}
			}
			
		} // fim laço Enquanto gigantesco do tabuleiro rodando
		
		escreva("\nPressione qualquer caractere e ENTER para retornar ao menu...")
		cadeia menuRetorno
		leia(menuRetorno)
		limpa()
	}
}