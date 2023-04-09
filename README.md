# STORE

Это API приложение(CRUD) написанное с использованием библиотеки Grape

## Установка приложения
`docker-compose build`

## Перед запуском
Заходим в контейнер и создаём базу данных

`sudo docker-compose run --rm web bash`

`rails db:create db:migrate`

## Запуск
`docker-compose up`

## Документаци эндпоинтов
`/api-docs/index.html`

# Используемые библитеки
* Grape
* RSpec + Rswag
