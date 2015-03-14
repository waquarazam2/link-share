package com.linksharing

class DashboardController {

    def dashBoardService
    def dashboard()
    {
       /* long userID=session["id"]
        int totalSubscription=dashBoardService.getTotalSubscription(userID)
        render(view: '/dashboard/dashboard',model:[totalSubscription:totalSubscription])*/
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
            redirect(action:'dashboard',id:'0')
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
            redirect(action: 'dashboard',id:'0')
        }
        else {
            render "<h2>Sorry,Please Try Again </h2>"
        }
    }
    def seeMoreSubscription()
    {
        int offset=Integer.parseInt(params.offset)
        def dashBoardSubscription=dashBoardService.getDashBoradSubscriptionInfo(session["id"],offset)
        int totalSubscription=dashBoardService.getTotalSubscription(session["id"])
        render(template: '/dashboard/dashboardSubscription',model:[dashBoardSubscriptionList:dashBoardSubscription,totalSubscription:totalSubscription])
    }
    def seeMoreInboxItem()
    {
        int offset=Integer.parseInt(params.offset)
        def inboxDTOList=dashBoardService.getInboxItem(session["id"],offset)
        int inboxSize=dashBoardService.getTotalInboxItem()
        render(template: '/dashboard/inbox',model:[inboxDTOList:inboxDTOList,inboxSize:inboxSize])
    }
}
