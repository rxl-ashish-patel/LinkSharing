package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ReadingItemController {

    ReadingItemService readingItemService
    UserService userService

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
          def user=User.findByEmail(params.email)
          def topic=Topic.get(params.topic)
          def resources=topic.resources
          resources.each{

              readingItemService.create(user:user.id,resource:it.id,isRead:false)
          }
          if(user==session?.currentUser) {
              flash.params=[message :"subscribed successfully",code:'warning']
              redirect controller: 'user'
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
        println user
        println resource
        ReadingItem readingItem=ReadingItem.findByUserAndResource(user,resource)
        println readingItem
        readingItem.isRead=true
        try {
            readingItem.save(flush:true)

        } catch (ValidationException e) {
            respond readingItem.errors, view:'edit'
            return
        }
        render ''
        return
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'readingItem.label', default: 'ReadingItem'), readingItem.id])
//                redirect readingItem
//            }
//            '*'{ respond readingItem, [status: OK] }
//        }
//        redirect controller:'user'
    }

    def delete(Long id) {
//        if (id == null) {
//            notFound()
//            return
//        }
//
//        readingItemService.delete(id)
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'readingItem.label', default: 'ReadingItem'), id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
        def user=User.findByEmail(params.email)
        def topic=Topic.get(params.topic)
        topic.resources.each{
            ReadingItem.findByResourceAndUser(it,user).delete(flush: true)}
        redirect controller:'user'
    }
}

