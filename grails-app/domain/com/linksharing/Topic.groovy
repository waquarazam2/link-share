package com.linksharing

class Topic {
    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static constraints= {
        createdBy unique: 'name'
    }
    static hasMany = [
            subscriptions:Subscription,
            resources:Resource
    ]


}
