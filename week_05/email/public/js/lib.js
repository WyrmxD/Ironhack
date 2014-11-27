(function($){

$("#emails").empty()
$("#blank-email").hide()

/* Sidebar effects */
$('ul[id$="-labels"]').mouseenter(function(){
	$(this).toggleClass('item-focus');
})

$('ul[id$="-labels"]').mouseleave(function(){
	$(this).toggleClass('item-focus');
})

$('#recent-conversations').mouseenter(function(){
	$(this).toggleClass('item-focus');
})

$('#recent-conversations').mouseleave(function(){
	$(this).toggleClass('item-focus');
})

function load_emails(){
	$.ajax({
		url: "/email",
		type: "get",
		success: success,
	})

	function success(data){
		mail_list = $.map(data, function(email, index){
			return html_build_email(index, email.from, email.subject, email.preview, email.starred)
		})
		$('#emails').prepend(mail_list);
	}

}

function html_build_email(id, from, subject, preview, starred){
	html = '<li data-id="' + id + '">'
    html += '<div class="checked" data-checked="false"></div>'
    if(starred === 'true'){
    	html += '<div class="starred" data-starred="true"></div>'
    }else{
    	html += '<div class="starred" data-starred="false"></div>'
    }
    html += '<div class="from">'+ from +'</div>'
    html += '<div class="subject">' + subject + '</div>'
    html += '<div class="preview">' + preview + '</div>'
    html += '</li>';

    return html
}

$('#emails').bind("DOMSubtreeModified",function(){
	email_list = $("#emails li")
	$.each(email_list, function(index, email){
		var is_starred = $(email).children().eq(1).attr("data-starred")
		if(is_starred === "true"){
			$(email).children().eq(1).prepend("S ")
		}
	})
});


load_emails()


}(jQuery));