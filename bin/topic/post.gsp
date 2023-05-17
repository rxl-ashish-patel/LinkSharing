<%@ page import="linksharing.Seriousness; linksharing.DocumentResource; linksharing.Visibility" %>
<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: '', styles: ['index', 'dashboard','starRating'],javascript:['starRating']]"/>


<body>

<div class="navBarBorder">
    <g:if test="${user!=null}">

        <g:render template="/navBarTemplate"
                  model="[icons: ['shareLink', 'shareDocument', 'user', 'down']]"/>
        <g:render template="/shareDocumentTemplate" model="[topics: subscriptions*.topic, user: user]"/>
        <g:render template="/shareLinkTemplate" model="[topics: subscriptions*.topic, user: user]"/>

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
            <div class="container p-2">
                <div class="container-fluid">
                    <div class="row d-flex align-items-center">
                        <div class="col-sm-3 ">
                            <img class="card-img-top userImage" src="${resource(dir: 'images', file: "${resourc.createdBy.photo ?: 'profilePicture/user.svg'}")}"
                                 alt="Card image cap">
                        </div>

                        <div class="col-sm-8">
                            <div class="card-block d-flex justify-content-start">
                                <h5 class="card-title px-1">${resourc.createdBy.firstName}</h5>
                                <a href=""><p class="px-1">(${resourc.topic.name})</p></a>
                            </div>


                            <div class="card-block d-flex">
                                <p class="col-sm-4">@${resourc.createdBy.username}</p>
                                <p class="col-sm-5"><g:formatDate date="${resourc.dateCreated}" format="dd-MMM-yyyy" /></p>

                            </div>

                            <div class="card-block d-flex">
                                <div class="rating">
                                    <span  class="star" data-value="1">&#9733;</span>
                                    <span  class="star" data-value="2">&#9733;</span>
                                    <span  class="star" data-value="3">&#9733;</span>
                                    <span  class="star" data-value="4">&#9733;</span>
                                    <span  class="star" data-value="5">&#9733;</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
%{--            <div class=" border mt-2 border bg-secondary rounded d-flex pt-1 justify-content-start ">--}%
%{--                <h5 class=" text-white px-2">Users :</h5>--}%
%{--                <p class="">"${resourc.name}"</p>--}%

%{--            </div>--}%
%{--            <g:each var="subscriber" in="${topic.subscriptions*.user}">--}%
%{--                <div class="card p-1 bg-success bg-opacity-50">--}%
%{--                    <div class="container-fluid">--}%
%{--                        <div class="row d-flex align-items-center">--}%
%{--                            <div class="col-sm-3 ">--}%
%{--                                <img class="card-img-top userImageSmall"--}%
%{--                                     src="${resource(dir: 'images', file: "${subscriber.photo?:'profilePicture/user.svg'}")}" alt="Card image cap">--}%
%{--                            </div>--}%

%{--                            <div class="col-sm-1"></div>--}%

%{--                            <div class="col-sm-8">--}%
%{--                                <div class="card-block">--}%
%{--                                    <h5>${subscriber.firstName+'  '+subscriber.lastName}</h5>--}%
%{--                                </div>--}%
%{--                                <div class="card-block">--}%
%{--                                    <p>@${subscriber.username}</p>--}%
%{--                                </div>--}%

%{--                                <div class="card-block d-flex">--}%
%{--                                    <p class="col-sm-6">subscriptions</p>--}%
%{--                                    <p class="col-sm-2">posts</p>--}%
%{--                                </div>--}%

%{--                                <div class="card-block d-flex">--}%
%{--                                    <a href="#"--}%
%{--                                       class="card-link col-sm-6">${subscriber.subscribes.size()}</a>--}%
%{--                                    <a href="#" class="card-link col-sm-2">${subscriber.resources.size()}</a>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </g:each>--}%

        </div>

        <div class="container col-sm-7">

%{--            <div class="row">--}%
%{--                <div class="container">--}%
%{--                    <div class="headingDiv mb-2 d-flex justify-content-between">--}%
%{--                        <div class="d-flex pt-1">--}%
%{--                            <h5 class=" text-white px-2">Posts :</h5>--}%
%{--                            <p class="">"${topic.name}"</p>--}%
%{--                        </div>--}%

%{--                        <form class="d-flex ">--}%
%{--                            <input class="form-control me-1" type="search" placeholder="Search" aria-label="Search">--}%
%{--                            <button class="btn btn-success" type="submit">--}%
%{--                                <img src="${resource(dir: 'images', file: 'search.png')}"/>--}%
%{--                            </button>--}%
%{--                        </form>--}%
%{--                    </div>--}%
%{--                    <g:each var="resourc" in="${topic.resources}">--}%
%{--                        <div class="card p-2">--}%
%{--                            <div class="container-fluid">--}%
%{--                                <div class="row  align-items-center">--}%
%{--                                    <div class="col-sm-3 ">--}%
%{--                                        <img class="card-img-top userImage "--}%
%{--                                             src="${resource(dir: 'images', file: "${resourc.createdBy.photo ?: 'profilePicture/user.svg'}")}"--}%
%{--                                             alt="Card image cap">--}%
%{--                                    </div>--}%

%{--                                    <div class="col-sm-9 ">--}%
%{--                                        <div class="card-block d-flex justify-content-between">--}%
%{--                                            <div class="d-flex">--}%
%{--                                                <h5 class="card-title px-sm-2"><strong>${resourc.createdBy.firstName}</strong>--}%
%{--                                                </h5>--}%

%{--                                                <p class="px-sm-2">@${resourc.createdBy.username}</p>--}%
%{--                                            </div>--}%
%{--                                            <a href="/topic/show?${resourc.topic.id}"><strong>${resourc.topic.name}</strong>--}%
%{--                                            </a>--}%
%{--                                        </div>--}%

%{--                                        <div class="card-block">--}%
%{--                                            <p>${resourc.description.substring(0, Math.min(resourc.description.length(), 15)) + "..."}</p>--}%
%{--                                        </div>--}%

%{--                                        <div class="card-block d-flex justify-content-sm-between">--}%
%{--                                            <div>--}%
%{--                                                <img src="${resource(dir: 'images', file: 'facebook.svg')}"/>--}%
%{--                                                <img src="${resource(dir: 'images', file: 'twitter.svg')}"/>--}%
%{--                                                <img src="${resource(dir: 'images', file: 'google.svg')}"/>--}%
%{--                                            </div>--}%
%{--                                            <g:if test="${(resourc instanceof DocumentResource)}">--}%
%{--                                                <a href="${resourc.filepath}" class="text-sm-center"--}%
%{--                                                   download>Download</a>--}%
%{--                                            </g:if>--}%
%{--                                            <g:else>--}%
%{--                                                <a href="${resourc.url}" class="text-sm-center"--}%
%{--                                                   target="_blank">View full site</a>--}%
%{--                                            </g:else>--}%
%{--                                            <g:if test="${(user in topic.subscriptions*.user) && (resourc  in user.readingItems.findAll{it.isRead==false}*.resource)}">--}%
%{--                                                <a href="${createLink(controller: 'readingItem', action: 'update', params: [id: resourc.id])}"--}%
%{--                                                   class="text-sm-center">Mark as read</a>--}%
%{--                                            </g:if>--}%
%{--                                            <a href="${createLink(controller:'topic',action:'post',params:[resource:resourc.id])}" class="text-sm-center">View post</a>--}%
%{--                                        </div>--}%
%{--                                    </div>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </g:each>--}%

%{--                </div>--}%

%{--            </div>--}%
        </div>
    </div>
</div>

<g:javascript>
    $(document).ready(function() {
        const stars = $('.star');
        stars.click(function() {
            let ids=this.id.split('-')
            let userId=ids[0]
            let resourceId=ids[1]
            console.log(userId,resourceId)
            stars.removeClass('active');
            $(this).prevAll().addBack().addClass('active');
            // $.ajax(
            //     type:'Post'
            //     data:{ userId:userId,resourceId:resourecId},
            //
            // )
        });

        // Add mouseover event listener to each star
        stars.mouseenter(function() {
            // Remove hover class from all stars
            stars.removeClass('hover');

            // Add hover class to all stars up to the hovered star
            $(this).prevAll().addBack().addClass('hover');
            //console.log("mouse over")
        });

        // Add mouseout event listener to each star
        $('.rating').mouseleave(function() {
            // Remove hover class from all stars
            stars.removeClass('hover');

            // Add active class to all stars up to the last clicked star
            $('.active').prevAll().addBack().addClass('active');
           // console.log("mouse out")
        });
    });

</g:javascript>
</body>

</html>