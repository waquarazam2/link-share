package com.linksharing

class ReadingItem
{
    Resource resource
    User user
    boolean isRead
    static constraints = {
    }
    static belongsTo=[
            Resource
    ]
}
