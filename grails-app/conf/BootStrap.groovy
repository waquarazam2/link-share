import com.linksharing.*

class BootStrap {

    def init = { servletContext ->
        List<User> users = createUser()
        List<Topic> topics = []
        Topic topic
        List<Resource> resource1=[]
        Resource resource
        List<LinkResource> link = []
        List <DocumentResource> document=[]

        users.eachWithIndex { user, index ->
            topics.addAll(createTopic(user, index))
        }
        topics.each {
            println it.name
        }

        User.list().each { User user ->

            topic = Topic.findByCreatedBy(user)
            (1..5).each {
                link.add(createLinkResource(topic.createdBy, topic, user.id + "" + it))
                document.add(createDocResource(topic.createdBy, topic, user.id + "" + it))
            }
        }

        User.list().each {User user->
            resource1=Resource.findAll('from Resource order by rand()',[max:3])
            println resource1.size()
            createReadingItem(user,resource1)
        }

    }
    def destroy = {
    }
    def createReadingItem(User user,List<Resource> resource1)
    {
        ReadingItem readingItem

        resource1.each {Resource resource->

            readingItem=new ReadingItem()
            readingItem.user=user
            readingItem.resource=resource
            readingItem.isRead=true
            readingItem.save(flush: true,failOnError: true)
        }
    }
    LinkResource createLinkResource(User user, Topic topic, String index) {
        LinkResource resource = new LinkResource()
        resource.topic = topic
        resource.createdBy = user
        resource.url = "http://www.google.com/mars${index}"
        resource.description = "Google mars${index}"

        resource.save(flush: true, failOnError: true)
        return  resource
    }

    DocumentResource createDocResource(User user, Topic topic, String index) {

        DocumentResource resource = new DocumentResource()
        resource.topic = topic
        resource.createdBy = user
        resource.filePath = "/home/user/Document/${index}.pdf"
        resource.description = "PDF Document${index}"

        resource.save(flush: true, failOnError: true)
        return resource
    }

    List<User> createUser() {
        List<User> users = []
        (1..5).each {
            User user = new User()
            user.firstName = "firstName${it}"
            user.lastName = "lastName${it}"
            user.userName = "mohdamir${it}"
            user.password = "abcdefgh${it}"
            user.email = "user${it}@gmail.com"
            user.admin = true
            user.active = true
            user.photo = [1, 2, 3, 4, 5]
            if (user.save())
                users.add(user)
            else {
                user.errors.allErrors.each {
                    println it
                }
            }
        }
        return users
    }

    List<Topic> createTopic(User user, int index) {
        List<Topic> topics = []
        Topic topic = new Topic()
        topic.name = "Grails$index"
        topic.createdBy = user
        topic.visibility = Visibility.PUBLIC

        user.addToTopics(topic)
        if (user.save(flush: true)) {
            topics.add(topic)
        }
        subscribeTopic(user, topic)
        return topics
    }

    void subscribeTopic(User user, Topic topic) {

        Subscription subscription = new Subscription()
        subscription.topic = topic
        subscription.seriousness = Seriousness.VERY_SERIOUS
        subscription.user = user
        subscription.save()
    }

}
