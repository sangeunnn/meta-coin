contract VendingMachine {
    event Purchase(address indexed purchaser, uint256 amount);

    address public owner;
    mapping(address => uint) public cupcakeBalances;

    constructor() {
        owner = msg.sender;
        cupcakeBalances[address(this)] = 100;
    }

    function refill(uint amount) public {
        require(msg.sender == owner, "Only the owner can refill.");
        cupcakeBalances[address(this)] += amount;
    }

    function purchase(uint amount) public payable {
        require(
            msg.value >= amount * 1 ether,
            "You must pay at least 1 ETH per cupcake"
        );
        require(
            cupcakeBalances[address(this)] >= amount,
            "Not enough cupcakes in stock to complete this purchase"
        );
        cupcakeBalances[address(this)] -= amount;
        cupcakeBalances[msg.sender] += amount;
        emit Purchase(msg.sender, amount);
    }
}
