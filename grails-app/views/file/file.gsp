<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 24/2/15
  Time: 4:38 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:uploadForm controller="file" action="upload" method="post">
    <g:textField name="fname"></g:textField>
    <input type="file" name="file">
    <g:submitButton name="Upload"></g:submitButton>
</g:uploadForm>
</body>
</html>