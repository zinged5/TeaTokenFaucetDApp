const TokenFaucet = artifacts.require("TokenFaucet");

module.exports = function (deployer) {
  deployer.deploy(TokenFaucet, "<TEATOKEN_CONTRACT_ADDRESS>", "<OWNER_ADDRESS>");
};
