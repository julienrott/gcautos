package fr.gcautos

import grails.converters.JSON
import groovy.time.TimeCategory

class EmberController {
	
	def voitureService
	def photoService

	def photoSliders() {
		def res = ["photoSlider":[]]
		def photosSlider = photoService.photosSliderAccueil()
		photosSlider.eachWithIndex{it, idx ->
			res.photoSlider.push (id: it.id,
			idd: it.id,
			url: createLink(controller:'photoSlider', action:'show', id:"${it.id}"),
			css: idx == 0 ? 'active' : ''
			)
		}
		render res as JSON
	}

	def voitures() {
		switch (request.method) {
			case "POST":
				Voiture v = new Voiture(
					titre: request.JSON.voiture.titre,
					description: request.JSON.voiture.description,
					vehicleType: request.JSON.voiture.vehicleType,
					mention: request.JSON.voiture.mention,
					prixVente: request.JSON.voiture.prixVente.replaceAll(" ", "") as int)
				
				if (!v.save(flush: true)) {
					v.errors.each {
						log.error it
					}
				}
				def res = [voitures: []]
				res.voitures.push(getVoitureArray(v))
				render res as JSON
				break
				
			case "PUT":
				long[] idsFromRequest = request.JSON.voiture.photos.id
				Voiture v = Voiture.get(params.id)
				v.titre = request.JSON.voiture.titre
				v.description = request.JSON.voiture.description
				v.vehicleType = request.JSON.voiture.vehicleType
				v.mention = request.JSON.voiture.mention
				v.prixVente = request.JSON.voiture.prixVente.replaceAll(" ", "") as int
				if(request.JSON.voiture.deletePhoto && v.photos.id.contains(idsFromRequest[0])) {
					Photo photo = Photo.get(idsFromRequest[0])
					v.removeFromPhotos(photo)
					photo.delete()
				}
				if(request.JSON.voiture.reloadPhoto && v.photos.id.contains(idsFromRequest[0])) {
					Photo photo = Photo.get(idsFromRequest[0])
					photoService.populatePhoto(photo, 1000, 1000, "data_medium")
					photo.save(flush: true)
				}
				
				if (!v.save(flush: true)) {
					v.errors.each {
						log.error it
					}
				}
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
				
			case "DELETE":
				log.debug params
				Voiture v = Voiture.get(params.id)
				v.delete(flush: true)
				render 200
				break
				
			default:
				break
		}
	}
	
	private def car(String nom, int type, String route) {
		try {
			def res = ["$nom": []]
			res."$nom" = []
			def voitures = voitureService.list type, params.page?((params.page as int) - 1)*4:0
			def vTotal = voitureService.count type
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
		def photosUrls = getPhotosUrls(v.id)
		def res = [ idd: v.id,
			id: v.id,
			titre: v.titre,
			description: v.description,
			vehicleType: v.vehicleType,
			mention: v.mention,
//			prixVente: g.formatNumber(number: v.prixVente, format: "###,##0"),
			prixVente: v.prixVente,
			photos: photosUrls,
			photo1: photosUrls[0]?.url,
			photo2: photosUrls[1]?.url
		]
		res
	}
	
	private def getPhotosUrls(def idVoiture) {
		def ids = getPhotosIds(idVoiture)
		def res = []
		ids.each {
			res.push( id: it, url: createLink(controller:'voiture', action:'showPhotoMedium', id: it) )
		}
		res
	}
	
	private def getPhotosIds(def idVoiture) {
		Voiture.executeQuery("select p.id from Photo p inner join p.voiture as v where v.id = p.voiture and v.id=? order by p.position, p.id", [idVoiture])
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
	
	def services() {
		def res = [services: []]
		def service = Service.list(max:1,sort:"id",order:"desc")[0]
				res.services.push(idd: service.id,
				titre: service.titre,
				contenu: service.contenu)
		render res as JSON
	}
	
	def news() {
		switch (request.method) {
			case "DELETE":
				def news = News.get(params.id)
				news.delete(flush: true)
				render 200
				break
			case "POST":
				def news = new News(titre: request.JSON.news.titre,
						description: request.JSON.news.description)
				news.save(flush:true)
				render 200
				break
			case "GET" :
				log.debug params
				def res = [news: []]
						def news = News.list(max: params.int('maxNews') ?: 2, sort:"id", order:"desc")
						news.each {
					res.news.push(idd: it.id,
//				titre: "${formatDate(format: 'EEEE dd MMMM yyyy', date: it.dateCreated)} : ${it.titre}",
							titre: "${formatDate(format: 'dd/MM/yyyy', date: it.dateCreated)} : ${it.titre}",
							description: it.description)
				}
				render res as JSON
				break
		}
	}
	
	def updatePhotosPositions() {
		def positionData = JSON.parse(params.json).positionData
		positionData.each {
			Photo photo = Photo.get(it.id as long)
			photo.position = it.position as int
			photo.save(flush: true)
		}
		render 200
	}
}
