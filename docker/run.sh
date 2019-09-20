#!/bin/bash

#######################
/opt/app/bin/template.sh /opt/app/config/keyvault.yaml.tpl > /opt/app/config/keyvault.yaml
/opt/app/bin/template.sh /opt/app/config/keyvault2.yaml.tpl > /opt/app/config/keyvault2.yaml

# env all info
/opt/app/bin/keyvault render --config /opt/app/config/keyvault2.yaml --tpl /opt/app/templates/env.sh.tpl --out /opt/app/config/env.sh --keys CORPTENV
cat /opt/app/config/env.sh | tr ' ' '\n' |awk '{print "export "$0}' > /opt/app/env.sh
source /opt/app/env.sh
cat /opt/app/config/env.sh

/opt/app/bin/template.sh /opt/app/templates/topic.command-notify.consumer.properties > /opt/app/config/topic.command-notify.consumer.properties
/opt/app/bin/template.sh /opt/app/templates/topic.command-notify.producer.properties > /opt/app/config/topic.command-notify.producer.properties


#generate properties
java -Dorg.glassfish.grizzly.http.util.Constants.default-character-encoding=UTF-8 -cp /opt/app/config/:/opt/app/app.jar com.sodacar.ginkgo.command.callback.mq.CommandCallbackMqConnector $*
