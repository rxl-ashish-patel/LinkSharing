function userProfileUpdateHandler(userId){
    event.preventDefault()
    let  forms=event.target;
    $.ajax({
        type: 'PUT',
        data: {
            userId: userId,
            username: forms['username'].value,
            firstName: forms['firstname'].value,
            lastName: forms['lastname'].value,
            photo:forms['photo'].value,
            view:'profile'
        },
        url: "/user/update",
        success: function (response) {
            alert("profile updated successfully");
            event.returnValue = true;
            // window.location.reload()
        },
        error: function (errorThrown) {
            console.log('Error:', errorThrown);
        }
    });
}
function userPasswordUpdateHandler(userId){
    let  forms=event.target;
    event.preventDefault()
    if(forms['password'].value === forms['confirmpassword'].value) {
        $.ajax({
            type: 'PUT',
            data: {
                userId: userId,
                password: forms['password'].value,
                view:'profile'
            },
            url: "/user/update",
            success: function (response) {
                alert("password update successfully")
            },
            error: function (errorThrown) {
                console.log('Error:', errorThrown);
            }
        });
    }
    else{
        alert("password and confirm password should be same")
    }
}
function userStatusUpdateHandler(userId,status){
   // event.preventDefault()
        $.ajax({
            type: 'PUT',
            data: {
                userId: userId,
                active: status,
                view:'admin'
            },
            url: "/user/update",
            success: function (response) {
                if(status)
                    alert("user activated")
                else
                    alert("user deactivated")
                window.location.reload()
            },
            error: function (errorThrown) {
                console.log('Error:', errorThrown);
            }
        });
}
function userListFilter(){
    let x=event.target.value
    console.log(x)
    event.preventDefault()
    $.ajax({
        type: 'PUT',
        data: {
            userTypes:x
        },
        url: "/user/userTableForAdmin",
        success: function (response) {
            if(x=='all')
                window.location.reload()
            else {
                $('.table').html(response);
                $('#example').DataTable();
            }
            console.log(response)

        },
        error: function (errorThrown) {
            console.log('Error:', errorThrown);
        }
    });
}