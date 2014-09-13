// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require handlebars-1.3.0
//= require bootstrap-transition
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function updateMenuStyle( menu ) {
	if ( menu === "") menu = "accueil";
	//dojo.addClass( menu, "current_page_item" );
	if (dojo.byId(menu))
		dojo.addClass( menu, "current" );
}

function updatePhotos(canDelete) {
	if ($("#id")[0])
	$.ajax({
		url:urlContext+'/voitures/photos?id=' + $("#id")[0].value,
		dataType:'html'
	}).done(function(res){
		$('#photos').html(res);
		$('.deletePhoto').click(function(e){
			var id = e.currentTarget.id;
			$.ajax({
				url:urlContext+'/voitures/deletePhoto?id=' + id,
				dataType:'html'
			}).done(updatePhotos);
		});
	});
	if ($("#photoSlider")[0])
	$.ajax({
		url:urlContext+'/photoSlider/list',
		dataType:'html'
	}).done(function(res){
		$('#photoSlider').html(res);
		$('.deletePhoto').click(function(e){
			var id = e.currentTarget.id;
			$.ajax({
				url:urlContext+'/photoSlider/deletePhotoSlider?id=' + id,
				dataType:'html'
			}).done(updatePhotos);
		});
	});
}

function updateNews() {
	if ($("#news").length > 0){
		$.ajax({
			url:urlContext+'/news/getLastNews',
			dataType:'html'
		}).done(function(res){
			if ($("#newsTitle").length > 0){
				$("#newsTitle")[0].value = "";
				//$("#newsContent")[0].value = "";
				if (tinyMCE.get("newsContent") != undefined) {
					tinyMCE.get("newsContent").setContent("");
				}
			}
			$('#news').html(res);
		});
	}
}

function updateService() {
	if ($("#service").length > 0){
		$.ajax({
			url:urlContext+'/service/getLastService',
			dataType:'html'
		}).done(function(res){
			$('#service').html(res);
		});
	}
}

function updateAccessoires() {
	if ($("#diversMenu").length > 0){
		$.ajax({
			url:urlContext+'/accessoires/list',
			dataType:'html'
		}).done(function(res){
			$('#diversMenu').html(res);
		});
	}
}

$.ready(updatePhotos());
//$.ready(updateNews());
$.ready(updateService());
$.ready(updateAccessoires());
$.ready(blink());

$(document).ready(function() {
	setTimeout(updateNews, 1000);
});

function blink() {
	$(".blink").each(function(){
		//$(this).effect("pulsate", { times:500 }, 1500);
		$(this).pulse( { times:500, duration: 500 } );
	});
}

if ($("#addNews").length > 0) {
	$("#addNews").click(function(e){
		var title = $("#newsTitle")[0].value;
		//var content = $("#newsContent")[0].value;
		var content = tinyMCE.get("newsContent").getContent();
		if (title.length > 0 && content.length > 0) {
			$.ajax({
				method: 'POST',
				url:urlContext+'/news/save',
				data: {titre:title, description:content},
				dataType:'json'
			}).done(updateNews);
		}
		return false;
	});
}

if ($("#saveService").length > 0) {
	$("#saveService").click(function(e){
		//var title = encodeURI($("#serviceTitle")[0].value);
		var title = $("#serviceTitle")[0].value;
		//var content = $("#editor")[0].value;
		//var content = tinyMCE.get("editor").getContent({format : 'raw'});
		var content = tinyMCE.get("tiny-service").getContent();
		if (title.length > 0 && content.length > 0) {
			$.ajax({
				method: 'POST',
				url:urlContext+'/service/save',
				data: {titre:title, contenu:content},
				dataType:'json'
			}).done(updateService);
		}
		return false;
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
