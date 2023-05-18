function searchPageHandler(userId){
    event.preventDefault()
    let payload=event.target['searchItem'].value
    console.log(userId)
    $.ajax({
        type:"GET",
        data:{
            userId:userId,
            payload:payload
        },
        url:'/topic/searchData',
        success:function (response){
            var newTab = window.open();
            newTab.document.write(response);
            newTab.document.close();
        },
        error:function (error){

        }
    })
}