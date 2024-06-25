CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE Orcamento (
    id_orcamento SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    id_cliente INTEGER NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Produto (
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Detalhe_Orcamento (
    id_detalhe_orcamento SERIAL PRIMARY KEY,
    id_orcamento INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_orcamento) REFERENCES Orcamento(id_orcamento),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);


INSERT INTO Cliente (nome, email, telefone) VALUES
('João Silva', 'joao.silva@example.com', '99999-9999'),
('Maria Oliveira', 'maria.oliveira@example.com', '98888-8888');

INSERT INTO Produto (nome_produto, descricao, preco) VALUES
('Tinta Azul', 'Tinta de alta qualidade para interiores', 100.00),
('Tinta Vermelha', 'Tinta resistente a intempéries', 120.00);

INSERT INTO Orcamento (data, id_cliente) VALUES
('2024-06-23', 1),
('2024-06-24', 2);

INSERT INTO Detalhe_Orcamento (id_orcamento, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 5, 100.00),
(1, 2, 2, 120.00),
(2, 1, 3, 100.00);


SELECT 
    O.id_orcamento, 
    O.data, 
    C.nome, 
    C.email, 
    C.telefone
FROM 
    Orcamento O
JOIN 
    Cliente C 
ON 
    O.id_cliente = C.id_cliente;
    

SELECT 
    Detalhe_Orcamento.id_orcamento, 
    Produto.nome_produto, 
    Detalhe_Orcamento.quantidade, 
    Detalhe_Orcamento.preco_unitario
FROM 
    Detalhe_Orcamento
JOIN 
    Produto 
ON 
    Detalhe_Orcamento.id_produto = Produto.id_produto;

SELECT 
    O.id_orcamento, 
    O.data, 
    C.nome, 
    C.email, 
    P.nome_produto, 
    D.quantidade, 
    D.preco_unitario
FROM 
    Orcamento O
JOIN 
    Cliente C 
ON 
    O.id_cliente = C.id_cliente
JOIN 
    Detalhe_Orcamento D 
ON 
    O.id_orcamento = D.id_orcamento
JOIN 
    Produto P 
ON 
    D.id_produto = P.id_produto;
