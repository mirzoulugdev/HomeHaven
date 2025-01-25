class CartItem {
  final String name;
  final double price;
  final double oldPrice;
  final int discount;
  final String color;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.color,
    required this.imageUrl,
    this.quantity = 1,
  });
}
