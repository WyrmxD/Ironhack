// Replace myContent content with the result of the request google.html
$("#myContent").load("google.html")

// Replace the result div when click on it with the response of submiting the name to the /hello
// $("#result").click(function(){
// 	data = $("#name").val()
// 	$.get("/hello/"+data, data, function(data){
// 		$("#result").text(data)
// 	})
	
// })

// Replace the result div when click on it when the user changes the amount or the currency
// path: /exchange with the parameters amount and currency
// $("#result").click(function(){
// 	var uri = "/exchange/"
// 	var dataToSend = { 
// 		amount: 	$("#amount").val(), 
// 		currency: 	$("#currency").val()
// 	}
	
// 	$.get(uri, dataToSend, function(data){
// 		console.log(data)
// 		$("#result").text(JSON.stringify(data))
// 	})
// })

// Save (POST) the personal form to the /add route when click on the result div
// Look the the AJAX Response and the status code
// $("#result").click(function(){

// 	var dataToSend = $("#personal").serialize() 
// 	var uri = "/add"
// 	$.post(uri, dataToSend, function(data){ 
// 		console.log(data)
// 		console.log(data.status)
// 	})
// })

// Make a get request to /sleep when click on the result div
// Show loading while the response does not arrive
// Show the result if everything is ok
// Show 'Error' if there is some problem and change the background-color to red
// When the request ends adds the bordered class to the response
$("#result").click(function(){ 
	$.ajax({
		url: "/sleep",
		type: "get",
		success: success,
		error: error,
		complete: complete
	})
	$("#result").text('LOADING...')

	function complete(){
		$("#result").addClass('bordered')
	}

	function success(data){
		console.log(data)
		$("#result").text(data)
	}

	function error(){
		$("#result").text('ERROR')
		$("#result").css('background-color', 'red')
	}

})
