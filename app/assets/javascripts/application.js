// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require jquery.flexslider
//= require_tree .

$(document).on('turbolinks:load', function () {
    $('.message .close')
        .on('click', function () {
            $(this)
                .closest('.message')
                .transition('fade')
            ;
        })
    ;
});



$(document).on("turbolinks:load", function () {
    $('.flexslider').flexslider();

    $('.right-btn').on('click', function () {
        $('.flexslider').flexslider('next');
    });
    $('.left-btn').on('click', function () {
        $('.flexslider').flexslider('prev');
    });
    $(".user-rating").rating();
    $('.local-rating').rating();
    $(".user-rating").rating('disable');

    $('.local-rating').on('click', function (event) {
        let rating = $('.local-rating').rating('get rating')
        console.log(rating)
        document.cookie = "rating=" + rating;
    });
    document.cookie = "rating=" + 0;

    $('.contact-form-message').hide();
    $('.contacts-send-button').on('click',function (event) {
        $('.contact-form-message').show();
        setTimeout(function () {
            $('.contact-form-message').hide();
        }, 5000);
    });

    $('.ui.dropdown').dropdown();

    $('.clear-comment').on('click', function (event) {
        $('.comment-area').val('');
        document.cookie = "rating=" + 0;
        $('.local-rating').rating('set rating', 0);

    });
});
