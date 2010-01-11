// Ready function which loads up the DOM
// by calling updateMsg and binds the submit event
$(document).ready(function(){
   // initialize timestamp variable
   timestamp = 0;
   // load initial messages
   updateMsg();
   // bind function to submit event
   $("form#chatform").submit(function(){
      $.post("postmsg", {
         message: $("#msg").val(),
         name: $("#author").val(),
         time: timestamp
         }, function() {
         updateMsg();
      });
      // prevent the "normal" html submit from firing
      return false;
   });
});

// Update messages from the database
function updateMsg() {
   // call "getmsgs" method in Chat controller
   // passing in the current timestamp of the last
   // message retrieved
   $.post("getmsgs", { time: timestamp },
      function(xml) {
         // remove the "loading" message from the DOM
         $("#loading").remove();
         // call function to add to page 
         addMessages(xml);
      }
   );
   setTimeout('updateMsg()', 4000);
}

// Add the messages to page
function addMessages(xml) {
   // if status says no new messages, return
   if($("status",xml).text() == "2") return;
   // get the timestamp from the xml returned
   timestamp = $("time",xml).text();
   // for each message, append it to screen
   $("message",xml).each(function(id) {
       var amessage = $("message",xml).get(id);
       var author = $("author",amessage).text(); 
       var msg = $("text",amessage).text(); 
       $("#messagewindow").append(
              "<b>" + author + "</b>: " + msg + "<br />") 
       }
   );
}


