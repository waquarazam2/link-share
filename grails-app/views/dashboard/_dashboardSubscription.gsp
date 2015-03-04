<div  style="float:left;margin-right: 2%">
    <g:img dir="images" file="profile.png" width="128px"></g:img>
</div>
<div style="font-size: 80%;margin-top:2%;">
    <g:link controller="topic" action="view" id="${dashBoradSubscription.topic.id}">${dashBoradSubscription.topic.name}</g:link>
</div>
<div style="color:gray;font-size: 80%">
    ${dashBoradSubscription.topic.createdBy.userName}
</div>
<div style="margin-top:2%;font-size: 80%;">
    <div style="float:left;width:20%;border:0px solid black">
        Subscriptions<br>
        <b>${dashBoradSubscription.totalSubscription}</b>
    </div>
    <div style="float:right;width:45%;border:0px solid black">
        Post<br>
        <b>${dashBoradSubscription.totalPost}</b>
    </div>

</div>
<div style="clear:right;padding-top: 1.5%;">

   <g:select name="Seriouse" from="['Serious','Very' ,'Serious','Casual']" %{--noSelection="['':'Select']--}%"></g:select>
   <g:if test="${dashBoradSubscription.owner}">
       <g:select name="Visibility" from="['Private','Public']" %{--noSelection="['':'Select']--}%"></g:select>&nbsp;&nbsp;
   </g:if>
       <div style="width:45%;float:right">
    <a href=""><g:img dir="images" file="message.png" width="10%"></g:img></a>&nbsp;&nbsp;
    <g:if test="${dashBoradSubscription.owner}">
        <a href=""> <g:img dir="images" file="edit.jpeg" width="9%"></g:img></a>&nbsp;
        <g:link controller="dashboard" action="deleteTopic" id="${dashBoradSubscription.topic.id}"> <g:img dir="images" file="delete.jpeg" width="10%"></g:img></g:link>&nbsp;
    </g:if>
    </div>
</div>
<br>
