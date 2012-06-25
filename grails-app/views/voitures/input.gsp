<html>
    <head>
    
        <title><g:message code="menu.occasions"/></title>
		<meta name="layout" content="main" />
		
    </head>
    
    <body>

			<!-- menu -->
			<nav>
				<sec:ifAllGranted roles="ROLE_ADMIN">
	
					<ul class="sf-menu sf-js-enabled sf-shadow">
						<li id="neuves"><g:link controller="voitures" action="vendues"><g:message code="menu.vendues"/></g:link></li>
						<li><g:link controller="voitures" action="create"><g:message code="menu.create.voiture"/></g:link></li>
						<li><g:link controller="statistiques" ><g:message code="menu.statistiques"/></g:link></li>
					</ul>
	
					<div id="coordsMouse">aa</div>
					<div id="coordsPhoto">aa</div>
				</sec:ifAllGranted>
				
				<div class="clear"></div>	
			</nav>
			<!-- end menu -->

    	<div id="post">
			
			<fieldset>
				<g:form action="save" id="${voiture?.id}">
	
				<g:hiddenField id="id" name="id" value="${voiture?.id}" />
	
				<p>
					<label for="titre">Titre</label>
					<g:textField id="titre" name="titre"
						value="${voiture?.titre}"
						data-dojo-type="dijit.form.TextBox"
						class="customText-30em" />
				</p>
				<p>
					<label for="prixAchat">Prix d'achat</label>
					<g:textField name="prixAchat" id="prixAchat"
						value="${voiture?.prixAchat}" 
						data-dojo-type="dijit.form.TextBox" />
				</p>
				<p>
					<label for="prixVente">Prix de vente</label>
					<g:textField name="prixVente" id="prixVente"
						value="${voiture?.prixVente}" 
						data-dojo-type="dijit.form.TextBox" />
				</p>
				<p>
					<label for="dateAchat">Date d'achat-${voiture?.dateAchat}</label>
					<g:textField id="dateAchat" name="dateAchat"
							value="${voiture?.dateAchat}" />
				</p>
				<p>
					<label for="dateVente">Date de vente</label>
					<g:textField id="dateVente" name="dateVente"
							data-dojo-type="dijit.form.DateTextBox" value="2012-03-03"
							class="customDate" />
				</p>
				
				<div>
					<div class="customLabelTextArea">
						<label for="myEditor">Description</label>
					</div>
					<div data-dojo-type="dijit.Editor" id="myEditor"
							extraPlugins="['foreColor']"
							class="customTextArea"
							data-dojo-props="height:'10em'" >
						<p>
							${voiture?.description}
						</p>
					</div>
					<g:hiddenField id="hiddenDesc" name="description" />
				</div>
				
			</fieldset>
			
			<br />
			
			<g:submitButton name="Enregistrer" value="Enregistrer" />
			
		</g:form>
		
		<br/>
	        
			<form id="frmFiles"
			     action="${createLinkTo(dir:'storage/upload/')}" enctype="multipart/form-data">
	        	<g:hiddenField name="id" value="${voiture?.id}"/>
				<input type="file" name="myFile" id="myFile" size="35" /><br/>		
			</form>	
				
			<div id="btnUpload"><a href="#">Upload Files</a></div>
		
	        <div id="progressBar"></div>
		
	        <div id="response"></div>
	    
	        <div id="photos" class="photos"></div>
	        
        </div>

        <script type="text/javascript">
/*			dojo.addOnLoad(initialize);
			dojo.addOnLoad(function(){updatePhotos(true);});

			dojo.require("dijit.form.DateTextBox");
			dojo.require("dijit.form.TextBox");
            
			dojo.require("dijit.Editor");
			dojo.require("dijit._editor.plugins.TextColor");
        	dojo.addOnLoad(function () {
        	     dojo.connect(dojo.byId('${voiture?.id}'), 'onsubmit', function () {
        	         dojo.byId('hiddenDesc').value = dijit.byId('myEditor').getValue(false);
        	     });
        	});

        	dojo.addOnLoad(function(){
            	if ('${voiture?.dateAchat}') {
	            	var da = '${voiture?.dateAchat}'
	                var daa = new Date(da.substring(0, 10))
	                //dojo.byId('dateAchat').value = dojo.date.locale.format(daa, {locale:'fr', selector: "date", fullYear:'true'})
	                //dijit.byId('dateAchat').set('value', dojo.date.locale.format(daa, {locale:'fr', selector: "date", fullYear:'true'}))
	                dijit.byId('dateAchat').set('value', daa)
            	}

            	if ('${voiture?.dateVente}') {
	                var dv = '${voiture?.dateVente}'
	                var dvv = new Date(dv.substring(0, 10))
	                //dojo.byId('dateVente').value = dojo.date.locale.format(dvv, {locale:'fr', selector: "date", fullYear:'true'})
	                dijit.byId('dateVente').set('value', dvv)
            	}
            	
                //alert(dojo.date.locale.parse(da))
                //alert(da)
                //alert(dojo.date.locale.format(da, {locale:'fr', selector: "date", fullYear:'true'}))
                //alert(d.substring(0, 10))
            	//alert(dojo.date.locale.parse(d.substring(0, 10)))
        	});
*/
/*
            dojo.addOnLoad(function() {
								var da = '${voiture?.dateAchat}';
                var daa = new Date(da.substring(0, 10));

                dojo.declare("OracleDateTextBox", dijit.form.DateTextBox, {
                    oracleFormat: {
                        selector: 'date',
                        datePattern: 'yyyy-MM-dd',
												locale: 'fr-fr'
                    },
                    value: "",
                    // prevent parser from trying to convert to Date object
                    postMixInProperties: function() { // change value string to Date object
                        this.inherited(arguments);
                        // convert value to Date object
                        this.value = dojo.date.locale.parse(this.value, this.oracleFormat);
                    },
                    // To write back to the server in Oracle format, override the serialize method:
                    serialize: function(dateObject, options) {
                        return dojo.date.locale.format(dateObject, this.oracleFormat).toUpperCase();
                    }
                });
                new OracleDateTextBox({
                    name: "dateAchat"
                },
                "dateAchat");
            });
*/        
        </script>
        
    </body>
</html>
