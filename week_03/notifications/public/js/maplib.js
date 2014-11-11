var maplib = (function(){

	function _initialize() {

		locations = storage.select("cinemas")
		var initial_lat = 40.4135872
		var initial_long = -3.7060801
		if(locations,length > 0) {
			initial_lat = locations[0].latitude
			initial_long = locations[0].longitude
		}
		var initPos = new google.maps.LatLng(initial_lat, initial_long);
		var mapOptions = {
			zoom	: 10,
			center	: initPos
		}
		map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

		if (navigator.geolocation) { 
			navigator.geolocation.getCurrentPosition(onSuccess, onError); 
			function onSuccess(position){
				var myPos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
				addMarks(myPos)
			}
			function onError(error){
				alert("Error en GPS: " + error);
			}
		}
	}

	function addMarks(myPos) {

		var marker = new google.maps.Marker({
			position: myPos,
			icon: {
				path: google.maps.SymbolPath.CIRCLE,
				scale: 10
			},
			draggable: false,
			map: map
		});
		marker.setMap(map);

		locations = storage.select("cinemas")

		for (var i = 0,length = locations.length; i < length; i++) {
			var myLatlng = new google.maps.LatLng(locations[i].latitude, locations[i].longitude);
			var marker = new google.maps.Marker({
				position: myLatlng,
				title	: locations[i].name + " " + (google.maps.geometry.spherical.computeDistanceBetween(myPos, myLatlng) / 1000) + "Km"
			});

			marker.setMap(map);
		}
	}

	function removeMarks() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}

	}

	function _getData() {
		name = document.getElementById("cinema").value
		latitude = document.getElementById("lat").value
		longitude = document.getElementById("long").value
		new_cinema = {"name": name, "latitude": latitude, "longitude": longitude}
		
		storage.insert("cinemas",new_cinema)
		notifications.notify("@WyrmxD","New Cinema added: " + name ,"https://avatars1.githubusercontent.com/u/628610?v=3&s=460");
	}

		return {
			initialize 	: _initialize,
			getData 	: _getData
		}

})();