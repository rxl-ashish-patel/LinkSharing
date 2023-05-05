package linksharing.interceptors

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class LoginInterCeptorInterceptorSpec extends Specification implements InterceptorUnitTest<LoginInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test loginInterCeptor interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"loginInterCeptor")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
