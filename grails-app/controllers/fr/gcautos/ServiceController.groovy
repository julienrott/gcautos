package fr.gcautos

class ServiceController {

	def getLastService = {
		def service = Service.list(max:1,sort:"id",order:"desc")[0]
		render(template:"lastService", model:["service":service])
	}
}
