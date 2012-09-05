package com.gcautos.controllers

import com.gcautos.domain.Accessoire

import grails.plugins.springsecurity.Secured

class AccessoiresController {
	
	def springSecurityService

	def accessoires
	def accessoire

	@Secured(['ROLE_ADMIN'])
  def index() {
		accessoires = Accessoire.findAll("from Accessoire a order by a.titre asc") 
	}

  def list() {
		accessoires = Accessoire.findAll("from Accessoire a order by a.titre asc") 
		render(template:'menu')
	}

  def view() {
		accessoire = Accessoire.get(params.id)
		render(view:"view")
	}

	@Secured(['ROLE_ADMIN'])
	def save() {
		def a = Accessoire.get(params.id)
		if ( a ) {
			a.properties = params
		} else {
			a = new Accessoire( params )
		}

		if(!a.hasErrors() && a.save()) {
		} else {
			a.errors.each { 
				log.error "${it}"
			}
		}
		redirect(action:"view", id:a.id)
	}

	@Secured(['ROLE_ADMIN'])
  def delete() {
		def accessoire = Accessoire.get(params.id)
		accessoire.delete()
		redirect(action:"index") 
	}

}
