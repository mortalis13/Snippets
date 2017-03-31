<?php

  $site_url = site_url();
  $theme_url = get_bloginfo('template_url');
  
  global $template;
  print_r($template);
  
  echo '<pre>';
  debug_print_backtrace();
  echo '</pre>';
  
?>