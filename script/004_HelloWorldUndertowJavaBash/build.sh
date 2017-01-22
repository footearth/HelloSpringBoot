#!/usr/bin/env bash

rm -rf ./*.class
javac -cp "${HOME}/.groovy/grapes/io.undertow/undertow-core/jars/undertow-core-2.0.0.Alpha1.jar" HelloWorldServer.java
