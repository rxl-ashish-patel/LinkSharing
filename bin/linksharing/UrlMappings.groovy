package linksharing

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/1"(action:'/index1')
        "/"(controller: 'user',action:'index' )
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
