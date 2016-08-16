$(function(){
  
  function makeFileLink(text){
    var data = new Blob([text], {type: 'text/plain'})
    var textFile = URL.createObjectURL(data)
    return textFile
  }
  
	function downloadTextFile(text,type){
    if(!type) type='txt'
      
		var ref=makeFileLink(text)
		var link=document.createElement("a")
		link.href=ref
		link.download="test-doc."+type
		link.style.display="none"
		document.body.appendChild(link)
		link.click()
	}
  
  function processHTML(div){
    items=$(".app-item",div)
    
    items.each(function(id,item){
      var item,imageLink,nameLink,nameLink,name
      
      item=$(item)
      imageLink=$(".item-link a",item)
      nameLink=$(".app-name a",item)
      
      name=nameLink.html()
      
      imageLink.attr("title",name)
      nameLink.attr("title",name)
    })
  }
  
	$("#getFile").click(function(){
    var url='test.html'
    
		$.get(url,function(data){
      var div,items,result
      div=$("<div>").html(data)
// ------------------------------------------------------------ customization --------
      processHTML(div)
// -----------------------------------------------------------------------------------
      result=div.html()
      downloadTextFile(result,'html')
    },
    "html")
    
	})
}) 
