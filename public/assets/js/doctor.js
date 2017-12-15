//On click event for adding new doctor

$("#dr_create_btn").on("click", function(event) {
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
        }).done(
            function(response) {
                console.log("You've been added to the Doctor network");
                console.log(window.location);

            })
        .fail(function() {
            console.log("failed")
        })
});

$("#save_patient_info").on("click", function(event) {
    // Make sure to preventDefault on a submit event.
    event.preventDefault();

    var newPatient = {
        patientFirName: $("#patient_firstName").val().trim(),
        patient_lstName: $("#patient_lstName").val().trim(),
        patient_birth: $("#patient_birth").val().trim(),
        patient_address: $("#patient_address").val().trim(),
        patient_address_2: $("#patient_address_2").val().trim(),
        patient_city: $("#patient_city").val().trim(),
        patient_state: $("#patient_state").val().trim(),
        patient_zip: $("#patient_zip").val().trim()
    };
    console.log(newPatient);

    // Send the POST request -- new patient
    $.ajax("/api/patient", {
            type: "POST",
            data: newPatient
        }).done(
            function(response) {
                console.log("You've been added to the Patient network");
                console.log(window.location);

            })
        .fail(function() {
            console.log("failed")
        })
});

$("#update_patient_info").on("click", function(event) {
    event.preventDefault();

    var newRecord = {
        hepatitis: $("#patient_firstName").val().trim(),
        hsv1: $("#patient_firstName").val().trim(),
        hsv2: $("#patient_firstName").val().trim(),
        hiv: $("#patient_firstName").val().trim(),
        aids: $("#patient_firstName").val().trim(),
        hltv: $("#patient_firstName").val().trim(),
        hpv: $("#patient_firstName").val().trim(),
        molluscum_contag: $("#patient_firstName").val().trim(),
        zika: $("#patient_firstName").val().trim(),
        chlamydia: $("#patient_firstName").val().trim(),
        gonorrhea: $("#patient_firstName").val().trim(),
        syphilis: $("#patient_firstName").val().trim(),
        trich: $("#patient_firstName").val().trim(),
        crabs: $("#patient_firstName").val().trim(),
        scabies: $("#patient_firstName").val().trim(),
        bv_yeast: $("#patient_firstName").val().trim(),
        chancroid: $("#patient_firstName").val().trim(),
        donovanosis: $("#patient_firstName").val().trim(),
        genital_warts: $("#patient_firstName").val().trim(),
        pid: $("#patient_firstName").val().trim(),
        ngu: $("#patient_firstName").val().trim(),
        inetst_parasites: $("#patient_firstName").val().trim(),
        mycoplasm: $("#patient_firstName").val().trim(),
        lgv: $("#patient_firstName").val().trim(),
    }
})