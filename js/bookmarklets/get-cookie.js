javascript:(function(){
  cookie_name = 'fmic_session';
  
  function getCookie(cookie_name){
    var res;
    
    var cookies = document.cookie.split(';');
    cookies.forEach(function(item, id){
      item = item.trim();
      var parts = item.split('=');
      var name = parts[0];
      var value = parts[1];
      
      if(parts && parts.length == 2 && name == cookie_name){
        res = value;
        return false;
      }
    });
    
    return res;
  }
  
  var cookie_value = getCookie(cookie_name);
  prompt('', cookie_value);
})()