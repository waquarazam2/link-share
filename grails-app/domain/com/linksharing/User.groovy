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
        email email: true,size:8..30,unique: true,blank: false
        userName nullable: false,unique: true
        password size: 6..20,blank: false
        firstName nullable:false
        lastName nullable:false
        photo maxSize: 1024*20
    }
    static hasMany = [
            subscriptions:Subscription,
            topics:Topic,
            resourcesRating:ResourceRating,
            readingItems:ReadingItem,
            resources:Resource
    ]
    static mapping = {
        topics cascade: "all-delete-orphan"
    }


    User(RegistrationCO registrationCO){
        this.firstName=registrationCO.fName
        this.lastName=registrationCO.lName
        this.userName=registrationCO.uName
        this.password=registrationCO.passwd
        this.email=registrationCO.email
        this.active=true
        this.photo=registrationCO.photo
    }

}
