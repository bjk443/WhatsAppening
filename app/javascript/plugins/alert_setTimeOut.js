const alertTimeOut = () => {
  const alert = document.querySelector(".alert");
  setTimeout(() => {
    alert.classList.add("display_none");
  }, 3000);
};

export { alertTimeOut };
