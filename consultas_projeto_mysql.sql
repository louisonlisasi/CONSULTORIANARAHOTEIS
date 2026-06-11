--  total de diarias por canais de venda: ------ 
use narahoteis;
SELECT 
    canais_venda.nome_canal, 
     
    SUM(reservas.qtd_diarias) AS total_diarias
FROM reservas
JOIN canais_venda 
    ON reservas.id_canal = canais_venda.id_canal
GROUP BY 
    canais_venda.nome_canal;
-- -----------------------------------------------------------
--  --------usuarios por unidade e regioes -------------------

SELECT funcionarios.nome, 
            funcionarios.cargo, 
            funcionarios.salario,
        unidades.nome_unidade,
        unidades.regiao
FROM funcionarios
RIGHT JOIN unidades
ON funcionarios.id_unidade = unidades.id_unidade;

-- status de reserva com qauntidades acima de 60 -----

SELECT status_reserva, COUNT(id_reserva) AS qtd_reservas
FROM reservas
GROUP BY status_reserva
HAVING COUNT(id_reserva) > 60
ORDER BY qtd_reservas DESC;

-- quantidade total de reservas por cliente e unidade -------- 

SELECT 
    clientes.nome, 
    unidades.nome_unidade, 
    clientes.tipo_cliente, 
    COUNT(id_reserva) AS qtd_reservas
FROM reservas
      JOIN clientes ON reservas.id_cliente = clientes.id_cliente
      JOIN unidades ON reservas.id_unidade = unidades.id_unidade
GROUP BY 
    clientes.nome, 
    unidades.nome_unidade, 
    clientes.tipo_cliente
HAVING COUNT(id_reserva) > 3;



-- tipos de quartos com suas capacidades e saber o status da reserva e a disponibilidade -------


SELECT 
tipos_quarto.descricao, tipos_quarto.capacidade_max,
reservas.status_reserva, reservas.checkout
FROM reservas
LEFT JOIN 
tipos_quarto
ON reservas.id_tipo_quarto = tipos_quarto.id_tipo_quarto;
