<div class="rating">
    <g:if test="${user!=null && user in resourc.ratings*.user}">
    <g:each var="num" in="${1..(resourc.ratings.find{it.user==user}.score)}">
        <span  class="star active" id="${resourc.id}-${user.id}" data-value="${num}">&#9733;</span>
    </g:each>
        <g:if test="${user.resourceRatings.find{it.resource==resourc}.score<5}">
            <g:each var="num" in="${user.resourceRatings.find{it.resource==resourc}.score+1..5}">
                <span  class="star" id="${resourc.id}-${user?.id}" data-value="${num}">&#9733;</span>
            </g:each>
        </g:if>

        <div class="ms-2">
            ${resourc.ratings.size()}
        </div>
</g:if>
    <g:else>
        <span  class=${user?"star":""} id="${resourc.id}-${user?.id}" data-value="1">&#9733;</span>
        <span  class=${user?"star":""} id="${resourc.id}-${user?.id}" data-value="2">&#9733;</span>
        <span  class=${user?"star":""} id="${resourc.id}-${user?.id}" data-value="3">&#9733;</span>
        <span  class=${user?"star":""} id="${resourc.id}-${user?.id}" data-value="4">&#9733;</span>
        <span  class=${user?"star":""} id="${resourc.id}-${user?.id}" data-value="5">&#9733;</span>
        <div class="ms-2" id="noOfUserRated">
            ${resourc.ratings.size()}
        </div>
    </g:else>


</div>