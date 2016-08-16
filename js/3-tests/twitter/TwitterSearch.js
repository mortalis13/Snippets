
window.addEventListener("load", function() {       
  var origin = "*";                               
  var gadget = "TwitterSearch.html";      
  var iframe = document.createElement("iframe"); 
  iframe.src = gadget;                          
  iframe.width = "40%";                          
  iframe.height = "300";
  iframe.style.marginRight="1em"                        
  iframe.style.cssFloat = "right";               

  document.body.insertBefore(iframe, document.body.firstChild);
  
  // var links = document.getElementsByTagName("a");
  // for(var i = 0; i < links.length; i++) {
  //     links[i].addEventListener("mouseover", function() {
  //         iframe.contentWindow.postMessage(this.href, origin);
  //     }, false);
  // }
	
	document.getElementById("b").onclick=function(){
		text=document.getElementById("t").value
		iframe.contentWindow.postMessage(text, "*");
	}
	
}, false);
