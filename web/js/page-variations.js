const dashboard = document.querySelector('.dashboard-container');
const loginPage = document.querySelector('.login-container');
const header = document.querySelector('header');
const headerLink = document.querySelector('#header-link');
const siteTitle = document.querySelector('.site-title');

if (loginPage){
  header.style.display = 'none';
}

if (dashboard){
  headerLink.addEventListener('click', function(){
    event.preventDefault();
  })

  siteTitle.classList.remove("header-variations")
}
