const { solidity } = require("ethereum-waffle");
import { use, expect } from "chai";
import { ethers } from "hardhat";
import { Contract } from "ethers";

use(solidity);


describe("My Dapp", function () {
  let myContract: Contract;

  describe("YourContract", function () {
    it("Should deploy YourContract", async function () {
      const YourContract = await ethers.getContractFactory("YourContract");

      myContract = await YourContract.deploy();
    });

    describe("setPurpose()", function () {
      it("Should be able to set a new purpose", async function () {
        const newPurpose = "Test Purpose";

        await myContract.setPurpose(newPurpose);
        expect(await myContract.purpose()).to.equal(newPurpose);
      });
    });
  });
});
