package org.home;

import org.gradle.api.DefaultTask;
import org.gradle.api.tasks.TaskAction;

public class CustomTask extends DefaultTask {

  @TaskAction
  public void run() {
    System.out.println("==CustomTask==");
    
    CustomExtension plugin = (CustomExtension) getProject().getExtensions().getByName("customPlugin");
    int param1 = plugin.param1;
    System.out.println("param1: " + param1);
  }

}
