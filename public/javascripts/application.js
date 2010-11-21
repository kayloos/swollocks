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
  $(".plus").click(function(e){
    var plus = $(this);
    $.ajax({
      url: this.href,
      type: 'post',
      dataType: 'script',
      data: { '_method': 'create' },
      success: function(){
        plus.html(' ');
      }
    });
    return false;
  });

  $(".minus").click(function(e){
    var minus = $(this)
    $.ajax({
      url: this.href,
      type: 'post',
      dataType: 'script',
      data: { '_method': 'delete' },
      success: function(){
        minus.html(' ');
      }
    });
    return false;
  });

  $("#quotes_table").dataTable({
		"sPaginationType": "full_numbers"
	});

});
