package linksharing

class ReadingItem {

    Boolean isRead
    static belongsTo=[user:User,resource :Resource]
    static constraints = {
        resource nullable:false
        user nullable: false
        isRead defaultValue: false
    }
    static mapping={
        table "ReadingItems"
    }
}
