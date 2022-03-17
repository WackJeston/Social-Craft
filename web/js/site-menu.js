if (loginPage) {} else {
  const body = document.body;
  const menuButton = document.querySelector(".header-menu-button")
  const page = document.querySelector(".outer-page-container")
  const pageCover = document.querySelector(".page-overlay")
  let activeMenu = false


  menuButton.addEventListener("click", function(){
    if (activeMenu == false){
      body.classList.remove("menu-non-active");
      body.classList.add("menu-active");
      pageCover.style.display = "flex";
      activeMenu = true;
    } else if (activeMenu == true){
      body.classList.remove("menu-active");
      body.classList.add("menu-non-active");
      pageCover.style.display = "none";
      activeMenu = false;
    }
  })

  pageCover.addEventListener("click", function(){
    body.classList.remove("menu-active");
    body.classList.add("menu-non-active");
    pageCover.style.display = "none";
    activeMenu = false;
  })
}
