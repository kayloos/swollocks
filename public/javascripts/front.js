$(function(){
  // FRONT PAGE JS FOR SIGNIN SIGNUP
  $(".signin").click(function(e) {
    e.preventDefault();
    $("#signin_box").fadeIn(400,function(){
      $("#session_email").focus();
    });
    $("#box_focus").fadeIn(400);
  });
  
  $(".signup").click(function(e) {
      e.preventDefault();
      $("#signup_box").fadeIn(400, function(){
        $("#user_name").focus();
      });
      $("#box_focus").fadeIn(400);
    });
  
  // Mask box when fading the background to black (with opacity)
  $("#box_focus").click(function() {
    $("#signin_box").fadeOut(200);
    $("#signup_box").fadeOut(200);
    $(".trade").fadeOut(200);
    $(this).fadeOut(200);
  });
  
  var resizeBox = function() {
    $("#box_focus").height("100%");
  };
  resizeBox();
  $(window).resize(resizeBox);
});
