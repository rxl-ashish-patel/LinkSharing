package linksharing

class ReadingItem {

    Boolean isRead=false
    static belongsTo=[user:User,resource :Resource]
    static constraints = {
        resource nullable:false
        user nullable: false

    }
    static mapping={
        table "ReadingItems"
    }
}
