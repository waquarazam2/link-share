package com.linksharing

class Resource {
    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date dateUpdated
    static constraints = {
        description maxSize: 1024
        topic unique: 'description'
    }
    static hasMany = [
            readingItems:ReadingItem
    ]
    static belongsTo = [topics:Topic]
}
