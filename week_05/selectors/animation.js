// // Hide the result div
//$('#result').hide('slow');

// Hide the result div using fade with 1s duration
//$('#result').fadeOut(1000);

// Hide and show the result div using slide
//$('#result').slideUp('slow').slideDown('slow')

// Hide using slide, wait one second and fade
//$('#result').slideUp('slow').delay(1000).fadeIn('slow')

// Create your own speed and use it
//$.fx.speeds['tope-slow'] = 2000;
//$('#result').slideUp('tope-slow')

// Set the default animation speed to 2000
//$.fx.speeds['_default'] = 2000;

// Slide jquery projects and when it's done show on the result div that it's done
//$('#myContent').children().eq(2).slideUp(function(){
//	$('#result').delay(2000).text('Its done')	
//})

// Move the result div to the bottom left corner
//$('#result').animate({
//	top: '90%',
//	left: '0px'
//}, 'slow')

// Move to the left in 10seconds the result div with linear animation
//$('#result').animate({
//	left: '0px'
//}, 10000, 'linear')

// Create your own function of easing and use it
$.easing['square'] = function(p){ 
	return p * p
}
$('#result').animate({
	left: '0px'
}, 1000, 'square')