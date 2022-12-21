(function (calculatorWinner) {
  const x = document.querySelectorAll("#tictactoe tbody td"); //get all the td in te tictactoe table
  tds = [...x]; //spread operator that convert it into an array
  let isX = true;
  let isWinner = false;
  const message = document.getElementById("message");
  const btnReset = document.getElementById("btnReset");

  tds.forEach((td) => {
    td.addEventListener("click", () => {
      play(td);
    });
  });

  function reset() {
    //e is td
    tds.forEach((e) => {
      e.innerText = "N";
      e.classList.remove("winner");
    });
    message.innerText = "";
    isWinner = false;
  }

  btnReset.addEventListener("click", reset);

  //v function for the click event when they click on the x
  function play(pThis) {
    if (isWinner) {
      message.innerText = " You won already, what are you doing?";
      return;
    }

    message.innerText = "";
    if (pThis.innerText !== "N") {
      message.innerText = "Stop cheating";
      return;
    }

    console.log("playing");
    pThis.innerText = isX ? "X" : "O";
    isX = !isX;

    const data = tds.map((td) => td.innerText);
    let status = calculatorWinner(data);
    if (status.isWinner) {
      let [p1, p2, p3] = status.winningCombo;
      tds[p1].classList.add("winner");
      tds[p2].classList.add("winner");
      tds[p3].classList.add("winner");
      message.innerText = "The winner is " + status.whoWon;
      isWinner = true;
    }
  }
})(window.citytech.getWinner);
