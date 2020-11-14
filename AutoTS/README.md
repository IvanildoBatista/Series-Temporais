# Sobre o projeto

Muitas vezes quando queremos trabalhar com séries temporais, precisamos selecionar o modelo que melhor modele os dados e gere boa previsões. Muitos desses modelos possuem várias 
etapas (como o ARIMA ou VAR) e podem não funcionar, dependendo da série temporal. Por esse motivo escolhemos utilizar uma biblioteca que automatiza esse processo de seleção de 
modelo. O objetivo desse projeto é utilizar a biblioteca de *Auto Machine Learning auto-ts* para previsão da temperatura média da cidade de Déli, na Índia. Essa biblioteca usa 
modelos das bibliotecas *Facebook Prophet*, *PyFlux*, *Stasmodels* e *Scikit-Learn* (modelo do tipo árvore).

# Etapas

1) Instalando a biblioteca;

2) Importando as bibliotecas;

3) Importando os dados;

4) Análise exploratória dos dados;

5) Modelagem com *Auto Machine Learning*;

6) Análise dos resultados dos modelos;

7) Conclusão.

# Resultados

| |   *RMSE*   |  *MAE*  |  *MSE*|  *MSLE* |  *MedAE* |  $R^2$ |
|:----------------:|:------------------:|:------------------:|:------------------:|:------------------: |:------------------:|:------------------:|
|**Prophet** | **3.173**| **2.558** | **10.071**|**0.025**|**2.193**|**70.3%**|
|SARIMAX | 9.872| 8.558 | 97.447| 0.183 | 8.3|-7754.9%|
|VAR | 10.477| 8.99 | 109.766| 0.2 | 9.219|-9522.3%|
|*Machine Learning* | 11.747| 10.357 | 137.99| 0.253 | 11.693|-376.2%|
|ARIMA | 12| 10 | 133| 0 | 12|-46300 %|











