package com.gcautos.controllers

import javax.imageio.ImageIO;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import java.io.File;
import java.awt.image.BufferedImage;

import com.gcautos.domain.PhotoSlider;

import grails.converters.*;

import grails.plugins.springsecurity.Secured
import grails.plugin.cache.CacheEvict

class PhotoSliderController{

	def photosService
	def springSecurityService

	@Secured(['ROLE_ADMIN'])
	def index = {
		
	}

	def list = {
		try {
			def photos = photosService.photosSliderAccueil()
			render(template:"photos", model:["photos":photos])

		} catch(Exception e) {
			log.error "photos : ${e}"
		}
	}

	def showPhotoSlider = {
		//cache shared:true, neverExpires:true

		try {
			
			def photo = photosService.getPhotoSliderAccueil(params.id)

			/*if(request.getHeader("If-Modified-Since"))
			{
				def reqDate = new Date(request.getHeader("If-Modified-Since"))
				if (photo.lastUpdated < reqDate)
				{
					render(status: 304)
				}
			}*/

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
	//@CacheEvict(value='photosSliderAccueil', allEntries=true)
	def deletePhotoSlider() {
		def photo = PhotoSlider.get(params.id)
		photo.delete()
		render true
	}

	@Secured(['ROLE_ADMIN'])
	//@CacheEvict(value='photosSliderAccueil', allEntries=true)
	def upload() {
		
		try {
			def photo = new PhotoSlider()
			photo.data = request.getInputStream().getBytes()
			ByteArrayInputStream buff = new ByteArrayInputStream( photo.data )

			ByteArrayInputStream buff2 = new ByteArrayInputStream( photo.data )
			BufferedImage croppedImage2 = photosService.resize(buff2, 990, 415)
			ByteArrayOutputStream baos2 = new ByteArrayOutputStream(1000);
			ImageIO.write(croppedImage2, "jpg", baos2);
			photo.data_slider = baos2.toByteArray();

			if (photo.save()) {
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
}
