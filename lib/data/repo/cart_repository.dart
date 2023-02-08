import 'package:sheff_new/data/banner.dart';
import 'package:sheff_new/data/cart_item.dart';
import 'package:sheff_new/data/cart_response.dart';
import '../../common/http_client.dart';
import '../source/cart_data_source.dart';

final cartRepository = CartRepository(CartRemoteDataSource(httpClient));

abstract class ICartRepository extends ICartDataSource {}

class CartRepository implements ICartRepository {
  final ICartDataSource dataSource;

  CartRepository(this.dataSource);

  @override
  Future<CartResponse> add(int productId) {
    return dataSource.add(productId);
  }

  @override
  Future<CartResponse> changeCount(int cartItemId, int count) {
  return dataSource.changeCount(cartItemId, count);
  }

  @override
  Future<int> count() {
   return dataSource.count();
  }

  @override
  Future<void> delete(int cartItemId) {
return dataSource.delete(cartItemId);
  }

  @override
  Future<List<CartItemEntity>> getAll() {
return dataSource.getAll();
  }
}
