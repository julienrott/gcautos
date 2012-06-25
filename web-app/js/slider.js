$(window).load(function(){
	$('.slider')._TMS({
		show:0,
		pauseOnHover:false,
		prevBu:'.prev',
		nextBu:'.next',
		playBu:'.play',
		duration:100,
		preset:'diagonalExpand',
		pagination:false,//'.pagination',true,'<ul></ul>'
		pagNums:false,
		slideshow:4000,
		numStatus:false,
		banners:false,// fromLeft, fromRight, fromTop, fromBottom
		waitBannerAnimation:false,
		progressBar:false
	})		
})

$(function(){
	//	Initialize Superfish
	$('.sf-menu').superfish({
		autoArrows: false
	});
})