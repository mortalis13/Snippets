
// Get elements attributes/text by a selector and put it into a textarea at the end of the page
// Copy the one-line code to the console of the current page

var res='';
$('.dir').each(function(id,item){
  res += item.href + '\n'
});
var tl=$('<textarea>').text(res);
$(document.body).append(tl);

var res='';$('.dir').each(function(id,item){res += item.href + '\n'});var tl=$('<textarea>').text(res);$(document.body).append(tl);
