
// extract table content from wikipedia
// https://en.wikipedia.org/wiki/Supernatural_(season_1)


var firstRow = true;
var res = '';

$('table.wikitable tr').each(function(id){
	if(id != 0){
		if(firstRow){
			res += '_EPISODE_ ';
			
			var title = '';
			$(this).find('td').each(function(id1){
				title += $(this).text() + ' - ';
			});
			
			title = title.replace(/\n/g, ' ');
			title = title.replace(/ - $/, '')
			res += title + '\n';
			
			firstRow = false;
		}
		else{
			res += $(this).text() + '\n';
			
			firstRow = true;
		}
	}
})

console.log('\n\n-----');
console.log(res);
