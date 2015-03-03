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
    
    <div class="PostImage" style="float:left;margin-right: 2%">
        <g:img dir="images" file="profile.png" width="128px"></g:img>
    </div>
    <div style="font-size: 150%;margin-top:2%;">
           Mohd Amir
    </div>
    <div style="color:gray;font-size: 90%">
        @mohdamir
    </div>
    <div style="margin-top:4%;font-size: 90%;">
        <div style="float:left;width:20%;border:0px solid black">
            Subscriptions<br>
            <b>50</b>
        </div>
        <div style="float:right;width:45%;border:0px solid black">
            Topic<br>
            <b>30</b>
        </div>
    </div>

    <br/><br/>
    <div style="margin-top:3%;width: 90%;border-bottom: 1px solid lightgray;border-top: 1px solid lightgray;">
        <span style="font-size: 120%;font-weight: bold">Subscriptions</span>
        <span style="float:right;"><a href="" style="color:gray;text-decoration: none;font-size: 80%;">View All</a></span>
    </div>
    <div  style="float:left;margin-right: 2%">
        <g:img dir="images" file="profile.png" width="128px"></g:img>
    </div>
    <div style="font-size: 80%;margin-top:2%;">
        <a href="">Grails</a>
    </div>
    <div style="color:gray;font-size: 80%">
        @mohdamir
    </div>
    <div style="margin-top:2%;font-size: 80%;">
        <div style="float:left;width:20%;border:0px solid black">
            Subscriptions<br>
            <b>50</b>
        </div>
        <div style="float:right;width:45%;border:0px solid black">
            Post<br>
            <b>30</b>
        </div>

    </div>
    <div style="clear:right;padding-top: 1.5%;">
            <g:select name="Seriouse" from="['Serious','Very' ,'Serious','Casual']" %{--noSelection="['':'Select']--}%"></g:select>
            <g:select name="Visibility" from="['Private','Public']" %{--noSelection="['':'Select']--}%"></g:select>&nbsp;&nbsp;
            <div style="width:45%;float:right">
                <a href=""><g:img dir="images" file="message.png" width="10%"></g:img></a>&nbsp;&nbsp;
                <a href=""> <g:img dir="images" file="edit.jpeg" width="9%"></g:img></a>&nbsp;
                <a href=""> <g:img dir="images" file="delete.jpeg" width="10%"></g:img></a>&nbsp;
            </div>
    </div>
    <br>
    <div  style="float:left;margin-right: 2%">
        <g:img dir="images" file="profile.png" width="128px"></g:img>
    </div>
    <div style="font-size: 80%;margin-top:2%;">
        <a href="">Grails</a>
    </div>
    <div style="color:gray;font-size: 80%">
        @mohdamir
    </div>
    <div style="margin-top:2%;font-size: 80%;">
        <div style="float:left;width:20%;border:0px solid black">
            Subscriptions<br>
            <b>50</b>
        </div>
        <div style="float:right;width:45%;border:0px solid black">
            Post<br>
            <b>30</b>
        </div>

    </div>

    <div style="clear:right;padding-top: 1.5%;">
        <g:select name="Seriouse" from="['Serious','Very' ,'Serious','Casual']" %{--noSelection="['':'Select']--}%"></g:select>
        <div style="width:60%;float:right;text-align: left">
            <a href=""><g:img dir="images" file="message.png" width="7.5%"></g:img></a>&nbsp;&nbsp;

        </div>
    </div>


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
        <g:each in="${Resource.list([max:3,sort:'id',order: 'desc'])}" var="resource">
            <div class="InboxImage">
                <g:img dir="images" file="profile.png" width="128x"></g:img>
            </div>
            <div class="InboxMain">
                <div class="InboxHeader">
                    <div>
                        <div  style="float: left">${resource.createdBy.firstName} &nbsp;&nbsp;<span style="color:gray;font-size: 90%;">@${resource.createdBy.firstName}</span></div>
                        <div  style="float: right"><a href="" >Grails</a> </div>
                    </div>
                </div>
                <div class="InboxMain" style="clear: right">
                    ${resource.description}
                </div>
                <div class="InboxFooter">
                    <div style="float: left">
                        <a href=""> <g:img dir="images" file="facebook.png" width="20px"></g:img></a>
                        <a href=""><g:img dir="images" file="twitter.png" width="20px"></g:img></a>
                        <a href=""><g:img dir="images" file="google-plus.png" width="20px"></g:img></a>
                    </div>
                    <div style="float: right">
                        <a href="" >Download</a >&nbsp;&nbsp;
                        <a href="" >View Full Site</a >&nbsp;&nbsp;
                        <a href="" >Mark as read</a >&nbsp;&nbsp;
                        <a href="" >View Post</a >
                    </div>
                </div>
            </div>
            <br><br><br>
        </g:each>
    </fieldset>
    <div style="border:0px solid black;float: right;clear: both;width:15%;padding-bottom: .5%;">
        <a href="" class="SignIn" style="color:white;">Next >></a>&nbsp;&nbsp;
    </div>
</div>
</body>
</html>