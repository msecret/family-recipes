FROM ruby:2.3.3

RUN apt-get update && apt-get install -y build-essential libpq-dev postgresql-client vim --no-install-recommends

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV RAILS_LOG_TO_STDOUT true

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . /usr/src/app

CMD ["rails", "server", "-b", "0.0.0.0"]
