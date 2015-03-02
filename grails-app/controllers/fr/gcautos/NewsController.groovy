package fr.gcautos

class NewsController {

	def getLastNews() {
		def max = -1
		if (params.action.equals("getLastNews")) max = 2
		def news = News.list(sort: "id", order: "desc", max: max)
		render(template: "lastNews", model:["news": news, "action": params.action])
	}
}
