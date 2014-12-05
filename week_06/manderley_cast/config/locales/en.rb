{
    en: {
        hello_html: "<strong>Hello world</strong>",
         activerecord: {
            models: {
                movie: {
                    one: "Movi",    # Movie.model_name.human count:1
                    other: "Movies" # Movie.model_name.human count:2
                },
                comment: "Comment",
                user: "User",
                vote: "Vote",
                person: "Person",
                cast: "Cast"
            },
            attributes: {
                movie: {
                    title: "chorra", # Movie.human_attribute_name :title
                    year: "year",
                    synopsis: "synopsis"
                }, comment: {
                    body: "body"
                }, user: {
                    email: "email",
                    password: "password",
                    username: "username"
                }, vote: {
                    rank: "rank"
                }, person: {
                    first_name: "first name",
                    last_name: "last name"
                }, cast: {
                    role: "role"
                }
            }
        }
    }
}