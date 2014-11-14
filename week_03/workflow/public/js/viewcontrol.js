var viewcontrol = (function(){

	_show_app = function(){
		$(".session").hide()
		$(".register").hide()
		$(".app").show()
	}

	_show_login = function() {
		$(".session").show()
		$(".register").hide()
		$(".app").hide()
	}

	_show_register = function() {
		$(".register").show()
		$(".session").hide()
	}

	_setUser = function(username){
		if(username == undefined){
			storage.session()
			userStored = storage.select("users")
			username = userStored[0].username
		}
		html = "<img src=\"images/user.png\" class=\"user_icon\"> " + username
		$(".user_info").append(html)
	}

	_show_error = function(message) {
		alert(message)
	}

	_render_cinemas = function(order_by) {
		storage.local()
		cinemasStored = storage.select("cinemas")
		if(order_by !== undefined){
			cinemasStored = orderby(cinemasStored, order_by, 'ASC')
		}
		$("#cinemas_list").empty()
		html = "<ul>"
		for(i=0, len = cinemasStored.length; i < len ; i++){
			html += "<li class=\"cinema_item\" id=\"" + i +"\"><strong>" + cinemasStored[i].name + "</strong></li>"
		}
		html += "</ul>"
		$("#cinemas_list").append(html)

	}

	_draw = function(cinema_id) {
		storage.local()
		cinemasStored = storage.select("cinemas")
		cinema = cinemasStored[cinema_id]

		_add_marker(cinema)
	}

	_add_marker = function(cinema) {
		var cinemaLatlng = new google.maps.LatLng(cinema.latitude, cinema.longitude);
		var mapOptions = {
				zoom	: 13,
				center	: cinemaLatlng
			}
		map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

		var marker = new google.maps.Marker({
			position: cinemaLatlng,
			title: cinema.name,
			draggable: false,
			map: map
		});
		marker.setMap(map);
	}

	return {
		show_app 	  	: _show_app,
		show_login    	: _show_login,
		show_error 	  	: _show_error,
		show_register 	: _show_register,
		setUser 	  	: _setUser,
		render_cinemas 	: _render_cinemas,
		draw 			: _draw,
	}

})();
