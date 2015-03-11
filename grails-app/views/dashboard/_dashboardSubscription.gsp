<g:each in="${dashBoardSubscriptionList}" var="dashBoardSubscription">
    <div>
        <div id="${dashBoardSubscription.topic.id}">
            <div  style="float:left;margin-right: 2%">
                <g:img dir="images" file="profile.png" width="128px"></g:img>
            </div>
            <div style="font-size: 80%;margin-top:2%;">
                <a href="/linksharing/topic/view/${dashBoardSubscription.topic.id}" class="Topic" id="Topic${dashBoardSubscription.topic.id}">${dashBoardSubscription.topic.name}</a>
                  <g:form style="display: inline" controller="dashboard" action="editTopic">
                      <input type="hidden" value="${dashBoardSubscription.topic.id}" name="TopicID">
                      <g:textField name="TopicName" value="${dashBoardSubscription.topic.name}" class="Text TopicText" id="TopicText${dashBoardSubscription.topic.id}"></g:textField>
                      <g:submitButton name="Save" id="Save${dashBoardSubscription.topic.id}" class="Button Save"></g:submitButton>
                  </g:form>
                  <g:actionSubmit value="Cancel" id="Cancel${dashBoardSubscription.topic.id}"  class="Button Cancel"></g:actionSubmit>
            </div>
            <div style="color:gray;font-size: 80%">
                <g:if test="${dashBoardSubscription.owner}">
                    Created By: You
                </g:if>
                <g:else>
                    Created By: @${dashBoardSubscription.topic.createdBy.userName}
                    <g:link controller="topic" action="unSubscribeTopicFromDashboard" id="${dashBoardSubscription.topic.id}" class="SignIn "> UnSubscribe</g:link>
                </g:else>
            </div>
            <div style="margin-top:2%;font-size: 80%;">
                <div style="float:left;width:20%;border:0px solid black">
                    Subscriptions<br>
                    <b>${dashBoardSubscription.totalSubscription}</b>
                </div>
                <div style="float:right;width:45%;border:0px solid black">
                    Post<br>
                    <b>${dashBoardSubscription.totalPost}</b>
                </div>
            </div>
            <div style="clear:right;padding-top: 1.5%;border:0px solid black">
                <g:select name="Serious" id="${dashBoardSubscription.topic.id}" from="${com.linksharing.Seriousness.values()}" value="${dashBoardSubscription.seriousness}" class="Text Serious"></g:select>
                <g:if test="${dashBoardSubscriptionList.owner}">
                    <g:select name="Visibility" from="${com.linksharing.Visibility.values()}" value="${dashBoardSubscription.topic.visibility}" class="Text"></g:select>&nbsp;
                </g:if>
                <div style="width:35%;float:right">
                    <a href="" onclick="openInvitationPopup('/linksharing/sendInvitation/sendinvitation/${dashBoardSubscription.topic.id}')" ><g:img dir="images" file="message.png" width="11%"></g:img></a>&nbsp;&nbsp;
                    <g:if test="${dashBoardSubscription.owner}">
                        <a href="javascript:void(0)" class="Edit" id="${dashBoardSubscription.topic.id}"> <g:img dir="images" file="edit.jpeg" width="9%" ></g:img></a>&nbsp;
                        <g:link controller="dashboard" action="deleteTopic" id="${dashBoardSubscription.topic.id}"> <g:img dir="images" file="delete.jpeg" width="10%"></g:img></g:link>&nbsp;
                    </g:if>
                </div>
            </div>
        </div>
    </div>
    <br>
</g:each>