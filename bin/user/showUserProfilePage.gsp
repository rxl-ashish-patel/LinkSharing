<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<g:render template="/headTemplate"
          model="[title: '', styles: ['index', 'dashboard'], javascript: ['userProfileUpdateHandler']]"/>


<body>

<div class="navBarBorder">
    <g:render template="/navBarTemplate" model="[icons: ['user', 'down'],user:currentUser]"/>
</div>

<div class="container-fluid p-4">
    <div class="row">
        <div class="container col-sm-5 mb-2">
            <g:render template="Templates/userTemplate" model="[user:profileUser,currentUser:currentUser]"/>

            <div class="table">
                <g:render template="Templates/subscriptionsOrTopicDataTableTemplate"
                          model="[topics: topics, currentUser: currentUser, user: profileUser,heading:'topics']"/>
            </div>

            <div class="table">
                <g:render template="Templates/subscriptionsOrTopicDataTableTemplate"
                          model="[topics: subscriptions, currentUser: currentUser, user: profileUser,heading:'subscription']"/>
            </div>

        </div>

        <div class="container col-sm-7">
%{--            <g:render template="Templates/inboxTemplate" model="[resourc:topics.resources,]"/>--}%
        </div>
    </div>
</div>

<g:javascript>
 $(document).ready(function(){
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
      $('#subscription').dataTable({
  "bLengthChange": false, // remove "Show" option
  "pageLength": 5, // set default number of records per page
  "searching": false // remove search options
});
      $('#topics').dataTable({
  "bLengthChange": false, // remove "Show" option
  "pageLength": 5, // set default number of records per page
  "searching": false // remove search options
});
   })
</g:javascript>
</body>
</html>