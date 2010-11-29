jQuery.fn.dataTableExt.oSort['percent-asc']  = function(a,b) {
	var x = (a == "-") ? 0 : a.replace( /%/, "" );
	var y = (b == "-") ? 0 : b.replace( /%/, "" );
	x = parseFloat( x );
	y = parseFloat( y );
	return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};

jQuery.fn.dataTableExt.oSort['percent-desc'] = function(a,b) {
	var x = (a == "-") ? 0 : a.replace( /%/, "" );
	var y = (b == "-") ? 0 : b.replace( /%/, "" );
	x = parseFloat( x );
	y = parseFloat( y );
	return ((x < y) ?  1 : ((x > y) ? -1 : 0));
};
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
    $(".trade").fadeOut(200);
    $(this).fadeOut(200);
  });

  var resizeBox = function() {
    $("#box_focus").height( $(window).height() );
  }
  resizeBox();
  $(window).resize(resizeBox);


  $(".plus, .minus").click(function(e){
    var trade = $(this).siblings(".trade");
    $("#box_focus").fadeIn(400);
    $.get(this.href, function(data) {
      trade.html(data);
      $("#new_stock, .edit_stock").submit(function(){
        trade.fadeOut(200);
        $("#box_focus").fadeOut(200);
      });
    });
    trade.fadeIn(400);
    return false;
  });

  $("#quotes_table").dataTable({
		"sPaginationType": "full_numbers",
    "aoColumns": [
      null, null, null,
      { "sType": "percent" }, null, null
    ]
	});

});
