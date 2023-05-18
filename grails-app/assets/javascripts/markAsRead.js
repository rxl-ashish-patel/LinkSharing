function markAsRead(resourceId,userId){
    console.log("markas read",resourceId,userId)
    $.ajax({
        type:'PUT',
        data:{
            resourceId:resourceId,
            userId:userId
        },
        url:'readingItem/update',
        success:function (response){
            console.log(response)
            $('#inboxDiv').html(response);
            $("#inboxItemsTable").dataTable({
                "bLengthChange": false, // remove "Show" option
                "pageLength": 20,
            })
        },
        error:function(error){

        }

    })
}