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

        $('.next').live("click", function(){
    var numberPage = $('.next').attr("rel");
    var query = $('#query').attr("value");
$("#users").load("<g:createLink action='userPage'/>?page=" + numberPage +"&name="+query+ " #users")
    });

    $('.prev').live("click", function(){
    var numberPage = $('.prev').attr("rel");
    var query = $('#query').attr("value");
    $("#users").load("<g:createLink action='userPage'/>?page=" + numberPage +"&name="+query+ " #users")
    });

            $('.deleteUser').live("click", function() {
                var userId = $(this).attr("rel");
                var numberPage = $(this).attr("page");
                var user = $(this).parent();
                $.ajax({
                    type: 'POST',
                    url: "<g:createLink action="deleteUser"/>/"+userId,
                    data: {id: userId},
                    success: function(data, textStatus, xhr) {
                        if (xhr.status == 204) {
                            user.remove();
                            $("#users").load("<g:createLink action='userPage'/>?page=" + numberPage + " #users")
                        }
                    }
                });
            });
            $("#findUsers").ajaxForm({
    target: "#users",
    replaceTarget: true
    });
        })
    </r:script>
</head>

<body>
<h1>Users</h1>
<hr/>

<div class="pull-left btns">
    <g:link class="btn" controller="Account" action="account">Create user</g:link>
</div>

<div class="pull-right">
    <g:form method="POST" name="findUsers" action="findUsers">
        <g:textField id="query" type="search" name="name" value="${query}" placeholder="Search users"/>
        <input type="submit" value="Find" class="btn"/>
    </g:form>
</div>

<div class="clearfix"></div>

<g:render template="userList"/>

</body>
</html>