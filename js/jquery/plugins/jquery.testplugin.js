/*
	Prints log information about selected element tag and its index from matched elements
	Example: $("div").infoOnClick()
*/

jQuery.fn.infoOnClick = function() {
    return this.each(function(id) {
		$(this).click(function(){
			console.log('Selected Element: \'' + $(this).attr("tagName").toLowerCase() +id+'\'');
		})
    });
};