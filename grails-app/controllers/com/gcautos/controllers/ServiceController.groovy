package com.gcautos.controllers

import com.gcautos.domain.Service

import grails.plugins.springsecurity.Secured

class ServiceController {
	
	def springSecurityService
	def service

  def index = { 
	}

	def getLastService = {
		service = Service.get(1)
		render(template:"lastService", model:["service":service])
	}

	@Secured(['ROLE_ADMIN'])
	def save = {
		def service = Service.get(1)
		if (service != null)
		{
			service.titre = params.titre
			service.contenu = params.contenu
		}
		else
		{
			service = new Service(params)
		}
		if(!service.hasErrors() && service.save()) {
			render true
		} else {
			service.errors.each { 
				log.error "${it}"
			}
		}
	}

}
