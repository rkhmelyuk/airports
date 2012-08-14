<%--
  Created by IntelliJ IDEA.
  User: nazar
  Date: 6/13/12
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="airport.AirportType" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Airport</title>
    <meta name="layout" content="main"/>
    <r:script>
        $(document).ready(function() {
            $('.deleteImage').live("click", function() {
                var imageId = $(this).attr("rel");
                var image = $(this).parent();
                $.ajax({
                    type: 'POST',
                    url: "<g:createLink action="deleteImage"/>",
                    data: {id: imageId},
                    success: function(data, textStatus, xhr) {
                        if (xhr.status == 204) {
                            image.remove();
                        }
                    }
                });
            });

            $("#saveImage").ajaxForm({
                success: function(data) {
                    var newImageHtml = '<div style="float:left; margin: 5px 10px;">' +
    '<img src="' + data.thumb+ '"/><br/>' +
    '<a class="deleteImage" href="javascript:void(0);" rel="' + data.id + '">Delete</a></div>';

                    $('#images').append(newImageHtml);
                }
            });
        })
    </r:script>
</head>

<body>
<h1>Edit Airport</h1><hr/>
<g:form action="edit" method="POST" id="${airport.id}">
    <table>
        <tr>
            <td><g:message code="airport.ident"/></td>
            <td><g:textField type="text" name="ident" value="${airport.ident}" maxlength="50"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="ident" getRejectedValue="${airport.ident}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.type"/></td>
            <td>
                <g:select name="type" from="${AirportType.values()}" optionKey="id" optionValue="code"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="type" getRejectedValue="${airport.type}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.latitude"/></td>
            <td><g:textField type="text" name="latitude" value="${airport.latitude}"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="latitude" getRejectedValue="${airport.latitude}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.longitude"/></td>
            <td><g:textField type="text" name="longitude" value="${airport.longitude}"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="longitude" getRejectedValue="${airport.longitude}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.elevation"/></td>
            <td><g:textField type="text" name="elevation" value="${airport.elevation}" maxlength="3"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="elevation" getRejectedValue="${airport.elevation}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.scheduledService"/></td>
            <td>
                <g:checkBox name="scheduledService" value="${airport.scheduledService}"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="scheduledService" getRejectedValue="${airport.scheduledService}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.gpsCode"/></td>
            <td><g:textField type="text" name="gpsCode" value="${airport.gpsCode}" maxlength="50"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="gpsCode" getRejectedValue="${airport.gpsCode}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.iataCode"/></td>
            <td><g:textField type="text" name="iataCode" value="${airport.iataCode}" maxlength="50"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="code" getRejectedValue="${airport.iataCode}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.localCode"/></td>
            <td><g:textField type="text" name="localCode" value="${airport.code}" maxlength="50"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="localCode" getRejectedValue="${airport.localCode}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.wikipediaLink"/></td>
            <td><g:textField name="wikipediaLink" type="url" value="${airport.webSite}" maxlength="100"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="wikipediaLink" getRejectedValue="${airport.wikipediaLink}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.keywords"/></td>
            <td><g:textField type="text" name="keywords" value="${airport.keywords}" maxlength="50"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="keywords" getRejectedValue="${airport.keywords}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.code"/></td>
            <td><g:textField name="code" value="${airport.code}" maxlength="3"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="code"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.name"/></td>
            <td><g:textField name="name" value="${airport.name}" maxlength="200"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="name"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.addressLine1"/></td>
            <td><g:textField name="addressLine1" value="${airport.addressLine1}" maxlength="50"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="addressLine1"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.addressLine2"/></td>
            <td><g:textField name="addressLine2" value="${airport.addressLine2}" maxlength="50"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="addressLine2"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.addressCity"/></td>
            <td><g:textField name="addressCity" value="${airport.addressCity}" maxlength="50"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="addressCity"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.region"/></td>
            <td><g:textField type="text" name="region" value="${airport.region}" maxlength="50"/>
                <div class="field-error"><g:fieldError bean="${airport}" field="region" getRejectedValue="${airport.region}"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.addressCountry"/></td>
            <td><g:textField name="addressCountry" value="${airport.addressCountry}" maxlength="50"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="addressCountry"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.addressPostalCode"/></td>
            <td><g:textField name="addressPostalCode" value="${airport.addressPostalCode}" maxlength="10"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="addressPostalCode"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.phone"/></td>
            <td><g:textField name="phone" value="${airport.phone}" maxlength="50"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="phone"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.fax"/></td>
            <td><g:textField name="fax" value="${airport.fax}" maxlength="50"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="fax"/></div></td>
        </tr>
        <tr>
            <td><g:message code="airport.webSite"/></td>
            <td><g:textField name="webSite" value="${airport.webSite}" maxlength="100"/><br/>
                <div class="field-error"><g:fieldError bean="${airport}" as="list" field="webSite"/></div></td>
        </tr>
    </table>

    <div class="btns">
        <input class="btn" type="submit" value="<g:message code="airport.save"/>">
        <g:link action="index" class="btn"><g:message code="airport.cancel"/></g:link>
    </div>
</g:form>

<h3>Images</h3><hr/>

<div id="images">
    <g:if test="${airportImages}">
        <g:each in="${airportImages}" var="image">
            <div style="float:left; margin: 5px 10px;">
                <img src="${createLink(controller: 'image', action: 'getThumbImage', id: image.id)}"/><br/>
                <a class="deleteImage" href="javascript:void(0);" rel="${image.id}">Delete</a>
            </div>
        </g:each>
    </g:if>
    <g:else>
        <p class="placeholder">No images yet</p>
    </g:else>
</div>
<div class="clearfix"></div>

<h4>Upload image</h4><hr/>
<g:if test='${flash.message}'>
    <div>${flash.message}</div>
</g:if>
<g:uploadForm name="saveImage" action="saveImage" id="${airport.id}" method="POST">
    <input type="file" name="img">
    <input type="submit" value="Upload" class="btn">
</g:uploadForm>
</body>
</html>