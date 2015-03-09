package com.linksharing

class SendInvitationController {


    def sendInvitationService
    def sendinvitation()
    {

    }
    def send()
    {
        String email=params.email
        String topic=params.topic
        if(sendInvitationService.sendInvitationMail(email,topic,session["id"]))
            render "Invitation Has Been Send"
        else
        {
            render "<h2>Sorry due to some problem in service or internet connection</h2>"
        }
    }
}
