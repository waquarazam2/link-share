<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 20/2/15
  Time: 12:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <asset:javascript src="application.js"></asset:javascript>
    <meta content="master_page" name="layout">

    <title></title>
    <script>
        $(document).ready(function(){
            $('.Link').click(function(){
                //alert(this.id)
                $('button').text("Hello")
            });
        });
    </script>
</head>
<body>
<h4 align="center" style="border:1px solid black">
    This is Layout Demo
</h4>
<button>Button</button>
<a href='#' id="/linksharing/link/view/5" class="Link">Click Here....</a>
</body>
</html>