$( document ).ready(function(){
    $('.flexslider').flexslider();

    $("ul.names-list").on("click", "li:not(.active-tab)", function() {
        $(this)
            .addClass("active-tab")
            .siblings()
            .removeClass("active-tab")
            .closest(".tabs-section")
            .find("li.tab-content")
            .removeClass("active-tab-content")
            .eq($(this).index())
            .addClass("active-tab-content");
    });
});
