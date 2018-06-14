$(document).ready(function(){

	function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
	}

	var connectionBannerCookie = getCookie('closedConnectionBanner');

	$('.connect-wrap .close').on('click', function(e){
			$('.connect-wrap').css({
				'box-shadow': 'none',
				'height': '0',
				'opacity': '0',
				'padding': '0'
			});

			document.cookie = 'closedConnectionBanner=true'; 
	});


	// Hide banners that have been opted out
	if(getCookie('closedConnectionBanner') === 'true') {
		$('.connect-wrap').css({
			'display': 'none'
		})
	}

	$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})


	// open welcome modal if it exists
	var modal = $('#welcome-modal')
	if (modal) {		
		$('#welcome-modal').modal({
			show: true
		})
	}

})