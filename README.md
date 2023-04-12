# Criação do banco de dados para o cenário de E-commerce

Como parte do meu Currículo Profissional, elaborei este projeto para Sistemas de Gerenciamento de Banco de Dados (DBMS) - COMP 213. Este projeto contém tanto a parte teórica quanto a implementação em SQL. Se você gostou do repo, dê uma estrela nele.

## Pre-requisite

Microsoft SQL Server

## Conteúdo
- Descrição
- Estrutura básica
    - Diagrama de Entidade Relação (EER)
    - Esquema de banco de dados relacional
- Implementação
    - Criando Tabelas
    - Inserindo Dados
- Consultas

## 1. Descrição

O Sistema de gerenciamento de banco de dados de comércio eletrônico (EC-DBMS) é um sistema projetado para armazenar, processar, recuperar e analisar informações relacionadas à administração e gerenciamento de atividades de vendas feitas por um cliente on-line sentado em casa. Este projeto visa manter todas as informações pertencentes aos clientes, fornecedores, produtos e suas categorias, pedidos e correios. Ele permite que os fornecedores configurem lojas online, os clientes naveguem pelas lojas e um administrador do sistema aprove e rejeite solicitações de novas lojas e mantenha listas de categorias de lojas. O sistema gerencia os itens da loja e também ajuda os clientes a comprá-los online sem precisar se deslocar fisicamente à loja. O sistema de compras online utilizará a internet como único meio de venda de bens, produtos e serviços aos seus consumidores. O site mostrará todos os produtos de forma categorizada. Os clientes podem pesquisar qualquer produto por seu preço, outros detalhes e podem solicitar o produto usando sua conta registrada. O cliente deve pagar o valor do pedido no momento da entrega.

## 2. Estrutura Básica

2.1 Relational Database Schema
![alt text](https://github.com/paolandrad/E-commerce/blob/main/Diagrama%20EER/EER%20Diagram.png)

## 3. Implementação
3.1 Criando Tabelas

O script completo está disponível na Database & Table Creationpasta.

```sql
create database ecommerce;
use ecommerce;

 -- criar tabela client 
 
 create table clients(
        idClient int auto_increment primary key, 
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null ,
        Address varchar(30),
        constraint unique_cpf_client unique (CPF)
 );
 
-- criar tabela produto

-- size = dimenção do produto 
 create table product(
        idProduct int auto_increment primary key, 
        Pname varchar(10) not null,
        classification_kids bool default false,
        category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
        avaliação float default 0, 
        size varchar(10), 
        constraint unique_cpf_client unique (CPF)
);


-- para ser continuado no desafio termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional 
-- criar constraints relacionadas ao pagamento 
create table payments(
	   idclient int,
       idPayment int,
       typePayment enum('Boleto','Cartão','Dois cartões'),
       limitAvailable float,
       primary key(idClient, id_payment)
); 


 -- criar tabela pedido
 
 create table orders(
         idOrder int auto_increment primary key,
         idOrderCliente int,
         orderStatus enum('Cancelado','Comfirmado','Em processamento') default 'Em processamento',
         orderDescription varchar(255),
         sendValue float default 10,
         paymentCash bool default false,
         idPayment ....
         constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient) 
         );
         
 -- criar tabela estoque
create table productStorage(
         idProdStorage int auto_increment primary key,
         storageLocation varchar(255),
         quantity int default 0
         );

 -- criar tabela fornecedor
create table supplier(
         idSupplier int auto_increment primary key,
         SocialName varchar(255) not null,
         CNPJ char(15) not null,
         contact varchar(11) not null,
          constraint unique_supplier unique (CNPJ)
         );

 -- criar tabela vendedor
create table supplier(
         idSupplier int auto_increment primary key,
         SocialName varchar(255) not null,
         CNPJ char(15) not null,
         contact varchar(11) not null,
          constraint unique_supplier unique (CNPJ)
         );
```

3.2 Inserindo Dados

Os scripts completos estão disponíveis na Data Insertionpasta.

Obs: Todas as informações são falsas e geradas para demonstração do projeto.

```sql
use OnlineShopping;

Insert Into Category Values ('Android Smart TV Box/Air Mouse');

Insert Into City Values ('Karachi');

Insert Into Orders Values ('1','2011-01-27','1','318','77425889862');

Insert Into Product Values ('Air Mouse C120 for Android and Smart TV','1');

Insert Into Province Values ('Punjab');

Insert Into Review Values ('4','Great Product Slow delivery. Such slow much wow','1','1');
```

## 4. Consultas

Os scripts completos estão disponíveis na `Queries` pasta.

### As categorias de produtos de um determinado fornecedor que ele está vendendo

```sql
select CategoryName
from Category
where CategoryID in
				(select Distinct CategoryID
				from Product
				where ProductID in
								(select ProductID
								from VendorProduct
								where VendorID='3'));
```

### Idade Média dos Clientes

```sql
select sum(DATEDIFF ( year , customer.DOB , getdate() ))/Count(customerid) as "Average Age"
from Customer
```



`Sinta-se à vontade para bifurcar o repositório e contribuir com este projeto..`
