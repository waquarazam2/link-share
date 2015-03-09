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
    <link rel="stylesheet" type="text/css" href='<g:resource dir="css" file="style.css"></g:resource> '>
    <meta name="layout" content="master_page">
    <title>View Topic Detail</title>
</head>

<body>

<div class="TotalSubscription" style="border-bottom: 1px solid #d3d3d3;color:rgba(117, 33, 46, 0.98);float:left;width: 45%">
    <div class="PostImage" style="float:left;margin-right: 2%">
        <g:img dir="images" file="profile.png" width="128px"></g:img>
    </div>
    <div style="font-size: 120%;margin-top:2%;">
        ${topicMap.topicName}&nbsp;<span style="font-size: 60%;font-weight: bold ">(${topicMap.visibility})</span>
    </div>
    <div style="color:gray;font-size: 90%">
        @${topicMap.createdBy}
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
                <a href="javascript:void(0)"  id="${params.id}" class="SignIn Subscribe" style="color:white">UnSubscribe</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <g:select  name="serious" id="${params.id}" from="${com.linksharing.Seriousness.values()}" value="${topicMap.seriousness}" class="Text Serious"></g:select>&nbsp;&nbsp;
            </g:if>
            <g:else>
                <a href="javascript:void(0)"  id="${params.id}" class="SignIn Subscribe" style="color:white">Subscribe</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <g:select disabled="true" name="serious" id="${params.id}" from="${com.linksharing.Seriousness.values()}" value="${topicMap.seriousness}" class="Text Serious"></g:select>&nbsp;&nbsp;
            </g:else>

            <a href="" onclick="openInvitationPopup('/linksharing/sendInvitation/sendinvitation/${topicMap.topicId}')" >
                <g:img dir="images" file="send.png" style="margin-bottom:-3%" width="7%">
                </g:img>
            </a>
        </div>
    </div>
    <br><br>
    <div style="width: 90%;border-bottom: 1px solid lightgray;border-top: 1px solid lightgray;">
        <span style="font-size: 120%;font-weight: bold">User: ${topicMap.topicName}</span>
        <span style="float:right;"><a href="" style="color:gray;text-decoration: none;font-size: 80%;">View All</a></span>
    </div>
    <ls:topicDetail></ls:topicDetail>

</div>

<div style="border:0px solid lightgray;float:right;width:50%;" class="Inbox">
    <fieldset>
        <legend>
            <span>Posts: ${topicMap.topicName} </span>
            <span style="float: right;text-align: right">
                <g:textField style="border:1px solid lightgray" name="search" class="" placeholder="Search....!"></g:textField>
                <g:actionSubmit style="padding:1px 0px;border:0px;margin-left: -2.2%" class="Button" value="Go!" ></g:actionSubmit>
            </span>
        </legend>
        <ls:postOnTopic></ls:postOnTopic>
    </fieldset>
    <div style="border:0px solid black;float: right;clear: both;width:15%;padding-bottom: .5%;">
        <a href="" class="SignIn" style="color:white;">Next >></a>&nbsp;&nbsp;
    </div>
</div>


</body>
</html>