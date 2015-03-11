
<div class="PostImage">

    <g:img dir="images" file="profile.png" width="128px"></g:img>
</div>
<div class="RecentPostMain">
    <div class="PostHeader">
        <div>
            <div  style="float: left">${resource.createdBy.name} &nbsp;&nbsp;<span style="color:gray;font-size: 90%;">@${resource.createdBy.userName} &nbsp;&nbsp;<g:formatDate date="${resource.dateCreated}" format="dd-MMM-yyyy hh:mm a"></g:formatDate></span></div>
            <div  style="float: right"><g:link controller="topic" action="view" id="${resource.topic.id}" >${resource.topic.name}</g:link> </div>
        </div>
    </div>
    <div class="PostMain" style="clear: right">
        ${resource.description}
    </div>
    <div class="PostFooter">
        <div style="float: left">
            <a href=""> <g:img dir="images" file="facebook.png" width="20px"></g:img></a>
            <a href=""><g:img dir="images" file="twitter.png" width="20px"></g:img></a>
            <a href=""><g:img dir="images" file="google-plus.png" width="20px"></g:img></a>
        </div>
        <div style="float: right">
            <g:link controller="post" action="post" id="${resource.id}" >View Post</g:link>
        </div>
    </div>
</div>
<br><br><br>
