// When the page is loaded replace the slogan by "Bazinga!"
$(document).ready(myFunction)
function myFunction() {
	$('#slogan').text('Bazinga!')
}

// When you click on the input to write my name the previous name is deleted
$('#name').click(function(){
	$(this).val('')
})

// When you move your mouse over one jQuery projects it change the background-color to silver
$('#myContent').delegate("li", "mouseover", function(){
	$(this).css('background-color', 'silver')
})

// With the previous one active, when the user leaves the element remove the background-color
$('#myContent').delegate("li", "mouseleave", function(){
	$(this).css('background-color', 'white')
})

// Only when the mouse is over one jQuery project has the bordered class
$('#myContent').delegate("li", "mouseover", function(){
	$(this).addClass('bordered')
}).delegate("li", "mouseleave", function(){
	$(this).removeClass('bordered')
})

// When I finish to write my name I want my name written in the result div
$('#name').keyup(function(){
	$('#result').text( $(this).val() )
})

// When I click on any element of the body show the mouse x and y in the result div
$('body').click(function(event){
    	$('#result').text(event.pageX + ' ' + event.pageY)
})

// Adds a div with "Hello" at the end of the body when you click on the result div
$('#result').click(function(event){
	$('body').append('<div>Hello</div>')
})

// Adds a div with "Hello" when you click on the result div only the first time
$('#result').click(function(event){
	$('body').append('<div>Hello</div>')
	$(this).unbind("click")
})

// Adds a new "jQueryUI" element when clicks over one jQuery project
$('#myContent p').eq(1).click( function(){
	$(this).siblings('ul').append("<li id=\"jquery-ui\" data-likes=\"1000\">jQueryUI</li>")	
})

// Avoid the navigation when you click a link
//$('a').click(function(event){
//	event.preventDefault()
//})

// When you click a link go to ironhack.com
//$('a').click(function(event){
//	event.preventDefault()
//	$(location).attr('href','http://www.ironhack.com/');
//})

// When you click on myContent div toggle the class bordered to the result
// except if jquery-ui element is clicked.
$('#myContent').click(function(event){
	if( event.target.id !== 'jquery-ui' ){
		$('#result').toggleClass('bordered')
	}
})


// When you select a part of the input name the selected part is shown in the result div

/**
 * Final round
 */
// Duplicate the jQuery projects when clicks over them
// When you uncheck "I love learning" you get an alert with "Really???"

// When you resize the page show the size in the result div

// I want the result div follows my mouse until I click (then will be fixed on the page)
// The mouse should be in the center of the div
