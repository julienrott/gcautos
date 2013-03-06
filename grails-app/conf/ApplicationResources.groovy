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
	
	applicationOLD {
		resource url:'js/libs/jquery-1.7.1.min.js'
		resource url:'js/jquery-ui-1.8.21.custom.min.js'
		resource url:'js/jquery.ui.datepicker-fr.js'
		resource url:'js/jquery.jscroll.min.js'
		resource url:'js/application.js'
		resource url:'js/superfish.js'
		resource url:'js/plugins.js'
		resource url:'js/script.js'
		resource url:'js/tms-0.3NEW.js'
		resource url:'js/tms_presets.js'
		resource url:'js/slider.js'
	}
	
	myStyle {
		resource url:'css/custom-bootstrap.css'
	}

	myStyleOLD{
		resource url:'css/ui-lightness/jquery-ui-1.8.21.custom.css'
		resource url:'css/style.css'
		resource url:'css/blueprint/screen.css'
		resource url:'css/blueprint/ie.css',
				wrapper: { s -> "<!--[if lt IE 8]>$s<![endif]-->" }
		resource url:'css/blueprint/plugins/fancy-type/screen.css'
		resource url:'css/blueprint/print.css', attrs:[media:'print']
		resource url:'css/reset.css'
		resource url:'css/custom.css'
		resource url:'css/grid.css'
	}
}
