
    <div class="InboxImage">
        <g:img dir="images" file="profile.png" width="128x"></g:img>
    </div>
    <div class="InboxMain">
        <div class="InboxHeader">
            <div>
                <div  style="float: left">${inboxDTO.user.getName()} &nbsp;&nbsp;<span style="color:gray;font-size: 90%;">@${inboxDTO.user.userName}</span></div>
                <div  style="float: right"><a href="" >${inboxDTO.resource.topic.name}</a> </div>
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
                    <g:link url="${inboxDTO.resource.filePath}">Download</g:link>&nbsp;&nbsp;
                </g:if>
                <a href="" >View Full Site</a >&nbsp;&nbsp;
                <g:link action="markasread" id="${inboxDTO.readingItem.id}">Mark as read</g:link> &nbsp;&nbsp;
                <a href="" >View Post</a >
            </div>
        </div>
    </div>
    <br><br><br>