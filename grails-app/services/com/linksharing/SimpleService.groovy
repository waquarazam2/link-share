package com.linksharing

import grails.transaction.NotTransactional
import grails.transaction.Transactional

@Transactional
class SimpleService
{
    static transactional = true

    @NotTransactional
    def serviceMethod(String name,String email,String age)
    {
        Simple simple=new Simple()
        simple.name=name
        simple.email=email
        simple.age=Integer.parseInt(age)
        simple.save(flush:true)

        new RuntimeException("Runtime Exception")
    }
}
