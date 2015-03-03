package com.linksharing

abstract class Resource {
    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated
    static constraints = {
        description maxSize: 1024
        topic unique: 'description'
    }
    static hasMany = [
            readingItems:ReadingItem
    ]
    static belongsTo = [
            Topic
    ]
    static mapping = {
        tablePerHierarchy false
        description type:'text'
    }
    static fetchMode = [
    ]
}
