package linksharing


class User {
    String email
    String username
    String password
    String firstName
    String lastName
    String photo
    Boolean admin = false
    Boolean active = true
    static hasMany= [topics: Topic,subscribes:Subscription, resourceRatings:ResourceRating, readingItems:ReadingItem , resources:Resource]
    Date dateCreated
    Date lastUpdated

    static constraints = {
        email email:true,unique:true
        username blank:false,nullable:false,unique:true
        password blank:false,nullable:false,validator:{ password,obj ,error ->
            Integer smCount=0,lgCount=0,nCount=0,spCount=0
            password.each{ if(it in ('a'..'z'))
                                smCount++
                            else if(it in ('A'..'Z'))
                                 lgCount++
                            else if(it in ('0'..'9'))
                                  nCount++
                            else
                                  spCount++
            }

            if(!(smCount && lgCount && nCount && spCount )) {
                error.rejectValue('password', 'Password must contain [smallCase Letter,Uppercase Letter,special Character, Digit]')
                return
            }
            else{
                if( (smCount+lgCount+spCount+nCount)<8){
                    return error.rejectValue('password', 'Password must conatain at least 8 character')
                }
            }
        }
        firstName blank:false,nullable:false
        lastName blank:false, nullable:false
        photo blank:true,nullable:true
    }

    static mapping={
        table "Users"
        autoTimestamp true

    }
}
