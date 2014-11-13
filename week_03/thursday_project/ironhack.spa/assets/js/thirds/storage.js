var storage = (function(){
    context = "local";
    _tables = {};

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
        _tables[name] = _tables[name] || [];
        _save();
    };

    _insert = function(table, value) {
        _read();
        _tables[table].push(value);
        _save();
    };

    _select = function(table, where_key, where_value) {
        _read();
        results = [];
        table = _tables[table];
        if (table) {
            for (var i=0, len = table.length; i < len; i++) {
                if (where_key === undefined || table[i][where_key] === where_value) {
                    results.push(table[i]);
                }
            }
        }
        return results;
    };

    _update = function(table, value, where_key, where_value) {
        _read();
        table = _tables[table];
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
        delete _tables[table];
        _save();
    };

    _save = function() {
        toStorage = JSON.stringify(_tables);
        window[context + "Storage"].setItem("storage", toStorage);
    };

    _read = function() {
        fromStorage = window[context + "Storage"].getItem("storage");
        _tables = JSON.parse(fromStorage) || {};
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
