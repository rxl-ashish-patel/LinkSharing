<%@ page import="linksharing.Seriousness; linksharing.DocumentResource; linksharing.Visibility" %>
<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: '', styles: ['index', 'dashboard'],javascript:['editTopicName','searchPageHandler','markAsRead','sendInviteHandler']]"/>


<body>

<div class="navBarBorder">
    <g:render template="/navBarTemplate"
              model="[icons: ['createTopic', 'sendInvite', 'shareLink', 'shareDocument', 'user', 'down'],user:user]"/>
    <g:render template="/sendInviteTemplate" model="[topics: subscriptions*.topic]"/>
    <g:render template="/createTopicTemplate"/>
    <g:render template="/documentResource/shareDocumentTemplate" model="[topics: subscriptions*.topic, user: user]"/>
    <g:render template="/linkResource/shareLinkTemplate" model="[topics: subscriptions*.topic, user: user]"/>
</div>

<g:if test="${flash?.params?.message}" >
    <div id="message" class="alert alert-${flash?.params.code}  bg-${flash?.params.code} alert-dismissible fade show" role="alert">
        ${flash.params.message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</g:if>


<div class="container-fluid p-4">
    <div class="row">
        <div class="container col-sm-5 mb-2">
            <g:render template="Templates/userTemplate" model="[user:user]"/>

            <table id="Subscriptions" class="table table-striped display" style="width:100%">
                <thead>
                <tr class="bg-secondary">
                    <th>
                        <div class="d-flex justify-content-sm-between"><h6>Subscriptions:</h6>
                            <a href="">View All</a>
                        </div>
                    </th>
                </tr>
                </thead>
                <tbody >
                <g:each var="topic" in="${subscriptionsByLatestPost}">
                    <tr><td>
                        <g:render template="Templates/subscriptionsTemplate" model="[topic:topic,user:user]"/>
                    </td></tr>
                </g:each>
                </tbody>
            </table>
            <table id="trendingTopics" class="table table-striped display" style="width:100%">
                <thead>
                <tr class="bg-secondary">
                    <th>Trending Topics:</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="topic" in="${trendingTopics}">
                    <tr><td>
                        <g:render template="Templates/trendingTopicTemplate" model="[topic: topic, user: user]"/>
                    </td></tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="container col-sm-7">
            <table id="inboxItems" class="table table-striped display" style="width:100%">
                <thead>
                <tr class="bg-secondary">
                    <th>Inbox:</th>
                    <th>search</th>
                </tr>

                </thead>
                <tbody >
                <g:each var="readingItem" in="${user.readingItems.findAll { it.isRead == false }}">
                    <tr id="${readingItem.id}">
                        <td>
                        <g:render template="Templates/inboxTemplate" model="[resourc:readingItem.resource,user:user,isSuscribed:true]"/>
                        </td>
                        <td >
                            <div>
                                <p>${readingItem.resource.topic.name}</p>
                                <p>${readingItem.resource.createdBy.firstName}</p>
                                <p>${readingItem.resource.createdBy.username}</p>
                                <p>${readingItem.resource.description}</p>
                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>

        </div>
    </div>
</div>
<!-- Example split danger button -->

<g:javascript>

$(document).ready(function (){
    //flash message hide
    setTimeout(function (){
        $("#message").hide();
    },2000);

    //visibility change

    $(".updateVisibility").change(function (){
        var topic=this.id
        let visibility=this.value;
        $.ajax({
            type:'PUT',
            data: { topic:topic, visibility:visibility },
            url:"${createLink(controller: 'topic', action: 'update')}",
            success: function(response) {
                      window.location.reload()
                     },
             error: function(errorThrown) {
                         console.log('Error:', errorThrown);
                     }
        });
    });
    // seriousness change
    $(".updateSeriousness").change(function (){
        let  topicuser=this.id.split('-')
        let topic=topicuser[0]
        let user=topicuser[1]
        let seriousness=this.value
        $.ajax({
            type:'PUT',
            data: { topic:topic, user:user,seriousness: seriousness},
            url:"${createLink(controller: 'subscription', action: 'update')}",
            success: function(response) {
                console.log("topic----->>")
                console.log($('.topic'))
                        window.location.reload()
                     },
             error: function(errorThrown) {
                         console.log('Error:', errorThrown);
                     }
        });
    });
    //inbox datatable
    $("#inboxItems").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 20,
            searchBuilder: {
            columns: [1]
        }
        })
    //hide the coloumn 2
    $('#inboxItems').DataTable().column(1).visible(false);

     //trendingtopic datatable
    $("#trendingTopics").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 5,
            "searching": false
        })

    //subscriptions datatable
        $("#Subscriptions").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 5,
            "searching": false
        })

    });


</g:javascript>
</body>

</html>