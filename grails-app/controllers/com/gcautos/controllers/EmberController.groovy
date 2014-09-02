package com.gcautos.controllers

import org.springframework.web.bind.annotation.RequestMethod;

import com.gcautos.domain.*

import grails.converters.JSON

class EmberController {
	
	def voituresService
	
	def voitures() {
		switch (request.method) {
		case "PUT":
			log.debug params
			log.debug request.JSON
			Voiture v = Voiture.get(params.id)
			v.titre = request.JSON.voiture.titre
			v.description = request.JSON.voiture.description
			v.vehicleType = request.JSON.voiture.vehicleType
			v.save()
			def res = [voitures: []]
					res.voitures.push(
							idd: v.id,
							titre: v.titre,
							description: v.description,
							vehicleType: v.vehicleType)
			render res as JSON
			break
		case "GET":
			Voiture v = Voiture.get(params.id)
			def res = [voitures: []]
					res.voitures.push(
							idd: v.id,
							titre: v.titre,
							description: v.description,
							vehicleType: v.vehicleType)
			render res as JSON
			break
		default:
			break
		}
		
	}
	
	private def car(String nom, int type, String route) {
		log.debug params
		log.debug request.method
		try {
			def res = ["$nom": []]
			res."$nom" = []
			def voitures = voituresService.list type, params.page?((params.page as int) - 1)*4:0
			def vTotal = voituresService.count type
			voitures.each {
				res."$nom".push(idd: it.id,
					titre: it.titre,
					description: it.description,
					photo1: createLink(controller:'voitures', action:'showPhoto', 
							id:"${it.photos.toArray().size() > 0 ? it.photos.toArray()[0].id : ''}", 
							params:[type:'small']),
					photo2: createLink(controller:'voitures', action:'showPhoto', 
							id:"${it.photos.toArray().size() > 1 ? it.photos.toArray()[1].id : ''}", 
							params:[type:'small']),
					photos: getPhotosUrls(it.photos)
				)
			}
			
			def pagesTotal
			if(vTotal > 0) {
				pagesTotal = vTotal % 4 > 0 ? (vTotal/4 as int) + 1 : vTotal/4 as int
			}
			else {
				pagesTotal = 1
			}
			res.meta = [pagesTotal: (1..pagesTotal),
					currentPage: params.offset? params.offset / 4 : 1,
					route: route]
			render res as JSON
		} catch (Exception e) {
			log.error e
		}
	}
	
	private String[] getPhotosUrls(def photos) {
		def urls = []
		photos.each{
			urls << createLink(controller:'voitures', action:'showPhoto', id: it.id, params: [type: "small"])
		}
		urls
	}
	
	def occasions() {
		car("occasions", params.type as int, params.route)
	}
	
	def neufs() {
		car("neufs", params.type as int, params.route)
	}
	
	def quads() {
		car("quads", params.type as int, params.route)
	}
	
	def buggies() {
		car("buggies", params.type as int, params.route)
	}
	
	def dirts() {
		car("dirts", params.type as int, params.route)
	}
	
	def electriques() {
		car("electriques", params.type as int, params.route)
	}
	
	def accessoires() {
		Accessoire acc = Accessoire.get(params.id as long)
		def res = [accessoires: []]
		res.accessoires.push(idd: acc.id, titre: acc.titre, contenu: acc.contenu)
		render res as JSON
	}
	
}
