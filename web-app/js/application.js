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
	$.ajax({
		url:'/gcautos/voitures/photos?id=' + $("#id")[0].value,
		dataType:'html'
	}).done(function(res){
		$('#photos').html(res);
		$('.deletePhoto').click(function(e){
			var id = e.currentTarget.id;
			$.ajax({
				url:'/gcautos/voitures/deletePhoto?id=' + id,
				dataType:'html'
			}).done(updatePhotos);
		});
	});
}


$.ready(updatePhotos());
