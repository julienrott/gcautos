class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		//"/"(view:"/index")
		"/"(controller:"voitures", action:"home")
		"/$controller/$action"(controller:"$controller", action:"$action")
		"500"(view:'/error')
	}
}
