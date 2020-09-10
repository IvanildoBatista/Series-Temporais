# Series-Temporais

Nesse repositório você encontrará projetos com os principais métodos de modelagem de séries temporais, como:

  1) **Modelos determinísticos**: Algoritmos de suavização simples, Holt, Holt-Winters e Pegels;
  
  2) **Modelagem Univariada**: Modelagem Box-Jenkins ou modelo ARIMA (Autorregressivo integrado com médias móveis);
  
  3) **Modelagem Multivariada**: Modelos VAR (Vetores Autorregressivos) e modelo VECM (Vetores com correção de erros);
  
  4) **Redes neurais**: LSTM (*Long short-term memory*);
  
  5) **Modelagem linear**: Regressão linear, Ridge, Lasso, Elastic-Net, *Stochastic Gradient Descent*, etc.

# PROJETOS

**Projeto 1 - Apliacação de modelos determinísticos para o preço de casas**
Apresentação e aplicação de algoritmos determinístico de séries temporais para modelagem e previsão de preços em casas em Londres. Foram utilizados os principais modelos e o modelo com melhor desempenho foi o Algoritmo de Suavização de **Pegels aditivo** com um erro médio absoluto (MAE) de **3981.576** e raiz quadrada a soma dos erros quadrados (RMSE) de 5261.611;

**Projeto 2 - Impacto do coronavírus no Índice BOVESPA**
Análise do impacto causal da pandemia do *coronavírus* no índice da Bolsa de Valores do Brasil (IBOVESPA). Nessa análise utilizando a biblioteca *causalimpact* e utilizando uma contrafactual gerada por um modelo ARIMA, o relatório gerado apontou um queda de -35,92% no índice IBOVESPA por conta da intervenção na série causada pelo coronavírus;

**Projeto 3 - Modelagem Box-Jenkins em Python**
Aplicação da metodologia Box-Jenkins modelagem de uma série temporal do consumo de cerveja, onde todas as etapas (identificação, estimação, diagnóstico do resíduos e previsão) serão apresentadas, explicadas e aplicadas. Aplicando essa metodologia encontramos inferimos vários modelos, mas o único que passou na etapa de diagnóstico dos resíduos foi o modelo 𝐴𝑅𝐼𝑀𝐴(1,1,0) e foi com esse modelos geramos previsões;

**Projeto 4 - Série Temporais com PMDARIMA**
Aplicação do autoARIMA para previsão do consumo de energia elétrica. Com a bibioteca PMDARIMA automatizamos todo o processo de escolha de parâmetros e encontramos um modelo com menor *AIC* (Akaike Information Criteria). Os resíduos do modelo apresentaram-se normais pelo teste de normalidade *Jarque-Bera*. OBS: onde está escrito 'Estatística Chi^2' lê-se *p-valor*;

**Projeto 5 - Modelagem multivariada de Séries Temporais**
Uso do modelo VECM (*Vector Error Correction Model*) para analisar o comportamento de séries de preços futuros de commodities. Aqui aplicando esse modelo com as duas séries enocntramos os seguintes resultados: O impacto dos preços futuros de soja na série de preços futuros de milho é negativo e dura cerca 120 períodos (120 dias), em outras palavras, a variação do preço futuro da soja afeta negativamente a variação do preço futuro do milho. Em contrapartida o impacto do preço futuro afeta positivamente a variação do preço futuro de soja por um período menor que 120 dias. Encontramos também que há causalidade instantânea de uma série na outra e ausência de autocorrelação serial no modelo.

**Projeto 6 - Modelagem de Séries Temporais com Redes Neurais**
Apliacação da rede neural *LSTM* para previsão de preços de fechamento das ações da Petrobras. Utilizando a LSTM geramos um modelo com uma camada inicial, duas camadas intermediárias e uma camada de saída que gerou um **RMSE** (entre os valores preditos e os valores reais) de 0.723.

**Projeto 7 - Aplicação de modelos lineares em séries temporais**
Foram aplicados 12 modelos lineares da biblioteca *Scikit-Learn* em dados de séries temporais de preços de ações do Itaú Unibanco, no período do ano de 2019 ao ano de 2020. O modelo com melhor desempenho nas métricas **RMSE** e **R2** foi o *Theil Sen Regressor*. O *Theil Sen Regressor*, que é um modelo linear robusto a *outliers* teve um **RMSE** de 0.48117 e um **R2** de 99.73%.

**OBS**: Em cada projeto se encontra um link onde as bases de dados podem ser acessadas.



