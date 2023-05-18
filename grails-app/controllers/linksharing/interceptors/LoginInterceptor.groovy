package linksharing.interceptors

import grails.interceptors.Matcher


class LoginInterceptor {

    LoginInterceptor(){

        matchAll().excludes(controller:'resourceRating',action:'showPost')
                .excludes(controller: 'user', action: 'index')
                .excludes(controller:'topic',action:'searchData')
                .excludes(controller:'topic',action:'filterTopPosts')
                .excludes(controller: 'user', action: 'forgotPassword')
                .excludes(controller: 'readingItems', action: 'create')
                .excludes(controller:'subscriptions',action:'privateTopicSubscription')
                .excludes(controller:'user',action:'showResetPasswordForm')
                .excludes(controller: 'user', action: 'resetPassword')
                .excludes(controller: 'user', action: 'updatePassword')
                .excludes(controller: 'user', action: 'login')
                .excludes(controller: 'user', action: 'register')
                .excludes(controller: '/', action: '/')
                .excludes(controller: 'console', action: 'index')

    }


    boolean before() {
        if(!session?.currentUser) {
            flash.params=[message:"login first",code:'warning']
            redirect(controller: 'user')
            return false
        }
        return true
    }

    boolean after() {
        true }

    void afterView() {
        // no-op
    }
}
