package org.home

import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.Task

class CustomPlugin implements Plugin<Project> {

  void apply(Project project) {
    project.extensions.create('customPlugin', CustomExtension)
    Task task = project.task('customTask', type: CustomTask)
    
    task.doLast{
      println("Hello Gradle [Groovy]!")
    }
  }
  
}