package com.linksharing

class RegistrationController {

    RegistrationService registrationService
    def registration()
    {

    }
    def addUser(RegistrationCO registrationCO)
    {

        if(registrationService.registration(registrationCO))
            render "${registrationCO.uName} User Added Successfully"
        else
        {
            render "Some Error occure Please Try Again"
        }
        //render photo + " "+ password
    }
}
