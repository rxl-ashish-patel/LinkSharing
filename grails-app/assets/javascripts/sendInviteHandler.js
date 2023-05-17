function sendInviteHandler(){
    // event.preventDefault()
    let email=event.target['email'].value
    let topicId=event.target['topic'].value
    console.log(email,topicId)
    $.ajax({
        type:'POST',
    })
}