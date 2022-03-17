if (loginPage){

  const loginContainer = document.querySelector('#login-form-container');
  const signupContainer = document.querySelector('#signup-form-container');
  const loginSubmit = document.querySelector('#login-submit');
  const signupSubmit = document.querySelector('#signup-submit');

  const loginUsername = document.querySelector('#login-username');
  const loginPassword = document.querySelector('#login-password');
  const signupUsername = document.querySelector('#signup-username');
  const signupFirstName = document.querySelector('#signup-firstName');
  const signupLastName = document.querySelector('#signup-lastName');
  const signupEmail = document.querySelector('#signup-email');
  const signupPassword = document.querySelector('#signup-password');

  let counter = 'login';


  loginSubmit.addEventListener('click', function(){
    if (counter == 'signup') {
      event.preventDefault();
      loginAppear();
      signupDisappear();
      counter = 'login';
    } else {
      emptyInput(loginUsername);
      emptyInput(loginPassword);
    }
  });

  signupSubmit.addEventListener('click', function(){
    if (counter == 'login') {
      event.preventDefault();
      loginDisappear();
      signupAppear();
      counter = 'signup';
    } else {
      emptyInput(signupUsername);
      emptyInput(signupFirstName);
      emptyInput(signupLastName);
      emptyInput(signupEmail);
      emptyInput(signupPassword);
    }
  });


  // Login Appearing
  function loginAppear(){
    loginContainer.style.display = "flex";
    loginContainer.style.animation = "login-appear 200ms forwards";
  }

  // Login Disappearing
  function loginDisappear(){
  loginContainer.style.animation = "login-disappear 200ms forwards";
  setTimeout(function(){
    loginContainer.style.display = "none";
  },200)
  }

  // Signup Appearing
  function signupAppear(){
    signupContainer.style.display = "flex";
    signupContainer.style.animation = "signup-appear 200ms forwards";
  }

  // Signup Disappearing
  function signupDisappear(){
  signupContainer.style.animation = "signup-disappear 200ms forwards";
  setTimeout(function(){
    signupContainer.style.display = "none";
  },200)
  }


  // Emply Input validation
  function emptyInput(i){
    if (i.value == ''){
      event.preventDefault();
      i.style.border = "1px solid red";
    }
  }

}
