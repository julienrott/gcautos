package com.gcautos.controllers

class SitemapController {

    def index() {
		render(contentType: 'text/xml', encoding: 'UTF-8') {
			mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
			urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
					'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
					'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {
				url {
					loc("http://www.gcautos.fr")
					changefreq('weekly')
					priority(1.0)
				}
				url {
					loc("http://www.gcautos.fr/voitures/occasions/")
				}
				url {
					loc("http://www.gcautos.fr/voitures/neuves/")
				}
				url {
					loc("http://www.gcautos.fr/voitures/quads/")
				}
				url {
					loc("http://www.gcautos.fr/voitures/dirts/")
				}
				url {
					loc("http://www.gcautos.fr/voitures/electriques/")
				}
				url {
					loc("http://www.gcautos.fr/contact/index")
				}
			}
	   }
	}
}
