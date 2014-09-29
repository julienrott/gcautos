
App.PhotoSlider = DS.Model.extend({
	css: DS.attr('string'),
	url: DS.attr('string')
});

App.Accessoire = DS.Model.extend({
	idd: DS.attr('number'),
	titre: DS.attr('string'),
	contenu: DS.attr('string')
});

App.Service = DS.Model.extend({
	idd: DS.attr('number'),
	titre: DS.attr('string'),
	contenu: DS.attr('string')
});

App.News = DS.Model.extend({
	idd: DS.attr('number'),
	titre: DS.attr('string'),
	description: DS.attr('string')
});

App.Voiture = DS.Model.extend({
	idd: DS.attr('number'),
	titre: DS.attr('string'),
	description: DS.attr('string'),
	mention: DS.attr('number'),
	vehicleType: DS.attr('number'),
	prixVente: DS.attr('string'),
	prixVenteFormatted: function() {
		return this.get('prixVente').toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
	}.property('prixVente'),
	prixVenteFormattedChanged: function() {
		
	}.observes('prixVente'),
	photo1: DS.attr('string'),
	photo2: DS.attr('string'),
	photos: DS.attr(),
	deletePhoto: DS.attr('boolean'),
	reloadPhoto: DS.attr('boolean'),
	isNewCar: function() {
		return this.get('mention') === 1
	}.property('mention'),
	isSold: function() {
		return this.get('mention') === 2
	}.property('mention')
});

App.VoituresHome = App.Voiture.extend({
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
