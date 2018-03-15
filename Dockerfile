FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV SOURCE_HOME .
ENV APP_HOME /pomodoro_sheet_api
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV DB_USERNAME postgres
ENV DB_HOST db
ENV DB_PORT 5432

ENV REDIS_HOST redis

COPY $SOURCE_HOME $APP_HOME
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
# Add bundle entry point to handle bundle cache

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
