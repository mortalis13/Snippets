
$(function(){
	var lines=[]
	var separatorNodes=["br","hr"]
	var blockNodes=["p","div","h1","h2","h3","h4","h5","h6",
					"ol","ul","li","pre","address","blockquote","dl","fieldset","form","table","td","tr","th",
					"article","aside","footer","header","hgroup","output","section","tfoot"]
	var otherTags=["script","button","bdi","bdo","input","textarea","select",
			"img","noscript","audio","video","canvas","svg","iframe","frame","link","style"]
	
	function getLines(node){
		var lidx=-1
		lines.length=0
		addLine()
		
		function sumText(node){
			var type=node.nodeType
			var blockNode=false,separatorNode=false
			
			if(type==3){
				var text=node.nodeValue
				text=text.replace(/\n/g," ")
				
				var tmp=text.replace(/\s+/g,"")
				if(!tmp.length) return
				
				lines[lidx].text+=text
				lines[lidx].nodes.push({node:node,len:text.length})
			}
			else if(checkNode(node)){
				var tag=getTag(node)
				blockNode=isBlockNode(node)
				separatorNode=isSepartor(node)
				
				if(separatorNode || blockNode) addLine()
				if(separatorNode) return
				for(var i=0;i<node.childNodes.length;i++)
					sumText(node.childNodes[i])
				if(blockNode) addLine()
			}
		}
		sumText(node)
		
		function addLine(){
			if(lines[lidx] && !lines[lidx].nodes.length) lidx--
			lines[++lidx]={text:"",nodes:[]}
		}
		
		var text=""
		for(var l in lines)
			text+=lines[l].text+"\n"
		return text
		
		return lines
	}
	
	function isBlockNode(node){
		var tag=getTag(node)
		if(tag){
			for(var t of blockNodes)
				if(tag==t) return true
		}
		return false
	}
	
	function isSepartor(node){
		var tag=getTag(node)
		if(tag){
			for(var t of separatorNodes)
				if(tag==t) return true
		}
		return false
	}
	
	function getTag(node){
		var tag=node.tagName
		if(tag) tag=tag.toLowerCase()
		return tag
	}
	
	function checkNode(node){
		if(node.nodeType==8) return false
		var tag=getTag(node)
		if(tag){ 
			for(var t of otherTags)
				if(tag==t) return false
		}
		return true
	}
	
	function printResult(text){
		var div=$("<div>").html(text)
		div.css({"border":"1px solid","padding":"10px","width":"90%","margin":"10px auto"})
		div.appendTo("body")
	}
	
	function downloadTextFile(text){
		var ref=makeFileLink(text)
		var link=document.createElement("a")
		link.href=ref
		link.download="test-doc.txt"
		link.style.display="none"
		document.body.appendChild(link)
		link.click()
	}
	
	function makeFileLink(text){
		var data = new Blob([text], {type: 'text/plain'})
		var textFile = URL.createObjectURL(data)
		return textFile
	}
	
	$("#getText").click(function(){
		var text=getLines(document.body)
		downloadTextFile(text)
	})
}) 
