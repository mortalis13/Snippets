var found_list = [];
var num = gBrowser.browsers.length;
for (var i = 0; i < num; i++) {
  var b = gBrowser.getBrowserAtIndex(i);
  var text=b.contentWindow.document.body.textContent;
  var p = /amp|metal/gim;
  var res = p.exec(text);
  if(res != null){
    found_list.push(b.contentWindow.location.href);
  }
}
for(var e of found_list){
  console.log(e);
}
