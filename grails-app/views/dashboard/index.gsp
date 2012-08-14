<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Airports</title>
</head>

<body>
<div style="padding: 10px;">
    <p><g:link controller="Airport" action="index">Airports</g:link></p>
    <sec:ifAnyGranted roles="ROLE_ADMIN">
        <p><g:link controller="Account" action="userPage">User management</g:link></p>
    </sec:ifAnyGranted>
</div>
</body>
</html>
