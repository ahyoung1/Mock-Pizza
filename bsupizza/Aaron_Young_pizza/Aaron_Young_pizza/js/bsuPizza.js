$('#drawerMenu').drawer({ toggle: false });
$('#en').click(function () {
    var opts = { language: "en", pathPrefix: "/lang" };
    $("[data-localize]").localize("homepage", opts);
});
$('#ch').click(function () {
    var opts = { language: "ch", pathPrefix: "/lang" };
    $("[data-localize]").localize("homepage", opts);
});
$('#sp').click(function () {
    var opts = { language: "sp", pathPrefix: "/lang" };
    $("[data-localize]").localize("homepage", opts);
});
$('#main-slider').liquidSlider({
    autoSlide: true
});


function startIntro() {
    var intro = introJs();
    intro.setOptions({
        steps: [
          {
              intro: "Welcome to BSUPizza!"
          },
          {
              intro: "You can get <b>THE BEST PIZZA</b> here."
          },
          {
              element: document.querySelector('#navBar'),
              intro: "This is a navigation bar."
          },
          {
              element: document.querySelector('#main-slider'),
              intro: "View our products here."
          }
          ,
          {
              intro: "Remember, you have to login or create an account before you can order!"
          }
          ,
          {
              element: document.querySelector('#contact-div-BTN'),
              intro: "Please leave us a note if you have any questions!"
          }
        ]
    });
    intro.start();
}