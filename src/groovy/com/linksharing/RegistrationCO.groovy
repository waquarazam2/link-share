package com.linksharing

import grails.validation.Validateable

/**
 * Created by amir on 25/2/15.
 */
@Validateable
class RegistrationCO
{
    String fName
    String lName
    String email
    String uName
    String passwd
    String confirmPassword
    byte[] photo
    static constraints={
        passwd validator: {val,registrationCO->
                return val.equals(registrationCO.confirmPassword)
        }
    }

}
