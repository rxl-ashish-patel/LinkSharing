<%@ page import="linksharing.Seriousness; linksharing.DocumentResource; linksharing.Visibility" %>
<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: 'Dashboard', styles: ['index', 'dashboard'],javascript:['editTopicName','searchPageHandler','markAsRead','sendInviteHandler','SubscribeUnsuscribe','createTopic','updateSeriousnessAndVisibility']]"/>


<body>

<div class="navBarBorder">
    <g:render template="/navBarTemplate"
              model="[icons: ['createTopic', 'sendInvite', 'shareLink', 'shareDocument', 'user', 'down'],user:user]"/>
    <g:render template="/sendInviteTemplate" model="[topics: subscriptions*.topic]"/>
    <g:render template="/createTopicTemplate" model="[user:user]"/>
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
            <div id="user">
                <g:render template="Templates/userTemplate" model="[user:user]"/>
            </div>
            <div id="subscriptionDiv">
                <g:render template="Templates/subscriptionDataTable" model="[subscriptionsByLatestPost:subscriptionsByLatestPost,user:user]"/>
            </div>
            <div id="trendingTopicsDiv">
                <g:render template="Templates/trendingTopicsDataTable" model="[trendingTopics:trendingTopics,user:user]"/>
             </div>
        </div>
        <div class="container col-sm-7">
            <div id="inboxDiv">
             <g:render template="Templates/inboxDataTable" model="[user:user]"/>
             </div>
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


    // seriousness change

    //inbox datatable
    $("#inboxItemsTable").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 20,
            searchBuilder: {
            columns: [1]
        }
        })
    //hide the coloumn 2
    $('#inboxItemsTable').DataTable().column(1).visible(false);

     //trendingtopic datatable
    $("#trendingTopicsTable").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 5,
            "searching": false,
            "ordering":false
        })

    //subscriptions datatable
        $("#SubscriptionsTable").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 5,
            "searching": false,
            "ordering":false
        })

    });


</g:javascript>
</body>

</html>