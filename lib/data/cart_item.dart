import 'package:sheff_new/data/productTest.dart';

class CartItemEntity {
  final ProductEntity product;
  final int id;
  final int count;
  bool deleteItemLoading = false;

  CartItemEntity(this.product, this.id, this.count);

  CartItemEntity.fromJson(Map<String, dynamic> json)
      : product = ProductEntity.fromJson(json['product']),
        id = json['cart_item_id'],
        count = json['count'];

  static List<CartItemEntity> parseJsonArray(List<dynamic> jsonArray) {
    final List<CartItemEntity> cartItems = [];
    jsonArray.forEach((element) {
      cartItems.add(CartItemEntity.fromJson(element));
    });
    return cartItems;
  }
}
