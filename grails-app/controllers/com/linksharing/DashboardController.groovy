package com.linksharing

class DashboardController {

    def dashBoardService
    def dashboard()
    {


        /*def dashBoardUserInfo=dashBoardService.getDashBoardUserInfo(session["id"])
        render(view: '/dashboard/dashboard',model: [dashBoardUserInfo:dashBoardUserInfo])*/
    }
    def markasread()
    {
        long readingid=Long.parseLong(params.id)
        if(dashBoardService.markAsRead(readingid))
        {
        //    redirect(controller: 'topic' ,action:'view' ,id:params.topic)
                render 'success'
        }
        else
        {
            render "faild"
        }
    }
    def deleteTopic()
    {

        if(dashBoardService.deleteTopic(Long.parseLong(params.id)))
        {
            redirect(action:'dashboard')
        }
        else
        {
            render "Sorry Please Try Again"
        }
    }
    def editTopic()
    {
        long topicID=Long.parseLong(params.TopicID)
        String topicName=params.TopicName
        if(dashBoardService.edit(topicID,topicName))
        {
            redirect(action: 'dashboard')
        }
        else {
            render "<h2>Sorry,Please Try Again </h2>"
        }
    }
}
