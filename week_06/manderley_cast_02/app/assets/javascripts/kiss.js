jQuery(function($){

	$.get('/kiss/ajax').done(function(data){
		var $json = $('#json');
		$json.text( JSON.stringify(data));
	})
});