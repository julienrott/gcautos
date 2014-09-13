package fr.gcautos

import grails.converters.JSON

class EmberController {
	
	def voitureService
	def photoService

	def photoSliders() {
		def res = ["photoSlider":[]]
		def photosSlider = photoService.photosSliderAccueil()
		photosSlider.eachWithIndex{it, idx ->
			res.photoSlider.push (id: it.id,
			idd: it.id,
			url: createLink(controller:'photoSlider', action:'showPhotoSlider', id:"${it.id}", params:[type:'slider']),
			css: idx == 0 ? 'active' : ''
			)
		}
		render res as JSON
	}

	def voitures() {
		log.debug params
		log.debug request.JSON
		switch (request.method) {
			case "PUT":
				long[] idsFromRequest = request.JSON.voiture.photos.id
				Voiture v = Voiture.get(params.id)
				v.titre = request.JSON.voiture.titre
				v.description = request.JSON.voiture.description
				v.vehicleType = request.JSON.voiture.vehicleType
				v.mention = request.JSON.voiture.mention
				if(request.JSON.voiture.deletePhoto && v.photos.id.contains(idsFromRequest[0])) {
					Photo photo = Photo.get(idsFromRequest[0])
					v.removeFromPhotos(photo)
					photo.delete()
				}
				v.save()
				def res = [voitures: []]
				res.voitures.push(getVoitureArray(v))
				render res as JSON
				break
			case "GET":
				Voiture v = Voiture.get(params.id)
				def res = [voitures: []]
				res.voitures.push(getVoitureArray(v))
				render res as JSON
				break
			default:
				break
		}
	}
	
	private def car(String nom, int type, String route) {
		try {
			def res = ["$nom": []]
			res."$nom" = []
			def voitures = voituresService.list type, params.page?((params.page as int) - 1)*4:0
			def vTotal = voituresService.count type
			voitures.each {
				res."$nom".push(getVoitureArray(it))
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
	
	private def getVoitureArray(Voiture v) {
		[ idd: v.id,
			id: v.id,
			titre: v.titre,
			description: v.description,
			vehicleType: v.vehicleType,
			mention: v.mention,
			prixVente: g.formatNumber(number: v.prixVente, format: "###,##0"),
			photos: getPhotosUrls(v.photos),
			photo1: createLink(controller:'voitures', action:'showPhoto',
			id:"${v.photos.toArray().size() > 0 ? v.photos.toArray()[0].id : ''}",
			params:[type:'medium']),
			photo2: createLink(controller:'voitures', action:'showPhoto',
			id:"${v.photos.toArray().size() > 1 ? v.photos.toArray()[1].id : ''}",
			params:[type:'medium'])]
	}
	
	private def getPhotosUrls(def photos) {
		def res = []
		photos.each{
			res.push( id: it.id, url: createLink(controller:'voitures', action:'showPhoto', id: it.id, params: [type: "medium"]) )
		}
		res
	}
	
	def voituresHomes() {
		def voitures = voitureService.home()
		def res = [voituresHomes: []]
		voitures.each {
			res.voituresHomes.push(getVoitureArray(it))
		}
		render res as JSON
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
	
	def ajaxUploader() {
		log.debug params
		render template: '/ajaxUploader/ajaxUploader', model: [id: params.id]
	}
}
