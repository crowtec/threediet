FROM ruby:2.2.3-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

EXPOSE 80
RUN bundle exec rake RAILS_ENV=production DATABASE_URL=mongodb://user:pass@127.0.0.1/dbname SECRET_KEY_BASE=pickasecuretoken assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
