# BookSearch :books:

Aplicação web desenvolvida em Ruby on Rails que permite aos usuários visualizar uma lista de livros e realizar buscas.

## Funcionalidades :bulb:

:bookmark: Visitante pode acessar a homepage e visualizar a lista de livros 

:bookmark: A página de listagem de livros permite buscar por título e descrição, ou por autor, de forma dinâmica

:bookmark: A busca pode ser organizada em ordem alfabética crescente ou decrescente

:bookmark: Admins autenticados podem criar, editar ou remover registros de livros

## Pré-requisitos :package:

:heavy_check_mark: Docker


:heavy_check_mark: Ruby >=2.7.0

## Instruções :point_down:

1. Clonar o projeto e entrar no diretório

```
$ git clone https://github.com/l-mayumi/book-search
$ cd book-search
```

2. Subir a aplicação com docker-compose:

```
$ docker-compose build
$ docker-compose up app
```

Ou executar o seguinte comando para abrir o projeto no docker em um novo terminal:
```
$ docker-compose run --service-ports app bash
```

Subir o server da aplicação:
```
$ rails s -b 0.0.0.0
```

Rodar os testes:
```
$ rspec
```

> :exclamation: A aplicação estará disponível em http://localhost:3000 :exclamation:

## Banco de dados :floppy_disk:

:bookmark: Ao subir o projeto, o banco de dados será populado com dados criados no arquivo [seeds.rb](https://github.com/l-mayumi/book-search/blob/master/db/seeds.rb)

:bookmark: As informações salvas para os livros foram geradas com a gem [Faker](https://github.com/faker-ruby/faker/)

> :exclamation: O arquivo `seeds.rb` cria dois Users (admin) para utilização da aplicação.

> **email**: admin0@booksearch.net | admin1@booksearch.net<br>
> **senha**: abc123