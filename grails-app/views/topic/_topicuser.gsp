<g:each in="${showTopicDTOList}" var="showTopicDTO">

    <div  style="float:left;margin-right: 2%">
        <g:img uri="${showTopicDTO.user.photo}" width="128px"></g:img>
    </div>
    <div style="font-size: 80%;margin-top:2%;">
        ${showTopicDTO.user.name}
    </div>
    <div style="color:gray;font-size: 80%">
        @${showTopicDTO.user.userName}
    </div>
    <div style="margin-top:2%;font-size: 80%;">
        <div style="float:left;width:20%;border:0px solid black">
            Subscriptions<br>
            <b>${showTopicDTO.subscription}</b>
        </div>
        <div style="float:right;width:45%;border:0px solid black">
            Topic<br>
            <b>${showTopicDTO.topic}</b>
        </div>

    </div>
    <br><br><br><br/><br>
</g:each>

<div class="Paginate">
    <util:remotePaginate max="5" id="${params.id}" update="UserOfTopic" action="seeMoreUserOfTopic" total="${totalUserOfTopic}"></util:remotePaginate>
</div>