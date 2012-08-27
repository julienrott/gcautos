class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		//"/"(view:"/index")
		"/"(controller:"voitures", action:"home")
		"/photoSlider"(controller:"photoSlider", action:"index")
		"/photoSlider/index"(controller:"photoSlider", action:"index")
		"500"(view:'/error')
	}
}
