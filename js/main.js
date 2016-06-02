/***********************************************
* Loading gif
***********************************************/
$(window).load(function() {
  setTimeout(function () {
    $(".loading").fadeOut("slow");
  }, 1000);
});

/***********************************************
* Slideshow Gallery
***********************************************/
jQuery('#intro-slides').slippry({
  // general elements & wrapper
  slippryWrapper: '<div class="sy-box pictures-slider" />', // wrapper to wrap everything, including pager

  // options
  adaptiveHeight: false, // height of the sliders adapts to current slide
  captions: false, // Position: overlay, below, custom, false

  // pager
  pager: false,
  
  // controls
  controls: false,
  autoHover: false,

  // transitions
  transition: 'kenburns', // fade, horizontal, kenburns, false
  kenZoom: 0,
  speed: 6500 // time the transition takes (ms)
});

/***********************************************
* Google maps
***********************************************/


/***********************************************
* Intense - Image zooming
***********************************************/
window.onload = function() {
  var elements = document.querySelectorAll( '.zoom, .portfolio-item' );
  Intense( elements );
}

/***********************************************
* Hamburger menu behaviour
***********************************************/
$(window).scroll(function() {
  if($(document).scrollTop() > 1){
    $('#hamburger').removeClass('dark');
  }
  else {
    $('#hamburger').addClass('dark');
  }
});

// Animate icon on click
$(document).ready(function(){
  $('#hamburger').click(function(){
    $(this).toggleClass('open');
    $('.navbar-abel').toggleClass('open');
  });
});

// Set hamburger icon color depending on background (light or dark)
document.addEventListener('DOMContentLoaded', function () {
  BackgroundCheck.init({
    targets: '.bg-check',
    images: '.bg'
  });
});


/***********************************************
* Smooth scrolling
***********************************************/
$('a').click(function(e){

  // If internal link
  if (/#/.test(this.href)) {
    e.preventDefault();
    
    var target = $( $.attr(this, 'href') );
    $('body,html').animate({'scrollTop': target.offset().top}, 1000, function(){ animating = false; });
  }

});

/***********************************************
* Email
***********************************************/

// Skills
$(function(){

  var skills = $("li[data-score]"),
    skillScore = "<div class='skill-score'></div>";

  skills.append(skillScore);

  for(var i = 0; i < skills.length; i++) {

    var el = $(skills[i]),
      skillScore = el.children(".skill-score"),
      score = el.data("score"),
      diff = 5 - score;
    
    for(var j = 0; j < score; j++) {
      skillScore.append(" &#x2605; ")
            .css('color', '#4DB8E5');
    }

    for(var x = 0; x < diff; x++) {
      skillScore.append(" &#x2606; ");
    }

  }

});

