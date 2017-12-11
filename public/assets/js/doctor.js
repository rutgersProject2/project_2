//On click event for adding new doctor
$(function () {
    $("#dr_create_btn").on("click", function (event) {
        // Make sure to preventDefault on a submit event.
        event.preventDefault();

        var newDoctor = {
            firstName: $("#doc_firName").val().trim(),
            lastName: $("#doc_lstName").val().trim(),
            pracice: $("#doc_practice").val().trim(),
            specialty: $("#doc_specialty").val().trim(),
            docEmail: $("#doc_email").val().trim(),
            docPhone: $("#doc_phone").val().trim()
        };
        console.log(newDoctor)
        

        // Send the POST request.
        $.ajax("/api/doctors", {
            type: "POST",
            data: newDoctor
        }).then(
            function () {
                console.log("You've been added to the Doctor network");

                location.reload();
            }
        );
    });
});