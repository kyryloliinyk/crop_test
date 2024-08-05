# Dockerfile
FROM ruby:3.3-bullseye as base

RUN apt-get update -qq && \
    apt-get install -y build-essential apt-utils libpq-dev nodejs \
    libproj-dev proj-bin libgeos-dev

WORKDIR /docker/app

RUN gem install bundler -v 2.5.9
COPY Gemfile* ./
RUN bundle install

ADD . /docker/app

ARG DEFAULT_PORT=3000
EXPOSE ${DEFAULT_PORT}
CMD [ "bundle", "exec", "puma", "config.ru" ]
