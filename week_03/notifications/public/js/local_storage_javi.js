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
        if(_tables[name] == undefined) {
            _tables[name] = [];
        }
        _save();
    };

    _insert = function(table, value) {
        _read();
        console.log(value)
        _tables[table].push(value);
        _save();
    };

    _select = function(table, where_key, where_value) {
        _read();
        item_list = []
        table = _tables[table];
        if (table) {
            for (var i=0, len = table.length; i < len; i++) {
                if (where_key === undefined || table[i][where_key] === where_value) {
                    item_list[item_list.length] = table[i]
                }
            }
        }
        return item_list
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
        console.log(_tables)
        toStorage = JSON.stringify(_tables);
        console.log(toStorage);
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


/* MOVIES */
// storage.createTable("movies");
// storage.insert("movies", {name: "Batman", director: "Tim Burton"});
// storage.insert("movies", {name: "Big Fish", director: "Tim Burton"});
// storage.select("movies", "director", "Tim Burton");
// storage.select("movies", "name", "Batman");
// /* SPORTS */
// storage.createTable("sports");
// storage.insert("sports", {name: "Swimming", level: 0});
// storage.insert("sports", {name: "Cycling", level: 1});
// storage.insert("sports", {name: "Running", level: 2});
