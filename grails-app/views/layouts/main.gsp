<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Airports"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'styles.css')}" type="text/css">

    <g:layoutHead/>
    <r:require module="jquery"/>
    <r:layoutResources/>
</head>

<body>
<div class="container">
    <div class="header">
        <g:link controller="dashboard" action="index" class="logo">Airports</g:link>
        <div class="pull-right">
            <sec:ifLoggedIn>
                Welcome, <sec:username/>!
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <g:link class="top-link" controller="Login" action="index">Sign in</g:link>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <g:link class="top-link" controller="Logout" action="index">Logout</g:link>
            </sec:ifLoggedIn>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="menu">
        <ul>
            <li><g:link controller="dashboard" action="index">Home</g:link></li>
            <li><g:link controller="airport" action="index">Airports</g:link></li>
            <li><g:link controller="account" action="userPage">Users</g:link></li>
        </ul>
        <div class="clearfix"></div>
    </div>

    <div class="content">
        <g:layoutBody/>
    </div>

    <div class="footer" style="height: 50px">
        <p>Copyright © 2012 Airports</p>
    </div>
</div>

<div id="spinner" class="spinner" style="display:none;"></div>
<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>