$(function() {
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
  
  $("#box_focus").click(function() {
    $("#signin_box").fadeOut(200);
    $("#signup_box").fadeOut(200);
    $(this).fadeOut(200);
  });

  var resizeBox = function() {
    $("#box_focus").height( $(window).height() );
  }
  resizeBox();
  $(window).resize(resizeBox);

// STOCK TABLE JS
  $("#portfolios th a, #portfolios .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });

  $("#portfolios_search").keyup(function () {
    $.get($("#portfolios_search").attr("action"), $("#portfolios_search").serialize(), null, "script");
    return false;
  });

});
