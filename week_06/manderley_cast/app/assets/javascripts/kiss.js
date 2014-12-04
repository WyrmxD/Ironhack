jQuery(function($){

	$.get('/kiss/ajax').done(function (data) {
		console.log(data);

		var $json = $('#json');
/*		var result = "";
		for(var key in data){
			result += key + ": " + data[key] + ";";
		}
		$json.text(result);*/
		$json.text(JSON.stringify(data));
	});

});