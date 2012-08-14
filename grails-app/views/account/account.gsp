<%--
  Created by IntelliJ IDEA.
  User: nazar
  Date: 7/31/12
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Account</title>
    <meta name="layout" content="main"/>
</head>

<body>
<g:form action="account" method="POST">
<table>
    <tr>
        <td><g:message code="account.userName"/></td>
        <td><g:textField type="text" name="username" value="${user.username}" maxlength="50"/>
            <div class="colorError"><g:fieldError bean="${user}" field="username"
                                                  getRejectedValue="${user.username}"/></div></td>
    </tr>
    <tr>
        <td><g:message code="account.password"/></td>
        <td><input type="password" name="password" value="${user.password}" maxlength="50"/>

            <div class="colorError"><g:fieldError bean="${user}" field="password"
                                                  getRejectedValue="${user.password}"/></div></td>
    </tr>
    </table>

    <div class="btns">
        <input type="submit" value="Save" class="btn"/>
        <g:link action="userPage" class="btn"><g:message code="airport.cancel"/></g:link>
    </div>
</g:form>

</body>
</html>