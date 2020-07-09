const liveBtn = () => {
  const message_area = document.querySelector(".message-area");
  const btn = document.querySelector(".btn-show");

  message_area.classList.add("display_none");

  btn.addEventListener("click", () => {
    message_area.classList.remove("display_none");
    btn.classList.add("display_none")
  });
};


export { liveBtn };
