# NexoVendas

Sistema de gestão de vendas desenvolvido como aplicação **Console** em **C# (.NET)**, com acesso direto ao banco de dados **MySQL** via ADO.NET e padrão **DAO** (Data Access Object).

## Funcionalidades

- Cadastro, consulta e alteração de clientes
- Cadastro, consulta e alteração de produtos
- Registro de vendas com carrinho de compras interativo (adicionar e remover itens)
- Cálculo automático de subtotal, total da venda e comissão (10%)
- Exportação de relatório geral em formato CSV

## Tecnologias

- [.NET](https://dotnet.microsoft.com/) (C# Console Application)
- MySQL
- MySql.Data (ADO.NET)

## Pré-requisitos

- [.NET SDK](https://dotnet.microsoft.com/download) instalado
- MySQL Server em execução local

## Configuração

1. Clone o repositório:
   ```bash
   git clone https://github.com/gaspudo/NexoVendas.git
   cd NexoVendas
   ```

2. Execute o script SQL para criar o banco de dados e as tabelas:
   ```bash
   mysql -u root -p < SQL/script.sql
   ```

3. Edite a connection string em `ConexaoBanco.cs` com suas credenciais:
   ```csharp
   private readonly string stringConexao = "Server=localhost;Database=nexovendas;Uid=SEU_USUARIO;Pwd=SUA_SENHA;";
   ```

4. Restaure os pacotes e execute:
   ```bash
   dotnet restore
   dotnet run
   ```

## Estrutura do Projeto

```
NexoVendas/
├── SQL/               # Scripts de criação do banco de dados
├── Cliente.cs         # Modelo de domínio: Cliente
├── Produto.cs         # Modelo de domínio: Produto
├── ConexaoBanco.cs    # Gerenciamento da conexão MySQL
├── SistemaDAO.cs      # Camada de acesso a dados (padrão DAO)
└── Program.cs         # Interface de menu e fluxo principal
```

## Como Usar

Ao executar, o sistema exibe um menu interativo no terminal:

```
=== SISTEMA NEXOVENDAS ===
1. Cadastrar Cliente
2. Consultar Clientes
3. Alterar Cliente
4. Cadastrar Produto
5. Consultar Produtos
6. Alterar Produto
7. Realizar Venda (Carrinho)
8. Gerar Relatório CSV Geral
9. Sair
```

No módulo de venda (opção 7), informe o ID do cliente e escaneie os produtos:
- ID positivo → adiciona o produto ao carrinho
- ID negativo (ex: `-3`) → remove a última ocorrência daquele produto
- `0` → finaliza a venda

O relatório CSV (opção 8) é gerado na raiz do projeto como `RelatorioGeral.csv`, compatível com Excel no padrão brasileiro (separador `;`).
