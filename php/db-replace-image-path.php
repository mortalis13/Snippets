<?php

$newPath="images/news/";

define("DB_DSN","mysql:host=localhost;dbname=test;charset=utf8");
define("DB_USERNAME","root");
define("DB_PASSWORD","");

try {
  $conn=new PDO(DB_DSN,DB_USERNAME,DB_PASSWORD);
} catch (PDOException $e) {
  print "Error!: " . $e->getMessage() . "<br/>";
  die();
}

$conn->setAttribute(PDO::ATTR_EMULATE_PREPARES,false);
$conn->query("SET NAMES 'utf8'");

$table='test_table';

$sql="select image from ".$table;
$st=$conn->query($sql);
$list=$st->fetchAll();

echo "DB: test <br>table: test_table <br>field: image";
var_dump($list);

$sql="update ".$table." set image=:newImage where image=:oldImage";
$st=$conn->prepare($sql);

foreach($list as $row){
  $newImage=$newPath.basename($row['image']);             // basename() - image name
  $oldImage=$row['image'];
  
  $st->bindValue("newImage", $newImage);
  $st->bindValue("oldImage", $oldImage);
  $st->execute();
}

echo 'Image paths renamed.';

?>