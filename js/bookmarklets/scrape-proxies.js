
// https://free-proxy-list.net

javascript:(function(){
  var qq='';
  $('#proxylisttable tr').each((a,b) => {
    var tds=$(b).find('td');
    if (tds.length) qq += '\'' + tds[0].textContent.trim() + ':' + tds[1].textContent.trim() + '\',\n';
  });
  qq;
})()