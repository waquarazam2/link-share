package com.linksharing

class DocumentResource {
    String filePath
    static constraints = {
        filePath size: 1..200,blank: false,nullable: false
    }
    static hasMany = [
            resources:Resource
    ]
}
