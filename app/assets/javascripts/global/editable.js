
$(document).ready(function() {
  
  $('[data-editable-inline]').editable({
    mode: 'inline',
    ajaxOptions: {type: "PUT"},
    display: function(value, response) {
      return false;   //disable this method
    },
    success: function(response, newValue) {
      if(response.status == 'error') return response.message; //msg will be shown in editable form
      if($(this).attr('formatter') == 'f_money'){
        $(this).html( f_money(newValue) );
      }


    },
    error: function(response, newValue) {
      return response.message;
    }
  });


  function f_money(value) {
    return ('$' + value)
  }
  
});