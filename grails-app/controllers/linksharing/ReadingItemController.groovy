package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ReadingItemController {

    ReadingItemService readingItemService
    UserService userService
    TopicService topicService

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond readingItemService.list(params), model:[readingItemCount: readingItemService.count()]
    }

    def show(Long id) {
        respond readingItemService.get(id)
    }
     def create() {
//        render params
          def user=userService.getUser(Integer.parseInt(params.user))
          def topic=Topic.get(Integer.parseInt(params.topic))
          def resources=topic.resources
          resources.each{

              readingItemService.create(user:user,resource:it,isRead:false)
          }
          if(user.id==session?.currentUser.id) {
              flash.params=[message :"subscribed successfully",code:'success']
              render view: '/user/Templates/_inboxDataTable' ,model:[user:userService.getUser(Integer.parseInt(params.user))]
              return
              }
          else{
              render "subscribed Successfully"
              return
          }

//        respond new ReadingItem(params)
    }
    def addPostToSubscriberReadingItems(){
        def topic=Topic.get(params.topic)
        def users=topic.subscriptions*.user.each{
            readingItemService.create(user:it.id,resource:params.resource,isRead:false)
        }
        flash.params=[message:"linkedResource added successfully",code:'success']
        redirect controller:'user'
    }



    def edit(Long id) {
        respond readingItemService.get(id)
    }

    def update(){
        def user=userService.getUser(Integer.parseInt(params.userId))
        def resource=Resource.get(params.resourceId)
        ReadingItem readingItem=ReadingItem.findByUserAndResource(user,resource)
        println readingItem
        readingItem.isRead=true
        try {
            readingItem.save(flush:true)
            render view: '/user/Templates/_inboxDataTable' ,model:[user: user]
            return

        } catch (ValidationException e) {
            respond readingItem.errors, view:'edit'
            return
        }
        render ''
        return
    }

    def delete(Long id) {
        def user=User.get(params.user)
        def topic=Topic.get(params.topic)
        topic.resources.each{
            ReadingItem.findByResourceAndUser(it,user).delete(flush: true)}
        render view: '/user/Templates/_inboxDataTable' ,model:[user:user]
    }
}

