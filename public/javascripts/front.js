$(function(){
  // FRONT PAGE JS FOR SIGNIN SIGNUP
  $(".signin").click(function(e) {
    $("#signin_box").modal({modal:true,
                            overlayClose:true});
    $("#session_email").focus();
    return false;
  });
  
  $(".signup").click(function(e) {
    $("#signup_box").modal({modal:true,
                            overlayClose:true});
    $("#user_name").focus();
    return false;
  });
});
