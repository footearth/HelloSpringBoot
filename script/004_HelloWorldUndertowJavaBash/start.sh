#!/usr/bin/env bash

java \
-cp \
"${HOME}/.groovy/grapes/io.undertow/undertow-core/jars/undertow-core-2.0.0.Alpha1.jar:\
${HOME}/.groovy/grapes/org.jboss.xnio/xnio-api/jars/xnio-api-3.3.6.Final.jar:\
${HOME}/.groovy/grapes/org.jboss.xnio/xnio-nio/jars/xnio-nio-3.3.6.Final.jar:\
${HOME}/_HOME_/WORKSPACE/JAVA/HelloSpringBoot/script/004_HelloWorldUndertowJavaBash:\
${HOME}/.groovy/grapes/org.jboss.logging/jboss-logging/jars/jboss-logging-3.2.1.Final.jar" \
HelloWorldServer
