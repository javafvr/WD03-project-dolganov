$(document).ready(function() {

});


/*SUCCESS NOTIFICATION*/
setTimeout(function() {
	$('[data-notify-hide]').fadeOut(400);
}, 1000);

$('[data-notify-hide]').dblclick(function() {
		$(this).fadeOut(400);
});