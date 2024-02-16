class Orders {
  String orderId;
  String itemName;
  int itemPrice;
  int coinsReq;
  int quantityLeft;
  String imageUrl;

  Orders({
    required this.orderId,
    required this.itemName,
    required this.itemPrice,
    required this.coinsReq,
    required this.quantityLeft,
    required this.imageUrl,
  });

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      orderId: map['orderId'],
      itemPrice: map['itemPrice'],
      itemName: map['itemName'],
      coinsReq: map['coinsReq'],
      quantityLeft: map['quantityLeft'],
      imageUrl: map['image_url'],
    );
  }
}
