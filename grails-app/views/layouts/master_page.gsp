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
   %{-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>--}%
    <link rel="stylesheet" type="text/css" href="/linksharing/css/jquery-ui.css">
    <script src="/linksharing/js/jquery-ui.js" type="text/javascript"></script>
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

            var searchURL
            $(document).on("keydown","#Search",function(){
                searchURL='/linksharing/home/autoSuggestion?query='+$("#Search").val()
                $.get(searchURL,function(data){
                    $('#Search').autocomplete({source:data})
                });

            })

            $(document).on('click','.Subscribe',function(){
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
            $(document).on('click','.MarkAsRead',function(){
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
            $(document).on('change','.Serious',function(){
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
            $(document).on('click','.Delete',function(){
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
            $(document).on("click",".Edit",function(){
                id=this.id
                $('#Topic'+id).hide()
                $('#TopicText'+id).show()
                $('#Save'+id).show()
                $('#Cancel'+id).show()
            })

            $(document).on("click",".Cancel",function(){
                id=new String(this.id).toString()
                id=id.substr(6)
                $('#Topic'+id).show()
                $('#TopicText'+id).hide()
                $('#Save'+id).hide()
                $('#Cancel'+id).hide()
            });
            $('.DescriptionText').hide()
            $(document).on('click','.EditPost',function(){
                //alert(this.id)
                id=this.id
                $('#Description'+id).hide()
                $('#DescriptionText'+id).show()
                $('#Save'+id).show()
                $('#Cancel'+id).show()
            });
            $(document).on('click','.CancelPost',function(){
                id=new String(this.id).toString()
                id=id.substr(6)
                $('#Description'+id).show()
                $('#DescriptionText'+id).hide()
                $('#Save'+id).hide()
                $('#Cancel'+id).hide()
            });
            $(document).on("keydown","#SearchUserByName",function(){
                var url='/linksharing/user/searchUserByName?query='+$("#SearchUserByName").val()+'&offset=0'
                $.get(url,function(data){

                    $("#UserList").html(data)

                })
            })
            $(document).on("change","#SearchUserByType",function(){
                var url='/linksharing/user/SearchUserByType?query='+$("#SearchUserByType").val()+'&offset=0'
                $.get(url,function(data){

                    $("#UserList").html(data)

                })
            })
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
        <li class="MenuLi"><g:link controller="topic" action="topic" >Topic</g:link></li>

        <li class="MenuLi"><g:link controller="dashboard" action="dashboard" id="0"> Dashboard</g:link></li>
        <g:if test="${session["isAdmin"]}">
             <li class="MenuLi"link><g:link controller="user" action="userlist" id="0">User</g:link></li>
        </g:if>
    </ul>
</div>
<div class="Nav">
    <g:link controller="topic" action="topic" ><g:img dir="images" file="new1.png"  width="4.8%" style="margin-bottom:-1%;padding:0px 3px"></g:img></g:link>
    <a href="" onclick="openInvitationPopup('/linksharing/sendInvitation/sendinvitation')"><g:img dir="images" file="send.png"  width="5%" style="margin-bottom:-1.7%;padding:0px 3px"></g:img></a>
    <a href="" onclick="openDocumentPopup()"><g:img dir="images" file="document.png" width="4%" style="margin-bottom:-1%;padding:0px 3px"></g:img></a>
    <a href=""  onclick="openLinkPopup()"><g:img dir="images" file="attachment1.png" width="4%" style="margin-bottom:-1%;padding:0px 3px"></g:img></a>
    <input type="text" name="Search" class="Text" id="Search" placeholder="Search The Topic"><input type="submit" class="Button" value="Go!">
    <a href="" ><g:img dir="images" file="user.png" width="4.5%" style="margin-bottom:-1.2%;padding:0px 3px"></g:img></a>
    <a href="/linksharing/profile/profile" class="SignIn"> ${session["username"]}</a>
    <g:link action="logout" controller="login" class="SignIn">Logout</g:link>

</div>
<div class="Wrapper">
    <g:layoutBody/>
</div>
<footer class="Footer">
    <span style="border-right: 2px solid;padding:0px 10px">All Right Reserved</span>
    <span style="border-right: 2px solid;padding:0px 10px">Powered By SHARDA UNIVERSITY</span>
    <span><a href="">About us &nbsp;&nbsp;</a> </span>
</footer>
</body>
</html>
