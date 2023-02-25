// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Contract for the Lux Token
contract LuxToken is ERC20, ERC20Burnable, Ownable, ERC20Permit, ERC20Votes {
constructor() ERC20("Lux Token", "LUX") ERC20Permit("Lux Token") {}

function _afterTokenTransfer(address from, address to, uint256 amount) internal override(ERC20, ERC20Votes) {}

function _burn(address account, uint256 amount) internal virtual override(ERC20, ERC20Votes) {
    super._burn(account, amount);
}

function _mint(address account, uint256 amount) internal virtual override(ERC20, ERC20Votes) {
    super._mint(account, amount);
}
}