<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 21/2/15
  Time: 10:25 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ page import="com.linksharing.*" %>
    <asset:javascript src="application.js"></asset:javascript>
    <meta name="layout" content="master_page">
    <link rel="stylesheet" type="text/css" href="/linksharing/css/style.css">
    <title>Add New Topic</title>
    <script>
        $(document).ready(
            function() {

             }
        );
    </script>
</head>

<body>

    <g:form controller="topic" action="addTopic">
        <table class="TopicTable" align="left">
            <tr>
                <td>Topic Name</td><td><g:textArea name="name" class="Text"></g:textArea></td>
            </tr>
            <tr>
                <td>Visibility</td><td><g:select name="visib" from='${Visibility.values()}' class="Text"></g:select></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <g:submitButton name="Add" class="Button"></g:submitButton>
                    <input type="reset" value="Reset" class="Button">
                </td>
            <tr>
        </table>
    </g:form>
    <div class="RecentTopic">
        <fieldset>
            <legend>&nbsp;&nbsp;&nbsp;Me...!</legend>
            <ls:myTopicList></ls:myTopicList>
        </fieldset>
        <fieldset>
            <legend>&nbsp;&nbsp;&nbsp;Recently Added Topic...!</legend>
                <ls:otherTopicList></ls:otherTopicList>
        </fieldset>
    </div>

</body>
</html>