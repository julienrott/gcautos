<html xmlns:g="http://grails.codehaus.org/tags">
<head>
	<title><g:message code="menu.occasions"/></title>
	<meta name="layout" content="main" />
</head>
<body>
	<div class="post bloc rounded">
		<div id="chart1" style="width:260px;height:200px;"></div>
		<div id="chart2" style="width:260px;height:200px;"></div>
		<script>
		    dojo.require('dojox.charting.Chart2D');
		    dojo.require('dojox.charting.widget.Chart2D');
		    dojo.require('dojox.charting.themes.PlotKit.blue');
		
		    /* JSON information */
		    var json = {
		        January: 	[12999,14487,19803,15965,17290],
		        February: 	[14487,12999,15965,17290,19803],
		        March: 		[15965,17290,19803,12999,14487]
		    };
		
		    /* build pie chart data */
		    var chartData = [];
		    dojo.forEach(json['January'],function(item,i) {
		        chartData.push({ x: i, y: json['January'][i] });
		    });
		
		    /* resources are ready... */
		    dojo.ready(function() {
		
		        //create / swap data
		        var barData = [];
		        dojo.forEach(chartData,function(item) { barData.push({ x: item['y'], y: item['x'] }); });
		        var chart1 = new dojox.charting.Chart2D('chart1').
		                        setTheme(dojox.charting.themes.PlotKit.blue).
		                        addAxis('x', { fixUpper: 'major', includeZero: false, min:0, max:6 }).
		                        addAxis('y', { vertical: true, fixLower: 'major', fixUpper: 'major' }).
		                        addPlot('default', {type: 'Columns', gap:5 }).
		                        addSeries('Visits For February', chartData, {});
		        var anim4b = new dojox.charting.action2d.Tooltip(chart1, 'default');
		        var anim4c = new dojox.charting.action2d.Shake(chart1,'default');
		        chart1.render();
		        var legend4 = new dojox.charting.widget.Legend({ chart: chart1 }, 'legend3');
		
		    });

		    dojo.addOnLoad(function(){
		    	var xhrArgs = {
	    			url: '/gcautos/statistiques/chart2',
	    			handleAs: "json",
	    			load: showGraph,
	    			error: function(error) {
	    				alert(error);
	    			}
	    		}
	    		var deferred = dojo.xhrGet(xhrArgs);
		    });

		    function showGraph(data) {
    			var barData = [];
		        dojo.forEach(data,function(item,i) {
					//alert(item);
					barData.push({ x: item.x, y: item.y });
			    });
		        var chart2 = new dojox.charting.Chart2D('chart2').
		                        setTheme(dojox.charting.themes.PlotKit.blue).
		                        addAxis('x', { fixUpper: 'major', includeZero: false, min:0, max:6 }).
		                        addAxis('y', { vertical: true, fixLower: 'major', includeZero: true, fixUpper: 'major' }).
		                        addPlot('default', {type: 'Columns', gap:5 }).
		                        addSeries('', barData, {});
		        var anim4b = new dojox.charting.action2d.Tooltip(chart2, 'default');
		        var anim4c = new dojox.charting.action2d.Shake(chart2,'default');
		        chart2.render();
			}
		</script>
	</div>
</body>
</html>