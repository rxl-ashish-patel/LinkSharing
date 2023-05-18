function dateFilter(){

    let endDate=event.target.value
    console.log(endDate)
    event.preventDefault()
    $.ajax({
        type: 'PUT',
        data: {
            endDate:endDate
        },
        url: "topic/filterTopPosts",
        success: function (response) {
            $('#topPostsDiv').html(response);
            $("#topPosts").dataTable({
                "bLengthChange": false, // remove "Show" option
                "pageLength": 20,
                'searching':false
            })

            console.log(response)

        },
        error: function (errorThrown) {
            console.log('Error:', errorThrown);
        }
    });
}