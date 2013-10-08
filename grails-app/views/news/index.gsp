<html>

<head>
	<title><g:message code="menu.news"/></title>
	<meta name="layout" content="main" />
</head>

<body>
	
	<div class="block-2" style="margin: 5px;">
		<g:render template="lastNews" collection="${com.gcautos.domain.News.list(sort: 'id', order: 'desc')}"/>
	</div>
	
</body>
</html>
