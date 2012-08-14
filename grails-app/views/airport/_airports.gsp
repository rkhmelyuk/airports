<div id="airports">
    <table border="">
        <thead>
            <tr>
                <th><g:message code="airport.name"/></th>
                <th><g:message code="airport.addressCity"/></th>
                <th><g:message code="airport.webSite"/></th>
                <th></th>
                <th></th>
            </tr>
        </thead>

        <g:each in="${airports}" var="airport" id="write">
            <tr>
                <td><g:link action="show" id="${airport.id}">${fieldValue(bean: airport, field: 'name')}</g:link></td>
                <td>${fieldValue(bean: airport, field: 'address')}</td>
                <td><g:if test="${airport.webSite}"><g:link action="show" base="${airport.webSite}">${fieldValue(bean: airport, field: 'webSite')}</g:link></g:if></td>
                <td class="action edit"><g:link action="edit" id="${airport.id}"><g:message code="airport.edit"/></g:link></td>
                <td class="action delete"><a page="${page}" class="delete" href="javascript:void(0);" rel="${airport.id}">Delete</a></td>
            </tr>
        </g:each>
    </table>

    <p class="total">Total records: ${countRecord}</p>

    <div class="btns">
    <g:if test="${page > 1}">
        <div class="pull-left">
            <input type="button" class="prev btn" rel="${page - 1}" value="Prev"/>
        </div>
    </g:if>
    <g:if test="${linkNextIsThere}">
        <div class="pull-right">
            <input type="button" class="next btn" rel="${page + 1}" value="Next"/>
        </div>
    </g:if>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>