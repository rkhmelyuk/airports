<%@ page import="airport.AirportType; airport.Airport" %>
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
    <title>Airports</title>
    <meta name="layout" content="main"/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <script type="text/javascript"
            src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBpb1bsIkVLntYfrBR8ls5ZRcmK6G5whoc&&sensor=false"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" language="javascript">

        $(document).ready(function () {
            $("#commentAirports").ajaxForm({
                target:"#comments",
                replaceTarget:true,
                success:function () {
                    $('#message').val("");
                }
            });

            $("#saveRating").ajaxForm({

                success:function () {
                    $('#message').append("<div>Thank you</div>");
                }
            });

            var myLatlng = new google.maps.LatLng(${airport.latitude}, ${airport.longitude});
            var myOptions = { minZoom:3, zoom:12, center:myLatlng, mapTypeId:google.maps.MapTypeId.ROADMAP }
            var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
            var marker = new google.maps.Marker({ position:myLatlng, map:map });
        });
    </script>
</head>

<body>
<h1>${fieldValue(bean: airport, field: 'name')}</h1>
<g:if test="${userVote}">
    <g:form name="saveRating" action="rating" method="POST">
        <g:hiddenField name="airportId" value="${airport.id}"/>
        <g:select name="rating" from="${['1', '2', '3', '4', '5']}"/>
        <input type="submit" value="Ok" class="btn">
    </g:form>
</g:if>
<div id="massege"></div>
<hr/>

<div>
    <div class="pull-left">
        <div class="field clearfix-after">
            <div class="label"><g:message code="airport.type"/></div>

            <div class="value"><g:message code="${airport.type.code}"/></div>
        </div>

        <div class="field clearfix-after">
            <div class="label">Address</div>

            <div class="value">${fieldValue(bean: airport, field: 'fullAddress')}</div>
        </div>
        <g:if test="${!airport.scheduledService}">
            <div class="field clearfix-after">
                <div class="label"><g:message code="airport.scheduledService"/></div>

                <div class="value">${fieldValue(bean: airport, field: 'scheduledService')}</div>
            </div>
        </g:if>
        <div class="field clearfix-after">
            <div class="label"><g:message code="airport.code"/></div>

            <div class="value">${fieldValue(bean: airport, field: 'code')}</div>
        </div>
        <g:if test="${airport.keywords != ""}">
            <div class="field clearfix-after">
                <div class="label"><g:message code="airport.keywords"/></div>

                <div class="value">${fieldValue(bean: airport, field: 'keywords')}</div>
            </div>
        </g:if>
        <g:if test="${airport.ident != ""}">
            <div class="field clearfix-after">
                <div class="label"><g:message code="airport.ident"/></div>

                <div class="value">${fieldValue(bean: airport, field: 'ident')}</div>
            </div>
        </g:if>
        <g:if test="${airport.phone != ""}">
            <div class="field clearfix-after">
                <div class="label"><g:message code="airport.phone"/></div>

                <div class="value">${fieldValue(bean: airport, field: 'phone')}</div>
            </div>
        </g:if>
        <g:if test="${airport.fax != ""}">
            <div class="field clearfix-after">
                <div class="label"><g:message code="airport.fax"/></div>

                <div class="value">${fieldValue(bean: airport, field: 'fax')}</div>
            </div>
        </g:if>
        <g:if test="${airport.wikipediaLink != ""}">
            <div class="field clearfix-after">
                <div class="label"><g:message code="airport.wikipediaLink"/></div>

                <div class="value">${fieldValue(bean: airport, field: 'wikipediaLink')}</div>
            </div>
        </g:if>
        <g:if test="${airport.webSite != ""}">
            <div class="field clearfix-after">
                <div class="label"><g:message code="airport.webSite"/></div>

                <div class="value"><g:link action="show"
                                           base="${airport.webSite}">${fieldValue(bean: airport, field: 'webSite')}</g:link></div>
            </div>
        </g:if>
    </div>

    <div class="pull-right">
        <div id="map_canvas" class="map"></div>
    </div>

    <div class="clearfix"></div>
</div>

<g:if test="${airportImages}">
    <h3>Images</h3><hr/>

    <div class="main-side pull-left">
        <img src="${createLink(controller: 'image', action: 'getMidImage', id: airportImages[0].id)}"
             class="main-image"/>
    </div>

    <div class="others-side">
        <g:each in="${airportImages.subList(1, airportImages.size())}" var="image">
            <g:link controller="image" action="getImage" id="${image.id}" target="blank">
                <img src="${createLink(controller: 'image', action: 'getThumbImage', id: image.id)}"/>
            </g:link>
        </g:each>
    </div>

    <div class="clearfix"></div>
</g:if>

<h3>Comments</h3><hr/>
<g:render template="comments"/>

<sec:ifLoggedIn>
    <g:form method="POST" name="commentAirports" update="comment" action="commentAirports">
        <g:hiddenField name="airportId" value="${airport.id}"/>

        <h4>Post Comment</h4>

        <p><label for="message">Message</label><br/></p>
        <g:textArea type="text" id="message" name="message" cols="" rows="" placeholder="Enter your comment..."/>

        <p><button type="submit" class="btn">Post Comment</button></p>
    </g:form>
</sec:ifLoggedIn>

</body>
</html>