package linksharing

class Topic {
    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static belongsTo =[author:User]
    static hasMany = [subscriptions:Subscription, resources:Resource]
    static constraints = {
        name nullable:false, blank:false, unique:['createdBy']
        createdBy nullable:false
        visibility enumType:'string'
    }
}
