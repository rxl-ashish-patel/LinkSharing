package linksharing


class BootStrap {

    def init = { servletContext ->
//        User user1 = new User(email: "19cs1026@mitsgwl.ac.in" , username: "ashishpatel1481" , password: "As1481@@" , firstName: "ashish" , lastName: "patel" , photo: "" , admin: false , active: true)
//        user1.save(flush:true, failOnError:true)
//
//        User user2=new User(email: "ashish12@gmail.com" , username: "ashish12" , password: "As1481@@" , firstName: "ashish" , lastName: "patel" , photo: "" , admin: false , active: true)
//        user2.save(flush:true, failOnError:true)

//        new User(
//                email : 'admin@example.com',
//                username : 'admin',
//                password : 'As1481@@',
//                firstName : 'Admin',
//                lastName : 'Admin',
//                admin : true,
//                active : true
//        ).save(flush: true, failOnError: true)
//        new User(
//                email : 'amit@example.com',
//                username : 'amit',
//                password : 'As1481@@',
//                firstName : 'amit',
//                lastName : 'amit',
//                admin : false,
//                active : true
//        ).save(flush: true, failOnError: true)
//        new User(
//                email : 'ashish@example.com',
//                username : 'ashish',
//                password : 'As1481@@',
//                firstName : 'ashish',
//                lastName : 'ashish',
//                admin : false,
//                active : true
//        ).save(flush: true, failOnError: true)
//
////// Populate topic
//        new Topic(
//                name: "Grails Domains",
//                createdBy: User.findByUsername('admin'),
//                visibility: Visibility.PUBLIC
//        ).save(flush: true, failOnError: true)
//
//        new Topic(
//                name: "GORM",
//                createdBy: User.findByUsername('amit'),
//                visibility: Visibility.PUBLIC
//        ).save(flush: true, failOnError: true)
//
//        new Topic(
//                name: "Website guide for new users",
//                createdBy: User.findByUsername('admin'),
//                visibility: Visibility.PUBLIC
//        ).save(flush: true,failOnError: true)
//
////// Populate link resource
//        new LinkResource(
//                description: "Grails framework website",
//                createdBy: User.findByUsername('ashish'),
//                topic: Topic.findByName("Grails Domains"),
//                url: 'https://grails.org/'
//        ).save(flush: true, failOnError: true)
//
//
//        new LinkResource(
//                description: "Grails framework website 2",
//                createdBy: User.findByUsername('ashish'),
//                topic: Topic.findByName("Grails Domains"),
//                url: 'https://grails.org/'
//        ).save(flush: true, failOnError: true)
//
//        new LinkResource(
//                description: "Grails framework website 3",
//                createdBy: User.findByUsername('ashish'),
//                topic: Topic.findByName("Grails Domains"),
//                url: 'https://grails.org/'
//        ).save(flush: true, failOnError: true)
//
//        new LinkResource(
//                description: "Grails framework website 4",
//                createdBy: User.findByUsername('ashish'),
//                topic: Topic.findByName("Grails Domains"),
//                url: 'https://grails.org/'
//        ).save(flush: true, failOnError: true)
//
//        new LinkResource(
//                description: "Grails framework website 5",
//                createdBy: User.findByUsername('ashish'),
//                topic: Topic.findByName("Grails Domains"),
//                url: 'https://grails.org/'
//        ).save(flush: true, failOnError: true)
//
//        new LinkResource(
//                description: "Grails framework website 6",
//                createdBy: User.findByUsername('ashish'),
//                topic: Topic.findByName("GORM"),
//                url: 'https://grails.org/'
//        ).save(flush: true, failOnError: true)
//
//        new LinkResource(
//                description: "GORM",
//                createdBy: User.findByUsername('amit'),
//                topic: Topic.findByName("GORM"),
//                url: 'https://grails.org/'
//        ).save(flush: true, failOnError: true)
//
//// TODO: populate document resource
////
////// populate resource rating
//        new ResourceRating(
//                resource: LinkResource.findByUrl('https://grails.org/'),
//                user: User.findByUsername('ashish'),
//                score: 5
//        ).save(flush: true, failOnError: true)
//        new ResourceRating(
//                resource: LinkResource.findByUrl('https://grails.org/'),
//                user: User.findByUsername('admin'),
//                score: 4
//        ).save(flush: true, failOnError: true)
////        new ResourceRating(
////                resource: LinkResource.findByDescription("Grails framework website 7"),
////                user: User.findByUsername('admin'),
////                score: 4
////        ).save(flush: true, failOnError: true)
//        new ResourceRating(
//                resource: LinkResource.findByDescription("GORM"),
//                user: User.findByUsername('ashish'),
//                score: 5
//        ).save(flush: true, failOnError: true)
////        new ResourceRating(
////                resource: LinkResource.findByDescription("Grails framework website 7"),
////                user: User.findByUsername('ashish'),
////                score: 5
////        ).save(flush: true, failOnError: true)
////        new ResourceRating(
////                resource: LinkResource.findByDescription("GORM"),
////                user: User.findByUsername('admin'),
////                score: 3
////        ).save(flush: true, failOnError: true)
//
////// populate reading item -- todo: remove??\
//// new ReadingItem(
//// resource: LinkResource.findByUrl('https://grails.org/'),
//// user: User.findByUsername('admin'),
//// isRead: true
//// ).save(flush: true, failOnError: true)
////
////// populate subscription
//        new Subscription(
//                topic: Topic.findByName("Grails Domains"),
//                user: User.findByUsername('ashish'),
//                seriousness: Seriousness.CASUAL
//        ).save(flush: true, failOnError: true)
//        new Subscription(
//                topic: Topic.findByName("Grails Domains"),
//                user: User.findByUsername('admin'),
//                seriousness: Seriousness.VERY_SERIOUS
//        ).save(flush: true, failOnError: true)
//        new Subscription(
//                topic: Topic.findByName("GORM"),
//                user: User.findByUsername('ashish'),
//                seriousness: Seriousness.CASUAL
//        ).save(flush: true, failOnError: true)
//        new Subscription(
//                topic: Topic.findByName("GORM"),
//                user: User.findByUsername('admin'),
//                seriousness: Seriousness.CASUAL
//        ).save(flush: true, failOnError: true)
////        Topic topic1_1=new Topic(name:"intro to groovy",createdBy:user1, visibility:"PRIVATE")
////        topic1_1.save(flush:true, failOnError:true)
////
////        Topic topic1_2=new Topic(name:"Gorm",createdBy:user1,visibility:"PUBLIC")
////        topic1_2.save(flush:true, failOnError:true)
////
////        Subscription sub1_1_2=new Subscription(topic:topic1_1,user:user2,seriousness:"SERIOUS")
////        sub1_1_2.save(flush:true, failOnError:true)
////
////        Subscription sub1_2_2=new Subscription(topic:topic1_2,user:user2,seriousness:"SERIOUS")
////        sub1_2_2.save(flush:true, failOnError:true)
////
////        Subscription sub1_2_1=new Subscription(topic:topic1_2,user:user1,seriousness:"SERIOUS")
////        sub1_2_1.save(flush:true, failOnError:true)
////
////        Subscription sub1_1_1=new Subscription(topic:topic1_1,user:user1,seriousness:"SERIOUS")
////        sub1_1_1.save(flush:true, failOnError:true)
////
////
////        topic1_1.addToSubscriptions(sub1_1_1)
////        topic1_1.addToSubscriptions(sub1_1_2)
////        topic1_2.addToSubscriptions(sub1_2_1)
////        topic1_2.addToSubscriptions(sub1_2_2)
////
////        user2.addToSubscribes(sub1_1_2)
////        user2.addToSubscribes(sub1_2_2)
////        user1.addToSubscribes(sub1_1_1)
////        user1.addToSubscribes(sub1_2_1)
    }

    def destroy = {
    }
}
