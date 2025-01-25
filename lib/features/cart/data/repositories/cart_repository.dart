import 'package:home_haven/features/cart/data/models/cart_item.dart';

class CartRepository {
  static List<CartItem> cartItems = [
    CartItem(
      name: "EKERO",
      price: 230.00,
      oldPrice: 512.58,
      discount: 45,
      color: "Yellow",
      imageUrl: "assets/images/chair.png",
    ),
    CartItem(
      name: "EKERO Chair",
      price: 230.00,
      oldPrice: 512.58,
      discount: 45,
      color: "Yellow",
      imageUrl: "assets/images/chair1.png",
    ),
    CartItem(
      name: "LACK Table",
      price: 45.00,
      oldPrice: 79.99,
      discount: 43,
      color: "Black",
      imageUrl: "assets/images/table.png",
    ),
    CartItem(
      name: "BILLY Bookcase",
      price: 65.00,
      oldPrice: 99.99,
      discount: 35,
      color: "White",
      imageUrl: "assets/images/chair.png",
    ),
    CartItem(
      name: "MALM Bed Frame",
      price: 320.00,
      oldPrice: 450.00,
      discount: 29,
      color: "Oak",
      imageUrl: "assets/images/bed.png",
    ),
    CartItem(
      name: "POÄNG Armchair",
      price: 150.00,
      oldPrice: 200.00,
      discount: 25,
      color: "Beige",
      imageUrl: "assets/images/armchair.png",
    ),
  ];
}
