# Decomposição de séries temporais

# Séries temporais são sequências de dados ao longo do tempo. Muitas dessas
#séries podem apresentar comportamentos que são visualmente regulares,ou 
#seja, repetem-se ao longo do tempo.

# Quando realiza-se a decomposição de séries temporais, considera-se três
#componentes principais, que são:
# tendência (crescimento ou decrescimento, global ou local),
# sazonalidade
# e o erro.

#Nesse pequeno script irei realizar a decomposição de uma série de 
#habitações de um censo dos Estados Unidos. A série possui periodicidade
#mensal, indo de Janeiro de 1959 até Fevereiro de 2021.

#Irei primeiro instalar os pacotes

install.packages('dplyr')
install.packages('lubridate')
install.packages('forecast')
library(dplyr)
library(lubridate)
library(forecast)


#Importando os dados

serie = read.csv("HOUSTNENSA.csv")

#Transformando os dados

#serie$DATE = strptime(serie$DATE, "%m/%d/%Y")
#serie$DATE = format(serie$DATE, "%Y-%m-%d")
serie$DATE = as.Date(serie$DATE)
View(serie)

#Nos gráficos abaixo podemos visualizar a sazonalidade da série temporal

#Plotando a base de dados
plot(serie, type="l")

#plotando com a tidyverse
serie$HOUSTNENSA %>%
  plot.ts()

#Renomeando a variável
colnames(serie)[2] <- 'y'
colnames(serie)

#Convertendo a base de dados para uma série temporal
serie$y <- ts(serie$y, frequency = 12,
              start = c(1959,1), end = c(2021,2))

#Plotando apenas as variável 'y' vemos que ela foi convertida em série 
#temporal, sem a necessidade da variável 'DATE'.
plot(serie$y)

#Decomposição da série temporal

#A séries pode ser decomposta de duas formas: multiplicativa e aditiva
#(A forma aditiva é a padrão)

## FORMA ADITIVA
#Irei salvar as séries decompostas em uma variável
decomposicao_adi = decompose(serie$y)
#posso ver os valores gerados
decomposicao_adi
#e gerar seus gráficos
plot(decomposicao_adi)
#também cada um dos componentes podem ser plotados separadamente
#série original
plot(decomposicao_adi$x)
#sazonalidade
plot(decomposicao_adi$seasonal)
#tendência
plot(decomposicao_adi$trend)
#erros
plot(decomposicao_adi$random)


## FORMA MULTIPLICATIVA
#Irei salvar as séries decompostas em uma variável
decomposicao_mult = decompose(serie$y, type = 'multiplicative')
# valores gerados
decomposicao_mult
#gráficos
plot(decomposicao_mult)
# componentes plotados separadamente
#série original
plot(decomposicao_mult$x)
#sazonalidade multiplicativa
plot(decomposicao_mult$seasonal)
#tendência
plot(decomposicao_mult$trend)
#erros
plot(decomposicao_mult$random)

#Vemos que para essa série a decomposição com sazonalidade
#multiplicativa gerou resíduos menores.

#A sazonalidade também pode ser visualizada com outros gráficos 
#conforme abaixo:

#Nesse gráfico será gerado as sazonalidade de cada ano
#já podemos notar que para anos mais recentes a sazonalidade é menor
#do que nos anos iniciais da série
ggseasonplot(serie$y)

#inserindo rótulo das datas
#como temos muitos anos, a visualizaçao não está muito boa
ggseasonplot(serie$y, year.labels = TRUE, year.labels.left = TRUE)

#sazonalidade na forma polar
#notamos mais uma vez que sazonalidade de anos iniciais da série
#parece ser maior que 
ggseasonplot(serie$y, polar=TRUE)

#Por fim, podemos plotar gráficos que enfatizam os padrões sazonais
#e onde os dados para cada estação são coletados juntos 
#em mini gráficos temporais separados

ggsubseriesplot(serie$y)

#Conforme o gráfico acima há um padrão de sazonalidade em todos os 
#meses, caso não houvesse as linhas azuis estariam alinhadas formando
#uma linha reta

