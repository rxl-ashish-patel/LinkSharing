package linksharing


class User {
    String email
    String username
    String password
    String firstName
    String lastName
    Byte[] photo
    Boolean admin
    Boolean active
    static hasMany= [topics: Topic,subscribes:Subscription, resourceRatings:ResourceRating, readingItems:ReadingItem , resources:Resource]
    Date dateCreated
    Date lastUpdated

    static constraints = {
        email blank:false ,nullable:false, email:true,unique:true
        username blank:false,nullable:false,unique:true
        password blank:false,nullable:false
        firstName blank:false,nullable:false
        lastName blank:false, nullable:false
        photo blank:true,nullable:true
        admin defaultValue: false
        active defaultValue: false
    }
    static mapping={
        table "Users"
        autoTimestamp true
    }
}
