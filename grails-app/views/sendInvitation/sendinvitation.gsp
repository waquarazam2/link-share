<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 25/2/15
  Time: 5:38 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ page import="com.linksharing.*" %>
    <link rel="stylesheet" type="text/css" href="/linksharing/css/style.css">
    <link rel="stylesheet" type="text/css" href="/linksharing/css/home.css">
    <title>Send Invitation</title>
</head>

<body>
<div class="Header">
    <h1>Link Sharing</h1>
</div>
<g:form controller="sendInvitation" action="send">
    <table class="Document" style="margin-top:6%;width:70%">
        <tr>
            <td>Email *</td>
            <td><input type="email" name="email" class="Text"></td>
        </tr>
        <tr>
            <td>
                Topic *
            </td>
            <td colspan="2" align="right">
                <select class="Text" name="topic">
                    <g:each in="${Topic.findAllByCreatedByAndVisibility(User.get(session["id"]),Visibility.PRIVATE)}" var="topic">
                        <option>${topic.name}</option>
                    </g:each>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <g:submitButton name="Send" class="Button">
                </g:submitButton>
                <input type="reset" value="Reset" class="Button">
            </td>
        </tr>
    </table>
</g:form>
</body>
</html>