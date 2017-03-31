
javascript:(
  function(){
    var COLOR="#ffffff";
    var sel=0;
    var a=document.getElementsByName('t');
    var n = prompt("Number of last unread mails", "10");
    n=parseInt(n);
    var len=a.length-1;
    for(var i=len;i>0;i--){
      var tr=a[i].parentElement.parentElement;
      var bg=tr.getAttribute("bgcolor").toLowerCase();
      if(bg==COLOR){
        a[i].checked=!a[i].checked;
        sel++;
        if(sel==n) break;
      }
    }
  }
)()

javascript:(function(){var COLOR="#ffffff"; var sel=0; var a=document.getElementsByName('t'); var n = prompt("Number of last unread mails", "10"); n=parseInt(n); var len=a.length-1; for(var i=len;i>0;i--){var tr=a[i].parentElement.parentElement; var bg=tr.getAttribute("bgcolor").toLowerCase(); if(bg==COLOR){a[i].checked=!a[i].checked; sel++; if(sel==n) break; } } } )()
