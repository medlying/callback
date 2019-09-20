package com.sodacar.ginkgo.command.callback.mq;

import com.sodacar.mq.contents.http.HttpContent;
import com.sodacar.mq.core.Message;
import com.sodacar.mq.kit.Kit;
import com.sodacar.mq.protocols.kafka.KafkaProtocol;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

public class CommandCallbackMqConnector {
    private static final Logger LOGGER = LoggerFactory.getLogger(CommandCallbackMqConnector.class);

    public static void main(String[] args) throws IOException {
        Thread thread = new Thread(new ListenerRunnable());
        thread.start();

        LOGGER.info("start command callback kafka connector");
        new Kit.Runner(consumer())
                .group("command-notify")
                .backoffs(Arrays.asList(5000, 10000, 20000))
                .consumer(new Kit.Consumer(producer()))
                .run();
    }
    private static KafkaProducer<String, Message<HttpContent<Map<String, Object>>, KafkaProtocol>> producer() {
        return new KafkaProducer<>(ConnectorEnv.ofProducer("command-notify"));
    }

    private static KafkaConsumer<String, Message<HttpContent<Map<String, Object>>, KafkaProtocol>> consumer() {
        return new KafkaConsumer<>(ConnectorEnv.ofConsumer("command-notify"));
    }
}
