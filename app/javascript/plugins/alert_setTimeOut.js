const alertTimeOut = () => {
  const alert = document.querySelector(".alert");
  const btn = document.querySelector(".btn-show");
  if (btn) {
    const venueId = btn.dataset.venue;

    if (localStorage[`hideLiveButton-${venueId}`]) {
      const now = new Date().getTime();
      const later = JSON.parse(localStorage[`hideLiveButton-${venueId}`]);
      const timePast = (now - later.hiddenAt) / 60000;
      console.log(timePast);
      if (timePast === 0.2 || timePast < 99) {
        alert.classList.add("display_none");
      } else if (timePast > 100) {
        alert.classList.remove("display_none");
      }
    }
  }
};

export { alertTimeOut };

// if (localStorage[`hideLiveButton-${venueId}`]) {
//    alert.classList.add("display_none");
//    const now = new Date().getTime();
//    const hiddenAt = JSON.parse(localStorage[`hideLiveButton-${venueId}`]);
//    const timePast = (now - hiddenAt.hiddenAt) / 60000;

//    console.log(timePast);
//    if (timePast > 0.3) {
//      alert.classList.remove("display_none");
//      btn.addEventListener("click", () => {
//        const hideLiveButton = { hiddenAt: new Date().getTime() };
//        localStorage.setItem(
//          `hideLiveButton-${venueId}`,
//          JSON.stringify(hideLiveButton)
//        );
//        alert.classList.add("display_none");
//      });
//    }

// setTimeout(() => {
//   alert.classList.add("display_none");
// }, 3000);
