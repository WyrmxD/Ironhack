jQuery(function($) {
    $('.js-rate').on('click', function(evt) {

        evt.preventDefault();

        var $this = $(this);
        var $container = $this.closest('.js-rating-container');
        var href = $this.attr('href');
        
        $.post(href).done(function(html) {
            $container.replaceWith(html);
        });
    });
});
