
function showEditTextarea(topicId,type){
    console.log(topicId)
    let helement = document.getElementById("h"+type+topicId);
    let delement= document.getElementById("d"+type+topicId);

    delement.style.display="block"
    helement.style.display="none"
}
function revertChange(topicId,type){
    let helement = document.getElementById("h"+type+topicId);
    let delement= document.getElementById("d"+type+topicId);
    console.log(helement,delement)
    delement.style.display="none"
    helement.style.display="block"
}

function changeTopicName(topicId){
    console.log()
    $.ajax({
        type:"PUT",
        data:{
            topic:topicId,
            name:event.target['name'].value
        },
        url:'topic/update',
        success:function (response){
            window.location.reload()
        },
        error: function (error){

        }
    })
}