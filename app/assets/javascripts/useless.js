$(document).on("page:load ready",function(){
    $(".container").fadeIn()
    $("#about li").each(function(i){
        $(this).delay((i++) * 700).fadeTo(1000, 1);
    })
})
