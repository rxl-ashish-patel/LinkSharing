<%@ page contentType="text/html;charset=UTF-8" %>
<html >

<g:render template="/headTemplate" model="[title: '',styles: ['index','dashboard'],javascript:['userProfileUpdateHandler']]"/>




<body>


<div class="navBarBorder ">
    <g:render template="/navBarTemplate"
              model="[icons: ['createTopic', 'sendInvite', 'shareLink', 'shareDocument', 'user', 'down'],user:user]"/>
    <g:render template="/sendInviteTemplate" model="[topics: subscriptions*.topic]"/>
    <g:render template="/createTopicTemplate"/>
    <g:render template="/documentResource/shareDocumentTemplate" model="[topics: subscriptions*.topic, user: user]"/>
    <g:render template="/linkResource/shareLinkTemplate" model="[topics: subscriptions*.topic, user: user]"/>
</div>
<div class="m-3">
<div class="form-group mr-3 d-flex col-sm-3">
    <label for="filter-select" class="mr-2">Filter:</label>
    <select onchange="userListFilter()" class="form-control" id="filter-select">
        <option value="all">All Users</option>
        <option value="active">Active</option>
        <option value="notactive">Inactive</option>
    </select>
</div>
</div>
<div class="table">
<g:render template="Templates/userDataTableTemplate" model="[users:users]"/>
</div>

</body>
</html>