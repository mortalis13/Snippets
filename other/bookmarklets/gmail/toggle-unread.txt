
javascript:(
  function(){
    var COLOR="#ffffff";
    var a=document.getElementsByName('t');
    for(var i in a){
      var tr=a[i].parentElement.parentElement;
      var bg=tr.getAttribute("bgcolor").toLowerCase();
      if(bg==COLOR)
        a[i].checked=!a[i].checked;
    }
  }
)()

javascript:(function(){var COLOR="#ffffff"; var a=document.getElementsByName('t'); for(var i in a){var tr=a[i].parentElement.parentElement; var bg=tr.getAttribute("bgcolor").toLowerCase(); if(bg==COLOR) a[i].checked=!a[i].checked; } } )()
