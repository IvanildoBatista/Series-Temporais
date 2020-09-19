# Sobre o projeto

Nesse projeto será usada a biblioteca Prophet Facebook para modelagem de duas séries temporais, mas que referem-se ao mesmo ativo. Trata-se dos preços futuros diários do ouro
e dos preços mensais do ouro. Essas séries foram escolhidas, pois o ouro mesmo tendo, no passado, bastante importância como meio de pagamento até o ponto de chegar a ser a base de valor das moedas do mundo (padrão-ouro) e até hoje é um ativo usado como investimento (um outro exemplo de metal muito usado como forma de investimento é a prata).

As principais vantagens da biblioteca Prophet Facebook são:

       1) Pode ser usada mesmo por quem não tenha nenhuma noção de séries temporais;
       
       2) Fácil implementação, bastando apenas definir duas colunas (uma dos dados temporais - 'ds'- e outra para os valores da série -'y') 
       
       3) É uma bibiloteca simples e com poucos parâmetros, o que facilita o seu *tunning*;

A principal desvantagem  é que essa biblioteca é um tipo de **caixa preta**, pois não se sabe bem como ela faz o processo de modelagem de dados.       

# Etapas do projeto

1) Importação das bibliotecas
2) Importação dos dados
3) Separação dos dados de validação
4) Aplicação do Prophet Facebook
5) Avaliação dos resultados
6) Conclusão

# Bibliotecas usadas

1) Matplotlib
2) Pandas
3) Seaborn
4) Scikit-learn
5) Facebook Prophet
6) Statsmodels

# Dados
Todos os 2 arquivos dos dados estão anexados em formato csv nessa pasta.

# Resultados
Para a primeira série aplicamos o modelo e validados os resultados com os últimos 150 dias e obtivemos um RMSE de 82.97 e com os dados mensais utilizamos os últimos 24 meses para validação do modelo e obtivemos um RMSE de 66.97.
