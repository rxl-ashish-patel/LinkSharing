function updateSeriousness(x){
    console.log(x)
    let  topicuser=x.id.split('-')
    let topic=topicuser[0]
    let user=topicuser[1]
    let seriousness=x.value
    $.ajax({
        type:'PUT',
        data: { topic:topic, user:user,seriousness: seriousness},
        url:"/subscription/update",
        success: function(response) {
            console.log(response)
            // console.log($('.topic'))
            subscriptions(user)
            trendingTopics(user)
        },
        error: function(errorThrown) {
            console.log('Error:', errorThrown);
        }
    })

}

function updateVisibility(x){
    let  topicuser=x.id.split('-')
    let topic=topicuser[0]
    let user=topicuser[1]
    let visibility=x.value;
    console.log(topic,user,visibility)
    $.ajax({
        type:'PUT',
        data: { topic:topic, visibility:visibility },
        url:"/topic/update",
        success: function(response) {
            console.log(response)
            subscriptions(user)
            trendingTopics(user)
        },
        error: function(errorThrown) {
            console.log('Error:', errorThrown);
        }
    })

}