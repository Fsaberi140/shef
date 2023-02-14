class AddToCartResponse {
  final int productId;
  final int cartItemId;
  final int count;

  AddToCartResponse(this.productId, this.cartItemId, this.count);

  AddToCartResponse.fromJson(Map<String, dynamic> json)
      : productId = json['product_Id'],
        cartItemId = json['cart_Item_id'],
        count = json['count'];
}
