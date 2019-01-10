document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

const handleFavAdd = (e) => {
  e.preventDefault();

  const favInput = document.querySelector(".favorite-input");
  const input = favInput.value; 
  favInput.value = ""; 

  const newLi = document.createElement("li");
  newLi.textContent = input;

  const favList = document.querySelector("#sf-places");
  favList.appendChild(newLi);
};

const favBtn = document.querySelector(".favorite-submit");
favBtn.addEventListener("click", handleFavAdd);



  // adding new photos

  // --- your code here!



});
