<%@ page import="airport.Airport" %>
<%--
  Created by IntelliJ IDEA.
  User: nazar
  Date: 6/11/12
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="airport.AirportController" contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>

      <r:script>
    $(document).ready(function () {


    $('.next').live("click", function(){
    var numberPage = $('.next').attr("rel");
    var query = $('#query').attr("value");
$("#airports").load("<g:createLink action='index' />?page=" + numberPage +"&name="+query+ " #airports")
    });

    $('.prev').live("click", function(){
    var numberPage = $('.prev').attr("rel");
    var query = $('#query').attr("value");
    $("#airports").load("<g:createLink action='index'/>?page=" + numberPage +"&name="+query+ " #airports")
    });

    $('.delete').live("click", function() {
    var airportId = $(this).attr("rel");
    var numberPage = $(this).attr("page");
    var airport = $(this).parent();
    $.ajax({
    type: 'POST',
    url: "<g:createLink action="delete"/>/"+airportId,
    data: {id: airportId} ,
    success: function(data, textStatus, xhr) {
    if (xhr.status == 204) {
    airport.remove();
    $("#airports").load("<g:createLink action='index'/>?page=" + numberPage + " #airports")
    }
    }
    });
    });

    $("#findAirports").ajaxForm({
    target: "#airports",
    replaceTarget: true
    });
    })
    </r:script>

</head>

<body>
<div class="pull-left btns">
    <sec:ifAnyGranted roles="ROLE_ADMIN">
        <g:link class="btn" action="create"><g:message code="airport.createRecord"/></g:link>
    </sec:ifAnyGranted>
</div>

<div class="pull-right">
    <g:form method="POST" name="findAirports" action="findAirports">
        <g:textField id="query" type="search" name="name" value="${query}" placeholder="Search airports"/>
        <input type="submit" value="Find" class="btn"/>
    </g:form>
</div>

<div class="clearfix"></div><hr/>

<g:render template="airports"/>

</body>
</html>