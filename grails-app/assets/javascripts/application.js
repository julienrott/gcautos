// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require jquery.spritely
//= require jquery.sortable
//= require handlebars-1.3.0
//= require bootstrap
//= require bootstrap-carousel-custom
//= require ember-1.7.0
//= require ember-data-latest
//= require emberApplication
// require_tree .
//= require_self

$(document).ajaxStart(function() {
	$('#spinner').fadeIn();
//	$('#spinnerSprite').spStart();
}).ajaxStop(function() {
	$('#spinner').fadeOut();
//	$('#spinnerSprite').spStop();
});

$(document).ready(function() {
	$('.spinnerSprite').sprite({ fps: 10, no_of_frames: 12 }).spStart();
//	$('#spinnerSprite').spStart();
//	$('#spinnerSprite').sprite();
});

function blink() {
	$(".blink").each(function(){
		$(this).pulse( { times:500, duration: 500 } );
	});
}

reloadCar = function() {
	$('#reloadCarBtn').click();
};

reloadPhotos = function() {
	$('#reloadPhotosBtn').click();
}

$.fn.pulse = function(options) {

    var options = $.extend({
        times: 3,
        duration: 1000
    }, options);

    var period = function(callback) {
        $(this).animate({opacity: 0}, options.duration, function() {
            $(this).animate({opacity: 1}, options.duration, callback);
        });
    };
    return this.each(function() {
        var i = +options.times, self = this,
        repeat = function() { --i && period.call(self, repeat) };
        period.call(this, repeat);
    });
};
