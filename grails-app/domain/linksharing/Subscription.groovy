package linksharing

class Subscription {
    Topic topic
    User user
    Seriousness seriousness
    static constraints = {
        topic nullable:false
        user nullable:false
        seriousness enumType:'string'
    }
}
