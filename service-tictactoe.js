(function (namespace) {
  const moves = [
    { rule: 1, winner: [0, 1, 2] },
    { rule: 2, winner: [3, 4, 5] },
    { rule: 3, winner: [6, 7, 8] },
    { rule: 4, winner: [0, 3, 6] },
    { rule: 5, winner: [1, 4, 7] },
    { rule: 6, winner: [2, 5, 8] },
    { rule: 7, winner: [0, 4, 8] },
    { rule: 8, winner: [2, 4, 6] },
  ];

  namespace.getWinner = function (data) {
    let theWinner = moves.find((f) => {
      let [a, b, c] = f.winner;
      let status = data[a] == data[b] && data[b] == data[c] && data[a] != "N";
      return status;
    }) || { rule: 0, winner: [] };

    let winningCombo = theWinner.winner;
    let whoWon = data[theWinner.winner[0]];
    let isWinner = theWinner.rule;

    return { winningCombo, whoWon, isWinner };
  };
})((window.citytech = window.citytech || {}));
