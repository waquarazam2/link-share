package com.linksharing

class UserController {

    UserService userService
    def userlist()
    {

    }
    def block()
    {

        long userid=Long.parseLong(params.id)
        String active=params.active
        if(userService.blockUser(userid,active))
        {
            //   redirect(controller: 'user',action: 'userlist')
            render 'success'
        }
        else
            render "<h2>Sorry, Please Try Again</h2>"
    }
}
