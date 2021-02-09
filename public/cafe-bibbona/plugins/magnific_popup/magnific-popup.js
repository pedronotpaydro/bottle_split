$(document).ready(function () {
    "use strict";
    // Magnific Popup Gallery
    //*******************
    $('.gallery-item').magnificPopup({
        fixedContentPos: false,
        type: 'image',
        gallery: {
            enabled: true
        },
        image: {
            // options for image content type
            titleSrc: 'title'
        }
    });

});

