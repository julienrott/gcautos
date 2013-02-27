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
				$("#newsContent")[0].value = "";
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
$.ready(updateNews());
$.ready(updateService());
$.ready(updateAccessoires());
$.ready(blink());
$.ready(scrollpub());

function scrollpub(){
    $('.scrollpub').jScroll({speed : "fast"});
}

function blink() {
	$(".blink").each(function(){
		$(this).effect("pulsate", { times:500 }, 1500);
	});
	/*$('.blink').each(function() {
    var elem = $(this);
    setInterval(function() {
        if (elem.css('visibility') == 'hidden') {
            elem.css('visibility', 'visible');
        } else {
            elem.css('visibility', 'hidden');
        }    
  	}, 1000);
	});*/
}

if ($("#addNews").length > 0) {
	$("#addNews").click(function(e){
		var title = $("#newsTitle")[0].value;
		var content = $("#newsContent")[0].value;
		if (title.length > 0 && content.length > 0) {
			$.ajax({
				url:urlContext+'/news/save?titre='+title+'&description='+content,
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
		var content = tinyMCE.get("editor").getContent();
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
