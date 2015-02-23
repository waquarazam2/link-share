package com.linksharing

class RegistrationController {


    def registration()
    {

    }
    def addUser()
    {
        String firstName= params.firstName
        String lastName=params.lastName
        String email=params.email
        String userName=params.userName
        String password=params.password
        String photo=params.photo

        User user=new User()
        user.firstName=firstName
        user.lastName=lastName
        user.email=email
        user.userName=userName
        user.password=password
        user.photo=photo.bytes
        user.save(validate: true)

        render "<h1 align=center> ${userName} Has Been Registered Successfully</h1>"
        //render photo + " "+ password
    }
}
