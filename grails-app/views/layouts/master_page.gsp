<%--
  Created by IntelliJ IDEA.
  User: mohd
  Date: 13/2/15
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.linksharing.User" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <asset:javascript src="application.js"></asset:javascript>
  %{--  <asset:stylesheet href="jquery.ui.css"></asset:stylesheet>

    <asset:javascript src="jquery.js"></asset:javascript>
    <asset:javascript src="jquery-ui.js"></asset:javascript>--}%

    <link rel="stylesheet" type="text/css" href="/linksharing/css/home.css">

    <script type="text/javascript">
        function openRegistration()
        {
            window.location.href="registration.jsp"
        }
        function openDocumentPopup()
        {
            window.open("/linksharing/documentResource/document.gsp","Popup","width=600,height=450,left=350,top=100")
        }
        function openLinkPopup()
        {
            window.open("/linksharing/linkResource/link_resource.gsp","Popup","width=600,height=450,left=350,top=100")
        }
        function openInvitationPopup(link)
        {
            window.open(link,"Popup","width=600,height=400,left=350,top=150")
        }

        $(document).ready(function(){

         /*   var data=["Hello","Amir"];
            $('#Search').focus(function(){

                $('#Search').autocomplete({
                    source:data
                });

            })

*/

            $('.Subscribe').click(function(){
                var url='/linksharing/topic/subscribeTopic/?id='+this.id

                var status=new String($(this).text().toString())
                var anchor=this

                if(status=='Subscribe')
                {
                    $.get(url,function(data){

                        $(anchor).text('UnSubscribe')
                        $('.Serious').attr('disabled',false)
                    });
                }
                else
                {
                    url='/linksharing/topic/unSubscribeTopic/?id='+this.id
                    $.get(url,function(data){
                        if(data=='faild')
                        {
                            alert("Sorry, You are the Owner of this Topic You Can't  unsubscribe This")
                        }
                        else
                        {
                            $(anchor).text('Subscribe')
                            $('.Serious').attr('disabled',true)
                        }

                    });
                }
            });
            $('.MarkAsRead').click(function(){
                var url='/linksharing/dashboard/markasread/?id='+this.id
                var id=new String(this.id).toString()
                var anchor=this
                $.get(url,function(data){
                    if(data=='success')
                    {
                        $(anchor).text('Read')
                        $('#Inbox'+id).empty().remove()
                    }
                })


            });
            $('.Serious').change(function(){

                var topicid=this.id
                var seriousNess=new String($(this).val()).toString()
                var url='/linksharing/topic/changeSeriousNess/?id='+topicid+'&seriousNess='+seriousNess
                $.get(url,function(data){

                });
            });
            $('.Rating').mouseover(function(){

                var id=new String(this.id).toString()
                for(var i=1;i<=5;i++)
                {
                    $('#'+i).css('opacity','0.3')
                }
                for(var i=1;i<=parseInt(id);i++)
                {
                    $('#'+i).css('opacity','1')
                }
            });
            $('.Rating').mouseout(function(){


                for(var i=1;i<=5;i++)
                {
                    $('#'+i).css('opacity','0.3')
                }

            });
            $('.Rating').click(function(){
                var img=this
                var score=this.id
                var url='/linksharing/post/setRating/?id='+$('#resource').val()+'&score='+score

                $.get(url,function(data){
                    //alert($(img).siblings('img').attr('src'))
                    $(img).siblings().removeClass('Rating')
                    $(img).removeClass('Rating')
                    $(img).parent().removeEvent
                })

            });
            $('.Delete').click(function(){
                var id=this.id
                var url='/linksharing/post/deletePost/?id='+id
                $.get(url,function(data){
                    $('#ViewPost'+id).hide()
                    alert('Post has Been Deleted')

                });
            });
            $('.TopicText').hide()
            $('.Save').hide()
            $('.Cancel').hide()
            $('.CancelPost').hide()
            var id
            $('.Edit').click(function(){
                id=this.id
                $('#Topic'+id).hide()
                $('#TopicText'+id).show()
                $('#Save'+id).show()
                $('#Cancel'+id).show()
            });

            $('.Cancel').click(function(){
                id=new String(this.id).toString()
                id=id.substr(6)
                $('#Topic'+id).show()
                $('#TopicText'+id).hide()
                $('#Save'+id).hide()
                $('#Cancel'+id).hide()

            });
            $('.DescriptionText').hide()
            $('.EditPost').click(function(){
                //alert(this.id)
                id=this.id
                $('#Description'+id).hide()
                $('#DescriptionText'+id).show()
                $('#Save'+id).show()
                $('#Cancel'+id).show()
            });
            $('.CancelPost').click(function(){
                id=new String(this.id).toString()
                id=id.substr(6)
                $('#Description'+id).show()
                $('#DescriptionText'+id).hide()
                $('#Save'+id).hide()
                $('#Cancel'+id).hide()
            });
        })

    </script>
    <g:layoutHead/>
    <title><g:layoutTitle default="Link Sharing"></g:layoutTitle></title>
</head>
<body>
<header class="Header">
    <h1>Link Sharing</h1>
</header>
<div>

    <ul class="Menu">
        <li class="MenuLi"><g:link controller="home" action="home" >Home</g:link></li>
        <li class="MenuLi"><a href="" >Topic</a></li>

        <li class="MenuLi"><g:link controller="dashboard" action="dashboard"> Dashboard</g:link></li>
        <g:if test="${session["isAdmin"]}">
             <li class="MenuLi"link><g:link controller="user" action="userlist">User</g:link></li>
        </g:if>
    </ul>
</div>
<div class="Nav">
    <g:link controller="topic" action="topic" ><g:img dir="images" file="new1.png"  width="4.8%" style="margin-bottom:-1%;padding:0px 3px"></g:img></g:link>
    <a href="" onclick="openInvitationPopup('/linksharing/sendInvitation/sendinvitation')"><g:img dir="images" file="send.png"  width="5%" style="margin-bottom:-1.7%;padding:0px 3px"></g:img></a>
    <a href="" onclick="openDocumentPopup()"><g:img dir="images" file="document.png" width="4%" style="margin-bottom:-1%;padding:0px 3px"></g:img></a>
    <a href=""  onclick="openLinkPopup()"><g:img dir="images" file="attachment1.png" width="4%" style="margin-bottom:-1%;padding:0px 3px"></g:img></a>
    <input type="text" name="Search" class="Text" id="Search" placeholder="Search The Post"><input type="submit" class="Button" value="Go!">
    <a href="" ><g:img dir="images" file="user.png" width="4.5%" style="margin-bottom:-1.2%;padding:0px 3px"></g:img></a>
    <a href="" class="SignIn"> ${session["username"]}</a>
    <g:link action="logout" controller="login" class="SignIn">Logout</g:link>

</div>
<div class="Wrapper">
    <g:layoutBody/>
</div>
<footer class="Footer">
    <span style="border-right: 2px solid;padding:0px 10px">All Right Reserved</span>
    <span style="border-right: 2px solid;padding:0px 10px">Powered By TO THE NEW DIGITAL</span>
    <span><a href="">About us &nbsp;&nbsp;</a> </span>
</footer>
</body>
</html>
