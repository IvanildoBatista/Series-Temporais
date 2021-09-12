# *PyAF* para previsão de temperatura mensal

PyAF é uma biblioteca Python de código aberto para previsão automática de séries temporais construída usando bibliotecas tradicionais de machine learning. Dentre os modelos que serão usados nesse projeto, além do modelo padrão, existem os modelos do tipo autorregressivos (AR e ARX), do tipo árvore (XGB, XGBX, LGB, LGBX), redes neurais (MLP e LSTM) e máquinas de vetores de suporte (SVR e SVRX). Essa biblioteca é de fácil uso e aplicação permitindo gerar rapidamente modelos de previsão de séries temporais.

Aqui nesse projeto irei usar uma base de dados de uma série temporal de temperatura mensal, nos Estados Unidos, que vai de Janeiro de 1895 a Janeiro de 2021. Os dados podem ser obtido no [seguinte link](https://www.ncdc.noaa.gov/cag/national/time-series/110/tavg/all/1/1895-2021?base_prd=true&begbaseyear=1901&endbaseyear=2021).

### Tabela das métricas de avaliação

Conforma a tabela abaixo o melhor modelo foi o *Support Vector Regression*. Das cinco métricas calculadas esse modelo teve um bom desempenho em quatro delas.

| |   *MAE*   |  *MSE*  |   *RMSE*  | *MedAE* |  *R-squared* |
|:----------------:|:------------------:|:------------------:|:------------------:|:------------------:|:------------------:|
|Padrão |  2.413416| 8.84676  | 2.97435  | **1.96999**|0.96174|
|*AR* | 2.530637| 9.21658 | 3.035883  | 2.49738|0.95519|
|*ARX* | 2.413416| 8.84676 | 2.97435  | **1.96999**|0.96174|
|*SVR* | **2.363494**| **8.01122** | **2.83041**  | 2.17415|**0.96430**|
|*XGB* | 3.331308| 16.17167 | 4.02140  | 2.99655|0.93089|
|*LGB* | 2.758048| 11.12890 | 3.33600  | 2.36457|0.95114|
