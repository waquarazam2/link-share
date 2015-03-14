<g:each in="${inboxDTOList}" var="inboxDTO">
<div id="Inbox${inboxDTO.readingItem.id}">
    <div class="InboxImage">
        <g:img uri="${inboxDTO.user.photo}" width="128px"></g:img>
    </div>
    <div class="InboxMain">
        <div class="InboxHeader">
            <div>
                <div  style="float: left">${inboxDTO.user.getName()} &nbsp;&nbsp;<span style="color:gray;font-size: 90%;">@${inboxDTO.user.userName}</span></div>
                <div  style="float: right"><g:link controller="topic" action="view" id="${inboxDTO.resource.topic.id}">${inboxDTO.resource.topic.name}</g:link> </div>
            </div>
        </div>
        <div class="InboxMain" style="clear: right">
            ${inboxDTO.resource.description}
        </div>
        <div class="InboxFooter">
            <div style="float: left">
                <a href=""> <g:img dir="images" file="facebook.png" width="20px"></g:img></a>
                <a href=""><g:img dir="images" file="twitter.png" width="20px"></g:img></a>
                <a href=""><g:img dir="images" file="google-plus.png" width="20px"></g:img></a>
            </div>
            <div style="float: right">
                <g:if test="${inboxDTO.document}">
                    <g:link target="_blank" url="${inboxDTO.resource.filePath}">Download</g:link>&nbsp;&nbsp;
                </g:if>
                <g:else>
                    <a href="${inboxDTO.resource.url}" >View Full Site</a >&nbsp;&nbsp;
                </g:else>
                <a href='javascript:void(0)' id=${inboxDTO.readingItem.id} class="MarkAsRead">Mark as read</a> &nbsp;&nbsp;
                <g:link controller="post" action="post" id="${inboxDTO.resource.id}">View Post</g:link>
            </div>
        </div>
    </div>
    <br><br><br>
</div>


</g:each>
<div class="Paginate">
    <util:remotePaginate max="10"  update="InboxItem" action="seeMoreInboxItem" total="${inboxSize}"></util:remotePaginate>
</div>

