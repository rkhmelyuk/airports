<div id="users">
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
                        <a page="${page}" class="deleteUser" href="javascript:void(0);" rel="${user.id}">Delete</a>
                    </g:if>
                </td>
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

    <div class="btns pull-right"><g:link controller="dashboard" action="index" class="btn"><g:message
            code="airport.cancel"/></g:link></div>

    <div class="clearfix"></div>
</div>