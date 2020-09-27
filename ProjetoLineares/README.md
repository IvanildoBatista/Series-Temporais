# Aplicação de modelos lineares para previsão de preços ações

Nesse projeto serão apresentado e utilizados os principais algoritmos de *machine learning* do tipo regressão, que são modelos muito conhecidos na ciência de dados. 
Os modelos de regressão são usados quando temos *features* numéricas e temos uma variável *target* (ou alvo) que também é numérica.
Geralmente o modelo mais conhecido é a *Regressão Linear* (simples ou múltipla), entretanto existem outros modelos que são menos conhecidos, porém são mais robustos, possuindo 
mais parâmetros e podem apresentar resultados mais precisos. Todos os modelos que usaremos nesse projeto encontram-se na biblioteca *Scikit-Learn*; 
por serem muitos modelos lineares usaremos os principais modelos lineares e Aplicaremos esses modelos para previsão preços de ações do banco Itaú Unibanco (BBSA3) e vamos falar
um pouco de cada modelo e, ao fim, comparar os modelos e definir qual é a melhor regressão com base nas métricas **RMSE** e R-squared.

# Etapas

1) Importação das bibliotecas;

2) Importação dos dados;

3) Análise exploratória;

4) Separação dos dados de treino e teste;

5) Definição da *baseline*

6) Aplicação dos modelos de regressão:

  6.1) Comparação com *baseline*;
  
  6.2) diagnóstico dos resíduos do modelo.

7) Comparação dos resultados.

# Os dados

Os dados foram obtidos no seguinte link: https://www.kaggle.com/felsal/ibovespa-stocks. Entretanto podem ser obtidos no site da B3 (Brasil, Bolsa, Balcão). Os dados não puderam ser anexados nessa pasta, pois o arquivo ultrapassa os 25 MB.

