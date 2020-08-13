# Teste_iOS

## Arquitetura
Esse projeto se baseia na MVP (Model, View, Presenter) + Router , que por sua vez é uma arquitetura mais simples, 
oferencendo mais agilidade no desenvolvimento, já que se treta de um projeto pequeno. 
Em projetos maiores, com uma complexidade mais elevada, é bom que se analise outras possíveis arquiteturas, como VIPER por exemplo.  
Uma aplicação mais orientada a protocolo seria interessante também para evitar que as classes se conheçam.
Outro ponto de melhoria seria a utilização de um injetor de dependências que ajudaria na coesão uma vez que uma classe não deveria saber como construir sua dependência, 
essa responsabilidade deveria ser delegada à outra entidade, indo de encontro ao princípio de responsabilidade única.

#### Fotos
O ideal seria que as fotos viessem com os objetos do backlend.
Poderia ser estudado uma forma de carregar as imagens de alguma api de terceiros sem que prejudicasse a arquitetura, o que demandaria um pouco mais de tempo

## Models
Não há separação de objetos por camada, por uma questão de celeridade no desenvolvimento, nesse caso os objetos de transferência de dados contem algumas lógicas, 
o que não é recomendado, uma vez que tais lógicas ficam expostas à mudanças de contrato do backend, além do fato de extrapolar o Princípio de responsabilidade única. 
Uma solução aqui seria fazer a separação dos DTO's dos Modelos, utilizando mappers para a conversão desses objetos.

## Testes 
Não foram feitos testes unitarios e de UI devido ao tempo, o que não é o recomendado, ja que os testes ajudam a diminuir a taxa de defeitos e deterioração do software. 
O ideal seria adionar testes unitários utilizando Quick and Nimble por exemplo.
 
