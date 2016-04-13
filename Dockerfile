FROM ruby:latest
MAINTAINER Denis Tv

ENV APP_PATH=/app
ENV APP_USER=app

RUN gem install geminabox \
    && useradd ${APP_USER} \
    && mkdir ${APP_PATH} \
    && cd ${APP_PATH} \
    && mkdir ${APP_PATH}/data
COPY config.ru ${APP_PATH}/config.ru
RUN chown -R ${APP_USER}:${APP_USER} ${APP_PATH}

VOLUME /var/lib/geminabox:${APP_PATH}/data
EXPOSE 9292
WORKDIR ${APP_PATH}
USER ${APP_USER}
CMD ["rackup", "-p", "9292", "-o", "0.0.0.0"]
