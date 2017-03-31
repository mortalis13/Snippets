$(function(){
		var path,host,fragment,containerSelector,
		
		initialPath="file:///d:/Documents/2-down/sites/jquery/help2-1/www.wisdomweb.ru/HTML/html-first.php",
		initialContainerSelector=".bodyleft",
		
		links=[],openedWindows=[],
		start,maxLinks,
		finished,lastLinks,enterPressed=false
		initialMaxLinks=20
		
		$("#maxLinks").change(function(){
			if(!enterPressed) setMaxLinks()
			else enterPressed=false
		})
		$("#maxLinks").keypress(function(e){
			if(e.keyCode==13&&!$("#open").attr("disabled")){
				enterPressed=true
				setMaxLinks()
				$("#open").click()
			}
		})
		
		$("#load").click(function(){
			$("#status").css({"border-bottom":"1px solid","border-top":"1px solid","width":500})
			$("#status").html("The page is loading...")
			
			path=$("#pagePath").val()
			host=path.substr(0,path.lastIndexOf("/")+1)
			containerSelector=$("#containerSelector").val()
			fragment=" "+containerSelector
			
			$("#loadedContent").load(path+fragment,function(data,status){
				if(status=="success"){
					initLoad()
					var container=$(containerSelector,"#loadedContent")
					var a=$("a",container)
					a.each(function(i){
						links.push($(this).attr("href"))
						$("#links").append("<br>"+links[i])
					})
					
					$("#open").button("option","disabled",false)
					$("#close").button("option","disabled",false)
					
					$("#status").html("The page was loaded successfully")
					$("#status").append(" (Total links: <b>"+links.length+"</b>)")
				}
				else if(status=="error")
					$("#status").html("An error occured during the loading!<br>Please check if the filename is correct")
			})
			$("#maxLinks").focus()
		})
		
		$("#open").click(function(){
			openedWindows.length=0
			var end=start+maxLinks
			if(end>links.length) end=links.length
			
			var linksLeft=links.length-end
			for(var i=start;i<end;i++)
				openedWindows.push(window.open(host+links[i],"_blank"))
			
			if(end==links.length){
				finished=true
				$("#open").attr("value","Open-"+maxLinks)
				$("#open").attr("disabled",true)
				$("#close").attr("value","Close-"+(links.length-start))
			}
			else if(end+maxLinks>links.length)
				$("#open").attr("value","Open-"+linksLeft)
			start=i
			$("#status").html("Total links: <b>"+links.length+"</b>"+"<br>Links left: <b>"+linksLeft+"<b>")
		})	
		
		$("#close").click(function(){
			for(i in openedWindows) openedWindows[i].close()
			if(finished){
				$("#close").attr("value","Close-"+maxLinks)
				$("#close").attr("disabled",true)
			}
		})	
		
// ************************************ ********************************** *********************************** ************************
		
		function setMaxLinks(){
			maxLinks=parseInt($("#maxLinks").val())
			$("#open").attr("value","Open-"+maxLinks)
			$("#close").attr("value","Close-"+maxLinks)
		}
		
		function initLoad(){
			start=0
			links.length=0
			openedWindows.length=0
			finished=false
			lastLinks=0
			
			$("#loadedContent").css("display","none")
			$("#open").button("option","disabled",true)
			$("#close").button("option","disabled",true)
			$("#links").html("")
		}
		
		function init(){
			$("#maxLinks").val(initialMaxLinks)
			setMaxLinks()
			
			$("#pagePath").val(initialPath)
			$("#containerSelector").val(initialContainerSelector)
			
			$("#pagePath").focus()
			$(":text").focus(function(){$(this).select()})
			$(":button").button()
		}
		
		init()
		initLoad()
	})