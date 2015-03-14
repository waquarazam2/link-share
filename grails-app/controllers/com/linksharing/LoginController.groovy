package com.linksharing

class LoginController
{

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
    static beforeInterceptor = {
        User user=User.findByUserName(params?.userName)
        if(user?.admin)
            session["isAdmin"]=true
4
    }
    static afterInterceptor = {

    }
}
