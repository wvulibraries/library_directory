// Remove Fields from View
$('form').on('click', '.remove-fields', function(event) {
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
  event.preventDefault()
});

// Add Fields into View 
$('form').on('click', '.add-fields', function(event) {
  var time = new Date().getTime();
  var regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  event.preventDefault();
});
