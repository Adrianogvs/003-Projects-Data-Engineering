CREATE VIEW VW_RELACAO_GERENTES_VENDEDORES
AS
SELECT	G.ID_GERENTE,
		V.NOME AS GERENTE,
		G.IDVENDEDOR,
		G.NOME AS VENDEDOR,
		G.SEXO
FROM VENDEDOR V
INNER JOIN VENDEDOR G ON V.IDVENDEDOR = G.ID_GERENTE
GO

SELECT * FROM VW_RELACAO_GERENTES_VENDEDORES
GO