package com.gcautos.controllers

import com.gcautos.domain.News

import grails.plugins.springsecurity.Secured

class NewsController {
	
	def springSecurityService

	def news

  def index = { 
	}

	@Secured(['ROLE_ADMIN'])
	def save = {
		def news = new News(params)
		if(!news.hasErrors() && news.save()) {
			render true
		} else {
			news.errors.each { 
				log.error "${it}"
			}
		}
	}

	def getLastNews = {
		def max = -1
		if (params.action.equals("getLastNews")) max = 2
		news = News.list(sort:"id", order:"desc", max:max)
		render(template:"lastNews", model:["news":news])
	}

}
