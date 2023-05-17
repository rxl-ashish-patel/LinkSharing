<%@ page import="linksharing.Visibility" contentType="text/html;charset=UTF-8" %>
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
            <g:render template="Templates/userTemplate" model="[user:profileUser]"/>

            <div class="table">
                <g:render template="Templates/subscriptionsOrTopicDataTableTemplate"
                          model="[topics: topics, currentUser: currentUser, user: profileUser,heading:'topics']"/>
            </div>

            <div class="table">
%{--                <g:render template="Templates/subscriptionsOrTopicDataTableTemplate"--}%
%{--                          model="[topics: subscriptions, currentUser: currentUser, user: profileUser,heading:'subscription']"/>--}%
            </div>

        </div>

        <div class="container col-sm-7">
            <div class="table">
                <table id="inboxItems" class="table table-striped display" style="width:100%">
%{--                                    <thead>--}%
%{--                                    <tr class="bg-secondary">--}%
%{--                                        <th>Inbox:</th>--}%
%{--                                        <th>search</th>--}%
%{--                                    </tr>--}%

%{--                                    </thead>--}%
                    <tbody >
%{--                    <g:each var="resourc" in="${(profileUser==currentUser || currentUser.admin )?profileUser.resources:profileUser.resources.findAll{it.topic.visibility==linksharing.Visibility.PUBLIC}}">--}%
%{--                        <tr>--}%
%{--                            <td>--}%
%{--                                <g:if test="${resourc.topic in currentUser.subscribes*.topic}">--}%

%{--                                    <g:render template="Templates/inboxTemplate" model="[resourc:resourc,user:currentUser,isSuscribed:true]"/>--}%
%{--                                </g:if>--}%
%{--                                <g:else>--}%
%{--                                    <g:render template="Templates/inboxTemplate" model="[resourc:resourc,user:currentUser,isSuscribed:false]"/>--}%
%{--                                </g:else>--}%
%{--                            </td>--}%
%{--                            <td >--}%
%{--                                <div>--}%
%{--                                    <p>${resourc?.topic.name}</p>--}%
%{--                                    <p>${resourc?.createdBy.firstName}</p>--}%
%{--                                    <p>${resourc?.createdBy.username}</p>--}%
%{--                                    <p>${resourc?.description}</p>--}%
%{--                                </div>--}%
%{--                            </td>--}%
%{--                        </tr>--}%
%{--                    </g:each>--}%
                    </tbody>
                </table>

            </div>
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
   })
</g:javascript>
</body>
</html>