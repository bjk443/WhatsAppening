const takeOutInner = () => {
  const innerPhoto = document.querySelector(".upload-photo");
  if (innerPhoto) {
    innerPhoto.innerText = "";
  }
};

export { takeOutInner };
