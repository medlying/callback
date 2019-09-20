package com.sodacar.ginkgo.command.callback.mq;

import org.slf4j.helpers.MessageFormatter;

public class LogMessageTemplate {
    public static String template(String format, Object... args) {
        return MessageFormatter.arrayFormat(format, args).getMessage();
    }
}
