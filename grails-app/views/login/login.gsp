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
    <link rel="stylesheet" type="text/css" href="/linksharing/css/login.css">
    <script type="text/javascript">
        function openRegistration()
        {
            window.location.href="/linksharing/registration/registration"
        }
    </script>
    <title>Login for Link Sharing</title>
</head>
<body>
<header class="Header">
    <h1>Sign in for Link Sharing</h1>
</header>
<h1 style="text-align:right;width:75%;margin:2% 0px;color:rgba(117, 33, 46, 0.98);;font-size:250%;border:0px solid #000000;">Its Time To Share The Thing</h1>

<g:form controller="login" action="userAuthontication">
    <table align="center" class="Table">
        <caption>Login</caption>
        <tr>
            <td>User Name</td>
            <g:if test="${params.u}">
                <td><g:textField class="Text" value="${params.u}" name="userName" placeholder="User Name"></g:textField></td>
            </g:if>
            <g:else>
                <td><g:textField class="Text" name="userName" placeholder="User Name"></g:textField></td>
            </g:else>
        </tr>
        <tr>
            <td>Password</td>
            <td><g:passwordField class="Text"  name="password" placeholder="Password"></g:passwordField></td>
        </tr>

        <tr>
            <td colspan="2" align="right">
                <g:submitButton action="userAuthontication" name="Login" class="Button"></g:submitButton>&nbsp;
                <input type="button" value="Sign up" class="Button" onclick="openRegistration()">
            </td>
        </tr>
        <tr>
            <td colspan="2"><a href="/linksharing/login/forgotPassword">Forgot Password</a> </td>
        </tr>
    </table>
</g:form>

<footer class="Footer">
    <span style="border-right: 2px solid;padding:0px 10px">All Right Reserved</span>
    <span style="border-right: 2px solid;padding:0px 10px">Powered By TO THE NEW DIGITAL</span>
    <span><a href="">About us </a> </span>
</footer>
</body>
</html>
