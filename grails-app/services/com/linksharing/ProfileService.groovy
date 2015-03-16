package com.linksharing

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class ProfileService {

    def getProfileTopic(long userid,int offset=0)
    {
        User user=User.get(userid)
        List<Topic> topic=Topic.findAllByCreatedBy(user)
        def subscriptions=Subscription.createCriteria().list([offset:offset,sort:'id',order:'desc',max:5]){
            eq('user',user)
            inList('topic',topic)

        }
        int totalSubscription
        int totalPost
        boolean owner
        List <UserProfileTopicListDTO>userProfileTopicListDTO=new ArrayList<UserProfileTopicListDTO>()
        subscriptions.each{subscription->
            totalSubscription=Subscription.countByTopic(subscription.topic)
            totalPost=Resource.countByTopic(subscription.topic)
            owner=true

            userProfileTopicListDTO.add(new UserProfileTopicListDTO(seriousness:subscription.seriousness , topic:subscription.topic,totalSubscription: totalSubscription,totalPost: totalPost,owner: owner ))
        }
        return userProfileTopicListDTO
    }
    int getTotalTopic(long userID)
    {
        return Topic.countByCreatedBy(User.get(userID))
    }
    def updateProfile(long userID,UpdateProfileCO updateProfileCO,MultipartFile inFile,String path)
    {
        User user=User.get(userID)
        user.firstName=updateProfileCO.fName
        user.lastName=updateProfileCO.lName
        user.userName=updateProfileCO.uName

        if(inFile.getOriginalFilename())
        {
            inFile.transferTo(new File(path+'/profilePic/'+inFile.getOriginalFilename()))
            user.photo='/linksharing/profilePic/'+inFile.getOriginalFilename()
            user.save(flush: true)
        }
        if(user.save(flush: true))
            return true
        else
            return false
    }
    def updatePassword(long userID,String password)
    {
        User user=User.get(userID)
        user.password=password
        if(user.save(flush: true))
            return true
        else
            return false

    }
}
