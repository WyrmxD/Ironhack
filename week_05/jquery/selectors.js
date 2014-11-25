// Put a border in the following elements

// all the elements: Example
//$("*").css("border", "solid 1px");

// the div with the id of myContent
//$("#myContent").css("border", "solid 1px");

// li elements
//$("li").css("border", "solid 1px");

// li with the basic class
//$("li.basic").css("border", "solid 1px");

// The first li element with css selectors
//$("li:first").css("border", "solid 1px");

// The second li element with traversing filters
//$("li").eq(1).css("border", "solid 1px");

// The last p with css selectors
//$("p:last-of-type" ).css("border", "solid 1px");

// The last p with traversing filters
//$("p").last().css("border", "solid 1px");

// The label element that has an element with the id love
$("label").has("#love")

// The li element that has no new class
$("li").not(".new")

// The a element with href property is 'http://www.api.jquery.com/'
$("a[href='http://www.api.jquery.com/']")

// The a element with href property starts by http://www.
$("a[href^='http://www.']")

// The a element with href property contains api
$("a[href*='api']")

// The p elements
$("p")

// The p elements inside myContent div
$("#myContent p")

// The parent element to the jquery-ui element
$("#jquery-ui").parent()

// The siblings to the slogan p
$("p#slogan").siblings()

// The p elements not inside myContent div
$("p").not("#myContent p")

// The li elements that starts with jQuery. Tip: http://www.w3schools.com/jsref/jsref_substring.asp
$("li").filter(function() {
	return $(this).text().substring(0, 6) === 'jQuery';
})
