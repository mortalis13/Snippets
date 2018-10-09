package org.home;

import org.gradle.api.Plugin;
import org.gradle.api.Project;
import org.gradle.api.Task;

public class CustomPlugin implements Plugin<Project> {

  public void apply(Project project) {
    project.getExtensions().create("customPlugin", CustomExtension.class);
    Task task = project.getTasks().create("customTask", CustomTask.class);
    
    task.doLast(t -> {
      System.out.println("Hello Gradle [Java]!");
    });
  }
  
}