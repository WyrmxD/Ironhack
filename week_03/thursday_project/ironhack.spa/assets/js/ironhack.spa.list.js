window.ironhack.list = (function(){

  add = function(values) {
    values = values || {distance: 0};
    var html = "\
      <li data-name=" + values.name + ">\
        <span>" + values.distance + "</span>\
        <strong>" + values.name + "</strong>\
        <small>" + values.address + "</small>\
      </li>";

    $(ironhack.C.QUERY.LIST).append(html);
  }

  render = function() {
    $(ironhack.C.QUERY.LIST).html("");
    var cinemas = storage.select(C.STORAGE.CINEMAS);
    for (var i = 0, len = cinemas.length; i < len; i++) {
      this.add(cinemas[i]);
    }
  }

  return {
    add   : add,
    render: render
  }
})();
