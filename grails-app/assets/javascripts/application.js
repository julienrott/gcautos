// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require handlebars-1.3.0
//= require bootstrap
//= require_tree .
//= require_self

$(document).ready(function() {
});

$(document).ajaxStart(function() {
	$('#spinner').fadeIn();
}).ajaxStop(function() {
	$('#spinner').fadeOut();
});

function blink() {
	$(".blink").each(function(){
		//$(this).effect("pulsate", { times:500 }, 1500);
		$(this).pulse( { times:500, duration: 500 } );
	});
}

reloadCar = function() {
	$('#reloadCarBtn').click()
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
