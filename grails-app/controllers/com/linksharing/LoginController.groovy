package com.linksharing

class LoginController
{

    def loginService
    def login()
    {

    }
    def userAuthontication()
    {
        User user=User.findByUserNameAndActive(params.userName,true)
        session.setMaxInactiveInterval(-1)
        if(user?.userName==params?.userName)
        {
            session["username"]=user.userName
            session["id"]=user.id
            redirect(controller: 'home', action: 'openHomePage' )
        }
        else
        {
            render "User Name or Password Incorrect"
        }

    }
    def logout()
    {
        session.invalidate()
        redirect(action: 'login')
    }
    def forgotPassword()
    {

    }
   def  resetPassword()
   {
       String email=params.email
       if(loginService.checkEmail(email))
       {
           render 'Your Password Has Been send on Your <span style="color:blue">'+email +'</span> Email Address '+' <a href="http://localhost:8080/linksharing/login/login">Login</a>'
       }
       else
       {
           render email+' is Not a Valid Email Address'
       }

   }
    static beforeInterceptor = {
        User user=User.findByUserName(params?.userName)
        if(user?.admin)
            session["isAdmin"]=true
4
    }
    static afterInterceptor = {

    }
}
