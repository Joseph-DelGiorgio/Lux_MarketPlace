// Contract for a luxury item

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./luxToken.sol";

contract LuxuryItem is ERC721, Ownable {
string private _name;
string private _description;
string private _image;
uint256 private _price;
uint private _tokenID;
LuxToken private _luxToken;


constructor(string memory name_, string memory description_, string memory image_, uint256 price_, address luxTokenAddress) ERC721(name_, "LUXURY") {
    _name = name_;
    _description = description_;
    _image = image_;
    _price = price_;
    _luxToken = LuxToken(luxTokenAddress);
}

function buyLuxuryItem() public payable {
    uint256 amount = _price * 10**18; // Convert to wei
    require(_luxToken.balanceOf(msg.sender) >= amount, "Not enough LUX tokens");
    require(_luxToken.transferFrom(msg.sender, owner(), amount), "LUX token transfer failed");
    _safeMint(msg.sender, _tokenID++);
}

function name() public view virtual override returns (string memory) {
    return _name;
}

function description() public view returns (string memory) {
    return _description;
}

function image() public view returns (string memory) {
    return _image;
}

function price() public view returns (uint256) {
    return _price;
}
}


