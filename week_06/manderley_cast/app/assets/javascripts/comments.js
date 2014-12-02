// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).ready(function(){


	$('#show_form_button').click(show_form);

	function show_form(){
		var $comment_form = $('#comment_form');
		$comment_form.show(200, function(){
			$comment_form.effect('pulsate');
		});
	}

});