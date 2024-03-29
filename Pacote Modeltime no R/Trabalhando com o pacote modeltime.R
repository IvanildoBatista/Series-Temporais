#Instalando e importando os pacotes

install.packages('xgboost')
install.packages('tidymodels')
install.packages('modeltime')
install.packages('tidyverse')
install.packages('lubridate')
install.packages('timetk')
library(xgboost)
library(tidymodels)
library(modeltime)
library(tidyverse)
library(lubridate)
library(timetk)

#https://fred.stlouisfed.org/series/PCOPPUSDM

#Importando os dados
beer = read_delim('MRTSSM4453USN.csv', delim = ',')
str(beer)
View(beer)

#transformando a base de dados em uma s�rie temporal

beer_time_series <- ts(beer[,2],start=c(1992,1),
                       end=c(2021,1),frequency=12)

#Primeiras e �ltimas observa��es
head(beer_time_series)
tail(beer_time_series)

#dimens�o da base de dados
dim(beer_time_series)

#decompondo a s�rie na forma aditiva e na forma multiplicativa
plot(decompose(beer_time_series))
plot(decompose(beer_time_series, type="mult"))

#Gr�ficos de autocorrela��o
acf(beer_time_series)
pacf(beer_time_series)

#histograma da s�rie temporal
hist(beer_time_series)

#boxplot da s�rie temporal 
boxplot(beer_time_series)


# Modelagem da s�rie temporal

beer <- beer %>% select(date = DATE, MRTSSM4453USN)

#plotando a s�rie temporal com ggplot
beer %>%
  ggplot(aes(x = date, y = MRTSSM4453USN)) +
  geom_line()

#plotando a s�rie temporal com a fun��o do pacote modeltime
#cria uma linha com a tend�ncia da s�rie.
beer %>%
  plot_time_series(date, MRTSSM4453USN)

#Separando os dados para modelo : 85% da s�rie ser� usada para treino
#dos modelos e os outros 15% para realiza��o da valida��o cruzada do 
#modelo
splits <- initial_time_split(beer, prop = 0.8)
splits

#Treinamento os modelos

#Nessa etapa irei treinar 10 modelos diferentes

#modelo 1: MODELO AUTO ARIMA
modelo_1 <- arima_boost(min_n = 2,learn_rate = 0.015) %>%
  set_engine(engine = "auto_arima_xgboost") %>%
  fit(MRTSSM4453USN ~ date, data = training(splits))

#modelo 2 : 
modelo_2 <- arima_reg() %>%
  set_engine(engine = "auto_arima") %>%
  fit(MRTSSM4453USN ~ date, data = training(splits))

#modelo 3 : PROPHET
modelo_3 <- prophet_reg() %>%
  set_engine(engine = "prophet") %>%
  fit(MRTSSM4453USN ~ date, data = training(splits))

#modelo 4 : PROPHET XGBOOST
#model_4 <- prophet_reg() %>%
 # set_engine(engine = "prophet_xgboost") %>%
  #fit(MRTSSM4453USN ~ date, data = training(splits))

#modelo 5
modelo_5 <- exp_smoothing() %>%
  set_engine(engine = "ets") %>%
  fit(MRTSSM4453USN ~ date, data = training(splits))

#model 6
modelo_6 <- seasonal_reg() %>%
  set_engine(engine = "stlm_arima") %>%
  fit(MRTSSM4453USN ~ date, data = training(splits))

#model 7
modelo_7 <- seasonal_reg() %>%
  set_engine(engine = "stlm_ets") %>%
  fit(MRTSSM4453USN ~ date, data = training(splits))


#modelo 8
modelo_8 <- prophet_boost() %>%
  set_engine(engine = "prophet_xgboost") %>%
  fit(MRTSSM4453USN ~ date, data = training(splits))

#modelo 9
modelo_9 <- nnetar_reg() %>%
  set_engine(engine = "nnetar") %>%
  fit(MRTSSM4453USN ~ date, data = training(splits))

#modelo 10
#modelo_10 <- naive_reg() %>%
 # set_engine(engine = "naive") %>%
#  fit(MRTSSM4453USN ~ date, data = training(splits))

#Criando a tabela com os modelos

tabela_de_modelos <- modeltime_table(
  model_1,
  model_2,
  model_3,
  #model_4,
  model_5,
  model_6,
  model_7,
  model_8,
  model_9
 # model_10
)

#tabela com os modelos
tabela_de_modelos

#Gerando as previs�es para cada uma dos modelos
previsoes <- tabela_de_modelos %>%
  modeltime_calibrate(new_data = testing(splits))

#plotando das previs�es dos modelos com os valores reais
previsoes %>%
  modeltime_forecast(
    new_data    = testing(splits),
    actual_data = beer
  ) %>%
  plot_modeltime_forecast(
    .legend_max_width = 25, # For mobile screens
  )

#Tabela com as m�tricas de avalia��o para cada um dos modelos
previsoes %>%
  modeltime_accuracy() %>%
  table_modeltime_accuracy()

#An�lise dos res�duos de cada modelo na amostra

#aqui eu irei analisar o comportamento dos res�duos dos dados usados
#para treinar cada modelo. � necess�rio que o comportamento dos res�duos
#sejam bem comportados, ou seja, com uma distribui��o normal.

tabela_de_modelos %>%
  modeltime_calibrate(new_data = training(splits)) %>%
  modeltime_residuals() %>%
  plot_modeltime_residuals()

#An�lise dos res�duos de cada modelo fotra da amostra

#Aqui ser� analisado os res�duos dos dados reais com as previs�es

tabela_de_modelos %>%
  modeltime_calibrate(new_data = testing(splits)) %>%
  modeltime_residuals() %>%
  plot_modeltime_residuals()


#Teste nos res�duos de dentro e fora da amostra

#Teste Shapiro-Wilk
#H0:A amostra prov�m de uma popula��o Normal
#H1:A amostra n�o prov�m de uma popula��o Normal

tabela_de_modelos %>%
  modeltime_calibrate(new_data = training(splits)) %>%
  modeltime_residuals() %>%
  modeltime_residuals_test()

tabela_de_modelos %>%
  modeltime_calibrate(new_data = testing(splits)) %>%
  modeltime_residuals() %>%
  modeltime_residuals_test()


#retreino do modelo
#Aqui a s�rie temporal completa ser� usada para treinar os modelos
retreino <- previsoes %>%
  modeltime_refit(data = beer)

#previs�o gerada pelos modelos para um per�odo de tempo desconhecido
refit_tbl %>%
  modeltime_forecast(h = "3 years", actual_data = beer) %>%
  plot_modeltime_forecast(
    .legend_max_width = 25, # For mobile screens
  )