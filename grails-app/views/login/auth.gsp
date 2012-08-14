<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
</head>

<body>
<div id='login'>
    <div class='inner'>
        <h1><g:message code="springSecurity.login.header"/></h1>
        <hr/>

        <g:if test='${flash.message}'>
            <div class='error'>${flash.message}</div>
        </g:if>

        <form action='${postUrl}' method='POST' id='loginForm'>
            <p>
                <label for='username' class="field_label"><g:message code="springSecurity.login.username.label"/></label>
                <input type='text' name='j_username' id='username'/>
            </p>
            <div class="clearfix"></div>

            <p>
                <label for='password' class="field_label"><g:message code="springSecurity.login.password.label"/></label>
                <input type='password' name='j_password' id='password'/>
            </p>
            <div class="clearfix"></div>

            <p id="remember_me_holder">
                <input type='checkbox' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
            </p>
            <div class="clearfix"></div>

            <p><input type='submit' id="submit" class="btn" value='${message(code: "springSecurity.login.button")}'/> </p>
        </form>
    </div>
</div>
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
