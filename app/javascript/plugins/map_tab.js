const mapTab = (map) =>{
  const mapTabLink = document.querySelector("#map-tab")

  if (mapTabLink){
    mapTabLink.addEventListener("click", ()=> {
      setTimeout(()=>{
        map.resize()
      },300)
    })
  }
}

export { mapTab };
