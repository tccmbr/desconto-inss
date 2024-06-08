# DESCONTO INSS

Projeto teste para a empresa Credshop.

Criar uma aplicação “Desconto INSS” no Rails com os seguintes requisitos:

- Rails 5 +;
- PostgreSQL;
- Bootstrap;
- Chart.js;
- Rubocop rails;
- Kaminari;
- Redis;
- Sidekiq.

## Como executar

Execute as dependências do projeto:
```shell
docker compose up -d
```

Execute a aplicação:
```shell
rails s
```

## Sidekiq

```shell
bundle exec sidekiq -C config/sidekiq.yml
```

## Testes

```shell
bundle exec rspec
```
