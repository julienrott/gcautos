//= require_self
//= require_tree ember/models/

App = Ember.Application.create();

var vehicleTypes = [
                    {label: 'Occasion', type: 0},
                    {label: 'Neuve', type: 1},
                    {label: 'Quad', type: 2},
                    {label: 'Dirt', type: 3},
                    {label: 'Electrique', type: 4},
                    {label: 'Buggy', type: 5}
             	];
var vehicleMentions = [
                      {label: 'Aucune', type: 0},
                      {label: 'Nouveauté', type: 1},
                      {label: 'Vendu(e)', type: 2}
               	];
App.Router.map(function() {
	// put your routes here
	var self = this;
	self.resource('contact', { path: '/contact' });
	self.resource('login', { path: '/login' });
	self.resource('detailsVoiture', { path: '/voiture/:voiture_id' });
	self.resource('editVoiture', { path: '/editVoiture/:voiture_id' });
	self.resource('createVoiture', { path: '/createVoiture' });
	self.resource('occasions', { path: '/occasions' });
	self.resource('neuves', { path: '/neuves' });
	self.resource('quads', { path: '/quads' });
	self.resource('buggys', { path: '/buggys' });
	self.resource('dirts', { path: '/dirts' });
	self.resource('electriques', { path: '/electriques' });
	self.resource('accessoires', { path: '/accessoires/:accessoire_id' });
	self.resource('allNews', { path: '/allNews' });
	self.resource('createNews', { path: '/createNews' });
	self.resource('editPhotoSlider', { path: '/editPhotoSlider' });
	self.resource('users', { path: '/users' });
});

App.Router.reopen({
  notifyGoogleAnalytics: function() {
    return ga('send', 'pageview', {
        'page': this.get('url'),
        'title': this.get('url')
      });
  }.on('didTransition')
});

App.ApplicationRoute = Ember.Route.extend({
	actions: {
		ok: function(ok, transition) {
			$("#okMsg").show();
			setTimeout(function(){
				$("#okMsg").hide();
			}, 3000);
		},
		error: function(error, transition) {
			$("#errorMsg").show();
			setTimeout(function(){
				$("#errorMsg").hide();
			}, 3000);
		}
	}
});

App.TinymceView = Ember.TextArea.extend({
    editor: null,
    _suspendValueChange: false,
    didInsertElement: function(){
        var id = "#" + this.get("elementId");        
        var view = this;
        /*tinymce.init({
            selector: id,
            setup : function(ed) {                
                view.set("editor", ed);
                ed.on("keyup change", function() {
                    view.suspendValueChange(function() {
                        view.set("value", ed.getContent());
                    });
                });
           }
        });*/
        $('textarea.tinymce').tinymce({
            script_url : urlContext + "/assets/tiny_mce-3.5.8/tiny_mce.js",
            theme : "advanced",
            plugins : "media",
            //theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull",
            //theme_advanced_buttons2 : "media, styleselect,formatselect,fontselect,fontsizeselect",
            theme_advanced_buttons2_add : "media",
            //theme_advanced_toolbar_location : "top",
            //theme_advanced_toolbar_align : "left",
            //theme_advanced_statusbar_location : "bottom",
            theme_advanced_resizing : true,
            width: "100%",
            height: "300",
            setup : function(ed) {
                view.set("editor", ed);
                /*ed.on("keyup change", function() {
                    view.suspendValueChange(function() {
                        view.set("value", ed.getContent());
                    });
                });*/
                ed.onChange.add(function(ed) {
                	view.suspendValueChange(function() {
                        view.set("value", ed.getContent());
                    });
                });
                ed.onKeyUp.add(function(ed) {
                	view.suspendValueChange(function() {
                        view.set("value", ed.getContent());
                    });
                });
           }
        });
    },
    suspendValueChange: function(cb) {
        this._suspendValueChange = true;
        cb();
        this._suspendValueChange = false;
    },
    valueChanged: function() {
        if (this._suspendValueChange) { return; }
        var content = this.get("value");
        this.get("editor").setContent(content);
    }.observes("value"),
    willClearRender: function() {        
        this.get("editor").remove();
    }
});

App.IndexController = Ember.ArrayController.extend({
	actions: {
		sendMessage: function() {
			var occ = this.store.createRecord('occasion', {
				titre: 'titre',
				description: 'description'
			});
			occ.save();
		},
		deleteNews: function(id) {
			var self = this
			self.store.find('news', id).then(function(news) {
				news.destroyRecord().then(function() {
					self.send('refreshNews');
				});
			});
		},
		refreshNews: function() {
			this.set('news', this.store.find('news', {maxNews: 2}))
		},
		refreshService: function() {
			this.set('services', this.store.find('service'))
		},
		refreshVoituresHome: function() {
//			this.set('voituresHome', this.store.find('voituresHome'))
//			this.get('voituresHome').reload()
//			this.send('reloadIndex')
		},
		reloadIndex: function() {
			this.refresh()
		}
		
	},
	voituresHome: function() {
		return this.store.find('voituresHome');
	}.property('voituresHome'),
	services: function() {
		return this.store.find('service');
	}.property('services'),
	news: function() {
		return this.store.find('news', {maxNews: 2});
	}.property('news')
});

App.IndexRoute = Ember.Route.extend({
	needs: ['index'],
	model: function() {
		/*var photos = [];
		Ember.$.getJSON('http://localhost:8080/gcautos/voitures/homeJSON', function(p){
			p.forEach(function(data){
			    console.log("data", data);
				photos.pushObject(App.PhotoSlider.createRecord(data));
			});
			console.log("photos", photos);
		});
		return photos;*/
		
		return this.store.find('photoSlider');
	},
	actions: {
		reloadIndexRoute: function() {
			this.refresh();
		},
		showEditService: function() {
			this.store.find('service').then(function(services) {
				var s = services.content[0]
				var c = s.get('contenu')
				tinyMCE.get('serviceContenu').setContent(c);
				$("#modalEditService").modal("show")
			})
		},
		saveService: function() {
			_this = this
			_this.store.find('service').then(function(services) {
				var s = services.content[0]
				var c = tinyMCE.get('serviceContenu').getContent();
				s.set('contenu', c)
				s.save()
				$("#modalEditService").modal("hide")
			})
		}
	},
	renderTemplate: function() {
		this.render('index');
		Ember.run.schedule('afterRender', function task3(){
			Ember.$(".blink").each(function(){
				$(this).pulse( { times:500, duration: 500 } );
			});
		});
	}
});

App.EditPhotoSliderRoute = Ember.Route.extend({
	model: function() {
		return this.store.find('photoSlider')
	},
	actions: {
		'deletePhoto': function(id) {
			_this = this
			_this.store.find('photoSlider', id).then(function(photo) {
				photo.destroyRecord().then(function() {
					_this.send('refreshPhotoSlider');
				});
			});
		},
		refreshPhotoSlider: function() {
			this.set('photoSlider', this.store.find('photoSlider'))
		},
		reloadPhotos: function() {
			this.set('photoSlider', this.store.find('photoSlider'))
		}
	}
});

App.AccessoiresController = Ember.ObjectController.extend({
	actions: {
		update: function() {
			var controller = this;
			controller.model.save().then(function(reason) {controller.send('ok');}).catch(function(reason) {controller.send('error');});
		}
	}
});

App.EditVoitureView = Ember.View.extend({
	didInsertElement : function(){
		Ember.run.schedule('afterRender', this.makeEditable());
	},
	makeEditable: function(){
		var _this = this;
			$('.sortable').sortable('destroy');
			$('.sortable').sortable({items: 'div'}).bind('sortupdate', function() {
				var a = []
				$(".sortable div").each(function(index,l){
					var positionData = {};
					positionData.id = $(l).data('id')
					positionData.position = index
					a.push(positionData)
				});
				var positionData = {positionData: a}
				$.post(urlContext + '/ember/updatePhotosPositions', {json: JSON.stringify(positionData)}, function() {
//					_this.controller.model.reload();
//					Ember.run.schedule('afterRender', _this.makeEditable());
				});
			});
	}
});

App.EditVoitureController = Ember.ObjectController.extend({
	vehicleTypes: vehicleTypes,
	vehicleMentions: vehicleMentions,
	getType: function() {
		return "gnarf"
	},
	actions: {
		update: function() {
			var controller = this;
			controller.model.save().then(function(reason) {controller.send('ok');}).catch(function(reason) {controller.send('error');});
		},
		deletePhoto: function(idVoiture, idPhoto) {
			this.store.find('voiture', this.model.get('id')).then(function(voiture) {
				var photos = voiture.get('photos');
				var photoToDelete = null;
				$.each(photos, function(idx, photo){
					if ($(photo.id).is($(idPhoto))) {
						photos = [photo]
						return false
					}
					else{}
				})
				voiture.set('photos', photos)
				voiture.set('deletePhoto', true)
				voiture.save();
			});
		},
		reloadPhoto: function(idVoiture, idPhoto) {
			this.store.find('voiture', this.model.get('id')).then(function(voiture) {
				var photos = voiture.get('photos');
				var photoToDelete = null;
				$.each(photos, function(idx, photo){
					if ($(photo.id).is($(idPhoto))) {
						photos = [photo]
						return false
					}
					else{}
				})
				voiture.set('photos', photos)
				voiture.set('reloadPhoto', true)
				voiture.save();
			});
		},
		reloadCar: function() {
			this.model.reload()
		}
	}
});

App.CreateVoitureController = Ember.ObjectController.extend({
	needs: ['index'],
	vehicleTypes: vehicleTypes,
	vehicleMentions: vehicleMentions,
	actions: {
		createCar: function() {
			var self = this;
			var voiture = self.store.createRecord('voiture', {
				titre: self.get('titre'),
				description: self.get('description'),
				vehicleType: self.get('vehicleType'),
				mention: self.get('mention'),
				prixVente: self.get('prixVente'),
			});
			voiture.save().then(function() {
				self.transitionToRoute('editVoiture', voiture)
				self.get('controllers.index').send('refreshVoituresHome')
			});
		}
	}
});

App.CreateVoitureRoute = Ember.Route.extend({
	model: function() {
		return this.store.createRecord('voiture', {
			titre: "nouvelle voiture",
			description: 'description',
			vehicleType: 0,
			mention: 0,
			prixVente: 0,
		});
	}
});

App.CreateNewsController = Ember.ObjectController.extend({
	needs: ['index'],
	actions: {
		createNews: function() {
			var self = this;
			var news = self.model;
			news.save().then(function(reason) {
				self.get('controllers.index').send('refreshNews');
				self.send('ok');
				self.transitionToRoute('index');
			}).catch(function(reason) {self.send('error', reason);});
		}
	}
});

App.CreateNewsRoute = Ember.Route.extend({
	model: function() {
		return this.store.createRecord('news', {
			titre: "nouvelle news",
			description: 'description'
		});
	}
});

App.AllNewsController = Ember.ArrayController.extend({
	
});

App.AllNewsRoute = Ember.Route.extend({
	model: function() {
		return this.store.find('news', {maxNews: 5});
	}
});

App.VoituresController = Ember.ObjectController.extend({
	needs: ['index'],
	queryParams: ['page', 'type', 'route'],
	page: 1,
	actions: {
		deleteCar: function(id) {
			var controller = this;
			controller.store.find('voiture', id).then(function(voiture) {
				voiture.destroyRecord().then(function(a,b,c,d) {
					controller.send("reloadRoute")
					controller.get('controllers.index').send('refreshVoituresHome')
				});
			});
		}
	}
});

App.VoituresRoute = Ember.Route.extend({
	queryParams: {
		page: {
			refreshModel: true
		}
	},
	renderTemplate: function() {
		this.render('listeVoitures');
		Ember.run.schedule('afterRender', function task3(){
			Ember.$(".blink").each(function(){
				//$(this).effect("pulsate", { times:500 }, 1500);
				$(this).pulse( { times:500, duration: 500 } );
			});
		});
	},
	actions: {
		reloadRoute: function() {
			this.refresh();
		}
	}
});

App.OccasionsController = App.VoituresController.extend({
	type: 0,
	route: 'occasions'
});

App.OccasionsRoute = App.VoituresRoute.extend({
	model: function(params) {
		return res = this.store.findQuery('occasion', params);
	},
	setupController : function(controller, model) {
		controller.set('model', model);
		var meta = this.store.metadataFor("occasion");
		controller.set('meta', meta);
	}
});

App.NeuvesController = App.VoituresController.extend({
	type: 1,
	route: 'neuves'
});

App.NeuvesRoute = App.VoituresRoute.extend({
	model: function(params) {
		return this.store.findQuery('neuf', params);
	},
	setupController : function(controller, model) {
		controller.set('model', model);
		var meta = this.store.metadataFor("neuf");
		controller.set('meta', meta);
	}
});

App.QuadsController = App.VoituresController.extend({
	type: 2,
	route: 'quads'
});

App.QuadsRoute = App.VoituresRoute.extend({
	model: function(params) {
		return this.store.findQuery('quad', params);
	},
	setupController : function(controller, model) {
		controller.set('model', model);
		var meta = this.store.metadataFor("quad");
		controller.set('meta', meta);
	}
});

App.BuggysController = App.VoituresController.extend({
	type: 5,
	route: 'buggys'
});

App.BuggysRoute = App.VoituresRoute.extend({
	model: function(params) {
		return this.store.findQuery('buggy', params);
	},
	setupController : function(controller, model) {
		controller.set('model', model);
		var meta = this.store.metadataFor("buggy");
		controller.set('meta', meta);
	}
});

App.DirtsController = App.VoituresController.extend({
	type: 3,
	route: 'dirts'
});

App.DirtsRoute = App.VoituresRoute.extend({
	model: function(params) {
		return this.store.findQuery('dirt', params);
	},
	setupController : function(controller, model) {
		controller.set('model', model);
		var meta = this.store.metadataFor("dirt");
		controller.set('meta', meta);
	}
});

App.ElectriquesController = App.VoituresController.extend({
	type: 4,
	route: 'electriques'
});

App.ElectriquesRoute = App.VoituresRoute.extend({
	model: function(params) {
		return this.store.findQuery('electrique', params);
	},
	setupController : function(controller, model) {
		controller.set('model', model);
		var meta = this.store.metadataFor("electrique");
		controller.set('meta', meta);
	}
});

App.UsersRoute = Ember.Route.extend({
	model: function(params) {
		return this.store.findQuery('user', params);
	}
});

App.IndexView = Ember.View.extend({
	didInsertElement : function(){
		var that = this;
		Ember.run.schedule('afterRender',function(){
			$('.carousel').carousel();
		});
	}
});

App.PubsClickInTextView = Ember.View.extend({
	didInsertElement : function(){
		this._super();
	    Ember.run.scheduleOnce('afterRender', this, function(){
	    	Ember.$('#pubsClickInText').appendTo(Ember.$('#pubsClickInTextFooter'));
	    });
	}
});

App.PubsGoogleView = Ember.View.extend({
	template: Ember.Handlebars.compile('\
			<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\
			<!-- leaderboard -->\
			<ins class="adsbygoogle"\
			     style="display:inline-block;width:728px;height:90px"\
			     data-ad-client="ca-pub-5871598473810001"\
			     data-ad-slot="3730173376"></ins>\
			<script>\
			(adsbygoogle = window.adsbygoogle || []).push({});\
			</script>\
			')
});

App.AjaxUploaderView = Ember.View.extend({
	didInsertElement : function(){
		Ember.$.get('ember/ajaxUploader', {id: this.get('controller').model.id}, function(a, b, c){
			Ember.$('#divAjaxUploader').html(a)
		});
	}
});

App.AjaxUploaderPhotoSliderView = Ember.View.extend({
	didInsertElement : function(){
		Ember.$.get('ember/ajaxUploaderPhotoSlider', {}, function(a, b, c){
			Ember.$('#divAjaxUploader').html(a)
		});
	}
});

App.ApplicationAdapter = DS.RESTAdapter.extend({
	host: urlContext,
	namespace: "ember"
});

App.UserAdapter = DS.RESTAdapter.extend({
	host: urlContext,
	namespace: ""
});

App.ApplicationSerializer = DS.RESTSerializer.extend({
	primaryKey: 'idd'
});
