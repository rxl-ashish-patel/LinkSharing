package linksharing


import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UserController {

    UserService userService
    ResourceService resourceService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        if(session?.currentUser)
            render view:'dashboard', model:[user:session.currentUser]
        else{
            render view:'/user/index' ,model:[recentShares:resourceService.recentShare(2)]
        }


    }
    def login(){
        def user=userService.validation(params)
        if(user?:false){
            session.currentUser=user
            render view:'dashboard',model:[user:session.currentUser]
        }
        else {
            redirect controller: '/'
        }
    }
    def register() {
//       println(params)

        def user = userService.create(params)
//        print params
        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'/user/index'
        }
//        println user.firstName

//        redirect action:  'index'
        redirect('/')

    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
       // respond new

        User(params)
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
