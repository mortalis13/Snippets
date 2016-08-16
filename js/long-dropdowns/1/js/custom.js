
var maxHeight = 400;
var cellHeight=58

$(function(){
    $("#up").click(function() {
       var $container =$(".dropdown > li"),
       $list = $container.find("ul"),
       $anchor = $container.find("a")

       $anchor.addClass("hover");

        var top=parseInt($list.css("top"))
        $list.css({
          top:top-cellHeight
        })
    })

    $("#down").click(function() {
        var $container =$(".dropdown > li"),
        $list = $container.find("ul"),
        $anchor = $container.find("a")

        $anchor.addClass("hover");

         var top=parseInt($list.css("top"))
         $list.css({
           top:top+cellHeight
         })
    })
});



