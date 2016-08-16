
<?php
  $wordForms=["штук","штука","штуки"];
  $nums=[20,21,22,23,24,25];

  $div=10;
//  foreach($nums as $n)
//    echo $n." - ".($n%$div)."<br />";

//  for($i=0;$i<=100;$i++)
//    echo $i." - ".$wordForms[getWordForms($i)]."<br />";

  for($i=0;$i<=3000;$i++){
    $x=$wordForms[getWordForms($i)];
    echo $i%$div." - ";
    echo $i." - ".$x;
    echo "<br>";
  }

  function getWordForms($n){
    $r=$n%10;
    $d=(int)($n/10);
    if($d==1 || $d%10==1)
      $i=0;
    else{
      switch($r){
        case 0:$i=0;break;
        case 1:$i=1;break;
        case 2:case 3:case 4:$i=2;break;
        default:$i=0;
      }
    }

    return $i;
  }
?>