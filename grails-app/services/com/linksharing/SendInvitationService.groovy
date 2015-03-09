package com.linksharing

import grails.transaction.Transactional

@Transactional
class SendInvitationService {
    def mailService
    def sendInvitationMail(String email,String topicName,long userid) {
        Topic topic=Topic.findByCreatedByAndName(User.get(userid),topicName)
        String url="http://localhost:8080/linksharing/topic/view/"+topic.id
        mailService.sendMail {
            to email
            subject topicName +" invitation"
            html "Hi.."+"<br>"+url+"<br> Please Visit The Subscription Link"
        }
    }
}
