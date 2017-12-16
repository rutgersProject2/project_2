//On click event for adding new doctor
$(function () {
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


        // Send the POST request -- new doctor
        $.ajax("/api/doctors", {
            type: "POST",
            data: newDoctor
        }).then(
            function (response) {
                console.log("You've been added to the Doctor network");
                window.location.replace(window.location.origin + "/provider/" + response.id);

            })
    });

    $("#save_patient_info").on("click", function (event) {
        // Make sure to preventDefault on a submit event.
        event.preventDefault();

        var newPatient = {
            First_Name: $("#patient_firstName").val().trim(),
            Last_Name: $("#patient_lstName").val().trim(),
            DOB: $("#patient_birth").val().trim(),
            doctorsID: $("#docID").attr("value"),
            Street_Address: $("#patient_address").val().trim(),
            Apartment_Num: $("#patient_address_2").val().trim(),
            City: $("#patient_city").val().trim(),
            State: $("#patient_state").val().trim(),
            Zip_Code: $("#patient_zip").val().trim()
        };

        console.log(newPatient);
        $.ajax("/api/patient", {
            type: "POST",
            data: newPatient
        }).done(
            function (response) {
                console.log("You've been added to the Patient network");
                var patientID = response[0][0][Object.keys(response[0][0])[0]];
                window.location.replace(window.location.href + "/patient/" + patientID);
            })
            .fail(function () {
                console.log("failed")
            })
    });
  

    $("#update_patient_info").on("click", function (e) {
        e.preventDefault();
        var patientID = $("#patientID").attr("value");
        var DOB = moment($("#DOB").attr("value")).format('YYYY MM DD');
        DOB = DOB.replace(/ /gi, "/")
        var newRecord = {
            First_Name: $("#patient_firstName").attr("value"),
            Last_Name: $("#patient_LASTname").attr("value"),
            //DOB: $("#DOB").attr("value"),
            DOB: DOB,
            doctorsID: $("#docID").attr("value"),
            Street_Address: $("#patient_address").attr("value"),
            Apartment_Num: $("#patient_address_2").attr("value"),
            City: $("#patient_city").attr("value"),
            State: $("#patient_state").attr("value"),
            Zip_Code: $("#patient_zip").attr("value"),
            hepatitis: $("input[name='hepatitis']:checked").val(),
            hsv1: $("input[name='hsv1']:checked").val(),
            hsv2: $("input[name='hsv2']:checked").val(),
            hiv: $("input[name='hiv']:checked").val(),
            aids: $("input[name='aids']:checked").val(),
            hltv: $("input[name='hltv']:checked").val(),
            hpv: $("input[name='hpv']:checked").val(),
            molluscum_contag: $("input[name='molluscum_contag']:checked").val(),
            zika: $("input[name='zika']:checked").val(),
            chlamydia: $("input[name='chlamydia']:checked").val(),
            gonorrhea: $("input[name='gonorrhea']:checked").val(),
            syphilis: $("input[name='syphilis']:checked").val(),
            trich: $("input[name='trich']:checked").val(),
            crabs: $("input[name='crabs']:checked").val(),
            scabies: $("input[name='scabies']:checked").val(),
            bv_yeast: $("input[name='bv_yeast']:checked").val(),
            chancroid: $("input[name='chancroid']:checked").val(),
            donovanosis: $("input[name='donovanosis']:checked").val(),
            genital_warts: $("input[name='genital_warts']:checked").val(),
            pid: $("input[name='pid']:checked").val(),
            ngu: $("input[name='ngu']:checked").val(),
            inetst_parasites: $("input[name='inetst_parasites']:checked").val(),
            mycoplasm: $("input[name='Mycoplasm']:checked").val(),
            lgv: $("input[name='lgv']:checked").val(),
        }
        console.log("new rec" + newRecord)
        $.ajax("/api/patient/" + patientID, {
            type: "PUT",
            data: newRecord
        }).done(
            function (newRes) {
                console.log("Patient Record Added")
                console.log(newRes);
            });
    });

    $("#search_patient_info").on("click", function (event) {
        event.preventDefault();

        var searchedPatient = {
            search_PN: $("#search_patient_firstName").val().trim(),
            search_PLN: $("#search_patient_lstName").val().trim(),
            search_DOB: $("#search_patient_dob").val().trim(),
            search_PID: $("#search_patient_ID").val().trim()
        }
        console.log(searchedPatient);

        // AJAX CALL
    });


});