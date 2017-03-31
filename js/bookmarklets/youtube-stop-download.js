
javascript:(
function(){
  ytplayer = document.getElementById('movie_player');
  if (ytplayer){
    ytplayer.stopVideo();
  }
  else{
    alert('Sorry! Could not find the player. Please make sure you use this bookmarklet only on YouTube.com - Techawakening.org')
  }
}
)();

javascript:(function(){ytplayer = document.getElementById('movie_player');if (ytplayer){ytplayer.stopVideo();}else{alert('Sorry! Could not find the player. Please make sure you use this bookmarklet only on YouTube.com - Techawakening.org')}})();
