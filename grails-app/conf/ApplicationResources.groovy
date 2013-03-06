modules = {
	application {
		resource url:'js/jquery-ui-1.8.21.custom.min.js'
		resource url:'js/jquery.ui.datepicker-fr.js'
		resource url:'js/jquery.jscroll.min.js'
		resource url:'js/application.js'
	}
	
	tinymce {
		dependsOn 'application'
		resource url:'js/libs/tiny_mce-3.5.8/jquery.tinymce.js'
	}
	
	myStyle {
		resource url:'css/ui-lightness/jquery-ui-1.8.21.custom.css'
		resource url:'css/custom-bootstrap.css'
	}
}
