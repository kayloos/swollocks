$(function() {

  $(".signin").click(function(e) {
    e.preventDefault();
    $("#login_box").fadeIn(400);
    $("#box_focus").fadeIn(400);
  });
  
  $("#box_focus").click(function() {
    $("#login_box").fadeOut(200);
    $(this).fadeOut(200);
  });

  var resizeBox = function() {
    $("#box_focus").height( $(window).height() );
  }
  resizeBox();
  $(window).resize(resizeBox);

});
