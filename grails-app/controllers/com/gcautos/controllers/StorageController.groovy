package com.gcautos.controllers


import java.io.ByteArrayInputStream;

import java.io.File;

import com.gcautos.domain.Photo;
import com.gcautos.domain.Voiture;

import grails.converters.*;

class StorageController {
	def photosService
	
	def index = { }
	
	def upload = {
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
