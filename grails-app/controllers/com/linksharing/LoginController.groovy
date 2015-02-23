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
            redirect(uri:"/home" )
        }
        else
        {
            render "User Name or Password Incorrect"
        }

    }
    static beforeInterceptor = {

    }
    static afterInterceptor = {

    }
}
