package com.linksharing

import org.springframework.web.multipart.MultipartFile

class RegistrationController {

    RegistrationService registrationService
    def registration()
    {

    }
    def addUser(RegistrationCO registrationCO)
    {

        MultipartFile photo=registrationCO.photo
        String path=request.getRealPath('/')+'/profilePic'
        if(registrationService.registration(registrationCO,photo,path))
            render "${registrationCO.uName} User Added Successfully "+" <a href='/linksharing/login/login'>Login</a>"
        else
        {
            render "Some Error occure Please Try Again"
        }
        //render photo + " "+ password
    }
}
