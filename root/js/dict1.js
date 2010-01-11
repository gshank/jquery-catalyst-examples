$(document).ready(function() {
   $('#letter-a .button').click(function() {
      $('#dictionary').load('/html/a.html');
   });
   $('#letter-b .button').click(function() {
      $.getJSON('/json/b.json', function(data) {
         $('#dictionary').empty();
         $.each(data, function(entryIndex, entry) {
            var html = '<div class="entry">';
            html += '<h3 class="term">' + entry['term'] + '<h3>';
            html += '<div class="part">' + entry['part'] + '</div>';
            html += '<div class="definition">';
            html += entry['definition'];
            if (entry['quote']) {
               html += '<div class="quote">';
               $.each(entry['quote'], function(lineIndex, line) {
                  html += '<div class="quote-line">' + line + '</div>';
               });
               if (entry['author']) {
                  html += '<div class="quote-author">' + entry['author'] + '</div>';
               }
               html += '</div>';
            }
            html += '</div>';
            html += '</div>';
            $('#dictionary').append(html);
         });
      });
   });
   $('#letter-c .button').click(function(data) {
      $.getScript('/js/c.js');
   });
   $('#letter-d .button').click(function(data) {
      $.get('/xml/d.xml', function(data) {
         $('#dictionary').empty();
         $(data).find('entry').each(function() {
            var $entry = $(this);
            var html = '<div class="entry">';
            html += '<h3 class="term">' + $entry.attr('term') + '</h3>';
            html += '<div class="part">' + $entry.attr('part') + '</div>';
            html += '<div class="definition">';
            html += $entry.find('definition').text();
            var $quote = $entry.find('quote');
            if ($quote.length) {
               html += '<div class="quote">';
               $quote.find('line').each(function() {
                  html += '<div class="quote-line">' + $(this).text() + '</ div>';
               });
               if ($quote.attr('author')) {
                  html += '<div class="quote-author">' + $quote.attr('author') + '</div>';
               }
               html += '</div>';
            }
            html += '</div>';
            html += '</div>';
            $('#dictionary').append($(html));
         });
      });
   });
});
