class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"dashboard", action: "index")
		"500"(view:'/error')
	}
}
