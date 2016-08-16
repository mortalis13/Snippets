<?php
  interface RemoteControl{
    public function volumeUp();
  }

  class Channel implements RemoteControl{
    public function volumeUp(){
      return "Increase volume by 1";
    }
  }

  class Menu implements RemoteControl{
    public function volumeUp(){
      return "Go to submenu";
    }
  }

  function volumeUp(RemoteControl $environmentType){
    return $environmentType->volumeUp();
  }

  $channel=new Channel;
  $menu=new Menu;

  echo "In context of TV channel the \"VolumeUp\" button performs action: <br /><b>".volumeUp($channel)."</b>";
  echo "<br>";
  echo "<br>";
  echo "In context of TV menu the \"VolumeUp\" button performs action: <br /><b>".volumeUp($menu)."</b>";
?>