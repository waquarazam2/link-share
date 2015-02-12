package com.linksharing

class DocumentResource {
    String filePath
    static constraints = {
        filePath size: 1..200
    }
    static hasMany = [
            resources:Resource
    ]
}
