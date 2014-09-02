modules = {
	application {
		dependsOn 'tinymce'
		resource url:'js/jquery-ui-1.8.21.custom.min.js'
		resource url:'js/jquery.ui.datepicker-fr.js'
		resource url:'js/jquery.jscroll.min.js'
		resource url:'js/bootstrap-carousel-custom.js'
		resource url:'js/handlebars-1.3.0.js'
		resource url:'js/ember-1.7.0.min.js'
		resource url:'js/ember-data-latest.js'
		resource url:'js/emberApplication.js'
		resource url:'js/application.js'
	}
	
	tinymce {
		resource url:'js/libs/tiny_mce-3.5.8/jquery.tinymce.js'
	}
	
	myStyle {
		resource url:'css/ui-lightness/jquery-ui-1.8.21.custom.css'
		resource url:'css/custom-bootstrap.css'
	}
}
