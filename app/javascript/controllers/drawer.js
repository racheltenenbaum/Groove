document.getElementById("showMapButton").addEventListener("click", () => {
  toggleDrawer(true);
});

document.getElementById("showListButton").addEventListener("click", () => {
  toggleDrawer(false);
});

function toggleDrawer(open) {
  const drawer = document.getElementById("drawer");
  if (open) {
    drawer.style.left = "0";
  } else {
    drawer.style.left = "-300px";
  }
}
