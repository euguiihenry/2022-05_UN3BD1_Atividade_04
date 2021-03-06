/*
Exercicio 04 - SELECT ATÉ HAVING

Nome: Guilherme	Henriquie Luiz Euzébio Pereira

*/

/*
Questão 01
=============================================================================*/
SELECT		c.cliente AS Cliente,
			SUM(p.vlrtotal_pedido) AS 'Total'
FROM		cliente c INNER JOIN pedido p
			ON c.codcliente = p.codcliente
WHERE		c.pais = 'GERMANY'
GROUP BY	c.cliente
HAVING		SUM(p.vlrtotal_pedido) > 1100.00;


/*
Questão 02
=============================================================================*/
SELECT		c.categoria AS 'Categoria',
			p.produto AS 'Produto',
			AVG(pd.preco_unit*pd.qtde) AS 'Média'
FROM		categoria c INNER JOIN produto p
			ON c.codcategoria = p.codcategoria
			INNER JOIN pedido_detalhe pd
			ON p.codproduto = pd.codproduto
			INNER JOIN pedido ped
			ON pd.codpedido = ped.codpedido
WHERE		YEAR(ped.dt_pedido) = '1997'
GROUP BY	c.categoria,
			p.produto
HAVING		AVG(pd.preco_unit*pd.qtde) > 1000.00
ORDER BY	Média;		

/*
Questão 03
=============================================================================*/
SELECT		c.pais AS 'País',
			cate.categoria AS 'Categoria',	
			SUM(pd.preco_unit * pd.qtde - pd.desconto) AS 'Total Gasto'
FROM		categoria cate INNER JOIN produto p
			ON cate.codcategoria = p.codcategoria
			INNER JOIN pedido_detalhe pd
			ON p.codproduto = pd.codproduto
			INNER JOIN  pedido ped
			ON pd.codpedido = ped.codpedido
			INNER JOIN cliente c
			ON ped.codcliente = c.codcliente
WHERE		MONTH(ped.dt_pedido) = 3 AND YEAR(ped.dt_pedido) = 1997
GROUP BY	c.pais,
			cate.categoria
HAVING		SUM(pd.preco_unit * pd.qtde - pd.desconto) < 100.00
ORDER BY	c.pais;
