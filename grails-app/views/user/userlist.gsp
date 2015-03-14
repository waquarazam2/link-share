<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 1/3/15
  Time: 7:34 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:javascript src="application.js"></asset:javascript>
    <%@ page import="com.linksharing.*" %>
    <meta name="layout" content="master_page">
    <link rel="stylesheet" type="text/css"  href="/linksharing/css/style.css">
    <title></title>
    <script>
        $(document).ready(function(){
            $(document).on('click','.User',function(){
                var url=this.id
                var anchor=this
                var status=new String($(this).text().toString())
                if(status.toString()=='block')
                {
                    $.get(url+'&active=true',function(data){

                        $(anchor).text('unblock')

                    });
                }
                else
                {
                    $.get(url+'&active=false',function(data){
                        $(anchor).text('block')
                    });
                }
            });
        });
    </script>
</head>

<body>
<div class="UserHeader">
    <input type="text" name="SearchUserByName" id="SearchUserByName" class="Text" placeholder="Search User By Name or Email">
    <g:select name="SearchUserByType" id="SearchUserByType" from="['All User','Active','InActive']" class="Text"></g:select>
</div>
<div id="UserList">
    <ls:user></ls:user>
</div>
</body>
</html>