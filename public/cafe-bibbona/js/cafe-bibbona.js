/* eslint-disable no-redeclare */
/* eslint-disable no-unused-vars */
/* eslint-disable no-undef */
$("#readMore").click(function() {
  $(".read").toggleClass("read-less");
  if ($(this).text() == "Show Less") $(this).text("Show More");
  else $(this).text("Show Less");
});

$(document).ready(function() {
  "use strict";
  if ($("#menu-masonry").length > 0) {
    // Call to Masonry plugin
    var gallerymasonry = $("#menu-masonry").isotope({
      itemSelector: ".single-menu-list",
      filter: ".macaroons",
      layoutMode: "fitRows",
      transitionDuration: ".6s",
      hiddenStyle: {
        opacity: 0,
        transform: "scale(.85)",
      },
      visibleStyle: {
        opacity: 1,
        transform: "scale(1)",
      },
    });

    $("#menu-masonry-sort a").on("click", function(e) {
      e.preventDefault();
      var $this = $(this);
      if ($this.parent("li").hasClass("active")) {
        return false;
      } else {
        $this
          .parent("li")
          .addClass("active")
          .siblings("li")
          .removeClass("active");
      }
      var filterValue = $this.data("target");
      gallerymasonry.isotope({
        filter: filterValue,
      });
      return $this;
    });
  }

  if ($("#gallery-masonry").length > 0) {
    // Call to Masonry plugin
    var gallerymasonry = $("#gallery-masonry").isotope({
      itemSelector: ".single-item",
      layoutMode: "fitRows",
      transitionDuration: ".6s",
      hiddenStyle: {
        opacity: 0,
        transform: "scale(.85)",
      },
      visibleStyle: {
        opacity: 1,
        transform: "scale(1)",
      },
    });
    // Filtering the gallery items
    $("#gallery-masonry-sort a").on("click", function(e) {
      e.preventDefault();
      var $this = $(this);
      if ($this.parent("li").hasClass("active")) {
        return false;
      } else {
        $this
          .parent("li")
          .addClass("active")
          .siblings("li")
          .removeClass("active");
      }
      var filterValue = $this.data("target");
      gallerymasonry.isotope({
        filter: filterValue,
      });
      return $this;
    });
  }

  $(".owl-carousel").owlCarousel({
    stagePadding: 200,
    loop: true,
    autoplay: true,
    autoplayTimeout: 1000,
    autoplayHoverPause: true,
    autoplaySpeed: 5000,
    margin: 0,
    items: 1,
    lazyLoad: true,
    nav: true,
    responsive: {
      0: {
        items: 1,
        stagePadding: 10,
      },
      600: {
        items: 1,
        stagePadding: 80,
      },
      1000: {
        items: 1,
        stagePadding: 180,
      },
      1200: {
        items: 1,
        stagePadding: 100,
      },
      1400: {
        items: 1,
        stagePadding: 250,
      },
      1600: {
        items: 1,
        stagePadding: 250,
      },
      1800: {
        items: 1,
        stagePadding: 250,
      },
    },
  });

  // Example starter JavaScript for disabling form submissions if there are invalid fields
  (function() {
    "use strict";
    window.addEventListener(
      "load",
      function() {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName("needs-validation");
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function(form) {
          form.addEventListener(
            "submit",
            function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add("was-validated");
            },
            false
          );
        });
      },
      false
    );
  })();
});
