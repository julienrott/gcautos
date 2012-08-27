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
		url:urlContext+'/slider/list',
		dataType:'html'
	}).done(function(res){
		$('#photoSlider').html(res);
		$('.deletePhoto').click(function(e){
			var id = e.currentTarget.id;
			$.ajax({
				url:urlContext+'/slider/deletePhotoSlider?id=' + id,
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

$.ready(updatePhotos());
$.ready(updateNews());
$.ready(updateService());

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
		var title = encodeURI($("#serviceTitle")[0].value);
		//var content = $("#editor")[0].value;
		var content = tinyMCE.get("editor").getContent({format : 'raw'});
		if (title.length > 0 && content.length > 0) {
			$.ajax({
				url:urlContext+'/service/save?titre='+title+'&contenu='+encodeURI(content),
				dataType:'json'
			}).done(updateService);
		}
		return false;
	});
}
