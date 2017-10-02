
// get names for presets on page to a modal
javascript:(function(){
  var res = '';
  var titles = $('.title');
  titles.each(function(id, item){
    var url = item.innerText;
    res += url + '\n';
  });
  
  var modalInner = '<textarea id="out-text" style="width: 100%; box-sizing: border-box; height: 400px; resize: both; font-family: consolas;"></textarea>';
  var modalContent = '<div class="modal-content" style="background-color: #fefefe; margin: auto; padding: 20px; border: 1px solid #888; width: 70%;">'+ modalInner + '</div>';
  var modalHTML = '<div id="inject-modal" class="inject-modal" style="display: none; position: fixed; z-index: 10000; padding-top: 10px; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: #55555580;">' + modalContent + '</div>';

  var modalDiv=document.createElement("div");
  modalDiv.id = "inject-modal-parent";
  modalDiv.innerHTML = modalHTML;
  document.body.appendChild(modalDiv);
  
  function hideModal(){
    var modal = document.getElementById('inject-modal');
    var modalParent = document.getElementById('inject-modal-parent');
    modal.style.display = "none";
    modalParent.parentNode.removeChild(modalParent);
  }
  
  var modal = document.getElementById('inject-modal');
  window.onclick = function(event) {
    if (event.target == modal) {
      hideModal();
    }
  };
  
  modal.onkeypress = function(e){
    if(e.keyCode == 27){
      hideModal();
    }
  };
  
  modal.style.display = "block";
  
  var outText = $("#out-text");
  outText.html(res);
  outText.focus();
  outText[0].setSelectionRange(0, 0);
})()



// get links for presets pages in a modal
javascript:(function(){
  var res = '';
  var titles = $('.title');
  titles.each(function(id, item){
    var url = item.href;
    res += url + '\n';
  });
  
  var modalInner = '<textarea id="out-text" style="width: 100%; box-sizing: border-box; height: 400px; resize: both; font-family: consolas;"></textarea>';
  var modalContent = '<div class="modal-content" style="background-color: #fefefe; margin: auto; padding: 20px; border: 1px solid #888; width: 70%;">'+ modalInner + '</div>';
  var modalHTML = '<div id="inject-modal" class="inject-modal" style="display: none; position: fixed; z-index: 10000; padding-top: 10px; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: #55555580;">' + modalContent + '</div>';

  var modalDiv=document.createElement("div");
  modalDiv.id = "inject-modal-parent";
  modalDiv.innerHTML = modalHTML;
  document.body.appendChild(modalDiv);

  function hideModal(){
    var modal = document.getElementById('inject-modal');
    var modalParent = document.getElementById('inject-modal-parent');
    modal.style.display = "none";
    modalParent.parentNode.removeChild(modalParent);
  }
  
  var modal = document.getElementById('inject-modal');
  window.onclick = function(event) {
    if (event.target == modal) {
      hideModal();
    }
  };
  
  modal.onkeypress = function(e){
    if(e.keyCode == 27){
      hideModal();
    }
  };
  
  modal.style.display = "block";
  
  var outText = $("#out-text");
  outText.html(res);
  outText.focus();
  outText[0].setSelectionRange(0, 0);
})()



// get session key from cookie
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

