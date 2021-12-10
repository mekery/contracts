// contracts/ERC20Token.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @dev Basic ERC20 Token
 * 
 * Customized {holder}, {name}, {symbol}, {decimals} and {initialSupply} of the Token.
 * {initialSupply} is the actual amount of token in terms of {decimal}.
 *
 * https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
 */
contract ERC20Token is ERC20 {
    uint8 immutable private _decimals;

    constructor(
        address holder_, 
        string memory name_, 
        string memory symbol_, 
        uint8 decimals_,
        uint256 initialSupply_
    ) ERC20(name_, symbol_) {
        _decimals = decimals_;

        uint256 initialSupply = initialSupply_ * 10 ** uint256(decimals_);
        _mint(holder_, initialSupply);
    }

    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }
}