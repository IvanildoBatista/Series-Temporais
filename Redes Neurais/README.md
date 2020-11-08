# Modelagem preços de ações com Redes Neurais Recorrentes (LSTM)

Nesse pequeno projeto iremos aplicar uma rede neural artificial para modelar e gerar previsões com séries temporais. A rede neural que usaremos se chama LSTM (ou *Long short-term*
*memory*) e é uma rede neural recorrente, ou seja, ela é uma estrutura de processamento que consegue representar grandes variedades de comportamentos dinâmicos.

As redes neurais recorrentes possuem mecanismos de loops, permitindo que haja realimentação de informação e a criação de representações internas e mecanismos de memória que
permitem armazenar infomações temporais (principalmente de séries temporais). O fato de possuir muitos loops, mesmo com um número reduzido de parâmetros, a rede neural pode gerar
um comportamento complexo.

A maioria das redes neurais recorrentes possuem problemas de dependência de longo prazo. Problema de denpendência de longo prazo é quando uma rede neural precisa de um contexto
maior (mais informações anteriores à atual) para poder gerar uma previsão acurada. As LSTM's não possuem esse problema, pois foram projetadas para evitar esse problema de 
dependência.

A LSTM é bastante usada para previsões de séries temporais e usaremos ela aqui para modelar dados de preços de ações.
