FROM ruby:2.7-alpine

RUN apk add --no-cache --update build-base git linux-headers nodejs sqlite sqlite-dev tzdata yarn

WORKDIR /app

COPY . .
COPY bin/entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

RUN bundle install

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
