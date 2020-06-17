//VALIDATION JAVASCRIPT

// validateName function
// name must be more than 3 char, and no number, in case of two word names no extraspace between words
function validate_name(name) {
  //   console.log(name);
  var nameArray = name.split(" ");
  for (var i = 0; i < nameArray.length; i++) {
    // console.log(nameArray[i], ":", /^[a-z]+$/i.test(nameArray[i]));
    nameArray[i] = /^[a-z]+$/i.test(nameArray[i]);
  }
  if (name.length > 3 && name.length <20) nameArray.push(true);
  else nameArray.push(false);
  //   console.log(nameArray);

  if (trueChecker(nameArray)) {
    return;
  } else {
    return false;
  }
}

// validate ssno
// length == 9 and no chars
function validate_ssno(ssno) {
  if (ssno.length == 9 && /^[0-9]+$/i.test(ssno)) return;
  else return false;
}

// validate dob
function validate_dob(dob) {
  var dobArray = dob.split("-");
  console.log(dobArray[0]);

  var currentYear = new Date().getFullYear();
  var dobYear = dobArray[0];
  var age = currentYear - dobYear;
  for (var i = 0; i < dobArray.length; i++) {
    switch (i) {
      // Year
      case 0:
        if (dobArray[i].length == 4 && age > 18 && age < 80) {
          dobArray[i] = true;
        } else dobArray[i] = false;
        break;
      //month
      case 1:
        if (Number(dobArray[i]) >= 1 && Number(dobArray[i]) <= 12) {
          dobArray[i] = true;
        } else dobArray[i] = false;
        break;
      // day
      case 2:
        if (
          Number(dobArray[i]) >= 1 &&
          (Number(dobArray[i]) <= 31 || Number(dobArray[i]) <= 30)
        ) {
          dobArray[i] = true;
        } else dobArray[i] = false;
        break;
    }
  }
  //   console.log(dobArray);
  if (trueChecker(dobArray)) {
    return;
  } else {
    return false;
  }
}

// validate_address function
function validate_address(address) {
  var nu_space = address.split(" ").length - 1;
  if (address.length - nu_space >= 5 && address.length < 100) {
    return;
  } else return false;
}

// This function validates customer_id
function validate_customer_id(customer_id) {
  if (
    customer_id.length == 10 &&
    Number(customer_id) >= 1000000000 &&
    Number(customer_id) < 2000000000 &&
    /^[0-9]+$/i.test(customer_id)
  )
    return;
  else return false;
}

// This function validates account_number
function validate_account_number(account_number) {
  if (
    account_number.length == 10 &&
    Number(account_number) >= 2000000000 &&
    Number(account_number) < 3000000000 &&
    /^[0-9]+$/i.test(account_number)
  )
    return;
  else return false;
}

// This function validates transaction_id
function validate_transaction_id(transaction_id) {
  if (
    transaction_id.length == 10 &&
    Number(transaction_id) >= 3000000000 &&
    Number(transaction_id) < 4000000000 &&
    /^[0-9]+$/i.test(transaction_id)
  )
    return;
  else return false;
}

// validate_depositAmount
function validate_depositAmount(amount) {
  if (Number(amount) > 99) return;
  else return false;
}

//validate the dates range
function validate_dates(startDate, endDate) {
  startDate = new Date(startDate);
  endDate = new Date(endDate);
  console.log("startDate", startDate);
  console.log("endDate", endDate);
  if (startDate < endDate) {
    console.log("valid");
    return;
  } else {
    console.log("not valid");
    return false;
  }
}

//if valid date or not
function validate_validDate(date) {
  if (new Date(date) < new Date()) {
    return;
  }
  return false;
}

function validate_count(count){
	if(Number(count)>0)return;
	else return false;
}

// validation support function
let trueChecker = (arr) => arr.every((v) => v === true);
