package com.linksharing

import grails.transaction.Transactional

@Transactional
class RegistrationService {

    boolean registration(RegistrationCO registrationCO)
    {
        User user=new User(registrationCO)
        if(user.save(flush: true))
        {
            return true
        }
        return false
    }
}
