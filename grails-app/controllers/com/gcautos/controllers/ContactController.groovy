package com.gcautos.controllers

import grails.converters.*;

import grails.plugins.springsecurity.Secured

class ContactController{

	def springSecurityService

	def index = {
	}

	def sendMail = {
		to "julien.rott@gmail.com"
		subject "Contact depuis le site internet"
		body ''
	}
}
