<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title:'', styles:['index']]"/>

<body>

<div class="navBarBorder">
    <g:render template="/navBarTemplate" model="[icons: []]"/>
</div>
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
%{--    <g:eachError var="error" in="${errors}">--}%
%{--        <div class="alert alert-danger">${error}</div>--}%
%{--    </g:eachError>--}%
</div>
    <div class="container-fluid p-4">

         <div class="row">
            <div class="container col-sm-7">
                <div class="headingDiv mb-2">
                   <h5>Recent Shares</h5>
                </div>
                <g:each var="recentShare" in="${recentShares}">
                <div class="card p-2">
                    <div class="container-fluid">
                        <div class="row  align-items-center">
                            <div class="col-sm-3 ">
                                <img class="card-img-top userImage " src="${resource(dir:'images',file:"profilePicture/${recentShare.createdBy.photo?:'user.svg'}")}" alt="Card image cap">
                            </div>

                            <div class="col-sm-9 ">
                                <div class="card-block d-flex justify-content-between">
                                    <h5 class="card-title"><strong>${recentShare.createdBy.firstName}</strong></h5>
                                    <p>@${recentShare.createdBy.username}</p>
                                    <a href="/topic/show?${recentShare.topic.id}"><strong>${recentShare.topic.name}</strong></a>
                                </div>
                                <div class="card-block">
                                    <p>${recentShare.description.substring(0, Math.min(recentShare.description.length(), 15)) + "..."}</p>
                                </div>
                                <div class="card-block d-flex justify-content-sm-between">
                                    <div>
                                    <img src="${resource(dir: 'images', file: 'facebook.svg')}"/>
                                    <img src="${resource(dir: 'images', file: 'twitter.svg')}"/>
                                    <img src="${resource(dir: 'images', file: 'google.svg')}"/>
                                    </div>
                                    <a href="${createLink(controller:'topic',action:'post',params:[resource:recentShare.id])}">View Post</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </g:each>
                <div class="headingDiv mt-2">
                    <h5>Top Posts</h5>
                </div>
                <g:each var="post" in="${topPosts.collect{it[1]}}">
                    <div class="card p-2">
                        <div class="container-fluid">
                            <div class="row  align-items-center">
                                <div class="col-sm-3 ">
                                    <img class="card-img-top userImage " src="${resource(dir:'images',file:"profilePicture/${post.createdBy.photo?:'user.svg'}")}" alt="Card image cap">
                                </div>

                                <div class="col-sm-9 ">
                                    <div class="card-block d-flex justify-content-between">
                                        <h5 class="card-title"><strong>${post.createdBy.firstName}</strong></h5>
                                        <p>@${post.createdBy.username} &nbsp; &nbsp; <g:formatDate date="${post.dateCreated}" format="dd-MMM-yyyy" /></p>
                                        <a href="/topic/show?${post.topic.id}"><strong>${post.topic.name}</strong></a>
                                    </div>
                                    <div class="card-block">
                                        <p>${post.description.substring(0, Math.min(post.description.length(), 15)) + "..."}</p>
                                    </div>
                                    <div class="card-block d-flex justify-content-sm-between">
                                        <div>
                                            <img src="${resource(dir: 'images', file: 'facebook.svg')}"/>
                                            <img src="${resource(dir: 'images', file: 'twitter.svg')}"/>
                                            <img src="${resource(dir: 'images', file: 'google.svg')}"/>
                                        </div>
                                        <a href="${createLink(controller:'topic',action:'post',params:[resource:post.id])}">View Post</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:each>

             </div>

          <div class="container col-sm-5">
             <div class="logIn">
                   <div class="headingDiv">
                      <h5>Login</h5>
                   </div>
                   <div class="container-fluid mt-3">
                       <g:form controller="user" >
                            <div class="container mb-3 mt-3 fieldDiv">
                                <div class="row m-1 mt-3">
                                    <div class="col-sm-5">
                                        <label for="emailOrUsername">Email/Username*</label>
                                    </div>
                                    <div class="col-sm-7">
                                         <input type="text" class="form-control input" id="emailOrUsername"  name="emailOrUsername">
                                    </div>
                                </div>

                                <div class="row m-1 mt-3">
                                    <div class="col-sm-5">
                                        <label for="pwd">Password *</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="password" class="form-control input" id="pwd"  name="password">
                                    </div>
                                </div>

                                <div class="row m-1 mt-3">
                                    <div class="col-sm-3">
%{--                                        <a href="${createLink(controller: 'user',action: 'forgotPassword')}">Forgot Password?</a>>--}%
                                    </div>
                                    <div class="col-sm-6">

                                    </div>
                                    <div class="col-sm-3">
                                        <g:actionSubmit class="btn btn-primary" value="Submit" action="login">
                                            Submit
                                        </g:actionSubmit>

                                    </div>
                                </div>
                            </div>

                        </g:form>
                    </div>
                </div>
                <div class="logIn mt-3">

                    <div class="headingDiv ">
                        <h5>Register</h5>
                    </div>
                    <div class="container-fluid mt-3">
                        <g:uploadForm controller="user" action="register" method="post">

                            <div class="container mb-3 mt-3 fieldDiv">
                                <div class="row m-1 mt-3">
                                    <div class="col-sm-5">
                                        <label for="firstname">FirstName *</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="text"  class="form-control input" id="firstname" value="${user?.firstName}" name="firstName">
                                    </div>
                                </div>


                                <div class="row m-1 mt-3">
                                    <div class="col-sm-5">
                                        <label for="email">LastName *</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control input" id="lastname" value="${user?.lastName}" name="lastName">
                                    </div>
                                </div>

                                <div class="row m-1 mt-3">
                                    <div class="col-sm-5">
                                        <label for="email">Email *</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="email" class="form-control input" id="email" value="${user?.email}" name="email">
                                    </div>
                                </div>

                                <div class="row m-1 mt-3">
                                    <div class="col-sm-5">
                                        <label for="email">Username *</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="username" class="form-control input" id="username" value="${user?.username}"  name="username">
                                    </div>
                                </div>

                                <div class="row m-1 mt-3">
                                    <div class="col-sm-5">
                                        <label for="email">Password *</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="password" class="form-control input" id="password"  name="password">
                                    </div>
                                </div>

                                <div class="row m-1 mt-3">
                                    <div class="col-sm-5">
                                        <label for="pwd">Confirm Password *</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="password" class="form-control input" id="confirmPassword"  name="confirmPassword">
                                    </div>
                                </div>

                                <div class="row m-1 mt-3">
                                    <div class="col-sm-5">
                                        <label for="photo">Photo *</label>
                                    </div>
                                    <div class="custom-file col-sm-5">
                                        <input type="file"  name="photo"   class="custom-file-input form-control" id="customFile">

                                    </div>
                                </div>

                                <div class="row m-1 mt-3">
                                    <div class="col-sm-3">
                                        <g:actionSubmit   class="btn btn-primary"   value="submit" action="register">
                                                 Register
                                        </g:actionSubmit>
                                    </div>
                                </div>
                            </div>

                        </g:uploadForm>
                    </div>
                </div>


            </div>
         </div>
    </div>
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