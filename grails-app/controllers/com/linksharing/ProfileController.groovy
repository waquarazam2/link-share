package com.linksharing

import org.springframework.web.multipart.MultipartFile


class ProfileController {
    ProfileService profileService
    def profile()
    {

    }
    def updateProfile(UpdateProfileCO updateProfileCO)
    {
        MultipartFile inFile=updateProfileCO.photo
       /* render inFile.getOriginalFilename()*/
        if(profileService.updateProfile(session["id"],updateProfileCO,inFile,request.getRealPath('/')))
        {
            redirect(controller: 'profile' ,action:'profile')
        }
        else
        {
            render 'This User Name is Exist please Try another UserName'
        }
    }
    def changePassword()
    {
        String password=params.password
        String confirmPassword=params.confirmPassword
        println params
        if(password.equals(confirmPassword))
        {
            if(profileService.updatePassword(session["id"],password))
            {
                render "Password Has Been Change Please " +" <a href='http://localhost:8080/linksharing/login/login?u="+User.get(session["id"]).userName+"'>"+'Login</a>'
            }
            else
            {
                render "Sorry, Please Try Again"
            }
        }
        else
        {
            render("Confirm Password does not match")
        }

    }
    def seeMoreProfileTopic()
    {
        int offset=Integer.parseInt(params.offset)
        def userProfileTopicListDTO=profileService.getProfileTopic(session["id"],offset)
        int totalSubscription=profileService.getTotalTopic(session["id"])
        render(template: '/profile/profileTopic',model:[userProfileTopicListDTOList:userProfileTopicListDTO,totalSubscription:totalSubscription])
    }
}
