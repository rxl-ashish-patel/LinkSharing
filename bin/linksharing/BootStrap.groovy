package linksharing


class BootStrap {

    def init = { servletContext ->
        User user1 = new User(email: "19cs1026@mitsgwl.ac.in" , username: "ashishpatel1481" , password: "As1481@@" , firstName: "ashish" , lastName: "patel" , photo: "" , admin: false , active: true)
        user1.save(flush:true, failOnError:true)

        User user2=new User(email: "ashish12@gmail.com" , username: "ashish12" , password: "As1481@@" , firstName: "ashish" , lastName: "patel" , photo: "" , admin: false , active: true)
        user2.save(flush:true, failOnError:true)

//        Topic topic1_1=new Topic(name:"intro to groovy",createdBy:user1, visibility:"PRIVATE")
//        topic1_1.save(flush:true, failOnError:true)
//
//        Topic topic1_2=new Topic(name:"Gorm",createdBy:user1,visibility:"PUBLIC")
//        topic1_2.save(flush:true, failOnError:true)
//
//        Subscription sub1_1_2=new Subscription(topic:topic1_1,user:user2,seriousness:"SERIOUS")
//        sub1_1_2.save(flush:true, failOnError:true)
//
//        Subscription sub1_2_2=new Subscription(topic:topic1_2,user:user2,seriousness:"SERIOUS")
//        sub1_2_2.save(flush:true, failOnError:true)
//
//        Subscription sub1_2_1=new Subscription(topic:topic1_2,user:user1,seriousness:"SERIOUS")
//        sub1_2_1.save(flush:true, failOnError:true)
//
//        Subscription sub1_1_1=new Subscription(topic:topic1_1,user:user1,seriousness:"SERIOUS")
//        sub1_1_1.save(flush:true, failOnError:true)
//
//
//        topic1_1.addToSubscriptions(sub1_1_1)
//        topic1_1.addToSubscriptions(sub1_1_2)
//        topic1_2.addToSubscriptions(sub1_2_1)
//        topic1_2.addToSubscriptions(sub1_2_2)
//
//        user2.addToSubscribes(sub1_1_2)
//        user2.addToSubscribes(sub1_2_2)
//        user1.addToSubscribes(sub1_1_1)
//        user1.addToSubscribes(sub1_2_1)
    }

    def destroy = {
    }
}
