package com.linksharing

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONArray

class HomeController
{
    def homeService
    def home()
    {
        if(!session["id"])
            redirect(controller: 'login', action: 'login')
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
    def recentNextPage()
    {
        int offset=Integer.parseInt(params.offset)
        def resources=homeService.getRecentPost(offset)
        String totalRecentPost=homeService.getTotalRecentPost()
        render(template: 'home_post',model: [resources: resources,totalRecentPost:totalRecentPost])

    }
    def topNextPage()
    {
        int offset=Integer.parseInt(params.offset)
        def resources=homeService.getTopPost(offset)
        def totalTopPost=homeService.getTotalTopPost()
        render(template: '/home/topPost', model: [resources:resources,totalTopPost:totalTopPost])

    }
    def autoSuggestion()
    {
        String query=params.query
        List<String> name=Topic.withCriteria {
            ilike("name","%${query}%")
        }.name

        render(name as JSON)
    }

}
