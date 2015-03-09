package com.linksharing

import grails.transaction.Transactional

@Transactional
class UserService {

    def blockUser(long userid,String active) {

        User user=User.get(userid)
        if(active.equals('true'))
            user.active=false
        else
            user.active=true
        if(user.save(flush: true))
            return true
        return false
    }
    def getUserInfo()
    {
        def users=User.list([max:10,sort:'id',order:'desc'])

        List<UserDTO> userDTOList=new ArrayList<UserDTO>()
        users.each{user->
            userDTOList.add(new UserDTO(user: user))
        }

    }
}
