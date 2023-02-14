import 'package:dio/dio.dart';
import 'package:sheff_new/data/cart_item.dart';
import 'package:sheff_new/data/add_to_cart_response.dart';
import 'package:sheff_new/data/cart_response.dart';

abstract class ICartDataSource {
  Future<AddToCartResponse> add(int productId);

  Future<AddToCartResponse> changeCount(int cartItemId, int count);

  Future<void> delete(int cartItemId);

  Future<int> count();

  Future<CartResponse> getAll();
}

class CartRemoteDataSource implements ICartDataSource {
  final Dio httpClient;

  CartRemoteDataSource(this.httpClient);

  @override
  Future<AddToCartResponse> add(int productId) async {
    final response =
        await httpClient.post('cart/add', data: {"product_id": productId});

    return AddToCartResponse.fromJson(response.data);
    //   // TODO: implement add
    //   throw UnimplementedError();
  }

  @override
  Future<AddToCartResponse> changeCount(int cartItemId, int count) {
    // TODO: implement changeCount
    throw UnimplementedError();
  }

  @override
  Future<int> count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int cartItemId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<CartResponse> getAll() async{
   final response=await httpClient.get('cart_list');
   return CartResponse.fromJson(response.data);
  }

}
