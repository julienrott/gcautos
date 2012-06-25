var timer;
var sendingFile = false;
var overPhoto = false;
var link;

function initialize() {
	//prototype style
	//Event.observe($('btnUpload'), 'click', handleUpload);
	
	//dojo.require("dojo.parser");
	dojo.require("dojo.fx");
	dojo.require("dojo.io.iframe");
	dojo.require('dojox.timing');
	dojo.require("dijit.ProgressBar");
	dojo.connect(dojo.byId("btnUpload"), "onclick", null, handleUpload);
	dojo.connect(dojo.body(), "onmousemove", dojo.body(), showMouseCoords());
}

function updateMenuStyle( menu ) {
	if ( menu === "") menu = "accueil";
	//dojo.addClass( menu, "current_page_item" );
	if (dojo.byId(menu))
		dojo.addClass( menu, "current" );
}

function handleUpload() {
	//dojo.byId("response").innerHTML = "";
	sendingFile = true;
	
	//poster le fichier
	//The parameters to pass to xhrPost, the form, how to handle it, and the callbacks.
	//Note that there isn't a url passed.  xhrPost will extract the url to call from the form's
	//'action' attribute.  You could also leave off the action attribute and set the url of the xhrPost object
	//either should work.
	var xhrArgs = {
		form: dojo.byId("frmFiles"),
		handleAs: "text",
		load: function(data) {
			sendingFile = false;
			//dojo.byId("response").innerHTML += "File posted.<br/>";
			dojo.byId("myFile").value = "";
			hide("progressBar");
			updatePhotos(true);
		},
		error: function(error) {
			sendingFile = false;
			//dojo.byId("response").innerHTML += "Error while sending file : " + error + "<br/>";
			hide("progressBar");
		}
	}
	
	//Call the asynchronous xhrPost
	//dojo.byId("response").innerHTML += "Form being sent...<br/>"
	//marche pas avec xhrPost ? mais avec iframe...
	//var deferred = dojo.xhrPost(xhrArgs);
	var deferred = dojo.io.iframe.send(xhrArgs);
	
	//cr�er et montrer la bar
	if (dojo.byId("bar")) {
		dijit.byId("bar").update({progress:"0"});
		show("progressBar");
	} else {
		var bar = new dijit.ProgressBar({id:"bar", progress:"0", style:"width: 300px;"});
		var div = dojo.byId("progressBar");
		div.appendChild(bar.domNode);
		dojo.query(".dijitProgressBarTile", div).addClass("progressBarColor");
	}
	
	//cr�er et ex�cuter le timer qui met la bar � jour
	timer = new dojox.timing.Timer(500);
	timer.onStart = function() {console.info("Starting timer");};
	timer.onTick = updateBar();
	timer.onStop = function() {console.info("Ending timer");};
	timer.start();
	return false;
}

function hide(id) {
	dojo.fx.wipeOut({node: id,duration: 0}).play();
}

function show(id) {
	dojo.fx.wipeIn({node: id,duration: 0}).play();
}

function updateBar() {
	return function() {
		var xhrArgs = {
			url: '/gcautos/storage/uploadInfo',
			handleAs: "json",
			load: function(data) {
				if (sendingFile) {
					//dojo.byId("response").innerHTML += "update timer bytesRead : " + data.bytesRead + "<br/>";
				}
				dijit.byId("bar").update({progress:data.bytesRead/data.totalSize*100+"%"});
				if (data.status === "FAILED" || data.status === "DONE"){
					dojo.byId("response").innerHTML = "Traitement de la photo, veuillez patienter...";
					timer.stop();
				}
			},
			error: function(error) {
				//dojo.byId("response").innerHTML += "Error while update timer : " + error + "<br/>";
				timer.stop();
			}
		}
		var deferred = dojo.xhrGet(xhrArgs);
	}
}

function updatePhotos(canDelete) {
	var xhrArgs = {
			url: '/gcautos/voitures/photos?id=' + dojo.byId("id").value,
			handleAs: "text",
			load: function(data) {
				dojo.byId("response").innerHTML = "";
				dojo.byId("photos").innerHTML = data;
				if (canDelete === true) {
					hoverPhotos();
				}
			},
			error: function(error) {
				dojo.byId("response").innerHTML += "Error while getting photos: " + error + "<br/>";
			}
		}
	var deferred = dojo.xhrGet(xhrArgs);

}

function hoverPhotos() {
	var t = dojo.query("div#photos img.photo");
	for (var i=0; i<t.length; i++) {
		var img = t[i];
		dojo.connect(img, "onmouseover", img, showDeletePhoto() );
		dojo.connect(img, "onmouseout", img, hideDeletePhoto() );
		
		var div = img.parentNode;
		dojo.create("span", null, div, "first");
		var span = dojo.query("span:first-child", div)[0];
		span.title = "Supprimer la photo";
		dojo.connect(span, "onclick", img, clickDeletePhoto() );
	}
}

function showDeletePhoto() {
	return function() {
		var imgInfo = dojo.position(this, true);
		var str = "X: " + imgInfo.x + "<br/>";
		str += "Y: " + imgInfo.y + "<br/>";
		str += "H: " + imgInfo.h + "<br/>";
		str += "W: " + imgInfo.w + "<br/>";
		dojo.byId("coordsPhoto").innerHTML = str;
	};
}

function hideDeletePhoto() {
	return function(event) {
		var imgInfo = dojo.position(this, true);
		if(event.pageX > imgInfo.x + imgInfo.w
			|| event.pageY < imgInfo.y) {

			
		}
	};
}

function showMouseCoords() {
	return function(event) {
		var str = "X: " + event.pageX + "<br/>";
		str += "Y: " + event.pageY + "<br/>";
		dojo.byId("coordsMouse").innerHTML = str;
	};
}

function clickDeletePhoto() {
	return function() {
		var id = this.id.substr(this.id.indexOf('_') + 1);
		var xhrArgs = {
				url: '/gcautos/voitures/deletePhoto?id=' + id + '&idVoiture=' + dojo.byId("id").value,
				handleAs: "text",
				load: function(data) {
					dojo.byId("response").innerHTML = "Photo deleted";
					updatePhotos(true);
				},
				error: function(error) {
					dojo.byId("response").innerHTML += "Error while deleting photo: " + error + "<br/>";
				}
			}
		var deferred = dojo.xhrPost(xhrArgs);
	};
}
