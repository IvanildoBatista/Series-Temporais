# Sobre a pasta

Nessa pasta consta alguns projetos em que foi usada a biblioteca *Facebook Prophet* para modelagem de duas séries temporais. O primeiro trata dos preços futuros diários do ouro
e dos preços mensais do ouro; já o segundo trata de modelagem da série de vendas de *champagne*.

Como forma de modelagem usarem a biblioteca Prophet Facebook, desenvolvida pela empresa que leva o nome. As principais vantagens da biblioteca Prophet Facebook são:

       1) Pode ser usada mesmo por quem não tenha nenhuma noção de séries temporais;
       
       2) Fácil implementação, bastando apenas definir duas colunas (uma dos dados temporais - 'ds'- 
       e outra para os valores da série -'y') 
       
       3) É uma bibiloteca simples e com poucos parâmetros, o que facilita o seu *tunning*;

A principal desvantagem  é que essa biblioteca é um tipo de **caixa preta**, pois não se sabe bem como ela faz o processo de modelagem de dados e de previsão.    

## Etapas do projeto

1) Importação das bibliotecas
2) Importação dos dados
3) Separação dos dados de validação
4) Aplicação do Prophet Facebook
5) Avaliação dos resultados
6) Conclusão

## Bibliotecas usadas

1) Matplotlib
2) Pandas
3) Seaborn
4) Scikit-learn
5) Facebook Prophet
6) Statsmodels

## Dados
Todos os arquivos dos dados estão anexados em formato *csv* nessa pasta.
