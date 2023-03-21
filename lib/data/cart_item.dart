import 'package:sheff_new/data/productTest.dart';

class CartItemEntity {
  final ProductEntity product;
  final int id;
  int count;
  bool deleteItemLoading = false;
  bool changeCountLoading = false;

  CartItemEntity(this.product, this.id, this.count);

  CartItemEntity.fromJson(Map<String, dynamic> json)
      : product = ProductEntity.fromJson(json['product']),
        id = json['id'],
        count = json['count'];

  static List<CartItemEntity> parseJsonArray(List<dynamic> jsonArray) {
    final List<CartItemEntity> cartItems = [];
    jsonArray.forEach((element) {
      cartItems.add(CartItemEntity.fromJson(element));
    });
    return cartItems;
  }
}
