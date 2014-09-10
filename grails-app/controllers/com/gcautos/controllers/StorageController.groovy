package com.gcautos.controllers

import javax.imageio.ImageIO;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import java.io.File;
import java.awt.image.BufferedImage;

import com.gcautos.domain.Photo;
import com.gcautos.domain.Voiture;

import grails.plugin.cache.CacheEvict

import grails.converters.*;

class StorageController {
	def photosService
	
	def index = { }
	
	//@CacheEvict(value='photos', allEntries=true)
	//@CacheEvict(value='voitures', allEntries=true)
	def upload() {
		//log.error "upload params : ${params}"
		log.debug params
		
		try {
			def photo = new Photo()
			photo.data = request.getInputStream().getBytes()
			ByteArrayInputStream buff = new ByteArrayInputStream( photo.data )

			photosService.resize(photo,  350,  350, "data_small")
			photosService.resize(photo,  990,  415, "data_slider")
			photosService.resize(photo,  210,  132, "data_small_homepage")
			photosService.resize(photo, 1000, 1000, "data_medium")

			photo.voiture = Voiture.get(params["id"] as long)
			photo.titre = request.getHeader('X-File-Name') as String
			
			if (photo.save()) {
				//log.error "upload ok"
				
				//photosService.writePhoto( photo.id )
				
				log.debug "resize ok"
			} else {
				log.error photo.errors
			}

			return render(text: [success:true] as JSON, contentType:'text/json')
		} catch(Exception e) {
			log.error "upload ${e}"
			return render(text: [success:false] as JSON, contentType:'text/json')
		}
	}
	
	def uploadOLD = {
		log.debug "upload params : ${params}"
		
		//Once you reach this point upload progress is complete
		//and file is ready to be massaged into storage
		try {
			def file = request.getFile('myFile')
			def photo = new Photo()
			photo.data = file.bytes
			photo.voiture = Voiture.get(params["id"])

			def name = file.getOriginalFilename()[0..file.getOriginalFilename().lastIndexOf('.') - 1]
			def ext = file.getOriginalFilename()[file.getOriginalFilename().lastIndexOf('.')..file.getOriginalFilename().size() - 1]
			def exist = true
			while (exist) {
				def p = Photo.findByTitre(name + ext)
				if (p != null){
					name += "_1"
				} else {
					exist = false
				}
			}
			photo.titre = name + ext
			
			if (photo.save()) {
				log.debug "upload ok"
				
				photosService.writePhoto( photo.id )
				
				log.debug "resize ok"
			} else {
				log.error photo.errors
			}
			render "<textarea>ok</textarea>"
		} catch(Exception e) {
			log.error "upload ${e}"
		}
	}  
	
	//This closure is polled by the client-side Javascript
	//for upload progress information. It pulls information
	//from various sources tied to user's session
	def uploadInfo = {
		
		def progressMap = session.getAttribute("progressMap")
		def progressStatus = session.getAttribute("progressStatus")
		
		if (!progressMap) {
			render("No ProgressMap you Dweeb(tm)!")
		}
		
		//if we don't have progress info in the session, it could
		//indicate that the file upload was to small to require streaming
		//and possibly finished before we could check progress
		if (progressMap?.bytesRead == null){
			render(builder:'json'){
				bytesRead(1 )   
				totalSize(1 )
				status(AjaxProgressListener.STATUS_DONE)
			}   
		}
		
		
		//Aahh.. JSON builders how I love thee :)
		render(builder:'json'){
			bytesRead(progressMap['bytesRead'] )   
			totalSize(progressMap['length'] )
			status(progressStatus)
		}
		
	}
	
}
