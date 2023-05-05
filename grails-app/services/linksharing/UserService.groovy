package linksharing

import grails.gorm.services.Service

//@Service(User)
//interface UserService {
//
//    User get(Serializable id)
//
//    List<User> list(Map args)
//
//    Long count()
//
//    void delete(Serializable id)
//
//    User save(User user)
//
//}
class UserService{

    def validation(Map params){
        def user=User.findByEmail(params.email)?:User.findByUsername(params.email)
        if(user?:false && user.password==params.password){
            return user
        }
        else
            return user
    }
    def create(Map params){
        if(params.photo) {
            def multipartFile = params.photo
            def extension = multipartFile.getOriginalFilename().tokenize('.')[-1]
            def bytes = multipartFile.getBytes()
            url = "grails-app/assets/images/profilePicture/${params.username}.${extension}"
            def newFile = new File("${url}")
            newFile.createNewFile()
            newFile.append(bytes)
            params.photo = url
        }
        return new User(params)
    }
    def save(User user){
        return user.save(flush:true)
    }
}