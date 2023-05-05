package linksharing.interceptors

import grails.interceptors.Matcher


class LoginInterceptor {

    LoginInterceptor(){

        matchAll().excludes(controller:'user',action:'index')
                  .excludes(controller:'user',action:'login')
                  .excludes(controller:'/',action:'/')

    }


    boolean before() {
        if(!session?.currentUser) {
            redirect(controller: 'user')
            return false
        }
        return true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
