class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"voitures", action:"home")
		"500"(view:'/error')
		"/sitemap.xml"(view:'/sitemap.xml')
		name paginate: "/$controller/$action?/page-" {
		}
	}
}
