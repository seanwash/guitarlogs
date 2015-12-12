FROM ruby:2.2.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y nodejs

RUN mkdir /guitarlogs
WORKDIR /guitarlogs
ADD Gemfile /guitarlogs/Gemfile
ADD Gemfile.lock /guitarlogs/Gemfile.lock
RUN bundle install
ADD . /guitarlogs
