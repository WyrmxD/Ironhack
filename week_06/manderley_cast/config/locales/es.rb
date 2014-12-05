{
    es: {
        hello_html: "Hola mundo",
         activerecord: {
            models: {
                movie: "Película",   # Movie.model_name.human
                comment: "Comentario",
                user: "Usuario",
                vote: "Voto",
                person: "Persona",
                cast: "Casting"
            },
            attributes: {
                movie: {
                    title: "título", # Movie.human_attribute_name :title
                    year: "año",
                    synopsis: "sinopsis"
                }, comment: {
                    body: "contenido"
                }, user: {
                    email: "email",
                    password: "password",
                    username: "username"
                }, vote: {
                    rank: "puntuación"
                }, person: {
                    first_name: "nombre",
                    last_name: "apellido"
                }, cast: {
                    role: "rol"
                }
            }
        }
    }
}