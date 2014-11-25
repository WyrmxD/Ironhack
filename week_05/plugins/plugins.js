// Create a plugin called reedify that sets the text color to red
(function($){
	$.fn.reedify = function() {
		this.css( "color", "red" );
	};

// Apply the function to the li elements of jQuery projects
//$("#myContent li").reedify()
 
// Apply the reedify method and after a fade transition of 1 second
//$("#myContent li").fadeOut(1000).fadeIn(1000, function(){
//	$(this).reedify()	
//})
 
// Add an automatic invocation to all the red class elements
//$(".red").reedify()
 
 
// Create a plugin that removes all the spaces
	$.fn.retrim = function() {
		this.each( function(index, element){
			var text_items = ['DIV', 'LI', 'P']
			var val_items = ['INPUT']

			var htmlType = $(this).prop('tagName');
			if( $.inArray(htmlType, text_items) >= 0 ){
				$(this).text( $(this).text().replace(" ", "") )
			}else if( $.inArray(htmlType, val_items) >= 0 ){
				$(this).val( $(this).val().replace(" ", "") )
			}
		})
	};
 
// And apply it to the p elements
$("p").retrim()

}(jQuery));