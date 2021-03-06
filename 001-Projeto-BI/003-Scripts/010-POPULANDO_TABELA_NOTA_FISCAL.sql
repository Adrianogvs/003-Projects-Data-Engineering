USE COMERCIO_OLTP
GO

TRUNCATE TABLE NOTA_FISCAL
GO

/* PREENCHENDO A TABELA NOTA FISCAL COM DADOS ALEATÓRIOS */

/*GERANDO OS DADOS DE 2015 */


DECLARE
			@ID_CLIENTE INT, @ID_VENDEDOR INT, @ID_FORMA INT,
			@DATA DATE
BEGIN		
			SET @ID_CLIENTE = 
			(SELECT TOP 1 IDCLIENTE FROM CLIENTE ORDER BY NEWID())
			SET @ID_VENDEDOR = 
			(SELECT TOP 1 IDVENDEDOR FROM VENDEDOR ORDER BY NEWID())
			SET @ID_FORMA =
			(SELECT TOP 1 IDFORMA FROM FORMA_PAGAMENTO ORDER BY NEWID())
			SET @DATA = 
			(SELECT  convert(date, convert(varchar(15),'2015-' +
			 convert(varchar(5),(convert(int,rand()*12))+1) + '-' +
			 convert(varchar(5),(convert(int,rand()*27))+1))))

			INSERT INTO NOTA_FISCAL(ID_CLIENTE,ID_VENDEDOR,ID_FORMA,DATA) VALUES
			(@ID_CLIENTE,@ID_VENDEDOR,@ID_FORMA,@DATA)
END
GO 8000

SELECT * FROM NOTA_FISCAL

/* DADOS DO ANO DE 2016*/

DECLARE
			@ID_CLIENTE INT, @ID_VENDEDOR INT, @ID_FORMA INT,
			@DATA DATE
BEGIN		
			SET @ID_CLIENTE = 
			(SELECT TOP 1 IDCLIENTE FROM CLIENTE ORDER BY NEWID())
			SET @ID_VENDEDOR = 
			(SELECT TOP 1 IDVENDEDOR FROM VENDEDOR ORDER BY NEWID())
			SET @ID_FORMA =
			(SELECT TOP 1 IDFORMA FROM FORMA_PAGAMENTO ORDER BY NEWID())
			SET @DATA = 
			(SELECT  convert(date, convert(varchar(15),'2016-' +
			 convert(varchar(5),(convert(int,rand()*12))+1) + '-' +
			 convert(varchar(5),(convert(int,rand()*27))+1))))

			INSERT INTO NOTA_FISCAL(ID_CLIENTE,ID_VENDEDOR,ID_FORMA,DATA) VALUES
			(@ID_CLIENTE,@ID_VENDEDOR,@ID_FORMA,@DATA)
END
GO 8000

/* DADOS DO ANO DE 2017 */

DECLARE
			@ID_CLIENTE INT, @ID_VENDEDOR INT, @ID_FORMA INT,
			@DATA DATE
BEGIN		
			SET @ID_CLIENTE = 
			(SELECT TOP 1 IDCLIENTE FROM CLIENTE ORDER BY NEWID())
			SET @ID_VENDEDOR = 
			(SELECT TOP 1 IDVENDEDOR FROM VENDEDOR ORDER BY NEWID())
			SET @ID_FORMA =
			(SELECT TOP 1 IDFORMA FROM FORMA_PAGAMENTO ORDER BY NEWID())
			SET @DATA = 
			(SELECT  convert(date, convert(varchar(15),'2017-' +
			 convert(varchar(5),(convert(int,rand()*12))+1) + '-' +
			 convert(varchar(5),(convert(int,rand()*27))+1))))

			INSERT INTO NOTA_FISCAL(ID_CLIENTE,ID_VENDEDOR,ID_FORMA,DATA) VALUES
			(@ID_CLIENTE,@ID_VENDEDOR,@ID_FORMA,@DATA)
END
GO 8000

SELECT * FROM NOTA_FISCAL
GO					
