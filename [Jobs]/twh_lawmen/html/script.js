var divClone = $("#lock").clone();
var audio;
(function( $ ) {
	$.fn.makeLock = function(dialNum, comb){
		console.clear()
        var comb = comb
		var combo
		var dials				 = dialNum || $(this).attr('data-dials') || 3
		var lock				 = $(this).addClass('myLock')

		lock.append('<div class="lockInset">'
			+'<div class="lockLine"></div>'
			+'<div class="lockWrapper"></div>'
			+'</div>')

		var enterBTN		= $('<div class="btnEnter button">Öffnen</div>').appendTo(lock)
		var lockWrapper = lock.find('.lockWrapper')

		for(var i = 0; i< dials; i++){
			var dial = $( '<div class="dial"><ol></ol></div>').appendTo(lockWrapper)
			var slider = dial.find('ol')
			for(var n = 0; n < 10; n++){
				slider.append('<li>'+n+'</li>')
			}
			slider.prepend( slider.find('li:last-child') )
		}
		lockWrapper.append('<div class="shadow"></div>')

		var dialMove		= function(e){
			$(this).append( $('li:first-child', this))
			TweenLite.fromTo(this, 0.35, {top:0}, {top:-50,ease: Power2.easeOut})
            $.post(`http://twh_lawmen/clicked`, JSON.stringify({}));
		}
		lock.find('ol').on('click', dialMove)

		var checkLock		 = function(e){
			combo = ''
			lock.find('li:nth-child(2)').each( function(){
				combo += $(this).text()
			})
      document.getElementById("lock").setAttribute("data-dials", 3);
      
			if (combo == comb) {
                $.post(`http://twh_lawmen/closemenu`, JSON.stringify({}));
			}
            else{
                $.post(`http://twh_lawmen/clickedfalse`, JSON.stringify({}));
            }
		}
		enterBTN.on('click', checkLock)
	}
}( jQuery ));


window.addEventListener("keyup", function onEvent(event) {
    // Close menu when key is released
    if (event.key === "Backspace" || event.key ==="Escape") {
        $.post(`http://twh_lawmen/close`, JSON.stringify({}));

    }
});


window.addEventListener('message', (event) => {	            
    var item = event.data;
    if (item !== undefined) {		                
        if (item.dials > 0 && item.comb !== undefined) {
            $("#lock").replaceWith(divClone.clone());
            document.getElementById("lock").setAttribute("data-dials", item.dials);
            $("#lock").makeLock(item.dials,item.comb)
        } 
    }
    if (item !== undefined && item.type === "ui") {		                
        if (item.display === true) {
            $("#hud").show();
        } else {
            $("#hud").hide();
        }
    }
	if (typeof item.playsound !== 'undefined')
	{
		PlayAudio(item.playsound, item.soundvolume);
	}
	if(event.data.stop) {
        audio.pause();
		audio.currentTime = 0;
    }
    
});

function PlayAudio(audiofile, volume)
		{
			if (audio != null) {
				audio.pause();
			}

			audio = new Audio(audiofile);
			audio.volume = volume;
			audio.play();
		}