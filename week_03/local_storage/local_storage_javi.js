var storage = (function(){
    context = "local";
    tables = {};

    _local = function() {
        context = "local";
        _read();
    };

    _session = function() {
        context = "session";
        _read();
    };

    _table = function(name) {
        _read();
        tables[name] = [];
        _save();
    };

    _insert = function(table, value) {
        _read();
        tables[table].push(value);
        _save();
    };

    _select = function(table, where_key, where_value) {
        _read();
        table = tables[table];
        if (table) {
            for (var i=0, len = table.length; i < len; i++) {
                if (where_key === undefined || table[i][where_key] === where_value) {
                    console.log(table[i]);
                }
            }
        }
    };

    _update = function(table, value, where_key, where_value) {
        _read();
        table = tables[table];
        if (table) {
            for (var i=0, len = table.length; i < len; i++) {
                if (table[i][where_key] === where_value) {
                    table[i] = value;
                }
            }
        }
        _save();
    };

    _delete = function(table, where) {
        _read();
        delete tables[table];
        _save();
    };

    _save = function() {
        toStorage = JSON.stringify(tables);
        window[context + "Storage"].setItem("storage", toStorage);
    };

    _read = function() {
        fromStorage = window[context + "Storage"].getItem("storage");
        tables = JSON.parse(fromStorage);
    };

    return {
        // Context
        local       : _local,
        session     : _session,
        // CRUD
        createTable : _table,
        insert     : _insert,
        select     : _select,
        update     : _update,
        delete     : _delete
    }

})();