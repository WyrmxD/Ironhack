jQuery(function($){
  $('#comment_form_button').click(function() {
    $(this).effect('explode');
    var $commentForm = $('#comment_form');

    $commentForm.show(200, function() {
      $commentForm.effect('pulsate');
    });
  });
});
