package fr.gcautos

import grails.transaction.Transactional

import java.awt.AlphaComposite
import java.awt.Graphics2D
import java.awt.Image
import java.awt.RenderingHints
import java.awt.image.BufferedImage

import javax.imageio.ImageIO

@Transactional
class PhotoService {

	Photo get(long id) {
		Photo.get(id)
	}

	PhotoSlider getPhotoSliderAccueil(long id) {
		PhotoSlider.get(id)
	}

	def photosSliderAccueil() {
		PhotoSlider.list()
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
	
	public void populatePhoto(Photo photo, int width, int height, String field) {
		ByteArrayInputStream buff = new ByteArrayInputStream( photo.data )
		BufferedImage croppedImage = resize(buff, width, height)
		ByteArrayOutputStream baos = new ByteArrayOutputStream(1000);
		ImageIO.write(croppedImage, "jpg", baos);
		photo."$field" = baos.toByteArray();
	}
}
