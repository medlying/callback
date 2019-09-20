package com.sodacar.ginkgo.command.callback.mq;

import java.util.Properties;

import static com.sodacar.ginkgo.command.callback.mq.PropertiesLoader.loadProperties;

public class ConnectorEnv {
    public static Properties ofConsumer(String topic) {
        return loadProperties("topic." + topic + ".consumer.properties");
    }
    public static Properties ofProducer(String topic) {
        return loadProperties("topic." + topic + ".producer.properties");
    }
}
