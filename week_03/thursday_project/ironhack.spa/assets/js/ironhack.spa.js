window.ironhack = {};

$(function() {

  // -- INIT -------------------------------------------------------------------
  window.C = ironhack.C;
  storage.createTable(C.STORAGE.SESSION);
  storage.createTable(C.STORAGE.CINEMAS);
  ironhack.list.render();

  // -- SESSION ----------------------------------------------------------------
  $(C.QUERY.SESSION).hide()
  var session = storage.select(C.STORAGE.SESSION);
  if (session.length > 0) {
    $(C.QUERY.SESSION_NAME).html(session[0].name);
    $(C.QUERY.SESSION).show()
  } else {
    session = {name: prompt("Your name is...")};
    if (session.name !== "") {
      storage.insert(C.STORAGE.SESSION, session);
      $(C.QUERY.SESSION).show()
    }
  }

  // -- USER EVENTS ------------------------------------------------------------
  $(C.QUERY.BUTTON_SESSION).on(C.EVENT.CLICK, function(event) {
    event.preventDefault();
    event.stopPropagation();
    var values = {};
    for (var i = 0, len = C.FIELDS.length; i < len; i++) {
      values[C.FIELDS[i]] = $("input[name='" + C.FIELDS[i] + "']").val();
    }
    storage.insert(C.STORAGE.CINEMAS, values);
    ironhack.list.add(values);
  });

  $(C.QUERY.LIST_ITEM).on(C.EVENT.CLICK, function(event) {
    var el = $(event.delegateTarget);
    el.addClass("active").siblings().removeClass("active");
    var cinema = storage.select(C.STORAGE.CINEMAS, "name", el.attr("data-name"));
    console.log(cinema[0]);
    // @TODO: Show in map
  });
});
