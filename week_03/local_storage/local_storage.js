// Almacenar un key cuyo valor es un array de objetos pelicula
var localst = (function(){



	_insert = function(key, movie) {
		movies_string = _select(key)
		console.log("movies_string: "+movies_string)
		if (movies_string != null) {
			movies = JSON.parse(movies_string)
			movies[movies.length] = movie	
		}else{
			movies = [movie] 
		}
		window.localStorage.setItem(key, JSON.stringify(movies) )
	}

	_select = function(key){
		movies = window.localStorage.getItem(key)
		if (movies != null) {

		}
		return movies
	}

	_update = function(){}
	_delete = function(){}



    return {
        version    : "1.0.0",
        insert     : _insert,
        select     : _select,
        update     : _update,
        delete     : _delete
    }
})();

peli = { "title" : "Terminator", "director" : "Yo"}
localst.insert("mis_pelis", peli)