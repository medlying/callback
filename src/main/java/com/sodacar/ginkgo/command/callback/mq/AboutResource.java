package com.sodacar.ginkgo.command.callback.mq;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("/about")
public class AboutResource {
    @GET
    public Response about() {
        return Response.ok("command-callback-mq").build();
    }
}
