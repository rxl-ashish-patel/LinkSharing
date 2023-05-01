package linksharing

class Resource {
    String description
    Topic topic
    Date lastUpdated
    static belongsTo=[topic :Topic , creadtedBy:User]
    static constraints = {

    }
    static mapping={
        table "Resources"
    }
}
