FROM ruby:3.0.0

# Установка зависимостей
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs python3.5 python3-pip python-dev curl apt-transport-https ca-certificates nodejs postgresql-client


# Установка гемов
WORKDIR /store
COPY Gemfile* /store/
RUN bundle install

# Копирование приложения
COPY . /store

# Установка переменных окружения
ENV RAILS_ENV development
ENV RAILS_SERVE_STATIC_FILES true

# Запуск приложения
CMD bundle exec rails s -p $PORT -b '0.0.0.0'
