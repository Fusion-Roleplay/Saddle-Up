var audio;
$(document).ready(function(){
  window.addEventListener('message', function( event ) {
if (event.data.action == 'open') {
      var type      = event.data.type;
      var image  	= event.data.array['image']; 
      var firstname  	= event.data.array['firstname'];
      var lastname  	= event.data.array['lastname']; 

        $('#first-name').text(firstname);         
        $('#last-name').text(lastname);
        $('#reg-paper').show(); 
    	  $('#reg-paper').css('background', "url(assets/images/"+image+".png)");
        $('#reg-paper').css('background-size', '100% 100%');   
    
} else if (event.data.action == 'close') {
      $('#first-name').text('');
      $('#last-name').text('');
      $('#reg-paper').hide();
    }

if (event.data.action == 'openreg') {
      var type      = event.data.type;
      var image  	= event.data.array['image2']; 
      var firstname  	= event.data.array['firstname2'];
      var lastname  	= event.data.array['lastname2']; 

        $('#first-name2').text(firstname);         
        $('#last-name2').text(lastname);
        $('#reg-paper2').show(); 
    	  $('#reg-paper2').css('background', "url(assets/images/"+image+".png)");
        $('#reg-paper2').css('background-size', '100% 100%');   
    
} else if (event.data.action == 'closereg') {
      $('#first-name2').text('');
      $('#last-name2').text('');
      $('#reg-paper2').hide();
    }
if (event.data.action == 'openjob') {
      var type      = event.data.type;
      var inv  	=   event.data.array['inv'];
      var delivery  	= event.data.array['delivery']; 


        $(".inv").css("display", "block");
        $(".delivery").css("display", "block");
        $('#job-paper').show(); 
    	  $('#job-paper').css('background', "url(assets/images/job.png)");
        $('#job-paper').css('background-size', '100% 100%');   
    
} else if (event.data.action == 'closejob') {
      $(".inv").css("display", "none");
      $(".delivery").css("display", "none");
      $('#job-paper').hide();
    }
  });
});