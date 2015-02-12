package com.linksharing

class Resource {
    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date dateUpdated
    static constraints = {
    }
    static hasMany = [
            readingItems:ReadingItem
    ]
    static belongsTo = [topics:Topic]
}
