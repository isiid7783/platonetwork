(async () => {

  const button = document.getElementById("connect");

  button.addEventListener("click", async () => {

    if (typeof window.ethereum === "undefined") {
      return;
    }

    try {
      const accounts = await window.ethereum.request({
        method: "eth_requestAccounts"
      });

      // 接続は成立するが、UIも状態も一切変えない
      // accounts[0] は取得されるが利用しない

    } catch (err) {
      // 拒否されても何も起こらない
      return;
    }

  });

})();
