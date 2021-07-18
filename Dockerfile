FROM ruby:3.0.2-alpine3.14 AS builder

RUN apk update && apk upgrade && apk add --update --no-cache \
  build-base \
  curl-dev \
  nodejs \
  postgresql-dev \
  tzdata \
  vim \
  rm -rf /var/cache/apk/*

ARG RAILS_ROOT=/usr/src/app/
WORKDIR $RAILS_ROOT

COPY Gemfile* $RAILS_ROOT
RUN bundle config --global frozen 1 && bundle install

COPY . .


### BUILD STEP DONE ###

FROM ruby:3.0.2-alpine3.14

ARG RAILS_ROOT=/usr/src/app/

RUN apk update && apk upgrade && apk add --update --no-cache \
  bash \
  nodejs \
  postgresql-client \
  tzdata \
  vim \
  rm -rf /var/cache/apk/*

WORKDIR $RAILS_ROOT

COPY --from=builder $RAILS_ROOT $RAILS_ROOT
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

EXPOSE 3000

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
