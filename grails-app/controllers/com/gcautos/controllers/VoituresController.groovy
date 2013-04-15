package com.gcautos.controllers

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import com.gcautos.domain.Photo;
import com.gcautos.domain.PhotoSlider;
import com.gcautos.domain.Service;
import com.gcautos.domain.Voiture;
import com.gcautos.services.VoituresService;

import grails.plugins.springsecurity.Secured
import grails.plugin.cache.CacheEvict

class VoituresController {
	
	def springSecurityService
	def photosService
	def voituresService
	
	def voitures
	def photosVoitures = [:]
	def voiture
	def menu
	def service
	def photosSlider
	def vTotal
	
	
  def index = { }
	
	def home() {
		log.debug "-------------------------"
		voitures = voituresService.home()
		voitures.each {
			photosVoitures[it.id] = voituresService.getPhotos(it.id)
		}
		log.debug photosVoitures
		service = Service.list(max:1,sort:"id",order:"desc")[0]
		photosSlider = photosService.photosSliderAccueil()
		render(view:"/index", model:[voitures:voitures, photosVoitures: photosVoitures, service:service, photosSlider:photosSlider])
	}
	
	@Secured(['ROLE_ADMIN'])
	@CacheEvict(value='voitures', allEntries=true)
	def save() {
		try{
			log.debug "Save : params = $params"
			def v = Voiture.get(params.id)
			
			params.dateAchat = params.dateAchat != "" ? Date.parse("dd/MM/yyyy", params.dateAchat) : null
			params.dateVente = params.dateVente != "" ? Date.parse("dd/MM/yyyy", params.dateVente) : null

			if ( v ) {
				log.debug "UPDATE"
				v.properties = params
			} else {
				log.debug "INSERT"
				v = new Voiture( params )
			}

			if(!v.hasErrors() && v.save()) {
				log.debug "OK"
			} else {
				v.errors.each { 
					log.error "${it}"
				}
			}
			def newParams = [id:v.id]
			redirect(action:update, params:newParams )
		} catch (Exception e) {
			log.error("ERROR", e)
		}
	}
	
	def view() {
		voiture = voituresService.get(params.id)
	}
	
	@Secured(['ROLE_ADMIN'])
	def create = {
		render(view:'input')
	}
	
	@Secured(['ROLE_ADMIN'])
	def update = {
		voiture = Voiture.get(params.id)
		render(view:'input')
	}
	
	@Secured(['ROLE_ADMIN'])
	@CacheEvict(value='voitures', allEntries=true)
	def delete() {
		def v = Voiture.get(params.id)
		if (v) {
			v.delete()
		} else {
			log.error "Object not found..."
		}
		redirect(action:'occasions')
	}
	
	def occasions() {
		try {
			menu = "occasions"
			voitures = voituresService.list 0, params.offset?:0
			vTotal = voituresService.count 0
			voitures.each {
				photosVoitures[it.id] = voituresService.getPhotos(it.id)
			}
			render(view:'index')
		} catch (Exception e) {
			log.error e
		}
	}
	
	def neuves() {
		try {
			menu = "neuves"
			voitures = voituresService.list 1, params.offset?:0
			vTotal = voituresService.count 1
			voitures.each {
				photosVoitures[it.id] = voituresService.getPhotos(it.id)
			}
			render(view:'index')
		} catch (Exception e) {
			log.error e
		}
	}
	
	def quads() {
		try {
			menu = "quads"
			voitures = voituresService.list 2, params.offset?:0
			vTotal = voituresService.count 2
			voitures.each {
				photosVoitures[it.id] = voituresService.getPhotos(it.id)
			}
			render(view:'index')
		} catch (Exception e) {
			log.error e
		}
	}
	
	def dirts() {
		try {
			menu = "dirts"
			voitures = voituresService.list 3, params.offset?:0
			vTotal = voituresService.count 3
			voitures.each {
				photosVoitures[it.id] = voituresService.getPhotos(it.id)
			}
			render(view:'index')
		} catch (Exception e) {
			log.error e
		}
	}
	
	def electriques() {
		try {
			menu = "electriques"
			voitures = voituresService.list 4, params.offset?:0
			vTotal = voituresService.count 4
			voitures.each {
				photosVoitures[it.id] = voituresService.getPhotos(it.id)
			}
			render(view:'index')
		} catch (Exception e) {
			log.error e
		}
	}
	
	@Secured(['ROLE_ADMIN'])
	def vendues = {
		try {
			menu = "vendues"
			voitures = Voiture.findAllByDateVenteIsNotNull([sort:"dateVente", order:"desc"])
			render(view:'index')
		} catch (Exception e) {
			log.error e
		}
	}
	
	def photos = {
		log.debug "photos params : ${params}"
		//cache shared:true, neverExpires:true
		if (!params.id) {
			render ""
			return
		}

		try {
			
			def v = voituresService.get(params.id)
			def photos = voituresService.getPhotos(params.id)
			render(template:"photos", model:["photos":photos])
			
		} catch(Exception e) {
			log.error "photos : ${e}"
		}
	}
	
	def photosOLD = {
		log.debug "photos params : ${params}"
		
		try {
			
			def v = Voiture.get(params.id)
			def photos = v.photos
			photos.each { photo ->
				def path = "web-app/static/images/$v.id/SMALL_$photo.titre"
				File f = new File(path)
				boolean photoExists = f.exists()
				if (!photoExists)
					photosService.writePhoto(photo.id)
				log.debug "photo : $path - $f - $photoExists"
			}
			render(template:"photos", model:["photos":photos])
			
		} catch(Exception e) {
			log.error "photos : ${e}"
		}
	}
	
	def showPhoto = {
		cache shared:true, neverExpires:true
		
		try {
			
			def photo = photosService.get( params.id )

			if(request.getHeader("If-Modified-Since"))
			{
				def reqDate = new Date(request.getHeader("If-Modified-Since"))
				if (photo.lastUpdated < reqDate)
				{
					render(status: 304)
				}
			}

			switch (params.type)
			{
				case "small" : response.outputStream << photo.data_small; break;// write the image to the outputstream
				case "slider" : response.outputStream << photo.data_slider; break;
				case "small_homepage" : response.outputStream << photo.data_small_homepage; break;
			}
			response.outputStream.flush()
			
		} catch(Exception e) {
			log.error "showPhoto : ${e}"
		}
	}
	
	@Secured(['ROLE_ADMIN'])
	@CacheEvict(value='photos', allEntries=true)
	//@CacheEvict(value='voitures', allEntries=true)
	def deletePhoto() {
		log.debug "deletePhoto params : ${params}"
		
		try {
			def photo = Photo.get( params.id )
			photo.delete()
			log.debug "deletePhoto OK"
			render true
			
		} catch(Exception e) {
			log.error "deletePhoto : ${e}"
		}
	}
}
