package com.linksharing

class Simple
{
    String name
    String email
    Integer age
 //   def simpleService
    static constraints = {
    }
   void addData(String name,String email,String age)
    {
        simpleService.serviceMethod(name,email,age)
    }
}
