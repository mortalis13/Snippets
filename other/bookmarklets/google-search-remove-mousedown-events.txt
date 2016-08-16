
javascript:(function(){
  var a=document.querySelectorAll('a');
  for(var i in a){
    if(a[i].getAttribute("onmousedown")!==null)
      a[i].setAttribute("onmousedown","");
  }
})()

javascript:(function(){var a=document.querySelectorAll('a'); for(var i in a){if(a[i].getAttribute("onmousedown")!==null) a[i].setAttribute("onmousedown",""); } })()
