FROM harbor.cn133.azure.net/baselibrary/openjdk:8-jdk-alpine

RUN mkdir -p /opt/app/config/storager /opt/app/bin /opt/app/logs

RUN apk add --update curl bash && rm -rf /var/cache/apk/*
ENV APP_HOME /opt/app
ENV APP_MAIN_CLASS com.sodacar.ginkgo.command.callback.mq.CommandCallbackMqConnector

ADD docker/run.sh /opt/app/bin/run.sh
ADD docker/change.sh /opt/app/bin/change.sh
ADD docker/template.sh /opt/app/bin/template.sh
ADD ./keyvault /opt/app/bin/keyvault
RUN chmod +x /opt/app/bin/*
ADD docker/config /opt/app/config/
ADD docker/templates /opt/app/templates/
ADD build/libs/ginkgo-command-callback-mq-standalone.jar /opt/app/app.jar
RUN chown -R 1000:1000 /opt/


USER 1000

WORKDIR /opt/app

ENTRYPOINT ["/opt/app/bin/change.sh"]

