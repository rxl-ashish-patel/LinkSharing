<%@ page import="linksharing.Seriousness; linksharing.DocumentResource; linksharing.Visibility" %>
<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: '', styles: ['index', 'dashboard'],javaScript:['markAsRead']]"/>


<body>

<div class="navBarBorder">
    <g:if test="${user!=null}">

        <g:render template="/navBarTemplate"
              model="[icons: ['shareLink', 'shareDocument', 'user', 'down']]"/>
         <g:render template="/shareDocumentTemplate" model="[topics: topic, user: user]"/>
         <g:render template="/shareLinkTemplate" model="[topics: topic, user: user]"/>

    </g:if>
    <g:else>
        <g:render template="/navBarTemplate"
                  model="[icons: []]"/>
    </g:else>
</div>

<g:if test="${flash.message}">
    <div class="message bg-secondary" role="status">${flash.message}</div>
</g:if>


<div class="container-fluid p-4">
    <div class="row">
        <div class="container col-sm-5 mb-2">


            <div class=" border mt-2 border bg-secondary rounded d-flex pt-1 justify-content-start ">
                 <h5 class=" text-white px-2">Topic :</h5>
                 <p class="">"${topic.name}"</p>

            </div>
            <div class="card p-2">
                <div class="container-fluid">
                    <div class="row d-flex align-items-center">
                        <div class="col-sm-3 ">
                            <img class="card-img-top userImage" src="${resource(dir: 'images', file: "${topic.createdBy.photo ?: 'profilePicture/user.svg'}")}"
                                 alt="Card image cap">
                        </div>



                        <div class="col-sm-8">
                            <div class="card-block d-flex justify-content-start">
                                <a href=""><h5 class="card-title px-1">${topic.name}</h5></a>
                                <p class="px-1">(${topic.getVisibility()})</p>
                            </div>


                            <div class="card-block d-flex">
                                <p class="col-sm-4">@${topic.createdBy.username}</p>
                                <p class="col-sm-5">subscriptions</p>
                                <p class="col-sm-3">topics</p>
                            </div>

                            <div class="card-block d-flex">
                                <g:if test="${user in topic.subscriptions*.user}">
                                    <g:if test="${topic.createdBy!=user}">
                                        <a href="${createLink(controller: 'subscription', action: 'delete', params: [topic: topic.id, user: user.id])}"
                                           class="card-link col-sm-4">UnSuscribe</a>
                                    </g:if>
                                    <g:else>
                                        <a class="col-sm-4"></a>
                                    </g:else>

                                </g:if>
                                <g:else>
                                    <a href="${createLink(controller: 'subscription', action: 'create', params: [topic: topic.id, user: user.id, seriousness: "VERY_SERIOUS"])}"
                                       class="card-link col-sm-4">Suscribe</a>
                                </g:else>
                                <a href="#" class="card-link col-sm-5">${topic.subscriptions.size()}</a>
                                <a href="#" class="card-link col-sm-3">${topic.resources.size()}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <table id="users" class="table table-striped display" style="width:100%">
                <thead>
                <tr class="bg-secondary">
                    <th>Users : ${topic.name}</th>
                </tr>
                </thead>
                <tbody >
            <g:each var="user" in="${topic.subscriptions*.user}">
                <tr><td>
                <g:render template="/user/Templates/userTemplate"  model="[user:user]"/>
                </td></tr>
            </g:each>
                </tbody>
            </table>

        </div>

        <div class="container col-sm-7">

            <div class="row">
                <div class="container">
                    <div class="headingDiv mb-2 d-flex justify-content-between">
                           <div class="d-flex pt-1">
                            <h5 class=" text-white px-2">Posts :</h5>
                            <p class="">"${topic.name}"</p>
                           </div>

                        <form class="d-flex ">
                            <input class="form-control me-1" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-success" type="submit">
                                <img src="${resource(dir: 'images', file: 'search.png')}"/>
                            </button>
                        </form>
                    </div>
                    <g:each var="resourc" in="${resources}">
                        <g:render template="/user/Templates/inboxTemplate" model="[resourc:resourc,user:user,topic:topic,isSuscribed:isSuscribed]"/>
                    </g:each>

                </div>

            </div>
        </div>
    </div>
</div>
<!-- Example split danger button -->

<g:javascript>
    $(document).ready(function (){
        $("#users").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 5,
            "searching": false
        })
    })

</g:javascript>
</body>

</html>