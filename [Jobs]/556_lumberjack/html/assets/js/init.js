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
if (event.data.action == 'openjob') {
      var type      = event.data.type;
      var toolprice  	= event.data.array['toolprice']+"$"; 
      var licenceprice  	= event.data.array['licenceprice']+"$";
      var cash  	= event.data.array['cash']+"$"; 
      var inv  	=   event.data.array['inv'];
      var delivery  	= event.data.array['delivery']; 

        $('#toolprice').text(toolprice);
        $('#licenceprice').text(licenceprice);
        $('#cash').text(cash);
        $(".changeprice").css("display", "block");
        $(".changelicenceprice").css("display", "block");
        $(".takecash").css("display", "block");
        $(".depositcash").css("display", "block");
        $(".close").css("display", "block");
        $(".hire").css("display", "block");
        $(".fire").css("display", "block");
        $(".inv").css("display", "block");
        $(".delivery").css("display", "block");
        $(".sellcompany").css("display", "block");
        $('#job-paper').show(); 
    	  $('#job-paper').css('background', "url(assets/images/job.png)");
        $('#job-paper').css('background-size', '100% 100%');   
    
} else if (event.data.action == 'closejob') {
      $('#toolprice').text('');
      $('#licenceprice').text('');
      $('#cash').text('');
      $(".changeprice").css("display", "none");
      $(".changelicenceprice").css("display", "none");
      $(".takecash").css("display", "none");
      $(".depositcash").css("display", "none");
      $(".close").css("display", "none");
      $(".hire").css("display", "none");
      $(".fire").css("display", "none");
      $(".inv").css("display", "none");
      $(".delivery").css("display", "none");
      $(".sellcompany").css("display", "none");
      $('#job-paper').hide();
    }
  });
  $(".changeprice").click(function() {
    $.post(`https://${GetParentResourceName()}/changeprice`, JSON.stringify({}));
})
$(".changelicenceprice").click(function() {
  $.post(`https://${GetParentResourceName()}/changelicenceprice`, JSON.stringify({}));
})
$(".close").click(function() {
  $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
})
$(".hire").click(function() {
  $.post(`https://${GetParentResourceName()}/hire`, JSON.stringify({}));
})
$(".fire").click(function() {
  $.post(`https://${GetParentResourceName()}/fire`, JSON.stringify({}));
})
$(".takecash").click(function() {
  $.post(`https://${GetParentResourceName()}/takecash`, JSON.stringify({}));
})
$(".depositcash").click(function() {
  $.post(`https://${GetParentResourceName()}/depositcash`, JSON.stringify({}));
})
$(".inv").click(function() {
  $.post(`https://${GetParentResourceName()}/openinv`, JSON.stringify({}));
})
$(".delivery").click(function() {
  $.post(`https://${GetParentResourceName()}/delivery`, JSON.stringify({}));
})
$(".sellcompany").click(function() {
  $.post(`https://${GetParentResourceName()}/sellcompany`, JSON.stringify({}));
})
});