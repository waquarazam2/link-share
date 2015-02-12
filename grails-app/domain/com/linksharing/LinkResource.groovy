package com.linksharing

class LinkResource {
    String url
    static constraints = {
        url size: 1..200
    }
}
