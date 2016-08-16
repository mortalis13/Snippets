
$(function(){
  var pad='  ',
  sep='\n',
  delim=' --- '
  
  var tableStyle='\n\
  table{ \n\
    width: 50%; \n\
    margin: 2em auto; \n\
    border-collapse: collapse; \n\
    font-size:0.9rem; \n\
    border-spacing: 0; \n\
    table-layout:fixed; \n\
    word-break: break-all; \n\
  } \n\
  table th{ \n\
    font-weight: bold; \n\
  } \n\
  table th, \n\
  table td{ \n\
    padding:1rem; \n\
    border:1px solid #888; \n\
  } \n\
'
  
  function readfile(f, callback) {                      // read text file
    var reader = new FileReader(); 
    reader.readAsText(f);          
    
    reader.onload = function() {    
      var result=reader.result;   
      callback(result)
    }
    reader.onerror = function(e) {  
      console.log("Error", e);    
    };
  }
  
  function makeFileLink(text){
    var data = new Blob([text], {type: 'text/plain'})
    var textFile = URL.createObjectURL(data)
    return textFile
  }
  
  function downloadTextFile(text,type){                   // download as 'text/html'
    if(!type) type='txt'
    var name="result-doc."
      
    var ref=makeFileLink(text)
    var link=document.createElement("a")
    link.href=ref
    link.download=name+type
    link.style.display="none"
    document.body.appendChild(link)
    link.click()
  }
  
  function getChecked(name) {                             // get option that is checked
    var retId
    var option=$("input[name="+name+"]")
    
    if(option){
      option.each(function(id,item){
        if(item.checked){
          retId=item.id
          return false
        }
      })
    }
    return retId
  }
  
  function wrapCell(text){
    return pad+'<td>'+text+'</td>'+sep
  }
  
  function wrapRow(row){
    return '<tr>'+sep+row+'</tr>'+sep
  }
  
  function formatTable(table){                                // set line breaks
    table.prepend('\n')
    table.append('\n')
    table.find('tbody').prepend('\n')
    return table
  }
  
  function getTableMarkup(table){                           // append style and line breaks
    var style,result
    
    tableStyle=tableStyle.replace(/ \n/g,'\n')
  
    style=$('<style>').html(tableStyle)
    result=$('<div>')
    result.append(style)
    result.append('\n\n')
    result.append(table)
    result=result.html()
    return result
  }
  
  function processFile(data){
    var lines=data.split('\r\n')                              // '\r\n' or '\n'
    var result=[]
    
    var table
    var line,key,value,row
    
    $('table.result').remove()
    table=$('<table class="result">')
    
    lines.forEach(function(item){
      line=item.trim().split(delim)                           // split each line with the delimiter
      key=line[0]
      value=line[1]
      
      key=wrapCell(key)
      value=wrapCell(value)
      row=key+value
      
      table.append(wrapRow(row))
    })
    table=formatTable(table)
    
    var checked=getChecked('output')
    if(checked=='downloadFile'){                              // download as 'result-doc.html' with style and markup
      var result=getTableMarkup(table)
      downloadTextFile(result,'html')
      // return
    }
    
    $('body').append(table)
  }
  
	$("#buildTable").click(function(){                          // button click
    var checked=getChecked('input')
    
    if(checked=='uploadFile'){                                // get external file
      var file=$('#f')[0].files[0]
      readfile(file, function(data){
        processFile(data)
      })
      return
    }
    
    var url='text.txt'                                        // load local file
		$.get(url,function(data){
      processFile(data)
    },
    "html")
    
	})
}) 
