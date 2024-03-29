# Decomposi��o de s�ries temporais

# S�ries temporais s�o sequ�ncias de dados ao longo do tempo. Muitas dessas
#s�ries podem apresentar comportamentos que s�o visualmente regulares,ou 
#seja, repetem-se ao longo do tempo.

# Quando realiza-se a decomposi��o de s�ries temporais, considera-se tr�s
#componentes principais, que s�o:
# tend�ncia (crescimento ou decrescimento, global ou local),
# sazonalidade
# e o erro.

#Nesse pequeno script irei realizar a decomposi��o de uma s�rie de 
#habita��es de um censo dos Estados Unidos. A s�rie possui periodicidade
#mensal, indo de Janeiro de 1959 at� Fevereiro de 2021.

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

#Nos gr�ficos abaixo podemos visualizar a sazonalidade da s�rie temporal

#Plotando a base de dados
plot(serie, type="l")

#plotando com a tidyverse
serie$HOUSTNENSA %>%
  plot.ts()

#Renomeando a vari�vel
colnames(serie)[2] <- 'y'
colnames(serie)

#Convertendo a base de dados para uma s�rie temporal
serie$y <- ts(serie$y, frequency = 12,
              start = c(1959,1), end = c(2021,2))

#Plotando apenas as vari�vel 'y' vemos que ela foi convertida em s�rie 
#temporal, sem a necessidade da vari�vel 'DATE'.
plot(serie$y)

#Decomposi��o da s�rie temporal

#A s�ries pode ser decomposta de duas formas: multiplicativa e aditiva
#(A forma aditiva � a padr�o)

## FORMA ADITIVA
#Irei salvar as s�ries decompostas em uma vari�vel
decomposicao_adi = decompose(serie$y)
#posso ver os valores gerados
decomposicao_adi
#e gerar seus gr�ficos
plot(decomposicao_adi)
#tamb�m cada um dos componentes podem ser plotados separadamente
#s�rie original
plot(decomposicao_adi$x)
#sazonalidade
plot(decomposicao_adi$seasonal)
#tend�ncia
plot(decomposicao_adi$trend)
#erros
plot(decomposicao_adi$random)


## FORMA MULTIPLICATIVA
#Irei salvar as s�ries decompostas em uma vari�vel
decomposicao_mult = decompose(serie$y, type = 'multiplicative')
# valores gerados
decomposicao_mult
#gr�ficos
plot(decomposicao_mult)
# componentes plotados separadamente
#s�rie original
plot(decomposicao_mult$x)
#sazonalidade multiplicativa
plot(decomposicao_mult$seasonal)
#tend�ncia
plot(decomposicao_mult$trend)
#erros
plot(decomposicao_mult$random)

#Vemos que para essa s�rie a decomposi��o com sazonalidade
#multiplicativa gerou res�duos menores.

#A sazonalidade tamb�m pode ser visualizada com outros gr�ficos 
#conforme abaixo:

#Nesse gr�fico ser� gerado as sazonalidade de cada ano
#j� podemos notar que para anos mais recentes a sazonalidade � menor
#do que nos anos iniciais da s�rie
ggseasonplot(serie$y)

#inserindo r�tulo das datas
#como temos muitos anos, a visualiza�ao n�o est� muito boa
ggseasonplot(serie$y, year.labels = TRUE, year.labels.left = TRUE)

#sazonalidade na forma polar
#notamos mais uma vez que sazonalidade de anos iniciais da s�rie
#parece ser maior que 
ggseasonplot(serie$y, polar=TRUE)

#Por fim, podemos plotar gr�ficos que enfatizam os padr�es sazonais
#e onde os dados para cada esta��o s�o coletados juntos 
#em mini gr�ficos temporais separados

ggsubseriesplot(serie$y)

#Conforme o gr�fico acima h� um padr�o de sazonalidade em todos os 
#meses, caso n�o houvesse as linhas azuis estariam alinhadas formando
#uma linha reta

