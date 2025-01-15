FROM ruby:2.5

COPY Gemfile* /usr/app/

WORKDIR /usr/app

ENV BUNDLE_PATH=/gems
RUN bundle install

COPY . /usr/app/

CMD [ "bin/rails", "s", "-b", "0.0.0.0" ]
