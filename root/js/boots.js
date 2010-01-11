
// Idiom used to define jQuery plugins in a portable way
// which guarantees that within this block, "$" refers to jQuery
// (function($){
(function($) {
   // Create a jQuery "command" (plugin) to empty the select list
  $.fn.emptySelect = function() {
    // "this" is the matched set
    return this.each(function(){
      // "this" is the individual element
      if (this.tagName=='SELECT') this.options.length = 0;
    });
  }

  // Create a jQuery "command" to load a select list
  $.fn.loadSelect = function(optionsDataArray) {
    return this.emptySelect().each(function(){
      if (this.tagName=='SELECT') {
        // create variable for "this" to allow access
        // in "each" loop, which has a different "this"
        var selectElement = this;
        // this "each" is the utility "each", not the core "each"
        $.each(optionsDataArray,function(index,optionData){
          var option = new Option(optionData.caption,
                                  optionData.value);
          if ($.browser.msie) {
            selectElement.add(option);
          }
          else {
            selectElement.add(option,null);
          }
        });
      }
    });
  }
  // Termifier function
  $.fn.termifier = function(options) {
    // Merge options with defaults
    options = $.extend({
      // the URL to get a term definition
      lookupResource: 'get_term',
      // the css class for flyout elements
      flyoutClass: 'lookerUpperFlyout'
    },options||{});
    // add a title to the element to get a tooltip
    this.attr('title','Click me for my definition!');
    // Establish click handler on terms
    return this.click(function(event){
      // initiate request for term definition
      $.ajax({
        url: options.lookupResource,
        type: 'get',
        // pass in the content of the event target
        data: {term: this.innerHTML},
        // expected response data is HTML
        dataType: 'html',
        // the function to execute on success
        success: function(data) {
          // act on response data. Create new div.
          $('<div></div>')
            // add css styles to it
            .css({
              position: 'absolute',
              left: event.pageX,
              top: event.pageY,
              cursor: 'pointer',
              display: 'none'
            })
            // insert the response data as html
            .html(data)
            // add the class specified in the options
            .addClass(options.flyoutClass)
            // establish click handler on flyout
            .click(function(){
              $(this).fadeOut(1500,function(){$(this).remove();});
             })
            // attach flyout to DOM and fade in
            .appendTo('body')
            .fadeIn();
          }
        });
        return false;
      });
  }
})(jQuery);


// This is the "onready" handler (short for: "$(document).ready(function(){"  )
$(function(){
  $('#styleDropdown')
    .change(function(){
      var styleValue = $(this).val();
      $('#detailsDisplay').load(
        '/ajia/get_details',
        { style: styleValue },
        function(){
           $('abbr').termifier({
              lookupResource: '/ajia/get_term'
           });
        }
      );
      // Trigger state adjustment of color dropdown
      adjustColorDropdown();
    })
    .change();
  // Bind change listener to color dropdown
  $('#colorDropdown')
    .change(adjustSizeDropdown);
});


// Function to adjust Color select list
function adjustColorDropdown() {
  // Store style of boot selected
  var styleValue = $('#styleDropdown').val();
  // Get wrapped set of color dropdown
  var dropdownSet = $('#colorDropdown');
  // enable or disable color dropdown
  if (styleValue.length == 0) {
    dropdownSet.attr("disabled",true);
    // Empty disabled dropdown
    dropdownSet.emptySelect();
  }
  else {
    dropdownSet.attr("disabled",false);
    // get colors from server based on style
      $.getJSON(
      '/ajia/get_colors',
      {style:styleValue},
      function(data){
        dropdownSet.loadSelect(data);
        // Trigger adjustment of dependent dropdown
        adjustSizeDropdown();
      }
    );
  }
}


// Function to adjust Size select list
function adjustSizeDropdown() {
  var styleValue = $('#styleDropdown').val();
  var colorValue = $('#colorDropdown').val();
  var dropdownSet = $('#sizeDropdown');
  if ((styleValue.length == 0)||(colorValue.length == 0) ) {
    dropdownSet.attr("disabled",true);
    dropdownSet.emptySelect();
  }
  else {
    dropdownSet.attr("disabled",false);
    $.getJSON(
      '/ajia/get_sizes',
      {style:styleValue,color:colorValue},
      function(data){
         dropdownSet.loadSelect(data);
      }
    );
  }
}
