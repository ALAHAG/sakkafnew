   $(document).ready(function () {
     var dd = $('.vticker').easyTicker({
         direction: 'down',
         easing: 'easeInOutBack',
         speed: 'slow',
         interval: 2000,
         height: 'auto',
         visible: 4,
         mousePause: 1,
         controls: {
             up: '.up',
             down: '.down',
             toggle: '.toggle',
             stopText: 'Stop !!!'
         }
     }).data('easyTicker');
     $(".arrow-right").bind("click", function (event) {
         event.preventDefault();
         $(".vid-list-container").stop().animate({
             scrollLeft: "+=336"
         }, 750);
     });
     $(".arrow-left").bind("click", function (event) {
         event.preventDefault();
         $(".vid-list-container").stop().animate({
             scrollLeft: "-=336"
         }, 750);
     });
       tjq('.revolution-slider').revolution(
       {
           dottedOverlay:"none",
           delay:7000,
           startwidth:1170,
           startheight:450,
           onHoverStop:"on",
           hideThumbs:10,
           fullWidth:"on",
           forceFullWidth:"on",
           navigationType:"none",
           shadow:0,
           spinner:"spinner4",
           hideTimerBar:"on",
       });

   });

     ( function() {

    var youtube = document.querySelectorAll( ".youtube" );

    for (var i = 0; i < youtube.length; i++) {

        var source = "https://img.youtube.com/vi/"+ youtube[i].dataset.embed +"/mqdefault.jpg";

        var image = new Image();
                image.src = source;
                image.addEventListener( "load", function() {
                    youtube[ i ].appendChild( image );
                }( i ) );

                youtube[i].addEventListener( "click", function() {

                    var iframe = document.createElement( "iframe" );

                            iframe.setAttribute( "id", "vid_frame" );
                            iframe.setAttribute( "frameborder", "0" );
                            iframe.setAttribute( "allowfullscreen", "" );
                            iframe.setAttribute( "src", "https://www.youtube.com/embed/"+ this.dataset.embed +"?rel=0&showinfo=0&autoplay=1" );
                            this.innerHTML = "";
                            this.appendChild( iframe );
                } );
    };

} )();
