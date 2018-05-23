pragma solidity ^0.4.20;


contract EcommerceStore {
    //enum - 열거형 open은 0, sold는 1, unsold는 2로 저장된다.
    enum ProductStatus { Open, Sold, Unsold}
    enum ProductCondition { New, Used}
    
    uint public productIndex;
    //매핑을 통해 누가 상품을 등록했는지 추적한다. 판매자의 계정주소
    //value는 productIndex와 Product구조체이다.
    mapping (address => mapping(uint => Product)) stores;
    
    //어떤 상품이 어떤 상인의 상점에 속하는지 추적하는 매핑 개체
    mapping (uint => address) productIdInStore;

    struct Product {
        uint id;
        string name;
        string category;
        string imageLink;
        string descLink;
        uint startPrice;
        uint auctionStartTime;
        uint auctioEndTime;
        address highestBidder;
        uint highestBid;
        uint secondHighestBid;
        uint totalBid;
        ProductStatus status;
        ProductCondition condition;
    }
    function addProductToStore(string _name, string _category, string _imageLink, string _descLink, uint _auctionStartTime,
    uint _auctionEndTime, uint _startPrice, ProductCondition _condition) public {
        require(_auctionStartTime < _auctionEndTime);
        productIndex += 1;
        Product memory product = Product(productIndex, _name, _category, _imageLink, _descLink, _auctionStartTime, _auctionEndTime,_startPrice,0,0,0,0, ProductStatus.Open, ProductCondition(_condition));
        stores[msg.sender][productIndex] = product;
        productIdInStore[productIndex] = msg.sender;
    }

    //1) 상품 정보를 가져오기 위해서 어떤 상품이 어떤 상인의 상점에 속해있는지 추적한다.
    //2) 
    function getProduct(uint _productId) view public returns (uint, string, string, string, string, uint, uint, uint, address, uint, uint, uint, ProductStatus, ProductCondition) {
      Product memory product = stores[pro
    }

    constructor() public {
    // constructor
        productIndex = 0;
    }
    

}
