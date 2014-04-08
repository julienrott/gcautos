package com.gcautos.services;

import org.apache.commons.io.FileUtils;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import javax.imageio.ImageIO;

import com.gcautos.domain.Photo;
import com.gcautos.domain.PhotoSlider;

import grails.plugin.cache.Cacheable

import org.springframework.web.context.ServletContextAware;
import javax.servlet.ServletContext;

class PhotosService {
	
	ServletContext servletContext
	
	void setServletContext(ServletContext context) {
		servletContext = context
	}
	
	//@Cacheable('photos')
	def get(def id) {
		Photo.get(id)
	}
	
	//@Cacheable('photosSliderAccueil')
	def getPhotoSliderAccueil(def id) {
		PhotoSlider.get(id)
	}
	
	//@Cacheable('photosSliderAccueil')
	def photosSliderAccueil() {
		PhotoSlider.list()
	}
	
	public void writePhoto(long idPhoto)
	{
		def photo = Photo.get(idPhoto)
		
		if ( photo == null)
		{
			log.error "photo $idPhoto does not exist !"
			return
		}
		
		String contextPath = servletContext.getRealPath("");
		String photoPath = "$contextPath/static/images/$photo.voiture.id"
		
		log.debug "contextPath : $contextPath"
		log.debug "photoPath : $photoPath"
		
		FileUtils.forceMkdir( new File( photoPath ) )
//		BufferedImage buff = ImageIO.read( new ByteArrayInputStream( photo.data ) )
		ByteArrayInputStream buff = new ByteArrayInputStream( photo.data )
		ImageIO.write( resize(buff, 550, 550), "jpg",
				new File( photoPath + "/SMALL_$photo.titre" ) )
	}
   
   public BufferedImage resize(InputStream p_image, int p_width, int p_height) {
	   
	   InputStream imageStream = new BufferedInputStream(p_image);
	   Image image = (Image) ImageIO.read(imageStream);
	   
	   int thumbWidth = p_width;
	   int thumbHeight = p_height;
	   
	   // Make sure the aspect ratio is maintained, so the image is not skewed
	   double thumbRatio = (double)thumbWidth / (double)thumbHeight;
	   int imageWidth = image.getWidth(null);
	   int imageHeight = image.getHeight(null);
	   double imageRatio = (double)imageWidth / (double)imageHeight;
	   if (thumbRatio < imageRatio) {
		   thumbHeight = (int)(thumbWidth / imageRatio);
	   } else {
		   thumbWidth = (int)(thumbHeight * imageRatio);
	   }
	   
	   int type = image.getType() == 0? BufferedImage.TYPE_INT_ARGB : image.getType();
	   BufferedImage resizedImage = new BufferedImage(thumbWidth, thumbHeight, type);
	   Graphics2D g = resizedImage.createGraphics();
	   g.setComposite(AlphaComposite.Src);
	   
	   g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	   
	   g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
	   
	   g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
	   
	   g.drawImage(image, 0, 0, thumbWidth, thumbHeight, null);
	   g.dispose();
	   return resizedImage;
   }
   
}
