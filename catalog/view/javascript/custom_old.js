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
     function init() {
     var vidDefer = document.getElementsByTagName('iframe');
     for (var i=0; i<vidDefer.length; i++) {
     if(vidDefer[i].getAttribute('data-src')) {
     vidDefer[i].setAttribute('src',vidDefer[i].getAttribute('data-src'));
     } } }
     window.onload = init;
