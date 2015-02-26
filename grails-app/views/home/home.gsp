<%--
  Created by IntelliJ IDEA.
  User: mohd
  Date: 13/2/15
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ page import="com.linksharing.*" %>
    <link rel="stylesheet" type="text/css" href="/linksharing/css/style.css">
    <meta name="layout" content="master_page">%{--Import master page--}%

    <title>Home Page of Link Sharing</title>
</head>
<body>
    %{--<g:render template="/layouts/MyTemplate" model='[name: "Amir"]'/>
    <h1 align="center">Hello This is Layout Demo</h1>
    <h1><date:dateFormate  formate='dd-MMM-yyyy'/></h1>--}%
    <div class="RecentPost">
        <fieldset>
            <legend>Recent Post</legend>
        <g:each in="${Resource.list([max:2,sort:'id',order: 'desc'])}" var="resource">
            <div class="PostImage">
                <g:img dir="images" file="profile.png" width="128px"></g:img>
            </div>
            <div class="RecentPostMain">
                <div class="PostHeader">
                    <div>
                        <div  style="float: left">${resource.createdBy.firstName} &nbsp;&nbsp;<span style="color:gray;font-size: 90%;">@${resource.createdBy.firstName} ${resource.dateCreated}</span></div>
                        <div  style="float: right"><a href="" >Grails</a> </div>
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
                        <a href="" >View Post</a >
                    </div>
                </div>
            </div>
            <br><br><br>
        </g:each>
        </fieldset>
    </div>
    <div style="border:0px solid lightgray;float:right;width:50%;">
        <fieldset>
            <legend>Inbox</legend>
            <g:each in="${com.linksharing.ReadingItem.createCriteria().list(){eq("isRead",false)}}" var="unread">

            </g:each>
        </fieldset>
    </div>
</body>
</html>
