const liveBtn = () => {
  const message_area = document.querySelector(".message-area");
  const btn = document.querySelector(".btn-show");
  // console.log(venueId);
  if (btn) {
    const venueId = btn.dataset.venue;
    if (localStorage[`hideLiveButton-${venueId}`]) {
      btn.classList.add("display_none");
      const now = new Date().getTime();
      const hiddenAt = JSON.parse(localStorage[`hideLiveButton-${venueId}`]);
      const timePast = (now - hiddenAt.hiddenAt) / 60000;

      // console.log(timePast);
      if (timePast > 100) {
        btn.classList.remove("display_none");
        message_area.classList.add("display_none");
        btn.addEventListener("click", () => {
          const hideLiveButton = { hiddenAt: new Date().getTime() };
          localStorage.setItem(
            `hideLiveButton-${venueId}`,
            JSON.stringify(hideLiveButton)
          );
          message_area.classList.remove("display_none");
          btn.classList.add("display_none");
        });
      }
    } else {
      message_area.classList.add("display_none");
      btn.addEventListener("click", () => {
        const hideLiveButton = { hiddenAt: new Date().getTime() };
        localStorage.setItem(
          `hideLiveButton-${venueId}`,
          JSON.stringify(hideLiveButton)
        );
        message_area.classList.remove("display_none");
        btn.classList.add("display_none");
        // setTimeout(function(), 5000);
      });
    }
  }
};

export { liveBtn };
