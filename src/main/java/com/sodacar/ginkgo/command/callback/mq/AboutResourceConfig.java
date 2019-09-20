package com.sodacar.ginkgo.command.callback.mq;

import org.glassfish.hk2.api.ServiceLocator;
import org.glassfish.jersey.jackson.JacksonFeature;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.ServerProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;

public class AboutResourceConfig extends ResourceConfig {
    private static final Logger logger = LoggerFactory.getLogger(AboutResourceConfig.class.getName());

    @Inject
    public AboutResourceConfig(ServiceLocator locator) {
        try {
            property(ServerProperties.RESPONSE_SET_STATUS_OVER_SEND_ERROR, true);
            register(MultiPartFeature.class);
            register(JacksonFeature.class);
            register(AboutResource.class);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
    }
}
