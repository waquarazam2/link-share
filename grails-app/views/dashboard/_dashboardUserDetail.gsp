
    <div class="PostImage" style="float:left;margin-right: 2%">
        <g:img uri="${dashBoardUserInfo.photoPath}" width="128px"></g:img>
    </div>
    <div style="font-size: 150%;margin-top:2%;">
        ${dashBoardUserInfo.name}
    </div>
    <div style="color:gray;font-size: 90%">
        ${dashBoardUserInfo.username}
    </div>
    <div style="margin-top:4%;font-size: 90%;">
        <div style="float:left;width:20%;border:0px solid black">
            Subscriptions<br>
            <b>${dashBoardUserInfo.totalSubscription}</b>
        </div>
        <div style="float:right;width:45%;border:0px solid black">
            Topic<br>
            <b>${dashBoardUserInfo.totalTopic}</b>
        </div>
    </div>

