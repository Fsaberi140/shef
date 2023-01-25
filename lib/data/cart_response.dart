class CartResponse {
  final int productId;
  final int cartItemId;
  final int count;

  CartResponse(this.productId, this.cartItemId, this.count);

  CartResponse.fromJson(Map<String, dynamic> json)
      : productId = json['product_Id'],
        cartItemId = json['cart_Item_id'],
        count = json['count'];
}
