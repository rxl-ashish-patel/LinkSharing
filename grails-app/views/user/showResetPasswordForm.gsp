<%--
  Created by IntelliJ IDEA.
  User: ashishpatel
  Date: 14/05/23
  Time: 1:22 am
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<h1>Reset Password</h1>
<g:if test="${flash?.params}">
    <div id="message" class="alert alert-${flash.params.code}  bg-${flash.params.code} alert-dismissible fade show"
         role="alert">
        ${flash.params.message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</g:if>
<div>
    <div id="validationError">
        <g:hasErrors bean="${this.user}">
            <ul class="errors alert alert-danger " role="alert">
                <g:eachError bean="${this.user}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
    </div>
<g:form controller="user" action="updatePassword">
    <input type="hidden" name="token" value="${user.resetToken}" />
    <g:hiddenField name="userId" value="${user.id}"/>
    <div class="form-group">
        <label for="password">New Password:</label>
        <input type="password" name="password" class="form-control" required />
    </div>
    <div class="form-group">
        <label for="confirmPassword">Confirm New Password:</label>
        <input type="password" name="confirmPassword" class="form-control" required />
    </div>
    <button type="submit" class="btn btn-primary">Reset Password</button>
</g:form>

    <g:javascript>
        $(document).ready(function () {

            setTimeout(function () {
                $("#message").hide();
                $("#validationError").hide();
            }, 2000);
            setTimeout(function () {
                $("#validationError").hide();
            }, 5000);
        })
    </g:javascript>
</body>
</html>