javascript:(function(){
  
  var modalInner = '<textarea id="out-text" style="width: 100%; box-sizing: border-box; height: 400px; resize: both; font-family: consolas;"></textarea>';
  var modalContent = '<div class="modal-content" style="background-color: #fefefe; margin: auto; padding: 20px; border: 1px solid #888; width: 70%;">'+ modalInner + '</div>';
  var modalHTML = '<div id="inject-modal" class="inject-modal" style="display: none; position: fixed; z-index: 10000; padding-top: 10px; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: #55555580;">' + modalContent + '</div>';

  var modalDiv=document.createElement("div");
  modalDiv.id = "inject-modal-parent";
  modalDiv.innerHTML = modalHTML;
  document.body.appendChild(modalDiv);

  var modal = document.getElementById('inject-modal');
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
      var modalParent = document.getElementById('inject-modal-parent');
      modalParent.parentNode.removeChild(modalParent);
    }
  };
  
  modal.style.display = "block";

  function getSOMarkdown(id_question){
    var url = 'http://api.stackexchange.com/2.2/questions/' + id_question + '?order=desc&sort=activity&site=stackoverflow&filter=!9YdnSJ*_T';
    $.get(url, function(data){
      var outText = $("#out-text");
      outText.html(data.items[0].body_markdown);
      outText.focus();
      outText[0].setSelectionRange(0, 0);
    });
  };

  var id_question = location.href.match(/questions\/(.+?)\//)[1];
  getSOMarkdown(id_question);
  
})()