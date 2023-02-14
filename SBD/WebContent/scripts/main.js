function validateLogin() {
    let username = document.getElementById("username");
    let password = document.getElementById("password");
    let invalid = document.getElementById("invalid");

    if (username.value === null || username.value === "") {
        username.focus();
        invalid.innerHTML = "Username can't be blank";
        return false;
    } else if (username.value.length < 4) {
        username.focus();
        invalid.innerHTML = "Username can't be have less than 4 characters";
        return false;
    } else if (username.value.length > 25) {
        username.focus();
        invalid.innerHTML = "Username can't have more than 25 characters";
        return false;
    } else if (!alphanumeric(username.value)) {
        username.focus();
        invalid.innerHTML = "Username can only contain numbers and letters";
        return false;
    } else if (password.value.length < 6 || password.value === "" || password.value === null) {
        password.focus();
        invalid.innerHTML = "Password must be at least 6 characters long";
        return false;
    } else if (password.value.length > 50) {
        password.focus();
        invalid.innerHTML = "Password can't have more than 50 characters";
        return false;
    }
    return true;
}

function isValidCountry(country){
    let countrys = ['Afghanistan','South Africa','Albania','Germany','Andorra','Angola','Saudi Arabia','Algeria','Argentina','Australia','Austria','Belgium','Brazil','Cameroon','Canada',
                    'Chile','China','Cyprus','North Korea','South Korea','Denmark','Spain','Philippines','Finland','France','Greece','Guinea','Guinea-Bissau','India','Iran','Iraq','Ireland',
                    'Iceland','Israel','Italy','Japan','Jamaica','Lithuania','Luxembourg','Mexico','Mozambique','Norway','New Zealand','Netherlands','Paraguay','Puerto Rico','Portugal','United Kingdom',
                    'Russia','Switzerland','Sweden','Zimbabwe'];
    return countrys.includes(country);
}

function alphanumeric(inputtxt) {
    let letterNumber = /^[0-9a-zA-Z]+$/;
    return inputtxt.match(letterNumber);
}

function letterSpace(inputtxt) {
    let letterNumber = /[^\u0000-\u00ff]/;/*/^[A-Za-z ]+$/;*/
    return !inputtxt.match(letterNumber);
}

function isValidDate(dateString) {
  var regEx = /^\d{4}-\d{2}-\d{2}$/;
  if(!dateString.match(regEx)) return false;  // Invalid format
  var d = new Date(dateString);
  var dNum = d.getTime();
  if(!dNum && dNum !== 0) return false; // NaN value, Invalid date
  return d.toISOString().slice(0,10) === dateString;
}

function validateRegister() {
    let username = document.getElementById("username");
    let nationality = document.getElementById("nationality");
    let password = document.getElementById("password");
    let birthday = document.getElementById("birthday");
    let invalid = document.getElementById("invalid");

    if (username.value === null || username.value === "") {
        username.focus();
        invalid.innerHTML = "Username can't be blank";
        return false;
    } 
    
    else if (username.value.length < 4) {
        username.focus();
        invalid.innerHTML = "Username can't be have less than 4 characters";
        return false;
    } 
    
    else if (username.value.length > 25) {
        username.focus();
        invalid.innerHTML = "Username can't have more than 25 characters";
        return false;
    } 
    
    else if (!alphanumeric(username.value)) {
        username.focus();
        invalid.innerHTML = "Username can only contain numbers and letters";
        return false;
    }
    
    else if (nationality.value.length === 0 || !nationality.value) {
        nationality.focus();
        invalid.innerHTML = "Nationality can't be blank";
        return false;
    }
    
    else if (isValidCountry(nationality.value) === false) {
        nationality.focus();
        invalid.innerHTML = "You didn't introduce a valid country(must be in written in english)";
        return false;
    }
    
    else if (birthday.value.length === 0 || !birthday.value) {
        birthday.focus();
        invalid.innerHTML = "Birthday can't be blank";
        return false;
    }
    
    else if (isValidDate(birthday.value) === false) {
        birthday.focus();
        invalid.innerHTML = "Not a valid date, must be on yyyy-mm-dd format";
        return false;
    }

    else if (password.value.length < 6 || password.value === "" || password.value === null) {
        password.focus();
        invalid.innerHTML = "Password must be at least 6 characters long";
        return false;
    } 
    
    else if (password.value.length > 50) {
        password.focus();
        invalid.innerHTML = "Password can't have more than 50 characters";
        return false;
    }
    return true;

}


function validateNewPassword() {
    let pass1 = document.getElementById("pass1");
    let pass2 = document.getElementById("pass2");
    let pass3 = document.getElementById("pass3");
    let invalid = document.getElementById("invalid");

    if (pass1.value.length < 6) {
        pass1.focus();
        invalid.innerHTML = "Your previous password must have at least 6 characters";
        return false;
    } else if (pass1.value.length > 50) {//porque depois ficariam duas coisas com a mesma descrição
        pass1.focus();
        invalid.innerHTML = "The password you had can only have in maximum 50 characters, it has" + pass1.value.length;
        return false;
    } else if (pass2.value.length < 6) {
        pass2.focus();
        invalid.innerHTML = "New password must have at least 6 characters";
        return false;
    } else if (pass2.value.length > 50) {
        pass2.focus();
        invalid.innerHTML = "The new password can only have in maximum 50 characters, it has" + pass2.value.length;
        return false;
    } else if (pass3.value.length < 6) {
        pass3.focus();
        invalid.innerHTML = "The confirmation password must have at least 6 characters";
        return false;
    } else if (pass3.value.length > 50) {
        pass3.focus();
        invalid.innerHTML = "The confirmation password can only have in maximum 50 characters, it has" + pass2.value.length;
        return false;
    } else if (pass3.value !== pass2.value) {
        pass3.focus();
        invalid.innerHTML = "The passwords dont match with each other";
        return false;
    }
    return true;
}

function validateContentUser() {
    let invalid = document.getElementById("invalid2");
    
    let selected = false;
    for(let a = 1;a < document.getElementById("teste").childElementCount+1;a++){
        if(document.getElementById("d"+a).className === "same-as-selected"){
            selected = true;
        }
    }
    if(!selected){
        document.getElementById("teste").focus();
        invalid.innerHTML = "You must have to selecte a content";
        return false;
    }
    return true;
}





















/*
function validateMessage() {
    let subject = document.getElementById("subject");
    let message = document.getElementById("message");
    let invalid = document.getElementById("invalid");

    if (subject.value.length < 3) {
        subject.focus();
        invalid.innerHTML = "Subject must have at least 3 characters";
        return false;
    } else if (message.value.length < 20) {
        message.focus();
        invalid.innerHTML = "Message must have more than 20 characters.";
        return false;
    } else if (subject.value.length > 40) {
        subject.focus();
        invalid.innerHTML = "Subject must have less than 40 characters.It has " + subject.value.length + " characters.";
        return false;
    } else if (message.value.length > 400) {
        message.focus();
        invalid.innerHTML = "Message can't have more than 400. It has " + message.value.length + " characters.";
        return false;
    }
}

function validateContent() {
    let image = document.getElementById("image");
    let district = document.getElementById("district-name2");
    let name = document.getElementById("monument-name");
    let content = document.getElementById("content");
    let invalid = document.getElementById("invalid");

    if (image.files.length === 0) {
        image.focus();
        invalid.innerHTML = "There's no image or video selected. Please select one type of content and submit again.";
        return false;
    } else if (image.files.length > 1) {//porque depois ficariam duas coisas com a mesma descrição
        image.focus();
        invalid.innerHTML = "It's only possible to submit one type of content at once.";
        return false;
    } else if (district.value === "Select district:") {
        district.focus();
        invalid.innerHTML = "You must select a district of the monument.";
        return false;
    } else if (name.value.length < 2) {
        district.focus();
        invalid.innerHTML = "The Monument name must have at least 2 characters.";
        return false;
    } else if (name.value.length > 40) {
        district.focus();
        invalid.innerHTML = "The Monument can only have 40 characters";
        return false;
    } else if (!letterSpace(name.value)) {
        district.focus();
        invalid.innerHTML = "The Monument name can only contains letters and spaces";
        return false;
    } else if (content.value.length < 10) {
        content.focus();
        invalid.innerHTML = "The description of the content must have more than 10 characters";
        return false;
    } else if (content.value.length > 1000) {
        content.focus();
        invalid.innerHTML = "The content must me less than 1000 characters.";
        return false;
    }
    return true;
}

function validateNewPassword() {
    let pass1 = document.getElementById("pass1");
    let pass2 = document.getElementById("pass2");
    let pass3 = document.getElementById("pass3");
    let invalid = document.getElementById("invalid");

    if (pass1.value.length < 6) {
        pass1.focus();
        invalid.innerHTML = "Your previous password must have at least 6 characters";
        return false;
    } else if (pass1.value.length > 50) {//porque depois ficariam duas coisas com a mesma descrição
        pass1.focus();
        invalid.innerHTML = "The password you had can only have in maximum 50 characters, it has" + pass1.value.length;
        return false;
    } else if (pass2.value.length < 6) {
        pass2.focus();
        invalid.innerHTML = "New password must have at least 6 characters";
        return false;
    } else if (pass2.value.length > 50) {
        pass2.focus();
        invalid.innerHTML = "The new password can only have in maximum 50 characters, it has" + pass2.value.length;
        return false;
    } else if (pass3.value.length < 6) {
        pass3.focus();
        invalid.innerHTML = "The confirmation password must have at least 6 characters";
        return false;
    } else if (pass3.value.length > 50) {
        pass3.focus();
        invalid.innerHTML = "The confirmation password can only have in maximum 50 characters, it has" + pass2.value.length;
        return false;
    } else if (pass3.value !== pass2.value) {
        pass3.focus();
        invalid.innerHTML = "The passwords dont match with each other";
        return false;
    }
    return true;
}


function validateEditUser() {
    let email = document.getElementById("email");
    let pass = document.getElementById("pass");
    let newVal = document.getElementById("new");
    let invalid = document.getElementById("invalid");
    
    
    let selected = false;
    for(let a = 1;a < document.getElementById("teste").childElementCount+1;a++){
        if(document.getElementById("d"+a).className === "same-as-selected"){
            selected = true;
        }
    }
    if(!selected){
        document.getElementById("teste").focus();
        invalid.innerHTML = "You must have to selecte a user";
        return false;
    }

    if (email.checked) {
        if (!validateEmail(newVal.value)) {
            email.focus();
            invalid.innerHTML = "The new email is not valid, please enter a new email";
            return false;
        }
    } else if (pass.checked) {
        if (!alphanumeric(newVal.value)) {
            pass.focus();
            invalid.innerHTML = "The password must only english characters and numbers";
            return false;
        }
        else if(newVal.value.length < 6){
            pass.focus();
            invalid.innerHTML = "The password must have at least 6 characters";
            return false;
        }
        else if(newVal.value.length > 50){
            pass.focus();
            invalid.innerHTML = "The new password can only have in maximum 50 characters, it has" + pass.value.length;
            return false;
        }
    }
    return true;
}



function validateEditPriority() {
    let invalid = document.getElementById("invalid2");
    
    let selected = false;
    for(let a = 1;a < document.getElementById("teste2").childElementCount+1;a++){
        if(document.getElementById("e"+a).className === "same-as-selected"){
            selected = true;
        }
    }
    if(!selected){
        document.getElementById("teste").focus();
        invalid.innerHTML = "You must have to selecte a user";
        return false;
    }
}

function validateEditContentAdmin() {
    let invalid = document.getElementById("invalid3");
    
    let selected = false;
    for(let a = 1;a < document.getElementById("teste3").childElementCount+1;a++){
        if(document.getElementById("f"+a).className === "same-as-selected"){
            selected = true;
        }
    }
    if(!selected){
        document.getElementById("teste").focus();
        invalid.innerHTML = "You must have to selecte a content";
        return false;
    }
}*/