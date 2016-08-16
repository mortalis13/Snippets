<?php
  abstract class Par{
    protected $ch;

    public function __construct($a,$b){
      $this->ch=$this->m($a,$b);
    }

    public function check(){
        return $this->ch;
    }

    abstract protected function m($a,$b);
  }

  class A extends Par{
    public function __construct($a,$b){
      parent::__construct($a,$b);
    }

    protected function m($a,$b){
      return $a*$b;
    }
  }

  class B extends Par{
    public function __construct($a,$b){
      parent::__construct($a,$b);
    }

    protected function m($a,$b){
      return $a+$b;
    }
  }

  $x1=3;
  $x2=5;

  $a=new A($x1,$x2);
  $b=new B($x1,$x2);

//  echo $a->m($x1,$x2);
//  echo "<br>";
//  echo $b->m($x1,$x2);

  echo $a->check();
  echo "<br>";
  echo $b->check();
?>