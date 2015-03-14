package com.linksharing

import org.springframework.web.multipart.MultipartFile

class User
{
    String userName
    String password
    String firstName
    String lastName
    String email
    String photo
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

    }
    static transients = ['name']
    String getName()
    {
        return firstName+ " "+lastName
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


    User(RegistrationCO registrationCO,String filePath){
        this.firstName=registrationCO.fName
        this.lastName=registrationCO.lName
        this.userName=registrationCO.uName
        this.password=registrationCO.passwd
        this.email=registrationCO.email
        this.active=true
        this.photo=filePath
    }

}
