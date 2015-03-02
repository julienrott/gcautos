package fr.gcautos

import javax.servlet.http.HttpServletResponse
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

@Secured(value="permitAll")
class LoginController {

    def authAjax() {
	   response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
	   //response.sendError HttpServletResponse.SC_UNAUTHORIZED
	   response.setStatus HttpServletResponse.SC_ACCEPTED
	}
}
