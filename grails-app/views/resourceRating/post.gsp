<%@ page import="linksharing.Seriousness; linksharing.DocumentResource; linksharing.Visibility" %>
<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: 'Post', styles: ['index', 'dashboard', 'starRating'], javascript:['starRating']]"/>


<body>

<div class="navBarBorder">
    <g:if test="${user!=null}">

        <g:render template="/navBarTemplate"
                  model="[icons: ['shareLink', 'shareDocument', 'user', 'down']]"/>
        <g:render template="/documentResource/shareDocumentTemplate" model="[topics: subscriptions*.topic, user: user]"/>
        <g:render template="/linkResource/shareLinkTemplate" model="[topics: subscriptions*.topic, user: user]"/>

    </g:if>
    <g:else>
        <g:render template="/navBarTemplate"
                  model="[icons: []]"/>
    </g:else>
</div>
<div id="message">
<g:if test="${flash?.params?.message}" >
<div id="message" class="alert alert-${flash?.params.code}  bg-${flash?.params.code} alert-dismissible fade show" role="alert">
    ${flash.params.message}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</g:if>

</div>
<div class="container-fluid p-4">
    <div class="row">
        <div class="container col-sm-5 mb-2">
            <div class="card p-2">
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

                            <div class="card-block d-flex starRating align-items-center">
                                <div>
                                <g:render template="starRatingTemplate" model="[user:user,resourc:resourc]"/>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="row d-flex align-items-center">
                        <div class="card-block d-flex justify-content-start">
                            <p>${resourc.description}</p>
                        </div>
                    </div>
                    <div class="card-block d-flex justify-content-sm-between">
                        <div>
                            <img src="${resource(dir: 'images', file: 'facebook.svg')}"/>
                            <img src="${resource(dir: 'images', file: 'twitter.svg')}"/>
                            <img src="${resource(dir: 'images', file: 'google.svg')}"/>
                        </div>
                        <g:if test="${user==resourc.createdBy || user?.admin}">
                            <a href="">Delete</a>
                            <a href="">Edit</a>
                        </g:if>
                        <g:if test="${(resourc instanceof linksharing.DocumentResource)}">
                            <a href="${resourc.filepath}" class="text-sm-center"
                               download>Download</a>
                        </g:if>
                        <g:else>
                            <a href="${resourc.url}" class="text-sm-center"
                               target="_blank">View full site</a>
                        </g:else>
                        <a href="${createLink(controller:'resourceRating',action:'showPost',params:[resource:resourc.id])}" target="_blank"  class="text-sm-center">View post</a>
                    </div>
                </div>
            </div>

        </div>

        <div class="container col-sm-7">
            <g:if test="${user!=null}">
                <table id="trendingTopics" class="table table-striped display" style="width:100%">
                                    <thead>
                                    <tr class="bg-secondary">
                                        <th>Trending Topics:</th>
                                    </tr>
                                    </thead>
                    <tbody>
                    <g:each var="topic" in="${trendingTopics}">
                        <tr><td>   <g:render template="/user/Templates/trendingTopicTemplate" model="[topic: topic, user: user]"/>
                        </td></tr>
                    </g:each>
                    </tbody>
                </table>
            </g:if>
            <g:else>
                <g:render template="/user/Templates/loginTemplate"/>
                <g:render template="/user/Templates/registerTemplate"/>
            </g:else>
        </div>
    </div>
</div>

<g:javascript>
    $(document).ready(function() {
        // $('${}').prevAll().addBack().addClass('active');
        const stars = $('.star');
        stars.click(function() {
            let ids=this.id.split('-')
            let userId=ids[1]
            let resourceId=ids[0]
            let rating=$(this).data('value')
            console.log(userId,resourceId)
            stars.removeClass('active');
            $(this).prevAll().addBack().addClass('active');
            $.ajax({
                type: 'POST',
                data: {userId: userId, resourceId: resourceId, score: rating},
                url: '${createLink(controller: 'resourceRating', action: 'createUpdate')}',
                success:function(response){
                    tempAlert("rated successfully",1000)
                },
                error:function(error){

                }

            })
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