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
    def getUserInfo(int offset=0)
    {
        def users=User.list([offset: offset, max:5,sort:'id',order:'desc'])
        List<UserDTO> userDTOList=new ArrayList<UserDTO>()
        users.each{user->
            userDTOList.add(new UserDTO(user: user))
        }
        return userDTOList
    }
    def totalUser()
    {
        return User.count()
    }
    def searchUserByName(String searchQuery,int offset=0)
    {
        def users=User.withCriteria {
            or{
                 ilike('firstName',"%${searchQuery}%")
                 ilike('lastName',"%${searchQuery}%")
                 ilike('email',"%${searchQuery}%")
                firstResult(offset)
                maxResults(50)

            }

        }
        List<UserDTO> userDTOList=new ArrayList<UserDTO>()
        users.each{user->
            userDTOList.add(new UserDTO(user: user))
        }
        return userDTOList
    }
    def SearchUserByType(String type,int offset=0)
    {
        boolean active
        if(type.equals('Active'))
        {
            active=true
        }
        else if(type.equals('InActive'))
        {
            active=false
        }
        def users=User.findAllByActive(active,[offset: offset, max:20,sort:'id',order:'desc'])
        List<UserDTO> userDTOList=new ArrayList<UserDTO>()
        users.each{user->
            userDTOList.add(new UserDTO(user: user))
        }
        return userDTOList
    }
}
