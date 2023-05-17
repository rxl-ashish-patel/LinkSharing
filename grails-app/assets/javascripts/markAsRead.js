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
            window.location.reload()
        },
        error:function(error){

        }

    })
}