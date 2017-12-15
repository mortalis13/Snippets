var urls=['url1', 'url2'];

function ajax(url, resolve) {
  var req = new XMLHttpRequest();
  req.open('GET', url);

  req.onload = function() {
    if (req.status == 200) resolve(req.response, url);
    else console.error('Status error', req.status, req.statusText);
  };

  req.onerror = function(error) {
    console.error('Send Error:', error);
  };

  req.send();
}

for (var url of urls) {
  ajax(url, function(data, in_url){
    var div = document.createElement('div');
    div.innerHTML = data;
    var link = div.querySelector('.InstallButton-button');
    if (link && link.href) console.log(link.href);
    if (!link.href) console.log('--'+in_url);
  });
}
