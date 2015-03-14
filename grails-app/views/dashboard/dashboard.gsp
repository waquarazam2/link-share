<%--
  Created by IntelliJ IDEA.
  User: amir
  Date: 27/2/15
  Time: 6:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ page import="com.linksharing.*" %>
    <meta content="master_page" name="layout">
    <link rel="stylesheet" type="text/css" href="/linksharing/css/style.css">
    <title>Dash Board Page</title>
    <script>
        $(document).ready(
                function(){
                    /*$('.MarkAsRead').click(function(){
                        var url=$(this).attr('id')

                        $.get(url,function(){

                            $(this).hide()
                        });
                    });*/
                }
        );
    </script>
</head>
<body>
<div class="TotalSubscription" style="border: 0px solid #d3d3d3;color:rgba(117, 33, 46, 0.98);float:left;width:45%">
    <ls:userDetail></ls:userDetail>
    <br/><br/>

    <div style="margin-top:3%;width: 90%;border-bottom: 1px solid lightgray;border-top: 1px solid lightgray;">
        <span style="font-size: 120%;font-weight: bold">Subscriptions</span>
        %{--<span style="float:right;"><a href="javascript:void 0" id="MoreSubscription" style="color:gray;text-decoration: none;font-size: 80%;">See More..!</a></span>--}%
    </div>
    <div id="Subscription">
        <ls:subscription></ls:subscription>
    </div>
  %{-- <div class="Paginate">
       <util:remotePaginate max="5" update="Subscription" action="seeMoreSubscription" total="${totalSubscription}"></util:remotePaginate>
   </div>--}%
</div>

<div style="border:0px solid lightgray;float:right;width:50%;" class="Inbox">
    <fieldset>
        <legend>
            <span>Inbox</span>
            <span style="float: right;text-align: right">
                <g:textField style="border:1px solid lightgray" name="search" class="" placeholder="Search....!"></g:textField>
                <g:actionSubmit style="padding:1px 0px;border:0px;margin-left: -2.2%" class="Button" value="Go!" ></g:actionSubmit>
            </span>
        </legend>
        <div id="InboxItem">
            <ls:inbox></ls:inbox>
        </div>
    </fieldset>

</div>
</body>
</html>