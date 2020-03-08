var url = 'https://grantorrent.la/categoria/animacion/';

jQuery.get(url, data => {
  var posts = jQuery(data).find('.imagen-post');
  jQuery.each(posts, (id, post) => {
    try {
      var post_url = jQuery(post).find('a')[0].href;
      var post_title = jQuery(post).find('.bloque-inferior')[0].innerHTML.trim();
      var post_img = jQuery(post).find('a img')[0].src;
      
      jQuery.ajax({
        url: post_url,
        async: false,
        success: data => {
          var movie_date = jQuery(data).find('.datos-inicial .info-estreno span')[1].innerHTML.trim();
          console.log(post_title, movie_date);
        }
      });
    }
    catch(e) {}
  });
});

// -------------

(function() {
let start = 8;
let main_url = 'https://grantorrent.la/categoria/animacion/page/';
const delay = ms => new Promise(resolve => setTimeout(resolve, ms));
const wait_time = 100;

let promises = [];
for (let i = 0; i < 2; i++) {
  let url = main_url + (start+i);
  promises.push(jQuery.get(url));
  promises.push(delay(wait_time));
}

Promise.all(promises).then(results => {
  let post_urls = [];
  let promises2 = [];
  
  results.forEach((data, i) => {
    if (!data) return;
    let posts = jQuery(data).find('.imagen-post a').toArray();
    posts.forEach((x, i) => {
      post_urls.push(x.href);
      promises2.push(jQuery.get(x.href));
      promises2.push(delay(wait_time));
    });
  });
  console.log(post_urls);
  console.log('--promises2', promises2.length);
  
  Promise.all(promises2).then(results => {
    let movies = [];
    
    results.forEach(data => {
      if (data) {
        try {
          let movie_title = jQuery(data).find('.datos-inicial .info-estreno span')[0].innerHTML.trim();
          let movie_date = jQuery(data).find('.datos-inicial .info-estreno span')[1].innerHTML.trim();
          let movie_img = jQuery(data).find('.imagen-page img')[0].src;
          movie_title = movie_title.replace('Título original: ', '').replace(/\.$/, '');
          movie_date = movie_date.replace('Estreno: ', '').replace(/\.$/, '');
          
          movies.push({
            movie_title: movie_title,
            movie_date: movie_date,
            movie_img: movie_img,
          });
        } catch(e) {console.error(e)}
      }
    });
    
    console.log(movies);
  });
  
});
})()

// -------------
var movies = [];
console.log(movies);

(function() {
let url = 'https://grantorrent.la/categoria/animacion/page/2';

console.log('---' + url);
jQuery.get(url).then(data => {
  let promises = [];
  
  let posts = jQuery(data).find('.imagen-post a').toArray();
  posts.forEach((x, i) => {
    promises.push(jQuery.get(x.href));
  });
  
  Promise.all(promises).then(results => {
    results.forEach((data, i) => {
      if (data) {
        try {
          let movie_url = posts[i].href;
          let movie_title = jQuery(data).find('.datos-inicial .info-estreno span')[0].innerHTML.trim();
          let movie_date = jQuery(data).find('.datos-inicial .info-estreno span')[1].innerHTML.trim();
          let movie_img = jQuery(data).find('.imagen-page img')[0].src;
          movie_title = movie_title.replace('Título original: ', '').replace(/\.$/, '');
          movie_date = movie_date.replace('Estreno: ', '').replace(/\.$/, '');
          
          movies.push({
            movie_url: movie_url,
            movie_title: movie_title,
            movie_date: movie_date,
            movie_img: movie_img,
          });
        } catch(e) {}
      }
    });
    
    console.log('---end');
  });
  
});
})()


// <div class="imagen-post">
// <a href="https://grantorrent.la/ploey-nunca-volaras-solo/">
//   <img src="https://grantorrent.la/wp-content/uploads/2019/05/ploey_you_never_fly_alone-338054592-large.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="" srcset="https://grantorrent.la/wp-content/uploads/2019/05/ploey_you_never_fly_alone-338054592-large.jpg 150w, https://grantorrent.la/wp-content/uploads/2019/05/ploey_you_never_fly_alone-338054592-large-120x180.jpg 120w" sizes="(max-width: 150px) 100vw, 150px">
// </a>
// <div class="bloque-inferior">
//   Ploey: Nunca Volarás Solo
// </div>
// <div class="bloque-date"> 22/05/2019</div>
// </div>


// <div class="imagen-page">
//   <img src="https://grantorrent.la/wp-content/uploads/2019/05/ploey_you_never_fly_alone-338054592-large.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="" srcset="https://grantorrent.la/wp-content/uploads/2019/05/ploey_you_never_fly_alone-338054592-large.jpg 150w, https://grantorrent.la/wp-content/uploads/2019/05/ploey_you_never_fly_alone-338054592-large-120x180.jpg 120w" sizes="(max-width: 150px) 100vw, 150px">
// </div>

// <div class="datos-inicial">
// <div class="info-estreno">
// <span class="bold">Título original: Ploey: Nunca Volarás Solo.</span>
// </div>
// <div class="info-estreno">
// <span class="bold">Estreno: 2018. </span></div>
// </div>
