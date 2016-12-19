#!/usr/bin/env bash
//usr/bin/env groovy -d "$0" $@; exit $?

@Grapes([
  @Grab('io.undertow:undertow-core:2.0.0.Alpha1')
])

import io.undertow.Undertow;
import io.undertow.server.HttpHandler;
import io.undertow.server.HttpServerExchange;
import io.undertow.util.Headers;

def runServer(duration) {
  Undertow server = Undertow.builder()
  .addHttpListener(8080, "localhost")
  .setHandler(

    new HttpHandler() {

      @Override
      public void handleRequest(final HttpServerExchange exchange) throws Exception {
        exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "text/plain");
        exchange.getResponseSender().send("Hello World");
      }

    }
  )
  .build();

  println duration

  server.start()
}

runServer(10000)
