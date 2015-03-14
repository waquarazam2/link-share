<g:each in="${resources}" var="resource">
<div class="PostImage">

    <g:img uri="${resource.createdBy.photo}" width="128px"></g:img>
</div>
<div class="RecentPostMain">
    <div class="PostHeader">
        <div>
            <div  style="float: left">${resource.createdBy.name} &nbsp;&nbsp;<span style="color:gray;font-size: 90%;">@${resource.createdBy.userName} &nbsp;&nbsp;<g:formatDate date="${resource.dateCreated}" format="dd-MMM-yyyy hh:mm a"></g:formatDate></span></div>
            <div  style="float: right"><a href="/linksharing/topic/view/${resource.topic.id}">${resource.topic.name}</a> </div>
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
</g:each>

<div class="Paginate">
    <util:remotePaginate max="5"  update="RecentPost" action="recentNextPage" total="${totalRecentPost+""}"></util:remotePaginate>
</div>
