# Séries temporais automatizadas com *ATSPy*

Essa biblioteca permite gerar vários modelos de séries temporais com poucas linhas de código. Abaixo tem-se os modelos usados nesse projeto.

1) *ARIMA* - Modelagem ARIMA Automatizada;

2) *HWAAS* - Suavização exponencial com tendência aditiva e sazonalidade aditiva;

3) *HWAMS* - Suavização exponencial com tendência aditiva e sazonalidade multiplicativa;

4) *TATS* - Sazonal e tendência no Box Cox;

5) *TBAT* - Trend e Box Cox;

6) *TBATS1* - Tendência, Sazonal (um) e Box Cox;

7) *TBATP1* - TBATS1, mas a inferência sazonal é codificada por periodicidade

8) *TBATS2* - TBATS1 com dois períodos sazonais

Como resultado os modelos que melhor performaram os dados de treino (dados de dentros da amostra) foram o *ARIMA* e o *TBATP1*, mas o *TBATP1* trouxe o melhor resultado das previsões conforme as métricas de avaliação. Após essa avaliação, o modelo *TBATP1* foi retreinado com toda séries temporal e usado para gerar previsões para o futuro da série original.

![image](https://user-images.githubusercontent.com/63425404/124525691-84760900-ddd6-11eb-950f-5552382324de.png)
