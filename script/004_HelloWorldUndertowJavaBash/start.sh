#!/usr/bin/env bash

cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
grapes_dir=$HOME/.groovy/grapes

java \
-cp "\
${grapes_dir}/io.undertow/undertow-core/jars/undertow-core-2.0.0.Alpha1.jar:\
${grapes_dir}/org.jboss.xnio/xnio-api/jars/xnio-api-3.3.6.Final.jar:\
${grapes_dir}/org.jboss.xnio/xnio-nio/jars/xnio-nio-3.3.6.Final.jar:\
${grapes_dir}/org.jboss.logging/jboss-logging/jars/jboss-logging-3.2.1.Final.jar:\
${cwd}\
" \
HelloWorldServer
