USE nexovendas;

ALTER TABLE tb_vendas DROP FOREIGN KEY tb_vendas_ibfk_2;
ALTER TABLE tb_vendas DROP COLUMN fk_produto;

CREATE TABLE tb_itens_venda (
	cd_item INT AUTO_INCREMENT PRIMARY KEY,
    fk_vendas INT NOT NULL,
    fk_produto INT NOT NULL,
    qt_produto INT NOT NULL,
    vl_subtotal DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (fk_vendas) REFERENCES tb_vendas(cd_venda),
    FOREIGN KEY (fk_produto) REFERENCES tb_produto(cd_produto)
);