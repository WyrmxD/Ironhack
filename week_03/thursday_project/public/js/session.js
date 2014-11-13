var session = (function(){

	_check_logged = function() {
		tableStored = storage.select("users");
		if(tableStored.length < 1){
			viewcontrol.show_login()	
		} else {
			viewcontrol.setUser()
			viewcontrol.show_app()
			viewcontrol.render_cinemas()
		}
	}

	_login = function(username, password) {
		if(username == undefined || password == undefined){
			return false
		}
		console.log("Trying to connect: " + username, password)
		storage.local()
		storage.createTable("users")
		userStored = storage.select("users", "username", username);
		if(userStored.length < 1) {
			viewcontrol.show_error("User incorrect\nMotherfocka :)")
		}else if(userStored[0].password === password){
			storage.session()
			storage.delete()
			storage.createTable("users")
			storage.insert("users", {username: username});
			viewcontrol.setUser(username)
			viewcontrol.show_app()
			console.log("User correct")
		}

	}

	_register = function(username, password) {
		console.log("Registering: " + username, password)
		storage.local()
		storage.createTable("users");
		storage.insert("users", {username: username, password: password});
		viewcontrol.show_login()
	}


	return {
		login       : _login,
		register 	: _register,
		check_logged : _check_logged,
	}

})();
