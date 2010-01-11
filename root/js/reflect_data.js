$(function(){
  $('#testButton').click(function(){
    $.get(
      '/boots/get_data',
      {a:1, b:2, c:3},
      function(data) { alert(data); }
    );
  });
});
