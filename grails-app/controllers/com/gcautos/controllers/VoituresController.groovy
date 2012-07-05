package com.gcautos.controllers

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import com.gcautos.domain.Photo;
import com.gcautos.domain.Voiture;

import grails.plugins.springsecurity.Secured

class VoituresController {
	
	def springSecurityService
	def photosService
	
	def voitures
	def voiture
	def menu
	
	
    def index = { }
	
	def home={
		voitures = Voiture.findAllByDateVenteIsNull()
		render(view:"home")
	}
	
	@Secured(['ROLE_ADMIN'])
	def save = {
		try{
			log.debug "Save : params = $params"
			def v = Voiture.get(params.id)
			
			params.dateAchat = Date.parse("dd/MM/yyyy", params.dateAchat)
			params.dateVente = Date.parse("dd/MM/yyyy", params.dateVente)

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
			def newParams = [id:v?.id]
			redirect(action:view, params:newParams)
			//redirect(action:occasions)
		} catch (Exception e) {
			log.error("ERROR", e)
		}
	}
	
	def view = {
		voiture = Voiture.get(params.id)
		/*if ( voiture.neuve )
			menu = "neuves"
		else
			menu = "occasions"*/
	}
	
	@Secured(['ROLE_ADMIN'])
	def create = {
		render(view:'input')
	}
	
	@Secured(['ROLE_ADMIN'])
	def update = {
		voiture = Voiture.get(params.id)
		/*if ( voiture.neuve )
			menu = "neuves"
		else
			menu = "occasions"*/
		render(view:'input')
	}
	
	@Secured(['ROLE_ADMIN'])
	def delete = {
		def v = Voiture.get(params.id)
		if (v) {
			v.delete()
		} else {
			log.error "Object not found..."
		}
		redirect(action:occasions)
	}
	
	def occasions = {
		try {
			menu = "occasions"
			voitures = Voiture.findAllByDateVenteIsNull()
			log.debug "Occasions : $voitures.size"
			log.debug "liste : $voitures"
			render(view:'index')
		} catch (Exception e) {
			log.error e
		}
	}
	
	@Secured(['ROLE_ADMIN'])
	def vendues = {
		try {
			menu = "neuves"
			voitures = Voiture.findAllByDateVenteIsNotNull()
			log.debug "Neuves : $voitures.size"
			log.debug "liste : $voitures"
			render(view:'index')
		} catch (Exception e) {
			log.error e
		}
	}
	
	def photos = {
		log.debug "photos params : ${params}"
		
		try {
			
			def v = Voiture.get(params.id)
			def photos = v.photos
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
		log.debug "showPhoto params : ${params}"
		
		try {
			
			def photo = Photo.get( params.id ) // get the record
			response.outputStream << photo.data_small// write the image to the outputstream
			response.outputStream.flush()
			
		} catch(Exception e) {
			log.error "showPhoto : ${e}"
		}
	}
	
	@Secured(['ROLE_ADMIN'])
	def deletePhoto = {
		log.debug "deletePhoto params : ${params}"
		
		try {
			def photo = Photo.get( params.id )
			log.debug "deletePhoto photo.titre: ${photo.titre}"
			File file = new File("web-app/static/images/${params.idVoiture}/SMALL_${photo.titre}")
			log.debug "deletePhoto getAbsolutePath: " + file.getAbsolutePath()
			log.debug "deletePhoto getCanonicalPath: " + file.getCanonicalPath()
			if (file != null) {
				log.debug "deletePhoto photo.titre: ${photo.titre} trouvee"
				if (file.delete()) {
					log.debug "deletePhoto photo.titre: ${photo.titre} supprim�e"
				} else {
					log.debug "deletePhoto photo.titre: ${photo.titre} non supprim�e"
					log.debug "deletePhoto file: ${file.canonicalPath}"
					FileUtils.forceDelete(new File(file.getCanonicalPath()))
					log.debug "deletePhoto photo.titre: ${photo.titre} supprim�e par force !"
				}
			} else {
				log.debug "deletePhoto photo.titre: ${photo.titre} non trouvee"
			}
			photo.delete()
			log.debug "deletePhoto OK"
			render true
			
		} catch(Exception e) {
			log.error "deletePhoto : ${e}"
		}
	}
}
