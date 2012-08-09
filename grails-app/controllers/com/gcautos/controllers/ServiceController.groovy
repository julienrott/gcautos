package com.gcautos.controllers

import com.gcautos.domain.Service

import grails.plugins.springsecurity.Secured

class ServiceController {
	
	def springSecurityService
	def service

  def index = { 
	}

	def getLastService = {
		service = Service.list(max:1,sort:"id",order:"desc")[0]
		render(template:"lastService", model:["service":service])
	}

	@Secured(['ROLE_ADMIN'])
	def save = {
		service = new Service(params)
		if(!service.hasErrors() && service.save()) {
			render true
		} else {
			service.errors.each { 
				log.error "${it}"
			}
		}
	}

}
