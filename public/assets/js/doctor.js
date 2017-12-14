//On click event for adding new doctor

$("#dr_create_btn").on("click", function (event) {
    // Make sure to preventDefault on a submit event.
    event.preventDefault();

    var newDoctor = {
        docFirstName: $("#doc_firName").val().trim(),
        docLastName: $("#doc_lstName").val().trim(),
        docPractice: $("#doc_practice").val().trim(),
        docSpecialty: $("#doc_specialty").val().trim(),
        docEmail: $("#doc_email").val().trim(),
        docPhone: $("#doc_phone").val().trim(),
        Street_Address: $("#Street_Address").val().trim(),
        Apartment_Num: $("#Apartment_Num").val().trim(),
        City: $("#City").val().trim(),
        State: $("#State").val().trim(),
        Zip_Code: $("#Zip_Code").val().trim()
    };


    // Send the POST request.
    $.ajax("/api/doctors", {
        type: "POST",
        data: newDoctor
    }).done(
        function (response) {
            console.log("You've been added to the Doctor network");
            console.log(response);
        })
        .fail(function(){
        console.log("failed")
        })
        .always(function(){
        console.log("attempt")
        });
});