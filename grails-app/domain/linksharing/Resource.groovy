package linksharing

abstract class Resource {
    String description
    Date lastUpdated
    Date dateCreated

    static belongsTo=[topic :Topic , createdBy:User]
    static constraints = {

    }
    static mapping={
        table "Resources"
        autoTimestamp(true)
    }
}
