package com.linksharing

class LinkResource {
    String url
    static constraints = {
        url size: 1..200,url: true
    }
    static hasMany = [
            resources:Resource
    ]
}
