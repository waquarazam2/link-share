package com.linksharing

class User
{
    String userName
    String password
    String firstName
    String lastName
    String email
    byte[] photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated

    static constraints = {
        email email: true,size:8..30
        userName nullable: false,unique: true
        password size: 6..20,blank: false
        firstName nullable:false
        lastName nullable: false
        photo maxSize: 1024*20
    }
}
