# -*- coding: utf-8 -*-
"""Modelagem de séries temporais com Redes Neurais (LSTM-atualizado).ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1eXLdkzdj8w56jYXbqslwpC6R_0V0Mf4k

# **Modelagem preços de ações com Redes Neurais Recorrentes - LSTM**

Nesse pequeno projeto iremos aplicar uma rede neural artificial para modelar e gerar previsões com séries temporais. A rede neural que usaremos se chama *LSTM* (ou *Long short-term memory*) e é uma rede neural recorrente, ou seja, ela é uma estrutura de processamento que consegue representar grandes variedades de comportamentos dinâmicos. 

As redes neurais recorrentes possuem mecanismos de *loops*, permitindo que haja realimentação de informação e a criação de representações internas e mecanismos de **memória** que permitem armazenar infomações temporais (principalmente de séries temporais). O fato de possuir muitos *loops*, mesmo com um número reduzido de parâmetros, a rede neural pode gerar um comportamento complexo.




## Dados

Os dados foram extraídos da plataforma *Yahoo* e são os preços das ações da Petróleo Brasileiro S/A (Petrobras) na Bolsa de valores americana. A peoridicidade é diária e vai do dia 1 de janeiro de 2014 até 31 de março de 2020. Aqui, iremos modelar os preços de fechamento das ações *PBR*.




## Importação das bibliotecas
"""

pip install yfinance

import math
import numpy as np
import pandas as pd
import seaborn as sns
from pandas_datareader import data as pdr
import yfinance as yf
from sklearn.preprocessing import MinMaxScaler
from keras.models import Sequential
from keras.layers import Dense,LSTM
import matplotlib.pyplot as plt
import plotly.graph_objects as go
plt.style.use('fivethirtyeight')

from sklearn.metrics import mean_absolute_error
from sklearn.metrics import mean_squared_error
from sklearn.metrics import r2_score
from sklearn.metrics import mean_squared_log_error

"""## Importa dos dados

Vamos usar o *DataReader* para extrair os dados da platadforma *Yahoo* com a periodicidade e intervalo que queremos.
"""

#df=web.DataReader('PBR', 'yahoo',start='2014-01-01',end='2020-03-31')
yf.pdr_override()
df = pdr.get_data_yahoo("PBR", start="2014-01-01", end="2020-12-30")

"""## Análise Exploratória dos dados

Podemos ver as 5 primeiras observações dos 5 preços que foram extraídos (de alta, de baixa, de abertura, de fechamento e o de fechamento ajustado) e o volume de ações que foram negociadas no dia.
"""

df.head()

"""Temos 1572 observações no nosso conjunto de dados."""

df.shape

"""A colunas não possuem nenhum valor faltante."""

df.isna().sum()

"""Todos os dados são do tipo *float*."""

df.info()

"""Abaixo podemos ver a tabela estatística de todas as variáveis."""

df.describe()

"""Visualizando as séries de preços e volume de ações."""

df.corr()

# Commented out IPython magic to ensure Python compatibility.
# %matplotlib inline
plt.figure(figsize=(20,5))
correlacao=df.corr()
sns.heatmap(correlacao, annot = True, cmap = "Set3");

plt.figure(figsize=(20,10))
df['Open'].plot(color='red')
plt.title('Preço de abertura das ações em US$', size=15)
plt.xlabel('Período',size=15)
plt.ylabel('Valores')
plt.legend(['Preço de abertura ADR'])
plt.show()

plt.figure(figsize=(20,10))
df['High'].plot(color='green')
df['Low'].plot(color='yellow')
plt.title('Preços de alta e baixa das ações PBR em US$', size=15)
plt.xlabel('Período',size=15)
plt.ylabel('Valores')
plt.legend(['Preço de alta PBR','Preço de baixa PBR'])
plt.show()

plt.figure(figsize=(20,10))
df['Adj Close'].plot(color='orange')
plt.title('Preços de fechamento ajustado das ações PBR em US$', size=15)
plt.xlabel('Período',size=15)
plt.ylabel('Valores')
plt.legend(['Preço de fechamento PBR'])
plt.show()

plt.figure(figsize=(20,10))
df['Close'].plot()
plt.title('Preços de fechamento das ações PBR em US$', size=15)
plt.xlabel('Período',size=15)
plt.ylabel('Valores')
plt.legend(['Preço de fechamento PBR'])
plt.show()

plt.figure(figsize=(20,10))
df['Volume'].plot(color='purple')
plt.title('Volume de ações negociadas diariamente', size=15)
plt.xlabel('Período',size=15)
plt.ylabel('')
plt.legend(['Volume de ações'])
plt.show()

"""## Dados de treino e de teste

Vamos agora separar os dados de treino. Vamos escolher para os dados de treino 80% da série temporal. Para o treino teremos 1258 observações.
"""

#Da série vamos extrair apenas os dados de fechamento
data=df.filter(['Close'])
#selecionar seus valores
dataset=data.values
#separa 80% desses dados
training_data_len=math.ceil(len(dataset)*.8)
#e vamos visualizar quantas observações temos
training_data_len

"""### Alterando a escala dos dados"""

#escalando para o intervalo entre 0 e 1
scaler = MinMaxScaler(feature_range=(0,1))
scaled_data = scaler.fit_transform(dataset)
scaled_data

"""### Separando as bases de treino e teste"""

#criando um dataset de treino
train_data = scaled_data[0:training_data_len,:]
#separando dados de treino e teste
x_train=[]
y_train=[]

for i in range(60,len(train_data)):
  x_train.append(train_data[i-60:i,0])
  y_train.append(train_data[i,0])
  if i<=61:
    print(x_train)
    print(y_train)
    print()

"""###convertendo *x_train* e *y_train* para um *array numpy*"""

x_train,y_train = np.array(x_train), np.array(y_train)
#dimensões dos arrays
print(x_train.shape)
print(y_train.shape)

"""### Redimensionamento dos dados"""

x_train=np.reshape(x_train, (x_train.shape[0], x_train.shape[1],1))
x_train.shape

"""### Criando a base de teste

Vamos separar um conjunto de dados que serão os dados de validação.
"""

#criando os dados de teste
test_data=scaled_data[training_data_len-60:,:]

#criando x_test e y_test
x_test=[]
y_test=dataset[training_data_len:,:]

for i in range(60,len(test_data)):
  x_test.append(test_data[i-60:i,0])

x_test=np.array(x_test)
x_test=np.reshape(x_test, (x_test.shape[0],x_test.shape[1],1))

"""## Criando o modelo

Nesse modelo eu irei inserir 3 camadas
"""

model=Sequential()
model.add(LSTM(50, return_sequences=True, input_shape=(x_train.shape[1],1)))
model.add(LSTM(50, return_sequences=True))
model.add(LSTM(50, return_sequences=False))
model.add(Dense(25))
model.add(Dense(1))

"""Compilando o modelo."""

model.compile(optimizer='adam', loss='mse')

"""## Treinando o modelo

Para o nosso modelo irei 10 épocas, mas é possível inserir mais épocas para melhorar o treinamento do modelo.
"""

model.fit(x_train, y_train, batch_size=100,epochs=10, validation_data=(x_test, y_test))

"""### Sumário do modelo"""

model.summary()

"""## Gerando as previsões"""

predictions = model.predict(x_test)
#invertendo a escala
predictions = scaler.inverse_transform(predictions)

"""### Métricas de avaliação

Vamos agora utilizar as métricas de avaliaçãó para ver o desempenho do modelo, comparando os dados de teste e as previsões geradas. Geralmente eu prefiro usar a métrica *R²*, pois ela vai revela o quanto as previsões estão alinhadas com os valores reais (quanto mais próximo de 1, melhor), as outras medidas são mais usadas para comparar com o desempenho de outros modelos.
"""

print('Erro médio absoluto :', mean_absolute_error(predictions,y_test))
print('Erro médio quadrado logarítmico :', mean_squared_log_error(predictions,y_test))
print('Erro medio quadrado :', mean_squared_error(predictions,y_test))
print('Coeficiente de determinação (R²):', r2_score(predictions,y_test))

"""### Gráfico Previsões *vs* Valores reais."""

#plotando os dados
train=data[:training_data_len]
valid=data[training_data_len:]
valid['Predictions'] = predictions

plt.figure(figsize=(20,5))
plt.title('Série de preços de fechamento, validação e previsões (LSTM)',size=15)
plt.xlabel('Período',size=15)
plt.ylabel('Preços de fechamento em US$',size=15)
plt.plot(train['Close'])
plt.plot(valid[['Close','Predictions']])
plt.legend(['Train','Valid','Predictions'])
plt.show()

"""## Gerando previsões com o modelo

O modelo *LSTM* á bom para realizar a previsão de um passo a frente, entretanto é possível realizar a previsão para um horizonte maior de tempo. Aqui irei gerar previsões para 60 dias a frente e depois irei visualizar graficamente o resultado.
"""

#selecionando todos os dados de fechamento e redimensionando-os
dados_fechamento = df['Close'].values.reshape((-1))
 
#criando uma função para gerar as previsões
def predict(numero_previsoes, modelo):
    lista_prev = dados_fechamento[-60:]
     
    for _ in range(numero_previsoes):
        x = lista_prev[-60:]
        x = x.reshape((1, 60, 1))
        out = model.predict(x)[0][0]
        lista_prev = np.append(lista_prev, out)
    lista_prev = lista_prev[60-1:]
         
    return lista_prev

#Criando uma função para as datas das previsões     
def predict_dates(numero_previsoes):
    ultima_data = df.index.values[-1]
    data_prev = pd.date_range(ultima_data, periods=numero_previsoes+1).tolist()
    return data_prev

#número de períodos
numero_previsoes = 60
previsoes = predict(numero_previsoes, model)
forecast_dates = predict_dates(numero_previsoes)

"""## Plotando a série e suas previsões.

Obtendo os valores reais das previsões dos próximos 60 dias.
"""

df2 = pdr.get_data_yahoo("PBR", start="2020-12-30", end="2021-02-28")['Close']

"""Convertendo esses dados em um *dataset*."""

predicoes = pd.DataFrame(previsoes, index=forecast_dates, columns=['Previsões'])

"""Gerando o gráfico das previsões e dos valores reais."""

plt.figure(figsize=(20,5))
plt.title('Série de preços de fechamento, validação e previsões (LSTM)',size=15)
plt.xlabel('Período',size=15)
plt.ylabel('Preços de fechamento em US$',size=15)
plt.plot(df['Close'])
plt.plot(predicoes['Previsões'])
plt.plot(df2)
plt.legend(['Treino','Validação','Predições'])
plt.show()