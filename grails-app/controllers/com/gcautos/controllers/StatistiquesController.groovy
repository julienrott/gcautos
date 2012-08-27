package com.gcautos.controllers;

import java.util.Calendar;
import java.util.GregorianCalendar;

import com.gcautos.domain.Voiture;

import grails.converters.*
import groovy.sql.Sql;


class StatistiquesController {
	
	def index = {
		
	}
	
	def chart2 = {
		def tab = []
		
		def now = new GregorianCalendar()
		def lastDayOfMonth = now.getActualMaximum( GregorianCalendar.DATE );
		def month1 = now.get( GregorianCalendar.MONTH ) + 1
		month1.toString().length() < 2 ? month1 = "0" + month1 : ""
		def year1 = now.get( GregorianCalendar.YEAR )
		
		now.add( Calendar.MONTH, -5 )
		def firstDayOfMonth = now.getActualMinimum( GregorianCalendar.DATE );
		firstDayOfMonth.toString().length() < 2 ? firstDayOfMonth = "0" + firstDayOfMonth :""
		def month2 = now.get( GregorianCalendar.MONTH ) + 1
		month2.toString().length() < 2 ? month2 = "0" + month2 : ""
		def year2 = now.get( GregorianCalendar.YEAR )
		
		log.debug "$firstDayOfMonth/$month2/$year2 - $lastDayOfMonth/$month1/$year1"
		def className =  grailsApplication.config.dataSource.driverClassName
		def url = grailsApplication.config.dataSource.url
		def user = grailsApplication.config.dataSource.username
		def pass = grailsApplication.config.dataSource.password
		
		def sql = Sql.newInstance(url, user, pass, className)
		sql.eachRow(" select '0'+month( date_vente ) mois, sum( prix_Vente-prix_Achat ) benef " +
				" from Voiture where date_Vente between " + 
				" '$year2-$month2-$firstDayOfMonth' and " +
				" '$year1-$month1-$lastDayOfMonth' " +
				" group by mois " +
				" order by year( date_vente ), mois ") {
				
			log.debug " - $it : $it.mois: $it.benef"
			def t = [x:it.mois, y:it.benef]
			tab.add(t)
		}
		
//		def voitures = Voiture.findByDateVenteBetween( 
//				new Date( "$firstDayOfMonth/$month/$year" ),
//				new Date( "$lastDayOfMonth/$month/$year" ) )
//		
//		log.debug "voiture : $voitures"
		
//		if ( tab.length < 6 )
//		{
//			for ( int i = 6-tab.length; i<7; i++)
//			{
//				
//			}
//		}
		
		render tab as JSON
	}
	
	def chart2Test = {
		def tab = []
		
		def t = [x:"janvier", y:1]
		tab.add(t)
		
		t = [x:"fevrier", y:2]
		tab.add(t)
		
		t = [x:"mars", y:3]
		tab.add(t)
		
		t = [x:"mars", y:4]
		tab.add(t)
		
		t = [x:"mars", y:5]
		tab.add(t)
		
		t = [x:"mars", y:6]
		tab.add(t)
		
		log.debug "${tab}"
		
		render tab as JSON
	}
}
