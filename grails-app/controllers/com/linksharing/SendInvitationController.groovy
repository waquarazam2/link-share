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
        Topic topic1=Topic.findByCreatedByAndName(User.get(session["id"]),topic)
        String url="http://localhost:8080/linksharing/topic/view/"+topic1.id
        mailService.sendMail {
            to email
            subject topic +" invitation"
            html "Hi.."+"<br>"+url
        }
        render "Invitation Has Been Send"
    }
}
