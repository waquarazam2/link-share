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
    def moreUserList()
    {
        List <UserDTO> userDTOList=userService.getUserInfo(Integer.parseInt(params.offset))
        def totalUser=userService.totalUser()
        render(template: '/user/user',model: [userDTOList:userDTOList,totalUser:totalUser])
    }
    def searchUserByName()
    {
        String searchQuery=params.query
        println params
        List <UserDTO> userDTOList=userService.searchUserByName(searchQuery,Integer.parseInt(params.offset))
        render(template: '/user/searchUserByName',model: [userDTOList:userDTOList])
    }
    def searchUserByType()
    {
        String searchQuery=params.query
        println params
        if(searchQuery.equals('All User')) {
            List <UserDTO> userDTOList=userService.getUserInfo()
            def totalUser=userService.totalUser()
            render(template: '/user/user',model: [userDTOList:userDTOList,totalUser:totalUser])
        }
        else {
            List<UserDTO> userDTOList = userService.SearchUserByType(searchQuery, Integer.parseInt(params.offset))
            render(template: '/user/searchUserByName', model: [userDTOList: userDTOList])
        }
    }
}
