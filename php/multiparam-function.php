<?php

 function multiParam(){
   $a1=func_get_arg(0);
   $a2=func_get_arg(1);
   
   echo $a1;
   echo "<br>";
   echo $a2;
   
   $a1=func_get_arg(1);
   echo "<br>";
   echo $a1;
 }
 
 multiParam(1,2);
