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
	
	@CacheEvict(value='photos', allEntries=true)
	//@CacheEvict(value='voitures', allEntries=true)
	def upload() {
		//log.error "upload params : ${params}"
		
		try {
			def photo = new Photo()
			photo.data = request.getInputStream().getBytes()
			ByteArrayInputStream buff = new ByteArrayInputStream( photo.data )

			BufferedImage croppedImage = photosService.resize(buff, 350, 350)
			ByteArrayOutputStream baos = new ByteArrayOutputStream(1000);
			ImageIO.write(croppedImage, "jpg", baos);
			photo.data_small = baos.toByteArray();

			ByteArrayInputStream buff2 = new ByteArrayInputStream( photo.data )
			BufferedImage croppedImage2 = photosService.resize(buff2, 990, 415)
			ByteArrayOutputStream baos2 = new ByteArrayOutputStream(1000);
			ImageIO.write(croppedImage2, "jpg", baos2);
			photo.data_slider = baos2.toByteArray();

			ByteArrayInputStream buff3 = new ByteArrayInputStream( photo.data )
			BufferedImage croppedImage3 = photosService.resize(buff3, 210, 132)
			ByteArrayOutputStream baos3 = new ByteArrayOutputStream(1000);
			ImageIO.write(croppedImage3, "jpg", baos3);
			photo.data_small_homepage = baos3.toByteArray();

			photo.voiture = Voiture.get(params["id"])
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
