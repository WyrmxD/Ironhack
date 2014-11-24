// Change the width of the h1 element
$("h1").width(100)

// Change the font-size up to 120%
$("html").css("font-size", "120%")

// Add the hightlighted class to the elements that has the 'new' class
$(".new").addClass("hightlighted")

// Remove the title class from h1
$("h1").removeClass("title")

// Specify the age range in 20-30
$("option").val('20-30').prop("selected", true)

// Specify the age range in 20-30 using travesing filters
$("option").val('20-30').prop("selected", true)

// Uncheck the "I love learning" checkbox
$("#love").attr("checked", false)

// Select yellow as a favourite color
$("#color-yellow").attr("checked", true)

// Write the selected name of the input in the result div
$("div#result").prepend($('#name').val())

// Write the text of the selected age in the result div
$("div#result").append( $('select[name=age-range]').val() )

// Writes the number of data likes of jquery-ui in the result div
$("div#result").append( $("#jquery-ui").data('likes') )

// Adds 100 to the number of likes and show it in the result div
$('li').data('likes', $('li').data('likes') + 100  )

// Show the absolute position of result in the console
var result = $('#result').offset();
console.log( result.top, result.left  );

// Move the result to the position 100 top and 150 left
$('#result').offset({ top: 100, left: 150 });

// Change the width and height of the result up to 300px
//$('#result').width('300px')
//$('#result').height('300px')

// Add "(User interface)" after "JQueryUI"
$('#jquery-ui').append('(User interface)')

// Add a li element with the text "Future JQ" after jQueryUI
$('#jquery-ui').after('<li>Future JQ</li>')

// Add div containers with the class bordered around every li
$('li').wrap( "<div class='bordered'>");

// Add a div container with the class bordered around all li
$('li').wrapAll( "<div class='bordered'>");

// Remove the result div
$('#result').remove()

/**
 *  Final round
 */

// Set the the names of the colours according to their color
//$("input[id|='color']").attr('name', $("input[id|='color']").val() )
$("input[id|='color']").attr('name', function() {
	return $(this).val();
})

// ver cada color
$("input[id|='color']").css('background-color', function() {
	return $(this).val();
})


// Add links to the li elements, the url is the name ended with .com
$('li').wrapInner( '<a href="http://www.' + $('li').text() + '.com">')