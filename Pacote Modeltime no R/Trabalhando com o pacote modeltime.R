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

#transformando a base de dados em uma série temporal

beer_time_series <- ts(beer[,2],start=c(1992,1),
                       end=c(2021,1),frequency=12)

#Primeiras e últimas observações
head(beer_time_series)
tail(beer_time_series)

#dimensão da base de dados
dim(beer_time_series)

#decompondo a série na forma aditiva e na forma multiplicativa
plot(decompose(beer_time_series))
plot(decompose(beer_time_series, type="mult"))

#Gráficos de autocorrelação
acf(beer_time_series)
pacf(beer_time_series)

#histograma da série temporal
hist(beer_time_series)

#boxplot da série temporal 
boxplot(beer_time_series)


# Modelagem da série temporal

beer <- beer %>% select(date = DATE, MRTSSM4453USN)

#plotando a série temporal com ggplot
beer %>%
  ggplot(aes(x = date, y = MRTSSM4453USN)) +
  geom_line()

#plotando a série temporal com a função do pacote modeltime
#cria uma linha com a tendência da série.
beer %>%
  plot_time_series(date, MRTSSM4453USN)

#Separando os dados para modelo : 85% da série será usada para treino
#dos modelos e os outros 15% para realização da validação cruzada do 
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

#Gerando as previsões para cada uma dos modelos
previsoes <- tabela_de_modelos %>%
  modeltime_calibrate(new_data = testing(splits))

#plotando das previsões dos modelos com os valores reais
previsoes %>%
  modeltime_forecast(
    new_data    = testing(splits),
    actual_data = beer
  ) %>%
  plot_modeltime_forecast(
    .legend_max_width = 25, # For mobile screens
  )

#Tabela com as métricas de avaliação para cada um dos modelos
previsoes %>%
  modeltime_accuracy() %>%
  table_modeltime_accuracy()

#Análise dos resíduos de cada modelo na amostra

#aqui eu irei analisar o comportamento dos resíduos dos dados usados
#para treinar cada modelo. É necessário que o comportamento dos resíduos
#sejam bem comportados, ou seja, com uma distribuição normal.

tabela_de_modelos %>%
  modeltime_calibrate(new_data = training(splits)) %>%
  modeltime_residuals() %>%
  plot_modeltime_residuals()

#Análise dos resíduos de cada modelo fotra da amostra

#Aqui será analisado os resíduos dos dados reais com as previsões

tabela_de_modelos %>%
  modeltime_calibrate(new_data = testing(splits)) %>%
  modeltime_residuals() %>%
  plot_modeltime_residuals()


#Teste nos resíduos de dentro e fora da amostra

#Teste Shapiro-Wilk
#H0:A amostra provém de uma população Normal
#H1:A amostra não provém de uma população Normal

tabela_de_modelos %>%
  modeltime_calibrate(new_data = training(splits)) %>%
  modeltime_residuals() %>%
  modeltime_residuals_test()

tabela_de_modelos %>%
  modeltime_calibrate(new_data = testing(splits)) %>%
  modeltime_residuals() %>%
  modeltime_residuals_test()


#retreino do modelo
#Aqui a série temporal completa será usada para treinar os modelos
retreino <- previsoes %>%
  modeltime_refit(data = beer)

#previsão gerada pelos modelos para um período de tempo desconhecido
refit_tbl %>%
  modeltime_forecast(h = "3 years", actual_data = beer) %>%
  plot_modeltime_forecast(
    .legend_max_width = 25, # For mobile screens
  )