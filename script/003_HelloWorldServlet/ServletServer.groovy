#!/usr/bin/env bash
//usr/bin/env groovy -d "$0" $@; exit $?

@Grapes([
  @Grab('io.undertow:undertow-core:2.0.0.Alpha1'),
  @Grab('io.undertow:undertow-servlet:2.0.0.Alpha1'),
  @Grab('javax.servlet:javax.servlet-api:3.1.0')
])

import static io.undertow.servlet.Servlets.deployment
import static io.undertow.servlet.Servlets.servlet
import static io.undertow.servlet.Servlets.defaultContainer

import io.undertow.Handlers
import io.undertow.Undertow

class ServletServer {

  static void main(String... args) {

    def MYAPP = "/myapp"

    def servletBuilder = deployment()
    .setClassLoader(ServletServer.class.getClassLoader())
    .setContextPath(MYAPP)
    .setDeploymentName("test.war")
    .addServlets(

      servlet("HelloWorldServlet", HelloWorldServlet.class)
      .addInitParam("message", "Hello World")
      .addMapping("/*")

    )

    def manager = defaultContainer().addDeployment(servletBuilder)
    manager.deploy()
    def servletHandler = manager.start()

    def path = Handlers
    .path(Handlers.redirect(MYAPP))
    .addPrefixPath(MYAPP, servletHandler)

    def server = Undertow.builder()
    .addHttpListener(8080, "localhost")
    .setHandler(path)
    .build()

    server.start()

  }
}
