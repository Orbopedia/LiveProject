$('.button-collapse').sideNav({
  edge: 'left',
  // closeOnClick: true,
  draggable: true
});
$('textarea').characterCounter();
$('select').material_select();
$('.collapsible').collapsible();

function add_file(){
  $("#file_div").append("<div class='w3-animate-top'>" +
  		"<div class='input-field col s12'>" +
  		"<p>Add Place to visit:</p>" +
  		"<input type='text' placeholder='describe image' class='validate' name='VisitText'>" +
  		"<textarea class='materialize-textarea' data-length='500' name='VisitTextData' placeholder='Info about place'></textarea>" +
  		"</div>" +
  		"<input type='file' name='VisitImage' style='padding-left: 10px;'>" +
  		"<button type='button' class='w3-button waves-effect waves-light teal white-text hide-on-small-only' onclick='add_file();'>Add more</button>" +
  		"<button type='button' class='w3-button waves-effect waves-light teal white-text hide-on-med-and-up' style='margin-top: 20px; margin-left:10px;' onclick='add_file();'>Add more</button>" +
  		"<button type='button' class='w3-button waves-effect waves-light teal white-text hide-on-small-only' onclick='remove_file(this);'>Remove</button>" +
  		"<button type='button' class='w3-button waves-effect waves-light teal white-text hide-on-med-and-up right' style='margin-top: 20px;' onclick='remove_file(this);'>Remove</button>");
}
function remove_file(ele){
  $(ele).parent().remove();
}
