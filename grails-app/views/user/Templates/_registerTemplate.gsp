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