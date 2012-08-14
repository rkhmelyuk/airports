<%--
  Created by IntelliJ IDEA.
  User: nazar
  Date: 7/31/12
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Airports.Users</title>
    <meta name="layout" content="main"/>
    <r:script>
        $(document).ready(function() {
            $('.deleteUser').live("click", function() {
                var userId = $(this).attr("rel");
                var user = $(this).parent();
                $.ajax({
                    type: 'POST',
                    url: "<g:createLink action="deleteUser"/>/"+userId,
                    data: {id: userId},
                    success: function(data, textStatus, xhr) {
                        if (xhr.status == 204) {
                            user.remove();
                            $("#users").load("<g:createLink action='deleteUser'/>" + " #users")
                        }
                    }
                });
            });
        })
    </r:script>
</head>
<body>
<div class="pull-left btns">
    <g:link class="btn" controller="Account" action="account">Create user</g:link>
</div><br/>

<div id="users">
    <br><h1>Users</h1>
    <table>

        <thead>
            <tr>
                <th><g:message code="account.userName"/></th>
                <th><g:message code="account.role"/></th>
                <th class="action"></th>
            </tr>
        </thead>
        <g:each in="${userList}" var="user">
            <tr>
                <td><g:fieldValue bean="${user}" field="username"/></td>
                <td><g:fieldValue bean="${user}" field="role.name"/></td>
                <td class="action delete">
                    <g:if test="${user.username != currentUsername}">
                        <a class="deleteUser" href="javascript:void(0);" rel="${user.id}">Delete</a>
                    </g:if>
                </td>
            </tr>
        </g:each>
    </table>
</div>

<div class="btns pull-right"><g:link controller="dashboard" action="index" class="btn"><g:message code="airport.cancel"/></g:link></div>
<div class="clearfix"></div>

</body>
</html>