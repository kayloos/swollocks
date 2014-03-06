//= require jquery
//= require jquery-ui
//= require jquery.dataTables
//= require jquery.jgrowl_minimized.js
//= require jquery.simplemodal
//= require rails
//= require front


jQuery.fn.dataTableExt.oSort['percent-asc']  = function(a,b) {
  var x = (a == "-") ? 0 : a.replace( /%/, "" );
  var y = (b == "-") ? 0 : b.replace( /%/, "" );
  x = parseFloat( x );
  y = parseFloat( y );
  x = x == x ? x : -100;
  y = y == y ? y : -100;
  return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};

jQuery.fn.dataTableExt.oSort['percent-desc'] = function(a,b) {
  var x = (a == "-") ? 0 : a.replace( /%/, "" );
  var y = (b == "-") ? 0 : b.replace( /%/, "" );
  x = parseFloat( x );
  y = parseFloat( y );
  x = x == x ? x : -100;
  y = y == y ? y : -100;
  return ((x < y) ?  1 : ((x > y) ? -1 : 0));
};

$(function() {
  $.jGrowl.defaults.position = 'center';
  $.jGrowl.defaults.life = 8000;
});
