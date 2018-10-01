// Remove Fields from View
$(document).on('click', '.remove-fields', function(event) {
  event.preventDefault();
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
});

// Add Fields into View 
$(document).on('click', '.add-fields', function(event) {
  event.preventDefault();
  var time = new Date().getTime();
  var regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
});
