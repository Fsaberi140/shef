import 'package:flutter/cupertino.dart';
import 'package:sheff_new/data/add_to_cart_response.dart';
import 'package:sheff_new/data/cart_response.dart';
import '../../common/http_client.dart';
import '../source/cart_data_source.dart';

final cartRepository = CartRepository(CartRemoteDataSource(httpClient));

abstract class ICartRepository extends ICartDataSource {}

class CartRepository implements ICartRepository {
  final ICartDataSource dataSource;
  static ValueNotifier<int> cartItemCountNotifier = ValueNotifier(0);

  CartRepository(this.dataSource);

  @override
  Future<AddToCartResponse> add(int productId) {
    return dataSource.add(productId);
  }

  @override
  Future<AddToCartResponse> changeCount(int cartItemId, int count) {
    return dataSource.changeCount(cartItemId, count);
  }

  @override
  Future<int> count() async {
    final count = await dataSource.count();
    cartItemCountNotifier.value=count;
    return count;
  }

  @override
  Future<void> delete(int cartItemId) {
    return dataSource.delete(cartItemId);
  }

  @override
  Future<CartResponse> getAll() {
    return dataSource.getAll();
  }
}
