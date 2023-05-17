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
                        <a href="${createLink(controller: 'user',action: 'forgotPassword')}">Forgot Password?</a>>
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