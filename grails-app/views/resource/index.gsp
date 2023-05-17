<%@ page import="linksharing.DocumentResource;" %>
<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: '', styles: ['index', 'dashboard']]"/>


<body>

<div class="navBarBorder">
    <g:render template="/navBarTemplate"
              model="[icons: ['createTopic', 'sendInvite', 'shareLink', 'shareDocument', 'user', 'down']]"/>
    <g:render template="/documentResource/shareDocumentTemplate" model="[topics: subscriptions*.topic, user: user]"/>
    <g:render template="/linkResource/shareLinkTemplate" model="[topics: subscriptions*.topic, user: user]"/>
</div>

<g:if test="${flash.message}">
    <div class="message bg-secondary" role="status">${flash.message}</div>
</g:if>


<div class="container-fluid p-4">
    <div class="row">
        <div class="container col-sm-5 mb-2">
            <div class="card p-2">
                <div class="container-fluid">
                    <div class="row d-flex align-items-center">
                        <div class="col-sm-4 ">
                            <img class="card-img-top userImage" src="${resource(dir: 'images', file: 'user.svg')}"
                                 alt="Card image cap">
                        </div>

                        <div class="col-sm-1"></div>

                        <div class="col-sm-7">
                            <div class="card-block">
                                <h5 class="card-title">${user.firstName + " " + user.lastName}</h5>
                            </div>

                            <div class="card-block">
                                <p>@${user.username}</p>
                            </div>

                            <div class="card-block d-flex">
                                <p class="col-sm-7">subscriptions</p>

                                <p class="col-sm-5">topics</p>
                            </div>

                            <div class="card-block d-flex">
                                <a href="#" class="card-link col-sm-7">${user.subscribes.size()}</a>
                                <a href="#" class="card-link col-sm-5">${user.topics.size()}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                <h5 class="col-sm-6 text-white">Subcriptions</h5>

                <p class="col-sm-3"></p>
                <a class="col-sm-3">View All</a>
            </div>
            <g:each var="topic"
                    in="${subscriptionsByLatestPost}">
                <div class="card p-1 bg-success bg-opacity-50">
                    <div class="container-fluid">
                        <div class="row d-flex align-items-center">
                            <div class="col-sm-2 ">
                                <img class="card-img-top userImageSmall"
                                     src="${resource(dir: 'images', file: 'user.svg')}" alt="Card image cap">
                            </div>

                            <div class="col-sm-1"></div>

                            <div class="col-sm-8">
                                <div class="card-block">
                                    <h4 class="card-title">${topic.name}</h4>
                                </div>

                                <div class="card-block d-flex">
                                    <p class="col-sm-4">@${topic.createdBy.username}</p>

                                    <p class="col-sm-6">subscriptions</p>

                                    <p class="col-sm-2">posts</p>
                                </div>

                                <div class="card-block d-flex">
                                    <a href="${createLink(controller: 'subscription', action: 'delete', params: [topic:topic.id,user:user.id])}" class="card-link col-sm-6">UnSuscribe</a>
                                    <a href="#"
                                       class="card-link col-sm-3">${topic.subscriptions.size()}</a>
                                    <a href="#" class="card-link col-sm-3">${topic.resources.size()}</a>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="d-inline-flex justify-content-end">
                                <g:select link="${createLink(controller: 'subscription',action: 'update')}" name="visibility" from="${Seriousness.values()}"/>
                            %{--                                <select class="selectpicker show-menu-arrow col-sm-3 me-2">--}%
                            %{--                                    <option >SERIOUS</option>--}%
                            %{--                                    <option><a href="#">CASUAL</a></option>--}%
                            %{--                                    <option><a href="#">VERY_SERIOUS</a></option>--}%
                            %{--                                </select>--}%
                                <g:if test="${user.admin || topic.createdBy == user}">
                                    <select class="selectpicker show-menu-arrow col-sm-3 me-2">
                                        <option>PRIVATE</option>
                                        <option>PUBLIC</option>
                                    </select>
                                    <a class=""><img src="${resource(dir: "images", file: "edit.svg")}"/></a>
                                    <a class=""
                                       href="${createLink(controller: 'topic', action: 'delete', id: topic.id)}"><img
                                            src="${resource(dir: "images", file: "delete.svg")}"/></a>
                                </g:if>
                                <a data-bs-toggle="modal" data-bs-target="#sendInvite"
                                   data-bs-whatever="sendInvite"><img
                                        src="${resource(dir: "images", file: "sendInvite.svg")}"/></a>
                            </div>

                        </div>
                    </div>
                </div>
            </g:each>
            <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                <h5 class="col-sm-6 text-white">Trending Topics</h5>

                <p class="col-sm-3"></p>
                <a class="col-sm-3">View All</a>
            </div>
            <g:each var="topic" in="${trendingTopics}">
                <div class="card p-1 bg-success bg-opacity-50">
                    <div class="container-fluid">
                        <div class="row d-flex align-items-center">
                            <div class="col-sm-2 ">
                                <img class="card-img-top userImageSmall"
                                     src="${resource(dir: 'images', file: 'user.svg')}" alt="Card image cap">
                            </div>

                            <div class="col-sm-1"></div>

                            <div class="col-sm-8">
                                <div class="card-block">
                                    <a><h4 class="card-title">${topic.name}</h4></a>
                                </div>

                                <div class="card-block d-flex">
                                    <p class="col-sm-4">@${topic.createdBy.username}</p>

                                    <p class="col-sm-6">subscriptions</p>

                                    <p class="col-sm-2">posts</p>
                                </div>

                                <div class="card-block d-flex">
                                    <g:if test="${user in topic.subscriptions*.user}">
                                        <a href="${createLink(controller: 'subscription', action: 'delete', params: [topic:topic.id,user:user.id])}" class="card-link col-sm-6">UnSuscribe</a>
                                    </g:if>
                                    <g:else>
                                        <a href="${createLink(controller: 'subscription', action: 'create', params: [topic:topic.id,user:user.id,seriousness:"VERY_SERIOUS"])}" class="card-link col-sm-6">Suscribe</a>
                                    </g:else>
                                    <a href="#"
                                       class="card-link col-sm-3">${topic.subscriptions.size()}</a>
                                    <a href="#" class="card-link col-sm-3">${topic.resources.size()}</a>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="d-inline-flex justify-content-end">
                                <g:if test="${user in topic.subscriptions*.user}">
                                    <select class="selectpicker show-menu-arrow col-sm-3 me-2">
                                        <option>SERIOUS</option>
                                        <option>CASUAL</option>
                                        <option>VERY_SERIOUS</option>
                                    </select>
                                </g:if>
                                <g:if test="${user.admin || topic.createdBy == user}">
                                    <select class="selectpicker show-menu-arrow col-sm-3 me-2">
                                        <option>PRIVATE</option>
                                        <option>PUBLIC</option>
                                    </select>
                                    <a class=""><img src="${resource(dir: "images", file: "edit.svg")}"/></a>
                                    <a class=""
                                       href="${createLink(controller: 'topic', action: 'delete', id: topic.id)}"><img
                                            src="${resource(dir: "images", file: "delete.svg")}"/></a>
                                    <a data-bs-toggle="modal" data-bs-target="#sendInvite"
                                       data-bs-whatever="sendInvite"><img
                                            src="${resource(dir: "images", file: "sendInvite.svg")}"/></a>
                                    <a data-bs-toggle="modal" data-bs-target="#sendInvite"
                                       data-bs-whatever="sendInvite"><img
                                            src="${resource(dir: "images", file: "sendInvite.svg")}"/></a>
                                </g:if>

                            </div>

                        </div>
                    </div>
                </div>
            </g:each>


        </div>

        <div class="container col-sm-7">

            <div class="row">
                <div class="container">
                    <div class="headingDiv mb-2 d-flex justify-content-between">
                        <h5>Inbox</h5>
                        <form class="d-flex ">
                            <input class="form-control me-1" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-success" type="submit">
                                <img src="${resource(dir: 'images',file: 'search.png')}"/>
                            </button>
                        </form>
                    </div>
                    <g:each var="item" in="${user.readingItems.findAll{it.isRead==false}}">
                        <div class="card p-2">
                            <div class="container-fluid">
                                <div class="row  align-items-center">
                                    <div class="col-sm-3 ">
                                        <img class="card-img-top userImage "
                                             src="${resource(dir: 'images', file: "profilePicture/${item.resource.createdBy.photo ?: 'user.svg'}")}"
                                             alt="Card image cap">
                                    </div>

                                    <div class="col-sm-9 ">
                                        <div class="card-block d-flex justify-content-between">
                                            <div class="d-flex">
                                                <h5 class="card-title px-sm-2"><strong>${item.resource.createdBy.firstName}</strong>
                                                </h5>

                                                <p class="px-sm-2">@${item.resource.createdBy.username}</p>
                                            </div>
                                            <a href="/topic/show?${item.resource.topic.id}"><strong>${item.resource.topic.name}</strong>
                                            </a>
                                        </div>

                                        <div class="card-block">
                                            <p>${item.resource.description.substring(0, Math.min(item.resource.description.length(), 15)) + "..."}</p>
                                        </div>

                                        <div class="card-block d-flex justify-content-sm-between">
                                            <div>
                                                <img src="${resource(dir: 'images', file: 'facebook.svg')}"/>
                                                <img src="${resource(dir: 'images', file: 'twitter.svg')}"/>
                                                <img src="${resource(dir: 'images', file: 'google.svg')}"/>
                                            </div>
                                            <g:if test="${(item.resource instanceof DocumentResource)}">
                                                <a href="${item.resource.filepath}" class="text-sm-center" download>Download</a>
                                            </g:if>
                                            <g:else>
                                                <a href="${item.resource.url}" class="text-sm-center" target="_blank">View full site</a>
                                            </g:else>
                                            <a href="${createLink(controller: 'readingItem',action: 'update',params:[id:item.id])}" class="text-sm-center">Mark as read</a>
                                            <a href="" class="text-sm-center">View post</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:each>

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