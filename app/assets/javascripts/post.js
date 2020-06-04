'use strict';

{

  function update() {
    document.querySelector('h1').textContent = 'Changed!';

    const leftImage = document.querySelectorAll('.content__left--image');

    leftImage.forEach((p) => {
      p.style.backgroundColor = 'lightyellow';
    });
  
    leftImage.forEach((p, index) => {
      p.textContent = `${index}`;
    });
  
  }

  setTimeout(update, 1000);

  
  // document.getElementById('target').addEventListener('click', () => {
  //   document.getElementById('target').style.color = 'red';
  // });

  // ここまでJS実験用 index.html.haml #target
}
