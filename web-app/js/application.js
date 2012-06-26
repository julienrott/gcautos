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

