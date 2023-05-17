<%@ page import="linksharing.Visibility" %>
<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: '', styles: ['index', 'dashboard'],javascript:['userProfileUpdateHandler','editTopicName']]"/>


<body>

<div class="navBarBorder">
    <g:render template="/navBarTemplate" model="[icons: ['createTopic', 'sendInvite', 'shareLink', 'shareDocument', 'user','down']]"/>
</div>
<div class="alert">

</div>

<div class="container-fluid p-4">
    <div class="row">
        <div class="container col-sm-5 mb-2">
            <g:render template="Templates/userTemplate" model="[user:user]"/>
            <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                <h5 class="col-sm-6 text-white">Subcriptions</h5>
                <p class="col-sm-3"></p>
                <a class="col-sm-3"> View All</a>
            </div>
            <g:each var="topic" in="${user.topics}">
                <g:render template="Templates/subscriptionsTemplate" model="[topic:topic,user:user]"/>
            </g:each>


        </div>

        <div class="container col-sm-7">
            <div class="logIn mt-3">

                <div class="headingDiv ">
                    <h5>Profile</h5>
                </div>
                <div class="container-fluid mt-3">
                    <g:uploadForm controller="user" onsubmit="userProfileUpdateHandler(${user.id})" >
                        <div class="container mb-3 mt-3 fieldDiv">
                            <div class="row m-1 mt-3">
                                <div class="col-sm-5">
                                    <label for="firstname">FirstName *</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control input" id="firstname"  name="firstName">
                                </div>
                            </div>


                            <div class="row m-1 mt-3">
                                <div class="col-sm-5">
                                    <label for="email">LastName *</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control input" id="lastname"  name="lastName">
                                </div>
                            </div>

                            <div class="row m-1 mt-3">
                                <div class="col-sm-5">
                                    <label for="email">Username *</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="username" class="form-control input" id="username"  name="username">
                                </div>
                            </div>

                            <div class="row m-1 mt-3">
                                <div class="col-sm-5">
                                    <label for="photo">Photo *</label>
                                </div>
                                <div class="custom-file col-sm-5">
                                    <input type="file"  name="photo"  class="custom-file-input form-control" id="photo">
                                </div>
                            </div>

                            <div class="row m-1 mt-3">
                                <div class="col-sm-9">
                                    <g:hiddenField name="myField" value="myValue" id="photoBytes"/>
                                </div>
                                <div class="col-sm-3">
                                    <button class=" btn btn-primary"  type="submit">Update</button>
%{--                                    <g:actionSubmit     value="Update" action="update">--}%
%{--                                    </g:actionSubmit>--}%
                                </div>
                            </div>
                        </div>

                    </g:uploadForm>
                </div>
            </div>
            <div class="logIn">
                <div class="headingDiv">
                    <h5>Change Password</h5>
                </div>
                <div class="container-fluid mt-3">
                    <g:form controller="user" onsubmit="userPasswordUpdateHandler(${user.id})">
                        <div class="container mb-3 mt-3 fieldDiv">


                            <div class="row m-1 mt-3">
                                <div class="col-sm-5">
                                    <label for="pwd">Password *</label>
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
                                    <input type="password" class="form-control input" id="confirmpassword"  name="confirmPassword">
                                </div>
                            </div>

                            <div class="row m-1 mt-3">
                                <div class="col-sm-3">

                                </div>
                                <div class="col-sm-6">

                                </div>
                                <div class="col-sm-3">
                                    <button class=" btn btn-primary"  type="submit">Update</button>

                                </div>
                            </div>
                        </div>

                    </g:form>
                </div>
            </div>

        </div>
    </div>

</div>
<!-- Example split danger button -->

<script>

</script>
</body>

</html>