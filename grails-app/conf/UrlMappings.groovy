class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"voitures", action:"home")
		"500"(view:'/error')
		
		name paginate: "/$controller/$action?/page-" {
		}
	}
}
