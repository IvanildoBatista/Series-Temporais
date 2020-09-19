# Sobre o projeto

Nesse projeto é aplicada a metodologia Box-Jenkins, que é um abordagem de modelagem de séries temporais multivariadas. Esse tipo de abordagem é bem famosa e muito usada e
contempla 4 etapas, que são:

1) Identificação : iremos identificar os possíveis parâmetros do modelo (p,d,q) por meio de testes estatísticos (teste Dickey-Fuller Aumentado, por exemplo) e ferramentas de
                   análise (função de autocorrelação e função de autocorrelação parcial);
                   
2) Estimação: Com os parâmetros que selecionados, vamos gerar todos os possíveis modelos ARIMA(p,d,q);

3) Diagnóstico dos resíduos: Essa é a etapa crucial, pois analisaremos os erros da séries (diferença entre a série original e a série modelada) e os erros/resíduos devem ter uma
                             distribuição normal (teste Jarque-Bera);
                             
3.1) Aqui podemos inserir uma etapa (que não é tão relevante), que é a de validação do modelo, onde vamos pegar uma parte da própria série e vamos retirá-la e com os dados que 
restarem vamos aplicar o modelo encontrado e, por fim, vamos comparar o real com o predito.
                             
4) Previsão: Após o(s) modelo(s) passarem na etapa anterior, então o modelo pode ser usado para gerar previsões. Caso tenhamos mais de um modelo que passe na etapa de diagnóstico dos resíduos, será escolhido o de menor AIC (Akaike Information Criteria).

# Biblioteca usadas

1) Pandas
2) Numpy
3) Matplotlib
4) Seaborn
5) Itertools
6) Statsmodels
7) Datetime
8) Pandas.plotting
9) Scipy
10) Pmdarima

# Dados

Os dados referem-se ao consumo de cerveja e podem obtidos na plataforma Kaggle no link https://www.kaggle.com/bulentsiyah/for-simple-exercises-time-series-forecasting?select=BeerWineLiquor.csv ou no site FRED https://fred.stlouisfed.org/series/MRTSSM4453USS. Os dados estão também anexados na pasta do projeto.

# Resultado

Com a aplicação da metodologia Box-Jenkins (identificação, estimação, diagnóstico do resíduos e previsão) encontramos inferimos vários modelos, mas o único que passou na etapa de diagnóstico dos resíduos foi o modelo 𝐴𝑅𝐼𝑀𝐴(1,1,0) e foi com esse modelos geramos previsões.
