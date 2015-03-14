<g:each in="${postOnTopicDTOList}" var="postOnTopic">
    <div class="InboxImage">
        <g:img uri="${postOnTopic.user.photo}" width="128px"></g:img>
    </div>
    <div class="InboxMain">
        <div class="InboxHeader">
            <div>
                <div style="float: left">${postOnTopic.user.getName()} &nbsp;&nbsp;<span style="color:gray;font-size: 90%;">@${postOnTopic.user.userName}</span></div>
                <div  style="float: right"><span style="color: rgba(117, 33, 46, 0.98);font-size: 80%"><g:formatDate date="${postOnTopic.resource.dateCreated}" format="dd-MMM-yyyy hh:mm a"></g:formatDate></span> </div>
            </div>
        </div>
        <div class="InboxMain" style="clear: right">
            ${postOnTopic.resource.description}
        </div>
        <div class="InboxFooter">
            <div style="float: left">
                <a href=""> <g:img dir="images" file="facebook.png" width="20px"></g:img></a>
                <a href=""><g:img dir="images" file="twitter.png" width="20px"></g:img></a>
                <a href=""><g:img dir="images" file="google-plus.png" width="20px"></g:img></a>
            </div>
            <div style="float: right">
                <g:if test="${postOnTopic.document}">
                    <g:link url="${postOnTopic.resource.filePath}">Download</g:link>&nbsp;&nbsp;&nbsp;&nbsp;
                </g:if>
                <g:else>
                     <a href="${postOnTopic.resource.url}" >View Full Site</a >&nbsp;&nbsp;
                </g:else>
                <g:if test="${postOnTopic.readingItem?.isRead}">
                    <a href="javascript:void 0">Read</a> &nbsp;&nbsp;
                </g:if>
                <g:elseif test="${postOnTopic.subscriptionStatus}">
                    <a href='javascript:void(0)' id=${postOnTopic.readingItem?.id} class="MarkAsRead">Mark as read</a> &nbsp;&nbsp;
                </g:elseif>
                <g:link controller="post" action="post" id="${postOnTopic.resource.id}">View Post</g:link>
            </div>
        </div>
    </div>
    <br><br><br><br>

</g:each>

<div class="Paginate">
    <util:remotePaginate max="10" id="${params.id}" update="PostOnTopic" action="seeMorePostOnTopic" total="${postOnTopicSize}"></util:remotePaginate>
</div>
