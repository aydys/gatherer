FROM ruby:2.5

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile* /usr/app/

WORKDIR /usr/app

ENV BUNDLE_PATH=/gems
RUN bundle install

COPY . /usr/app/

CMD [ "bin/rails", "s", "-b", "0.0.0.0" ]
