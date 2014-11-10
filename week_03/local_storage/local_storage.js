var movie_stored = (function(){



	_insert = function(key, movie) {
		movies_stored = _select_all(key)
		if (movies_stored != null) {
			found = _get_position(key, movie.title)
			if(found == null){
				movies_list = _to_json(movies_stored)
				movies_list[movies_list.length] = movie					
			}
		}else{
			movies_list = [movie] 
		}
		
		_store(key, movies_list)
	}

	_select_all = function(key){
		movies_list = window.localStorage.getItem(key)
		return movies_list
	}

	_get_position = function(key, title) {
		movies_stored = _select_all(key)
		if(movies_stored == null){
			return null
		}

		movies_list = _to_json(movies_stored)
		for (var i = 0, length = movies_list.length; i < length; i++) {
			if(movies_list[i].title === title){
				return i
			}
		};

		return null
	}


	_delete = function(key, movie){
		position = _get_position(key, movie.title)
		if(position != null){
			movies_list = _to_json( _select_all(key) )
			movies_list.splice(position, 1)
		}
		_store(key, movies_list)
	}

	_update = function(key, movie){
		_delete(key, movie)
		_insert(key, movie)
	}

	_to_json = function(string) {
		return JSON.parse(string)
	}

	_to_string = function(json) {
		return JSON.stringify(json)
	}

	_store = function(key, value){
		window.localStorage.setItem(key, _to_string(value) )
	}


	return {
		version    : "1.0.0",
		insert     : _insert,
		select_all : _select_all,
		update     : _update,
		delete     : _delete
	}
})();

peli1 = { "title" : "Poltergeist", "director" : "Tobe Hooper", "year" : "1982"}
movie_stored.insert("mis_pelis", peli1)
peli2 = { "title" : "Blade Runner", "director" : "Ridley Scott", "year" : "1982"}
movie_stored.insert("mis_pelis", peli2)
console.log("After insert: " + movie_stored.select_all("mis_pelis"))

movie_stored.insert("mis_pelis", peli2)
movie_stored.delete("mis_pelis", peli1)
console.log("After delete: " + movie_stored.select_all("mis_pelis"))
movie_stored.update("mis_pelis", { "title" : "Blade Runner", "director" : "Ridley Scott", "year" : "1983"})
console.log("After update: " + movie_stored.select_all("mis_pelis"))