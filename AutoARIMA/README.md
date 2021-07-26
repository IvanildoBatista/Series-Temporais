# Aplicando *AutoARIMA* em *Python*

Uma das metodologias mais conhecidas em séries temporais é a *Box-Jenkin*s, que são um conjunto de procedimentos que são realizados em uma certa sequência até encontramos o melhor modelo *ARIMA* (autorregressivo integrado com médias móveis). Entretanto, ao invés de realizarmos as etapas dessa metodologia, podemos escolher o modelo de forma automática e para isso existe a função *auto.arima* que é muito usada no *software* estatístico *R*.

O objetivo desse pequeno projeto é usar o autoarima do pacote pmdarima (que não é um pacote muito conhecido do python) para previsão de séries temporais. Uma das vantagens do *autoARIMA* é que não é necessário interpretar as funções de autocorrelação e autocorrelação parcial para escolher o parâmetros *p, P, d, D, q* e *Q*. Podemos definí-los e o *autoarima* irá fazer as combinações desses parâmetros e gerará os AIC's de cada modelo e escolheremos, então, o modelo de menor *AIC* (que é o modelo mais simples que minimizaria os resíduos).

## Etapas

1) Importação das bibliotecas;

2) Importação da base de dados (os dados encontram-se anexados nessa pasta);

3) Aplicação do *autoARIMA*;

4) Separação dos dados de treino e teste;

5) Sumário dos modelos;

6) Análise dos resíduos;

7) Teste de normalidade dos resíduos;

8) Conclusão e geração de previsões para um futuro desconhecido.

## Resultados

Encontramos um modelo **SARIMA(1,1,1)x(2,1,2,12)** cujo o *RMSE* (raiz quadrada dos erros médios) foi de **3.973**.














