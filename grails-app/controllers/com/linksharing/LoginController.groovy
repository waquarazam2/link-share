package com.linksharing

class LoginController
{

    def login()
    {

    }
    def userAuthontication()
    {
        User user=User.findByUserName(params.userName)

        if(user?.userName==params?.userName)
        {
            //render "Login Successfully"
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
    static beforeInterceptor = {

    }
    static afterInterceptor = {

    }
}
