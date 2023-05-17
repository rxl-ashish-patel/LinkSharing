<%--
  Created by IntelliJ IDEA.
  User: ashishpatel
  Date: 14/05/23
  Time: 1:16 am
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
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
<g:form controller="user" action="resetPassword">
    <g:textField name="email" value="${user?.email}" />
    <g:submitButton name="submit" value="Reset Password" />
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