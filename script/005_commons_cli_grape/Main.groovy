#!/usr/bin/env bash
//usr/bin/env groovy -d "$0" $@; exit $?

// @Grab('commons-cli:commons-cli:1.4-SNAPSHOT'),
// @Grab('org.yaml:snakeyaml:1.18-SNAPSHOT')

@Grapes([
  @Grab('commons-cli:commons-cli:1.3.1'),
  @Grab('org.yaml:snakeyaml:1.17')
])

import org.apache.commons.cli.Options
import org.apache.commons.cli.DefaultParser

def options = new Options()
options.addOption "t", false, "display current time"

def parser = new DefaultParser()
def cmd = parser.parse options, args
