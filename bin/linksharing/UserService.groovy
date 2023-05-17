package linksharing

import grails.gorm.services.Service
import grails.validation.ValidationException
import org.apache.commons.mail.DefaultAuthenticator
import org.apache.commons.mail.EmailException
import org.apache.commons.mail.HtmlEmail
import static org.springframework.http.HttpStatus.*
import org.springframework.web.context.request.RequestContextHolder
import org.springframework.web.context.request.ServletRequestAttributes

class UserService{
    def getUser(Long id){
        return User.get(id)
    }
    def userList(String filter){
        def list = User.list()
        if (filter == 'active')
            return list.findAll { it.active == true }
        else {
            if (filter == 'inactive') {
                return list.findAll { it.active == false }
            } else
                return list
        }
    }
    def validation(Map params){
        print params
        def user=User.findByEmailAndPassword(params.emailOrUsername,params.password)?:User.findByUsernameAndPassword(params.emailOrUsername,params.password)
        return user
    }
    def sendPasswordResetMail(User user,Map params){
        user.resetToken = UUID.randomUUID().toString()
        user.save(flush: true)

        // send password reset email
        def email = new HtmlEmail()
        email.setHostName("smtp.gmail.com")
        email.setSmtpPort(587)
        email.setAuthenticator(new DefaultAuthenticator("${params.email}", "bpqspourqxdwjghk"))
        email.setSSLOnConnect(true)
        email.setFrom("admin@gmail.com")
        email.setSubject("Password Reset Request")
        email.addTo(user.email)
// assuming you have a generateToken() method in your User domain class
        def resetUrl = "http://192.168.0.120:${RequestContextHolder.currentRequestAttributes().request.serverPort}/user/showResetPasswordForm?token=${user.resetToken}"
        email.setHtmlMsg("Please click on the following link to reset your password: <a href='${resetUrl}'>${resetUrl}</a>")
        email.send()
    }

    def savePhoto(def multipartFile,def username){
        if(multipartFile.getOriginalFilename()!='' ) {
            def extension = multipartFile.getOriginalFilename().tokenize('.')[-1]
            def bytes = multipartFile.getBytes()
            def url = "grails-app/assets/images/profilePicture/${username}.${extension}"
            def newFile = new File("${url}")
            newFile.createNewFile()
            newFile.append(bytes)
            return "profilePicture/${username}.${extension}"
        }
        else
            return ""
    }
    def createUser(def params){
        params.photo=savePhoto(params.photo,params.username)
        def user=new User(params)
        user.save(flush:true)
        return user
    }
    def save(User user){

        return user.save(flush:true)
    }
    def userTopics(User user){
        return Topic.findAllByCreatedBy(user)
    }
    def userSubscriptions(User user){
        return Subscription.findAllByUser(user)
    }

    def resetPassword(def params){
        def user=userService.getUser(Integer.parseInt(params.userId))
        user.save(flush:true)
        return user
    }
    def updateUser(def params){
        def user = getUser(Integer.parseInt(params.userId))
        if(params?.photo!=null)
            params.photo=savePhoto(params.photo,user.username)
        if(params?.active!=null)
            user.active=Boolean.parseBoolean(params.active)
        else {
            bindData(user, params)
        }
        user.save(flush:true)
        return user
    }
}