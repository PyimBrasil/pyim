## Pyim 

Visando o alto desemprego e o aumento dos profissionais autônomos pensamos em uma forma de ajudar esses profissionais, anunciando – os para milhares de pessoas em diversas localidades próximas a sua. O sistema foi desenvolvido tanto para profissionais que desejam ser anunciados de forma aberta, aumentando suas possibilidades para trabalhos autônomos, quanto para simples usuários que queiram contratar esses profissionais, facilitando a busca por serviço em específico.
O sistema possui criptomoeda própria chamada “CriptoPyim” e conta com smart contracts (contratos inteligentes), objetivando a segurança de ambas as partes na hora da elaboração do contrato, do pagamento e do recebimento do serviço prestado. Esse sistema de criptomoeda e smart contracts tem como finalidade a modernização, desburocratização e descentralização de transações bancárias.
O objetivo é elevar o sistema de procura de profissionais para a um outro patamar, mais modernizado e com um amplo campo de profissões distintas, fazendo com que os profissionais qualificados sejam solicitados, executem serviços de qualidade trazendo a satisfação do cliente.

### Script SQL
- O script sql está presente na raiz do projeto no arquivo ```/create.sql```
- Existe um seeding disponivel no seguinte diretório ``` /src/main/resources/data.sql```

### Perfis
- Nesse diretório ```/src/main/resources/``` estão presentes as propriedade de perfil 
- O perfil ```dev``` está configurado o Banco de dados MySql
- O perfil ```test``` está configurado o Banco de dados em memoria H2DataBase

### Principais rotas atuais 
- ```/employee```
- ```/role```
- ```/client/{id}``` EX: id= 6
- ```/ServiceProvider/{id}``` EX: id= 1
