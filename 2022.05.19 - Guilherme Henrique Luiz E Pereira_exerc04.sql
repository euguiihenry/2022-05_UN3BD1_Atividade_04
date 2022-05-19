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
SELECT		c.categoria,
			p.produto
			AVG()
FROM		categoria c INNER JOIN produto p
			ON c.codcategoria = p.codcategoria
			INNER JOIN pedido_detalhe pd
			ON p.codproduto = pd.codproduto
			INNER JOIN pedido ped
			ON pd.codpedido = ped.codpedido
WHERE		YEAR() = '1997' AND AVG()
GROUP BY	c.categoria AND p.produto
HAVING		

SELECT	*
FROM	categoria;
		
SELECT	*
FROM	cliente;

SELECT	*
FROM	pedido;

SELECT	*
FROM	pedido_detalhe;
		
SELECT	*
FROM	produto;

/*
Questão 03
=============================================================================*/