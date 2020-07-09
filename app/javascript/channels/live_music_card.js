fetch("https://api.deezer.com/playlist/908622995")
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  });
