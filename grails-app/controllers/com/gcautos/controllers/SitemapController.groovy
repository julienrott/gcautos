package com.gcautos.controllers

class SitemapController {

    def index() {
		render(contentType: 'text/xml', encoding: 'UTF-8') {
			mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
			urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
					'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
					'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {
				url {
					loc("${grailsApplication.config.grails.serverURL}")
					changefreq('weekly')
					priority(1.0)
				}
				url {
					loc("${grailsApplication.config.grails.serverURL}/voitures/occasions/")
				}
				url {
					loc("${grailsApplication.config.grails.serverURL}/voitures/neuves/")
				}
				url {
					loc("${grailsApplication.config.grails.serverURL}/voitures/quads/")
				}
				url {
					loc("${grailsApplication.config.grails.serverURL}/voitures/dirts/")
				}
				url {
					loc("${grailsApplication.config.grails.serverURL}/voitures/electriques/")
				}
				url {
					loc("${grailsApplication.config.grails.serverURL}/contact/index")
				}
			}
	   }
	}
}
