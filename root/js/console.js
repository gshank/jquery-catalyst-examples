// console functions
$(function(){
  $('#goodButton').click(function(){
    $.get('/ajia/get_data');
  });
  $('#badButton').click(function(){
    $.get('/ajia/return_error');
  });
  $('#successDisplay').ajaxSuccess(function(info){
    $(info.target)
      .append('<div>Success at '+new Date()+'</div>');
  });
  $('#errorDisplay').ajaxError(function(info,xhr){
    $(info.target)
      .append('<div>Failed at '+new Date()+'</div>')
      .append('<div>Status: ' + xhr.status + ' ' +
              xhr.statusText+'</div>');
  });
});
