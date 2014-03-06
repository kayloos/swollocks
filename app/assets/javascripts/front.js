$(function(){
  // FRONT PAGE JS FOR SIGNIN SIGNUP
  $(".signin").click(function(e) {
    $("#signin_box").modal({
      modal:true,
      overlayClose:true,
      overlayCss: {backgroundColor:"#000"},
      opacity: 60,
    });
    $("#session_email").focus();
    return false;
  });
  
  $(".signup").click(function(e) {
    $("#signup_box").modal({
      modal:true,
      overlayClose:true,
      overlayCss: {backgroundColor:"#000"},
      opacity: 60,
    });
    $("#user_name").focus();
    return false;
  });
});
