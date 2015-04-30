<div class="bg-white">

	<div class="">&nbsp;</div>
	<div class="">&nbsp;</div>

	<div class="voitureListe">
		<h2>Clients</h2>
		{{#each user in model}}
			<div>{{user.username}}</div>
		{{else}}
			<div>Aucun client pour le moment...</div>
		{{/each}}
	</div>
	
	<div class="">&nbsp;</div>
	
</div>