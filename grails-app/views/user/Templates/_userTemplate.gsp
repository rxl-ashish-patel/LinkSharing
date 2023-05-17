<div class="card p-1 bg-success bg-opacity-50 my-sm-2">
    <div class="container-fluid">
        <div class="row d-flex align-items-center">
            <div class="col-sm-3 ">
                <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: user.id])}"
                   target="_blank">
                    <img class="card-img-top userImageSmall"
                         src="${resource(dir: 'images', file: "${user.photo ?: 'profilePicture/user.svg'}")}"
                         alt="Card image cap">
                </a>
            </div>

            <div class="col-sm-1"></div>

            <div class="col-sm-8">
                <div class="card-block">
                    <h5>${user.firstName + '  ' + user.lastName}</h5>
                </div>

                <div class="card-block">
                    <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: user.id])}"
                       target="_blank">
                        <p>@${user.username}</p>
                    </a>
                </div>

                <div class="card-block d-flex">
                    <p class="col-sm-6">subscriptions</p>

                    <p class="col-sm-2">posts</p>
                </div>

                <div class="card-block d-flex">
                    <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: user.id])}"
                       target="_blank"
                       class="card-link col-sm-6">${user.subscribes.size()}</a>
                    <a href="${createLink(controller: 'user', action: 'showUserProfile', params: [userId: user.id])}"
                       target="_blank"
                       class="card-link col-sm-2">${user.resources.size()}</a>
                </div>
            </div>
        </div>
    </div>
</div>