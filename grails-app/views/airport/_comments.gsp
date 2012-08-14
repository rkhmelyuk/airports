
<div id='comments'>
    <g:if test="${comments}">
        <g:each in="${comments}" var="comm">
            <div class="comment">
                <div class="author pull-left">${fieldValue(bean: comm, field: 'user')}</div>
                <div class="date pull-right"><g:formatDate date="${comm.date}" format="MMM dd, yyyy HH:mm"/></div>
                <div class="clearfix"></div>
                <div class="message">${fieldValue(bean: comm, field: 'message')}</div>
            </div>
        </g:each>
    </g:if>
    <g:else>
        <p class="placeholder">No comments yet</p>
    </g:else>
</div>