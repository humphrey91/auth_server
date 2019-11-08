FROM ruby:2.6.5-alpine3.10

RUN apk update \
  && apk add -Uuv \
    alpine-sdk \ 
    bash \
    git \
    less \
    nodejs \
    yarn \ 
    python \
    postgresql-dev \
    py-pip \
    tzdata \
  && rm -rf /var/cache/apk/*

RUN pip install awscli \
  && apk --purge -v del py-pip

RUN mkdir /auth_server
WORKDIR /auth_server
COPY Gemfile /auth_server/Gemfile
COPY Gemfile.lock /auth_server/Gemfile.lock
RUN bundle install
COPY . /auth_server

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]