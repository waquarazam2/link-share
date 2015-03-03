<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 1/3/15
  Time: 7:34 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ page import="com.linksharing.*" %>
    <meta name="layout" content="master_page">
    <title></title>
</head>

<body>

<div style="float: left;width: 100%;">
    <div class="TotalSubscription" style="border-bottom: 0px solid #d3d3d3;color:rgba(117, 33, 46, 0.98);width:40%;">
        <g:each in="${User.list([max:10,sort:'id',order:'desc'])}" var="user">
            <div class="PostImage" style="float:left;margin-right: 2%">
                <g:img dir="images" file="profile.png" width="90px"></g:img>
            </div>
            <div style="margin-top:2%;">
                ${user.firstName} ${user.lastName}
            </div>
            <div style="color:gray;font-size: 90%">
                @${user.userName}
            </div>
            <div style="margin-top:1%;font-size: 90%;">
                <div style="float:left;width:20%;border:0px solid black">
                    ${user.email}<br>
                    <span style="font-size: 85%;">
                        <g:formatDate date="${user.dateCreated}" format="dd-MMM yyyy"></g:formatDate>
                    </span>
                </div>
                <div style="float:right;width:45%;">
                    <g:if test="${user.active}">
                        <g:link controller="user" action="block" id="${user.id}" params="[active:'true']" class="SignIn">block</g:link>
                   </g:if>
                    <g:else>
                        <g:link controller="user" action="block" id="${user.id}" params="[active:'false']" class="SignIn">unblock</g:link>
                    </g:else>
                    <g:link class="SignIn">profile</g:link>
                </div>
            </div>
            <br><br><br>
        </g:each>
        <div>
            <g:link style="color:white;" class="SignIn">More</g:link>
        </div>
    </div>

</div>
</body>
</html>