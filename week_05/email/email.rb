require 'sinatra'      # gem install sinatra
require "sinatra/json" # gem install sinatra-contrib

set :bind, '0.0.0.0'


@@emails = {
        "1234" => { "from" => "Charlie Crews", "subject" => "I'm back", "preview"=>"After been 12 years in prison...", "starred"=>"true" },
        "2345" => { "from" => "Jack Gallagher", "subject" => "The psiquiatric revolution", "preview"=>"I want to change the way this hospital...", "starred"=>"false" },
        "3456" => { "from" => "Richard Castle", "subject" => "Niki Heat", "preview"=>"The detective Niki Heat....", "starred"=>"true" },
        "4567" => { "from" => "Sheldon Cooper", "subject" => "I'm going to win the Noble price", "preview"=>"Dear poor minds, probably you...", "starred"=>"false" }
    }


get '/' do
  send_file 'email.html'
end

get '/email/new' do
    rnd = rand()
    if (rnd < 0.5)
        response = {}
    elsif (rnd < 0.75)
        response  = {
            "12121" => createEmail
        }
    else
        response  = {
            "12121" => createEmail,
            "223344" => createEmail,
            "334455" => createEmail,
        }
    end
    json response
end

get '/email/:id' do
    emailToSend = (@@emails[:id]) ? @@emails[:id] : createEmail
    emailToSend['email'] =emailToSend['preview'] + 'Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos. Eu sit tincidunt incorrupte definitionem, vis mutat affert percipit cu, eirmod consectetuer signiferumque eu per. In usu latine equidem dolores. Quo no falli viris intellegam, ut fugit veritus placerat per.
Ius id vidit volumus mandamus, vide veritus democritum te nec, ei eos debet libris consulatu. No mei ferri graeco dicunt, ad cum veri accommodare. Sed at malis omnesque delicata, usu et iusto zzril meliore. Dicunt maiorum eloquentiam cum cu, sit summo dolor essent te. Ne quodsi nusquam legendos has, ea dicit voluptua eloquentiam pro, ad sit quas qualisque. Eos vocibus deserunt quaestio ei.
Blandit incorrupte quaerendum in quo, nibh impedit id vis, vel no nullam semper audiam. Ei populo graeci consulatu mei, has ea stet modus phaedrum. Inani oblique ne has, duo et veritus detraxit. Tota ludus oratio ea mel, offendit persequeris ei vim. Eos dicat oratio partem ut, id cum ignota senserit intellegat. Sit inani ubique graecis ad, quando graecis liberavisse et cum, dicit option eruditi at duo. Homero salutatus suscipiantur eum id, tamquam voluptaria expetendis ad sed, nobis feugiat similique usu ex.
Eum hinc argumentum te, no sit percipit adversarium, ne qui feugiat persecuti. Odio omnes scripserit ad est, ut vidit lorem maiestatis his, putent mandamus gloriatur ne pro. Oratio iriure rationibus ne his, ad est corrumpit splendide. Ad duo appareat moderatius, ei falli tollit denique eos. Dicant evertitur mei in, ne his deserunt perpetua sententiae, ea sea omnes similique vituperatoribus. Ex mel errem intellegebat comprehensam, vel ad tantas antiopam delicatissimi, tota ferri affert eu nec. Legere expetenda pertinacia ne pro, et pro impetus persius assueverit.';
    json emailToSend
end

post '/email' do
    sleep(2.0)
    "Email sent"
end

get '/email' do
    json @@emails
end

def createEmail
    {
        "from" => (0...10).map { ('a'..'z').to_a[rand(26)] }.join + ' '  + (0...10).map { ('a'..'z').to_a[rand(26)] }.join,
        "subject" => (0...20).map { ('a'..'z').to_a[rand(26)] }.join,

        "preview"=> (0...20).map { ('a'..'z').to_a[rand(26)] }.join,
        "starred"=>"false"
    }
end
