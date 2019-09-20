package com.sodacar.ginkgo.command.callback.mq;

import org.glassfish.grizzly.http.server.HttpServer;
import org.glassfish.grizzly.servlet.WebappContext;
import org.glassfish.hk2.api.ServiceLocator;
import org.glassfish.jersey.internal.inject.Injections;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.servlet.ServletContainer;
import org.glassfish.jersey.servlet.ServletProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRegistration;
import java.net.URI;

import static org.glassfish.jersey.grizzly2.httpserver.GrizzlyHttpServerFactory.createHttpServer;

public class ListenerRunnable implements Runnable {
    private static final Logger LOGGER = LoggerFactory.getLogger(ListenerRunnable.class);

    @Override
    public void run() {
        WebappContext context = new WebappContext("kaar-event-notification");

        final ServiceLocator locator = Injections.createLocator();
        context.setAttribute(ServletProperties.SERVICE_LOCATOR, locator);

        final ResourceConfig resourceConfig = ResourceConfig.forApplicationClass(AboutResourceConfig.class);
        ServletRegistration servletRegistration = context.addServlet("ServletContainer", new ServletContainer(resourceConfig));
        servletRegistration.addMapping("/*");

        HttpServer server = null;
        try {
            server = createHttpServer(URI.create("http://0.0.0.0:8080"));
            context.deploy(server);
        } catch (Exception e) {
            LOGGER.error("error deploy", e);
            System.exit(1);
        }

        try {
            server.start();
            LOGGER.info("server starting");
            Thread.currentThread().join();
        } catch (Exception e) {
            LOGGER.error("server receive exception: {}", e);
            throw new RuntimeException(e);
        } finally {
            LOGGER.info("server shutdown");
            server.shutdown();
        }
    }
}
