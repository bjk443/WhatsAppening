const initSoundCard = () => {
  const play = document.querySelector('.fa.fa-play')
  const pause = document.querySelector('.fa.fa-pause')
  const mySong = document.getElementById("mySong");
  const album = document.getElementById("album");
  if (album) {
    album.addEventListener("click", (event) => {
      if (mySong.paused) {
          pause.style.display = "";
          play.style.display = "none";
          mySong.play();
      } else {
          mySong.pause();
          pause.style.display = "none";
          play.style.display = "";
      }
    });
  }
}

export { initSoundCard };
