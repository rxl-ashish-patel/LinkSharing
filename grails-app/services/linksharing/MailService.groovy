//package linksharing
//
//import grails.mail.MailService
//
//class MailService {
//
//    def sendForgotPasswordNotificationEmail(String recipientEmail, String resetToken) {
//        mail {
//            from "admin@gmail.com"
//            to recipientEmail
//            subject "Password Reset Request"
//            html "Please click on the following link to reset your password: <a href='${generateResetUrl(resetToken)}'>Reset Password</a>"
//        }
//    }
//
//    private String generateResetUrl(String resetToken) {
//        // Generate the URL for resetting the password
//        // You can modify the URL structure as per your requirements
//        return "http://192.168.0.120:${RequestContextHolder.currentRequestAttributes().request.serverPort}/user/showResetPasswordForm?token=${resetToken}"
//    }
//}
