//Override the default confirm dialog by rails
$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}

//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}

//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  swal({
    title: message,
    text: "This cannot be undone!",
    type: 'warning',
    confirmButtonText: 'Yes',
    confirmButtonColor: '#53ce70',
    showCancelButton: true
  }).then(function(e){
    $.rails.confirmed(link);
  });
};
