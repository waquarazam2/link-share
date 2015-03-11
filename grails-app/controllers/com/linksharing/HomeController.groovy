package com.linksharing

class HomeController
{
    def homeService
    def home()
    {
        if(!session["id"])
            redirect(controller: 'login', action: 'login')
        def resources=homeService.getRecentPost()
        def topPost=homeService.getTopPost()
       // println resources
      //  redirect(url:'/home',model:[resources:resources])
        render view: '/home/home'  ,model:[resources:resources,topPost:topPost]
    }
    def openHomePage()
    {
        redirect(action: 'home')
    }
    static beforeInterceptor = {
        println "before Intercept"
    }
    static afterInterceptor ={
        println "after intercept"
    }

}
