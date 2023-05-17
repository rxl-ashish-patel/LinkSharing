package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ReadingItemController {

    ReadingItemService readingItemService

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
              save(new ReadingItem(user:user.id,resource:it.id,isRead:false))
          }
          redirect controller:'user'
//        respond new ReadingItem(params)
    }
    def addPostToSubscriberReadingItems(){
        def topic=Topic.get(params.topic)
        def users=topic.subscriptions*.user.each{

            save(new ReadingItem(user:it.id,resource:params.resource,isRead:false))
        }
        redirect controller:'user'
    }

    def save(ReadingItem readingItem) {
        if (readingItem == null) {
            notFound()
            return
        }

        try {
            readingItem.save(flush:true)
        } catch (ValidationException e) {
            respond readingItem.errors, view:'create'
            return
        }

//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'readingItem.label', default: 'ReadingItem'), readingItem.id])
//                redirect readingItem
//            }
//            '*' { respond readingItem, [status: CREATED] }
//        }
    }

    def edit(Long id) {
        respond readingItemService.get(id)
    }

    def update(){
        def user=User.get(params.user)
        def resource=Resource.get(params.resourc)
        println user
        println resource
        ReadingItem readingItem=ReadingItem.findByUserAndResource(user,resource)
//        println reading
        readingItem.isRead=true
        try {
            readingItemService.save(readingItem)
        } catch (ValidationException e) {
            respond readingItem.errors, view:'edit'
            return
        }

//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'readingItem.label', default: 'ReadingItem'), readingItem.id])
//                redirect readingItem
//            }
//            '*'{ respond readingItem, [status: OK] }
//        }
        redirect controller:'user'
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

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'readingItem.label', default: 'ReadingItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
