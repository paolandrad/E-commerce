-- criação do banco de dados para o cenário de E-commerce 
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
 
 
 
