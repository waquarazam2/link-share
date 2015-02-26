package com.linksharing

class SendInvitationController {

    def mailService
    def sendinvitation()
    {

    }
    def send()
    {
        String email=params.email
        String topic=params.topic
        mailService.sendMail {
            to email
            subject topic
            body "Hi.."
        }
        render "Invitation Has Been Send"
    }
}
