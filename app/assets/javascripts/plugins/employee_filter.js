$( document ).on('turbolinks:load', function() {
  if($('#employee_filter').length){
    $('#employee_filter').keyup(function(e) { 
      searchTerm = $(this).val().toLowerCase(); 
      compareEmployee(searchTerm);
    });
  }
}); 

function compareEmployee(searchTerm){ 
  $('.employee-list').each(function(){
    var searchText = $(this).find('.keywords').text().toLowerCase();
    if(searchText.indexOf(searchTerm) === -1){
      $(this).hide(); 
    } else { 
      $(this).show(); 
    }
  });
}