<%--
  Created by IntelliJ IDEA.
  User: nazar
  Date: 6/12/12
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="airport.AirportType" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Airport</title>
    <meta name="layout" content="main"/>
</head>

<body>
<h1>Add Airport</h1><hr/>
<g:form action="create" method="POST">
<table border="">

        <tr>
            <td><g:message code="airport.ident"/></td>
            <td><g:textField type="text" name="ident" value="${airport.ident}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="ident" getRejectedValue="${airport.ident}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.type"/></td>
            <td>
                <g:select name="type" from="${AirportType.values()}" optionKey="id" optionValue="code"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="type" getRejectedValue="${airport.type}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.latitude"/></td>
            <td><g:textField type="text" name="latitude" value="${airport.latitude}"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="latitude" getRejectedValue="${airport.latitude}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.longitude"/></td>
            <td><g:textField type="text" name="longitude" value="${airport.longitude}"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="longitude" getRejectedValue="${airport.longitude}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.elevation"/></td>
            <td><g:textField type="text" name="elevation" value="${airport.elevation}"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="elevation" getRejectedValue="${airport.elevation}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.gpsCode"/></td>
            <td><g:textField type="text" name="gpsCode" value="${airport.gpsCode}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="gpsCode" getRejectedValue="${airport.gpsCode}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.scheduledService"/></td>
            <td><g:checkBox name="scheduledService" value="${airport?.scheduledService}"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="scheduledService" getRejectedValue="${airport.scheduledService}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.iataCode"/></td>
            <td><g:textField type="text" name="iataCode" value="${airport.iataCode}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="iataCode" getRejectedValue="${airport.iataCode}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.localCode"/></td>
            <td><g:textField type="text" name="localCode" value="${airport.code}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="localCode" getRejectedValue="${airport.localCode}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.wikipediaLink"/></td>
            <td><g:textField name="wikipediaLink" type="url" value="${airport.webSite}" maxlength="100"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="wikipediaLink" getRejectedValue="${airport.wikipediaLink}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.keywords"/></td>
            <td><g:textField type="text" name="keywords" value="${airport.keywords}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="keywords" getRejectedValue="${airport.keywords}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.code"/></td>
            <td><g:textField type="text" name="code" value="${airport.code}" maxlength="3"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="code" getRejectedValue="${airport.code}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.name"/></td>
            <td><g:textField type="text" name="name" value="${airport.name}" maxlength="200"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="name"/></div></td>
        </tr>
        <tr>
            <td><br><g:message code="airport.addressLine1"/></td>
            <td><g:textField type="text" name="addressLine1" value="${airport.addressLine1}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="addressLine1"/></div></td>
        </tr>
        <tr>
            <td><br><g:message code="airport.addressLine2"/></td>
            <td><g:textField type="text" name="addressLine2" value="${airport.addressLine2}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="addressLine2"/></div></td>
        </tr>
        <tr>
            <td><br><g:message code="airport.addressCity"/></td>
            <td><g:textField type="text" name="addressCity" value="${airport.addressCity}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="addressCity"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.region"/></td>
            <td><g:textField type="text" name="region" value="${airport.region}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="region" getRejectedValue="${airport.region}"/></div></td>
        </tr>
        <tr>
            <td><br><g:message code="airport.addressCountry"/></td>
            <td><g:textField type="text" name="addressCountry" value="${airport.addressCountry}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="addressCountry"/></div></td>
        </tr>
        <tr>
            <td><br><g:message code="airport.addressPostalCode"/></td>
            <td><g:textField type="text" name="addressPostalCode" value="${airport.addressPostalCode}" maxlength="10"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="addressPostalCode"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.phone"/></td>
            <td><g:textField name="phone" type="tel" maxlength="50" value="${airport.phone}"/>
                <div class="colorError"><g:fieldError bean="${airport}" value="${airport.phone}" field="phone"/></div></td>
        </tr>
        <tr>
            <td><br><g:message code="airport.fax"/></td>
            <td><g:textField type="text" name="fax" value="${airport.fax}" maxlength="50"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="fax"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.webSite"/></td>
            <td><g:textField name="webSite" type="url" value="${airport.webSite}" maxlength="100"/>
                <div class="colorError"><g:fieldError bean="${airport}" field="webSite"/></div></td>
        </tr>
    </table>
    <div class="btns">
        <input type="submit" class="btn" value="<g:message code="airport.save"/>"/>
        <g:link action="index" class="btn"><g:message code="airport.cancel"/></g:link>
    </div>
</g:form>

</body>
</html>