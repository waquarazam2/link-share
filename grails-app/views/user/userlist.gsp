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
    <title></title>
    <script>
        $(document).ready(function(){
            $('.User').click(function(){
                var url=this.id
                var anchor=this
               var status=new String($(this).text().toString())

                if(status.toString()=='block')
                {

                    $.get(url+'&active=true',function(data){

                        $(anchor).text('unblock')

                    });
                    //alert(url)
                }
                else
                {
                    $.get(url+'&active=false',function(data){
                        $(anchor).text('block')
                    });

                }
               // alert()

            });
        });
    </script>
</head>

<body>
<ls:user></ls:user>
</body>
</html>