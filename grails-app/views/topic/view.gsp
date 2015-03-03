<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 2/3/15
  Time: 8:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ page import="com.linksharing.*" %>
    <meta name="layout" content="master_page">
    <title>View Topic Detail</title>
</head>

<body>

<div class="TotalSubscription" style="border-bottom: 1px solid #d3d3d3;color:rgba(117, 33, 46, 0.98);float:left;width: 45%">
    <div class="PostImage" style="float:left;margin-right: 2%">
        <g:img dir="images" file="profile.png" width="128px"></g:img>
    </div>
    <div style="font-size: 120%;margin-top:2%;">
        ${topicMap.topicName}
    </div>
    <div style="color:gray;font-size: 90%">
        ${topicMap.createdBy}
    </div>
    <div style="margin-top:0%;font-size: 90%;">
        <div style="float:left;width:20%;border:0px solid black">
            Subscriptions<br>
            <b>${userTotalSubscription}</b>
        </div>
        <div style="float:right;width:45%;border:0px solid black">
            Post<br>
            <b>${totalPost}</b>
        </div>
        <div style="border:0px solid black">

            <g:if test="${subscriptionStatus}">
                <g:link action="unSubscribeTopic" id="${params.id}" >UnSubscribe</g:link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </g:if>
            <g:else>
                <g:link action="subscribeTopic" id="${params.id}" >Subscribe</g:link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </g:else>
                <g:select name="serious" from="['Serious','Very Serious']" class="Text"></g:select>&nbsp;&nbsp;
            <g:img dir="images" file="send.png" style="margin-bottom:-3%" width="7%"></g:img>
        </div>
    </div>
    <br><br>
    <div style="width: 90%;border-bottom: 1px solid lightgray;border-top: 1px solid lightgray;">
        <span style="font-size: 120%;font-weight: bold">User: ${topicMap.topicName}</span>
        <span style="float:right;"><a href="" style="color:gray;text-decoration: none;font-size: 80%;">View All</a></span>
    </div>

    <g:render template="topicuser" collection="${showTopicDTOList}" var="showTopicDTO"></g:render>
</div>


</body>
</html>