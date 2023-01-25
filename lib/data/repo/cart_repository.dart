import 'package:sheff_new/data/cart_item.dart';
import 'package:sheff_new/data/cart_response.dart';

abstract class ICartRepository{
Future <CartResponse> add(int productId);
Future <CartResponse> changeCount(int cartItemId, int count);
Future <void> delete(int cartItemId);
Future <int> count();
Future <List<CartItemEntity>> getAll();
}