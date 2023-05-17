<div class="card p-2">
    <div class="container-fluid">
        <div class="row  align-items-center">
            <div class="col-sm-3 ">
                <img onclick="markAsRead(${resourc},${user})" class="card-img-top userImage "
                     src="${resource(dir: 'images', file: "${resourc.createdBy.photo ?: 'user.svg'}")}"
                     alt="Card image cap">
            </div>

            <div class="col-sm-9 ">
                <div class="card-block d-flex justify-content-between">
                    <div class="d-flex">
                        <h5 class="card-title px-sm-2"><strong>${resourc.createdBy.firstName}</strong>
                        </h5>

                        <p class="px-sm-2">@${resourc.createdBy.username}</p>
                    </div>
                    <a href="/topic/show?${resourc.topic.id}"><strong>${resourc.topic.name}</strong>
                    </a>
                </div>

                <div class="card-block">
                    <p>${resourc.description.substring(0, Math.min(resourc.description.length(), 15)) + "..."}</p>
                </div>

                <div class="card-block d-flex justify-content-sm-between">
                    <div>
                        <img src="${resource(dir: 'images', file: 'facebook.svg')}"/>
                        <img src="${resource(dir: 'images', file: 'twitter.svg')}"/>
                        <img src="${resource(dir: 'images', file: 'google.svg')}"/>
                    </div>
                    <g:if test="${(resourc instanceof linksharing.DocumentResource)}">
                        <a href="${resourc.filepath}" class="text-sm-center"
                           download>Download</a>
                    </g:if>
                    <g:else>
                        <a href="${resourc.url}" class="text-sm-center"
                           target="_blank">View full site</a>
                    </g:else>
                    <g:if test="${(user.readingItems).find{it.resource==resourc && it.isRead==false} && isSuscribed}">
                    <a
                       href="${createLink(controller: 'readingItem', action: 'update', params: [resourc:resourc.id,user: user.id])}"
                       class="text-sm-center">Mark as read</a>
                    </g:if>
                    <a href="${createLink(controller:'topic',action:'post',params:[resource:resourc.id])}" target="_blank"  class="text-sm-center">View post</a>
                </div>
            </div>
        </div>
    </div>
</div>