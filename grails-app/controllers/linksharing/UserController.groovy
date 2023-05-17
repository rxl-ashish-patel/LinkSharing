package linksharing

import org.grails.datastore.mapping.validation.ValidationErrors
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*


class UserController {
    UserService userService
    ResourceService resourceService
    TopicService topicService
    SubscriptionService subscriptionService


//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        if (session?.currentUser) {
            def updatedUser=userService.getUser(session.currentUser.id)
            render view: 'dashboard', model: [user: updatedUser,
                                              topics: userService.userTopics(updatedUser),
                                              subscriptions: userService.userSubscriptions(updatedUser),
                                              subscriptionsByLatestPost: topicService.subscriptionsByLatestPost(updatedUser),
                                              trendingTopics: topicService.trendingTopics()]
        } else {
            render view: '/user/index', model: [recentShares: resourceService.recentShare(2), topPosts: resourceService.topPosts()]
        }

    }

    def login() {
        def user = userService.validation(params)
        if (user != null) {
            session.currentUser = user
            flash.params=['message':"login successfull",code:'success']
            redirect controller: 'user'
        } else {
            flash.params=['message':"login failure",code:'danger']
            redirect controller: 'user'
         }
    }

    def register() {

           def user= userService.createUser(params)
           if(user.hasErrors()){
               flash.params=['message':"registration unsuccessful",code:'danger']
               render view:'index',model: [user:user,errors:user.errors.allErrors]
               return
           }
          flash.params=['message':"registration successful",code:'success']
          redirect controller: 'user'

    }

    def forgotPassword() {

        [user: new User()]
    }
    def resetPassword() {
        print params
        def user = User.findByEmail(params.email)

        if (!user) {
            flash.params=[message :"Email not found",code:'warning']
            redirect(action: "forgotPassword")
            return
        }
        userService.sendPasswordResetMail(user,params)

        flash.params= [message :"Password reset email sent",code:'success']
        redirect(action: "forgotPassword")
    }

    def showResetPasswordForm() {
        def user = User.findByResetToken(params.token)
        print(params)
        if (!user) {
            flash.params=[message :"Invalid reset token",code:'warning']
            redirect(action: "forgotPassword")
            return
        }

        [user: user]
    }

    def sendInvite(){
        def user = User.findByEmail(params.email)

        if (!user) {
            flash.params=[message :"Email not found",code:'warning']
            redirect(controller: 'user')
            return
        }
        userService.sendInvite(user,params)

        flash.params= [message :"invite send successfully",code:'success']
        redirect(controller:'user')
    }
    def updatePassword(){
        print(params)
        if(params.password==params.confirmPassword) {
            def user=userService.getUser(Integer.parseInt(params.userId))
            user.password=params.password
            user.save(flush:true)
            if(user.hasErrors()){
                flash.params=['message':"password reset failure ",code:'danger']
                render view:"showResetPasswordForm",model: [user:user,errors:user.errors.allErrors]
                return
            }
            else{
                flash.params=['message':"password reset for ${user.email} ",code:'success']
                render view: 'index'
                return
            }
        }
    }


    def logout() {
        session.invalidate()
        flash.params=['message':"logout",code:'success']
        redirect controller: 'user', action: 'index'
    }

    def profileUpdate() {
        print(params)
        render view: 'profile', model: [user: userService.getUser(Integer.parseInt(params.userId))]
    }

    def showUserProfile(){
        def profileUser=userService.getUser(Integer.parseInt(params.userId))
        def topics,subscriptions
        println params
        if(profileUser.id==session?.currentUser?.id || session.currentUser.admin){
            topics=profileUser.topics
            subscriptions=profileUser.subscribes*.topic
        }
        else{
            topics=profileUser.topics.findAll{it.visibility==linksharing.Visibility.PUBLIC}
            subscriptions=profileUser.subscribes*.topic.findAll{it.visibility==linksharing.Visibility.PUBLIC}
        }
        println subscriptions
        render view: 'showUserProfilePage', model: [profileUser: profileUser, currentUser: userService.getUser(session.currentUser.id), topics: topics, subscriptions: subscriptions]
    }

    def userTableForAdmin() {
        println params
        if (session.currentUser.admin) {
            if(params.userTypes=="all") {
                def user=userService.getUser(session.currentUser.id)
                render view: 'admin', model: [user                     : user,
                                              users                    : userService.userList("all"),
                                              topics                   : userService.userTopics(user),
                                              subscriptions            : userService.userSubscriptions(user),
                                              subscriptionsByLatestPost: topicService.subscriptionsByLatestPost(user)
                ]
                return
            }
            else{
                if(params.userTypes=="active"){
                    render view: 'Templates/_userDataTableTemplate', model: [
                            users: userService.userList('active')]
                }

                else{
                    render view: 'Templates/_userDataTableTemplate', model: [
                            users: userService.userList('inactive')]
                    return

                }
            }
        }
    }


    def update() {
        print(params)

            def updatedUser=userService.updateUser(params)
            if(updatedUser.hasErrors()){
                flash.params=['message':"${params.view} update failure ",code:'danger']
                render view:"${params.view}",model: [user:user,errors:updatedUser.errors.allErrors]
                return
            }
            if(params.view == 'profile') {
                render view: 'profile', model: [user: userService.get(Integer.parseInt(params.userId))]
                return
            }
            else{
                if(params.view=='admin'){
                def user=userService.getUser(session.currentUser.id)
                render view: 'admin', model: [user                     : user,
                                              users                    : userService.userList("all"),
                                              topics                   : userService.userTopics(user),
                                              subscriptions            : userService.userSubscriptions(user),
                                              subscriptionsByLatestPost: topicService.subscriptionsByLatestPost(user)
                ]
                return
                    }
            }




    }
}
