#  Documento de Requisitos de Projeto

## Análise Geral


O cliente Tera do ramo varejista, necessita armazenar seus dados através de um sistema que será construído posteriormente à modelagem do banco de dados. A equipe de analistas Unidados iniciou o levantamento de requisitos em XXXXX conforme descrito nesse documento.

Em necessidades macro, o projeto foi dividido em 04 grandes fases:

- Fase 01: Construção do ambiente OLTP.
- Fase 02: Construção da área de Stage.
- Fase 03: Construção do Datawarehouse.
- Fase 04: Ferramentas de análise de dados.

![texto](https://github.com/Adrianogvs/003-Projects-Data-Engineering/blob/main/001-Projeto-BI/img/002-Fases.png).

## Fase 01

A fase 01 compreende à modelagem relacional do negócio. O SGBD utilizado será o SQL Server 2017, versão Enterprise. À UNIDADOS cabe somente a modelagem e construção do banco de dados em sua forma otimizada, ficando à cargo da Tera a sua manutenção como Backups e segurança.


## Artefatos de Entrega

### Modelagem Lógica:

![texto](https://github.com/Adrianogvs/003-Projects-Data-Engineering/blob/main/001-Projeto-BI/img/001-Modelagem.png).

### Modelagem Física:

	/* MODELAGEM COMERCIO_OLTP */

		CREATE DATABASE COMERCIO_OLTP
		GO

		USE COMERCIO_OLTP
		GO

		CREATE TABLE CLIENTE(
			IDCLIENTE INT PRIMARY KEY IDENTITY,
			NOME VARCHAR(30) NOT NULL,
			SOBRENOME VARCHAR(30) NOT NULL,
			EMAIL VARCHAR(60) NOT NULL,
			SEXO CHAR(1) NOT NULL,
			NASCIMENTO DATE NOT NULL
		)	
		GO

		CREATE TABLE ENDERECO(
			IDENDERECO INT PRIMARY KEY IDENTITY,
			RUA VARCHAR(100) NOT NULL,
			CIDADE VARCHAR(50) NOT NULL,
			ESTADO VARCHAR(20) NOT NULL,
			REGIAO VARCHAR(20) NOT NULL,
			ID_CLIENTE INT UNIQUE
		)
		GO

		CREATE TABLE VENDEDOR(
			IDVENDEDOR INT PRIMARY KEY IDENTITY,
			NOME VARCHAR(30) NOT NULL,
			SEXO CHAR(1) NOT NULL,
			EMAIL VARCHAR(30) NOT NULL,
			ID_GERENTE INT
		)
		GO

		CREATE TABLE CATEGORIA(
			IDCATEGORIA INT PRIMARY KEY IDENTITY,
			NOME VARCHAR(30) NOT NULL
		)
		GO

		CREATE TABLE FORNECEDOR(
			IDFORNECEDOR INT PRIMARY KEY IDENTITY,
			NOME VARCHAR(50) NOT NULL
		)
		GO

		CREATE TABLE PRODUTO(
			IDPRODUTO INT PRIMARY KEY IDENTITY,
			PRODUTO VARCHAR(100) NOT NULL,
			VALOR NUMERIC(10,2) NOT NULL,
			CUSTO_MEDIO NUMERIC(10,2),
			ID_CATEGORIA INT,
			ID_FORNECEDOR INT
		)
		GO

		CREATE TABLE FORMA_PAGAMENTO(
			IDFORMA INT PRIMARY KEY IDENTITY,
			FORMA VARCHAR(40) NOT NULL
		)
		GO

		CREATE TABLE ITEM_NOTA(
			IDITEMNOTA INT PRIMARY KEY IDENTITY,
			ID_PRODUTO INT,
			ID_NOTA_FISCAL INT,
			QUANTIDADE INT,
			TOTAL NUMERIC(10,2)	
		)
		GO

		CREATE TABLE NOTA_FISCAL(
			IDNOTA INT PRIMARY KEY IDENTITY(1000,10),
			DATA DATE,
			TOTAL NUMERIC(10,2),
			ID_FORMA INT,
			ID_CLIENTE INT,
			ID_VENDEDOR INT
		)
		GO

## Dicionário de Dados

Em desenvolvimento...


## Requisitos

A Tera necessita armazenar os seus dados de vendas. O estoque não faz parte do escopo desse projeto, porém, utilizará dos produtos cadastrados nessa modelagem.


## Dos Cadastros Gerais

De forma geral, seguem os requisitos de cadastro abaixo:<br>

01 – Cadastro de Produtos<p>
02 – Cadastro de Fornecedores<p>
03 – Cadastro de Categorias<p>
04 – Cadastro de Notas Fiscais<p>
05 - Cadastro de Endereço de Clientes<p>
06 – Cadastro de Clientes<p>
07 - Cadastro de Formas de Pagamentos<p>
08 – Cadastro de vendedores (Os vendedores cuidam dos pedidos online, acompanhando os mesmos desde a origem até a entrega, otimizando e solucionando problemas.).<p>


## Dos Campos

Todos os cadastros deverão ter números de identificação automáticos e aleatórios, de forma a deixar a cargo do sistema o controle de identificação de transações.


Criar tabela
	Em desenvolvimento...


## Particularidades

Requisitos levantados pela equipe quanto a detalhes do modelo de negócio da Tera. As particularidades são requisitos e são obrigatórios.<br>

01 – Nas vendas, uma nota fiscal pode conter um ou mais produtos, diferentes ou do mesmo tipo, contendo um subtotal de produtos do mesmo tipo e um total, com a soma de todos os produtos.<p>
02 – Os funcionários possuem gerentes, que deverão ser armazenados no banco de dados.<p>


## Regras de Negócio Essenciais

Aqui foram analisadas as regras de negócio junto aos usuários da Tera. Os analistas da UNIDADOS listaram as principais, e caso surjam duvidas ou outras regras, estas deverão ser informadas para a equipe de analistas para que sejam implementadas no banco de dados.

- Um fornecedor pode fornece vários produtos.
- Um cliente pode comprar várias vezes
- Uma nota fiscal só pode ter uma forma de pagamento
- Um vendedor pode emitir várias notas fiscais, mas uma nota só pode ser emitida por um vendedor.
- Um cliente só pode ter um endereço
- Um produto só pode pertencer a uma categoria.
- Uma nota fiscal pode ter vários itens de nota.


## Constraints

Abaixo segue o dicionário de constraints criadas no banco COMERCIO_OLTP

Criar tabela
	Em desenvolvimento...



### Script

	/*HABILITANDO CONSTRAINTS */

		USE COMERCIO_OLTP
		GO

		ALTER TABLE VENDEDOR ADD CONSTRAINT 
		FK_GERENTE FOREIGN KEY(ID_GERENTE) REFERENCES VENDEDOR(IDVENDEDOR)
		GO

		ALTER TABLE NOTA_FISCAL ADD CONSTRAINT 
		FK_NOTA_CLIENTE FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
		GO

		ALTER TABLE NOTA_FISCAL ADD CONSTRAINT 
		FK_NOTA_VENDEDOR FOREIGN KEY(ID_VENDEDOR) REFERENCES VENDEDOR(IDVENDEDOR)
		GO

		ALTER TABLE ITEM_NOTA ADD CONSTRAINT 
		FK_ITEM_PRODUTO FOREIGN KEY(ID_PRODUTO) REFERENCES PRODUTO(IDPRODUTO)
		GO

		ALTER TABLE ITEM_NOTA ADD CONSTRAINT 
		FK_ITEM_NOTAFISCAL FOREIGN KEY(ID_NOTA_FISCAL) REFERENCES NOTA_FISCAL(IDNOTA)
		GO

		ALTER TABLE PRODUTO ADD CONSTRAINT 
		FK_PRODUTO_FORNECEDOR FOREIGN KEY(ID_FORNECEDOR) REFERENCES FORNECEDOR(IDFORNECEDOR)
		GO

		ALTER TABLE PRODUTO ADD CONSTRAINT 
		FK_PRODUTO_CATEGORIA FOREIGN KEY(ID_CATEGORIA) REFERENCES CATEGORIA(IDCATEGORIA)
		GO

		ALTER TABLE ENDERECO ADD CONSTRAINT 
		FK_ENDERECO_CLIENTE FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
		GO
  
 		ALTER TABLE NOTA_FISCAL ADD CONSTRAINT 
		FK_NOTA_FORMA FOREIGN KEY(ID_FORMA) REFERENCES FORMA_PAGAMENTO(IDFORMA)
	 	GO
		
		



## Constrains Aplicadas

![texto](https://github.com/Adrianogvs/003-Projects-Data-Engineering/blob/main/001-Projeto-BI/img/003-ConstraintsAplicadas.png).




## Perguntas a serem respondidas pelo Data Warehouse

- Quem são os melhores clientes?
- Quem são os melhores vendedores?
- Qual categoria rende mais?
- Qual a minha relação com os fornecedores?
- Qual meu pior e melhor produto?
- Em qual região eu vendo mais?


### Entrevista com o manager da Tera, João Carvalho.

Hoje vendemos muito, temos lucro, mas não sei qual **categoria**, **fornecedor** ou **produto** me dá mais lucro. __Não estou interessado em quantidade__. Preciso de analises sumarizadas. Hoje não me interessa saber quantas vendas tem um vendedor e sim o total vendido, pois os mesmos podem recomendar produtos para os nossos clientes. Também gostaria de sabe meus **custos** por **sazonalidade**. Preciso saber em que época do ano gasto mais para controlar meus investimentos em estoque ou contratações. Saber qual **cliente** compra mais comigo em termos totais também seria uma boa ideia. Outra necessidade é um relatório com os dados dos meus clientes, pois a enviar mala direta vai ser uma prática da empresa. Não estou seguro se uma análise por **categoria ou fornecedor** seria útil. A sua equipe também pode disponibilizar o que achar relevante para o negócio.


### Alteração de Requisitos:

No dia xx/xx/xxxx a gerente de MKT, Maria de xxxx, solicitou ao analista xxxx a inclusão/alteração de requisitos descrita abaixo:

- Coluna com nome único.
- Sexo – Masculino e Feminino.
- Produtos em padrão Camel Case.

.
