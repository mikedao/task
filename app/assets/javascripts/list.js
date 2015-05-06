
$(document).ready(function() {
  $("#myTable").tablesorter();

function Show_Div() {
  var inactive = $("#inactive");
if (false == $("#inactive").is(':visible')) {
    $("#inactive").show();
  }
  else {
    $("#inactive").hide();
  }
}
$("#hide-button").on("click", Show_Div);
});
