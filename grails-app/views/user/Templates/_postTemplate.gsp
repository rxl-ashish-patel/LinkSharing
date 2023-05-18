<div class="card p-2">
    <div class="container-fluid">
        <div class="row  align-items-center">
            <div class="col-sm-3 ">
                <img class="card-img-top userImage "
                     src="${resource(dir: 'images', file: "${post.createdBy.photo ?: 'user.svg'}")}"
                     alt="Card image cap">
            </div>

            <div class="col-sm-9 ">
                <div class="card-block d-flex justify-content-between">
                    <h5 class="card-title"><strong>${post.createdBy.firstName}</strong></h5>

                    <p>@${post.createdBy.username} &nbsp; &nbsp; <g:formatDate
                            date="${post.dateCreated}" format="dd-MMM-yyyy"/></p>
                    <a href=""><strong>${post.topic.name}</strong></a>
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
                    <a href="${createLink(controller:'resourceRating', action:'showPost',params:[resource:post.id])}">View Post</a>
                </div>
            </div>
        </div>
    </div>
</div>