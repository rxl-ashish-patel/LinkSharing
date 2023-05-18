<%@ page import="linksharing.Seriousness; linksharing.DocumentResource; linksharing.Visibility" %>
<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: 'search', styles: ['index', 'dashboard'],javascript:['editTopicName','searchPageHandler','markAsRead','sendInviteHandler']]"/>


<body>

<div class="navBarBorder">
    <g:if test="${user!=null}">

        <g:render template="/navBarTemplate"
                  model="[icons: ['shareLink', 'shareDocument', 'user', 'down']]"/>
        <g:render template="/documentResource/shareDocumentTemplate" model="[topics: topic, user: user]"/>
        <g:render template="/linkResource/shareLinkTemplate" model="[topics: topic, user: user]"/>

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

            <table id="trendingTopics" class="table table-striped display" style="width:100%">
                <thead>
                <tr class="bg-secondary">
                    <th>Trending Topics:</th>
                </tr>
                </thead>
                <tbody >
                <g:each var="topic" in="${trendingTopics}">
                    <tr><td>
                        <g:render template="/user/Templates/trendingTopicTemplate" model="[topic:topic]"/>
                    </td></tr>
                </g:each>
                </tbody>
            </table>

            <table id="topPosts" class="table table-striped display" style="width:100%">
                <thead>
                <tr class="bg-secondary">
                    <th>Top Posts:</th>
                </tr>
                </thead>
                <tbody >
                <g:each var="post" in="${topPosts.collect { it[1] }}">
                    <tr><td>
                        <g:render template="/user/Templates/postTemplate" model="[post:post]"/>
                    </td></tr>
                </g:each>
                </tbody>
            </table>

        </div>

        <div class="container col-sm-7">

            <div class="row">
                <div class="container">

                    <div class="table">
                        <table id="postItems" class="table table-striped display" style="width:100%">
                            <thead>
                            <tr class="bg-secondary">
                                <th>Posts :</th>
                            </tr>

                            </thead>
                            <tbody>

                            <g:each var="resourc" in="${searchPost}">
                                <tr><td>
                                    <g:render template="/user/Templates/inboxTemplate"
                                              model="[resourc: resourc, user: user, isSuscribed: user?user in resourc.topic.subscriptions*.user:false]"/>
                                </td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<!-- Example split danger button -->

<g:javascript>
    $(document).ready(function (){
        $("#trendingTopics").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 5,
            "searching": false
        })
        $("#topPosts").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 5,
            "searching": false
        })
        $("#postItems").dataTable({
            "bLengthChange": false, // remove "Show" option
            "pageLength": 20,
            "searching": false
        })
    })

</g:javascript>
</body>

</html>