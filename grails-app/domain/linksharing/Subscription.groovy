package linksharing

class Subscription {
    Topic topic
    User user
    Seriousness seriousness
    static belongsTo = [user:User , topic: Topic]
    static constraints = {
        topic nullable:false
        user nullable:false
        seriousness enumType:'string'
    }
    static mapping={
        table "Subscriptions"
    }
}
