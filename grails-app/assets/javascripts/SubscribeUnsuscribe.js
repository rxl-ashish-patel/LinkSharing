function Unsubscribe(topicId, userId) {
    console.log(topicId, userId)
    $.ajax({
        type: 'POST',
        data: {
            user: userId,
            topic: topicId
        },
        url: '/subscription/delete',
        success: function (response) {
            $('#inboxDiv').html(response);
            $("#inboxItemsTable").dataTable({
                "bLengthChange": false, // remove "Show" option
                "pageLength": 20,
                searchBuilder: {
                    columns: [1]
                }
            })
            //hide the coloumn 2
            $('#inboxItemsTable').DataTable().column(1).visible(false);
            subscriptions(userId)
            trendingTopics(userId)
            updatedUser(userId)
            updateTopics(userId)
        },
        error: function (error) {

        }
    })

}

function Subscribe(topicId,userId){
    console.log(topicId,userId)
    $.ajax({
        type:'POST',
        data:{
            user:userId,
            topic:topicId,
            seriousness: "VERY_SERIOUS"
        },
        url:'/subscription/create',
        success:function(response){
            // console.log(response)
            $('#inboxDiv').html(response);
            $("#inboxItemsTable").dataTable({
                "bLengthChange": false, // remove "Show" option
                "pageLength": 20,
                searchBuilder: {
                    columns: [1]
                }
            })
            //hide the coloumn 2
            $('#inboxItemsTable').DataTable().column(1).visible(false);
            subscriptions(userId)
            trendingTopics(userId)
            updatedUser(userId)
            updateTopics(userId)

        },
        error:function(error){

        }
    })
}
function subscriptions(userId){
    return $.ajax({
        type:'GET',
        data:{
            userId:userId
        },
        url:'/user/userSubscriptions',
        success:function(response){
            // console.log("subscriptions "+response)
            $('#subscriptionDiv').html(response);
            $("#SubscriptionsTable").dataTable({
                "bLengthChange": false, // remove "Show" option
                "pageLength": 5,
                "searching": false
            })

        },
        error:function (error){

        }
    })
}
function trendingTopics(userId){
    return $.ajax({
        type:'GET',
        data:{
            userId:userId
        },
        url:'/user/trendingTopics',
        success:function(response){
            // console.log(response)
            $('#trendingTopicsDiv').html(response);
            $("#trendingTopicsTable").dataTable({
                "bLengthChange": false, // remove "Show" option
                "pageLength": 5,
                "searching": false
            })

        },
        error:function (error){

        }
    })
}
function updatedUser(userId){
    return $.ajax({
        type:'GET',
        data:{
            userId:userId
        },
        url:'/user/updatedUser',
        success:function(response){
            // console.log(response)
            $('#user').html(response);
        },
        error:function (error){

        }
    })
}
function updateTopics(userId){
    return $.ajax({
        type:'POST',
        data:{
            userId:userId
        },
        url:'/user/updateTopics',
        success:function(response){
            // console.log(response)
            $('#selectTopicDiv').html(response);
        },
        error:function(error){

        }
    })
}
function  createTopic(userId){
    event.preventDefault()
    let name=event.target['topic'].value
    let visibility=event.target['visibility'].value
    $.ajax({
        type:'PUT',
        data:{
            name:name,
            visibility:visibility
        },
        url:'/topic/create',
        success:function(response){
            // console.log(response)

            subscriptions(userId)
            trendingTopics(userId)
            updatedUser(userId)
            updateTopics(userId)

        },
        error:function(error){

        }
    })
    $('#createTopic').modal('hide');
}
