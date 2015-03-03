package com.linksharing

class UserController {

    def userlist()
    {

    }
    def block()
    {
        User user=User.get(params.id)

        if(params.active.equals('true'))
            user.active=false
        else
            user.active=true
        user.save(flush: true)
        redirect(controller: 'user',action: 'userlist')
    }
}
