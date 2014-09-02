App = Ember.Application.create();

App.Router.map(function() {
	// put your routes here
	this.resource('contact', { path: '/contact' });
	this.resource('login', { path: '/login' });
	this.resource('detailsVoiture', { path: '/voiture/:voiture_id' });
	this.resource('editVoiture', { path: '/editVoiture/:voiture_id' });
	this.resource('occasions', { path: '/occasions' });
	this.resource('neuves', { path: '/neuves' });
	this.resource('quads', { path: '/quads' });
	this.resource('buggys', { path: '/buggys' });
	this.resource('dirts', { path: '/dirts' });
	this.resource('electriques', { path: '/electriques' });
	this.resource('accessoires', { path: '/accessoires/:accessoire_id' });
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
            script_url : urlContext + "/js/libs/tiny_mce-3.5.8/tiny_mce.js",
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

App.IndexController = Ember.ObjectController.extend({
	actions: {
		sendMessage: function() {
			var occ = this.store.createRecord('occasion', {
				titre: 'titre',
				description: 'description'
			});
			occ.save();
		}
	}
});

App.IndexRoute = Ember.Route.extend({
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
	}
});

App.EditVoitureController = Ember.ObjectController.extend({
	vehicleTypes: [
       {label: 'Occasion', type: '0'},
       {label: 'Neuve', type: '1'},
       {label: 'Quad', type: '2'},
       {label: 'Dirt', type: '3'},
       {label: 'Electrique', type: '4'},
       {label: 'Buggy', type: '5'}
	],
	actions: {
		save: function() {
			this.store.find('voiture', this.model.get('id')).then(function(voiture) {
				//voiture.set('titre', this.model.get('titre'));
				voiture.save();
			});
		}
	}
});

App.VoituresController = Ember.ObjectController.extend({
	queryParams: ['page', 'type', 'route'],
	page: 1
});

App.VoituresRoute = Ember.Route.extend({
	queryParams: {
		page: {
			refreshModel: true
		}
	},
	renderTemplate: function() {
		this.render('listeVoitures');
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

App.IndexView = Ember.View.extend({
	didInsertElement : function(){
		var that = this;
		Ember.run.schedule('afterRender',function(){
		//Ember.run.next(function(){
			$('.carousel').carousel();
			//this.$().get('.carousel').carousel();
		});
	}
});

App.ApplicationAdapter = DS.RESTAdapter.extend({
	host: "http://localhost:8080",
	namespace: "gcautos/ember",
	//plurals: {"neuve": "neuves"}
});

App.ApplicationSerializer = DS.RESTSerializer.extend({
	primaryKey: 'idd'
});

App.PhotoSlider = DS.Model.extend({
	css: DS.attr('string'),
	url: DS.attr('string')
});

App.PhotoSliderAdapter = DS.RESTAdapter.extend({
	host: "http://localhost:8080",
	namespace: "gcautos/voitures"
});

App.Accessoire = DS.Model.extend({
	idd: DS.attr('number'),
	titre: DS.attr('string'),
	contenu: DS.attr('string')
});

App.Voiture = DS.Model.extend({
	idd: DS.attr('number'),
	titre: DS.attr('string'),
	description: DS.attr('string'),
	vehicleType: DS.attr('number'),
	photo1: DS.attr('string'),
	photo2: DS.attr('string'),
	photos: DS.attr()
});

App.Occasion = App.Voiture.extend({
	type: 0
});

App.Neuf = App.Voiture.extend({
	type: 1
});

App.Quad = App.Voiture.extend({
	type: 2
});

App.Buggy = App.Voiture.extend({
	type: 5
});

App.Dirt = App.Voiture.extend({
	type: 3
});

App.Electrique = App.Voiture.extend({
	type: 4
});
