<%--
  Created by IntelliJ IDEA.
  User: mohd
  Date: 13/2/15
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.linksharing.User" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <asset:javascript src="application.js"></asset:javascript>
    <link rel="stylesheet" type="text/css" href="/linksharing/css/home.css">
    <script type="text/javascript">
        function openRegistration()
        {
            window.location.href="registration.jsp"
        }
        function openDocumentPopup()
        {
            window.open("/linksharing/documentResource/document.gsp","Popup","width=600,height=450,left=350,top=100")
        }
        function openLinkPopup()
        {
            window.open("/linksharing/linkResource/link_resource.gsp","Popup","width=600,height=450,left=350,top=100")
        }
        function openInvitationPopup()
        {
            window.open("/linksharing/sendInvitation/sendinvitation.gsp","Popup","width=600,height=400,left=350,top=150")
        }
    </script>
    <g:layoutHead/>
    <title><g:layoutTitle default="Link Sharing"></g:layoutTitle></title>
</head>
<body>
<header class="Header">
    <h1>Link Sharing</h1>
</header>
<div>
    <ul class="Menu">
        <li class="MenuLi"><g:link controller="home" action="home" >Home</g:link></li>
        <li class="MenuLi"><a href="" >Topic</a></li>
        <li class="MenuLi"><a href="">Post</a></li>
        <li class="MenuLi"><g:link controller="dashboard" action="dashboard"> Dashboard</g:link></li>
        <g:if test="${session["isAdmin"]}">
             <li class="MenuLi"link><g:link controller="user" action="userlist">User</g:link></li>
        </g:if>
    </ul>
</div>
<div class="Nav">
    <g:link controller="topic" action="topic" ><g:img dir="images" file="new1.png"  width="4.8%" style="margin-bottom:-1%;padding:0px 3px"></g:img></g:link>
    <a href="" onclick="openInvitationPopup()"><g:img dir="images" file="send.png"  width="5%" style="margin-bottom:-1.7%;padding:0px 3px"></g:img></a>
    <a href="" onclick="openDocumentPopup()"><g:img dir="images" file="document.png" width="4%" style="margin-bottom:-1%;padding:0px 3px"></g:img></a>
    <a href=""  onclick="openLinkPopup()"><g:img dir="images" file="attachment1.png" width="4%" style="margin-bottom:-1%;padding:0px 3px"></g:img></a>
    <input type="text" class="Text" placeholder="Search The Post"><input type="submit" class="Button" value="Go!">
    <a href="" ><g:img dir="images" file="user.png" width="4.5%" style="margin-bottom:-1.2%;padding:0px 3px"></g:img></a>
    <a href="" class="SignIn"> ${session["username"]}</a>
    <g:link action="logout" controller="login" class="SignIn">Logout</g:link>

</div>
<div class="Wrapper">
    <g:layoutBody/>
</div>
<footer class="Footer">
    <span style="border-right: 2px solid;padding:0px 10px">All Right Reserved</span>
    <span style="border-right: 2px solid;padding:0px 10px">Powered By TO THE NEW DIGITAL</span>
    <span><a href="">About us &nbsp;&nbsp;</a> </span>
</footer>
</body>
</html>
