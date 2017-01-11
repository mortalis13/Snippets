
// Get elements attributes/text by a selector and put it into a textarea at the end of the page
// Copy the one-line code to the console of the current page


// ------------ 1 -----------

var res='';
$('.dir').each(function(id,item){
  res += item.href + '\n'
});
var tl=$('<textarea>').text(res);
$(document.body).prepend(tl);

var res='';$('.dir').each(function(id,item){res += item.href + '\n'});var tl=$('<textarea>').text(res);$(document.body).prepend(tl);


// ------------ 2 -----------

var id='highlighter_287703';
var res='';jQuery('#' + id + ' .line').each(function(id,item){
  res += jQuery(item).find('.content').text() + '\n';
});
var tl=jQuery('<textarea>').text(res);
jQuery(document.body).prepend(tl);
