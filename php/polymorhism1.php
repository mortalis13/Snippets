<?php

interface Shape{
  public function getArea();
}

class Square implements Shape{
  private $width;
  private $height;

  public function __construct($width,$height){
    $this->width=$width;
    $this->height=$height;
  }

  public function getArea(){
    return $this->width * $this->height;
  }
}

class Circle implements Shape{
  private $radius;

  public function __construct($radius){
    $this->radius=$radius;
  }

  public function getArea(){
    return 3.14 * $this->radius * $this->radius;
  }
}

function calculateArea(Shape $shape){
  return $shape->getArea();
}

$square=new Square(5,5);
$circle=new Circle(7);

echo calculateArea($square),"<br/>";
echo calculateArea($circle);
?>