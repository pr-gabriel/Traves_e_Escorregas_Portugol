programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> txt
	
	// Variáveis globais
	inteiro vitoriasJogador1 = 0
	inteiro vitoriasJogador2 = 0
	cadeia nomeJogador1 = ""
	cadeia nomeJogador2 = ""
	cadeia timeJogador1 = ""
	cadeia timeJogador2 = ""
	cadeia emojiJogador1 = ""
	cadeia emojiJogador2 = ""
	cadeia modoJogo = "S"

	funcao inicio()
	{
		cadeia opcaoMenu = ""
		logico executando = verdadeiro

		enquanto(executando == verdadeiro)
		{
			escreva("\n===================================================\n")
			escreva("       ⚽ CAMPEONATO DE FUTEBOL DE TABULEIRO ⚽      \n")
			escreva("===================================================\n")
			escreva("  1. 🏆 Jogar (Dar o pontapé inicial!)\n")
			escreva("  2. 📊 Verificar Placar (Tabela do Campeonato)\n")
			escreva("  3. 🚪 Fechar o jogo (Ir para o vestiário)\n")
			escreva("===================================================\n")
			escreva("Escolha uma opção: ")
			leia(opcaoMenu)
			
			limpa()

			se (opcaoMenu == "1") {
				prepararJogo()
				se (timeJogador1 != "" e timeJogador2 != "") {
					jogarPartida()
				}
			} senao se (opcaoMenu == "2") {
				mostrarPlacar()
			} senao se (opcaoMenu == "3") {
				escreva("Fim de jogo! Apito final e fim da transmissão!\n")
				executando = falso
			} senao {
				mostrarErro("Pênalti! Opção inválida! Escolha 1, 2 ou 3.")
			}
		}
	}

	funcao mostrarErro(cadeia mensagem)
	{
		limpa()
		escreva("❌ ERRO: ", mensagem, "\n\nPressione ENTER para voltar...")
		cadeia pausa
		leia(pausa)
		limpa()
	}

	funcao logico nomeInvalido(cadeia nome)
	{
		se (txt.numero_caracteres(nome) == 0) {
			retorne verdadeiro
		}
		
		cadeia invalidos = "0123456789!@#$%¨&*()_+-=[]{}|\\;:'\",.<>/?°ºª"
		para (inteiro i = 0; i < txt.numero_caracteres(nome); i++) {
			cadeia letra = txt.extrair_subtexto(nome, i, i+1)
			se (txt.posicao_texto(letra, invalidos, 0) >= 0) {
				retorne verdadeiro
			}
		}
		retorne falso
	}

	funcao prepararJogo()
	{
		logico modoDefinido = falso
		enquanto (modoDefinido == falso) {
			limpa()
			escreva("\n===================================================\n")
			escreva("              ⚽ MODO DE COMPETIÇÃO 🏆               \n")
			escreva("===================================================\n")
			escreva("Antes de rolar a bola, escolha o ritmo da partida:\n\n")
			escreva(" [A] Automático: Sem interrupções (Nota: O dado neste\n")
			escreva("     modo Debug continuará sendo digitado manualmente).\n")
			escreva(" [M] Manual: Você controla tudo! Exige apertar ENTER\n")
			escreva("     para jogar os dados e para fechar mensagens.\n")
			escreva(" [S] Semi-Automático: Requer tocar no ENTER para \n")
			escreva("     rolar, mas as mensagens fecham sozinhas.\n")
			escreva("===================================================\n")
			escreva("Digite a letra referencial (A, M ou S): ")
			leia(modoJogo)
			
			se (modoJogo == "a" ou modoJogo == "A") { modoJogo = "A" modoDefinido = verdadeiro }
			senao se (modoJogo == "m" ou modoJogo == "M") { modoJogo = "M" modoDefinido = verdadeiro }
			senao se (modoJogo == "s" ou modoJogo == "S") { modoJogo = "S" modoDefinido = verdadeiro }
			senao { mostrarErro("Falta! Opção inválida. Escolha A, M ou S.") }
		}

		limpa()
		escreva("\n===================================================\n")
		escreva("              📋 VAR INFORMA AS REGRAS 📋            \n")
		escreva("===================================================\n")
		escreva(" - O percurso vai da casa 1 à casa 25.\n")
		escreva(" - O primeiro jogador a alcançar a casa final vence.\n")
		escreva(" - O dado possui 6 lados, mas durante a trajetória,\n")
		escreva("   as casas ativam lances de futebol (bônus/punição).\n")
		escreva("===================================================\n\n")
		escreva("Pressione ENTER para continuar para a escalação...\n\n")
		cadeia pausaRegras
		leia(pausaRegras)

		logico nome1Valido = falso
		enquanto(nome1Valido == falso)
		{
			limpa()
			escreva("\n===================================================\n")
			escreva("               ✍️ ESCALAÇÃO DOS ATLETAS               \n")
			escreva("===================================================\n")
			escreva("Digite o nome do Jogador 1 (apenas letras): ")
			leia(nomeJogador1)
			se (nomeInvalido(nomeJogador1)) {
				mostrarErro("O nome não pode ser vazio e não deve conter números ou caracteres especiais.")
			} senao {
				nome1Valido = verdadeiro
			}
		}

		logico nome2Valido = falso
		enquanto(nome2Valido == falso)
		{
			limpa()
			escreva("\n===================================================\n")
			escreva("               ✍️ ESCALAÇÃO DOS ATLETAS               \n")
			escreva("===================================================\n")
			escreva("Digite o nome do Jogador 2 (apenas letras): ")
			leia(nomeJogador2)
			se (nomeInvalido(nomeJogador2)) {
				mostrarErro("O nome não pode ser vazio e não deve conter números ou caracteres especiais.")
			} senao se (nomeJogador2 == nomeJogador1) {
				mostrarErro("O nome do Jogador 2 não pode ser igual ao do Jogador 1.")
			} senao {
				nome2Valido = verdadeiro
			}
		}

		logico time1Valido = falso
		logico time2Valido = falso

		enquanto(time1Valido == falso)
		{
			limpa()
			escreva("\n===================================================\n")
			escreva("               👕 VESTIÁRIO DOS TIMES                 \n")
			escreva("===================================================\n")
			escreva("---> ELENCO DO JOGADOR 1: ", nomeJogador1, " <---\n")
			escreva(" 1 - Atlético Mineiro (🐓)\n")
			escreva(" 2 - Barcelona (🔵)\n")
			escreva(" 3 - Brasil de Pelotas (🐺)\n")
			escreva(" 4 - Chapecoense (🏹)\n")
			escreva(" 5 - Cruzeiro (🦊)\n")
			escreva(" 6 - Flamengo (🦅)\n")
			escreva(" 7 - Fluminense (🛡️)\n")
			escreva(" 8 - Grêmio (🇪🇪)\n")
			escreva(" 9 - Palmeiras (🐷)\n")
			escreva("10 - Real Madrid (👑)\n")
			escreva("11 - São Paulo (🔴)\n")
			escreva("===================================================\n")
			escreva("\nDigite o número do time escolhido: ")
			cadeia escolha1
			leia(escolha1)

			se (escolha1 == "1") { timeJogador1 = "Atlético Mineiro" emojiJogador1 = "🐓" time1Valido = verdadeiro }
			senao se (escolha1 == "2") { timeJogador1 = "Barcelona" emojiJogador1 = "🔵" time1Valido = verdadeiro }
			senao se (escolha1 == "3") { timeJogador1 = "Brasil de Pelotas" emojiJogador1 = "🐺" time1Valido = verdadeiro }
			senao se (escolha1 == "4") { timeJogador1 = "Chapecoense" emojiJogador1 = "🏹" time1Valido = verdadeiro }
			senao se (escolha1 == "5") { timeJogador1 = "Cruzeiro" emojiJogador1 = "🦊" time1Valido = verdadeiro }
			senao se (escolha1 == "6") { timeJogador1 = "Flamengo" emojiJogador1 = "🦅" time1Valido = verdadeiro }
			senao se (escolha1 == "7") { timeJogador1 = "Fluminense" emojiJogador1 = "🛡️" time1Valido = verdadeiro }
			senao se (escolha1 == "8") { timeJogador1 = "Grêmio" emojiJogador1 = "🇪🇪" time1Valido = verdadeiro }
			senao se (escolha1 == "9") { timeJogador1 = "Palmeiras" emojiJogador1 = "🐷" time1Valido = verdadeiro }
			senao se (escolha1 == "10") { timeJogador1 = "Real Madrid" emojiJogador1 = "👑" time1Valido = verdadeiro }
			senao se (escolha1 == "11") { timeJogador1 = "São Paulo" emojiJogador1 = "🔴" time1Valido = verdadeiro }
			senao { mostrarErro("Time inválido! Você chutou pra fora. Digite um número de 1 a 11.") }
		}

		enquanto(time2Valido == falso)
		{
			limpa()
			escreva("\n===================================================\n")
			escreva("               👕 VESTIÁRIO DOS TIMES                 \n")
			escreva("===================================================\n")
			escreva("---> ELENCO DO JOGADOR 2: ", nomeJogador2, " <---\n")
			escreva("Lista de times para escolher (exceto ", timeJogador1, "):\n\n")
			escreva(" 1 - Atlético Mineiro (🐓)\n")
			escreva(" 2 - Barcelona (🔵)\n")
			escreva(" 3 - Brasil de Pelotas (🐺)\n")
			escreva(" 4 - Chapecoense (🏹)\n")
			escreva(" 5 - Cruzeiro (🦊)\n")
			escreva(" 6 - Flamengo (🦅)\n")
			escreva(" 7 - Fluminense (🛡️)\n")
			escreva(" 8 - Grêmio (🇪🇪)\n")
			escreva(" 9 - Palmeiras (🐷)\n")
			escreva("10 - Real Madrid (👑)\n")
			escreva("11 - São Paulo (🔴)\n")
			escreva("===================================================\n")
			escreva("\nDigite o número do time escolhido: ")
			cadeia escolha2
			leia(escolha2)

			cadeia tempTime = ""
			cadeia tempEmoji = ""
			
			se (escolha2 == "1") { tempTime = "Atlético Mineiro" tempEmoji = "🐓" }
			senao se (escolha2 == "2") { tempTime = "Barcelona" tempEmoji = "🔵" }
			senao se (escolha2 == "3") { tempTime = "Brasil de Pelotas" tempEmoji = "🐺" }
			senao se (escolha2 == "4") { tempTime = "Chapecoense" tempEmoji = "🏹" }
			senao se (escolha2 == "5") { tempTime = "Cruzeiro" tempEmoji = "🦊" }
			senao se (escolha2 == "6") { tempTime = "Flamengo" tempEmoji = "🦅" }
			senao se (escolha2 == "7") { tempTime = "Fluminense" tempEmoji = "🛡️" }
			senao se (escolha2 == "8") { tempTime = "Grêmio" tempEmoji = "🇪🇪" }
			senao se (escolha2 == "9") { tempTime = "Palmeiras" tempEmoji = "🐷" }
			senao se (escolha2 == "10") { tempTime = "Real Madrid" tempEmoji = "👑" }
			senao se (escolha2 == "11") { tempTime = "São Paulo" tempEmoji = "🔴" }
			senao { mostrarErro("Time inválido! Tente de novo.") }

			se (tempTime != "") {
				se (tempTime == timeJogador1) {
					mostrarErro("Falta! Esse time já foi escolhido pelo Jogador 1. Escolha outro.")
				} senao {
					timeJogador2 = tempTime
					emojiJogador2 = tempEmoji
					time2Valido = verdadeiro
				}
			}
		}
		
		limpa()
	}

	funcao mostrarPlacar()
	{
		escreva("\n===================================================\n")
		escreva("🏆 PLACAR GERAL DO CAMPEONATO🏆\n")
		escreva("===================================================\n")
		se (timeJogador1 != "") {
			escreva("Jogador 1: ", nomeJogador1, " (Time ", timeJogador1, " ", emojiJogador1, "): ", vitoriasJogador1, " vitória(s)\n")
			escreva("Jogador 2: ", nomeJogador2, " (Time ", timeJogador2, " ", emojiJogador2, "): ", vitoriasJogador2, " vitória(s)\n")
		} senao {
			escreva("A temporada ainda não iniciou! Jogue a primeira partida e volte aqui.\n")
		}
		escreva("===================================================\n\n")
		escreva("Pressione ENTER para voltar...")
		cadeia pausa
		leia(pausa)
		limpa()
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

	funcao exibirTabuleiro(inteiro pos1, inteiro pos2)
	{
		escreva("\n--- CAMPO DE JOGO ---\n\n")
		
		para (inteiro linha = 0; linha < 5; linha++) {
			
			// Linha superior: Posição dos Jogadores (Emojis) flutuando sobre as caixas
			para (inteiro col = 1; col <= 5; col++) {
				inteiro casaCorrente = (linha * 5) + col
				se (pos1 == casaCorrente e pos2 == casaCorrente) {
					escreva("   ", emojiJogador1, emojiJogador2, "  ")
				} senao se (pos1 == casaCorrente) {
					escreva("    ", emojiJogador1, "   ")
				} senao se (pos2 == casaCorrente) {
					escreva("    ", emojiJogador2, "   ")
				} senao {
					escreva("         ")
				}
			}
			escreva("\n")

			// Linha de blocos: Números e quadrados coloridos intocáveis
			para (inteiro col = 1; col <= 5; col++) {
				inteiro casaCorrente = (linha * 5) + col
				cadeia icone = ""
				
				se (casaCorrente == 1) {
					icone = "🟨 "
				} senao se (casaCorrente == 25) {
					icone = "🏁 "
				} senao se (casaCorrente == 2 ou casaCorrente == 3 ou casaCorrente == 20 ou casaCorrente == 22 ou casaCorrente == 23) {
					icone = "🟩 "
				} senao se (casaCorrente == 7 ou casaCorrente == 10 ou casaCorrente == 12 ou casaCorrente == 15 ou casaCorrente == 19 ou casaCorrente == 21 ou casaCorrente == 24) {
					icone = "🟥 "
				} senao {
					icone = "⬛ "
				}
				
				se (casaCorrente < 10) {
					escreva("[0", casaCorrente, ":", icone, "] ")
				} senao {
					escreva("[", casaCorrente, ":", icone, "] ")
				}
			}
			escreva("\n\n")
		}
		escreva("---------------------\n")
	}

	funcao jogarPartida()
	{
		cadeia nomes[2]
		nomes[0] = nomeJogador1
		nomes[1] = nomeJogador2
		
		cadeia times[2]
		times[0] = timeJogador1
		times[1] = timeJogador2

		cadeia emojis[2]
		emojis[0] = emojiJogador1
		emojis[1] = emojiJogador2
		
		inteiro casas[2]
		casas[0] = 1
		casas[1] = 1
		
		inteiro penalidades[2]
		penalidades[0] = 0
		penalidades[1] = 0
		
		inteiro vez = 0
		logico partidaEmAndamento = verdadeiro
		cadeia controleDado
		
		escreva("\n===================================================\n")
		escreva("⚽ BOLA ROLANDO! INÍCIO DA PARTIDA! ⚽\n")
		escreva("Ambos os jogadores iniciam na casa 1.\n")
		escreva("===================================================\n")
		
		exibirTabuleiro(casas[0], casas[1])

		enquanto(partidaEmAndamento == verdadeiro)
		{
			inteiro pAtual = vez
			inteiro pAdversario = 1
			se (vez == 1) {
				pAdversario = 0
			}

			se (penalidades[pAtual] > 0) {
				escreva("\n---> Vez de ", nomes[pAtual], " (Time ", times[pAtual], " ", emojis[pAtual], ") <---\n")
				escreva("Você está suspenso pelo juiz e aguarda no banco! (Foi punido e vai perder sua rodada).\n")
				penalidades[pAtual] = penalidades[pAtual] - 1
			} senao {
				logico turnoValido = verdadeiro
				
				enquanto (turnoValido == verdadeiro) {
					turnoValido = falso
					
					// Mostra de quem é o turno abaixo do tabuleiro
					escreva("\n---> Vez de ", nomes[pAtual], " (Time ", times[pAtual], " ", emojis[pAtual], ") <---\n")
					
					inteiro dado = 0
					logico leuDado = falso
					enquanto (leuDado == falso) {
						escreva("MODO DEBUG - Digite o número forçado do dado (1 a 6): ")
						cadeia debug_str
						leia(debug_str)
						se (debug_str == "1" ou debug_str == "2" ou debug_str == "3" ou debug_str == "4" ou debug_str == "5" ou debug_str == "6") {
							se (debug_str == "1") { dado = 1 }
							senao se (debug_str == "2") { dado = 2 }
							senao se (debug_str == "3") { dado = 3 }
							senao se (debug_str == "4") { dado = 4 }
							senao se (debug_str == "5") { dado = 5 }
							senao se (debug_str == "6") { dado = 6 }
							leuDado = verdadeiro
						} senao {
							mostrarErro("Opa! Digite apenas números de 1 a 6 no modo Debug.")
							exibirTabuleiro(casas[0], casas[1])
							escreva("\n---> Vez de ", nomes[pAtual], " (Time ", times[pAtual], " ", emojis[pAtual], ") <---\n")
						}
					}

					// Fase 1: Sorteio do dado e posição intermediária
					limpa()
					escreva("---> Resultado de ", nomes[pAtual], " (Time ", times[pAtual], " ", emojis[pAtual], ") <---\n")
					
					animarDado(dado)
					
					escreva("A bola voou e rolou o dado número: ", dado, "!!!\n")
					
					casas[pAtual] = casas[pAtual] + dado
					inteiro casaDestino = casas[pAtual]
					
					se (casaDestino >= 25) {
						casaDestino = 25
						casas[pAtual] = 25
					} senao {
						escreva("Correndo você alcançou a casa ", casaDestino, ".\n")
					}

					logico temConsequencia = falso
					se (casaDestino == 2 ou casaDestino == 3 ou casaDestino == 7 ou casaDestino == 10 ou casaDestino == 12 ou casaDestino == 15 ou casaDestino == 19 ou casaDestino == 20 ou casaDestino == 21 ou casaDestino == 22 ou casaDestino == 23 ou casaDestino == 24) {
						temConsequencia = verdadeiro
					}

					se (temConsequencia e casas[pAtual] < 25) {
						escreva("\nEssa casa possui um evento oculto! Revelando as regras...")
						se (modoJogo == "M") {
							escreva("\n\n(Modo Manual) Pressione ENTER para descobrir...")
							leia(controleDado)
						} senao {
							u.aguarde(3000)
						}

						// Fase 2: Mostrar apenas o tabuleiro e a consequência da casa
						limpa()
						exibirTabuleiro(casas[0], casas[1])

						se (casaDestino == 2) {
							escreva("[CASA 2] Bônus: Falta perigosa! O juiz ajustou a barreira. Avance magicamente para a casa 5.\n")
							casas[pAtual] = 5
						} senao se (casaDestino == 3) {
							escreva("[CASA 3] Bônus: Chute de trivela lindíssimo! Role um dado adicional de 3 lados.\n")
							inteiro extra = u.sorteia(1, 3)
							escreva("O dado triplo caiu no número: ", extra, "!\n")
							casas[pAtual] = casas[pAtual] + extra
							escreva("Agora você parou na casa: ", casas[pAtual], ".\n")
						} senao se (casaDestino == 7) {
							escreva("[CASA 7] Punição: Reclamação insistente com o árbitro... Cartão amarelo! Fique 1 rodada sem jogar.\n")
							penalidades[pAtual] = 1
						} senao se (casaDestino == 10) {
							escreva("[CASA 10] Punição: O VAR apontou irregularidade de ambos e trocou a posição de vocês!!\n")
							inteiro temporario = casas[pAtual]
							casas[pAtual] = casas[pAdversario]
							casas[pAdversario] = temporario
							escreva("Você foi enviado para a casa ", casas[pAtual], " e o adversário levado para a ", casas[pAdversario], "!\n")
						} senao se (casaDestino == 12) {
							escreva("[CASA 12] Punição: Impedimento! Volte 1 casa.\n")
							casas[pAtual] = casas[pAtual] - 1
						} senao se (casaDestino == 15) {
							escreva("[CASA 15] Punição: Pênalti pra fora do estádio! E para se redimir, cante uma música na vida real!\n")
							escreva("Escolha sua forma de escapar da pressão:\n")
							escreva(" 1 - Cantar presencialmente e manter a posição.\n")
							escreva(" 2 - Desistir de vergonha e Voltar 2 casas.\n")
							cadeia decisaoSing = ""
							logico escolheuMusica = falso
							enquanto (escolheuMusica == falso) {
								escreva("\nSua decisão: ")
								leia(decisaoSing)
								se (decisaoSing == "1") {
									escreva("Maravilha! Você soltou a voz presencialmente e a posição foi mantida!\n")
									escolheuMusica = verdadeiro
									u.aguarde(2500)
								} senao se (decisaoSing == "2") {
									escreva("Pipocou a responsabilidade pra torcida... Você recuou 2 casas.\n")
									casas[pAtual] = casas[pAtual] - 2
									escolheuMusica = verdadeiro
									u.aguarde(2500)
								} senao {
									mostrarErro("Opção inválida! Escolha 1 ou 2.")
									limpa()
									exibirTabuleiro(casas[0], casas[1])
									escreva("[CASA 15] Punição: Pênalti pra fora do estádio! E para se redimir, cante uma música na vida real!\n")
									escreva("Escolha sua forma de escapar da pressão:\n")
									escreva(" 1 - Cantar presencialmente e manter a posição.\n")
									escreva(" 2 - Desistir de vergonha e Voltar 2 casas.\n")
								}
							}
						} senao se (casaDestino == 19) {
							escreva("[CASA 19] Punição: Carrinho violento! Cartão Vermelho! O Juiz mandou voltar ao ínicio (CASA 1).\n")
							casas[pAtual] = 1
						} senao se (casaDestino == 20) {
							escreva("[CASA 20] Bônus: Fez o famoso 'Drible da Vaca'. Avance 2 casas!\n")
							casas[pAtual] = casas[pAtual] + 2
						} senao se (casaDestino == 21) {
							escreva("[CASA 21] Punição: Gol com a mão à lá Maradona! O VAR desmascarou e recuou você em 3 casas.\n")
							casas[pAtual] = casas[pAtual] - 3
						} senao se (casaDestino == 22) {
							escreva("[CASA 22] Bônus: Lançamento em profundidade! Avance velozmente até a casa 24.\n")
							casas[pAtual] = 24
						} senao se (casaDestino == 23) {
							escreva("[CASA 23] Bônus: Pênalti no escanteio! Jogue o dado de novo AGORA!\n")
							turnoValido = verdadeiro
						} senao se (casaDestino == 24) {
							escreva("[CASA 24] Punição: Bola quebra as pernas mas NÃO ENTRA! Fique 1 rodada no chão.\n")
							penalidades[pAtual] = 1
						}

						escreva("\nAplicando os efeitos no tabuleiro...")
						se (modoJogo == "M") {
							escreva("\n(Modo Manual) Pressione ENTER para concluir o processamento da regra...")
							leia(controleDado)
						} senao {
							u.aguarde(4500)
						}
                        
						// Fase 3: Retornar ao log Normal restaurado no fim da consequência
						limpa()
						escreva("---> Resultado de ", nomes[pAtual], " (Atualizado) <---\n")
						animarDado(dado)
						escreva("Você havia rolado ", dado, " e alcançado a casa ", casaDestino, ".\n")
						escreva("Após o evento, sua posição consolidada é a casa ", casas[pAtual], "!\n")
					}

					se (casas[pAtual] >= 25) {
						casas[pAtual] = 25
						
						limpa()
						exibirTabuleiro(casas[0], casas[1])

						escreva("\nGOOOOOOOOLLAAAAAAAAÇOOOOOO! O JUIZ APITA O FIM DA COPA DO MUNDO DE TABULEIRO!! 🏆\n")
						escreva("O ", nomes[pAtual], " (Time ", times[pAtual], " ", emojis[pAtual], ") alcançou a casa mestre ", casas[pAtual], " e faturou a Partida!\n")
						
						se (vez == 0) {
							vitoriasJogador1 = vitoriasJogador1 + 1
						} senao {
							vitoriasJogador2 = vitoriasJogador2 + 1
						}
						
						partidaEmAndamento = falso
						turnoValido = falso 

						escreva("\nPressione ENTER para ver a celebração e voltar ao menu...")
						cadeia menuRetorno
						leia(menuRetorno)
						limpa()

						animarVitoria(nomes[pAtual], times[pAtual], emojis[pAtual])

					} senao {
						// Finalização do turno, exibe para o próximo jogador visualizar onde o PAtual parou
						exibirTabuleiro(casas[0], casas[1])
					}
				} 
			}

			se (partidaEmAndamento == verdadeiro) {
				se (vez == 0) {
					vez = 1
				} senao {
					vez = 0
				}
			}
			
		} 
	}

	funcao animarVitoria(cadeia nome, cadeia time, cadeia emoji)
	{
		inteiro animacao
		para (animacao = 0; animacao < 4; animacao++) {

//Frame 1

escreva("\n_________________________________________________________________________________________________ ")
escreva("\n                                                                                                 |")
escreva("\n                                                                                                 |")
escreva("\n         ██████╗     █████╗     ███╗   ███╗    ██████╗     ███████╗     █████╗      ██████╗      |")
escreva("\n        ██╔════╝    ██╔══██╗    ████╗ ████║    ██╔══██╗    ██╔════╝    ██╔══██╗    ██╔═══██╗     |")
escreva("\n        ██║         ███████║    ██╔████╔██║    ██████╔╝    █████╗      ███████║    ██║   ██║     |")
escreva("\n        ██║         ██╔══██║    ██║╚██╔╝██║    ██╔═══╝     ██╔══╝      ██╔══██║    ██║   ██║     |")
escreva("\n        ╚██████╗    ██║  ██║    ██║ ╚═╝ ██║    ██║         ███████╗    ██║  ██║    ╚██████╔╝     |")
escreva("\n         ╚═════╝    ╚═╝  ╚═╝    ╚═╝     ╚═╝    ╚═╝         ╚══════╝    ╚═╝  ╚═╝     ╚═════╝      |")
escreva("\n                                                                                                 |")
escreva("\n_________________________________________________________________________________________________|")
escreva("\n__________________________________________________________________________________________________")
escreva("\n                                                                      \\                          ")
escreva("\n       X                      *                             *          \\   X        *            ")
escreva("\n________________                                                        \\                        ")
escreva("\n               /                                                         \\                       ")
escreva("\n              /        *                                            ______\\_______               ")
escreva("\n             /                             \\ O /                   \\       \\        \\            ")
escreva("\n            /                       *        |                    \\         \\         \\          ")
escreva("\n           /                                / \\                  \\         ( \\ )        \\        ")
escreva("\n          /                                                       \\           \\          \\       ")
escreva("\n         /                                                  *       \\          \\         \\       ")
escreva("\n        /                                                             \\ ________\\________\\        ")
escreva("\n       /            *           X                                                \\                ")
escreva("\n______/                                      *                                    \\               ")
escreva("\n                                                                          *        \\              ")
escreva("\n                                                                  X                 \\             ")
escreva("\n__________________________________________________________________________________________________")
escreva("\n                                                                                                  ")
escreva("\n     ===> GANHADOR: ", nome, " - ", time, " ", emoji, " <===\n")
			u.aguarde(500)
limpa()

//Frame 2

escreva("\n_________________________________________________________________________________________________ ")
escreva("\n                                                                                                 |")
escreva("\n                                                                                                 |")
escreva("\n         ██████╗     █████╗     ███╗   ███╗    ██████╗     ███████╗     █████╗      ██████╗      |")
escreva("\n        ██╔════╝    ██╔══██╗    ████╗ ████║    ██╔══██╗    ██╔════╝    ██╔══██╗    ██╔═══██╗     |")
escreva("\n        ██║         ███████║    ██╔████╔██║    ██████╔╝    █████╗      ███████║    ██║   ██║     |")
escreva("\n        ██║         ██╔══██║    ██║╚██╔╝██║    ██╔═══╝     ██╔══╝      ██╔══██║    ██║   ██║     |")
escreva("\n        ╚██████╗    ██║  ██║    ██║ ╚═╝ ██║    ██║         ███████╗    ██║  ██║    ╚██████╔╝     |")
escreva("\n         ╚═════╝    ╚═╝  ╚═╝    ╚═╝     ╚═╝    ╚═╝         ╚══════╝    ╚═╝  ╚═╝     ╚═════╝      |")
escreva("\n                                                                                                 |")
escreva("\n_________________________________________________________________________________________________|")
escreva("\n__________________________________________________________________________________________________")
escreva("\n                                                                      \\                          ")
escreva("\n                                                                       \\                         ")
escreva("\n________________              *                             *           \\           *            ")
escreva("\n               /                                                         \\                       ")
escreva("\n              /                                                     ______\\_______               ")
escreva("\n             /         *                     O                     \\       \\        \\            ")
escreva("\n            /                               /|\\                   \\         \\         \\          ")
escreva("\n           /                        *       / \\                  \\         ( \\ )        \\        ")
escreva("\n          /                                                       \\           \\          \\       ")
escreva("\n         /                                                          \\          \\         \\       ")
escreva("\n        /                                                   *         \\ ________\\________\\        ")
escreva("\n       /                                                                         \\                ")
escreva("\n______/             *                                                             \\               ")
escreva("\n                                             *                                     \\              ")
escreva("\n                                                                          *         \\             ")
escreva("\n__________________________________________________________________________________________________")
escreva("\n                                                                                                  ")
escreva("\n     ===> GANHADOR: ", nome, " - ", time, " ", emoji, " <===\n")
			u.aguarde(500)
limpa()

//Frame 3

escreva("\n_________________________________________________________________________________________________ ")
escreva("\n                                                                                                 |")
escreva("\n                                                                                                 |")
escreva("\n         ██████╗     █████╗     ███╗   ███╗    ██████╗     ███████╗     █████╗      ██████╗      |")
escreva("\n        ██╔════╝    ██╔══██╗    ████╗ ████║    ██╔══██╗    ██╔════╝    ██╔══██╗    ██╔═══██╗     |")
escreva("\n        ██║         ███████║    ██╔████╔██║    ██████╔╝    █████╗      ███████║    ██║   ██║     |")
escreva("\n        ██║         ██╔══██║    ██║╚██╔╝██║    ██╔═══╝     ██╔══╝      ██╔══██║    ██║   ██║     |")
escreva("\n        ╚██████╗    ██║  ██║    ██║ ╚═╝ ██║    ██║         ███████╗    ██║  ██║    ╚██████╔╝     |")
escreva("\n         ╚═════╝    ╚═╝  ╚═╝    ╚═╝     ╚═╝    ╚═╝         ╚══════╝    ╚═╝  ╚═╝     ╚═════╝      |")
escreva("\n                                                                                                 |")
escreva("\n_________________________________________________________________________________________________|")
escreva("\n__________________________________________________________________________________________________")
escreva("\n                                                                      \\                          ")
escreva("\n                                                                       \\                         ")
escreva("\n________________                                                        \\                        ")
escreva("\n               /              *                             *            \\          *            ")
escreva("\n              /                                                     ______\\_______               ")
escreva("\n             /                             \\ O /                   \\       \\        \\            ")
escreva("\n            /          *                     |                    \\         \\         \\          ")
escreva("\n           /                                / \\                  \\         ( \\ )        \\        ")
escreva("\n          /                         *                             \\           \\          \\       ")
escreva("\n         /                                                          \\          \\         \\       ")
escreva("\n        /                                                             \\ ________\\________\\        ")
escreva("\n       /                                                    *                    \\                ")
escreva("\n______/                                                                           \\               ")
escreva("\n                    *                                                     *        \\              ")
escreva("\n                                             *                                      \\             ")
escreva("\n__________________________________________________________________________________________________")
escreva("\n                                                                                                  ")
escreva("\n     ===> GANHADOR: ", nome, " - ", time, " ", emoji, " <===\n")
			u.aguarde(500)
limpa()

//Frame 4

escreva("\n_________________________________________________________________________________________________ ")
escreva("\n                                                                                                 |")
escreva("\n                                                                                                 |")
escreva("\n         ██████╗     █████╗     ███╗   ███╗    ██████╗     ███████╗     █████╗      ██████╗      |")
escreva("\n        ██╔════╝    ██╔══██╗    ████╗ ████║    ██╔══██╗    ██╔════╝    ██╔══██╗    ██╔═══██╗     |")
escreva("\n        ██║         ███████║    ██╔████╔██║    ██████╔╝    █████╗      ███████║    ██║   ██║     |")
escreva("\n        ██║         ██╔══██║    ██║╚██╔╝██║    ██╔═══╝     ██╔══╝      ██╔══██║    ██║   ██║     |")
escreva("\n        ╚██████╗    ██║  ██║    ██║ ╚═╝ ██║    ██║         ███████╗    ██║  ██║    ╚██████╔╝     |")
escreva("\n         ╚═════╝    ╚═╝  ╚═╝    ╚═╝     ╚═╝    ╚═╝         ╚══════╝    ╚═╝  ╚═╝     ╚═════╝      |")
escreva("\n                                                                                                 |")
escreva("\n_________________________________________________________________________________________________|")
escreva("\n__________________________________________________________________________________________________")
escreva("\n                                                                      \\                          ")
escreva("\n                                                                       \\                         ")
escreva("\n________________                                                        \\                        ")
escreva("\n               /                                                         \\                       ")
escreva("\n              /               *                             *       ______\\_______  *            ")
escreva("\n             /                             \\ O /                   \\       \\        \\            ")
escreva("\n            /                                |                    \\         \\         \\          ")
escreva("\n           /           *                    / \\                  \\         ( \\ )        \\        ")
escreva("\n          /                                                       \\           \\          \\       ")
escreva("\n         /                          *                               \\          \\         \\       ")
escreva("\n        /                                                             \\ ________\\________\\        ")
escreva("\n       /                                                                         \\                ")
escreva("\n______/                                                     *                     \\               ")
escreva("\n                                                                                   \\              ")
escreva("\n                    *                                                     *         \\             ")
escreva("\n__________________________________________________________________________________________________")
escreva("\n                                                                                                  ")
escreva("\n     ===> GANHADOR: ", nome, " - ", time, " ", emoji, " <===\n")
			u.aguarde(500)
			se (animacao < 3) {
				limpa()
			} senao {
				escreva("\n\nPressione ENTER para finalizar a festa e voltar ao Menu...")
				cadeia fimFesta
				leia(fimFesta)
				limpa()
			}
    }
  }
	
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 35572; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */