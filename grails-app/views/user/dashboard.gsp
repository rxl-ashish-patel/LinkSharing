<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: '', styles: ['index', 'dashboard']]"/>


<body>

<div class="navBarBorder">
    <g:render template="/navBarTemplate" model="[icons: ['createTopic', 'sendInvite', 'shareLink', 'shareDocument', 'user','down']]"/>
    <g:render template="/sendInviteTemplate" model="[topics:[]]" />
    <g:render template="/createTopicTemplate" model="[visibility:['public','Private']]" />
</div>

<div class="container-fluid p-4">
    <div class="row">
        <div class="container col-sm-5 mb-2">
            <div class="card p-2">
                <div class="container-fluid">
                    <div class="row d-flex align-items-center">
                        <div class="col-sm-4 ">
                            <img class="card-img-top userImage" src="${resource(dir:'images',file:'user.svg')}" alt="Card image cap">
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-7">
                            <div class="card-block">
                                <h5 class="card-title">User Name</h5>
                            </div>
                            <div class="card-block">
                                <p>@Name</p>
                            </div>
                            <div class="card-block d-flex">
                                <p class="col-sm-7"> subscriptions</p>
                                <p class="col-sm-5">topics</p>
                            </div>
                            <div class="card-block d-flex">
                                <a href="#" class="card-link col-sm-7">${user.subscribes.size()}</a>
                                <a href="#" class="card-link col-sm-5">no</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                <h5 class="col-sm-6 text-white">Subcriptions</h5>
                <p class="col-sm-3"></p>
                <a class="col-sm-3"> View All</a>
            </div>
            <div class="card p-1 bg-success bg-opacity-50">
                <div class="container-fluid">
                    <div class="row d-flex align-items-center">
                        <div class="col-sm-2 ">
                            <img class="card-img-top userImageSmall" src="${resource(dir:'images',file:'user.svg')}" alt="Card image cap">
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-8">
                            <div class="card-block">
                                <h4 class="card-title">User Name</h4>
                            </div>
                            <div class="card-block d-flex">
                                <p class="col-sm-4">@Name</p>
                                <p class="col-sm-6"> subscriptions</p>
                                <p class="col-sm-2">topics</p>
                            </div>
                            <div class="card-block d-flex">
                                <a href="#" class="card-link col-sm-6">UnSuscribe</a>
                                <a href="#" class="card-link col-sm-3">no</a>
                                <a href="#" class="card-link col-sm-3">no</a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="d-inline-flex justify-content-end">

                            <select class="selectpicker show-menu-arrow col-sm-3 me-2">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Relish</option>
                            </select>
                            <a class=""><img src="${resource(dir: "images", file: "sendInvite.svg")}"/></a>
                        </div>



                    </div>
                </div>
            </div>


        </div>

        <div class="container col-sm-7">



        </div>
    </div>

</div>
<!-- Example split danger button -->

<script>

</script>
</body>

</html>