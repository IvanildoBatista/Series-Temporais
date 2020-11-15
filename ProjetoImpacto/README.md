# Sobre o projeto

O objetivo desse projeto é analisar o impacto gerado pelo pandemia do coronavírus no mercado de ações do Brasil. Para isso usaremos uma biblioteca do python chamada 
**casualimpact**. A ideia é que a pandemia serve com um tipo de intervenção no mercado e toda intervenção pode gerar ou não impactos significativos após sua aplicação.
Para analisarmos o impacto de uma intervenção devemos, também, gerar um cenário contrafactual, que seria aquilo que teria acontecido caso a intervenção não tivesse ocorrido e, 
após isso compararmos os resultados antes e depois no tempo.
Nesse projeto iremos usar uma modelagem **ARIMA** para estimarmos um cenário contrafactual. Esse cenário contrafactual serão as previsões geradas por esse modelo ARIMA até a data 
final dos dados. O modelo será treinado com dados de 2019 e serão geradas previsões para o anos de 2020. Como a metodologia *Box-Jenkins* (usada na modelagem ARIMA) é um pouco 
extensa usaremos uma biblioteca de séries temporais no python que gera o modelo automaticamente (**autoARIMA**) apenas com a adição de parâmetros.
**Obs** : Para esse projeto, especificamente, vamos supor que a intervenção foi gerada apenas pela pandemia do coronavírus.

# Etapas 

1) Importação das bibliotecas;

2) Importação dos dados;

3) Breve análise exploratória dos dados;

4) Estimando um cenário contrafactual:
   4.1) Treinamento do modelo *ARIMA*;
   4.2) Aplicação da *Causal Impact*;

5) Relatório dos resultados.

# Resultados

A pandemia causada pelo vírus *Covid-19* (ou coronavírus) gerou um impacto em nossa variável, apresentando uma queda de **-35,92%**. A probabilidade de obter esse efeito por acaso é muito pequena (Probabilidade bayesiana unilateral da área da cauda p = 0,0), ou seja, o efeito causal da pandemia pode ser considerado **estatisticamente significativo**.

