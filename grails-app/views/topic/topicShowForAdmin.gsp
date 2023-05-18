<%@ page import="linksharing.Seriousness; linksharing.DocumentResource; linksharing.Visibility" %>
<!DOCTYPE html>
<html lang="en">

<g:render template="/headTemplate" model="[title: 'Show Topic', styles: ['index', 'dashboard'],javaScript:['markAsRead']]"/>


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
        <g:render template="/user/Templates/topicDataTableForAdmin" model="[topics:topics]"/>
    </div>
</div>
<!-- Example split danger button -->

<g:javascript>

</g:javascript>
</body>

</html>