package com.linksharing

class Subscription
{
    Topic topic
    User user
    Seriousness seriousness
    Date dateCreated
    static constraints = {
        user unique: 'topic',nullable: false
    }
    static belongsTo = [
            Topic
    ]

}
