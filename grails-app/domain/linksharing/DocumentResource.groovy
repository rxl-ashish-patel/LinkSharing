package linksharing

class DocumentResource extends Resource{
    String filepath
    static constraints = {
        filepath nullable:false , blank:false
    }
}