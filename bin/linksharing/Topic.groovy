package linksharing

class Topic {
    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static belongsTo =[createdBy:User]
    static hasMany = [subscriptions:Subscription, resources:Resource]
    static constraints = {
        name nullable:false, blank:false, unique:['createdBy']
        createdBy nullable:false
        visibility enumType:'string'
    }
    static mapping={
        table "Topics"
        autoTimestamp true
    }

}
