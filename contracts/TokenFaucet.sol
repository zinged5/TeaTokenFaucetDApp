// TokenFaucet.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFaucet is Ownable {
    IERC20 public teaToken;

    event TokensClaimed(address indexed recipient, uint256 amount);

    constructor(address _teaTokenAddress, address _owner) Ownable(_owner) {
        teaToken = IERC20(_teaTokenAddress);
    }

    function claimTokens(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than 0");
        require(teaToken.balanceOf(address(this)) >= _amount, "Not enough tokens in the faucet");

        teaToken.transfer(msg.sender, _amount);

        emit TokensClaimed(msg.sender, _amount);
    }

    // Function to allow the owner to replenish the faucet with more tokens
    function replenishFaucet(uint256 _amount) external onlyOwner {
        require(_amount > 0, "Amount must be greater than 0");

        teaToken.transferFrom(msg.sender, address(this), _amount);
    }
}
