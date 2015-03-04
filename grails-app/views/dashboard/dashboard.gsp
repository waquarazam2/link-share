<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 27/2/15
  Time: 6:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ page import="com.linksharing.*" %>
    <meta content="master_page" name="layout">
    <link rel="stylesheet" type="text/css" href="/linksharing/css/style.css">
    <title></title>
</head>
<body>
<div class="TotalSubscription" style="border-bottom: 1px solid #d3d3d3;color:rgba(117, 33, 46, 0.98);float:left;width: 45%">
    

    <g:render template="dashboardUserDetail" model="[dashBoardUserInfo:dashBoardUserInfo]"></g:render>

    <br/><br/>

    <div style="margin-top:3%;width: 90%;border-bottom: 1px solid lightgray;border-top: 1px solid lightgray;">
        <span style="font-size: 120%;font-weight: bold">Subscriptions</span>
        <span style="float:right;"><a href="" style="color:gray;text-decoration: none;font-size: 80%;">View All</a></span>
    </div>

    <g:render template="dashboardSubscription" collection="${dashBoardSubscription}" var="dashBoradSubscription"></g:render>
</div>

<div style="border:0px solid lightgray;float:right;width:50%;" class="Inbox">
    <fieldset>
        <legend>
            <span>Inbox</span>
            <span style="float: right;text-align: right">
                <g:textField style="border:1px solid lightgray" name="search" class="" placeholder="Search....!"></g:textField>
                <g:actionSubmit style="padding:1px 0px;border:0px;margin-left: -2.2%" class="Button" value="Go!" ></g:actionSubmit>
            </span>
        </legend>
       <g:render template="inbox" collection="${inboxDTO}" var="inboxDTO"></g:render>
    </fieldset>
    <div style="border:0px solid black;float: right;clear: both;width:15%;padding-bottom: .5%;">
        <a href="" class="SignIn" style="color:white;">Next >></a>&nbsp;&nbsp;
    </div>
</div>
</body>
</html>