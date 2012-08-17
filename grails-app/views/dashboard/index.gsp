<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Airports</title>
    <r:script>
        $(document).ready(function() {
           $("#link").click(function(){
           $("#userList").append("sdasddad")
               $("#userList").load("<g:createLink controller="Account" action="userPage"/>")

           })
        })
    </r:script>
</head>

<body>
<div style="padding: 10px;">
    <p><g:link controller="Airport" action="index">Airports</g:link></p>
    <sec:ifAnyGranted roles="ROLE_ADMIN">
        <p><g:link controller="Account" action="userPage">User management</g:link></p>
    %{--<p><g:link id="link" >User management 2</g:link></p>--}%
        <p><button id="link">User management 2</button></p>

        <div id="userList">SSSSS</div>
    </sec:ifAnyGranted>
    <table style="height:50px; weight:100px">
        <g:each in="${airports}" var="airpor" status="i">
            <g:if test="${i < 5}">
                <tr>
                    <td>${i + 1}</td>
                    <td>${airpor.name}</td>
                    <td>${airpor.addressCountry}</td>
                </tr>
            </g:if>
        </g:each>
    </table>

    <h1>Last ten comment users</h1>
    <g:each in="${lastTenComment}" var="lastComment" status="i">

        <div class="comment">
            <div class="author pull-left">${i + 1}
            <g:formatDate date="${lastComment.date}" format="MMM dd, yyyy HH:mm"/>
            </div>

            <div class="date pull-right"></div>

            <div class="date pull-right">
                <g:link controller="airport" action="show" id="${lastComment.airportId}">for airport</g:link>
            </div>

            <div class="clearfix"></div>

            <div class="message">${fieldValue(bean: lastComment, field: 'message')}</div>

            <div class="pull-right">${fieldValue(bean: lastComment, field: 'user')}</div>

            <div class="clearfix"></div>
        </div>

    </g:each>
</table>
</div>
</body>
</html>
