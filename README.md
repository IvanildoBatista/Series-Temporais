# Projetos de séries temporais

Nesse repositório você encontrará projetos com os principais métodos de modelagem de séries temporais, como:

  1) **Modelos suavização exponencial**: Algoritmos de suavização simples, *Holt*, *Holt-Winters* e *Pegels*;
  2) **Modelagem Univariada**: Modelagem Box-Jenkins ou modelo *ARIMA* (Autorregressivo integrado com médias móveis);
  3) **Modelagem Multivariada**: Modelos *VAR* (Vetores Autorregressivos) e modelo *VECM* (Vetores com correção de erros);
  4) **Redes neurais**: Recorrentes (*LSTM* - *Long short-term memory*) e Convolucionais (*Conv1D*);
  5) **Modelagem linear**: Regressão linear, *Ridge*, *Lasso*, *Elastic-Net*, *Stochastic Gradient Descent*, etc;
  6) **Biblioteca Facebook Prophet** (para séries univaridas e multivariadas);
  7) **Biblioteca Neural Prophet**;
  8) **Biblioteca Multi Prophet**;
  9) **Biblioteca PyAF**;
  10) **Auto Machine Learning para Séries Temporais (AutoTS, PyCaret e ATSpy)**;
  11) **Biblioteca DARTS**;
  12) **Pacote Modeltime do R**;
  13) **Decomposição de séries temporais**: Aplicação de métodos de decomposição sazonal, *STL* e de filtros de séries temporais;
  14) **Análise de tendência em séries temporais com teste Mann Kendall**;
  15) **Biblioteca AutoPy**;
  16) **Biblioteca Pycaret - módulo de regressão para séries temporais**. 

## Projetos

**Projeto 1 - Impacto do coronavírus no Índice BOVESPA**
Análise do impacto causal da pandemia do *coronavírus* no índice da Bolsa de Valores do Brasil (IBOVESPA). Nessa análise utilizando a biblioteca *causalimpact* e utilizando uma contrafactual gerada por um modelo ARIMA, o relatório gerado apontou um queda de -35,92% no índice IBOVESPA por conta da intervenção na série causada pelo coronavírus;

**Projeto 2 - Análise de tendência**
Aplicação do teste não-paramétrico *Mann-Kendall* para identificar tendência em séries temporais. Ao nível de confiança de 5%, o teste identificou uma tendência positiva para a série de vendas no varejo de lojas de cerveja, vinho e licores nos Estados Unidos.

**Projeto 3 - Pycaret para Machine Learning**

**3.1**) Aplicação do módulo de regressão da biblioteca *Pycaret* para previsão de séries temporais utilizando o *fold_strategy='timeseries'* do *setup* da biblioteca. Para esse projeto foram usadas as defasagens da série de preços diários das ações do Banco Bradesco (*BBCD4.SA*). O modelo gerou uma previsão que, comparada com os valores de validação, obtiveram métricas de erros próximas de zero e um *R²* (coeficiente de determinação) de 0.87.

**3.2**) Aplicação do módulo de séries temporais que foi implementado em Julho de 2020 para previsão de vendas no setor de varejo nos EUA. O melhor modelo foi o TBATS com um coeficiente de determinação (*R²*) de 0.72.

**Projeto 4 - AutoARIMA em Python**
Aplicação do AutoARIMA para previsão do consumo de energia elétrica. Com a bibioteca PMDARIMA automatizamos todo o processo de escolha de parâmetros e encontramos um modelo com menor *AIC* (Akaike Information Criteria). Os resíduos do modelo apresentaram-se normais pelo teste de normalidade *Jarque-Bera*.

**Projeto 5 - AutoTS em Python**
Biblioteca AutoTS para previsão de séries temporais com os modelos *Facebook Prophet*, Vetores Autorregressivos, Modelos e *Machine Learning* e ARIMA. Para esse projeto, conforme as métricas abaixo, o melhor modelo para previsão de séries temporais de temperatura na cidade de Déhli, na Índia, foi o modelo *Facebook Prophet*

| |   *RMSE*   |  *MAE*  |  *MSE*|  *MSLE* |  *MedAE* |  *R-squared* |
|:----------------:|:------------------:|:------------------:|:------------------:|:------------------: |:------------------:|:------------------:|
|**Facebook Prophet** | **3.173**| **2.558** | **10.071**|**0.025**|**2.193**|**70.3%**|
|*SARIMAX* | 9.872| 8.558 | 97.447| 0.183 | 8.3|-7754.9%|
|Vetor Autorregressivo | 10.477| 8.99 | 109.766| 0.2 | 9.219|-9522.3%|
|*Machine Learning* | 11.747| 10.357 | 137.99| 0.253 | 11.693|-376.2%|
|*ARIMA* | 12| 10 | 133| 0 | 12|-46300 %|

**Projeto 5 - Biblioteca ATSPy**
Biblioteca de *Auto Time Series* para previsão de séries temporais com uma variedade de modelos (ARIMA, HWAAS, HWAMS, TATS, TBAT, TBATS1, TBATP1 e TBATS2). O melhor modelo desse projeto foi o TBATP1 que obteve as melhores métricas de avaliação e abaixo pode-se observar o gráfico com a série original, a série treinada e as previsões.

![image](https://user-images.githubusercontent.com/63425404/124525691-84760900-ddd6-11eb-950f-5552382324de.png)

**Projeto 6 - Biblioteca DARTS para previsão de vendas em restaurantes**
Biblioteca para modelagem de séries temporais e permite o treinamento de diversos modelos. Além disso permite realizar o *backtesting* do modelo, o que torna a avaliação do modelo mais acurada. O melhor modelo para a previsão de vendas de restaurantes foi um de suavização exponencial com sazonalidade multiplicativa, tendência aditiva e uma sazonalidade de vinte e quatro períodos. Abaixo pode-se observar as previsões do modelo com e sem *gridsearch*.

![image](https://user-images.githubusercontent.com/63425404/138211667-bceded4c-c7b8-4f7c-852e-7355296d1de8.png)

**Projeto 7 - Facebook Prophet** 
Nesse projeto será usada a biblioteca Prophet Facebook para modelagem de duas séries temporais, mas que referem-se ao mesmo ativo (o preço do ouro, valores diários e mensais). Para a primeira série aplicamos o modelo e validamos os resultados com os últimos 150 dias e obtivemos um RMSE de **82.97**; já com os dados mensais utilizamos os últimos 24 meses para validação do modelo e obtivemos um RMSE de **66.97**.

**Projeto 8 - Neural Prophet para modelagem de séries temporais**
Biblioteca similar ao Facebook Prophet, mas que utiliza em sua estrutura para modelagem a rede neural AR-Net. Nesse projeto foi modelado uma série de vendas de varejo mensais de cerveja, vinho e licores alcoólicos, que vai do ano de 1992 até o ano de 2020. Os últimos 24 meses da série foram separados para comparar o desempenho de previsão do modelo. Resultado : o modelo gerou previsões que foram estatisticamente semelhantes com a base de validação.

**Projeto 7 - Aplicação de algoritmos de suavização exponencial para o preço de casas**
Apresentação e aplicação de algoritmos de suavização exponencial de séries temporais para modelagem e previsão de preços em casas em Londres. Foram utilizados os principais modelos e o modelo com melhor desempenho foi o Algoritmo de Suavização de **Pegels aditivo** com um erro médio absoluto (MAE) de **3981.576** e raiz quadrada a soma dos erros quadrados (RMSE) de 5261.611;

**Projeto 6 - Modelagem *Box-Jenkins* em Python**
Aplicação da metodologia Box-Jenkins modelagem de uma série temporal do consumo de cerveja, onde todas as etapas (identificação, estimação, diagnóstico do resíduos e previsão) serão apresentadas, explicadas e aplicadas. Aplicando essa metodologia encontramos inferimos vários modelos, mas o único que passou na etapa de diagnóstico dos resíduos foi o modelo 𝐴𝑅𝐼𝑀𝐴(1,1,0) e foi com esse modelos geramos previsões;

**Projeto 7 - Modelagem multivariada de Séries Temporais**
Uso do modelo VECM (*Vector Error Correction Model*) para analisar o comportamento de séries de preços futuros de commodities. Aqui aplicando esse modelo com as duas séries enocntramos os seguintes resultados: O impacto dos preços futuros de soja na série de preços futuros de milho é negativo e dura cerca 120 períodos (120 dias), em outras palavras, a variação do preço futuro da soja afeta negativamente a variação do preço futuro do milho. Em contrapartida o impacto do preço futuro afeta positivamente a variação do preço futuro de soja por um período menor que 120 dias. Encontramos também que há causalidade instantânea de uma série na outra e ausência de autocorrelação serial no modelo.

**Projeto 8 - *Neural Prophet* para modelagem de séries temporais**
Biblioteca similar ao *Facebook Prophet*, mas que utiliza em sua estrutura para modelagem a rede neural *AR-Net*. Nesse projeto foi modelado uma série de vendas de varejo mensais de cerveja, vinho e licores alcoólicos, que vai do ano de 1992 até o ano de 2020. Os últimos 24 meses da série foram separados para comparar o desempenho de previsão do modelo. **Resultado** : o modelo gerou previsões que foram estatisticamente semelhantes com a base de validação.

**Projeto 8 - Modelagem de Séries Temporais com Redes Neurais**
Aplicação da rede neural *LSTM* para previsão de preços de fechamento das ações da Petrobras. Utilizando a *LSTM* geramos um modelo com uma camada inicial, duas camadas intermediárias e uma camada de saída que gerou um **RMSE** (entre os valores preditos e os valores reais) de 0.723.

**Projeto 9 - Aplicação de modelos lineares em séries temporais**
Foram aplicados 12 modelos lineares da biblioteca *Scikit-Learn* em dados de séries temporais de preços de ações do Itaú Unibanco, no período do ano de 2019 ao ano de 2020. O modelo com melhor desempenho nas métricas **RMSE** e **R2** foi o *Theil Sen Regressor*. O *Theil Sen Regressor*, que é um modelo linear robusto a *outliers* teve um **RMSE** de 0.48117 e um **R2** de 99.73%.

**Projeto 11 - *AutoML* para Séries Temporais**
Utilizando a biblioteca *auto-ts* geramos 4 modelos para séries temporais para previsão da temperatura média de 114 dias da cidade de Déli, na Índia. Os modelos foram: *Facebook Prophet*, ARIMA, SARIMAX, VAR e um modelo de *Machine Learning Random Forest*. O modelo de melhor resultado de previsão foi o *Facebook Prophet*, pois obteve as menores métricas de erro e o maior R-quadrado.

**Projeto 12 - Modelagem de Séries Temporais com Redes Neurais Convolucionais**
Aplicação da rede neural Convolucional (*Conv1D*) para previsão de Consumo de energia elétrica. Foir gerado um modelo (com treinamento de 10 épocas) para prever as 4440 observações finais da série de energia e a métrica de erro *RMSE* (raiz do erro quadrado médio) deum um valor de 0.40, uma resultado considerado bastante satisfatório.


**OBS**: Em cada pasta de projeto se encontra um link onde as bases de dados podem ser acessadas e as bases de dados em formato *.csv*.



