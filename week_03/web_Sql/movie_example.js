var db = window.openDatabase("Workshop", "1.0", "Workshop by TapQuo", 5*1024*1024); //5MB
delete_table("alumnos")

function table(table_name, table_fields) {
    execute('CREATE TABLE IF NOT EXISTS ' + table_name + ' (' + table_fields + ');');
}

table("alumnos" ,"name, company")
create("Inaki", "IKEA")
read()

function delete_table(table){
  execute('DROP TABLE '+table+';');
}

function create(name, company){
    execute('INSERT INTO alumnos (name, company) VALUES ("'+name+'", "'+company+'");');
}

function read(){
    $('section group').empty()
    db.transaction(function(tx) {
        tx.executeSql('SELECT * FROM alumnos', [],
        function (tx, rs) {
            if (rs.rows.length > 0){
                var _alumno = null;
                for (var i=0; i < rs.rows.length; i++) {
                    _alumno = rs.rows.item(i);

                    _markup = '<div><strong>'+_alumno.name+'</strong> trabaja en <em>'+_alumno.company+'</em><button id="'+_alumno.name+'">Eliminar</button></div>';

                    $('section group').append(_markup);
                }
            } else {
                $('section group').append('<article>No hay alumnos.</article>');
            }

            $('section footer').html('<strong>'+rs.rows.length+' registros</strong>');
        },
        function (tx, error) { alert('error'); }
        );
    });
}

function update(){
    alert(1);
}

function drop(name){
    execute('DELETE FROM alumnos WHERE name="'+name+'";');
}

function execute(sql){
    db.transaction(function(tx) { tx.executeSql(sql); });
}
