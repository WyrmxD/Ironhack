var websql = (function(){

    db = window.openDatabase("cinema", "1.0", "Workshop by TapQuo", 5*1024*1024); //5MB

    _table = function(name, fields) {
        fields = fields.join(" STRING NOT NULL, ") + " STRING NOT NULL"
        _execute("CREATE TABLE IF NOT EXISTS " + name + " (" + fields + ");");
    };

    _insert = function(table, fields, values) {
        fields = "'" + fields.join("','") + "'";
        values = "'" + values.join("','") + "'";
        _execute("INSERT INTO " + table + " (" + fields +") VALUES (" + values + ");");
    };

    _select = function(table, where) {
        sql = "SELECT * FROM " + table
        if (where !== undefined)  sql += " WHERE " + where
        sql += ";"

        db.transaction(function(tx) {
            tx.executeSql(sql, [], function(tx, result) {
                console.log("Heroes:", result.rows.length)
                for (var i=0, len = result.rows.length; i < len; i++) {
                    console.log(result.rows.item(i));
                }
            });
        });
    };

    _update = function(table, key, value, where) {
        _execute("UPDATE " + table + " SET " + key + " = '" + value +"' WHERE " + where + ";");
    };

    _delete = function(table, where) {
        _execute("DELETE FROM " + table + " WHERE " + where + ";");
    };

    _execute = function(sql) {
        console.log("SQL: ", sql)
        db.transaction(function(tx) { tx.executeSql(sql); });
    };

    return {
        version    : "1.0.0",
        createTable: _table,
        insert     : _insert,
        select     : _select,
        update     : _update,
        delete     : _delete
    }
})();
