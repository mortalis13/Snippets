package org.home

import org.gradle.api.DefaultTask
import org.gradle.api.tasks.TaskAction

class CustomTask extends DefaultTask {

  @TaskAction
  def getParams() {
    int param1 = project.customPlugin.param1
    
    println "param1: " + param1
  }

}
