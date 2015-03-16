<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 16/3/15
  Time: 10:14 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/linksharing/css/home.css">
    <title></title>
</head>

<body>
<header class="Header">
    <h1>Link Sharing</h1>
</header>
    <a href="/linksharing/login/login" class="SignIn">Sign In</a>
    <a href="/linksharing/registration/registration" class="SignIn">Registration</a>
    <div align="center" style="margin-top: 5%">
        <g:form controller="login" action="resetPassword">
            <span>Enter Registered Email Address</span>
            <input type="email" name="email" class="Text">
            <g:submitButton name="Submit" class="Button"></g:submitButton>
        </g:form>
    </div>
</body>
</html>