class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		//"/"(view:"/index")
		"/"(controller:"voitures", action:"home")
		"500"(view:'/error')
	}
}
