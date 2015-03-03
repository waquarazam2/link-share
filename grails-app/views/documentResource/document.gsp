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
        <title>Share Document</title>
    </head>

    <body>
    <div class="Header">
        <h1>Link Sharing</h1>
    </div>
    <h2 style="text-align: center;color:rgba(117, 33, 46, 0.98);">Share Document to People</h2>
    <g:form controller="documentResource" action="addDocumentResource" enctype="multipart/form-data">
        <table class="Document">
            <tr>
                <td>Document*</td>
                <td><input type="file" name="file" class="File"></td>
            </tr>
            <tr>
                <td>Description*</td>
                <td><g:textArea name="description" class="Text"></g:textArea></td>
            </tr>
            <tr>
                <td>
                    Topic*
                </td>
                <td colspan="2" align="right">
                   <select class="Text" name="topic">
                       <g:each in="${Topic.findAllByCreatedBy(User.get(session["id"]))}" var="topic">
                           <option>${topic.name}</option>
                       </g:each>
                   </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <g:submitButton name="Share" class="Button">
                    </g:submitButton>
                    <input type="reset" value="Reset" class="Button">
                </td>
            </tr>
        </table>
    </g:form>
    </body>
    </html>